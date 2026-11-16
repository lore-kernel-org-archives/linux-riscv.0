Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC89606A883
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 08:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=otnrugdn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=rFAVqFjH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Mime-Version:
	Subject:Message-Id:From:Date:Cc:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uRepREjclk9zzjHSNDeK6FUowf9IMHy0EpK/Qf21fEA=; b=otnrugdnSlYd6AyVMKo1Bk/snw
	YpVdnJbeXdVmWi462eBIEnevqBWhpkENyLA64Fl6FonOUWyCQ25SMGP7pX42pzPJW22lIeDnsMEQu
	MszkU6JJNBVm+mN81fjxauuqGXbMfn/qHDKXCsTH+dHktlfHipiq6gmk3eBoXPl2CiRPQeQ/P245q
	67/EWAXBUxgX/88MxCsp5wpCYOYK6rybG+TqsnAlucFaa7yl6SEUHsp5ZN+I2oH4oX1Pmn9NVFqho
	b3ZkO8KlkmvEYpHd+mXAjfB57fuilJ9o/DKsAl0+DeORvyIWQAftaklCMCM7wAtLBjeqcT6KmYFYG
	T9QABDEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsYf-00000001h0O-4ASS;
	Mon, 16 Nov 2026 08:59:25 +0000
Received: from va-2-39.ptr.blmpb.com ([209.127.231.39])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsYd-00000001gzf-1fTm
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 08:59:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794819558;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=p4DpLO4bTnuVUXS4e/jXglOT3Dz6s8obdebqkuUomVs=;
 b=rFAVqFjH+7l58QG4x0f4bERb85yghQzn75dTcd1eLvmuGc1z45eXB6TOqb9UzNLYQIREGW
 u1rIAbNkpNDZlm4wqRMk2/K/YW8CDD/FfM3TiOfupd9PkfeaS2d3DcmxJygZegQ/XfGin3
 pguU4KbLMC118rQaDhx/UdxR+a1quL28KHfq8Q4L6w2rV3Y/U30NgZBZNFsXKmLKN6ytYq
 uZ05CCbVK84H1SD0b1Oy126AUBv2WHa/6OcVakpY0EcffeYtNRBVPq0MkGJdwWQxHXfxip
 Qf0x2R/t1yJ3vWstuZw4jfKglIGY8h3uvLIguyU6AOEsNx2+SQSqSJ4MDxNA3w==
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Mon, 16 Nov 2026 16:59:06 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Message-Id: <20261116085906.951287-1-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 16:59:15 +0800
X-Lms-Return-Path: <lba+26afac5e4+8d36c3+lists.infradead.org+sandie.cao@deepcomputing.io>
Subject: [PATCH 2/5] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add rfkill node for WLAN
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
In-Reply-To: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
References: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_005923_525124_4101FE46 
X-CRM114-Status: UNSURE (   5.45  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expose the WLAN enable signal of the FML13V05 as an rfkill-gpio
device so the WLAN driver or userspace can toggle it, following the
K3 Pico-ITX board.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 804a9e64cf6e..f84225cda1e9 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -30,6 +30,13 @@ reg_aux_vcc5v: regulator-aux-vcc5v {
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 	};
+
+	rfkill-pcie-wlan {
+		compatible = "rfkill-gpio";
+		label = "rfkill-pcie-wlan";
+		radio-type = "wlan";
+		shutdown-gpios = <&gpio K3_GPIO(35) GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &i2c8 {
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
