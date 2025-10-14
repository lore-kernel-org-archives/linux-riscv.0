Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61321CCD185
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 00:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4sSjzKhKleb9WTmJ585a+gUDxHPun1np4ejJwOJBjA=; b=KzXZ1S3HhScwzh
	Gsm0pX7ff5D2X05Xm3IjLRxVCtWPjQIOt1/0ycIrwIgX/ieDHFARUZLjzsU07kfBZResxfP3/srLL
	1bvFRIK2Qu/NN4O+QiUbto3mNWJszL8FUDyQn1GUt5WLW+cmQPUIZost1aQU5/c46gzQhbam4dmfF
	UL5YiGJ0ov65K+wVCPHV21uORpOFoSgZKA36oufsCYwCQxcYaieIEELF8r0+9jQbwnjfTR91FBepS
	0J9Njw1GHVM6Ko9H/4wDGwJlAnt6JlLwFVcBcSFcAqa2K31p70XnXBJFsu9af9c/mQLOqK5UFV09Q
	ZvKQDUrVejwd8lZm5Piw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Sk2-0000000EpAH-2liE;
	Tue, 14 Oct 2025 00:18:14 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Sjz-0000000Ep9T-2tUw
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 00:18:13 +0000
Received: from ofsar (unknown [116.232.147.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 1837A340E9A;
	Tue, 14 Oct 2025 00:18:06 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Aurelien Jarno <aurelien@aurel32.net>
Cc: Yixun Lan <dlan@gentoo.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v3 0/3] riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
Date: Tue, 14 Oct 2025 08:18:00 +0800
Message-ID: <176040093505.976672.8840719266527899813.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926175833.3048516-1-aurelien@aurel32.net>
References: <20250926175833.3048516-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_171811_789942_00F94517 
X-CRM114-Status: UNSURE (   8.87  )
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


On Fri, 26 Sep 2025 19:54:36 +0200, Aurelien Jarno wrote:
> The BPI-F3 board has a 24c02 eeprom connected to the i2c bus #2. It
> holds board data. This patchset adds support for it.
> 
> Changes between version 2 and version 3:
> 
> - Revert the name change for i2c2-0-cfg and i2c2-0-pins, the second cell
>   is not a function number, but an index.
> 
> [...]

Applied, thanks!

[1/3] riscv: dts: spacemit: enable the i2c2 adapter on BPI-F3
      https://github.com/spacemit-com/linux/commit/dcca2287773b69201b756723e8d45b6b8ad81b34
[2/3] riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
      https://github.com/spacemit-com/linux/commit/bfce75e2345fa1ecbf046e696994132f56d6db1c
[3/3] riscv: dts: spacemit: add i2c aliases on BPI-F3
      https://github.com/spacemit-com/linux/commit/859ce3828f0b462e991c24224390def4c8fea673

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
