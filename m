Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C519CA5FAB
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 23:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mNJ9EQTb9EhZSRLIfFhsexjG/9vlXpvQd7QC1CJS9lA=; b=HtUPsLyWEBQF2x
	xLa35h7UcYukaSvf+0rtX3duk8+8RGN3swEibOs/LCzPV1HEkhhuL/FGECEvlijhV/xS8jcxwC2VK
	cmBolCjugxT08WZdH1Nt6KPyJwOvzhg3u23Ga/ASETzzQe/gO7NlsIEL4wwzV+Wo6622srQf4eduo
	GvOpJVKVfRJtKQayS40nx1Yg0LwM3acJPuKjofHn+Jdd6God2gs3YXkUvQRuUIgit+2aEDyzMq3Db
	Zjuf+qQXLWQkH5yI/keY+Zyz/U/P9aTcpxU0hrk3sVJpU0pfi/rfXaXJgnWRo+v2OB4VE0dU3e65T
	FRAYoHDMffsnJVlmWHLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBKem-00000001rOa-43Xg;
	Mon, 28 Sep 2026 23:21:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBKek-00000001rNF-01W0
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 23:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790637667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4bDunkmKzxTEgKxBi/DaPG7+roKleuHpKwgE8PS3EY8=;
	b=eVsgI7gEDIEmI/1fIUFBfRCecYUatD8BHgZRmoWEyVDUq7tQ2NV9xFKVgU0O8DwC9jjdMe
	Wbct7p5bZs2osz68nHkP9pXfghKw54TIXMFFpIqwU1vmz8nPSPc0Ut3hkrj49WntDcIZON
	jVMnuTy4A9qKU5CKha2B1P32fd6HYZU=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-AZES7r52MDalx8McFfe2LA-1; Mon, 28 Sep 2026 19:19:35 -0400
X-MC-Unique: AZES7r52MDalx8McFfe2LA-1
X-Mimecast-MFC-AGG-ID: AZES7r52MDalx8McFfe2LA_1790637575
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66f8ab159abso1876574d50.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 16:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637575; x=1791242375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4bDunkmKzxTEgKxBi/DaPG7+roKleuHpKwgE8PS3EY8=;
        b=SBO5Mp042pUIvmyscfOR8sJAQ/D8bYtPwY6prPgX9rnhEQSMN13jVbqAFEdVNKDtAz
         jbcb6AlxNdgKyI2PZS2vPyYGbgUJmop0EW7Su1mVsgHsl5ocWdERvEDXuPTz5rg98VRZ
         3+OXsSrGSIgJ2o4KuKJjXDvwBRrPokCPsAF+MDjb7gvR8OHeRzFEEPVdpcLfkghCCTaq
         Qd9VwuWWA3O3mbKiljyq616VRVdWijhMMBpbc7/bbs+ziSFAGzJEd/Hy+cuCTzZZRm/K
         nMxUKYXgQY2Ro14zIpLXkFjjRCs9s0qW0XSScxfKCSv3LI38vlu0MX4iiAk8QgtVLNbR
         WpsA==
X-Forwarded-Encrypted: i=1; AKwUvByxvCZJYsf/Bqq9uB63lcsNmmum+yPNmEIz0t+ao3v1bhIpYOkIukjfnFwZXKVpIfl50E6RfPk9uiEzxA==@lists.infradead.org
X-Gm-Message-State: AFq9FYI4DS/O4d5pcDCVCZegP6T/L9q8xRu3LHUdtuUR4lfdWQjEZeRL
	nzPLaXQx9JhYQ3BOv7CCnTswbXGpdqFuJoDW6I2BiXzX2pQMtogBJ4JilibQSxI5/e54eoR/Cfw
	mfytKcsT0hI9Yl9sxLjJU0XTimH21zGnKuW9Nif610v1Vm2g87L1kvLZej8+Iu36sqa9idg==
X-Gm-Gg: AYBFou3ngQzw4XxxOgNJluTiP1+5Q9tgyKjvIfxC4Dc+25PcEsBxEZfJCM+t3L2lLn2
	EtrG+N5EAavx+dXe1ELd4nZK/BWBH8lff38KtKUaCu2R3D3HY0/BRxDS0vOOxoEZH8+sVDqF4r3
	KOhPb+b3OVfwSjgigWrqfk2IvV5ycSMnJREhH2ZuwmqxGKc8FG8S0sUhX+WjRhwBfUMPrWM5/PS
	mlHcUJneiCrs2ZuxXTuqcJqKA3xhRHStAYMfAPLTFmLjQ0WfuBzajkZD1xORA+RaK+ftK5QQ37Z
	iCl0JRUx+MDOXbDZXAdjM/jBJ64GfJve2He/SLPDsVkntRx0aicsEg==
X-Received: by 2002:a05:690c:3181:b0:8a8:889d:2ea with SMTP id 00721157ae682-8ab3b5249c4mr5722517b3.48.1790637575113;
        Mon, 28 Sep 2026 16:19:35 -0700 (PDT)
X-Received: by 2002:a05:690c:3181:b0:8a8:889d:2ea with SMTP id 00721157ae682-8ab3b5249c4mr5722437b3.48.1790637574673;
        Mon, 28 Sep 2026 16:19:34 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f9cdb0sm51374117b3.24.2026.09.28.16.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:19:34 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 1/4] riscv: dts: spacemit: k3-com260: keep dldo4 enabled
Date: Mon, 28 Sep 2026 19:18:04 -0400
Message-ID: <20260928231807.1757995-2-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928231807.1757995-1-jberring@redhat.com>
References: <20260928231807.1757995-1-jberring@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aOPHJgFCijON_95hSbBGsTWWw5A4lLDeYiD96J0ttIU_1790637575
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_162110_128898_16F917D6 
X-CRM114-Status: GOOD (  10.06  )
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

From: James Morris <jmorris@namei.org>

dldo4 on the P1 PMIC is marked regulator-boot-on, but has no consumer
described in the device tree. The regulator core can therefore disable
the firmware-enabled rail during unused-regulator cleanup.

Enabling pcie4_rc on a K3 CoM260 Dev Kit without this change while the
board's included RTL8852BE module is connected to the M.2 E-key slot
results in CPU hard-lock, as seen in kernel log:

[   32.521536] dldo4: disabling
[   48.125823] watchdog: CPU3: Watchdog detected hard LOCKUP on cpu 4
[   64.125829] watchdog: BUG: soft lockup - CPU#1 stuck for 26s!
[   64.125926] Hardware name: SpacemiT K3 CoM260 IFX (DT)
[   64.125928] epc : smp_call_function_many_cond+0x158/0x740
[   64.125938]  ra : smp_call_function_many_cond+0x11a/0x740

GitHub Copilot assisted with diagnosis and build and test automation, and
changelog drafting.

Fixes: cfe5c91cb73c ("riscv: dts: spacemit: k3: Initial support for CoM260-IFX board")
Assisted-by: GitHub-Copilot:gpt-sol-5.6
Signed-off-by: James Morris <jmorris@namei.org> (Microsoft)
Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index 92dea86397798..054bfff7413a3 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -187,6 +187,7 @@ dldo3: dldo3 {
 			dldo4: dldo4 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
 				regulator-boot-on;
 			};
 
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
