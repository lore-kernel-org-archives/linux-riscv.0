Return-Path: <SRS0=TXMU=ZO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D62C432C0
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Nov 2019 22:58:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C96B520714
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Nov 2019 22:58:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kj4+mvev";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="B7JQEyBN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C96B520714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E28fG3lmTfzbLSXj4PKC+hzkgLadL/nyjghzP+GBLBA=; b=Kj4+mvevpX5DP7
	UOCR+dLkxJXuLg0EWVdnLsWiqCYRrrGLfoNQcP9KEPzBWoLfRTqwv0hEV3/4o9+t4DCHrexq6NFXL
	N9O/+dqBLxb0MjwxmzhphcigbIOZCq1KRvQ4mVut6uIxS4tv7DtvZzs2RpLQxRl4RLE4c5H9aYtv2
	CQ++Pc7MYFJPWR8J37dgWO56zJomqtLebxyrZeNzp1v6WzLDyGxWr0CF9Wcq5Vzhq65RV0w5Rezr6
	z7aFY7Oa21bGNXkXpGHdqmLQb6RzpmY7Pqhmn6MFcaRCV0EkLO2L8jkKmDKDjPSF3KXkzps4/W4Ue
	q38AYrp2oKOrCCUOSoAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iYHsJ-0008WH-VF; Fri, 22 Nov 2019 22:58:03 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iYHsG-0008VG-Uz
 for linux-riscv@lists.infradead.org; Fri, 22 Nov 2019 22:58:02 +0000
Received: by mail-io1-xd44.google.com with SMTP id p12so2604372iog.10
 for <linux-riscv@lists.infradead.org>; Fri, 22 Nov 2019 14:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=99kjuSaTfqi/O4G1kyhfKCZh2c7fOK6oatEBRmcILQ8=;
 b=B7JQEyBNYP1GfiTbFxMdlna/NrN43milA+eYIgVGqzaFgJaFpveYCXriOZYZleY7H6
 VDbr0mTRD/N42M7YlMymtYO6USoYJ7dFqsKjdw9+tgexKWfR3Lvnqp5UyBy6THWlOzMy
 WDSWxznb4l3auRftRXKogDP6R6azYkLTvkqtVSDLtrN1/j2tqWhdDKttoGV4qtDtwsRh
 108Gt3dTDkh/k5dG4tliY5bZtluAg/B5JbEEzZB30m/jinBhQNBM9B49A4EGsj9Axov2
 zpjHmv+2uIgcoDaH/RE0qXyZsEv+uCoAcq3MvTwHVX0R6NZwKJpc3EzumA245/PIkexZ
 +gIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=99kjuSaTfqi/O4G1kyhfKCZh2c7fOK6oatEBRmcILQ8=;
 b=Rh5adDJiHLOE6xP1cRX3k5eMkd/BwHFJamCDa93zWrU2RsAdfTdmzP++cKrySQ6ace
 0PNLWawahuBTM/Aoq+UqS9vIIIcKmkQ9SqdPAItjRVi7aNnpIeSLWQ4bLBiLSJCMlVbN
 fjUIICaYMQVXF/MWRCruyZujhSAh1PX7yUoMTVLlvgtL5ALdV1KHd8dctkzXIl34mxEc
 h0RRpk64JwlYj3oxw5E6ey8p0RHwYBfjtbqgjhnWmr3ej8vRH0VrL/BBREeSuYBGIogC
 pNXUUgabg/1HT5Z0bt8HhuedqxfH8kAN978iIh27ppHPAk47USG+jf3Z6gOYqc916p7i
 ktIQ==
X-Gm-Message-State: APjAAAUcwhEdbm1Wu7vURKt4aN2YXz2iGNVgkFTfyQiICDcqJ+AhHnKg
 NnjBCPT+tLIH0gpry7HCICZK14wA+8c=
X-Google-Smtp-Source: APXvYqycb34XtfKRGUpVDlBDfOTeyet9l4IX6fAabGzR//Fr+CRZaoeKUT1/lzsQoErO4Ytb1jHG1A==
X-Received: by 2002:a02:a798:: with SMTP id e24mr660532jaj.77.1574463479845;
 Fri, 22 Nov 2019 14:57:59 -0800 (PST)
Received: from viisi.Home ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id x9sm3277098ilp.43.2019.11.22.14.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 14:57:56 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 2/2] riscv: defconfigs: enable more debugging options
Date: Fri, 22 Nov 2019 14:56:59 -0800
Message-Id: <20191122225659.21876-3-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.24.0.rc0
In-Reply-To: <20191122225659.21876-1-paul.walmsley@sifive.com>
References: <20191122225659.21876-1-paul.walmsley@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191122_145801_000897_46E63B6F 
X-CRM114-Status: UNSURE (   7.32  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Enable more debugging options in the RISC-V defconfigs to help kernel
developers catch problems with patches earlier in the development
cycle.

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
---
 arch/riscv/configs/defconfig      | 23 +++++++++++++++++++++++
 arch/riscv/configs/rv32_defconfig | 23 +++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index f0710d8f50cc..e2ff95cb3390 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -101,4 +101,27 @@ CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_DEV_VIRTIO=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_FS=y
+CONFIG_DEBUG_PAGEALLOC=y
+CONFIG_DEBUG_VM=y
+CONFIG_DEBUG_VM_PGFLAGS=y
+CONFIG_DEBUG_MEMORY_INIT=y
+CONFIG_DEBUG_PER_CPU_MAPS=y
+CONFIG_SOFTLOCKUP_DETECTOR=y
+CONFIG_WQ_WATCHDOG=y
+CONFIG_SCHED_STACK_END_CHECK=y
+CONFIG_DEBUG_TIMEKEEPING=y
+CONFIG_DEBUG_RT_MUTEXES=y
+CONFIG_DEBUG_SPINLOCK=y
+CONFIG_DEBUG_MUTEXES=y
+CONFIG_DEBUG_RWSEMS=y
+CONFIG_DEBUG_ATOMIC_SLEEP=y
+CONFIG_STACKTRACE=y
+CONFIG_DEBUG_LIST=y
+CONFIG_DEBUG_PLIST=y
+CONFIG_DEBUG_SG=y
 # CONFIG_RCU_TRACE is not set
+CONFIG_RCU_EQS_DEBUG=y
+CONFIG_DEBUG_BLOCK_EXT_DEVT=y
+# CONFIG_FTRACE is not set
+# CONFIG_RUNTIME_TESTING_MENU is not set
+CONFIG_MEMTEST=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index bdec58e6c5f7..eb519407c841 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -98,4 +98,27 @@ CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_DEV_VIRTIO=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_FS=y
+CONFIG_DEBUG_PAGEALLOC=y
+CONFIG_DEBUG_VM=y
+CONFIG_DEBUG_VM_PGFLAGS=y
+CONFIG_DEBUG_MEMORY_INIT=y
+CONFIG_DEBUG_PER_CPU_MAPS=y
+CONFIG_SOFTLOCKUP_DETECTOR=y
+CONFIG_WQ_WATCHDOG=y
+CONFIG_SCHED_STACK_END_CHECK=y
+CONFIG_DEBUG_TIMEKEEPING=y
+CONFIG_DEBUG_RT_MUTEXES=y
+CONFIG_DEBUG_SPINLOCK=y
+CONFIG_DEBUG_MUTEXES=y
+CONFIG_DEBUG_RWSEMS=y
+CONFIG_DEBUG_ATOMIC_SLEEP=y
+CONFIG_STACKTRACE=y
+CONFIG_DEBUG_LIST=y
+CONFIG_DEBUG_PLIST=y
+CONFIG_DEBUG_SG=y
 # CONFIG_RCU_TRACE is not set
+CONFIG_RCU_EQS_DEBUG=y
+CONFIG_DEBUG_BLOCK_EXT_DEVT=y
+# CONFIG_FTRACE is not set
+# CONFIG_RUNTIME_TESTING_MENU is not set
+CONFIG_MEMTEST=y
-- 
2.24.0.rc0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
