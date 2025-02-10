Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E420BC021A5
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 19:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23U00INaM7/AHmYTva4+pQOnXkalKpjC3BugfoUBL9o=; b=0MOQTjM3/V6dYA
	Oi0j6/oFGVGAXXPWd8lX6JpAKc49BTC86IJfMAdf676x2pOUdn/2htGKLBh669ZRVwflXn4JJs5qp
	DUiUvmu5k7U+v+/KDV7t1e5RoFeny2wCB6v+FyQuEKoeTyudCAxwBr/p4FspmSkLboS2+x8Hno8cD
	MF6h86+FkSxnEwUmm48ld46W3ayLUeYTtyusWHZ4D+e8UkX4J8fui4eF1ksA+0M7hf/DBa9gJYXNY
	zZe7FBtu/T8B9BIlN0kPYZlgE/1xTRe9qcUMW/QdkpTdILPN2rfPteNvVLAWKCsrOiNU4tO0ZKUp/
	WB2bvFbZ68Qv967vgs7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZYt-000000017Qi-1ocY;
	Mon, 10 Feb 2025 19:35:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thZ2i-0000000123Y-02VX
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 19:02:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 607875C5A9F;
	Mon, 10 Feb 2025 19:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC53C4CEE7;
	Mon, 10 Feb 2025 19:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739214122;
	bh=sAZdVDmiaTRCmf0IkBkoDIET23qGjuT0YLtH52rbHCM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nAnUmeTFiU6ixy3ne98p3ltY8J67kZYDYf7GxxSUyxc9t/0tSHyb6kiSxFMsXnzjw
	 NP3Eej3h8PdWIuJds+q/ZP9nULBtap26iAaDYAeuBKjhK5V9VUBkr2HBOfB6Fo86hv
	 5P5baPok3mPbVHZpCuKICt5LFWmCopGtr2pJkGRN7bVxcIydl0ItxQKwPZNwXWf/U5
	 IPqVGSfoEAgI4KBb+zNiHNeH38S7I57+9Fdxg6ryuUmskLaRqwXLcNpSkFBksKhFXd
	 riDH+YNcdkbOW0KemAfzc9mcsPgXRIFd576eLkAgWNCgF4jLtV7c86qA2mm9RDjO6k
	 u5daQHxPkMkVg==
From: Conor Dooley <conor@kernel.org>
To: conor@kernel.org,
	kernel@esmil.dk,
	robh@kernel.org,
	krzk+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shengyu Qu <wiagn233@outlook.com>
Cc: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v1] riscv: dts: starfive: Unify regulator naming scheme
Date: Mon, 10 Feb 2025 19:01:51 +0000
Message-ID: <20250210-banish-eternity-b1168fe47047@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <TYCPR01MB8437F6FCD14E116B6CBBA09098F72@TYCPR01MB8437.jpnprd01.prod.outlook.com>
References: <TYCPR01MB8437F6FCD14E116B6CBBA09098F72@TYCPR01MB8437.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=439; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=UQw5Egv0d2/v0E8mm1dyXKsG5bGJ9j9WfOpRO6obpLo=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOmrfOUPeSh9klCyOr246lWt37zkyQ5Vt/7M9xFb55GTM 0PfnPN8RykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbSco3hn/2r7w88Km0FSxtf PavlUH32/0uk6pa6DA/GrXPP3zSp8mRkOPujT/o4D0NFzV197YUPS5Ni1lheKmqbVHe/pGjCB46 /nAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_110204_092243_FC2C3EE7 
X-CRM114-Status: UNSURE (   5.67  )
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

On Thu, 06 Feb 2025 01:16:35 +0800, Shengyu Qu wrote:
> Currently, there are 3 regulators defined in JH7110's common device tree,
> but regulator names are mixed with "-" and "_". So unify them to "_",
> which is more often to be seen in other dts files.
> 
> 

Applied to riscv-dt-for-next, thanks!

[1/1] riscv: dts: starfive: Unify regulator naming scheme
      https://git.kernel.org/conor/c/6b47db27468c

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
