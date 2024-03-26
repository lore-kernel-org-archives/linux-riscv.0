Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6597C54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 05:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tsJ13nVv1qlfZL78OR18BWPi9ZVteTAZmiqsf+fFuHU=; b=W7eXyz94pg9HfR
	m/L83nfacu/JpRFD7Pnbr4dE/xs/fHabraMtfvo1E5SJ7Rp8kUqTvvUXnSbtYh4AOrdftCw9vjPfs
	SHkuxlu/fSB7AN03eEs9Yf0ytpgQBUMtg2p/mvGgS3fojACkh0qlQlQ6oXSuUhwlqgIG/K/dIQoHp
	vnOuPqeD+OuawSQ+ha0dFkk4BsWqswblryjRGyxiTXaNldZqSU7eym8DkTXwgHQsy98jNNTJu5ebJ
	k0jYbkoVAs8IbU1UkbTYrwMxi2HrMod6ps15zE6RmGpsIxV6gnRFMTz0gvuGMQbo8I04jCdY4/G5G
	cQOQmYIxlC//qvcOBfYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rozl1-00000003BVK-3oOH;
	Tue, 26 Mar 2024 05:53:59 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rozky-00000003BUp-3YLH
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 05:53:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2307ACE1C97;
	Tue, 26 Mar 2024 05:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C428C433C7;
	Tue, 26 Mar 2024 05:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711432432;
	bh=p1h/3bDBMeEKRt9AkpnulPRNIkXpjpAoN4qqivDNeo4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ELTGzE3PynLd7uPVfz8E5W0K3gyQzaLC48bKjSGt4LH6a1TaQ32gglVChyRIr9cZV
	 MGIBs/QmaL/2l6RWW6Ma+QaRex3qjpZfWpmOKLgQnUFod30tlNQizPVB563XxzArDd
	 iSMuny8WI2Kp6ajUZl56OnraUYxIfPJ3DvEpUw0pYXx/KNh4p+G0ZlSxd9qCYVTiEN
	 O34oOfWdPvqyGxOCw5j0tBBFFN7kJn5eU48vzRFIFVd+g3PTph5a676jx9dIFMWJRY
	 jMnv/Wmk8ZWQvQflZ301Na7ELVcQXXvqTw5S9LtdUhF5tBJ8kG+wxQ8kYx+rBK1Afh
	 yef08gMFu2/yQ==
Message-ID: <4acb96b2-949d-4f08-99c6-08bb30ead928@kernel.org>
Date: Tue, 26 Mar 2024 14:53:49 +0900
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
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240326032037.2478816-1-sorear@fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_225357_133694_F68D3C25 
X-CRM114-Status: GOOD (  18.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/26/24 12:20, Stefan O'Rear wrote:
> Commit 04d82a6d0881 ("binfmt_flat: allow not offsetting data start")
> introduced a RISC-V specific variant of the FLAT format which does not
> allocate any space for the (obsolescent) array of shared library
> pointers. However, it did not disable the code which initializes the
> array, resulting in the corruption of sizeof(long) bytes before the DATA
> segment, generally the end of the TEXT segment.
> 
> Use CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET to guard initialization the

s/initialization the/the initialization of the

> shared library pointer region so that it will only be initialized if
> space is reserved for it.
> 
> Fixes: 04d82a6d0881 ("binfmt_flat: allow not offsetting data start")
> Signed-off-by: Stefan O'Rear <sorear@fastmail.com>
> Tested-by: Waldemar Brodkorb <wbx@openadk.org>

It feels like CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET is not a very good name...
Maybe something like CONFIG_BINFMT_FLAT_NO_SHARED_LIBRARY would be better. But
renaming can be done in a followup patch.

Reviewed-by: Damien Le Moal <dlemoal

> ---
>  fs/binfmt_flat.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
> index c26545d71d39..70c2b68988f4 100644
> --- a/fs/binfmt_flat.c
> +++ b/fs/binfmt_flat.c
> @@ -879,6 +879,7 @@ static int load_flat_binary(struct linux_binprm *bprm)
>  	if (res < 0)
>  		return res;
>  
> +#ifndef CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET
>  	/* Update data segment pointers for all libraries */
>  	for (i = 0; i < MAX_SHARED_LIBS; i++) {
>  		if (!libinfo.lib_list[i].loaded)
> @@ -893,6 +894,7 @@ static int load_flat_binary(struct linux_binprm *bprm)
>  				return -EFAULT;
>  		}
>  	}
> +#endif
>  
>  	set_binfmt(&flat_format);
>  

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
