Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94E5C636D3
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 23:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dCQ/+6umPz4t6AcpRvypvxMa/+FczPYsdor6oiUFTJw=; b=CTjdFWITcKTtwm
	nd1TNuv+CU/LRMyo/ROZhNm5C+V96VlCiuivE/v3UGCweVWAgFdZwOahbdSPLxSIfvjDCfhcwM4en
	kp+RKdehe01RDyKJkYRrfQ2//xRwZwp1XVnndj3JalX340fFk9McePdCnLNdOxJHDSUCdSXUe/GN/
	8Bh9jOmEQVS+pqYWZ9WreBv7EBaxK66advoO/MFqsPDY3Nb+g+ekYmryCEhMurLnZE56a9t93Ckpv
	4CQ3fTXODK9beNEUJddoreCue5eqmd5b/5cIvnH8oo0Wt7psVJ+R4w2FgydqQi2Oag2IClmxfmvjO
	qfcMcOwQt9XaiFPaM2UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNjAv-00HQ6T-Ne; Thu, 02 Feb 2023 23:39:29 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNjAt-00HQ4h-7a
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 23:39:28 +0000
Received: by mail-pj1-x1029.google.com with SMTP id c10-20020a17090a1d0a00b0022e63a94799so7203430pjd.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 15:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vesawjPB9AOcMrrmpD3ev47+uO/NqYyhZGhOCb5pWQw=;
        b=V3WpKttJoNgaLv9nu6Gk1aeQLF3+FvlkQ4QhupM3QzLNkvuC7XH4Z3b343ZSmfKmRH
         Z6F0owS6H2Ej3uu9ggM1xqr1CwjFrZ+1VjHMSZWDJk90LTpr0t6iJ23il4BP0ixtJ1IA
         8ZxXF7qcFGt91DZyWLi7/dXXut6M4vMrfCs/poLb4HDqn3LmW+wLxjvxiZyT2PedXMH+
         MSbTUmo24ar4Xa19xDvR5WMS3tXEs4I/4HGkf+XSgYldYfN3Vdwl9ze46qp1GAhGa5P4
         AElgm4BJgJCSUmXRZzyK37S+7ThWVWaMfRj7S9dhE0YAwsWulY5uSYizi1KJg5xo3jrB
         RWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vesawjPB9AOcMrrmpD3ev47+uO/NqYyhZGhOCb5pWQw=;
        b=TkdZGBpjR+jqfTFKWZ0EzvovlEa07+5UIoB0UiB+mXNjWzKgFUZQv2t7ByNnmBM2og
         vHnEfnknCMYAzk4ywCwD8TI/iV0hn+MstBXThkVNApw/d+fFqOeb6suz71wPUUcT6yRZ
         p2JKr8RH24F/BWWqs43oAcPW+R1rZLrFT8zRTtccYMrY5PvckGSuJVymsG4LaSNxvJw2
         9S9p6twrtij2GHdT31Md2KuECmZRE/9FwFUdDqFiPtxX4u2S2zaiUOrRaFxdF2y6lObA
         FnlK1egItQT4vh2yTsYmhXC4bx65/5qrMyOydAf6bXf1+gYjj1o3dBNpqXqiXOjywTnh
         UAXg==
X-Gm-Message-State: AO0yUKW8rVK9sna/xTOvwnmKGvkg3UI5zKDMTcvs/XGt215BtS5TKDmM
	hgj+ZzxQll8X/2yAti7IUwxP48U4CrdIj1ga
X-Google-Smtp-Source: AK7set+qppWzyeAwtENJSI1sSfYNwgvgOm0IjkdrugKKP1o2J+2Gq0evSvAPlUC7nZUNmRLbxgHP5g==
X-Received: by 2002:a05:6a20:3d92:b0:bb:cf2f:3b09 with SMTP id s18-20020a056a203d9200b000bbcf2f3b09mr10417561pzi.51.1675381163978;
        Thu, 02 Feb 2023 15:39:23 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902ed8400b00192a04bc620sm202452plj.295.2023.02.02.15.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 15:39:23 -0800 (PST)
In-Reply-To: <20230128172856.3814-1-jszhang@kernel.org>
References: <20230128172856.3814-1-jszhang@kernel.org>
Subject: Re: [PATCH v5 00/13] riscv: improve boot time isa extensions handling
Message-Id: <167538114995.11760.15499865647132420589.b4-ty@rivosinc.com>
Date: Thu, 02 Feb 2023 15:39:09 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Heiko Stuebner <heiko@sntech.de>, Albert Ou <aou@eecs.berkeley.edu>,
  Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>,
  Paul Walmsley <paul.walmsley@sifive.com>, Jisheng Zhang <jszhang@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
  Atish Patra <atishp@atishpatra.org>, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_153927_294748_027A0D3D 
X-CRM114-Status: UNSURE (   9.31  )
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

On Sun, 29 Jan 2023 01:28:43 +0800, Jisheng Zhang wrote:
> Generally, riscv ISA extensions are fixed for any specific hardware
> platform, so a hart's features won't change after booting, this
> chacteristic makes it straightforward to use a static branch to check
> a specific ISA extension is supported or not to optimize performance.
> 
> However, some ISA extensions such as SVPBMT and ZICBOM are handled
> via. the alternative sequences.
> 
> [...]

Applied, thanks!

[01/13] riscv: move riscv_noncoherent_supported() out of ZICBOM probe
        https://git.kernel.org/palmer/c/abcc445acdbe
[02/13] riscv: cpufeature: detect RISCV_ALTERNATIVES_EARLY_BOOT earlier
        https://git.kernel.org/palmer/c/191b27c7c0e8
[03/13] riscv: hwcap: make ISA extension ids can be used in asm
        https://git.kernel.org/palmer/c/d8a3d8a75206
[04/13] riscv: cpufeature: extend riscv_cpufeature_patch_func to all ISA extensions
        https://git.kernel.org/palmer/c/4bf8860760d9
[05/13] riscv: introduce riscv_has_extension_[un]likely()
        https://git.kernel.org/palmer/c/bdda5d554e43
[06/13] riscv: fpu: switch has_fpu() to riscv_has_extension_likely()
        https://git.kernel.org/palmer/c/702e64550b12
[07/13] riscv: module: move find_section to module.h
        https://git.kernel.org/palmer/c/e0c267e03b0c
[08/13] riscv: module: Add ADD16 and SUB16 rela types
        https://git.kernel.org/palmer/c/1bc400ffb52b
[09/13] riscv: switch to relative alternative entries
        https://git.kernel.org/palmer/c/8d23e94a4433
[10/13] riscv: alternative: patch alternatives in the vDSO
        https://git.kernel.org/palmer/c/cabfd146b371
[11/13] riscv: cpu_relax: switch to riscv_has_extension_likely()
        https://git.kernel.org/palmer/c/95bc69a47be2
[12/13] riscv: KVM: Switch has_svinval() to riscv_has_extension_unlikely()
        https://git.kernel.org/palmer/c/e8ad17d2b5f3
[13/13] riscv: remove riscv_isa_ext_keys[] array and related usage
        https://git.kernel.org/palmer/c/03966594e117

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
