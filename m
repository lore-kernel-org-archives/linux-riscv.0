Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E729C54EBE
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 09:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wddWS/ziSjgk4fVU9vpJYpn1ChrxPWYjGXB1WYs24mw=; b=PUrbnDIyORTSR+
	ky6F1Z+SHP+noU4a3nLVLGRzKvWKEjT4nPjTLt+2h/4YLRPFe0BlMB0n1PEoQeIQdX2APOA22SuKJ
	KRsFBVlJSQes+0iuqDw3Xk+UshY+SxyZWCH3dcP/TUrv7a8hiEMl19hptw6PRfRfTj1M3oZ60ERsL
	XkL+0VsVBHGZR6+13ChBBnMLGt6/e5zqHVkc/lyRh4nBI6RWX3y9um+KfCzaUw8Erc1mJNS8ej4HM
	NHo6GTqONW26JC+OKgr69Gs+F6gsKCzTydrE91T3TSJxhUQ5Zv1LYRymf82uxFKrYSbxNfMvHJFnE
	LbZT/F1WNSm1iRVXQ5KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFB6h-006ADF-CO; Tue, 10 Jan 2023 09:39:47 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFB6d-006A9o-F8
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 09:39:45 +0000
Received: by mail-wm1-x335.google.com with SMTP id j16-20020a05600c1c1000b003d9ef8c274bso4990200wms.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 01:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MNHMeRpPglY0pXrcQupdNDeDexX44wkA5x1qWpudWkE=;
        b=fXEMtaKQsIJGcJdmzLTWPlkyFUiSlwt7yUhW56xUHNM6BTYjIPTWIV/upJ9epmFnzi
         +DwI+2hNOgdua77H61g8VJ1RLfplCcBw9gsW9znmL1sToWFYstTBOUDXpPLVt+HkSzHk
         J+tq96nttoxpKKKMC9TIpPo5us6zxZeH+1EP+8LtEg0pf3w3D8SdqCF61ZU7a7swCZgY
         ublMr0l9XqJVlCYDh1Io7OR6Rfp0NtgZbr1RZEJtskrsrAxBCvouQNlSbK4gl6Sjd5Tw
         kDbqa1JJdJw8C2CL4R2HHpgmTy2bWwC7lkXbD4usgcHNLmA2+ag1BqL4RafOplBfiDQA
         mx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MNHMeRpPglY0pXrcQupdNDeDexX44wkA5x1qWpudWkE=;
        b=O/NlIg0rE7moojnVwqCcupkoqAPshe81GBEMZhqrCONIHWSOc1dSXcB5G8HHd6Qeow
         XwM14YJKYwZGivtp3K5t8Phc7/CgXhIscG9PrOxRanWTtfp9OZelVgfFrnu63xoFooge
         vg4FPtOiXqVB+mOa2ROg5e5v++s6GOoxzwxysdliEjAgjXTEfvPgYZzNOidIAFKEA+yV
         xpNyj9PRUvVU7Aax83oTIcgU2NM1TMcXz3/mByh5dSTOUQccKOoit8mjyNZl5wQQUEMB
         hIdL+uCf9BpYJuI1uCzAvDRk+g52WHlLOJZ7ebSHgy3Q/X9GLzXXQIx40ailXd9R2VVo
         RiWg==
X-Gm-Message-State: AFqh2krWCiGivob1yggWzqDqbY90Ptrvzo+sACFQBEcROw32UrIt+T4x
	3aBq+qXSg0xh3Jfn4phn01pvDQ==
X-Google-Smtp-Source: AMrXdXsg5Q1kK/Fu4pLUC8JkLLvL7Eewrb5CsDIT4/4CxTxMxQO7dPPvvXdo5ZsbItb9gk+wx2T/zA==
X-Received: by 2002:a05:600c:4a9b:b0:3d1:dc6f:b1a4 with SMTP id b27-20020a05600c4a9b00b003d1dc6fb1a4mr58915320wmp.5.1673343577999;
        Tue, 10 Jan 2023 01:39:37 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id o9-20020a05600c510900b003c6f8d30e40sm21103053wms.31.2023.01.10.01.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 01:39:37 -0800 (PST)
Date: Tue, 10 Jan 2023 10:39:36 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, conor@kernel.org,
	philipp.tomsich@vrull.eu, jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 4/5] RISC-V: add infrastructure to allow different
 str* implementations
Message-ID: <20230110093936.nzc3nkrkqkkzxkaq@orel>
References: <20230109181755.2383085-1-heiko@sntech.de>
 <20230109181755.2383085-5-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230109181755.2383085-5-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_013943_536578_3D62AE99 
X-CRM114-Status: GOOD (  12.83  )
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

On Mon, Jan 09, 2023 at 07:17:54PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Depending on supported extensions on specific RISC-V cores,
> optimized str* functions might make sense.
> 
> This adds basic infrastructure to allow patching the function calls
> via alternatives later on.
> 
> The Linux kernel provides standard implementations for string functions
> but when architectures want to extend them, they need to provide their
> own.

And the compiler provides builtins. In the previous series it appeared
to be a bad idea to compile the kernel with the compiler's builtins
disabled. How will the optimized string functions which will be based
on this patch be selected?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
