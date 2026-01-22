Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD26D3EE86
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 15:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0VMHegZ5+HVrkjcddFR5JnHEeFAIq1SSesLDJgwVQtY=; b=HdUPO0r67wPaUI
	e1zdobqBE0h8jZgbJDmJ4zlG6hRRjw9shUC/ZiqhX2hJAesdY2kDZAmWnNBqX6oCzRm0lNfp/X2oD
	vsNxtwjWNKgghfXJGSTRGPr9vR7zkhaTRHjyR215Zlel1zuG2EkgIlxnxHvFn8HaSuQvMlbKk1kXA
	OrdZnRZDjtu1oMCV6toHNPbuojTp1tQkdbI/Sq9VnmXigvus08yfYyHp4S/3hPnak9QFr5PeFYiag
	WYkEqpTzDTdiaCmw86Q381Cr7YwaXxg138/4/4FiC4tyNL8BS6JIBbSfN9MRvsIRORWbJmWaOPRH3
	9X3csGhe6ob8VS2WgmVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vix3m-00000007N5b-1qIK;
	Thu, 22 Jan 2026 15:57:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vix3k-00000007N54-0rml
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 15:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Lf8vDYqu1Xu0V5DclzIs8XXcHnL+X33ULLs3B4+PCl8=; b=txkh47TsffNxAQyn9D7y/qFpdO
	GtDdajbkxbuL1vAjxWKuPQwJQ0NXnQdU4YPkKC7m5zarvb82G/cSyr6dNRt7u5SZs9VI0A6jJ0mup
	iF39nbqTwjZjWPiMBflT7AodZF3kzC/IR2B3IVXx5f2E2SUbitZXxkvfQxt6I2uWeiy8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1viwS1-003zTF-Us; Thu, 22 Jan 2026 16:18:25 +0100
Date: Thu, 22 Jan 2026 16:18:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, dlan@kernel.org,
	edumazet@google.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
	pabeni@redhat.com, spacemit@lists.linux.dev,
	wangruikang@iscas.ac.cn
Subject: Re: [PATCH 1/1] net: spacemit: display phy driver information
Message-ID: <4493e09c-e4fb-424d-a44a-1e4d4510e4e2@lunn.ch>
References: <b4e0b1d2-cd6d-40f3-89fc-c1bd41c82480@lunn.ch>
 <20260122150601.586846-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122150601.586846-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_075724_239090_FAFB9054 
X-CRM114-Status: GOOD (  10.13  )
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

On Thu, Jan 22, 2026 at 11:06:01PM +0800, Chukun Pan wrote:
> Hi,
> 
> > > Print the PHY driver used and interrupt status after connection.
> >
> > The standard way to do this is call phy_attached_info(). Is it missing
> > some information you need?
> 
> I initially used phy_attached_info(), but it was too long and printed
> phydev_name() "cac80000.ethernet:01" twice:
> 
> YT8531 Gigabit Ethernet cac80000.ethernet:01: attached PHY driver (mii_bus:phy_addr=cac80000.ethernet:01, irq=POLL)

This is what everybody expects, so you should use it.

You have some control over the names, it is the name you assign when
creating the struct device. Maybe you can shorten them.

	Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
