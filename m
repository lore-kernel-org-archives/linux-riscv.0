Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E107CA5FD4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 11:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I7qAC/xgVt5p4AxYO4vxTIS1gKEdNYhq7jTZYOcy5bU=; b=eEwTCcYRqMO7DV
	6Jn80urcl6i4ukU2btO6fqjTxWDZgGF2ObnWQGzKbaF1qZwLosN8CtCoSEYdTLSHO1aLIMm58+4Cc
	zZ1Br2Pe9sG+Z1AMKtSaiLtqqnesK5Z20HvbrtmfYpZB0oq+HXdpmVTqcmDhD0zRJaGx/NuBU/YlM
	mOj1Q09fVTzz3PzvQj8dRYoB12vX0M2U0ftgwJAVYgwH6/ehUXY4bkF9mSpxpdFsPsqa27lEgiWZT
	0I2RXC6qmzq3Bk4b4hFJ5ahQzP1LwXYq1nPRKzzokGfeD31zIi181unE40d3yXqNUUM8H/1Gxn2FE
	xbwzIty3c0h+qob5g/Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbH7-0000000BSgC-0y4J;
	Fri, 02 Oct 2026 11:18:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbH5-0000000BSg1-3sn9
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 11:17:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0489F60A70;
	Fri,  2 Oct 2026 11:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74941F000FF;
	Fri,  2 Oct 2026 11:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790939878;
	bh=JoS0lu77ACM7EGZYfr0kwWSZE74B8H61/wxMEgqga4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gBGK8flELtRFW+JD2WB7fDL/jjkXp7bxqBAIOFTnNm5vpXJ8pI0Gq0Kui9mh2UXYL
	 lmSPW/+mXVE0wU+4R5dhSOmOT4WkYJs1DcSb1b6+4IhmM8ELJ5Iuj3K0YTm59EoPz9
	 jddiLy+9CD+b14TGD9lKHnrKjFUTKXpYc2JFmz4hN3JCkW+ZTGy/y4sRMXejc8t6sF
	 qPDOEaC5IKNVGXS5SFK+Frx9GAcxTapzJlqUW55nBjHFfBeo/w772979hFIFGg6Vw9
	 gYjb53kVz5OZw7ZqfUEivHAHl2uowuWy+J0Ro6S2MjqFfphjNT0lEnJQChLKLaTB9J
	 39NStPPAL/mjg==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jennifer Berringer <jberring@redhat.com>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>
Subject: Re: (subset) [PATCH 0/4] riscv: dts: spacemit: Enable USB and PCIe for K3 CoM260
Date: Fri,  2 Oct 2026 11:17:49 +0000
Message-ID: <179093925279.1231617.4093474428218095835.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260928231807.1757995-1-jberring@redhat.com>
References: <20260928231807.1757995-1-jberring@redhat.com>
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


On Mon, 28 Sep 2026 19:18:03 -0400, Jennifer Berringer wrote:
> This patchset enables USB 2.0, USB 3.0, PCIe, and rfkill for the K3
> CoM260 Dev Kit board. This board has 4x USB 3.0 Type-A ports and three
> M.2 slots which may be used for two NVMe drives, Wi-Fi, and Bluetooth.
> 
> The USB Type-C DRD port is not enabled here because the necessary
> drivers have not yet been posted.
> 
> [...]

Applied the USB part, while leave PCIe part for now, thanks!

[1/4] riscv: dts: spacemit: k3-com260: keep dldo4 enabled
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=f314c98807c12272a1902aeda9c648d81b39bad2
[2/4] riscv: dts: spacemit: k3-com260-ifx: Add USB nodes
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=bd56cb9b84f74ef472c71285fee9e28ee414b10a
[4/4] riscv: dts: spacemit: k3-com260-ifx: Add rfkill nodes
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=dad085951db1098a0294da7d78aca1594b0f33f7

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
