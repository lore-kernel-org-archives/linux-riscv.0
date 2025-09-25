Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389D4CAC5B6
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 02:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K49sIRlmkxOI5Gr4JyfCBDZfwCLxUizL0R+oyJWayao=; b=AQ/ILKetL5ENev
	XeJVVjwVUDJ1wo/UKMG3gKWut0KVFL005XYA0gbmcY5lObBLWtIulwSndld9KixIShu7Y/nUC2TXh
	gizzOror1MANu64GnTcqqSdmRlqfOq7CgexOTqpf1dWnD3+Esv3L1SVCu/CM6KRV6Rrxv5IuzW5UB
	Ahldjf8RlM2YFFiHuF+qO+3GN3LJ8UVf0HjoG1lOtjeppUBKwNo1bztArpNbPL6yjvW2DplrgXIbU
	qmjZC6cnzW9nTClqK83UQYridp4gMwvb6tOpO/rS2pMT/TDpCKBPweTo44NP+FaMiCMnzLGUulCyM
	XgKMBw25GaJSuqLoLWQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bKi-00000005EvK-26xt;
	Thu, 25 Sep 2025 02:03:44 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bKe-00000005Eu2-2KAz
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 02:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758765760;
	bh=ki4zczk6VnUFNXrN8wqllJY+M2Ri/NDcc9h1NlUpC8E=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=ih7PXNw5bucOl3nZMBveyjSptPcQ+Bttdlv9ASfroqgzrBWFJJ+t6dM5KwyR6JGEV
	 RsmlYElRDhE/O5HIq4MpZjiM+z/SVY24zKZ0LVOQlLXTEcgaFifr9w4iEUHohsftTu
	 o2VtJOGF9iXuIdPOTXu2iLDpzvvJzQk7bjs4ujNI=
X-QQ-mid: zesmtpsz4t1758765758ta18b7565
X-QQ-Originating-IP: 6831mDtJxG/SrWIEQuteX+9U7ft5g0Sd/JCA83Sqr8E=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 25 Sep 2025 10:02:36 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6417342533199486618
EX-QQ-RecipientCnt: 10
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 25 Sep 2025 10:02:25 +0800
Subject: [PATCH v2 1/6] i2c: spacemit: ensure bus release check runs when
 wait_bus_idle() fails
MIME-Version: 1.0
Message-Id: <20250925-k1-i2c-atomic-v2-1-46dc13311cda@linux.spacemit.com>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
In-Reply-To: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Alex Elder <elder@riscstar.com>, Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Aurelien Jarno <aurelien@aurel32.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758765753; l=1370;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=Mxko1HfYivBbT3R4nSU08f1apQBZPPP7+WzA53A2nhQ=;
 b=6sLdHx5CBOsGsN1uV3b4FYW/koIj/8FPAVsFZ1gBAOpCL7oL8BGMOtzZWE9rlCfgsv5DUHaRF
 dJenAmOw74GCSdacr5ByQxeiStC5Yu54/aWtZUhiSzYYTj1IJPHnXbd
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NxdC3wVPjoZEdRrLlBsWCG3BifrbHTJ24v5o5vVXwvwWOK3ZuePnKtx/
	ICfUrLEkvEa1IxiFMNjtTu9Q/orziD5eMNCcuCCIje9HuuGWjavcDkTG+7mOPr5rsZf5d5z
	tUkHmU922DX+1cy45qBJLABsJJXzUqxbKtC5B7T8JKCNlvL/P/syvl5gW6NM1cl9/hMwKvk
	TLvNlLv6MQX3hZtOYw3mEKZBl0HMaKZ0wVRsKTMBIueCQltM7fIFAzcJRVTYKYibwfXU+Sz
	unfZNm4yjyKGWY5iY8l9Pf9jFty1BDdEaOPcLonUCx1a2Cnc5AeiXBm68Ie+6mXCl9Hv5/G
	dgoi8peItUeGPmHQROda7fNHIpgJIJT8DlAC58WkmGWFVEz5eBwh79Alb/I8YzLvJneOv60
	eeSo4nigGVKPdi+/1YPvTHMq4IKJtiT3mSxwaQmlnU75JT1gQXym7aIyqaVMPtETZTIlDph
	5Jycga+2cQGYzQcMovAA9A9dUTHZCjnbKbZSq1bJTIsRjBgnj1yaD7y6pilZWbW8ZL+6z1o
	JO18fS0PbXUNB9UwFKUzA3dGpa17afB+S2CwsSwrkPYZumTIu8P0dp1i/2ld3oie3/gA0MC
	yQ+pd0Nz/3wx0s0+Kh7B5m/OuzOlRwqRNzUooxVECUmDxE1UMStl+bqkLBjajZ84SzyYGz2
	S8L3aG+BaBEMDynBBT9jHMn3KYdEMojkg6jqlVUcFdtJ0l0wto3jEi1pW93ULT6/TetAkdv
	tyfwLqzgN3BmBea+He4MLh0UYD8T1doC/OyJpsHfxrk6DK6U7Dw3PfZuSzrJEWBL2iS2LHf
	J+Wn9/6RCeO5BCzYyNikwGj65gZGFet6RLqXQkqe3otzZYl0yswVJH+tXF93TmqG1+o2wsR
	0noT/eg8CWLpZHJSSR77q8BlwVyW43VjOs450Ac/BnnIQRmsX5AIKUaP3u+P6btGBBFJmiG
	Y1M8/AwKRr+0j3DFk+1PtJv6eW3bDNV65e5obS0EUzN6OFg8WrvaP3hFnuTcdwmNX/3g2tz
	QpEgHeX3X5WOt/JiMuoaZV2aPM0xyEDILn9k1NniAvT5eczQwk98Zm/0lkNIBVRBpxJj7Tb
	h0tH1zRsGVqsgYTI9BksfmSHCi0sj1EhV5b/qUgO7+h
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_190341_308026_1E998910 
X-CRM114-Status: UNSURE (   9.87  )
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

spacemit_i2c_wait_bus_idle() only returns 0 on success or a negative
error code on failure.

Since 'ret' can never be positive, the final 'else' branch was
unreachable, and spacemit_i2c_check_bus_release() was never called.

This commit guarantees we attempt to release the bus whenever waiting for
an idle bus fails.

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/i2c/busses/i2c-k1.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index b68a21fff0b56b59fe2032ccb7ca6953423aad32..ee08811f4087c8e709d25dd314854ed643cc5a47 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -476,12 +476,13 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
 	spacemit_i2c_enable(i2c);
 
 	ret = spacemit_i2c_wait_bus_idle(i2c);
-	if (!ret)
+	if (!ret) {
 		ret = spacemit_i2c_xfer_msg(i2c);
-	else if (ret < 0)
-		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
-	else
+		if (ret < 0)
+			dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
+	} else {
 		spacemit_i2c_check_bus_release(i2c);
+	}
 
 	spacemit_i2c_disable(i2c);
 

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
