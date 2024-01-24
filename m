Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E547FC46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 08:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m7xnDDhdU9+aQInbfAlLP0nD3CRmkozP0cuMd+1Nqt4=; b=nzlsl0/GGYdJ2m
	pQhXb5VmNkJdBnDKnJK9by8+78lBikVf07U6WnkDLOs3CAScjkCALKN4IcBInanRRbNWo1J2KTVwd
	XyxSSIG2ABEX1wr3Kny7ughvfk/QJpX7xzRsrgaqvFV2tnvbbV2nUnLZvcEyKHr81VlQmSlPg5IGB
	a6jOauevIRAGGMW0cqtpdf1UFz1qvAtlTP6PhnD0ZajIx3SkhCtocIQYYn5bY4Azist5pKEAyWL2Z
	MQSUG34eBh4S3JpF54Ft5VY0X0jkRxbA7cwTtoXb+IGjGSpiUaRgLQoU75JrE9PWx779wCm2h2+Wv
	Mi3OB1VfpsrIlFUKdp0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSYt2-0023KG-3B;
	Wed, 24 Jan 2024 08:45:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSYsz-0023Hi-2M;
	Wed, 24 Jan 2024 08:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5lEen0G4yFCsLlAF+wT6cjA+TZeTYFwLA6f1OlJb35c=; b=Nzo1kG4/6uJi4JkVCN2GnsVPSP
	MSCm4FbOrhPHehb1KUJVrH1BJ3z9cxxbnwCC0zxjG3bD8+skV/uIfdTD6Xjbum3MAfAlH46N/Wp+6
	L7YV4CDoxK1vWQMcHAQgVJyJHoNDrjkuxOIry+Y5WoNfp7WvmbHn0uuneIMiaw3MbPLQllmBXaukX
	TYMxIFTn6SoI9/QX7eY4T0qhBicf+VgU4zXx/IN3Fy2G80u7atBOa9GDJ5r57T/AsDstwl/th3j5P
	hRfBkIRpb/e4q3+Na04s1TcgWKeqoYLVLCnejFkjHgtXQ41c1OGcmGHfEku7EHHcuxCj7+We0ZUXO
	+zL7lf9w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41124)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rSYsi-0003f3-2f;
	Wed, 24 Jan 2024 08:45:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rSYse-0002ld-Qu; Wed, 24 Jan 2024 08:45:08 +0000
Date: Wed, 24 Jan 2024 08:45:08 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, acpica-devel@lists.linuxfoundation.org,
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 05/21] ACPI: Rename ACPI_HOTPLUG_CPU to include
 'present'
Message-ID: <ZbDOFJeRjdaXtVJu@shell.armlinux.org.uk>
References: <CAJZ5v0gwe02uzAQoX0QDHo35OTEozpbnqC6vukjM3aE6HMq9WQ@mail.gmail.com>
 <ZbADTBLDEFtdglho@shell.armlinux.org.uk>
 <CAJZ5v0jh-EdrnjkJep++UDo+Uv4hmR7VV4KYVdF4CK2K+5XLtg@mail.gmail.com>
 <ZbAMjZoybVfiAGcT@shell.armlinux.org.uk>
 <CAJZ5v0gt=MR1JGsPZnZG_AqudA-KMmb4BOa_A6H9B6+Rhe_+JQ@mail.gmail.com>
 <ZbAdAdqqfXRuY3Xj@shell.armlinux.org.uk>
 <CAJZ5v0gsqbeJc4qX-AefOqu53=rDme2XzFXacWz_0zbVBoaXjw@mail.gmail.com>
 <ZbAoJO8f66Dg0lGF@shell.armlinux.org.uk>
 <ZbArzbC19L1YxLHi@shell.armlinux.org.uk>
 <CAJZ5v0jvek=W-FNhiY_0DQha2wDCUv7YW_4jaHUeX0DbYJOX6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0jvek=W-FNhiY_0DQha2wDCUv7YW_4jaHUeX0DbYJOX6Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_004529_769468_BA42D67C 
X-CRM114-Status: GOOD (  11.72  )
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

On Tue, Jan 23, 2024 at 11:05:43PM +0100, Rafael J. Wysocki wrote:
> > So why not state that you personally don't want it in the first
> > place? Why this game of cat and mouse and the constantly changing
> > arguments. I guess it's to waste developers time.
> >
> > Well, I'm calling you out for this, because I'm that pissed off
> > at the amount of time you're causing to be wasted.
> 
> And I don't have to suffer this kind of abuse.  Sorry.

And I've had enough of this crap, so I'm not walking away. Good
riddance.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
