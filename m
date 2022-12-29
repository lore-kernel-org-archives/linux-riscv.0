Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908A3C3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Dec 2022 20:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MzZzNZEnxm92Fz334L0Emp3ndIfyjEktJ6xQ/e6pZaQ=; b=CtzihCsLLxynbI
	8Ycn1BSdNxB4k8KERaAp59EY75wL1EgDa7+hZUeBVJkR6xu/FFdwvR9cFOUU/345aBpvSAwn4Hmfx
	2gjB4POT7VGPFXcmKbinh7R0jld+mGQ5K261KcdkvxKr+gf+duJB/VQjLtmDS8sO86yrICAOE5nC2
	GftPGDOLnc2UBjWP/MLLmFRRmk912qx/qG3FeXZlmtrKEDwbtKKNSm792yVpwMn17+CAd6jM16YUK
	AlpbhY77VxLz4TSfqSVnGnuMHEpuqaUlfTYirBQbyBexMqVZ4GGvnMxxEpaB8uXDbLu+pSPLvgJIX
	mufUzsOFYcIRP1mwlDNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAz8j-001bJa-9P; Thu, 29 Dec 2022 20:04:33 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAz8e-001bGU-PH
	for linux-riscv@lists.infradead.org; Thu, 29 Dec 2022 20:04:31 +0000
Received: by mail-pf1-x42d.google.com with SMTP id w26so13260455pfj.6
        for <linux-riscv@lists.infradead.org>; Thu, 29 Dec 2022 12:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOpndU8GJjCYZkxounlWDluZgHvbXu/148j4WsAiVk4=;
        b=4PGoqy5BN6fltAD3U93NI7H1y9CWn3tQivyY1dVY979wFB/KezYqQ7hTkGC8SnmNLE
         +CCMu9gz//z+9qG1nENC/xiIKNdDODUZ3l3GQ+mWq9PPUus+rqG5xJDe8I3QJCAYwLVb
         QZ6GdBEmBVyhP5ugkKWQNn5xVtoEIQGSozE9MzkSr1VQ5jSnBKWoDu63yoTQF7ZlyOO+
         zECq1mgKt8dhQ6dYPRZaZwi1zmHA6Y/GKB18y/1yUWlQLob6qwSL2CLVDE8cHgWzo74j
         7Iix9J1JZIaaZ75ygcQw/gJd6k5IKAoby7dkch12/289Pt/voOqqUXTiLQc/gP2IJAIn
         eG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOpndU8GJjCYZkxounlWDluZgHvbXu/148j4WsAiVk4=;
        b=nHN9EZu4hGlepo1mxyYmjKT0LIDX3TdYUXt7kdaQx82mZ/hZ75u/SxxwR07KSl0ieK
         U4Ao1W8zYhY2QRGsjJA86UB2VCvI4acvj/UBuhH9p1kx7OyxwApfGeSpoPwduIUanL/x
         8IagJ6NFzLU+7/B3KWwje0Eb+82BK0xwmjjBfF8wbM2eomVMC/J3aef5x7uTdjB2Tz2x
         jAkhaHyejWE7c6PZrOtZgDhPx2R+gIcST3ch7qWZozLnng2sG/RuVxIU0QnSNLRdw/BD
         0pxQBRVLJ2bDrJvn/SbsO7jlhOXxbHKoCV432bcdbvHJ5XzrQyCWk/+cY6ttmbKLbQ7y
         B/6Q==
X-Gm-Message-State: AFqh2kruBcwWrClw3HD/qLjrwAd2QvUy2BxgcmyRFNtaQ/mDJq3yIm5f
	MAtLjoxcvZp5bAZKBsQIdeL6ow==
X-Google-Smtp-Source: AMrXdXssw5I1q38W2nOIuDr6HZQJbj+7FHOGgL4kJLS1JL3qepx5GYzXd5Jlqa9mSRVsD6+Q0pYDNA==
X-Received: by 2002:aa7:9210:0:b0:577:8bae:29a7 with SMTP id 16-20020aa79210000000b005778bae29a7mr29625183pfo.33.1672344265266;
        Thu, 29 Dec 2022 12:04:25 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id l190-20020a6225c7000000b005771d583893sm12766270pfl.96.2022.12.29.12.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 12:04:24 -0800 (PST)
In-Reply-To: <20221223221332.4127602-1-heiko@sntech.de>
References: <20221223221332.4127602-1-heiko@sntech.de>
Subject: Re: [PATCH v5 00/12] Allow calls in alternatives
Message-Id: <167232605588.9244.94673496057446319.b4-ty@rivosinc.com>
Date: Thu, 29 Dec 2022 07:00:55 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: philipp.tomsich@vrull.eu, ajones@ventanamicro.com, christoph.muellner@vrull.eu,
  emil.renner.berthing@canonical.com, prabhakar.csengg@gmail.com, Conor Dooley <conor@kernel.org>,
  jszhang@kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, Heiko Stuebner <heiko@sntech.de>,
  linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_120429_389085_63F4756E 
X-CRM114-Status: GOOD (  10.15  )
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

On Fri, 23 Dec 2022 23:13:20 +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> This series is split out of my work on optimizing string functions
> and provides the basics to:
> 
> - actually allowing calls in alternatives
>   Function calls use auipc + jalr to reach those 32bit relative
>   addresses but when they're compiled the offset will be wrong
>   as alternatives live in a different section. So when the patch
>   gets applied the address will point to the wrong location.
> 
> [...]

Applied, thanks!

[01/12] RISC-V: fix funct4 definition for c.jalr in parse_asm.h
        https://git.kernel.org/palmer/c/a3775634f6da
[02/12] RISC-V: add prefix to all constants/macros in parse_asm.h
        https://git.kernel.org/palmer/c/bf0cc402d7cd
[03/12] RISC-V: detach funct-values from their offset
        https://git.kernel.org/palmer/c/33e41480b233
[04/12] RISC-V: add ebreak instructions to definitions
        https://git.kernel.org/palmer/c/2621cac76f84
[05/12] RISC-V: add auipc elements to parse_asm header
        https://git.kernel.org/palmer/c/cde4a69302a4
[06/12] RISC-V: Move riscv_insn_is_* macros into a common header
        https://git.kernel.org/palmer/c/ec5f90877516
[07/12] RISC-V: rename parse_asm.h to insn.h
        https://git.kernel.org/palmer/c/c9c1af3f186a
[08/12] RISC-V: kprobes: use central defined funct3 constants
        https://git.kernel.org/palmer/c/debe28d0a52e
[09/12] RISC-V: add U-type imm parsing to insn.h header
        https://git.kernel.org/palmer/c/8963d6224009
[10/12] RISC-V: add rd reg parsing to insn.h header
        https://git.kernel.org/palmer/c/088ec01fce4e
[11/12] RISC-V: add helpers for handling immediates in U-type and I-type pairs
        https://git.kernel.org/palmer/c/47f05757d3d8
[12/12] RISC-V: fix auipc-jalr addresses in patched alternatives
        https://git.kernel.org/palmer/c/27c653c06505

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
