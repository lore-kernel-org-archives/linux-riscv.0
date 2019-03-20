Return-Path: <SRS0=bcqy=RX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CF8C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 11:53:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE940218A2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 11:53:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Km++u18+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="aqrgRi2X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE940218A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=htUXQQLwYcJhH8oN5eLCqmEMlyQQb4+0yYjikVYh/A4=; b=Km++u18+dj+CQioclMyhY8JXU1
	MrFF/9RLK5P/1lOuq3p1GhlOfslb1ik62B6nIN3RTVQ2Uw5PiJeshM00eOyhSsaFzFnz3edsO8nt/
	c/COb86w2o+5nD9269suJRFIedGwSXXlA8q7jQo3POM8Eso/5I0pgL4awJi4TtMcjfF4W658qIwkG
	AiDsW3GgcFaUXhBgpNSR8qCk/2wXrlEeOHaZknVW3o7SJi6Xwe+UPi/sHjd6UArPnWg5QrreWB7TR
	ZLECEZt45PiuHD7122iDnS7zbaNqKklmjQufbWrg/SeOR6DO0/UIc1a/NlIJENIgVDSoUVKtBlnAt
	zjRBvuhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Zmz-000484-T0; Wed, 20 Mar 2019 11:53:45 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6Zmx-00047E-Pz
 for linux-riscv@lists.infradead.org; Wed, 20 Mar 2019 11:53:44 +0000
Received: by mail-pf1-x444.google.com with SMTP id c8so1762005pfd.10
 for <linux-riscv@lists.infradead.org>; Wed, 20 Mar 2019 04:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ImPJCN+vsTzjzXErHaf6oGJCBI+1ar28iCl0HZa9VJQ=;
 b=aqrgRi2XiQUISUC2hN202lYS7gbLH0k54i5sP9YK9JMdormsXoYFybNxHb8Ifb83rW
 iS2V7dlDwSJHCpbAEgTWxyb0+Ib6wEgDsFG3qOgI8Axk3xicYpFdhBpMiIU1CAiuIk2l
 Y4CTb3P+9c7azxNbpLkGt+T/kwmi2LsDUSbPuuhqFm/WqClrxiMhurtj2grqXpnOC9mO
 Dug1pVmIKFGywdy6OhOKwEPXCVauQwK0gbSClY4AlZkT9nf1dVKvWYK618h4MWL3sot8
 Lx2Mly41pDxZ/NDL+BjLn37+wFG8mTYwbRZIXjhNtoLN2aQ907nxOdI57o+iyni0tGeV
 MOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ImPJCN+vsTzjzXErHaf6oGJCBI+1ar28iCl0HZa9VJQ=;
 b=TyEqofM2siVYw3CsVMCFVe+WUUsoKpRUpVM3pb3SC6aJz7+5WGcTIjbP6bGoSb5O/0
 ghaEfSaQSfqyKB/qOp2am6nE9+kl38MEjZrkmUiMUdxRPKikxKw7ykqibak4IvsF0klk
 v8kG1AzSdwPiWigY77iIaP0lGLtKALNI84MMOwT9Fc3+UWLY14dqrM+nPhckizffeP+m
 mnTHIuchF926tuLnjUCBHTjewCtumLxEE25jCBSja+nYrHCdXXrU8Yrnvg7OTUu9zgK9
 o3aufAXtTZEuZOTrQXRhSufrYipAvE1bMbEWYEmKW2jOixje0t9E+V2Yey/fMyEHPjv1
 OXDA==
X-Gm-Message-State: APjAAAUvzedlmyy8fURCV6S3pP9Xmj2gVZt3sdnQum58H+kIZNE393EM
 D7pWeRXEe1ZOXAf1pazWuiXzYSmAQRE=
X-Google-Smtp-Source: APXvYqylgTysB+3yhU/KJWubLD4VCZXV5AxUqj+FUcQXvuuCDxz3Ibplyw/B3I9277VuVdluFL/mYQ==
X-Received: by 2002:a17:902:6b08:: with SMTP id
 o8mr30982481plk.105.1553082822850; 
 Wed, 20 Mar 2019 04:53:42 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id u10sm1999435pgr.2.2019.03.20.04.53.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 20 Mar 2019 04:53:41 -0700 (PDT)
From: Yash Shah <yash.shah@sifive.com>
To: linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org,
 palmer@sifive.com, paul.walmsley@sifive.com
Subject: [PATCH 1/2] edac: sifive: Add DT documentation for SiFive EDAC driver
 and subcomponent
Date: Wed, 20 Mar 2019 17:22:07 +0530
Message-Id: <1553082728-9232-2-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553082728-9232-1-git-send-email-yash.shah@sifive.com>
References: <1553082728-9232-1-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_045343_839442_A8F9EF82 
X-CRM114-Status: GOOD (  10.48  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org, bp@alien8.de,
 mchehab@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

DT documentation for EDAC driver added.
DT documentation for subcomponent L2 cache controller also added.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 .../devicetree/bindings/edac/sifive-edac.txt       | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/sifive-edac.txt

diff --git a/Documentation/devicetree/bindings/edac/sifive-edac.txt b/Documentation/devicetree/bindings/edac/sifive-edac.txt
new file mode 100644
index 0000000..c0e3ac7
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/sifive-edac.txt
@@ -0,0 +1,40 @@
+SiFive ECC Manager
+This driver uses the EDAC framework to implement the SiFive ECC Manager.
+
+Required Properties:
+- compatible : Should be "sifive,ecc-manager"
+- #address-cells: must be 2
+- #size-cells: must be 2
+- ranges : standard definition, should translate from local addresses
+
+Subcomponents:
+
+L2 Cache ECC
+Required Properties:
+- compatible: Should be "sifive,<chip>-ccache" and "sifive,ccache<version>".
+  Supported compatible strings are:
+  "sifive,fu540-c000-ccache" for the SiFive cache controller v0 as integrated
+  onto the SiFive FU540 chip, and "sifive,ccache0" for the SiFive
+  cache controller v0 IP block with no chip integration tweaks.
+  Please refer to sifive-blocks-ip-versioning.txt for details
+- interrupt-parent: Must be core interrupt controller
+- interrupts: Must contain 3 entries (DirError, DataError and DataFail signals
+- reg: Physical base address and size of L2 cache controller registers map
+  A second range can indicate L2 Loosely Integrated Memory
+
+Example:
+
+eccmgr: eccmgr {
+	compatible = "sifive,ecc-manager";
+	#address-cells = <2>;
+	#size-cells = <2>;
+	ranges;
+
+	l2-ecc@2010000 {
+		compatible = "sifive,fu540-c000-ccache", "sifive,ccache0";
+		interrupt-parent = <&plic0>;
+		interrupts = <1 2 3>;
+		reg = <0x0 0x2010000 0x0 0x1000 0x0 0x8000000 0x0 0x2000000>;
+	};
+};
+
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
