Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25541CD5BB1
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 13:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OlnUCsuVlTQ84TMQU6MpXE029Uxz9myRIiX5feTEjxQ=; b=XVHC3R00QILgbJ
	pMBCx9CKxm6VZlCRvrCX7/sjAgvVr6i+6Xxx35AP/6wVSdV2p5E9f+KLvY6a2CWeqWSF+ascfZFTi
	kGxaeQnypMvQnmnmR+WggbyAFXIYtrBjr86VI2nV26sqQCA+eLBvajuoeGMnWXLc2uaoH7L8DqANQ
	7UONAGPW6nBpAFecuHzSUaHmn8zBOUJRHmDR3POkRSJHrm/rGoEMUT2ALBedFMh/vz6XPnld5+eYT
	/jw09yIW/JntSdaF0JwPU4DIPdGjzSCWUjlc0YD+FPnf4gGUF/3igNBMRmoy/bunefGxoP56613P6
	2Ig55cDgbY7I5OeQweAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ31l-00000007nip-2pBJ;
	Thu, 21 May 2026 13:01:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ31i-00000007niL-0PZa
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 13:01:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 667BA41B17;
	Thu, 21 May 2026 13:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E454B1F000E9;
	Thu, 21 May 2026 13:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779368485;
	bh=YZ4Q3TUDO2GIop7GRyVIOG7OcA4OTXp7XlWjhqU8v/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YQzDXNuydk9jwibHbEes12ds66ESkTE8eyo5qKVKsOw8bZclsMscV09t4FUiAnSoM
	 5M64ai58AK16ClOm1Sf49PpUrAcfrPHjkYv/pQ0uS8LJQdve7+Y4gOo5iLTdokSpBC
	 LPDLZqcwRMmUSCivmnekAB0cT98ufnYnPl5Gng4kjZiOiLbbAbaFF/sGFEEjJN1E0Y
	 TYvc09KJIqjoU0x2J/CmwKybhFv8H1ELM/2W+NsoPQW+gFzQrlvoygYrBOWorEfzyP
	 7pex8RxEPGnQTPpE1CGJwdK/QMn6z+bZxyl1a8BZSYDuhkHZ43N4HSLxivVeM4jwoy
	 jdTyyg9Xhg45g==
From: Yixun Lan <dlan@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Shuwei Wu <shuwei.wu@mailbox.org>
Subject: Re: (subset) [PATCH v5 0/3] thermal: spacemit: Add support for SpacemiT K1 SoC thermal sensor
Date: Thu, 21 May 2026 13:01:16 +0000
Message-ID: <177936776325.387485.15662058076324687710.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427-k1-thermal-v5-0-df39187480ed@mailbox.org>
References: <20260427-k1-thermal-v5-0-df39187480ed@mailbox.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_060126_163770_8F37B6B1 
X-CRM114-Status: UNSURE (   8.16  )
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-pm@vger.kernel.org, Yao Zi <me@ziyao.cc>, Gong Shuai <gsh517025@gmail.com>, linux-kernel@vger.kernel.org, Vincent Legoll <legoll@online.fr>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Mon, 27 Apr 2026 15:15:14 +0800, Shuwei Wu wrote:
> Introduce support for the on-die thermal sensor found
> on the SpacemiT K1 SoC.
> 
> Include the device tree binding documentation in YAML format, the
> thermal sensor driver implementation, and the device tree changes to
> enable the sensor on K1 SoC.
> 
> [...]

Applied, thanks!

[3/3] riscv: dts: spacemit: Add thermal sensor for K1 SoC
      https://github.com/spacemit-com/linux/commit/247c77ff5806bcd6a5ff802718de1f0aa2bcba6c

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
