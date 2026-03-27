Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3DA10ED64A
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 11:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V0bNEdgQqcMvvsBF/7hGdkHpYq2SnAB7NVmTbXsrAoY=; b=AU4/9uQE4ZXhEI
	nt9n/N41bGge6ad2RoCWD8PSXyzhspK91CTr5DSUBTMMfxJqHl2XEc/UfOxQhKuEMyOubfFvSI3Zt
	ZDr2mbekS7cZjT/iX7IO6lU+XQwGfiD48fMndF0hDdv5a80Yf+wgtnUaLD83bfVTBv4UnBNBkoFfo
	PofE4DQJYIfaN+oWG//YQQnvszcPZXjhP4U2Lip16GOyacCZUT6kW/7vZuBZusGgOP9l1tJknngJq
	SkBjy+5JRXz+bXaa3hxYcGrQEw0iDgD5wiTA/5w97w6WiA7PeOTLTCdTAdnhjivlDZrJMZRgMl0nB
	PGJVl6fhGgCZOPkizJuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65XM-00000007HXX-0v5p;
	Fri, 27 Mar 2026 11:39:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65XK-00000007HXH-3qnH
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 11:39:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C53F6185B;
	Fri, 27 Mar 2026 11:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E33C19423;
	Fri, 27 Mar 2026 11:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611574;
	bh=a/bpIagK/q6Fo+O8jZ6uB1SAOrF4Lf9H8hOIHssor2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QGkF+hZJ5CxTBfnAgqv9k1d4aOdUnaun1j2O7p70LUgzrP5rlyOPQDEq60sGXZYj+
	 /YAIb/7EbakISE8iiwEtb7JTyCl2cVRnNy+bpaPTn0WU+TjSgY14wMStbGNVYBjomn
	 Fg6zYPvx7f7p4D7356J3gNAvgHek8IoXF5Wbz3Ui6Zj7/SbwovzrEjfOHBMmmaO0wE
	 fLpIdDcG3sxUCcrMPKZppdUVMX5Kf75jDDg4xYvdnXAS5+cZZoLlSDtWXiikLXNjx3
	 hZFc3JDDxYU6llFm5iMW1BvIuBACJXXpZnsjbGvFgzZNMOnc6EsFnDVUYQVZ9h3I7h
	 DDbHrYWEmZ1YA==
From: Yixun Lan <dlan@kernel.org>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Aurelien Jarno <aurelien@aurel32.net>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 0/6] riscv: dts: spacemit: enable more devices on Milk-V Jupiter
Date: Fri, 27 Mar 2026 11:39:23 +0000
Message-ID: <177461153511.339472.17283642894074299016.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326183745.1370642-1-aurelien@aurel32.net>
References: <20260326183745.1370642-1-aurelien@aurel32.net>
MIME-Version: 1.0
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


On Thu, 26 Mar 2026 19:35:28 +0100, Aurelien Jarno wrote:
> This patchset improves support of the Milk-V Jupiter board by enabling
> more devices. Most notably the NOR flash (useful for upgrading the
> bootloader), the USB 3 ports and the PCIe ports.
> 
> It was inspired by the Banana Pi F3 device tree file. It is based
> against the k1/dt-for-next branch and does not have any other
> dependency.
> 
> [...]

Applied, thanks!

[1/6] riscv: dts: spacemit: add LEDs for Milk-V Jupiter board
      https://github.com/spacemit-com/linux/commit/334e64abacd3df4005de80b082d0dbf02b453c76
[2/6] riscv: dts: spacemit: add 24c04 eeprom on Milk-V Jupiter
      https://github.com/spacemit-com/linux/commit/77156216f1d0f57e1cfce3452410db20468edca4
[3/6] riscv: dts: spacemit: add i2c aliases on Milk-V Jupiter
      https://github.com/spacemit-com/linux/commit/7af5edec73d5d69618541f91600adeb6f35b7d17
[4/6] riscv: dts: spacemit: enable QSPI and add SPI NOR on Milk-V Jupiter
      https://github.com/spacemit-com/linux/commit/2829823956f0f590f5c6b4eafed2dab7a96f69b3
[5/6] riscv: dts: spacemit: enable USB 3 ports on Milk-V Jupiter
      https://github.com/spacemit-com/linux/commit/dce01d8585a22f708b5f1eb621cacd9878258ac8
[6/6] riscv: dts: spacemit: enable PCIe ports on Milk-V Jupiter
      https://github.com/spacemit-com/linux/commit/2b8bd26bbfcdeb1a06127dcd8f9101080133f2a1

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
