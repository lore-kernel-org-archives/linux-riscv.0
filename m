Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5F3CCD1A0
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 13:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Iz6PlrAU3cAGwNpWwWK/w6tHJJuic5itFSeVXxm53g=; b=0lT6LtyVByfDWX
	R23UVXKJ5RoKFnz9vqTdU1/eCW5lvVYsDSxYKdRORVj25/iHuNezjyMJr70NxxyEWB0wrEL18jpxY
	0sF5eCHd6+m/ne6cmDYSqnCs0ooeIIRo4i2g1LnPz7WHXaTPIKAB6PRE88gMduebRE5zODZ9J/Cdp
	w1FVgZZJ/rBXE8N+fveluyFHt+PK2S+XqK6G6NSXIKIqRbFoSFOxSJtfTp91926NbGQtSqp5udF+d
	0bRMTjvT5d+L7P8t78bfBgZ4PWcO/UGmyJeZNr09e8yKwQRLlNxT+enI0jDTZA19lunfFJqWVAYcv
	DqRIuh/OzCjemMscwIvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqv3m-00000008NGC-15WS;
	Wed, 18 Sep 2024 13:49:34 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqv3i-00000008NEE-2iY6
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 13:49:33 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20240918134928euoutp013cf60a2b2c413d309d461fe4a9bb7647~2WtLhKizM0174101741euoutp01H
	for <linux-riscv@lists.infradead.org>; Wed, 18 Sep 2024 13:49:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240918134928euoutp013cf60a2b2c413d309d461fe4a9bb7647~2WtLhKizM0174101741euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1726667368;
	bh=5fUgpCsJux7Lg3Z0dohni+cpqjEONc3jhq5kpwUvl3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IQbZYUVol8s0rwsLmFZfIq/J1akjpmyDd4FuIaiAzN1a8kJTaqhzgVsWcNVkv78cZ
	 b8pqKy+rpDNv7Vxzkv9sBvH6WY8BEv9ZDPOfMesI8WxYSVky6Q6M9H0SZZnLNr1JEi
	 3b0AC+WOMbyp0VDZr/MjTvT4ydbT1QTaBVrciYyI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240918134928eucas1p2e4f0984503f67a7c50ff85cc3181081e~2WtLL-GYv2479524795eucas1p2V;
	Wed, 18 Sep 2024 13:49:28 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 0C.AA.09624.86ADAE66; Wed, 18
	Sep 2024 14:49:28 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240918134928eucas1p216ff09a6f98681def7e8e38e02c27145~2WtKuzpFr2479924799eucas1p2M;
	Wed, 18 Sep 2024 13:49:28 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240918134928eusmtrp27aeaa4468d559e99a86c9978ba737140~2WtKuE6bp0382303823eusmtrp2s;
	Wed, 18 Sep 2024 13:49:28 +0000 (GMT)
X-AuditID: cbfec7f2-bfbff70000002598-95-66eada68d343
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id AB.48.14621.76ADAE66; Wed, 18
	Sep 2024 14:49:27 +0100 (BST)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240918134927eusmtip164d7500664afdd5903469ddd7fb746f0~2WtJ70Jem1705517055eusmtip1T;
	Wed, 18 Sep 2024 13:49:27 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, m.szyprowski@samsung.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH RFC v1 3/3] riscv: dts: thead: Add mailbox node
Date: Wed, 18 Sep 2024 15:49:01 +0200
Message-Id: <20240918134901.193033-4-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918134901.193033-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIKsWRmVeSWpSXmKPExsWy7djPc7oZt16lGXy+IGOx9fcsdos1e88x
	Wcw/co7V4t6lLUwWL/Y2slhcWzGX3eLlrHtsFpd3zWGz2Pa5hc1i7ZG77Bbrv85nsnh5uYfZ
	om0Wv8X/PTvYLVr2T2Fx4Pd48/Ili8fhji/sHjtn3WX32LSqk81j85J6j5a1x5g83u+7yubR
	t2UVo8el5uvsHp83yQVwRXHZpKTmZJalFunbJXBl3Nl+mLlgK2fFmaUz2RoY57N3MXJySAiY
	SFxqmABkc3EICaxglFjX+J8ZwvnCKLGzr5URwvnMKPH74AdWmJbX7RNYIRLLGSX+TDoLVfWG
	UWL21sVgg9kEjCQeLJ8PViUi8I5RYtK120wgDrNAL6PE1L0zmUCqhAXsJV7deckGYrMIqEr8
	3LUayObg4BWwk7h9Xx9inbzE/oNnmUFsTqDyGZ8aWUBsXgFBiZMzn4DZzEA1zVtngx0uITCb
	U+Lf1IXMEM0uEi+Pz2WEsIUlXh3fAvW2jMT/nfOZIOx8iQdbP0HV10js7DkOZVtL3Dn3C+we
	ZgFNifW7oO5xlDj9qIUZJCwhwCdx460gxAl8EpO2TYcK80p0tAlBVKtJTO3phVt6bsU2qKUe
	Ehufb2GawKg4C8kzs5A8Mwth7wJG5lWM4qmlxbnpqcWGeanlesWJucWleel6yfm5mxiBqe70
	v+OfdjDOffVR7xAjEwfjIUYJDmYlEV7xDy/ThHhTEiurUovy44tKc1KLDzFKc7AoifOqpsin
	CgmkJ5akZqemFqQWwWSZODilGphE5x58GXXmo8vDa8IlcvcUCj+/CFp5d5pT/9SbqcnnH8Sp
	9c78Xqm06mDNqagJ70QedrctPH6idMneLNtd5+809d57xTWf602/8qNUaZ1pva4uH/jsuNK4
	GoX+1O8Obw2Z53508YVliV4F9zNndflyyO0LVHqw41GB8uHm+TXLLNQT/irdZ5K6b/f8TEPQ
	4wXTmZSu57+bIhTbeXN9SabQou/Nhk5x3beEUhw9ipayTNjMIq5/2/T4JG3+2ecqX71RNvj8
	qYa9+fzsXRNbVHj+bj8mMqP5qKEaU8qz57nmpVFq+x4HhwVNK1Vg9lrls+ijVI6fy33bdw2T
	ORPWC/45IFbww3Njy7GNs5mtP/cosRRnJBpqMRcVJwIACyBx6uQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRmVeSWpSXmKPExsVy+t/xu7rpt16lGXydZGOx9fcsdos1e88x
	Wcw/co7V4t6lLUwWL/Y2slhcWzGX3eLlrHtsFpd3zWGz2Pa5hc1i7ZG77Bbrv85nsnh5uYfZ
	om0Wv8X/PTvYLVr2T2Fx4Pd48/Ili8fhji/sHjtn3WX32LSqk81j85J6j5a1x5g83u+7yubR
	t2UVo8el5uvsHp83yQVwRenZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZ
	pKTmZJalFunbJehl3Nl+mLlgK2fFmaUz2RoY57N3MXJySAiYSLxun8DaxcjFISSwlFFi+fPv
	TBAJGYlr3S9ZIGxhiT/Xutggil4xSjReOsYGkmATMJJ4sHw+WLeIwB9GievP3jCCOMwCExkl
	bs69zwhSJSxgL/HqzkuwDhYBVYmfu1YD2RwcvAJ2Erfv60NskJfYf/AsM4jNCVQ+41Mj2GYh
	oJJfTzaA2bwCghInZz4Bs5mB6pu3zmaewCgwC0lqFpLUAkamVYwiqaXFuem5xYZ6xYm5xaV5
	6XrJ+bmbGIFRue3Yz807GOe9+qh3iJGJg/EQowQHs5IIr/iHl2lCvCmJlVWpRfnxRaU5qcWH
	GE2Bzp7ILCWanA9MC3kl8YZmBqaGJmaWBqaWZsZK4rxul8+nCQmkJ5akZqemFqQWwfQxcXBK
	NTCtOzddbN5TI//+BQaCjevkvKxvOL/kmn7sRogfW8SEtvVbXV94plt/mOvyd5KoevRREZYj
	QZcCZipKfberueZ07cIqs/UyIZ4i78NKtzjf/bl6bsEj3/riSy6n88UPhRS1qHy5NTUgffbZ
	KLE6BV7RV/0vH6o213W8KK4JVxd5xaU86VXl5vy+WzszH/Rd1vWqVxebLhCxmf/8f42IQ8fO
	Wnyssl4gG7pj3ser+bvktiw+seVj6PElW4S2druEHrr+KU6IQZqhtPO51tLJF5/s9fhxNceh
	MDbIk/3Chh1NW6ayhxR8qd1kz8bovZjr8fI+idNJDfWnVbe+2J+4xjhUsNA0aNvBXVOCl1ob
	HP6pxFKckWioxVxUnAgAb87np1MDAAA=
X-CMS-MailID: 20240918134928eucas1p216ff09a6f98681def7e8e38e02c27145
X-Msg-Generator: CA
X-RootMTR: 20240918134928eucas1p216ff09a6f98681def7e8e38e02c27145
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240918134928eucas1p216ff09a6f98681def7e8e38e02c27145
References: <20240918134901.193033-1-m.wilczynski@samsung.com>
	<CGME20240918134928eucas1p216ff09a6f98681def7e8e38e02c27145@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_064931_130239_46DE0122 
X-CRM114-Status: GOOD (  10.09  )
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

Add mailbox device tree node. This work is based on the vendor kernel [1].

Link: https://github.com/revyos/thead-kernel.git [1]

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 3c9974062c20..5d0cc1d899d7 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -546,5 +546,20 @@ portf: gpio-controller@0 {
 				interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
+
+		mbox_910t: mbox@ffffc38000 {
+		       compatible = "thead,th1520-mbox";
+		       reg = <0xff 0xffc38000 0x0 0x4000>,
+			     <0xff 0xffc44000 0x0 0x1000>,
+			     <0xff 0xffc4c000 0x0 0x1000>,
+			     <0xff 0xffc54000 0x0 0x1000>;
+		       reg-names = "local_base", "remote_icu0", "remote_icu1", "remote_icu2";
+		       interrupt-parent = <&plic>;
+		       interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
+		       clocks = <&apb_clk>;
+		       clock-names = "ipg";
+		       icu_cpu_id = <0>;
+		       #mbox-cells = <2>;
+		};
 	};
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
