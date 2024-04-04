Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65696CD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 07:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4EiWJc3NHnN5DRZG9YGLdjOrGnpFVxJEf7AWofEbKIU=; b=IxvtAUmvMs7Nr6
	n89mECnaPnOgNKf26S1wi4bOnO16oX+M90NdkVnr3VzmUOVZ26PqaoUmqq34Up6aGlvRyRpT2Kr8s
	wzSxG8PS8Sizx8JVrweXcQLL7zkG55XedQWYMNDIxz4ATR9C4EEr0kCLKtxD1qEPAMH8+IBXRmWnP
	JOo0LZGF9ymSzV3vdMplNMWfxNzwi3BquhCmT6Xf/lpEX2iYp/PozP7YAJVbY+bdSUrCMkAwcA4oe
	ZZSQL8CS115plqHut1SkKTg/2GCsfNzhHV7xymLsq0d+XKz6ESpDy/tWedIpwAHbGytRURqGAoRuh
	f4Vdofk5FAcVD2YbI9Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsHi9-00000001fwc-3SFM;
	Thu, 04 Apr 2024 07:40:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsHi6-00000001fvc-1X7f
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 07:40:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F0D2D61218;
	Thu,  4 Apr 2024 07:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7D7C433F1;
	Thu,  4 Apr 2024 07:40:30 +0000 (UTC)
Message-ID: <edb65612-3772-485a-b04f-28d2a453f3b3@linux-m68k.org>
Date: Thu, 4 Apr 2024 17:40:28 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] binfmt_flat: Fix corruption when not offsetting data
 start
Content-Language: en-US
To: Stefan O'Rear <sorear@fastmail.com>, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org
Cc: Eric Biederman <ebiederm@xmission.com>, Kees Cook
 <keescook@chromium.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Waldemar Brodkorb <wbx@openadk.org>
References: <20240326032037.2478816-1-sorear@fastmail.com>
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20240326032037.2478816-1-sorear@fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_004034_591390_AEC15298 
X-CRM114-Status: GOOD (  18.28  )
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

On 26/3/24 13:20, Stefan O'Rear wrote:
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
                         ^^^^^^^^^^^^^^^

It may be cleaner (ie no # conditional required) if this was changed to
DATA_START_OFFSET_WORDS. So becoming:

         for (i = 0; i < DATA_START_OFFSET_WORDS; i++) {

My only concern is does this make it less clear what the code is doing?

Regards
Greg


>   		if (!libinfo.lib_list[i].loaded)
> @@ -893,6 +894,7 @@ static int load_flat_binary(struct linux_binprm *bprm)
>   				return -EFAULT;
>   		}
>   	}
> +#endif
>   
>   	set_binfmt(&flat_format);
>   

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
