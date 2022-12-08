Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B881DC001B2
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 01:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GAv7dcqVmrOAtQlfvmkuOiULFgxy1I83xo6Zrmv7Fpw=; b=jlYUpGQ8kHRhD7
	buoCnQFmU7vaNpk9ukRXELvyIQJ5dMncpbretXMr4vEADbuso4/Im68lV/3N3l7nmTNFrKKvWA77N
	DNlADV0T4dtj7lNuyhqXOUNINiZtvqWrDRHGYigb5i6Fjy5jOdZFd6aWf2xfGonICQhhknnvef0WJ
	zZUqgBN78DnKuGbgmqfvSRhFYCPMucSNZcGE4tmoqVZLKs8kU1CJrOvCD34iaMDnQRI7szMj8xqj9
	Sb2yRJdTCcVdZmuXDimLpSaZy1OMUiWPLLFkpfayzsR2y+OTjqsI6LfMUPLP1dXymXAOn5gTPoJlt
	TSrY3USTy5MwZ2dSRnEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3S7Y-00HZ3m-Ls; Fri, 09 Dec 2022 01:24:12 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3S7U-00HYwQ-V5
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 01:24:11 +0000
Received: by mail-pf1-x42e.google.com with SMTP id k79so2641437pfd.7
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 17:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKTAsr2IrXMz/U2BqEq73Jfn0nVzLtC09ILEdcEpquo=;
        b=2CRNgwmN3i03MopIoAI+Cyp5x7a2vzmm1Ez+9w0eeXm10PfG3FZT2uDND623esVUul
         fJesWMTE6Y3FZD0Cyo82R7j/ZSHW9sZVYb6z1eMF2CdYAurpKPq7ZRfbMzvSG1l2T9XB
         HA7qhLaXo4XqDcrCuyHuHpmVi9ZrFssSbMKxcGKlVjgoY4GrX+d6uIcLc+d020Ze36F6
         9FsREAqpVzJMGRRzGEX8Gk9JKgmhA74kI1ym1TuxhIDbBDko9TgadlL2+U3KbJCvlElj
         kJjgHmXcR45ne7Vr4UWCcrYhsQIPJaesj62ipPuL9OkrUv4BCPhul0irQWDd0XNvYTc2
         uj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKTAsr2IrXMz/U2BqEq73Jfn0nVzLtC09ILEdcEpquo=;
        b=UnYChMciqFymy548yr8Pf40rn/F9dc4SoK3hx/cx5wrEuYRaR3AjB4bxtkSrBfLDBB
         e6jyVfQRnsGtvJt0SrvzAVYM5PQ7M6PHoCWvM9DRq7cgtb34EOvrCOIc3can5YXSBgEZ
         sGD0lT+7nf2G09NKwLCu2Y/4EXzGG5InnaRXOwYHnBWGJyV8/dM2QsTJdRFnNd4RwWTD
         vkgps1Iy7Bn3uAHc8ot3xZuOFg7Kek2n+X/6p8CV7ROToT9DQXXDLs1lgGa9QCKPFDYd
         CQlEbhed7eIaFKPTmEqSlOqm28YjlaBi4a5vr7umtdFbm612Glmz0uKBZVqpCBGM88E9
         NZQQ==
X-Gm-Message-State: ANoB5pkkL+mvUMSoq52GVDG42om0M30aselF2qOcHdD8XvfX4eVn9x+N
	wPbrBcC5JZ23bgx4olnHsyAPZ0fMDAME9Mtm
X-Google-Smtp-Source: AA0mqf7IXsDw5KMVyYSCx2/x3dmfWax5dCPlOeHHAghTvWBGXnL1yaFR8uHDgzS2bfAS8m5LzGS/zg==
X-Received: by 2002:a62:8783:0:b0:577:9d32:b30f with SMTP id i125-20020a628783000000b005779d32b30fmr5183990pfe.15.1670549045965;
        Thu, 08 Dec 2022 17:24:05 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id q15-20020aa7842f000000b005672daedc8fsm124950pfn.81.2022.12.08.17.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 17:24:05 -0800 (PST)
In-Reply-To: <20221114090536.1662624-1-apatel@ventanamicro.com>
References: <20221114090536.1662624-1-apatel@ventanamicro.com>
Subject: Re: [PATCH v6 0/3] Add PMEM support for RISC-V
Message-Id: <167054326322.9839.358393101882236728.b4-ty@rivosinc.com>
Date: Thu, 08 Dec 2022 15:47:43 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
  Arnd Bergmann <arnd@arndb.de>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org,
  Anup Patel <anup@brainfault.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>,
  Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_172409_217244_478811D3 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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

On Mon, 14 Nov 2022 14:35:33 +0530, Anup Patel wrote:
> The Linux NVDIMM PEM drivers require arch support to map and access the
> persistent memory device. This series adds RISC-V PMEM support using
> recently added Svpbmt and Zicbom support.
> 
> First two patches are fixes and remaining two patches add the required
> PMEM support for Linux RISC-V.
> 
> [...]

Applied, thanks!

[1/3] RISC-V: Fix MEMREMAP_WB for systems with Svpbmt
      https://git.kernel.org/palmer/c/b91676fc16cd
[2/3] RISC-V: Implement arch specific PMEM APIs
      https://git.kernel.org/palmer/c/a49ab905a1fc
[3/3] RISC-V: Enable PMEM drivers
      https://git.kernel.org/palmer/c/497bcbe3ce04

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
