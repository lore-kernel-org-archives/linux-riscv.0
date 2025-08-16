Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927F4CA0EE6
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 09:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l9+oZHorj8UsxZuoB4mX62JZU6ikUQ20IpZF7W1NGWo=; b=WCTwdVkmoxt3yt
	XWm2kepf9Prj2y6zaOkZ0HKdukMfmoo1Bbizt9hiKdnCY7T2p4suuKDhuNlpFUan5KDUaKqWaiPH/
	b8LnyTX9yk5ql/qPgsjQ3LBtnSBGLxXSitpPpcDqlgsdOgY9upNzpcLQ40o0cxDHPBN5JgturQfNV
	Vh2FDYcXs5hmuP+NhArBfub8UPjCezTNwHJcpDAntlzfmABX3y9rzGVaWPBMiGrvLDbAD80o42mCy
	O1MXb59BeOMUJxsBLdR+/tiucP8gSJ2LOI2s111/Te7lvoMIM7KLUDqK2jd+S9vKNnaBskgNFybCW
	Bdk6uGO9p6ZwFFhXgmfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unDOu-00000004PYZ-1Csj;
	Sat, 16 Aug 2025 09:40:36 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unDHF-00000004Oc6-1Dls
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 09:32:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755336755; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hewtz6LRweMPpZFHEAJP/tEqHn0sAQziqNoT8du7kQGY+poMzW9i2QJgIpV2zBgaPy0OueEzM4v95KGB5TJUiEsWUnw9bDS1DARYPveccY9snDfsx/WMpzIqml2VwYlG3Wsk+xvsDIWwNCgfMy9QAaTLTJDo+90ATZ7obWRkKw0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755336755; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zrHlz9L+NaX+oGK/4oFn53TVd7SQqKQSMIgtqxp8PB8=; 
	b=aCHKR0CQopsc33DEi+P8FiBx0OfioCahNIPRbM11+P67UpgbStoVqhiZvX3SW3+VKTl+xGEQs3Xfk/gROMxRaiTgtpzPrWsVwV13dDCcLpxAJNi4sLguYz9hoCd4MLGuByYO36V3wGGRT5YFu/Lg96qtpZrW7eMl3R6I+vZQRjQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755336754;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=zrHlz9L+NaX+oGK/4oFn53TVd7SQqKQSMIgtqxp8PB8=;
	b=EHEXEp3imfuV/cD8wK8FKcjsxn90XjsEnxKMUyhJ11mdM6Yo2bZStSr2nqzWDPNR
	gZVCVJrugcjsNp4gSrLBiCx87HJOttxWozWJVKAkcO9aSjhnZWc27+bXBEww4wMFFJN
	1xY9p3aLZI9tonVXReFCFc2TjJVP/QTMMywwOKrycKFoxRoS/S7C4MTXJPPyQIsjKph
	eM+iTizC/aLKh5GVqz3eqU0mwsf22jr1yy1rJaeVXugEr9tU5SUuMnlOIWAPNPnNAop
	19bTbPfAzH0TXVO8JWU0dPoFhuNCCPLnoOxmhEudteABFrf3aToXfVRkJWSbfJ0JwIe
	3hvEJiau/g==
Received: by mx.zohomail.com with SMTPS id 1755336753451925.3420275013336;
	Sat, 16 Aug 2025 02:32:33 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 0/3] Initial thermal management for Lichee Pi 4A board
Date: Sat, 16 Aug 2025 17:32:06 +0800
Message-ID: <20250816093209.2600355-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_023241_391591_4BFD281F 
X-CRM114-Status: UNSURE (   6.42  )
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

The SoM+Dock design of Lichee Pi 4A is quite bad at dissipating heat, so
active cooling is quite important for it.

This patchset tries to do some initial active cooling for it, by
utilizing software PWM to drive the fan.

Ths 1st patch adds PVT temperature coefficients, as seen in the SoC
manual and BSP 6.6 kernel device trees.

The 2nd patch adds thermal zone information for the 2 thermal sensors in
the PVT block.

The 3rd patch adds soft PWM + PWM fan, and makes the fan an active
cooling device of the CPU thermal zone. 

Icenowy Zheng (3):
  riscv: dts: thead: th1520: add coefficients to the PVT node
  riscv: dts: thead: th1520: add initial thermal zones
  riscv: dts: thead: th1520: add soft PWM fan for Lichee Pi 4A

 .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 53 +++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi         | 29 ++++++++++
 2 files changed, 82 insertions(+)

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
