Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A15C19F4E
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 21:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IoSmEKjVPygREOks4BOVprZPb9UxOK1KSAA25YNg7os=; b=VeLhbad4LawIhp
	04Ua8DW6hx3NYKbeXJhsd4j4ZYu40OJPESUqC9g+m1ZMZgh28vxK+aWvQXs5xXCu5XNBZlI6RvYdd
	jqEWIt3wmdrc8h92n2x3vcxijor2L3oIwzvmTdm+AsSahBKPICnVEFRAHcWKi93ZD0R0P4iQytDEq
	+JWltarSEPo8u4V1U/UOkaifoSY2i6Exc5TzwYznwKqD103R09fIgfcLWDPZpOZrjYZHXvMUpi7Ij
	LULry6jwcEFrMXR+iXXlZxAWV8dKCaUYorC/Ao4oV06HpLRwdgj19s9VwnaONQg3VS+n3cHq6rMdA
	LZxG/oHwWyEiGf8D7oeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzkRT-000000068eo-3wAr;
	Wed, 24 Apr 2024 21:46:15 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzjTp-00000005zEy-2yHD
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 20:44:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 88D431BF205;
	Wed, 24 Apr 2024 20:44:32 +0000 (UTC)
Message-ID: <3659aee7-8baf-442f-aa81-22bb6fd1a11d@ghiti.fr>
Date: Wed, 24 Apr 2024 22:44:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] binfmt_flat: Fix corruption when not offsetting data
 start
Content-Language: en-US
To: Stefan O'Rear <sorear@fastmail.com>, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org
Cc: Eric Biederman <ebiederm@xmission.com>, Kees Cook
 <keescook@chromium.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Greg Ungerer <gerg@linux-m68k.org>, Waldemar Brodkorb <wbx@openadk.org>
References: <20240326032037.2478816-1-sorear@fastmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240326032037.2478816-1-sorear@fastmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_134437_925776_72BD5F1C 
X-CRM114-Status: GOOD (  18.34  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Stefan,

On 26/03/2024 04:20, Stefan O'Rear wrote:
> Commit 04d82a6d0881 ("binfmt_flat: allow not offsetting data start")
> introduced a RISC-V specific variant of the FLAT format which does not
> allocate any space for the (obsolescent) array of shared library
> pointers. However, it did not disable the code which initializes the
> array, resulting in the corruption of sizeof(long) bytes before the DATA
> segment, generally the end of the TEXT segment.
>
> Use CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET to guard initialization the
> shared library pointer region so that it will only be initialized if
> space is reserved for it.
>
> Fixes: 04d82a6d0881 ("binfmt_flat: allow not offsetting data start")
> Signed-off-by: Stefan O'Rear <sorear@fastmail.com>
> Tested-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>   fs/binfmt_flat.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
> index c26545d71d39..70c2b68988f4 100644
> --- a/fs/binfmt_flat.c
> +++ b/fs/binfmt_flat.c
> @@ -879,6 +879,7 @@ static int load_flat_binary(struct linux_binprm *bprm)
>   	if (res < 0)
>   		return res;
>   
> +#ifndef CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET
>   	/* Update data segment pointers for all libraries */
>   	for (i = 0; i < MAX_SHARED_LIBS; i++) {
>   		if (!libinfo.lib_list[i].loaded)
> @@ -893,6 +894,7 @@ static int load_flat_binary(struct linux_binprm *bprm)
>   				return -EFAULT;
>   		}
>   	}
> +#endif
>   
>   	set_binfmt(&flat_format);
>   

I have this fix on my list for quite some time, will you respin a new 
version for 6.9?

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
