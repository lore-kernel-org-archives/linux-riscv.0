Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E15C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Feb 2022 14:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CCGopYv37QPPIvDnsnx+cPTXr7ibRj8A6GcO798TqlQ=; b=AiHwybDZ3/jtgy
	WJ93Fo/xfWveDbISjydHUPy8vBjXi23OQSeZgNwB39yjBilH376fJVeNCCZV/SkKT5EiuJhz+VQW5
	MeGMC4bcG4GC+T1tNLJmknurUH14gNyxAiL00s3yZ2VrAL02Ow5hkfVwLVTV8PfFK/xuNjSYCI3Yl
	QnQRqvWrxs7HeSvFm+FccTum3oaJgKAbtweH4W8QcPdcG1YQP0kJkvC0nHibwZ+f8Xth5lG8NiPS0
	P58Vl+J2EPzPfVlcxz7vSx1gAh5VeVvfkMuqaxcSea2HtBP5uSOlgIOv7Dh1HUe+Cp7GFyx0myxEq
	7E/+ssRbqgc/akKGWNcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM9pR-006H59-UB; Mon, 21 Feb 2022 14:38:17 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM9pJ-006H0p-Oz
 for linux-riscv@lists.infradead.org; Mon, 21 Feb 2022 14:38:16 +0000
Received: by mail-qk1-x735.google.com with SMTP id f10so12770366qkg.9
 for <linux-riscv@lists.infradead.org>; Mon, 21 Feb 2022 06:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SQkkpjsX6TpHTIkwX4rlheMVKzlTSUCBOIkGIhUmEnk=;
 b=lFloJT5XTRR77kzfHXTKnbI4pb8ZRFszg5NJtpODh2xdLUe/I00E73ECSqJvCocxE2
 b91NgLxHbLq2mKguKL6+A8vg59eCEqgoc3DveKrETnDLj1w3kQOwUnqmAyyMEzwuyF++
 1oz4fM9tYT3W1pjPYzepabrJTciPcMKBtMn9aK5T3gg7gaxtxK3qGRDfcii8PSRqH1m5
 jTfcfIxVWzqsyre+F9ScBo3PJyTGXXcumCcPycf5oTgrENXqutdnUW36PETYhvnU0X6i
 kE5fYBI0/0sqdCVOLbEJmColObNXJPYvXf2JzQQK0cwu9DtCZ/5LkSqn+45P9FbV6RjB
 gqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SQkkpjsX6TpHTIkwX4rlheMVKzlTSUCBOIkGIhUmEnk=;
 b=H8FnHp8yXsS+7LbCEgxgmBex67H1is/bu+jy+Hc55u4Ae0j1Cg8GmmdoQZ3bprnnPj
 5K5xjIfFXuY4jRVopcyxuLOpBRCtGrwdhUEATKxoKFJpGo7mcmsgJljcGZtabJrl7eUG
 HxjiG6GR1FD3WhNCVJCU+uhq6WL9HMYPXkIyZldv9NSq88smtmMbhBqgQUY5AUUqFTJl
 SIIZN/g5MLWUEpD5jbQ1RzHLqcfihvfnDoklsCY+UMPUCXWTrLKbViDV4qN72XubU4Ou
 cpWNMX/QBKQnxSIKE/VU2p/YsBxWjPhC0HrJH7cYsJSLIHP8+mispVy3Sh7FtWZNYuTT
 1/VA==
X-Gm-Message-State: AOAM531KhRjLe3Al7FqCt2KuY7wj9CIJrSZnhLB4ahSDj23UE+DIn7kB
 xI4U1DZTdBpQYydEsWPmI8o=
X-Google-Smtp-Source: ABdhPJxlKmrxFZuT/FAITTFKtimqCuPmpqJElllBfSaAREj/db8P6HZlcu9ug388nFgwdaclSsMcRA==
X-Received: by 2002:ae9:df42:0:b0:47e:fe7b:a202 with SMTP id
 t63-20020ae9df42000000b0047efe7ba202mr12266908qkf.256.1645454287319; 
 Mon, 21 Feb 2022 06:38:07 -0800 (PST)
Received: from mail.google.com ([207.246.89.135])
 by smtp.gmail.com with ESMTPSA id bm8sm20942916qkb.25.2022.02.21.06.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 06:38:07 -0800 (PST)
Date: Mon, 21 Feb 2022 22:37:58 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Changbin Du <changbin.du@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] kallsyms: ignore all local labels prefixed by '.L'
Message-ID: <20220221143758.7wln3mklyaj7mzod@mail.google.com>
References: <20220201013257.17926-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220201013257.17926-1-changbin.du@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_063809_851138_EAFC5570 
X-CRM114-Status: GOOD (  19.61  )
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

Hi, Masahiro,
Could you consider picking up this change if you have no objection?

On Tue, Feb 01, 2022 at 09:32:57AM +0800, Changbin Du wrote:
> The llvm compiler can generate lots of local labels ('.LBB', '.Ltmpxxx',
> '.L__unnamed_xx', etc.). These symbols usually are useless for debugging.
> And they might overlap with handwritten symbols.
> 
> Before this change, a dumpstack shows a local symbol for epc:
> [    0.040341][    T0] Hardware name: riscv-virtio,qemu (DT)
> [    0.040376][    T0] epc : .LBB6_14+0x22/0x6a
> [    0.040452][    T0]  ra : restore_all+0x12/0x6e
> 
> The simple solution is that we can ignore all local labels prefixed by '.L'.
> For handwritten symbols which need to be preserved should drop the '.L'
> prefix.
> 
> After this change, the C defined symbol is shown so we can locate the
> problematical code immediately:
> [    0.035795][    T0] Hardware name: riscv-virtio,qemu (DT)
> [    0.036332][    T0] epc : trace_hardirqs_on+0x54/0x13c
> [    0.036567][    T0]  ra : restore_all+0x12/0x6e
> 
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  scripts/kallsyms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index 54ad86d13784..8caabddf817c 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -108,7 +108,7 @@ static bool is_ignored_symbol(const char *name, char type)
>  	/* Symbol names that begin with the following are ignored.*/
>  	static const char * const ignored_prefixes[] = {
>  		"$",			/* local symbols for ARM, MIPS, etc. */
> -		".LASANPC",		/* s390 kasan local symbols */
> +		".L",			/* local labels, .LBB,.Ltmpxxx,.L__unnamed_xx,.LASANPC, etc. */
>  		"__crc_",		/* modversions */
>  		"__efistub_",		/* arm64 EFI stub namespace */
>  		"__kvm_nvhe_",		/* arm64 non-VHE KVM namespace */
> -- 
> 2.32.0
> 

-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
