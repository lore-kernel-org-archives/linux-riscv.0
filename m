Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0145AEB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 00:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cDo2juTLZC7ClreHi8LLaw1lNWXYxx8rVKTStWJO6VM=; b=RThm6K/RqiYUCK
	JwNqX1pJqKNOCEIINkPkq55NkrkFrk3QZAZG33FIRqaS4J4OBuOHHnGCYyPZELT7UNIjjaVHOYiss
	mqaVcgJum01uyYsQFYsfcTx3yDWVzKewOEUujxlbZMOH0NWL5dvDprrTOXY76+T5+0+hBR8KGk2P7
	jxx88DiJroxH5Ki2s33K6M4wwOLuyNJ7Y4eil24GYpuHMCrZZw8rdmi++tRw/sxvsg+js21SjRB3T
	KSwDyT5aVmTdET57UlJBV75fPZmAxebITjf03SU5CbXm/eaKuP9FD+hbLuEht1lIqAyLgzPcJ9MPf
	FItrcEIPcKxCanVxvP0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPgV-009ooX-0A;
	Tue, 20 Jun 2023 00:57:27 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPgQ-009olH-0z
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 00:57:23 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-517bdc9e81dso1614603a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 17:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687222641; x=1689814641;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gBIbwLVWMH//WD3Wf9PBLkgpgUav5DDPmHySKVJGkxs=;
        b=D3pBN2EIf32vLSdkOh29A1LHMm5TMF2J2yQIlV+iG12cgfQi7sW66+VtTSFTha4Qv9
         m1duhRu0twm1MEiaHVMvr3WRu4sndp7F+uut7wOSySJvDZdKfPntqjVVRWgJLKddienr
         n8Duylo2Pvc8Tza4BPUFHnahRdrp3xP2Tf0xJQ63Wa7jKdr/WRzCiZMfBIRErprrGRP7
         +tFi/s8npOZSaNj9aHIQg0ERzQBm0p/MbbOrZMctOiSxGP52VJ1hu1rSrTQTdub16CGJ
         g7pciOXrFZCZ4Rf9UBiijSVoRM+yCNWwUSlqWkv3sY3qDa3yi1XGSz8HTEHIYzA1U7Ox
         xMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687222641; x=1689814641;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBIbwLVWMH//WD3Wf9PBLkgpgUav5DDPmHySKVJGkxs=;
        b=gnMxfH1ljeiufvLkEtd7/2uAcQOxDhAUs96GQcEp1o0OYsPjCAB/jFj5npd3QzxuvL
         lpGpavuAxvfEPmf5DNVN0v5M54nvH4+ErVBHYqDRUTWhvxfKJ09ixK26xkowlQtwQGT7
         TElRbS7NQMX8KZOPzRq1VRraI5mHNzLqOCqa5t0rkfhOeokNku8/H4cj3EqId2faZlir
         9Hv2P30h2lablB2ls9ceYoFziWG5y0B0kvq0trdcLxYHivEHSoooE7jmxtoU5Ywr5HWw
         5Eu1/Ha6M2abgZnOWtUhNJEOh5Rg1oPHwTEzP/cN/sRcWPRJCv2rgyYaCvX4c9e7wgRL
         FNUA==
X-Gm-Message-State: AC+VfDxbq9FiCN+/Vs6ufcuZTZoe7H0bgt3iTTMeltQJ6Idy7JYYpTcm
	v9RIeRA1KK2vCdolfW5lLXRbUQ==
X-Google-Smtp-Source: ACHHUZ40lV3Zh+E3IFDyCnE48Nl/azsICbkSdfKF13FTWfxhYHUs6IYph016dX3P9sIQF3XRMcLR4w==
X-Received: by 2002:a17:902:e543:b0:1b1:d51c:f3f6 with SMTP id n3-20020a170902e54300b001b1d51cf3f6mr11325151plf.57.1687222641217;
        Mon, 19 Jun 2023 17:57:21 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id s6-20020a170902988600b001b20dc1b3b9sm375264plp.104.2023.06.19.17.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 17:57:20 -0700 (PDT)
In-Reply-To: <20230509182504.2997252-1-evan@rivosinc.com>
References: <20230509182504.2997252-1-evan@rivosinc.com>
Subject: Re: [PATCH v2 0/3] RISC-V: Export Zba, Zbb to usermode via hwprobe
Message-Id: <168721242551.30028.288770602847866224.b4-ty@rivosinc.com>
Date: Mon, 19 Jun 2023 15:07:05 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_175722_342766_DFEBC4D6 
X-CRM114-Status: GOOD (  12.23  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, Andrew Bresticker <abrestic@rivosinc.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Celeste Liu <coelacanthus@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Tue, 09 May 2023 11:25:00 -0700, Evan Green wrote:
> This change detects the presence of Zba, Zbb, and Zbs extensions and exports
> them per-hart to userspace via the hwprobe mechanism. Glibc can then use
> these in setting up hwcaps-based library search paths.
> 
> There's a little bit of extra housekeeping here: the first change adds
> Zba and Zbs to the set of extensions the kernel recognizes, and the second
> change starts tracking ISA features per-hart (in addition to the ANDed
> mask of features across all harts which the kernel uses to make
> decisions). Now that we track the ISA information per-hart, we could
> even fix up /proc/cpuinfo to accurately report extension per-hart,
> though I've left that out of this series for now.
> 
> [...]

Applied, thanks!

[1/3] RISC-V: Add Zba, Zbs extension probing
      https://git.kernel.org/palmer/c/c6699baf1064
[2/3] RISC-V: Track ISA extensions per hart
      https://git.kernel.org/palmer/c/82e9c66e81c8
[3/3] RISC-V: hwprobe: Expose Zba, Zbb, and Zbs
      https://git.kernel.org/palmer/c/c0baf321038d

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
