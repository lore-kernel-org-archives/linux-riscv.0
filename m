Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83F6ECAAD2
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 06:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jfe9DD18iGhwUM2f/7eVwrQQZ3fDtR/f0mqeqm6KITk=; b=BxK9je2txl5NTU
	rmQ7+TELwI8ervaiRZ+WuWouGNS3nRvmLKlNcZpcWqx2+L8sE/Sc9D11YZfmu4So0rkSZ8fIgQ2r+
	9q/JRDHxgx1JT2EPnWMo6hc83z9PSp2vS4+LHh+e8ZJTyjlxNK6AsCJQD1DaJlllbzmcLlJrJcgsd
	t6+cNWbP2PqS7oJRcSZnEoxsE9gjOs1QguWFfpWUKBaQ9oTIt8RSH31n+U+KyJShQgoRvFJEDkrVx
	EddQi0k5JA184OqVo9ub+B6ne9MBVeHrQp1f4DQW+fBNklqZ2obDQszbPKEgxImyGGghCmbKNqULa
	YtkF8iH1fqCkoPeFLPeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSYA4-005EOG-La; Mon, 29 Aug 2022 06:22:16 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSYA1-005ELs-7C
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 06:22:14 +0000
Received: by mail-pj1-x1030.google.com with SMTP id n65-20020a17090a5ac700b001fbb4fad865so7582185pji.1
        for <linux-riscv@lists.infradead.org>; Sun, 28 Aug 2022 23:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=message-id:date:subject:cc:to:from:from:to:cc;
        bh=K1FjpVHqTZWuFBiFwdMThJZJFwYGDL27q7f57M6QvWk=;
        b=hHnOqJBKL6fGupKuQ70HKYcCKIrf88Jpa5GOcoAiec18PT+6BOQAZG5lU8E063Ol4R
         WhXREUHiYNoR9kRpVDChRILpi972ba/gEc8kMOPcSvZTdPkUkEQaAGgUrCPDcQ3Y81p7
         QhM0ETIGkm04agdrXZ1PJMwlCKT0cix3FnVmJ14EDfoW038c1cMZiwfZPhjyn08BKuP3
         SWXV5GKgw7zZW55DWtlEjIjig3q0w1e4RyyS+94gM/RV0KiJN83GT9Tx9HxTMnHEWYWx
         uhD8b7teD9aG9dAS2l/g1Ux/HPEs1nUhBKo95ghZcdLSEilKo/zrVcPhg4kLodEL5UoB
         9N3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=K1FjpVHqTZWuFBiFwdMThJZJFwYGDL27q7f57M6QvWk=;
        b=5hHIjhIaxPgT/94F9POBI/9e6giaadAWOjCIVpFiffD5Nmrii9f4pvbNNuBx2l3FGR
         H3A9MdNyID5cLdpf3Qf/Vm3Bji7tVOX2ny+0AOTVpJS49Vs0e/vv8qJVm6mTLHHKri16
         eEKWqH4u7HXBwdiL9uEAT7EGTJKnr9cgNZYywYmafaH9ipZ4dlD9xkRvIcYLU1ToNfrO
         vRJBr62Mb/DbaP851UEBxWXU2Twz0MrYudDEhqQfIPA5GYFDLyziebhWjqew4507BFuA
         DzBN2uwp2Fug0J34HYRYYirxGWu5MigwvpSEE9qR0B3A5V8smRgOAE2uFz7wae+kQBy4
         uZ6g==
X-Gm-Message-State: ACgBeo0EHabfUUAJUq98IwGJoP5Pw1J0Y1nvDiIbIzz6F00syt8ggFwW
	cIPJ/9wDVSUVcMmh5wB5aVAx4A==
X-Google-Smtp-Source: AA6agR6wFV+N0b3bXUosUXzcWeejtIfnveQRomEYoZKiiyARyOk63eGmbSedst884SDdeCKlg7MwKw==
X-Received: by 2002:a17:902:a58c:b0:174:3c97:d9a1 with SMTP id az12-20020a170902a58c00b001743c97d9a1mr13616616plb.22.1661754129647;
        Sun, 28 Aug 2022 23:22:09 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id mp10-20020a17090b190a00b001f333fab3d6sm5817972pjb.18.2022.08.28.23.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 23:22:09 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 0/3] Rename sifive L2 cache to sifive CCACHE
Date: Mon, 29 Aug 2022 06:21:59 +0000
Message-Id: <20220829062202.3287-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_232213_304734_11EAC422 
X-CRM114-Status: UNSURE (   7.77  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Since composible cache may be L3 cache if private L2 cache exists, we
should use its original name "composible cache" to prevent confusion.

This patchset contains the modification which is related to ccache, such
as DT binding and EDAC driver.

Greentime Hu (1):
  soc: sifive: l2 cache: Rename SiFive L2 cache to composible cache.

Zong Li (2):
  dt-bindings: sifive-ccache: rename SiFive L2 cache to composible cache
  EDAC/sifive: use sifive_ccache instead of sifive_l2

 ...ifive-l2-cache.yaml => sifive-ccache.yaml} |   6 +-
 drivers/edac/Kconfig                          |   2 +-
 drivers/edac/sifive_edac.c                    |  12 +-
 drivers/soc/sifive/Kconfig                    |   7 +-
 drivers/soc/sifive/Makefile                   |   2 +-
 drivers/soc/sifive/sifive_ccache.c            | 221 ++++++++++++++++
 drivers/soc/sifive/sifive_l2_cache.c          | 237 ------------------
 include/soc/sifive/sifive_ccache.h            |  16 ++
 include/soc/sifive/sifive_l2_cache.h          |  16 --
 9 files changed, 253 insertions(+), 266 deletions(-)
 rename Documentation/devicetree/bindings/riscv/{sifive-l2-cache.yaml => sifive-ccache.yaml} (92%)
 create mode 100644 drivers/soc/sifive/sifive_ccache.c
 delete mode 100644 drivers/soc/sifive/sifive_l2_cache.c
 create mode 100644 include/soc/sifive/sifive_ccache.h
 delete mode 100644 include/soc/sifive/sifive_l2_cache.h

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
