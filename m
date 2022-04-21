Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139D4C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 08:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rCq1x8rfB2Xk5tHaXUfxmz0y5ZnTx6ji9PzH0gVtg9w=; b=crCHG+6F0Z295b
	fVBUioPXlhFc3leVvKMaSe82MKNvhfAoNU411jc0R/F6tbjtTPufnYHNxU0MosKyaZ40IXYcToYtV
	0GvE5LDyzpU1OCVVZHAxFG5KhMZBpPdozoYub/gNL8legLEAqfXBlO/gL4o7b0niU4ma8StUHh/BY
	SHAcQtrcHs0H8bFJgA0+jrdq3QI9UPNM1MvEe7g93qk+MwsO1JR25AmiBoZAu/IuiInOC1NKAZnBZ
	JniEe/4ERGCWGIVd6v/xucTWtm7BzPmwEez5f3lQEH3fxvvu65JABhTZJ+X99yzq2cCy4GWiiHqoI
	vgg5dAhAMOezb49xH7+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhSeR-00CYXn-QU; Thu, 21 Apr 2022 08:58:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhSeP-00CYWN-AD
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 08:58:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650531537; x=1682067537;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xibzCUsFY4w1FEY+Mft5XybNFXc+c9MAJA4CfNeLttM=;
 b=LdCwrW4hJUPT2nC05OjsrOXFSmfLkHwciLJhgF7ReQ3t4MgP90AaiGF3
 XB3wPyfbxmFqKFGUqxH5WRX03/PWsiUCrkLpmqOejYHuLea0lCHlIdWCD
 7ivfdvdYGk/r15NZ+a6HfBRu1w6nRtPRymVtDwtag4awM4Ak/760nSevg
 XXleInRbXKML8zuW5F5WHkoXihbEHkATBep82LraEaadDP2OpaDE3RKtB
 r48pnYBDLAb6eJfLrTYwtIpM36dtBYqur/ImJkcYJwtb8cmTWdJTpvj4q
 8D50rPnWQ+7PBT0KY+VtlNKWn31x9onKqVYZIknMtznVyvmk38YE3dgqL Q==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="170401187"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 01:58:54 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 01:58:54 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Thu, 21 Apr 2022 01:58:52 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <daire.mcnamara@microchip.com>,
 <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>, Conor Dooley
 <conor.dooley@microchip.com>
Subject: [PATCH v2 0/4] polarfire soc kconfig/maintainers updates
Date: Thu, 21 Apr 2022 09:58:02 +0100
Message-ID: <20220421085805.1220195-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_015857_441269_7C8CABFB 
X-CRM114-Status: UNSURE (   9.19  )
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

Hey Palmer,

As discussed, Kconfig.socs updated with the recently upstreamed drivers.
I took the liberty of also adding them to the maintainers entry.
The hwrng isnt in your tree, but was accepted today.
As you suggested, I added the vitesse phy driver in the kconfig.socs
entry - lmk if you don't like what I did with the comment.

In v2 I have replaced Lewis as a maintainer with Daire, since he is the
original author of the clock and pci drivers & a co-author on a bunch of
other (upcoming) drivers.

Thanks,
Conor.

Conor Dooley (4):
  riscv: select peripheral drivers for polarfire soc
  riscv: config: enable the mailbox framework
  riscv: select vitesse phy driver for polarfire soc
  MAINTAINERS: add polarfire rng, pci and clock drivers

 MAINTAINERS                  | 5 ++++-
 arch/riscv/Kconfig.socs      | 5 +++++
 arch/riscv/configs/defconfig | 1 +
 3 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.35.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
