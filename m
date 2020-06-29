Return-Path: <SRS0=q2sy=AK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 384D9C433E4
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 03:19:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0927F2073E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2020 03:19:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qdz9IgiX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="CtUW1G7r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0927F2073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XIt03VCEl05KJaG4M3OFR4VBl2wD/K0LQfIipogxx40=; b=Qdz9IgiXnzpskZKkUDMNTL/2p
	dl0Z+B5haOGOl/TqMg9/isdTR+w2cfZkXNDw1t1rFgZ63W5NuYPNyoEM0HwPpCwcQiDOMoRX0axld
	7D3GFE87cG8kDUhT7Viw3o9prbYM0RMePnw/0S+zf7xOFC8/ugTy3ewyPNYg2BYd+txHGn/+VLN8Y
	8GQNbGLgKmEKkhXMcNtxyI/un+ECIirZLh9mbVpdhU/MvlLkjhUJlWLr/dSfYkR/OMQ2OY+qtZGgL
	aD/FHZNwClV0cPG457b/IaXSBaJbdiVWwq3OBJQSH3dG0X+dpnyGUvNG5vyIcamBqCNTfJVWQrKgB
	pL+m5f6FA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpkKP-000127-C2; Mon, 29 Jun 2020 03:19:29 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpkKM-00011A-Gy
 for linux-riscv@lists.infradead.org; Mon, 29 Jun 2020 03:19:27 +0000
Received: by mail-pj1-x1041.google.com with SMTP id q90so6640833pjh.3
 for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2020 20:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N7ALW83XlMpZ1UNtCe3339z3xtZN1TwIo7hbmM2+bF0=;
 b=CtUW1G7rX1aMx2QF59g+J78Z94tMoXWIIVhLD2JEBHaXi7uvpEv8fC2AsCqzJZTxRC
 JBEfUwTsw5guLXx5y3oAiRFLzMkQM63qumKW1s/Q8XSLd4ghrTWGvoy5HtxDIIiTCIem
 tJ/HQ9UCOCFcjof+pojb95RYUi8143OBVYNLZYzzU8yX1BpAir30Rxi0tJsHVjXcqig+
 zjBsx5ghHMkbDPex+Z59vhpzguaVWEt98LrTeLGL15jHpPAQOkcIRfYoXdjimV0iz0ax
 v7XTQfFQc0XwSBhrxfhVAZRB5dTmWpg0fxg38DTbmxeMaNNX0YrylLRKC6RO/su+v0Ws
 k0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N7ALW83XlMpZ1UNtCe3339z3xtZN1TwIo7hbmM2+bF0=;
 b=SAhwwgYua9Wqe4IDx4xSI9l1/6d1UNLfsaerPTXDp62IWQx7rB3avzz3cV6IVfqgLp
 ljvn0NGJrVzz1MDLR8M5hK+JK4Pvem3p7Q3AjDnUITFjNBry+uJjRARj3mMtN0K3e2CK
 AuzYZ3Uot6jvViTWg1BNLN3IsmMbQxyoUDV33S2UEWmSOHTtct4HWRTVXE7Ozheyox/p
 Q2uBQ9b42B5B6dx+Spp/3DkUok9LMSwBU/o0DZRo+7jxCpadXn5DmvZBuhuX1UuYQptu
 ErI83DKhAEamoJusujzECuHDC+29jgkjfTbEU+RO47TFOXj32GZpdyfsHmhmuJdc6anP
 4TJQ==
X-Gm-Message-State: AOAM530c5QxGWrW/U4YI67cso6nK4nX3KhsTfCdgt5mX7bu+naLrXy8y
 Pyja+1/TNbcuVEpeLiC/dtZlqA==
X-Google-Smtp-Source: ABdhPJwI/FlxEB4eqDmKB/m+/Up3gTbXvrv98xnOr3oTcgypiCSZ3DcqOB2TUerg5zb4ouEh+nnZdw==
X-Received: by 2002:a17:902:b496:: with SMTP id
 y22mr11901540plr.224.1593400763621; 
 Sun, 28 Jun 2020 20:19:23 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id j70sm12876254pfd.208.2020.06.28.20.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 20:19:23 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/6] riscv: dts: sifive: Add DT support for PMU
Date: Mon, 29 Jun 2020 11:19:11 +0800
Message-Id: <b90858e0baa2184d8aeac1a930c6d6882f9cc09f.1593397455.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1593397455.git.zong.li@sifive.com>
References: <cover.1593397455.git.zong.li@sifive.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add performance monitor unit DT node in SiFive Fu540 soc-specific DT
file. This pmu node passes the dtbs_check verification.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 7db861053483..824351fe2a57 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -283,4 +283,17 @@ gpio: gpio@10060000 {
 			status = "disabled";
 		};
 	};
+	pmu {
+		compatible = "riscv,pmu";
+		riscv,width-base-cntr = <64>;
+		riscv,width-event-cntr = <40>;
+		riscv,n-event-cntr = <2>;
+		riscv,hw-event-map = <0x0 0x0
+				      0x1 0x1
+				      0x3 0x0202
+				      0x4 0x4000
+				      0x5 0x2001>;
+		riscv,hw-cache-event-map = <0x010201 0x0102
+					    0x010204 0x0802>;
+	};
 };
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
