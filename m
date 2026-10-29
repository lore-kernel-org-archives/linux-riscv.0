Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB8C606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 11:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3BytI7GX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=iJp4G4mR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RsjUVQqcpN92yWFRkOqfeqcYRqhO4avnwztaPZ6ZaxQ=; b=3BytI7GXlomylz9luGmeWTeXMb
	FY0F9wK6BC/34A12FbGZeQsicJfvrUcMxOqJhEPuEA3+ycOdg9x1bQ9znbiyPejXpKBGRfxnIM76K
	dHK4gkHty6T4CTJV1C0ZRQR02JwMeS92yjKkhw7A8MOCGUVERpdv5fRp+ueHS0iN0Bm6AhP8cxolQ
	i5dCu4tfzVTy0/4vio+g3oLTbcnZiMXSjFAUJaVCfpKZsKdSirv/QGZiJAKcdYCO3J2ct9BNSo+JU
	04C0zBC8FFFKf1dETYED4p9tMz3GxSedwslPbxm8+N+xpM1vmlSmj9DrgU9Rv6/P2Ie5FydcBFvy2
	E6sPfDYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOe6-000000095Vh-26hV;
	Thu, 29 Oct 2026 11:50:14 +0000
Received: from mail-pj2-x05.google.com ([2607:f8b0:4864:39::5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOe3-000000095UN-3V7K
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 11:50:13 +0000
Received: by mail-pj2-x05.google.com with SMTP id 98e67ed59e1d1-3ae1dca6bc0so850904a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 04:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793274610; x=1793879410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8rCHi1GBk0hKG09zgHxal2DvzYlGptJwEeRT1dMlA18=;
        b=iJp4G4mRONz4Fh9eWKc/ZEBvVv7jM1FSCmaD5nQmU9N62tL1eBXhGuqgl4BQdSeOW2
         DCkSZ9IevLwXbsmcs0ivcVDyw/JP07gP5mGAagAVvGAgrz0GJBpc/Js89D61Y1TqLiOg
         FMS8ZenKel+dt1THf0mXU7yJXDOnMHOkN3wVUFECAosOXVlPLUoiiHwVgrzVjUoPOtRm
         dHm7fX9ky4Ck1KqX5KK4ciwGMVIy16cw/VzQSJFztoB1jh2BIYOb/Zs4Aem/ecUVJQIp
         pSK0yJW540EBOawmyUVXE6vzyEtpz7dLvVgsQ+ZjH5g/3s7vjDYILtUkBXQjaducfhU6
         +A/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793274610; x=1793879410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8rCHi1GBk0hKG09zgHxal2DvzYlGptJwEeRT1dMlA18=;
        b=HmpNMnzRJe+sxYTMl7i1hrhEs6pMzvxqriuOEB3NlNLf9OoGG1Vaywx4tMtjnwpw1D
         hftdh5VB+utgtLepznpWOKAcCeojMEttRMD+CJVPr9zRywGC38YpuhnT+Elf+zwGVcy0
         PsonZ35yn0pPcMNKG1mAOkEkbWFFUz93osVjxktZaQUH7G9uVRv7XVO42VofS0k/gczT
         q8UOE9WX/fgsPzT0LOpp/Nr++5NadnWEFsIEdIByM4gBKP6jFLp0+QXX34NbVn+Ks1Mt
         8WWWbpGkFUEWRGaOZXq4gWeKDnBCPhmlVA5QMEOkGj320e/61m/t4ALM/WdB0sVKrY4f
         pqPA==
X-Forwarded-Encrypted: i=1; AKwUvBzXso1z6eZi7oX5zjPGRiYUB6LYDMh+5AO2P650Demlm8BqaZ45gj6ftWAyO75rcz4sNykt+EvL485dnw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJfRaw8jVXXuNWXN00LEoxyCT1f4HlRBn7CssbT6afK8R2ya97f
	nEl+0B4rvTUFgmfwMWV7h8reeRKWGiiQpWqI1r/bTm7VwU3JWD3b1mglLwT6zB2BHoY=
X-Gm-Gg: AYBFou3hW0gkdbLK/jPGAJITcFG59X2ZuB424t1JYW74SEbyS63J8b209aYNN3do9b/
	4vGxq7GAOySPZVWfmnwjqqBp4oX100cGp5E9j3zDWdtZluUAxyk17Et74BFTopdYmP+xxY2s34Q
	CqTjh/LonPIqeGqdOm+At+bs/nPvEp5mc8nAqmwhlnP9vsAADIwLgjEPm/Sav0GIweY/sf4DsQa
	GqeABsbSrZRPaPEVZ189dAKgVBV+loYAJyB6HQiYr4EvxP/xNjlKroaoe/G+fTiyoKHRkDZ7npO
	zpUx6SYjhF2ZFEwi1q/ItKXreh5gSmObqMG6MRplrfGjoFrDhJ4pqkH34WERc3u+fx8ZxAlODxR
	F3fFX51lWRozfl4vmi1zWKQxOPc4mbxYy8ITWg1goUA+duWn2DliMi/lcUhmFZ7HTlUpM0dC4PD
	+W0JuMmTWIPTp+4Dz0Xp6m9Fs8mwBrg7ovOS4ImeDfEc8g4jzU1gIkVYbWeQ1W3H0t4mVmP3YL2
	+DAYgF87jIsK3siXUUCL6qIcKpyHPcaZs/nU9UtBpmxy4ZWCC/sMLxuplpekMYL3WLPbeTEjuT8
	kf0NE9n0bdZVwF1mfYXChZmR/YWVSxCVFcDBvrr9mYcJdgNHg4KqPbE4AYSB6K1UQH/HgbEUVuX
	1uXDD/Uw=
X-Received: by 2002:a17:90b:3f8c:b0:3a8:9b79:e6ea with SMTP id 98e67ed59e1d1-3ae5835d8a6mr4169699a91.59.1793274610195;
        Thu, 29 Oct 2026 04:50:10 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55d64c0bsm4151053a91.1.2026.10.29.04.49.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 04:50:09 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup.patel@oss.qualcomm.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	yuanzhu@bytedance.com,
	yang.yicong@picoheart.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v12 09/11] MAINTAINERS: add RISC-V SSE maintainers and file coverage
Date: Thu, 29 Oct 2026 19:49:51 +0800
Message-ID: <20261029114953.27453-1-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_045011_883553_4F6C3910 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the RISC-V SSE maintainers and cover the architecture entry,
firmware driver, PMU documentation and selftests in a separate patch,
as requested by Himanshu Chauhan. Also add coverage for RISC-V firmware
drivers and the architecture selftests.

Link: https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.com/

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 MAINTAINERS | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 65e8a4b5c90..f275e9d4847 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23506,6 +23506,7 @@ C:	irc://irc.libera.chat/riscv
 P:	Documentation/arch/riscv/patch-acceptance.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 F:	arch/riscv/
+F:	tools/testing/selftests/riscv/
 N:	riscv
 K:	riscv
 
@@ -23518,6 +23519,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
 F:	Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
 F:	drivers/iommu/riscv/
 
+RISC-V FIRMWARE DRIVERS
+M:	Conor Dooley <conor@kernel.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
+F:	drivers/firmware/riscv/
+
 RISC-V MICROCHIP SUPPORT
 M:	Conor Dooley <conor.dooley@microchip.com>
 M:	Daire McNamara <daire.mcnamara@microchip.com>
@@ -23573,6 +23581,7 @@ M:	Atish Patra <atish.patra@linux.dev>
 R:	Anup Patel <anup@brainfault.org>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
+F:	Documentation/arch/riscv/pmu-sse.rst
 F:	drivers/perf/riscv_pmu.c
 F:	drivers/perf/riscv_pmu_legacy.c
 F:	drivers/perf/riscv_pmu_sbi.c
@@ -23612,6 +23621,19 @@ F:	arch/riscv/boot/dts/spacemit/
 N:	spacemit
 K:	spacemit
 
+RISC-V SUPERVISOR SOFTWARE EVENTS
+M:	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
+M:	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
+R:	Yunhui Cui <cuiyunhui@bytedance.com>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	arch/riscv/include/asm/sse.h
+F:	arch/riscv/kernel/sbi_sse.c
+F:	arch/riscv/kernel/sbi_sse_entry.S
+F:	drivers/firmware/riscv/riscv_sbi_sse.c
+F:	include/linux/riscv_sbi_sse.h
+F:	tools/testing/selftests/riscv/sse/
+
 RISC-V TENSTORRENT SoC SUPPORT
 M:	Drew Fustini <dfustini@oss.tenstorrent.com>
 M:	Joel Stanley <jms@oss.tenstorrent.com>
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
