Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69938C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 09:21:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3985C214AF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 09:21:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P+yFWfO7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="cJdRN6LE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3985C214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ncaVbupID9oLFvsTVC3HUWADG8ZesqUy+/63/nnd6jU=; b=P+yFWfO7Bec3qFfmRqmrhRGZMI
	PkHP5etCpHHXI3OKE+Iq+13RrF/bdCZNulvPmBayuqE4B8ER8xU6krl3kcApcNMpqZdG/mQzxvYSD
	SdIAlk/UZWt2zXJzdGJ94ocZAPAJ6uRK/vTccmKCC2gp5eDKDSI7BBxFdklS8CsM+pDq8XhBzgzqK
	qXgkkQXpDrfWy0zSEBm+heT6uKNmCi0dBymhbA++pIuwea46/bmjJaOYNrca59e7JFL5hAHstAUvk
	SxQZQ0TZOfDgzika/SoidrVvgY4sutKBntaVGslercNHOf8yx9rJw+Wsg0eOzBfMHZ17ZVQg8jSsM
	NKVFRjBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3dbE-00006y-Lq; Tue, 12 Mar 2019 09:21:28 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3dbB-00005v-Bk
 for linux-riscv@lists.infradead.org; Tue, 12 Mar 2019 09:21:26 +0000
Received: by mail-pg1-x544.google.com with SMTP id u9so1347394pgo.7
 for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2019 02:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ia76oeJ0OKOLuTxG9UecPXMwlP9RIrNjBsU3t/vewDk=;
 b=cJdRN6LEpm6O+ZG8lERn/MJMg1Of5WYN3YZ03nrVbS2A97QVfXu5OZP1xNRcK+vbec
 vP/hJhVRusIT0m7sFNREfIPXjovU9XWY94y305GbCVCHj8quVIWeR5Y6DRAJiYkc9C+d
 WSRr7YhOr5UcnMxINxC5qV3nsTAxzJGfpap3jttVdjmRkntk0lNtUljFaxL+UQlU1zA0
 CcLEKXivapOrP+lQwFDoqkNAoJdRrLrNnWXSilx1tp1jyAoWUpxPDDVaGoVjlTAujcq8
 /IsvfmAo5qfFR37Mi9iI/LuTCVfVfAQpksOMd6LB+Ch+Xanl1gEBamBLLZodKyBtdVPA
 I4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ia76oeJ0OKOLuTxG9UecPXMwlP9RIrNjBsU3t/vewDk=;
 b=niwIA9mmFBNZPRKOp+V0i6A/55aBsDEiLjsW1msKAUPKAm8n6nXAa8AegdnqTxGhA+
 oVJlwGHPA2k3yasKrgJsLLKbim4ieJ9y3A1iRlCcWCeCD89GONvpbKxsN7H3g3JsSai9
 UmIEfB+95qW/+jwzChbnZaOPXzeQLUeHQUMqYuUHkQB0m14tTp/IDSorewE1iX2ZhYoN
 ZVr0eVXlGbKJ9+9eiO96Ny3omZSYOfbQd2ifn9iLBgmbcrCmiFk0nGHBlNgZoxGLZAtx
 GZ85braE8xxwbe6EHMxNZ/uTweo02SlZrFcqwHDUFct8gDDq2BRzYzLI5LCeJxNMRpq8
 Bxug==
X-Gm-Message-State: APjAAAVcLZds6iQyppormApK9SN47xIfto5yQ80uHJ5KDY7ial2WyywK
 veEfDp2HE9yVBS+kIdL6R8M/sZVEdNI=
X-Google-Smtp-Source: APXvYqxqKI/904f6aIBRDYiNM+rEFTWxteAeCj2evYcWxsN7yUhpUz3Bj9tzIeTauvZoqc8iyLGtpw==
X-Received: by 2002:a62:3890:: with SMTP id
 f138mr38390720pfa.148.1552382484512; 
 Tue, 12 Mar 2019 02:21:24 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id d86sm17569638pfm.18.2019.03.12.02.21.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 12 Mar 2019 02:21:23 -0700 (PDT)
From: Yash Shah <yash.shah@sifive.com>
To: linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org,
 palmer@sifive.com, paul.walmsley@sifive.com
Subject: [PATCH 1/2] edac: sifive: Add DT documentation for SiFive L2 cache
 Controller
Date: Tue, 12 Mar 2019 14:51:00 +0530
Message-Id: <1552382461-13051-2-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_022125_399194_567B94E8 
X-CRM114-Status: GOOD (  11.11  )
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
 linux-kernel@vger.kernel.org, Yash Shah <yash.shah@sifive.com>,
 robh+dt@kernel.org, bp@alien8.de, mchehab@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

DT documentation for L2 cache controller added.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 .../devicetree/bindings/edac/sifive-edac-l2.txt    | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/sifive-edac-l2.txt

diff --git a/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt b/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
new file mode 100644
index 0000000..abce09f
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
@@ -0,0 +1,31 @@
+SiFive L2 Cache EDAC driver device tree bindings
+-------------------------------------------------
+This driver uses the EDAC framework to report L2 cache controller ECC errors.
+
+- compatible: Should be "sifive,<chip>-ccache" and "sifive,ccache<version>".
+  Supported compatible strings are:
+  "sifive,fu540-c000-ccache" for the SiFive cache controller v0 as integrated
+  onto the SiFive FU540 chip, and "sifive,ccache0" for the SiFive
+  cache controller v0 IP block with no chip integration tweaks.
+  Please refer to sifive-blocks-ip-versioning.txt for details
+
+- interrupts: Must contain 3 entries for FU540 (DirError, DataError, and
+  DataFail signals) or 4 entries for other chips (DirError, DirFail, DataError,
+  and DataFail signals)
+
+- interrupt-parent: Must be core interrupt controller
+
+- reg: Physical base address and size of L2 cache controller registers map
+  A second range can indicate L2 Loosely Integrated Memory
+
+- reg-names: Names for the cells of reg, must contain "control" and "sideband"
+
+Example:
+
+cache-controller@2010000 {
+	compatible = "sifive,fu540-c000-ccache", "sifive,ccache0";
+	interrupt-parent = <&plic>;
+	interrupts = <1 2 3>;
+	reg = <0x0 0x2010000 0x0 0x1000 0x0 0x8000000 0x0 0x2000000>;
+	reg-names = "control", "sideband";
+};
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
