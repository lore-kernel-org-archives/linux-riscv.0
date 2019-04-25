Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7073EC43219
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 19:00:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C056120678
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 19:00:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cqK18Pdm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="LcxAm9Zs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C056120678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FFAH2ifbMVGYgw0TDbWkWUVa86WL7Z/H1nTmpdrz4e8=; b=cqK18PdmOhXBI/
	WiGLQ5eb0T8GHcLWFZ8w6h8Cj5ir/jjH+vVmXc6aRuXVSCmvlaRdeuxJWuGlliK2EinAoW/ZnEJqr
	MTzbNbUy08CYPLwPUwnarUofGVoRG9vbourXEOLi9UGi87XRb/r5ZLaiZWlbc+POWxaQ7nijj2FTK
	ekXX2zK/bsart4EAht2CbzgieGQgCvs6vEzHPj4N60Qqw7YuPwtrtnubxWf3sUm1dK9nJNyB+vupG
	plXWC2Gq3De73ZzBg4BXWaxotveo58RFTWMzSibdY7RLJaoXGM81FcTqp7IWGZo/4cYdzc60SqqY9
	NH4Tbp9R4A02jwu/Rn7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJjbU-00087R-B0; Thu, 25 Apr 2019 19:00:16 +0000
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJjbH-0006rA-2k
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 19:00:05 +0000
Received: by mail-it1-x144.google.com with SMTP id z4so1862421itc.3
 for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2019 12:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=MyTYrlHjhOjUxnbSeBVNkZ0NEbmszW+yz0t80HJtysk=;
 b=LcxAm9ZsxtUNsfDwFDxC5MKFdTS13KwjlTymxBdhW2hKiYvocZ54hZLPPJTTxdhslu
 VLTsHORvg+ieFTyo7QIqUglG2FO6WUzPIXN1MNwWVTemtUZBmaSZ7bvUqGRVPGN/cgT+
 xcouYwCcywC+UsuGGh3BZZUMm5PuFs0085b+nx82mQa5FFW43O0kCFh60gsFN7I1Igj/
 jX3JcCol/YXo9jvRYpCyH8mEYT8JdDjT1xJmcIJQCeENkYWdR/cZ2x9nPKXxoQGHla7y
 3P0JKOHj7l/j/kOxoCqn8zqy2JbXlfj1gyzRghdGQKMp/2NKHb7C5O53tzRM8CGbHMcI
 uojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=MyTYrlHjhOjUxnbSeBVNkZ0NEbmszW+yz0t80HJtysk=;
 b=HuEqwzFtkT+Rj9v6NMW8tF4WZORUf7kLXrzmSp9f++g7XrTf1taExVjaEvqqDnhJBX
 1+AWDPow377KO5VEzPntZMNvw2X7ezrFuTwZB1FURAYozCB8S2W2bP8nlsKV5LFniaCR
 ltW2pSRBJZ0ewNSZ8uCB9mA0BccMzT1JnNOiq4MJyAC/dd6btGSUkDDlULlJWMXKswl8
 g47X9CMPFkGZodToRzbBx2+lxHii5HNolEUo6o/zxcRQpmzgqien46VXe4vOKGE5irNu
 pYTM9oCEQ1LKY+Pi2s7Onv72lDijhtePb/wPTF9qMvYSjKW4FUC9kWZPsK5pzEjeLcLB
 epxg==
X-Gm-Message-State: APjAAAU12JFRG5XENZJfn/hi4+25CwbfndprAotQpVWePme9W6cQpbNs
 3eDJZEtfyaBRg54nRbefPs5muQ==
X-Google-Smtp-Source: APXvYqxZEG4cFMXJP9+8APUMdgOQnTVKjlCYAJc+yJfib+UivKWmay+PGvFdyIFq2ihtg7Zlur/v3g==
X-Received: by 2002:a02:ac9a:: with SMTP id x26mr6343229jan.129.1556218802112; 
 Thu, 25 Apr 2019 12:00:02 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 q2sm13649895ita.0.2019.04.25.12.00.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 25 Apr 2019 12:00:01 -0700 (PDT)
Date: Thu, 25 Apr 2019 12:00:00 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/9] riscv: use asm-generic/extable.h
In-Reply-To: <20190411115623.5749-2-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1904251150580.17442@viisi.sifive.com>
References: <20190411115623.5749-1-hch@lst.de>
 <20190411115623.5749-2-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_120003_292700_F87AFFEC 
X-CRM114-Status: GOOD (  12.85  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 11 Apr 2019, Christoph Hellwig wrote:

> Signed-off-by: Christoph Hellwig <hch@lst.de>

Usually we'd nag about 

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n102


Otherwise,

Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>


- Paul

> ---
>  arch/riscv/include/asm/Kbuild    | 1 +
>  arch/riscv/include/asm/uaccess.h | 7 +------
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
> index cccd12cf27d4..5a7a19d9aa7f 100644
> --- a/arch/riscv/include/asm/Kbuild
> +++ b/arch/riscv/include/asm/Kbuild
> @@ -4,6 +4,7 @@ generic-y += compat.h
>  generic-y += cputime.h
>  generic-y += device.h
>  generic-y += div64.h
> +generic-y += extable.h
>  generic-y += dma.h
>  generic-y += dma-contiguous.h
>  generic-y += dma-mapping.h
> diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> index fb53a8089e76..cc5b253d4c57 100644
> --- a/arch/riscv/include/asm/uaccess.h
> +++ b/arch/riscv/include/asm/uaccess.h
> @@ -23,6 +23,7 @@
>  #include <linux/compiler.h>
>  #include <linux/thread_info.h>
>  #include <asm/byteorder.h>
> +#include <asm/extable.h>
>  #include <asm/asm.h>
>  
>  #define __enable_user_access()							\
> @@ -98,12 +99,6 @@ static inline int __access_ok(unsigned long addr, unsigned long size)
>   * on our cache or tlb entries.
>   */
>  
> -struct exception_table_entry {
> -	unsigned long insn, fixup;
> -};
> -
> -extern int fixup_exception(struct pt_regs *state);
> -
>  #if defined(__LITTLE_ENDIAN)
>  #define __MSW	1
>  #define __LSW	0
> -- 
> 2.20.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
