Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A18606A31E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 03:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gMIjytM+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rv+CKdzO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TOCYB8hUQMN3NoV5K4yxDtJEIFCKnToegQb1QDUFiU4=; b=gMIjytM+SoRhtvFa6Z40BsQ6DU
	1N8rTI/D5eG2HhtXouW83VPXeMvMaJ7HCG99MC9ywoEud734hiNKZcxpOJiNDMMdymPBEFBnlsZC/
	GK/Odv3M545Ovqn9wMsRi4kn0zJOIUdLTLCDsdNzQwyOI+SdGZ1kkayXHn/KcAroHXP4qxQOnU606
	Mf2ILDDIEvk9ae+eG2sS9F+YPwJuGEQ6OIrRiG29/h4jfCyv+1B+btJLnBYdSL/GqfS7jgPb2CJmp
	mh8RmQXrtxuduA5CkY5Tw/Ozh8h8s3BHh+7qQlAL33wZ8KcQf0RQqx8QcrANYY9ktrysaGdn8l+/R
	YDZTLO/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW424-00000008LyP-3I6X;
	Wed, 25 Nov 2026 03:50:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW423-00000008LyJ-0pgk
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 03:50:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8EC1A44717;
	Wed, 25 Nov 2026 03:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB481F000C4;
	Wed, 25 Nov 2026 03:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795578654;
	bh=WEKhbJUkbM0WYWSf7920uNUMWUxgqj443q2LzRm9f7s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Rv+CKdzOyYG2YCS+OzbHxqABnTY9JEYrtO/mGa6r0ZfwFOEn9QzfAxAr4x8BwwFJC
	 wmXO6bFffoxiD/ssfSVBk7TjrWsoacaB3DKwv6rBjjQOhj4pB2B7UD1B+4gHCcWi+h
	 whnvLeBi1UWX7DcVAYCM9KNRqAKCngtg2Yo07loHvwwqQAdSjEq0MyOh/YvEmMLwkZ
	 ZJTzJy114+mR3XHR2mP+afIaOLzgw2wESaMfKQf2pvpYGYYUvIEEM8h9CMZUUC3C6+
	 qesZZ+ucKQwlRJkTZHCgyjm07BoOddrUoE8J3JCiFDCAYxbGqKvss3DJoCXF3rkTTU
	 9hCkeJ7ZULKbQ==
Date: Tue, 24 Nov 2026 20:50:52 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Nutty Liu <liujingqi@lanxincomputing.com>, 
    Junhui Liu <junhui.liu@pigmoral.tech>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: pi: validate early FDT string properties before
 string use
In-Reply-To: <20260403005904.8904D166EA5F@hppdeMacBook-Pro.local>
Message-ID: <36ac8dd9-aaea-ade9-cdd6-dcd470771633@kernel.org>
References: <20260403005904.8904D166EA5F@hppdeMacBook-Pro.local>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 3 Apr 2026, Pengpeng Hou wrote:

> The early RISC-V FDT parser reads status, riscv,isa, and mmu-type
> directly from the DTB and then passes them to strcmp() or
> isa_string_contains(), which in turn uses strlen() and other C string
> helpers. DT string properties come from external firmware input and are
> not locally proven to be NUL-terminated within the property bounds.
> 
> Use fdt_stringlist_get() before treating these properties as C strings
> so malformed unterminated properties are rejected instead of being read
> past their declared length.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  arch/riscv/kernel/pi/fdt_early.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/kernel/pi/fdt_early.c b/arch/riscv/kernel/pi/fdt_early.c
> index a12ff8090f19..a44afd460d70 100644
> --- a/arch/riscv/kernel/pi/fdt_early.c
> +++ b/arch/riscv/kernel/pi/fdt_early.c
> @@ -38,16 +38,13 @@ u64 get_kaslr_seed(uintptr_t dtb_pa)
>  static bool fdt_device_is_available(const void *fdt, int node)
>  {
>  	const char *status;
> -	int statlen;
>  
> -	status = fdt_getprop(fdt, node, "status", &statlen);
> +	status = fdt_stringlist_get(fdt, node, "status", 0, NULL);
>  	if (!status)
>  		return true;

Sashiko points out that fdt_stringlist_get() can return NULL not just 
when the property is missing, but also when the property is empty or not 
NULL-terminated.  Those cases will now all be treated the same way.
This seems to conflict somewhat with the apparent intention of the patch?

> @@ -210,7 +207,7 @@ u64 set_satp_mode_from_fdt(uintptr_t dtb_pa)
>  		if (!fdt_device_is_available(fdt, node))
>  			continue;
>  
> -		mmu_type = fdt_getprop(fdt, node, "mmu-type", NULL);
> +		mmu_type = fdt_stringlist_get(fdt, node, "mmu-type", 0, NULL);
>  		if (!mmu_type)
>  			break;

And again here.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
