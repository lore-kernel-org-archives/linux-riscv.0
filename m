Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC0AC3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 07:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NCoyqdeddzL1B3kf/gBC6FbrNglDVhDtQpOR9y6C0cs=; b=4xKPV/0KS535K3
	tqNoNfklgkwezrMdzI/39WlM75qIZ/bqUjmiHNoqI+esWsadjFU3BX8GEA9ljZ8MnF3OBwNiZd4nh
	5/azUdfmn5FTGxn/tDG3CA1pxTRoNBPntLKjj9duqYvF53pBZJMSFhGcEE/7uob2NwHTgovJjs1Ye
	G6pUwYllf96euC0rkIyj+jdaUcDIIivK7IyA46O8tqgKqqGfASnpcMSqgx+/F/fU9wAuqFi1R4mAD
	ctJR391cVg67WzBo9nkT9CkUjOyRBpBfe3hXgn2BkFq2ot9ZBgk0HxrtcsqiIVh7KUbSiSS35CM0o
	0F/jG94R1DCo7z/sGWGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRS4N-00000009meU-0bsm;
	Wed, 10 Jul 2024 07:48:55 +0000
Received: from 5.mo560.mail-out.ovh.net ([87.98.181.248])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRS4J-00000009mbJ-3bno
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 07:48:53 +0000
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.140.100])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4WJqjf19mSz1Hw9
	for <linux-riscv@lists.infradead.org>; Wed, 10 Jul 2024 07:48:38 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-r67vw (unknown [10.111.174.42])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id D278C1FE90;
	Wed, 10 Jul 2024 07:48:31 +0000 (UTC)
Received: from etezian.org ([37.59.142.97])
	by ghost-submission-6684bf9d7b-r67vw with ESMTPSA
	id RP03Ls88jmZigQgAT/Bd8w
	(envelope-from <andi@etezian.org>); Wed, 10 Jul 2024 07:48:31 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-97G002cc69158a-4158-4f76-8eca-04ea18067c8a,
                    5DA0C46D5EC14CA26BF336A1987C86317D8662FA) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 194.230.248.195
From: Andi Shyti <andi.shyti@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Drew Fustini <dfustini@tenstorrent.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Conor Dooley <conor@kernel.org>, 
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
References: <20240618-i2c-th1520-v3-0-3042590a16b1@bootlin.com>
Subject: Re: (subset) [PATCH v3 0/3] Add I2C support on TH1520
Message-Id: <172059771094.2294116.14777114514280404581.b4-ty@kernel.org>
Date: Wed, 10 Jul 2024 09:48:30 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 4383409814818392609
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrfedtgdduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeffteehudffvdfhudfgffdugfejjeduheehgeefgeeuhfeiuefghffgueffvdfgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdduleegrddvfedtrddvgeekrdduleehpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheeitddpmhhouggvpehsmhhtphhouhht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_004852_139251_EC23AD51 
X-CRM114-Status: GOOD (  10.80  )
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

Hi

On Tue, 18 Jun 2024 09:42:37 +0200, Thomas Bonnefille wrote:
> This adds I2C support in the device tree of the T-Head TH1520 RISCV-SoC
> and a default configuration for the BeagleV-Ahead. It appears that the
> TH1520 I2C is already supported in the upstream kernel through the
> Synopsis Designware I2C adapter driver.
> 
> This patch depends on the clock patch from Drew Fustini
> Link: https://lore.kernel.org/linux-riscv/20240615-th1520-clk-v1-0-3ba4978c4d6b@tenstorrent.com
> and the pinctrl patch from Emil Renner Berthing
> Link: https://lore.kernel.org/linux-riscv/20240103132852.298964-1-emil.renner.berthing@canonical.com
> 
> [...]

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/local tree

Thank you,
Andi

Patches applied
===============
[1/3] dt-bindings: i2c: dw: Document compatible thead,th1520-i2c
      commit: 00fa2450c11138c1c3171224cd2727a3a6240bae


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
