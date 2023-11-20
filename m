Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE226C2BB3F
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 15:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/T4WowwTOdwIGsCGsw44n1VZbBUbp/fC1bDgFzupH/o=; b=qGj6WHAo5DXxWU
	q8Pir9sva+j7kcsyaMAa3Q1a4Eqbo7JaY2bvoeT6wr96oE/EeLMshb+o5YbiwStW+gtXV1zlbM96j
	UOrlXQOO3ueLaxRC7l6eiPat323bbnAcfEqB7nWTYj+4YE8S0rjwWu2oN5/3mHLOWDaKhiWdv+wHr
	CfvOqCgz3ZfXHcgq0rWgwPg+9J0yWfX1xt0uMYN3XpgvK1aSW3afnHtA3PlE0L5g/iS6ID6XEjmKd
	/36OIbj0NKsNiNDpZZ3G5yawqp5BhozP0iB9r/wcr0TBQHJjO1XXtsAUHzebj628JH8Z1Wp7sBd5n
	7JF37i6Eyo5mVUDFU3fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r56c6-00Cuq0-0g;
	Mon, 20 Nov 2023 15:55:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r56c3-00Culh-2H
	for linux-riscv@lists.infradead.org;
	Mon, 20 Nov 2023 15:55:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xG7MmkhhfDASThdLFI7jdgsl+nkmbg8g3VVsC+Rw/3A=; b=yjvQIh0FOXAmL5mMJvOy7gZm6G
	bvm/LnwnGmMMyADy8vrtmVZrblKwp3Ho7/MXqX8/g+/kfv+eR5ogoBUNSzoj8Sbq+8S7692v6indO
	ZxdUndnuBntK7ImW1yvqYNHaq0f1U+tmuZgOhd7wQ12EyrblNy4AHlCJDFv+/hPWLmq4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r56bo-000f3Z-Rm; Mon, 20 Nov 2023 16:54:48 +0100
Date: Mon, 20 Nov 2023 16:54:48 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: HeinerKallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S.Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>, netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC] support built-in ethernet phy which needs some mmio
 accesses
Message-ID: <e3337e9e-a53d-4480-9a99-4594625450a1@lunn.ch>
References: <ZVoUPW8pJmv5AT10@xhacker>
 <b8c29d27-e0a2-4378-ba5f-6d95a438c023@lunn.ch>
 <ZVtnRHsnDd+ZdZpq@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZVtnRHsnDd+ZdZpq@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_075503_749191_B4177F5A 
X-CRM114-Status: UNSURE (   8.91  )
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

> Per my understanding of the vendor code, it reads calibration data from
> efuse

Linux should have an API for accessing efuse data. So please make use
of that.

What address space is

#define REG_EPHY_TOP_WRAP 0x03009800
#define REG_EPHY_BASE 0x03009000

in? Is this range dedicated to the PHY? Is it within the MAC address
space?

Does the datasheet describe the PHY pages? I'm wondering if you can
access the same registers via MDIO?

Where is the MDIO driver? Since this is integrated into the silicon,
it could be MDIO is not actually MDIO and is much faster. If you can
access the same registers via MIDO, that would be the cleaner way to
do it.

   Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
