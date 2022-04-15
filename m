Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08D1C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 12:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CsbbrK+E9gCahAFpxMXc/3DrkNFH490+EoJ+coNrXi8=; b=O2odKrsDvueWNr
	o92V14JHjTBY4mShDpu3jYr6DS8Wk2Dae5IOrQ/atjwiXa59C5ynYdj7yjEZxJt2kcHv12ilyiXIh
	IAY2bEoqdM/SHEkdR7E1+8uZWHptv5UYjkbYt9mi6MaGEACiklKdUHE4DAoECKZXeEp8OM4Q02af2
	m0V9GLtxZkZeujTyyJH1okcgzo76ZLR+t4hpw2FerTXdRYFXDFZVtjldII7yUBH38OVcCtb2WQKEW
	3wlHTLXqoI/0DHt1CBhmuB5aliaSK5we6trUCnt6mCaeoU7otndF5RMSkXRz2cnsBK6eOyrrX2i6O
	cVolzNSAQ/r7wazVxEKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfLSb-00A9Q7-DV; Fri, 15 Apr 2022 12:54:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfLSW-00A9ND-7c
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 12:53:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650027236; x=1681563236;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uyfcbJqga1kaQg0YBcWsxpMgI10Tfpa6pQWrGukY7QE=;
 b=aaZ0VdUc4T29t5GpZvdVLd8SjdVWnJ9FqFIBdbsUIqnaaqpKvxZyUyiJ
 lNYSkp4r9a8UbC6hIBM7jzgnOPrCDqkuhWhSjd3lERIXMgKppceMgFb4Y
 y9N+mdS8f+tB3vMdQEauvBcMzT59EsgW45vnLUFtbQzdD7jsXz7nMtBIP
 MxdikN7x/gbQXEDH1GmS+GLp+enoK/a6WLahtPfE+0M9cpEKkVNX8CMDJ
 cpwYWkOhnLnX88azY5Gg58P6i1ev2OREyk96p+0ymU8SPKvu3HHeX96h5
 8Hfxk1zAieaIjrPywBL75WRysg7z/GhqapYnqg/ipeSRCBD73ML9W99iS A==;
X-IronPort-AV: E=Sophos;i="5.90,262,1643698800"; d="scan'208";a="160220602"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Apr 2022 05:53:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 15 Apr 2022 05:53:53 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 15 Apr 2022 05:53:52 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1 0/4] polarfire soc kconfig/maintainers updates
Date: Fri, 15 Apr 2022 13:52:18 +0100
Message-ID: <20220415125221.2871991-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_055356_414471_37136597 
X-CRM114-Status: UNSURE (   7.75  )
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

Thanks,
Conor.

Conor Dooley (4):
  riscv: select peripheral drivers for polarfire soc
  riscv: config: enable the mailbox framework
  riscv: select vitesse phy driver for polarfire soc
  MAINTAINERS: add polarfire rng, pci and clock drivers

 MAINTAINERS                  | 3 +++
 arch/riscv/Kconfig.socs      | 5 +++++
 arch/riscv/configs/defconfig | 1 +
 3 files changed, 9 insertions(+)

-- 
2.35.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
