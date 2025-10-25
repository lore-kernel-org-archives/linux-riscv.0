Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AA0CCF9E3
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 07:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:Message-ID:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MDQ92MVSpXZtZgSSPm8k8o8DwR5QqYq8Po/n7CSXYGQ=; b=TJLykypXUSEOvK
	3NfK7CjPCQA/cu4KSKZtgV11DlwmCyq7B2cALzd9vUHH5Y61xcgvz/WgJwGHPwFOA4E3TiPivpNsf
	o/PM2LHQ/Rigodm7yMpGusunkw2jJnHmNVAlxJAv4DjRNX0NEi3X7qI9E5vXA8hHwHyTIZnWntjFV
	yZEDC5kkz6JYboYSQJ7O2DVUXfPucp496qeaB91pe+hjmg+hdks5eRvNXyrxR4FkQvD8kPjwUDkG0
	FBjgM5yhUSPOgtDb46dbj+boWSBO3iQqMq/YWPD2rLGwrKVC6cBEbfSsO7es9graR/6TQNQ9v5idN
	1HJqmoSfqOyrj7Weq/KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCYxq-0000000B5kA-4B4F;
	Sat, 25 Oct 2025 07:45:27 +0000
Received: from slategray.cherry.relay.mailchannels.net ([23.83.223.169])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCYxn-0000000B5jp-3OCu
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 07:45:25 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id B1E967E09A4;
	Sat, 25 Oct 2025 07:45:20 +0000 (UTC)
Received: from fr-int-smtpout21.hostinger.io (trex-green-9.trex.outbound.svc.cluster.local [100.118.36.55])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id BC3D67E073B;
	Sat, 25 Oct 2025 07:45:19 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761378320; a=rsa-sha256;
	cv=none;
	b=k912f5h8HBWQPgEiHVq/YxkAG40rC1zrjviZ56TLF7uQm4EFJH9+6jyS81uCOsLhlly8qP
	avu1PEk+5yllY9PpVIrdvVjJ409O03dKUrxOvj+UaurHXJ55sPQSBulm3Tba6nMg+922Q7
	tRXhPcdbhkxZXmKXIKVbPf4y4Y+CbfrPd8SI2rJ2+jYzP2cdJxUsgYBJ7d5W32NgRP6lvs
	atebZQ/cEBd5uoum4H66A4OreNQvoL1JVO2viuWxc75ro7D9xPuv/SH/s6kxUsgHcyVEfl
	hrACOvefKgB4pcIpy1f675ZjZyqrJ0TPJ2JiKUg5sOChRvb+xWpTtu1ujKua+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761378320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=yf/KU2rVejUQ3FVC7JwkdlH0KC0lI6UCRu28wq31Ljg=;
	b=obcZVOjpZgMAZc3MBKVgbQ9egnt2Ekk5qjkeGEpGuC+nCvXwCX5P8Si9DgV3fxt825f0Pw
	QZ7rQKszwe3SzgL8Vqbg0c8KS8DCyHY8aFDUGj1HxVCgTjrkbS1evMaa5TX+Pk8ehqb9If
	1535ZP8GsOIwBysYYyX9WCuhrfUjEXyUfSINVDa3Tb16gkVEBnEV/9xQJTCN5jgbDomEhm
	S8HGW9DMZk2H+vCPVt1FoO01taQR9mSMBg2geGb5W0K8co5oQ15rtutmH0FTJEJBlPbKuM
	l4xvBIo0yTR+YI7X1/4b/BhnIa07ZRr06lITorT+mk6P9Ct+cpXhIJIFwodlag==
ARC-Authentication-Results: i=1;
	rspamd-9799b5d46-sdctf;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Unite-Arithmetic: 4c66191c27c7defd_1761378320453_1368303078
X-MC-Loop-Signature: 1761378320452:3529311946
X-MC-Ingress-Time: 1761378320452
Received: from fr-int-smtpout21.hostinger.io (fr-int-smtpout21.hostinger.io
 [148.222.54.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.118.36.55 (trex/7.1.3);
	Sat, 25 Oct 2025 07:45:20 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:8260:6f14:f559:44de])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4ctsHx6VPQz1xn7;
	Sat, 25 Oct 2025 07:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1761378318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yf/KU2rVejUQ3FVC7JwkdlH0KC0lI6UCRu28wq31Ljg=;
	b=TpxG/ySxaiL9bXWcvbiakUBOdSFHiwLeERpYvp4yIUUZw/1J8MXSJT3qKykp9CdiYIxnvH
	wnlecrm7rM52MkgNllJk3pK62X7Tp0oME6G1GHLvnMDCswmlDnx+lwtdYgx1qYeX+pup+8
	/YTgUtqU2dbKrKFkE4YhAPio2FwxKfQy0q5QKeE1xh2r00ezWEuPUgElL2njWpmy5htex/
	/BBvLZMXRa6wBWpBHth0PQ2UChlHriE7xRTykJ3t75UEPUYTL5eA7II8J1IXQapmL5j+Xh
	GbR56GObPAdFgmqz9htlE0YiXrx7ousOV+MFCUJysLaQ913SYqnxzCP8G127Mg==
From: michael.opdenacker@rootcommit.com
To: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [RFC PATCH] riscv: dts: spacemit: initial i2c support for OrangePi RV2
Message-ID: <20251025074514.642357-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Date: Sat, 25 Oct 2025 07:45:17 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=GbNFnhXL c=1 sm=1 tr=0 ts=68fc800e a=rByZg85q4TxBe4aD0HbSyg==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=7kg-g6J3WR51fJ073mUA:9 a=J8eEqglTx5LDgDqmzts8:22 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfODzyBdtS7KSUxaSmBV0yHybknaV6wf8DwaU0wxxyJby/Vwps5PPymE992Xz9yz8RZmvNQPm47zxkc937Xl8BANXw6hUt8BmD5/G9rwEh4mwykHhKCC0 BdXVSSJgr0aHnsKT5lsFIODovpV4kXg+HTfv3kO2LItXXLOcpkm0v/S1ofvRIU+3fphV/HeXC4fArC8KlEB41NVafMP8GwSYel234pe3YX4+uqKW/chrY7yw 50LtfHAD4lilDkLq1kQmxz3YwrzVhcTmJA2IqmCaj0B8FJd2MoZprox+0IvNLsIRIn5oEFYVzHj8Qo7KFxKPmgl2MJ7z6nJ6B2GcMRDDylM4grKDjcD0Lzgt V2ULaQNJIqc+Ds32L0x/36dkstGXHQ==
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_004524_140044_669ACC64 
X-CRM114-Status: UNSURE (   4.88  )
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

The OrangePi RV2 board exposes i2c2 and i2c8 buses from the Spacemit K1 SoC.

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 41dc8e35e6eb..c4b25dd30f54 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -17,6 +17,8 @@ aliases {
 		serial0 = &uart0;
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
+                i2c2 = &i2c2;
+                i2c8 = &i2c8;
 	};
 
 	chosen {
@@ -81,6 +83,18 @@ rgmii1: phy@1 {
 	};
 };
 
+&i2c2 {
+	pinctrl-0 = <&i2c2_0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2c8 {
+	pinctrl-0 = <&i2c8_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &pdma {
 	status = "okay";
 };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
