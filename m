Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB67C7EE2C
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 12:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TYfI3XhjVqxEDTWj//pgIp1fy3HEQgBPntO44wgom/8=; b=SlulJY9ES42iHb
	1WKLGiDiOI0OsMYBkWY7PlwvuJf0zNJpPTMzphYJ4gLaMxAX8OViPbCunrlOw32F8isJdK5paKzYd
	oeMiwDbUXjCrXuwI930wyoabf7uJr+gnltIt7Q1z+LYPOxlQIOR03xGK934/h4QENDWRH0iQLQOyW
	07CrMKFiv5hTUuwOv6Bp7qV6g5WBbfiHJAkiBgrrl5ao506BiwCinMS42J2cm+oSDyr/kpfjqpjsO
	K6dSx5jGBkhQJuTH8iEhvQmaA74Y+DcR0mbVg5l7aHdDmai7IgSLAYWUcSMsKTnjl0AidOGN5meAK
	EmcdoVtZsarbSgDnc8Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3yUf-00Drgj-0X;
	Tue, 30 May 2023 12:30:29 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3yUD-00DrHb-0Z;
	Tue, 30 May 2023 12:30:03 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 0F49D5C0187;
	Tue, 30 May 2023 08:29:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 30 May 2023 08:29:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1685449796; x=
	1685536196; bh=EEiwGlX0Rwp4JD9gZJQ2+HoBg+CT8hF4DrYL0banGb4=; b=J
	hSWsjxiEcHNkhsyc3AMDUebr4x6d+5Z/IPmQcP3r3HEa2PV4iCNRm3rpXjqMalMw
	/OE0m3uI6TqVPy5TXs2laPgrna5SS91VjYoT0EXhAxxqYtnfxHMo7QJ6Jnmck2VP
	qm3TSO2CTWhnzg3XOjo+mkHnuk/QAm3oPsYysD8xP3lNHGWahS0Xzz2Vdy00xqfC
	yAn6/IaCpooPjW/r5dFkd/NaFIY0S16nWFqTsAWzyPFXWDFJvzH1dM+PTmRZ6g7j
	2o0X6GJUAtrKbuNWm0yrLAHjaZxrzujAqghJbB5Pgmh3apFHgN+WZcMp8TtzR5PN
	UmtTiyLIs/YDkMAzAHUpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685449796; x=1685536196; bh=EEiwGlX0Rwp4J
	D9gZJQ2+HoBg+CT8hF4DrYL0banGb4=; b=O8gpcmbIa+lNB390LgDoxjyCM0VpN
	DeUDIRCCkjdQ+WpdGdzcgnse0TwvjzKgs5YriXR9QomUEOgfslSoIJc3vkGujs74
	VPkfaqeBhzNmKSfdheBPc28aFjtzgiElyb8XMQ0DCHEgvEKGVEHWluQY5NUAZeJE
	0lhHFHNpkdZmPZZBdDmvBiTp7eiVYb6eCW3ZjMWdk153TSS6tRrEHYat++3ogA0G
	Z8/iPnkXzgVKZDv3CCQVLAT94m9xNd1Y4sHfuu5+Nx2HBWBDzJVK/E2qPoDde2j0
	6E+pDcEqROIFws3Einak7j/Pec39SrUOUvx1BCXKNueY+QbbjiTx3jhIA==
X-ME-Sender: <xms:Qux1ZDpZHdZDdRqzuQ3oUtp4N6AbptLlyGyPf-zqztvLum_Wpk8xEg>
    <xme:Qux1ZNo1F15jgz6IzDPB24Axf7HXd1_RtRQC-fw6kQbdty6wE8mBYqfLb7uXR-P_r
    JVGo2mcRT2J7JcrdCo>
X-ME-Received: <xmr:Qux1ZAMinJKpb7I-Q699cMCl5dTtv9S_hHYYcGI6fA9B46v2Q7yLRFaxadSo-LlFaSYPXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekjedghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdttddttddtvdenucfhrhhomhepfdfmihhr
    ihhllhcutedrucfuhhhuthgvmhhovhdfuceokhhirhhilhhlsehshhhuthgvmhhovhdrnh
    grmhgvqeenucggtffrrghtthgvrhhnpefhieeghfdtfeehtdeftdehgfehuddtvdeuheet
    tddtheejueekjeegueeivdektdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehkihhrihhllhesshhhuhhtvghmohhvrdhnrghmvg
X-ME-Proxy: <xmx:Qux1ZG6ZsOw6xeVtxhzYN2s1-Hwz6qJfUWen7z_-iQrz1HVXN1ijxA>
    <xmx:Qux1ZC7stYJcdgzWQepJmmrvNf0MLSMCayxkwEJj9btY7h4-oM2Vrw>
    <xmx:Qux1ZOh_9TgCy4k005YOTV8O1Ry7xm6HbvZqesWx4liI3OpUdnIllw>
    <xmx:ROx1ZAaQz7AjEzvPi21kVUbjMxYAZy5wCX2Z0W4XoTeRn9P4Z4ohSw>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 May 2023 08:29:54 -0400 (EDT)
Received: by box.shutemov.name (Postfix, from userid 1000)
	id EB5E1104992; Tue, 30 May 2023 15:29:51 +0300 (+03)
Date: Tue, 30 May 2023 15:29:51 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Thomas Gleixner <tglx@linutronix.de>,
	Tom Lendacky <thomas.lendacky@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Brian Gerst <brgerst@gmail.com>,
	Arjan van de Veen <arjan@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,	Paul McKenney <paulmck@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Piotr Gorski <lucjan.lucjanov@gmail.com>,
	Usama Arif <usama.arif@bytedance.com>,	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,	Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>,	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,	Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>,	linux-csky@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,	Sabin Rapan <sabrapan@amazon.com>,
	"Michael Kelley (LINUX)" <mikelley@microsoft.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [patch] x86/smpboot: Disable parallel bootup if cc_vendor != NONE
Message-ID: <20230530122951.2wu5rwcu26ofov6f@box.shutemov.name>
References: <20230524204818.3tjlwah2euncxzmh@box.shutemov.name>
 <87y1lbl7r6.ffs@tglx>
 <87sfbhlwp9.ffs@tglx>
 <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
 <87bki3kkfi.ffs@tglx>
 <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
 <20230530005428.jyrc2ezx5raohlrt@box.shutemov.name>
 <87mt1mjhk3.ffs@tglx>
 <87jzwqjeey.ffs@tglx>
 <87cz2ija1e.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87cz2ija1e.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_053001_308380_621C2C24 
X-CRM114-Status: GOOD (  12.43  )
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

On Tue, May 30, 2023 at 02:09:17PM +0200, Thomas Gleixner wrote:
> The decision to allow parallel bringup of secondary CPUs checks
> CC_ATTR_GUEST_STATE_ENCRYPT to detect encrypted guests. Those cannot use
> parallel bootup because accessing the local APIC is intercepted and raises
> a #VC or #VE, which cannot be handled at that point.
> 
> The check works correctly, but only for AMD encrypted guests. TDX does not
> set that flag.
> 
> Check for cc_vendor != CC_VENDOR_NONE instead. That might be overbroad, but
> definitely works for both AMD and Intel.

It boots fine with TDX, but I think it is wrong. cc_get_vendor() will
report CC_VENDOR_AMD even on bare metal if SME is enabled. I don't think
we want it.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
