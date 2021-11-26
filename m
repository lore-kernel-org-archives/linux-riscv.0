Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3AAC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 19:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+P5h7MjC3Zlhnvbqe5UmLNuag6n4elHaYMSddMw28ow=; b=xrf8Vxu8xgvDRQ
	SLnKyT3S8z+bXmmuwRP4KFsGTCMSXUxMIXN8XODKHnFeG4X2+RC/J49uFFln8sOHljogkzW4QRRJE
	IkJjYJ3fgvgjo+D+40G/jvChcx4Cl5epcT3C0d1zdixMAZcVeT9/kZBQkVhV/5aQl9lnMsNeSbDoV
	cvmYpVNrP/OZeWBnsB6D6iT53OUlgcSYqZ8JtzN9ZNKiomQICuNIKGT9HqohKFN30ipO6ocmIXTjg
	ctiiqUqazfdfAvNhjj28ElqPkLjhc8mdHf91/X0BIWxsKo84UZoxlm1PBw2bhwn4imVP/y1Ae94GW
	CwNNtKa7OzhKroak8uUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqgwQ-00Bc1c-3G; Fri, 26 Nov 2021 19:31:26 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqgwN-00Bc14-Jy
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 19:31:25 +0000
Received: by mail-ot1-x32c.google.com with SMTP id
 35-20020a9d08a6000000b00579cd5e605eso15404002otf.0
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 11:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6wv3BLho2y9EtK0wC9Saxjj7vsHzwleZn1+op7zj3BY=;
 b=YmZLYl4ZN+yyneLk+PL9l5sy1QMXJK3rtr4xmEguYxpFd5X4Bb8GaAeO/nGt2gdq65
 9uRFRh7BpLy7rSzZdhFzJdSRdHw1X0hOcrV/OCpAifKju7FT3PlG1EgjbJvtaBhp4/ot
 PZGLAXhd+7DVbyrBpA86VYpRC4SwU6c2w+gfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6wv3BLho2y9EtK0wC9Saxjj7vsHzwleZn1+op7zj3BY=;
 b=t6BnaP9f80P01dfUHj53fUG3W4tr354LGKIMV13UqWC8TsKFgHZERkdU+kuXux/ln0
 z7Erm3wH5yxreEFztosozuig21b1Z2pdQdnU8Vt/WBep3U9w9k6g6yegmV7NZQK/BB8t
 Ldd32AQhONPgheXPb8GNq7vIOzdUGECb4VWcFO/eGqqly9+qYT4f+RxPU7CcXUKURwJ9
 zdRmJzdcDPhyFOVJRv7s/PPIdTAQZiVUY8DDR4WY2XFQRW/wdW/nQy3uvXGYIz+d/mOr
 aSiN8ER2LivpVZvR3epHU7RasAYdPRXmJMdqBD+ggqa3yxdCJmmEbWhKaAWxhqlpsucb
 lTtw==
X-Gm-Message-State: AOAM530/2Gh43c8tWrSlsaq1xlvkieaSUli7Sl1DTi0SL+sbIIVF3dKF
 FAOJ+Uqxeok6Xg1JcBldT23r
X-Google-Smtp-Source: ABdhPJzr9FQVd//p1Zquq46d7N7KNXi9mBpDiHY+TqCDu3EFaH1k8Fip7XgsOH53/7uWyRVm1FbJig==
X-Received: by 2002:a9d:7d04:: with SMTP id v4mr30740597otn.180.1637955082042; 
 Fri, 26 Nov 2021 11:31:22 -0800 (PST)
Received: from fedora.. (99-13-229-45.lightspeed.snjsca.sbcglobal.net.
 [99.13.229.45])
 by smtp.gmail.com with ESMTPSA id w22sm1110562ooc.47.2021.11.26.11.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 11:31:21 -0800 (PST)
From: Atish Patra <atishp@atishpatra.org>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@atishpatra.org>, anup.patel@wdc.com,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v2] MAINTAINERS: Update Atish's email address
Date: Fri, 26 Nov 2021 11:31:11 -0800
Message-Id: <20211126193111.559874-1-atishp@atishpatra.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_113123_875588_A7D16505 
X-CRM114-Status: UNSURE (   9.00  )
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

I am no longer employed by western digital. Update my email address to
personal one and add entries to .mailmap as well.

Signed-off-by: Atish Patra <atishp@atishpatra.org>
---
 .mailmap    | 3 +++
 MAINTAINERS | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 14314e3c5d5e..5878de9783e4 100644
--- a/.mailmap
+++ b/.mailmap
@@ -50,6 +50,9 @@ Archit Taneja <archit@ti.com>
 Ard Biesheuvel <ardb@kernel.org> <ard.biesheuvel@linaro.org>
 Arnaud Patard <arnaud.patard@rtp-net.org>
 Arnd Bergmann <arnd@arndb.de>
+Atish Patra <atish.patra@wdc.com>
+Atish Patra <atishp@atishpatra.org>
+Atish Patra <atishp@rivosinc.com>
 Axel Dyks <xl@xlsigned.net>
 Axel Lin <axel.lin@gmail.com>
 Bart Van Assche <bvanassche@acm.org> <bart.vanassche@sandisk.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 7a2345ce8521..b22af4edcd08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10434,7 +10434,7 @@ F:	arch/powerpc/kvm/
 
 KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
 M:	Anup Patel <anup.patel@wdc.com>
-R:	Atish Patra <atish.patra@wdc.com>
+R:	Atish Patra <atishp@atishpatra.org>
 L:	kvm@vger.kernel.org
 L:	kvm-riscv@lists.infradead.org
 L:	linux-riscv@lists.infradead.org
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
