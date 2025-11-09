Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57D5CCFA1A
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Nov 2025 22:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WAfQ5JjA0mD7t+ovJ7Klu+DDBLxMjMXBP6wBIMtbjoM=; b=XPq0hbwZIROmHbK221CKo7nZo2
	6tHVSw7dVeRbTk0RxSTkPPNVqLqSTpyngNo4NMj9F89s8Js6v2d7vJau/uf5oAivRA6qka3/FW38n
	9tf+bPTy+c/X2OYIiP+aTuET19KsCUE4ACGP6h4mv7Zj+JaKnGsF/cJod1/FXtAA8SQ6wbLbG/zYm
	D8Ybeo4nQgq8AGYFt38e6CbWrlsMy4+M5BKppL41sw9H+7mgni3tURTcjV4y3PycYs1wl7AiaJOMV
	rUqfc73T/dFTRyq74Sbat6WCam19xWK8IJhqr/MniDwRdS3giT7Uw0qpogSluy10NX0J+jn40F56B
	gF9lTKKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDvN-00000004RZ6-3fAl;
	Sun, 09 Nov 2025 22:30:17 +0000
Received: from cornsilk.maple.relay.mailchannels.net ([23.83.214.40])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDvK-00000004RYF-3C6e
	for linux-riscv@lists.infradead.org;
	Sun, 09 Nov 2025 22:30:16 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 0856C180C07;
	Sun, 09 Nov 2025 22:30:14 +0000 (UTC)
Received: from fr-int-smtpout22.hostinger.io (100-121-54-118.trex-nlb.outbound.svc.cluster.local [100.121.54.118])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 91DCB180B51;
	Sun, 09 Nov 2025 22:30:11 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1762727413; a=rsa-sha256;
	cv=none;
	b=v0/fdEO0jwsney5EwKr8+VUwYnhfMf9u2Edl8Q67i681nMTIaI5cc0TTSvJRzXYadnFRl6
	DSmmL/nRkL47wiKNoFd7vnS6clOrwWqLgKSxRYhb7jnjvNhNRrh+5Wp0Cl3QFN/YQGyIcO
	pxEGZGU3FZKMbS0VD1k3NWt7LBy2PM0UB3J+jBmrX+InDUqMKP4zb41FzkLmP6Qbk1x1Bb
	mIsSa82knRzwSFk318FL4Ak+K+ZiRWoAwMyLlS4L1LbT5ZkwdgbPyQXxfUAr71XdrwH+bk
	oyBhgRvQZ1O04IUdAQHD/AxrKP1zRQ9pygJ3uWxoZvG385eC8b7+nDVj1IvdMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1762727413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=lMMDZRDGGpEBuRYV24hp6KfsDILOWOPCJ715ewD0GOI=;
	b=aDhE2iV3Mvzo0DqpT914aBMkSE65qOOw9O0JN8k7BzDMAFjEn+ot9ahfhqdvgPgU58iNy+
	tqnDzZp3sheXGsbpG9+Ps4BqjWRpJLdVgnDEFjHhjKX/2YoxKg7Z17X3EvfbJpopzJruGO
	IWyKYQ3ZPffKPz9KM/RZeyFmIEuFeCrf9QcLLQIqcM15eOGWjusPtBBtCidz8zxNOcrTRn
	I6xLq1j0Y+t1enH7w0P7heLaDcFuNs5FaepHWNOCVWf1rbdU8pmb91ZnTpAssrZQE6WSAV
	9RusVOKnvX/jU0SWbv+fk4+FrfPaCLKqybYNrXcFkSideSAJIHYBB+8hWdREOQ==
ARC-Authentication-Results: i=1;
	rspamd-768b565cdb-8jqbh;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Print-Coil: 6b41a3097df5bd0d_1762727413938_3700687853
X-MC-Loop-Signature: 1762727413938:2777145993
X-MC-Ingress-Time: 1762727413938
Received: from fr-int-smtpout22.hostinger.io (fr-int-smtpout22.hostinger.io
 [148.222.54.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.121.54.118 (trex/7.1.3);
	Sun, 09 Nov 2025 22:30:13 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:6854:e5c6:92e9:8517])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4d4SD13R28zyVB;
	Sun,  9 Nov 2025 22:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1762727409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lMMDZRDGGpEBuRYV24hp6KfsDILOWOPCJ715ewD0GOI=;
	b=p3KOSZIiyvC6q2bDLUNZ6Z4mm+WuOaEA+2AqZT93a4cli8wFETt5PwZL5QK0YQVv2bAs4Q
	FO3zdRz6OZ4lG8WFBuhs5d4v6TXwVtvTdn2dOCIcP+JWefGp49p8ljcVkT4xbKhNuGgpVE
	CQ8jJHmLF9S7IaK40+lKi8C/VdYoaX6MoAmS3wXeB0/LB6ikb6EiWfP73Tlk9vocbg2aWG
	0mixNwwWJIDPdX+xphBJMzVEvN2aMQ8NunMKOfrIKHgTWfT4EBZQS5aTRdRVzLE/qrnHin
	KSSYKUtdM0EPsi1XTfY1z/Fm+LpvJXnL58PasUmhBrS5sMQtweSvUDXS3WUgQw==
From: michael.opdenacker@rootcommit.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] riscv: dts: spacemit: add Gigabit Ethernet and PDMA to OrangePi R2S
Message-ID: <20251109222858.3085488-4-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251109222858.3085488-1-michael.opdenacker@rootcommit.com>
References: <20251109222858.3085488-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Sun,  9 Nov 2025 22:30:09 +0000 (UTC)
X-CM-Envelope: MS4xfArM56kEnyOUB4CkV1Zq92++CESYar+YPFTqQjUETC8mhwT0g5lSKIXEsshMGeqE7tGhVqC6cMoQwS3eeDjq1AjGyRX67NexJ/6kD+YaQaZtoN0Xkx26 XVdn9WvMHQ1tlEziuimLAnQSQ73uu3wR030fUMh/IAOS8F+Rd0H8bcYsVTGyzNnrNWgjlbUEXwMRMMvgECYItYxRfhnpPVwzf8ABsxKCEsQEocNomrw8KMU3 7T1hIE2Y8VBp8aAgS0iRiX19PrSEz5puU75kefDGkGYGr56XchriwhBt8s5K824GYLvDrg/BzRArI28heuGPPxtBLBGfMkfsIcHobfJ96iGUtCPr9JiloGLU 0UmabrJQGj1sFNm0f/7vv2xLmCNAQOzpSRDTmMB4soLu6zOZdWxImhLdnCcSjRI5nrWC+wX8GMxevCaQOcECsjk/QDLeBCMdW0sV2pl3PqTu9ie5QwaH6KF7 ePYehagWI0+nlJcKXhE3IMxbVYeoWzqPxtNggrCVY61WPySGrReXB8u65OBlWqHNTNRPQca0O7GmEpa2q/xie86z8jsXR9AWmqsolhAeIgkYQyZbf4vEek6S x3/idIl+OQKCl+5HlANUDRdSL/o4oWWDLHDAttfjHuNJYD0qa0IhODqVZT+SlYA34244Mp/qweuE1uYlXVeO+qdJ2X4GHM+HueAZne3tb+fO3A==
X-CM-Analysis: v=2.4 cv=DJTd4DNb c=1 sm=1 tr=0 ts=691115f1 a=9hvhlO9olek7/vweJUpOAg==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=1SozR2x5KYA1SUCAoLIA:9 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_143014_974403_C8827673 
X-CRM114-Status: UNSURE (   8.23  )
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

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

The OrangePi R2S board includes two RGMII ethernet ports
supporting Gigabit Ethernet operation.

They have an external Motorcomm YT8531C PHY attached,
the PHY uses GPIO for reset pin control. Their description
was reused from the DTS from the OrangePi RV2 board.

Enable PDMA for the SpacemiT K1-based SoC.

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>

---

tests on eth0
-------------

root@orangepi-rv2-mainline:~# iperf3 -c 172.24.0.1
Connecting to host 172.24.0.1, port 5201
[ 5] local 172.24.0.2 port 51354 connected to 172.24.0.1 port 5201
[ ID] Interval Transfer Bitrate Retr Cwnd
[ 5] 0.00-1.00 sec 113 MBytes 947 Mbits/sec 0 395 KBytes
[ 5] 1.00-2.00 sec 113 MBytes 945 Mbits/sec 0 395 KBytes
[ 5] 2.00-3.00 sec 112 MBytes 936 Mbits/sec 0 395 KBytes
[ 5] 3.00-4.00 sec 112 MBytes 942 Mbits/sec 0 395 KBytes
[ 5] 4.00-5.00 sec 112 MBytes 941 Mbits/sec 0 395 KBytes
[ 5] 5.00-6.00 sec 112 MBytes 940 Mbits/sec 0 409 KBytes
[ 5] 6.00-7.00 sec 113 MBytes 948 Mbits/sec 0 409 KBytes
[ 5] 7.00-8.00 sec 112 MBytes 940 Mbits/sec 0 409 KBytes
[ 5] 8.00-9.00 sec 112 MBytes 941 Mbits/sec 0 414 KBytes
[ 5] 9.00-10.03 sec 113 MBytes 919 Mbits/sec 0 414 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval Transfer Bitrate Retr
[ 5] 0.00-10.03 sec 1.10 GBytes 940 Mbits/sec 0 sender
[ 5] 0.00-10.04 sec 1.10 GBytes 939 Mbits/sec receiver

iperf Done.
root@orangepi-rv2-mainline:~# iperf3 -s
-----------------------------------------------------------
Server listening on 5201 (test #1)
-----------------------------------------------------------
Accepted connection from 172.24.0.1, port 38326
[ 5] local 172.24.0.2 port 5201 connected to 172.24.0.1 port 38332
[ ID] Interval Transfer Bitrate
[ 5] 0.00-1.00 sec 112 MBytes 935 Mbits/sec
[ 5] 1.00-2.00 sec 112 MBytes 942 Mbits/sec
[ 5] 2.00-3.00 sec 112 MBytes 941 Mbits/sec
[ 5] 3.00-4.00 sec 112 MBytes 941 Mbits/sec
[ 5] 4.00-5.00 sec 112 MBytes 942 Mbits/sec
[ 5] 5.00-6.00 sec 112 MBytes 942 Mbits/sec
[ 5] 6.00-7.00 sec 112 MBytes 942 Mbits/sec
[ 5] 7.00-8.00 sec 112 MBytes 942 Mbits/sec
[ 5] 8.00-9.00 sec 112 MBytes 941 Mbits/sec
[ 5] 9.00-10.00 sec 112 MBytes 943 Mbits/sec
[ 5] 10.00-10.01 sec 384 KBytes 725 Mbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval Transfer Bitrate
[ 5] 0.00-10.01 sec 1.10 GBytes 941 Mbits/sec receiver

Tests on eth1
------------------

root@orangepi-rv2-mainline:~# iperf3 -c 172.24.0.1
Connecting to host 172.24.0.1, port 5201
[ 5] local 172.24.0.2 port 60564 connected to 172.24.0.1 port 5201
[ ID] Interval Transfer Bitrate Retr Cwnd
[ 5] 0.00-1.00 sec 113 MBytes 947 Mbits/sec 0 423 KBytes
[ 5] 1.00-2.00 sec 113 MBytes 945 Mbits/sec 0 423 KBytes
[ 5] 2.00-3.00 sec 112 MBytes 943 Mbits/sec 0 423 KBytes
[ 5] 3.00-4.00 sec 112 MBytes 938 Mbits/sec 0 423 KBytes
[ 5] 4.00-5.00 sec 112 MBytes 944 Mbits/sec 0 423 KBytes
[ 5] 5.00-6.00 sec 112 MBytes 936 Mbits/sec 0 423 KBytes
[ 5] 6.00-7.00 sec 112 MBytes 943 Mbits/sec 0 423 KBytes
[ 5] 7.00-8.00 sec 112 MBytes 940 Mbits/sec 0 423 KBytes
[ 5] 8.00-9.00 sec 113 MBytes 951 Mbits/sec 0 639 KBytes
[ 5] 9.00-10.01 sec 112 MBytes 934 Mbits/sec 0 639 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval Transfer Bitrate Retr
[ 5] 0.00-10.01 sec 1.10 GBytes 943 Mbits/sec 0 sender
[ 5] 0.00-10.02 sec 1.10 GBytes 940 Mbits/sec receiver

iperf Done.
root@orangepi-rv2-mainline:~# iperf3 -s 172.24.0.1
-----------------------------------------------------------
Server listening on 5201 (test #1)
-----------------------------------------------------------
Accepted connection from 172.24.0.1, port 49628
[ 5] local 172.24.0.2 port 5201 connected to 172.24.0.1 port 49640
[ ID] Interval Transfer Bitrate
[ 5] 0.00-1.00 sec 112 MBytes 934 Mbits/sec
[ 5] 1.00-2.00 sec 112 MBytes 942 Mbits/sec
[ 5] 2.00-3.00 sec 112 MBytes 942 Mbits/sec
[ 5] 3.00-4.00 sec 112 MBytes 942 Mbits/sec
[ 5] 4.00-5.00 sec 112 MBytes 941 Mbits/sec
[ 5] 5.00-6.00 sec 112 MBytes 942 Mbits/sec
[ 5] 6.00-7.00 sec 112 MBytes 942 Mbits/sec
[ 5] 7.00-8.00 sec 112 MBytes 942 Mbits/sec
[ 5] 8.00-9.00 sec 112 MBytes 942 Mbits/sec
[ 5] 9.00-10.00 sec 112 MBytes 941 Mbits/sec
[ 5] 10.00-10.01 sec 640 KBytes 1.14 Gbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval Transfer Bitrate
[ 5] 0.00-10.01 sec 1.10 GBytes 941 Mbits/sec receiver
---
 .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index 902cb6702fbf..a4007a7a1656 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -14,6 +14,8 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		ethernet0 = &eth0;
+		ethernet1 = &eth1;
 	};
 
 	chosen {
@@ -21,6 +23,56 @@ chosen {
 	};
 };
 
+&eth0 {
+	phy-handle = <&rgmii0>;
+	phy-mode = "rgmii-id";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_cfg>;
+	rx-internal-delay-ps = <0>;
+	tx-internal-delay-ps = <0>;
+	status = "okay";
+
+	mdio-bus {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+
+		reset-gpios = <&gpio K1_GPIO(110) GPIO_ACTIVE_LOW>;
+		reset-delay-us = <10000>;
+		reset-post-delay-us = <100000>;
+
+		rgmii0: phy@1 {
+			reg = <0x1>;
+		};
+	};
+};
+
+&eth1 {
+	phy-handle = <&rgmii1>;
+	phy-mode = "rgmii-id";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac1_cfg>;
+	rx-internal-delay-ps = <0>;
+	tx-internal-delay-ps = <250>;
+	status = "okay";
+
+	mdio-bus {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+
+		reset-gpios = <&gpio K1_GPIO(115) GPIO_ACTIVE_LOW>;
+		reset-delay-us = <10000>;
+		reset-post-delay-us = <100000>;
+
+		rgmii1: phy@1 {
+			reg = <0x1>;
+		};
+	};
+};
+
+&pdma {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
