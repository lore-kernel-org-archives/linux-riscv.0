Return-Path: <SRS0=1Rer=6F=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4421C2BA19
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2020 08:18:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82C762073A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2020 08:18:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XLpZvERa";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="cj0aBop9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82C762073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qCOK+HxEBj2bh5BFlG2zt/46BhY0DW9NF3gypZJ6i18=; b=XLpZvERakU08v8
	ODtZRXNHwfXVUjTCcOjQdy3KyVu9JXSkl0TYjnWjcjwya8kZbHFi1pjy7t8a2OyG/gBuV9pkGpeXE
	Sdmh6PbrZgQK3lzb7m/VmfupjCcnBNSfZNQ6AAGvtGD10v5Jfg/aJOvdh0g43UzVmiXBl08HCZ5de
	8Us7zfnDDtr/NEyAOAXyqCvZG+TKQcYLEv+aJCYerWcm1Tt9SgyZOYNYQCkGW+jwPbakJ785o6l7n
	B3kciFgnXvO6FPUFH5ID/d0gbn0jwJQtiOb4+GPdaGWeG8jozMa4j3A1J4Ye2ytoefJ+sO6kHxjQU
	yVdGGRPnUoppyXgP1htA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQo6Y-0007zX-KR; Tue, 21 Apr 2020 08:18:06 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQo5x-0007Sv-DC
 for linux-riscv@lists.infradead.org; Tue, 21 Apr 2020 08:17:30 +0000
Received: by mail-pf1-x443.google.com with SMTP id b8so6278368pfp.8
 for <linux-riscv@lists.infradead.org>; Tue, 21 Apr 2020 01:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qCOK+HxEBj2bh5BFlG2zt/46BhY0DW9NF3gypZJ6i18=;
 b=cj0aBop907dm+mkl5z5Mfm3dfJHK382iyGGadBdhXTU4SezE2MCsVNmjWKHydO1MeY
 hFpq9McPFpfy4rmx7G+Ad1j8hWL2TnkmF0IkMCtKAGmpU+zQZ6aqaTdmOppP8E8jMoFd
 Fk88jdQI+8R4LkqajRqwVMi8EwnmwqLx6QnbQ8a9F0T2Mu69VHyd9ana73iFO3tfR1QY
 WOG8lsevniXIBle/Wpw32M1HPnUM/cXVhVfyULOzUIUxNwMYRjXLGcKHakrVVhIkdCst
 HcA/EUYHskjCRFk4RGeoZHsmrSkm/oL6EadoBmaeDy9n6/Ei3y51wlw/4DW50BwDLHDj
 41mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qCOK+HxEBj2bh5BFlG2zt/46BhY0DW9NF3gypZJ6i18=;
 b=nMptsqhvBactgZf6Ine5lMYuLJ1lhHTWjMwnLbCLOJnqq9hgcgaClNGcRhqOe6ZGEZ
 SwRzN7MxM87WfFhd9QYFI59FwE+9G7+Gu0pUo3rCA5DMMaTl76EtQLxDAtQpVE+F4LVs
 KA6wHYl7cr/IPGt98DY4LhyNmKZZHrhi0zGF/Xc3IR1jxXwP8LZENwqw9UJ02NUQFFK3
 5t/GYXIGfzXH5mVRjORRkt4H/E4jkH+05puZreRLPOeBpU8mcRyt8tIZ4ZTf8jMz+qqQ
 p87ff4JNCbNzwiCWtdCT2ElE1wNmRM5kcFNfKG3/5rNKN1Q290r1sgk5qj0HcA3w3fu8
 OMbQ==
X-Gm-Message-State: AGi0PuaJWAndIMcitZAoY1y9C4Rg5nNA52gIr1VTpkO+fc0F8EKH11C5
 yNkl9teDT9qRvHL8Un6AoIIlaw==
X-Google-Smtp-Source: APiQypLl5oCj7vFGv7zZNaxGJsgDSRmBearvlFa0TCQKMUrRrSskifrV8HFOIzfmSxRHB+7OBiCjMA==
X-Received: by 2002:a62:18c8:: with SMTP id 191mr21232603pfy.255.1587457048276; 
 Tue, 21 Apr 2020 01:17:28 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id v9sm1610067pju.3.2020.04.21.01.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 01:17:27 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, x86@kernel.org, hpa@zytor.com, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] mm: add DEBUG_WX support
Date: Tue, 21 Apr 2020 16:17:12 +0800
Message-Id: <23980cd0f0e5d79e24a92169116407c75bcc650d.1587455584.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <cover.1587455584.git.zong.li@sifive.com>
References: <cover.1587455584.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_011729_462522_C94330A6 
X-CRM114-Status: GOOD (  10.43  )
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
Cc: Zong Li <zong.li@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Some architectures support DEBUG_WX function, it's verbatim from each
others. Extract to mm/Kconfig.debug for shared use.

Signed-off-by: Zong Li <zong.li@sifive.com>
Suggested-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 mm/Kconfig.debug | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
index 0271b22e063f..077458ad968d 100644
--- a/mm/Kconfig.debug
+++ b/mm/Kconfig.debug
@@ -118,6 +118,39 @@ config DEBUG_RODATA_TEST
     ---help---
       This option enables a testcase for the setting rodata read-only.
 
+config ARCH_HAS_DEBUG_WX
+	bool
+
+config DEBUG_WX
+	bool "Warn on W+X mappings at boot"
+	depends on ARCH_HAS_DEBUG_WX
+	select PTDUMP_CORE
+	help
+	  Generate a warning if any W+X mappings are found at boot.
+
+	  This is useful for discovering cases where the kernel is leaving
+	  W+X mappings after applying NX, as such mappings are a security risk.
+	  This check also includes UXN, which should be set on all kernel
+	  mappings.
+
+	  Look for a message in dmesg output like this:
+
+	    <arch>/mm: Checked W+X mappings: passed, no W+X pages found.
+
+	  or like this, if the check failed:
+
+	    <arch>/mm: Checked W+X mappings: failed, <N> W+X pages found.
+
+	  Note that even if the check fails, your kernel is possibly
+	  still fine, as W+X mappings are not a security hole in
+	  themselves, what they do is that they make the exploitation
+	  of other unfixed kernel bugs easier.
+
+	  There is no runtime or memory usage effect of this option
+	  once the kernel has booted up - it's a one time check.
+
+	  If in doubt, say "Y".
+
 config GENERIC_PTDUMP
 	bool
 
-- 
2.26.1


