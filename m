Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D374DC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 17:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fDTsDpUZjAmFwWP4p+BYCurQIIO7dEdX3Sr5rz/7dk=; b=XaTJlgkL8m6EMm
	rAqO1fJb44xWK5dV55NSMyNmiv3GaCEziBO6AryncfW9fcVF2+oK6ZswpMUOMRBdFlBOS92aBcIES
	GsEJ+EJXijXGrhlUh89jBgYIzZ79TqOCMwqJ3JFxCDERrhpdYjk7psV/zJRpa4EMBD782/tyNeScL
	IYa1aiLeRhuRfoBmYw7yEFdg2oFnVsjt07I15ujtcKBtOMIWwF8zsP2tTwy38uuKamldmQi/cUtDi
	jFh1LvuDAZNrsfxbJsgLaLd/Ia8zJ+OiXN2lJb4ENylpYU4vdaxq+j8k8nJgVTfUukvMN6FRuMsIO
	LP9Zk226mlef9KLgz8fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0mvH-008lXM-Rg; Thu, 01 Dec 2022 17:00:31 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0mvF-008lVG-7h
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 17:00:30 +0000
Received: by mail-ed1-x52d.google.com with SMTP id d20so3282684edn.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 09:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K7miDirFJY1Nmg3d+qikKLoNLyLAQWnhDP4Byuq3V3o=;
        b=k/hwVVqGgL4EJ9jE6PKeYQdlm1jmrUTME/dA9rl0pq54Vld9bpKOqIF4oI2spMgro1
         59kPaTrD90z3o1lpC9k2dcRMFoOnjKpwsg14oZ3MrwCVjAd6JXbBmBOo4JvYC4p4fxVu
         c10suF8fSk8a/tyiPki3WAnEPC2vU9VvLFHsVln5EWTFDzy6Me2culyzCvglvAgLkpNs
         1IbsH0kZK/+9FTXzrMk4AK9HrIqwZYqtWRz2xfZTZfuZdgojj9Vs3PYn2GZRHz/8yRvN
         FwBPj2QEzZd/PZdULO6RNsTtAb4G3/Try+LYIkIpzcXk8sncYAPppKoFpDETI4RHZQ8t
         bF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7miDirFJY1Nmg3d+qikKLoNLyLAQWnhDP4Byuq3V3o=;
        b=f4ONdAJ6UmUkfU+RernaYXUerTUeynovfVIp2KZSkua5wc1CwNEQR0WAJiikKj8g2a
         8g9LF+fzqkjrYXd/AunE+AXi2VzloAR9W3I1n2XxteffOSfWSqSdB24XmdpxXJYg5kuF
         G13p91llyE+jIfwwlRWDCt8xkGv/Sd44c/MWwmdX0Ck9SUIkc3yjspzKGglM2HmyT+uI
         RZdN5OodKpat13JXHM/X0bAOhyJJGE5JMcwqwywVy5Aw7Qx5DqwygLr2QrCCoXWJTlAU
         14c9AO07y7BOWFBnYle08OhqrVxdoohOftt5Uy1q8rSjlOwcVK8y+o3l3HCk3yVsi0GK
         Ex7A==
X-Gm-Message-State: ANoB5pm/p0ZOeHSn60G45e+Aiq71tJ4MSPa0O6H7wubIB/S/jIlV80AE
	qXypJ1ZdLBhQJLT9R4fEyE07Mg==
X-Google-Smtp-Source: AA0mqf7LyO7T3W5UEDkOeO7mdJHSNU2UkBpluS08LCpZllWWmvuNHNTggYUdGfFlGhkzqo/2BFkF7w==
X-Received: by 2002:a05:6402:3711:b0:461:b6a9:c5cb with SMTP id ek17-20020a056402371100b00461b6a9c5cbmr46563386edb.148.1669914025685;
        Thu, 01 Dec 2022 09:00:25 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id u1-20020a1709061da100b007ae1e528390sm1947652ejh.163.2022.12.01.09.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 09:00:25 -0800 (PST)
Date: Thu, 1 Dec 2022 18:00:23 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	conor@kernel.org, philipp.tomsich@vrull.eu,
	emil.renner.berthing@canonical.com, ardb@kernel.org,
	linux-efi@vger.kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v3 01/14] RISC-V: fix funct4 definition for c.jalr in
 parse_asm.h
Message-ID: <20221201170023.tocmgewlwjrc7t6d@kamzik>
References: <20221130225614.1594256-1-heiko@sntech.de>
 <20221130225614.1594256-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221130225614.1594256-2-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_090029_297084_3E08A409 
X-CRM114-Status: GOOD (  17.12  )
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

On Wed, Nov 30, 2022 at 11:56:01PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> The opcode definition for c.jalr is
>     c.jalr c_rs1_n0  1..0=2 15..13=4 12=1 6..2=0
> 
> This means funct4 consisting of bit [15:12] is 1001b, so the value is 0x9.

I presume kgdb c.jalr stepping was broken before this patch and, if so,
then we should add a comment stating that and also

  Fixes: edde5584c7ab ("riscv: Add SW single-step support for KDB")

and maybe to help keep me motivated :-)

  Reported-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/parse_asm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/parse_asm.h b/arch/riscv/include/asm/parse_asm.h
> index f36368de839f..7fee806805c1 100644
> --- a/arch/riscv/include/asm/parse_asm.h
> +++ b/arch/riscv/include/asm/parse_asm.h
> @@ -125,7 +125,7 @@
>  #define FUNCT3_C_J		0xa000
>  #define FUNCT3_C_JAL		0x2000
>  #define FUNCT4_C_JR		0x8000
> -#define FUNCT4_C_JALR		0xf000
> +#define FUNCT4_C_JALR		0x9000
>  
>  #define FUNCT12_SRET		0x10200000
>  
> -- 
> 2.35.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
