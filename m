Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1595CCFA1A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Nov 2025 11:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pejmXkpkQ9pez8phLUqSUEB0uftPvYrj6A4ALWH2aOY=; b=Gofv6+9RpCw6TX
	jzknln/GiJJOCkwLiGpq7+1cnr1JooCubZ91bMxQXsqjrmJVoBLXlbhyRLocaLOZs4LlB0cr9LLv2
	nLSIupC/uRPZvBcIIeK5fy9IzIa4phdjRRK+zqZ8oEXbrt1ChowvQiQ0F35HW8ggfxYHK4AT2mFIF
	V37jcA4J2VOBDK6QDbQb4+rERKi32AJFTKoYdd+YwN9hFvaC/y7Mlbfz8Y1WY3jdKKomGY0jeGGyg
	+QlK78AjWwFvocMRtuQGv4/aNiv26HxdR8JhFGQiGKq06GZ6uuQ1Ad9J1E4fjDT4fN5d+8i0iNRul
	O5RC3rOgOaxwR7stfWyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8hq-00000008duu-1atE;
	Wed, 12 Nov 2025 11:08:06 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8hm-00000008duK-2clq
	for linux-riscv@lists.infradead.org;
	Wed, 12 Nov 2025 11:08:04 +0000
Received: from ofsar (unknown [116.232.48.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3BA28341E70;
	Wed, 12 Nov 2025 11:07:53 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Encrow Thorne <jyc0019@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: dts: spacemit: define all missing I2C controller nodes
Date: Wed, 12 Nov 2025 19:07:48 +0800
Message-ID: <176294559674.467363.5417599191009488468.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251105-k1-add-i2c-node-v1-0-d18dae246137@linux.spacemit.com>
References: <20251105-k1-add-i2c-node-v1-0-d18dae246137@linux.spacemit.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_030802_692694_B3C1BDB6 
X-CRM114-Status: UNSURE (   6.63  )
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


On Wed, 05 Nov 2025 11:37:42 +0800, Troy Mitchell wrote:
> Some I2C controllers exist in the hardware but are missing in the dtsi
> file.
> 
> This series adds the corresponding nodes.
> 
> 

Applied, thanks!

[1/2] riscv: dts: spacemit: reorder i2c2 node
      https://github.com/spacemit-com/linux/commit/3b70f972b6fb769bdee780b5b4639585845d6af4
[2/2] riscv: dts: spacemit: define all missing I2C controller nodes
      https://github.com/spacemit-com/linux/commit/5a97a38c22799a802f33001dcb022d2942fe4a41

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
