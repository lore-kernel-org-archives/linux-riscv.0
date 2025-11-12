Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76BFCD1297
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 04:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:Message-ID:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s+txhi4JTS6TnmDovZBJDO1DhkpRaMRcCyZWYHJ1RAc=; b=pWd7D4uYO7ieZm
	ytwPFgys1v1AmusAwa6WI7DlFnR2hcnABKo3sAETg/2N5X6X+Yki1111HXypH/ybGTXPhBUg2P/qX
	SxPTIUYLxbSwcjc/NpddlM1iYzwC10mODxh13SYwvC7RgJD8ipVjnL+e3dCfMMSDkg1hXZUrLZyB+
	erkPpVgHQ/0VFjyuq50YUDqe1tpfqYGHIOHRwJhKYEiKrZyv+gL2ClY/B+0gtgmuwbcXK77+jzrbF
	CXUkIREGFaVRDKQfJBA/0nJUFYdEpYkoO6hhk54WD5cbg4m0/7usum784v74oVL8UjyTcWEkckMkV
	DAnU3oOuHXBT8s58dUZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ2it-0000000887S-3bEJ;
	Wed, 12 Nov 2025 04:44:47 +0000
Received: from purple.birch.relay.mailchannels.net ([23.83.209.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ2ir-0000000886n-0KdX
	for linux-riscv@lists.infradead.org;
	Wed, 12 Nov 2025 04:44:46 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id C1FB87E0CB5;
	Wed, 12 Nov 2025 04:44:43 +0000 (UTC)
Received: from de-fra-smtpout9.hostinger.io (100-125-88-56.trex-nlb.outbound.svc.cluster.local [100.125.88.56])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 0D09E7E089D;
	Wed, 12 Nov 2025 04:44:41 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1762922683; a=rsa-sha256;
	cv=none;
	b=DXTa1J1bFabUJ6LBMaEKfH+H+IKtSJXw/5J+xMYxo0woqPpg/ei62oPzmg+VmwPhz3nxAz
	JVQgc+1Ws6Csfyf32U44/xL3EOhyVIPdr45UOdj2OHlFe24aQiCOdKSUAZ96WpjCe9vWO4
	s+BdxV6Rh3kyMYrWXnYW/lzTci+8wP8yNYnU33LPX6ON1tjDnVLIeu6NP2kg8kSDvktNYR
	iS/7zXLfhbU8GdobMYYSS9Xt7DqPVSxzrPuXz+KP1TbYMMOcjbYrm2pJX5RTZj+tOEn/mT
	bkjyY0H8pAKUP5J7Bu5DSmhWRRPa+VR1BZds+/WnaF2roqpSgHQB2LB5ViOuNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1762922683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=oz8qLwfLZFXB2WfRglqkaYkkXg3J2VmVcN0unNcvqI4=;
	b=42Q80te62OGeimKXw+y31Q6npbsheUpHDeysfOnPuxssNkDh6Q2gCHybIkVElq9Oz4qfs3
	eOWzsduelzhvFcUOzJ7/xM/ItqL0GnqHFk9cWUZU9YW08ggNe0gYHkeGpimdASdrTepITA
	OC0XkDCykdvT9iIbJS6kP4Z9pNstwqByKM+UWWivW8LdTvPnPghwvEfYOSx1w+rQht7HSO
	XnpE8/7qdoz7Fter2SVdTaFg5L2JzPW9wcb4gsfhm0S5TECQXCo6FIz86iHPlCr/DrH3n0
	JRwt6XBgASRth6Pu7c6/GWKioInoDSBASQXROu0iZjwgA2Y3sjaG2dQBztLYxw==
ARC-Authentication-Results: i=1;
	rspamd-768b565cdb-dvdb4;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Gusty-Eyes: 7bd873815e71fb88_1762922683544_3572789025
X-MC-Loop-Signature: 1762922683544:3136298419
X-MC-Ingress-Time: 1762922683543
Received: from de-fra-smtpout9.hostinger.io (de-fra-smtpout9.hostinger.io
 [148.222.55.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.125.88.56 (trex/7.1.3);
	Wed, 12 Nov 2025 04:44:43 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:e24a:32fa:a400:91c])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4d5rRD0F0Rz3xHH;
	Wed, 12 Nov 2025 04:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1762922680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oz8qLwfLZFXB2WfRglqkaYkkXg3J2VmVcN0unNcvqI4=;
	b=VwdIOjTpTeXqWXTKEtvQMdVEt+9i27Ux+eX0MI2plOAZLgFl4jEo+f3wmatkZOtf0hwNsE
	U+c+0dMDBU0hvvJ9Z8G7Ae+5Y8UQjYZ/Tt1cexwCP4eEsuQ/ktzpU2AGSXA+Zs/meXMVEZ
	uOSNo4JgGe6rIpbza7iSJIj/7SkzZSYyiA9XksPaQXorXpooJ78vAis7ISHoj6xpghmhYd
	5eos3rrpeXSiPAyYL0GaYFfjaRGv08efFnlBg2PjkAZ7W+vUjtcQYBm0kl9ngIk9/uTFzd
	S7LgI6lbPkwo1bk6vyOVtIZ/ee94QdPJNRDojj37c9yZ/bLc40bmlv7wTqConw==
From: michael.opdenacker@rootcommit.com
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH v4 0/2] riscv: spacemit: initial support for OrangePi R2S
Message-ID: <20251112044426.2351999-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Date: Wed, 12 Nov 2025 04:44:40 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=ALriHGRn c=1 sm=1 tr=0 ts=691410b8 a=XVsSf4j1YTBLvHmD+RU1sw==:617 a=xqWC_Br6kY4A:10 a=5dAzR5NRAAAA:8 a=lv0vYI88AAAA:8 a=NEAV23lmAAAA:8 a=d70CFdQeAAAA:8 a=Vl14U2ekO8tqDJig6CcA:9 a=9STjDIb-X-UA:10 a=ZKAZAlVgJm32z6MX8p4a:22 a=9qqun4PRrEabIEPCFt1_:22 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfCxXocw7M2/P3cCtwYUQkmryjyOQVYPLFuDCiV60IHytJhore9FQgRz28kTIk4I4v4Na57HyupU0GPfu7xb/CA3rIKyM1DnTtNM4+ON4QfHfjamODK2I mgnuSHii7th6QxyoPvLzhenRhNl/5/6Wo9elqk8xW7dB+UPvC8lqulhzgEI8CVn9pM7jtQVjeoOSevimA+TkASFJx6Vl9WbRt2aPK20TgjPTOLxsmqLU1tXX fzA39Sz1YN3kEBagYAX+CETrJ+mzEj7V/BFaf40ZejM3B57r5L7uivqvyRRL9jUxmmwiycw2xn74Bdm+OKPwhQFqK+nJfGKg3bdsMLUkDLTmvOdV+M4qgVJe Ms8OjZ5vOHs/+N1T0UxvbqW1NvB03GLDPdi45xfsUx9Y49j3+er0YN4dmrUn0RAcGw40MlfnpLQtXpOdySPFaq2+6ZV8hXrEl48S++v2BrjdMw5tGc45xFOk TctfvAgHLsxf3uAWzbNWhqeWqFkLsgW1j/VgmBuOBVqiX3vtewQ+FvwOti4=
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_204445_417213_7C79401D 
X-CRM114-Status: UNSURE (   9.02  )
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

This adds initial support for the OrangePi R2S board [1], which
is marketed as using the Ky X1 SoC but is identical in die
and package to the SpacemiT K1 SoC [2].

What makes this board attractive is its 4 Ethernet ports
(2 x Gigagit RGMII with an external Motorcomm YT8531C PHY,
and 2 x 2.5 Gigabit Ethernet with RTL8125BG on an internal
PCI Express bus), its small form factor and its attractive
pricing like other OrangePi boards.

What is supported:
- Serial console on serial UART
- 8 GB eMMC
- 2x Gigabit RGMII Ethernet ports

This patch series is based on Spacemit's Linux tree,
"linux-for-next" branch [3]

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-R2S.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Link: https://github.com/spacemit-com/linux/commits/k1/dt-for-next [3]

Changes in V4
- Improve commit messages to make it clear that the Ky X1 SoC
  is identical in die and package to SpacemiT K1, making it
  right to add the board to SpacemiT K1 DT bindings.

Changes in V3
- DT bindings: insert new compatible string in alphanumeric order
  (feedback from Krzysztof Kozlowski)
- OrangePi R2S: remove useless description text in commit message
  (feedback from Yixun Lan)

Changes in V2
- Squash 3 commits for initial DTS, Ethernet & PDMA, and eMMC

==========
eMMC tests
==========

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

==============
Ethernet tests
==============

Tests on eth0
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

Michael Opdenacker (2):
  dt-bindings: riscv: spacemit: Add OrangePi R2S board
  riscv: dts: spacemit: Add OrangePi R2S board device tree

 .../devicetree/bindings/riscv/spacemit.yaml   |  1 +
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 90 +++++++++++++++++++
 3 files changed, 92 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
