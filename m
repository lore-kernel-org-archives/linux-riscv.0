Return-Path: <SRS0=/aKF=IC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D53C433DB
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 00:54:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6BFA64E99
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 00:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6BFA64E99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OkvrKXhf6Xu2HOfcfC+h4eePbP1ui9WVdmBOa5sNUrs=; b=Lvp64KUIMG14wo9Nnap1dElS+
	MVpaANxwIAGfsewH2HczzKKpnp1hjcMPg3Rb5QJcvcvpJWI+rsVIj+PmY9yUzcCe5uI+P0DlKW0+1
	6Wh+5NRvsmMoqHIxzxtGNpWIR9uNiYI3HBGJbdeDhW6Eb6khrmFerSjMox2do3WOaA/KWBDZQXXif
	zffu9jWSgiD0AOlHhNqve2EuUFZKSQKC2U15HrzGxmppIqImRijIT4NiwCaL15ULfCr6wxbUH3Wb+
	qFTQRtIbs+qwf9C+Gsgfz6fRYL8eIcCECgLNmgWmiwIfq/t2Q0MHecya2Q9cgLkEQAgzjBdWdUHh1
	YDAdZzbCQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHcEx-007FFg-7x; Thu, 04 Mar 2021 00:53:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHXmx-006MJJ-NZ
 for linux-riscv@desiato.infradead.org; Wed, 03 Mar 2021 20:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=67hQubuhQyZUKTwzwOjfbjIS2GjOYvWiwKyRxAHwZbM=; b=fj2kDjxYyJTEQ0iGEqxMZ17He+
 7r+fGH29Ip7XXnMkZXpO6yAWGdOOPZzob8fiuwgGXY54/IAcakdnjBb/SPLv6ZgJ5hGUen2PzEA14
 r1fZp4gzyCNHmWzkk7tz/aXRdZhAkQr2P+BSWBCc/kNioHRfThh48yJSeIH3jaNP5Tx3OaJ9deSP3
 wnSdY5HRwgrGTKyypc/g9uSdwHkv36r2M45Q/Bmn9/vDgLnsLRN7m6h9zV5oRafzJrzrakDdc49e7
 D/ntrNLi8DH1orBI9NY7X4IJTtUR1smKIo7flSCJdkHmNRLnrZ6Yw/h5hvWIL0QeHFSolmVylLzpz
 tAnGj0CA==;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHXmo-0041JN-C7
 for linux-riscv@lists.infradead.org; Wed, 03 Mar 2021 20:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1614802078; x=1646338078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+UrM9fC93iQVxQpcgDIaNlP1BOkdXLEl/GRtnbtfNrk=;
 b=f3azxv3I/x+4+PODRzgMORYbYZwmjxIciln04a4zmSiCQHfv5F3I0N+8
 DEPhh3upGjOiEJn0LGYPsSbThmqH11f9pO9XgLZAgrQ8Kj3QOWAGsqzw4
 aoeZNVIUgoH8jBgiZCeaXhAuSX9tLXADvtCWz2MIvK4RkChs4wHGnArKT
 02+OLuXVOoPsKnuRd7QBcCCAQUAeh6F94shXzUUIu23o0RSHaHkW4fbdU
 gdq0bcTdJ3pRUqf0ViDC9KpHpzHUXOSAIIP/pWbFC5wA0qPkmPhaCUKPc
 XheaB/oRItGSZ1a33XaU7p3Y2AWndKanMbqJfaX1M3fxMsqHZoYesqT9P A==;
IronPort-SDR: s4mLK9KyLuWlSM1pfyRMY/+GCVESbyNFxM217LSOlEjThnYvYMMch77hnsszoHJKAVU3KCuey+
 1alPSGnNi5RJU4Vog6M0L2Ih8rtVPpicuzfdL/Emi70BcqtNB5AxF1rAoc3iNVMOpNG/xeglbP
 kv56tyQri4cMBlJx2H+PWjWedEk/E9D852vmaEBH+u6gPm+mKKOz7kxghXfz+FhaqIi+TgLN8i
 1JBX7r/hrAXTcxtpjIctre9VrMD98dCPqXAmqid85isB2pAcdKhi3eUR8U0ZJLe+YTgEv94cB8
 L7g=
X-IronPort-AV: E=Sophos;i="5.81,220,1610380800"; d="scan'208";a="271907155"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2021 04:07:00 +0800
IronPort-SDR: PzWz60QEPXgdgTGVYp6ugs2vPVx3xIf2+kvwSH4m+7PnlaNIMdDX/bmZCAW/coNNJd9/U0DicD
 v6tWFtEZAqa00qkB6kBPGa3bRXKfvuGEc7FZRHSuee+cTu5O5kzmchft5+djlVTMAxrf380dPa
 Hu65LFsiVaBGg32irdOjp6QpRNxr/sQBIFFPQc1ihUfArBBQ2Z98tkTXfWgYMQ4zwuyEJQKruf
 O0kQ3l8ogbUQCOgQMuqmxLKVNJAOdm31wjP2cGnYCoJTLtXK7E/YwKg27To+XCsxvsTPlHEisq
 eTzLthOwWHVGm+jfntmHhlYL
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2021 11:48:14 -0800
IronPort-SDR: BYOop5Fz7HcrNpwPe2cfxOPaLm7gHPFDwZbo3yLFZjvVPoECDk9AtmXSn1UI/wpgq7vXazFt5q
 mzIvyGlgA9CQv9ouTfsmnUj9xKKKBy+1N2EtZx/CFnv7hW5m1ooz88dTNoRGJ2Ygy+GwsuwqcC
 Dt8yOtK9is61UNnhqm2gZ1E7FxceHp8O/jhwmWCeOG49iPxpTacpQnfgovGc9u1kufmOkT50Px
 NC3nVx3GzHNzq/jq5xp+ZWBWyxs2sf7XMvMYYOGWup3vYGlBuchegI59GR5yLaVZTedHkuQ2G5
 4Ec=
WDCIronportException: Internal
Received: from ind002560.ad.shared (HELO jedi-01.hgst.com) ([10.86.48.105])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Mar 2021 12:07:00 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Conor.Dooley@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Ivan.Griffin@microchip.com, Lewis.Hanly@microchip.com
Subject: [PATCH v4 5/5] MAINTAINERS: add microchip polarfire soc support
Date: Wed,  3 Mar 2021 12:02:53 -0800
Message-Id: <20210303200253.1827553-6-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303200253.1827553-1-atish.patra@wdc.com>
References: <20210303200253.1827553-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_200800_746590_A828AF5D 
X-CRM114-Status: UNSURE (   7.48  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add Cyril Jean and Lewis Hanly as maintainers for the Microchip SoC
directory

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d92f85ca831d..cf186eca1784 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15358,6 +15358,14 @@ F:	arch/riscv/
 N:	riscv
 K:	riscv
 
+RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
+M:	Lewis Hanly <lewis.hanly@microchip.com>
+M:	Cyril Jean <cyril.jean@microchip.com>
+L:	linux-riscv@lists.infradead.org
+S:	Supported
+F:	drivers/soc/microchip/
+F:	include/soc/microchip/mpfs.h
+
 RNBD BLOCK DRIVERS
 M:	Danil Kipnis <danil.kipnis@cloud.ionos.com>
 M:	Jack Wang <jinpu.wang@cloud.ionos.com>
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
