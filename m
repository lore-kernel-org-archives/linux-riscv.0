Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C2CC4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 14:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c+rDaxCUxQqbtF8tOovckKiD8fa0W/rV8bxWme3jJFc=; b=odq5h0gMkedLW5
	UIYyI38STpP+m/trnZkfoooNsksk6IgI7eJWGqO3KtCL6KsZKjmWBrUVSYghUVEEDiCuR0yB8fJ/n
	wnrMS7HwQDv+dYnLBftqzLuQjTEw4/1lI3M4e8yizP0MzrIW/3SBIqQKtPIiASsFfbNKvdEVHREHK
	Yrfh3pL/NWdY/B4jgaCHrvJo2HwoLRolVBLFitVM8Hb7e4PvVtsuoQZQtVqT4KU5F/4Wq66monwjC
	aaNA9wKittPWhwcoQJU07BdgFpm/vtocyogRXaPkfi3eL4N8A9sP/fssXGZLIgcJ+X9yfm2FCyxPy
	z4a/1c9/KSXQxi+PI8tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01hL-009Igc-Gy; Tue, 29 Nov 2022 14:34:59 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01hF-009IXZ-3c
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 14:34:56 +0000
Received: by mail-ej1-x632.google.com with SMTP id ha10so34305227ejb.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 06:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7bylaMFm4kiyQUNLzCN6ip6fvwIhhKE7GEnFlEJ12dw=;
        b=hHT7VssA0NfhPPbA0l59J/PdvABh7twSSO59lkTKWpBVpVJGnXybtN0iatI8wPjnii
         Vx68kYl2fjAxVwL+RsM/V1xzam6A+OSPRy17Ipi9hqFllVKMLIipZWbhtukjco/RKOse
         1D1RdHPmNwfevTlRdgRbrM/3pVehp7NqF7jh/fYY2w9pPFVrOks6C2CAAHEsVHmzQuWD
         FvsvGZ+gjrOlyMbdX8sxQj3xgkbSdpRFIUEUYtuUKOTop3W8g1W4O3LyXe9QRnLgHdNP
         gybFtSoDIO1+b8pIGbmMOidk7Ysyjumsox/VP1Ekay0t9xMH1bTeWbzVSs34Drg+ouAo
         jtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bylaMFm4kiyQUNLzCN6ip6fvwIhhKE7GEnFlEJ12dw=;
        b=Mh+a0yktr8D1VfoOrhOtlvqqBJFWMxpnBIKJAM+ytB0sQRm0s/TuSCs2xh3Lv1UXMx
         QkK9jv4J8RLM1Cpfyp+OSHZUgdskibJReIEgEsVaAws/gWZV5SGQanoXJaM5vkPhzSmf
         wQt6Tpi0mOHKLmlgDH/hcFJHX1D9oFrWgXkkwUl2ta/J57VHwb1A8tO2h1s7HboEMsgN
         +dCeSWCXif46Vbr8WuS2DUKDb989xBZjnOwP7Q0TIz9pOOhyhclqN7oyv4flJDMcRj7D
         dEP4E6SnQ1m1blVAfnIi6jYTo2Zk+b+Sw208leQ9NEmy4j0qB89VaP3UJtA2uCE+yp1V
         bFYg==
X-Gm-Message-State: ANoB5plg1i/IDiC7v83WxF2gJU/rOy4HbduNLAvhHAFjw5+dvms8iHss
	lW0qHGlbZ23fYvGAY0SlF7ujSg94DnouzQ==
X-Google-Smtp-Source: AA0mqf6KuVpJY/svKal3cdb/uuciqRB0598bLY3C0Of1rQu5uVshH7rPTe2SPLSOEW74wbb+ux1ITA==
X-Received: by 2002:a17:906:eb04:b0:7ae:77ef:d048 with SMTP id mb4-20020a170906eb0400b007ae77efd048mr32265907ejb.740.1669732489116;
        Tue, 29 Nov 2022 06:34:49 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id v23-20020a1709061dd700b0074134543f82sm6248557ejh.90.2022.11.29.06.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 06:34:48 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 0/3] RISC-V: Ensure Zicbom has a valid block size
Date: Tue, 29 Nov 2022 15:34:44 +0100
Message-Id: <20221129143447.49714-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_063453_205947_E793852F 
X-CRM114-Status: GOOD (  12.28  )
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

When a DT puts zicbom in the isa string, but does not provide a block
size, ALT_CMO_OP() will attempt to do cache operations on address
zero since the start address will be ANDed with zero. We can't simply
BUG() in riscv_init_cbom_blocksize() when we fail to find a block
size because the failure will happen before logging works, leaving
users to scratch their heads as to why the boot hung. Instead, ensure
Zicbom is disabled and output an error which will hopefully alert
people that the DT needs to be fixed. While at it, add a check that
the block size is a power-of-2 too.

The first patch of the series is a cleanup of code that crossed the
path of this work. The second patch prepares for isa ext. checking
and the third finally does what this cover letter says.

Thanks,
drew

v3:
  - Mostly just a friendly ping, but also rebased and picked up r-b's

v2:
  - Unconditionally complain when we detect a problem with DT's
    cbom-block-size
  - A couple r-b's from Conor

Andrew Jones (3):
  RISC-V: Improve use of isa2hwcap[]
  RISC-V: Introduce riscv_isa_extension_check
  RISC-V: Ensure Zicbom has a valid block size

 arch/riscv/kernel/cpufeature.c | 43 ++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 10 deletions(-)

-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
