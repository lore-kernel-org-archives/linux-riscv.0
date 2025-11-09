Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D09ECCF9F8
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Nov 2025 22:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=77QEourhNAEhMnPtQNSUGPsionBNM1/1Pd09C2oDPrA=; b=YSLxBtdPFT1eLkMMOgDHn1TRC0
	NtpI1zuOGUBA7ETQUmB/1v07Yt6781FR9o1DmS6nlPbjTs37Y7a9D5gf7QhszYARgw+UTqBuHQKAk
	O+uPMvWQOAKCkmW5PVQKvklRWPMfp4by357tkC+K6F4nLFlOlFlIrSmE3X2j/aoljmpm5/cfYbzxz
	M9uqgcHwWN1gsBIWhaMUV3+TI31d8pBT56NlZi3r9W3k5+VdBzKbN4+zn4N3PFx6QVG2bVGQ7PtzT
	aUA0N0Z+I+Z+IpZ0rbzmRk++mq99f4NpZLCkzWNr0ZtajHK3NQHrDCMIhKMT3aV3WdaTnYBREIMN/
	BMnX+YHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDvQ-00000004RaV-28BY;
	Sun, 09 Nov 2025 22:30:20 +0000
Received: from cheetah.ash.relay.mailchannels.net ([23.83.222.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIDvO-00000004RYz-0Err
	for linux-riscv@lists.infradead.org;
	Sun, 09 Nov 2025 22:30:19 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id DC9AF440F43;
	Sun, 09 Nov 2025 22:30:16 +0000 (UTC)
Received: from fr-int-smtpout22.hostinger.io (100-125-88-217.trex-nlb.outbound.svc.cluster.local [100.125.88.217])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 6998044138B;
	Sun, 09 Nov 2025 22:30:14 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1762727416; a=rsa-sha256;
	cv=none;
	b=QxfFoUO9hAxGp2BxD+Ciop9r+2hDlUEmCCL8pyRNqi4SoLn66FMr4S4vr7iIQqACMLmSxM
	y7bkyOKdrZ5L/z9Mv2velsoknedSpfDHlsseHGB1hP0qW8e1ZlJZyvDQKmb6JTLK4XBbmj
	Lc2RpkMPWVGCXQmuEMSBOtedCQcSMF3QRV+dCjIwyTkMixjZDQjvRU1CnNCgUvYBndFEvp
	4Lgk5kIRtkp4MSkznkRqJn4VCJKlfYM8Fn9P3cpAXO+00hnCB5DxBJ2sA48Xa+VqHboJ1P
	VBpzAH5T+OG8H99npfYGxV/ScMJUneURK2BirNJUj1NDG045Hcgm+vlLX+Z+4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1762727416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=bYTguI9fwtbRna746WVvfaBIUA/5jCg9JsnkhV14j6g=;
	b=p2AXvFzmESiLvXPU8SzX3c9Mt0j56vEG3iQKyI6GTKtFo8+eyz9nCpUpo9uV/pgdLlgmnl
	21fubFsQOgY2Ucjh30Uk6U7TdFuu40OPHA32VC2nJOGWD/eCns7iJx0iJ4QYfQtjlWLqT6
	WoB32M7OkKzBiePb8gAKwnCN7Ry84qOHJfQRKSSr1qXdwjOLMZ9+hSn1mVRK63bg7XlTdc
	8wpMD9bWTkrS111iI4qJ9uYQdoji9a8csJoyQfiuMv7pC+f8tB5a5Ykqs/a0nPExI9soPu
	8vkMzmdL0Bf4H67ifcr+VRkcw6fkSq5Ri/kGBtrwmmL8tN4E4nkt9ZZg5aChYg==
ARC-Authentication-Results: i=1;
	rspamd-768b565cdb-9nvpf;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Whistle-Ski: 66dca66f3ecacaaa_1762727416803_1264572698
X-MC-Loop-Signature: 1762727416803:844494980
X-MC-Ingress-Time: 1762727416803
Received: from fr-int-smtpout22.hostinger.io (fr-int-smtpout22.hostinger.io
 [148.222.54.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.125.88.217 (trex/7.1.3);
	Sun, 09 Nov 2025 22:30:16 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:6854:e5c6:92e9:8517])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4d4SD425VQzyTZ;
	Sun,  9 Nov 2025 22:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1762727412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bYTguI9fwtbRna746WVvfaBIUA/5jCg9JsnkhV14j6g=;
	b=Ka7aCoAKLCbqaVlv34WEfU8W1w7yEhMXfrqq2W32KWeny2aiuKTfQvIwghioUGEGN1iG7I
	bxcMjmP/Y7IqPKc2tCvds7+A50DoMo9JG/zcYWQ3PPLYAUt5805HU4NdkGlLji5aFdXHBY
	vG6eLinLjcxRL6I8oxtJPujAs+dIKwE6dyF3YPwKEmOJj41s3zaYFQvmDa/VlD4eNIq4Vc
	BsHBJoBucMZDV0l90YFzh1GdukiobC/tbcuPakKshtXNnKhbBX1e+EJWQA9dtN0ilqiv9D
	vn9eBKusecSVIb+WrT3EW0tnJZ0FS/qK+dd4AgGAZsBkZc5/G6LkjZMRLYxExw==
From: michael.opdenacker@rootcommit.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] riscv: dts: spacemit: add eMMC to OrangePi R2S
Message-ID: <20251109222858.3085488-5-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251109222858.3085488-1-michael.opdenacker@rootcommit.com>
References: <20251109222858.3085488-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Sun,  9 Nov 2025 22:30:12 +0000 (UTC)
X-CM-Envelope: MS4xfD5Vag569iRn3Dn/qa/KjZSC9Jo7uCZs5mTseVkPlVTkngz3CQXvKqXlsYn5pjKCzZCwPJoExbN+YU7sMPia1EQEXoNVddWBTGip162qrvBGcKcvY8nb aeWBNcfwL6rr6WlyFJCI0w42ltN1BrWeFHPdtPPsBZWm0zRVcvgnQdjLQAPiN+CmnY59/MxuiagguNUgJ8Zon8qxlIsc30lifVfE6ipgVL3URwpp31CvwDPf BK3R+cqE9x/DEELKPxNn+H7Yyc8+Kq0lVm93jphferuQcAKDJMXNsEykyW9XF/xq9zg5cF3MQQfzxznk4p/jYM2pgJCn8c5e0T3368hwwLjtPx25ZFC4tCX4 j1BweXHSfhTK4CPthi6nAt8JvV0YhwnW7AwGDvZJJaCFt/IaP/C4amt4iTFo1ITrWcoEVYOkGvPWh9GwupJpo7zKmAsOMmsHWtXZqyRxYO1fxfWl4jcq/R8h RCt15ilAzQbbDSZFQBgX1fEGi/qxGZn4tbvqSapmBqCTllmJdtuZMTxCm9QFjz+zpV7+e0y5EemspkPzZHZU8KCV8AL09Wy/0QfQlnrZN+voVxTN+UPdbqj1 YppxSA6mIZccFErOUfN7savFpCoswc5J872XJOd4lIn447A7H1+019IyNewnAC+uksR6gNT6R+HHx0TJ9+4HcCCn0voJqdoKbH3nMcHlp53eQg==
X-CM-Analysis: v=2.4 cv=Lflu6Sfi c=1 sm=1 tr=0 ts=691115f4 a=9hvhlO9olek7/vweJUpOAg==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=-18oh36_rWcDSRoscU8A:9 a=6GXZlH8O99NGPdPthH_S:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_143018_240940_8F7EB4D1 
X-CRM114-Status: UNSURE (   9.15  )
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

The OrangePi R2S board includes a 8 GB eMMC chip for storage.

It works fine with the same description as on the BananaPi F3 board DTS.

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>

---

Read tests
----------

hdparm -t --direct /dev/mmcblk0

/dev/mmcblk0:
Timing O_DIRECT disk reads: 846 MB in 3.01 seconds = 281.52 MB/sec

Write tests
-----------

dd if=/dev/zero of=/dev/mmcblk0p2 bs=4M oflag=direct status=progress
7600078848 bytes (7.6 GB, 7.1 GiB) copied, 127 s, 59.8 MB/s
dd: error writing '/dev/mmcblk0p2': No space left on device
1825+0 records in
1824+0 records out
7650410496 bytes (7.7 GB, 7.1 GiB) copied, 127.866 s, 59.8 MB/s
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index a4007a7a1656..58098c4a2aab 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -23,6 +23,16 @@ chosen {
 	};
 };
 
+&emmc {
+	bus-width = <8>;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	non-removable;
+	no-sd;
+	no-sdio;
+	status = "okay";
+};
+
 &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
