Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24788C04A6A
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 07:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F68s/AORXaNObSW6OS5Sy1Ldj4AxCRg7D2RI7wKOUCU=; b=g0JJXtxkSiOaVe
	9ZEJLV1fYK5rOvuwfvyVS1GuvG0Qo+v+0KRGh4UgwjcDbas48JHWQM4ELppLw1R5BQDaPA2i3Sqzl
	6js3YqtUmq4htNmKd97TBiwFSqUaenwWO9gZDMsS5hf5b4p+C6qtsfxFmK6AsiiM/dHXODZ8JALF3
	f97VxICxQqg4SFIJk4wL30CtOyhNWrFoycvKs44NyofXTF/7IZWH28AtppVPZc5xX3d76pGqjV3cf
	9kv66Tm4fsfnJXmCsR8u2zZrlTAF9vaSHYTxm7PmdnYWSs37hFbmQbMLWGUQYW4FGQTmGh+Yp0hzk
	MKd9cQ84oIOrHrkE1KHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCXI-006bPo-1w;
	Tue, 25 Jul 2023 07:32:48 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCXE-006bLc-2F
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 07:32:47 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 336398284;
	Tue, 25 Jul 2023 15:31:57 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 25 Jul
 2023 15:30:40 +0800
Received: from starfive-sdk.starfivetech.com (171.223.208.138) by
 EXMBX062.cuchost.com (172.16.6.62) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Tue, 25 Jul 2023 15:30:39 +0800
From: Samin Guo <samin.guo@starfivetech.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>
CC: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, "Emil Renner
 Berthing" <emil.renner.berthing@canonical.com>, Samin Guo
	<samin.guo@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>
Subject: [-next v1 0/1] Add StarFive Visionfive 2 v1.3B gmac phy configuration
Date: Tue, 25 Jul 2023 15:30:38 +0800
Message-ID: <20230725073039.14382-1-samin.guo@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_003244_932559_5C623CEE 
X-CRM114-Status: UNSURE (   6.97  )
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

This patch adds the configuration of StarFive Visifive 2 v1.3B gmac phy.
It contains drive strength and inverting configurations. After adding
these properties, the Ethernet of Visionfive v1.3B can work properly.

motorcomm,rx-xxx-drv-microamp attributes[1] have been applied to
netdev/net-next.git (main), other attributes mainline are already supported.

[1]: https://patchwork.kernel.org/project/netdevbpf/cover/20230720111509.21843-1-samin.guo@starfivetech.com

Samin Guo (1):
  riscv: dts: starfive: visionfive 2: Add v1.3B gmac phy configuration

 .../dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dts  | 9 +++++++++
 1 file changed, 9 insertions(+)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
