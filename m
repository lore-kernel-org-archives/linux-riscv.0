Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CBFC072A2
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Nov 2023 14:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=suYucBp3g+i+hHOJx1sYl4W62RMjjcqh268JFKZ8pq8=; b=bNk0FYB4QlRX1j
	0/+YWHroezGydgnlRVrBUp9gLkOuBORo6TSg5qCOzdPtlOemSiUUGm265llwBcIxp7BGHxUjAFM1Y
	QE28WLg6nPyXqG0+1dqcLhdWOt7EKUpnelp3dpG+VftD/IIV6f9+NlAlf+wxm6n+JMJeCFJVTTCWz
	/G9v6v42AnjXtIPt4hp0TRWgItHa/pXwqugyZwM+jrCFsyDjqWfNx42DPrr9ZaaWcq2FSHQkybmAw
	Hznpmcuv7VIiuPEHIvuN3t4u10LgJTRvqHtnv2Q0Oif28SuSxta0rU+nMIjGywrqQuyh4iy+vxcuV
	4Xnew4o0iqIAR8m3ampw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4iUf-00AGgp-0v;
	Sun, 19 Nov 2023 14:09:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4iUb-00AGfn-1V
	for linux-riscv@lists.infradead.org;
	Sun, 19 Nov 2023 14:09:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3490860C40;
	Sun, 19 Nov 2023 14:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D134C433C8;
	Sun, 19 Nov 2023 14:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700402982;
	bh=7N8+AO5RbylkHQ8VIxChK+V+uCnDFu5m8DO1LQeIS6Y=;
	h=Date:From:To:Cc:Subject:From;
	b=VQtkokfBqNQZFdmySJ7BmdDEbihdLD6pV5tBipZsroId7SLe7iqiZhWghV0s4HGpk
	 EBlpU3NZfeRIl1opIDNDZO09G/ZOJ/mERyyoZ4UShU16EOkTB0JMLPSiVtvElD2H+b
	 gEwoHUYoqmmq4f72d95ca+fdJMo+OqPdVsRXvgwN3pWOLLlQ3lK/mJETiG7dx3kUnx
	 sas2WoZjIUnlXU75PYB5nVFhkEtQ/5Pf5fEXadl/OAm2h3Xs1LgWZ/63DiD/iY4SBn
	 2FZEm9UzVh9QgyboN3+hY8mqjY/eecySD1gJWtb2IMvug7MN4gwANk8eaW9wKkg0ot
	 /TCiPLpN53OUQ==
Date: Sun, 19 Nov 2023 21:57:17 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>, HeinerKallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S.Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: netdev@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [RFC] support built-in ethernet phy which needs some mmio accesses
Message-ID: <ZVoUPW8pJmv5AT10@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_060945_728982_C7A09410 
X-CRM114-Status: UNSURE (   6.78  )
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

Hi,

I want to upstream milkv duo (powered by cv1800b) ethernet support. The SoC
contains a built-in eth phy which also needs some initialization via.
mmio access during init. So, I need to do something like this(sol A):

in dtsi:

ephy@abcd {
	compatbile = "sophgo,cv1800b-ephy";
	...
};

in ephy driver:

static struct phy_driver ephy_driver {
	various implementaion via standard phy_read/phy_write;
};

int ephy_probe(platform_device *pdev)
{
	init via. readl() and writel();
	phy_drivers_register(&ephy_driver);
}

int ephy_remove()
{
	phy_drivers_unregister();
}
I'm not sure whether this kind of driver modeling can be accepted or
not. The advantage of this solution is there's no hardcoding at all, the
big problem is the ephy is initialized during probe() rather than
config_init().

The vendor kernel src supports the ephy in the following way(will be
called as sol B):
in phy driver's .config_init() maps the ephy reg via. ioremap()
then init via. readl/writel on the mapped space. Obviously, this
isn't acceptable due to the hardcoding of ephy reg base and size.
But the advantage is it delay the ephy init until config_init() is
called.

could you please give some advice?

Thanks in advance

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
