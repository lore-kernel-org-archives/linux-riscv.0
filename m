Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EC2C61D94
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 13:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RS/K/CUUTsnbIqVxoLmLS/q6BusS4SCseJHJ+kJgOUM=; b=n9a0eRtFoPdcnK
	dR97EVHVIR0HVS146q09/HTQnoHDnEtrLV7m1GC62c0xt6LmdjywlC9T8JG86QVv/9zL7Rbx0vjDT
	NFxMzHfxmhzbJAqqvzJ6z88fwoZUC9xwcf3neBiQpz4knpLkrfD2PKFZnZ2f3Vw5BrduDBqnPTOO9
	fBRdp2zlnipyid7pKuHIk8D8AQQhazaWMCJlwdeSQ3caMNmo/gZB6nJLI48SdHxdEyUKp/WOh0l4g
	JRpaqFQAYY+IIihA050AHuEWbOErljZKIiIKg1w/wOo1bidSNKx+cjZdo6golG7mCmoDW6v6v6RWE
	JmhC4K+ZtB22Cq5NSwiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Qmh-00Gov4-1y;
	Tue, 21 Nov 2023 13:27:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Qmd-00Gou2-1c;
	Tue, 21 Nov 2023 13:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rH4XXg0XG5JBDQqriE53B4ksPcxyNMkV8utydydYqlE=; b=GptbOphakDgWkgtVyn9kVmSZut
	2zdws9QRSTONl2GEr2a+OIBZrE3jJeI0D17zlWvHurC71V/x0OEPF6ffv784k7DLlc2aBOLE19Z4o
	c0tv6/9S+iTe2UkhfYWBVaiamG9EJTPv9gb0UnQ2E+mlufTRS4ZpZA3hqA7HZlRX89aSKzHu3MJ1l
	WcQbFRHumzI7PayZveu3slicUkYT4CsYU60SPqpcv75Ku2ucJtsjbZP45akWiW287IkZ3VbUy79a4
	0dZN0gESalrlMs8ThicaN1EXR0io2uxwvg6b/yBrH8ePzb7FDP5MvhbzHS0L7bDI0qET3jb0ExwyI
	bdYgIQPw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33300)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r5QmU-00073r-1c;
	Tue, 21 Nov 2023 13:27:10 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r5QmS-0004DC-UA; Tue, 21 Nov 2023 13:27:08 +0000
Date: Tue, 21 Nov 2023 13:27:08 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gavin Shan <gshan@redhat.com>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, linux-csky@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH RFC 10/22] drivers: base: Move cpu_dev_init() after
 node_dev_init()
Message-ID: <ZVywLPwhILp083Jk@shell.armlinux.org.uk>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLV-00CTxS-QB@rmk-PC.armlinux.org.uk>
 <095c2d24-735b-4ce2-ba2e-9ec2164f2237@redhat.com>
 <ZVHXk9JG7gUjtERt@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZVHXk9JG7gUjtERt@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_052719_559252_EC4412A4 
X-CRM114-Status: GOOD (  18.87  )
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

On Mon, Nov 13, 2023 at 08:00:19AM +0000, Russell King (Oracle) wrote:
> On Mon, Nov 13, 2023 at 10:58:46AM +1000, Gavin Shan wrote:
> > 
> > 
> > On 11/7/23 20:30, Russell King (Oracle) wrote:
> > > From: James Morse <james.morse@arm.com>
> > > 
> > > NUMA systems require the node descriptions to be ready before CPUs are
> > > registered. This is so that the node symlinks can be created in sysfs.
> > > 
> > > Currently no NUMA platform uses GENERIC_CPU_DEVICES, meaning that CPUs
> > > are registered by arch code, instead of cpu_dev_init().
> > > 
> > > Move cpu_dev_init() after node_dev_init() so that NUMA architectures
> > > can use GENERIC_CPU_DEVICES.
> > > 
> > > Signed-off-by: James Morse <james.morse@arm.com>
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > ---
> > > Note: Jonathan's comment still needs addressing - see
> > >    https://lore.kernel.org/r/20230914121612.00006ac7@Huawei.com
> > > ---
> > >   drivers/base/init.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > 
> > With Jonathan's comments addressed:
> 
> That needs James' input, which is why I made the note on the patch.

I'm going to be posting the series without RFC soon, and it will be
with Jonathan's comment unaddressed - because as I've said several
times it needs James' input and we have sadly not yet received that.

Short of waiting until James can respond, I don't think there are
any other alternatives.

I do hope we can get this queued up for v6.8 though.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
