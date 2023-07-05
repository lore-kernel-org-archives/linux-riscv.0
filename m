Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F15EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 15:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nk65Xznt75YvRQRnoQLo2lNpqZWiCPLqqiJ/nLUdztU=; b=bnIdkL9k86AoXj
	3T8DZBjaB/wa8tEpglKhLu3nSVuEr6SIKOJr1oq29xOaIcxztsu931rAokSArbLf8CMk+XDllBWTq
	PZPh9Y8HVQ86ksPAhJghcYXpSePK7ojN54ZG5N+myw0q3T74hmHJLM7+Zap/9sc7WaxZ5mN2dDAbY
	wsDEQmLE4kdtcNPXD9nubbkeFhb3daECSSDq8sT6M0fTWYbsDrHe7zgGhjUisoz4Ax1euxhEooK5t
	7qzHxyEw0igIqhUN3IpK855HkdLBgwdEpcM2QF67gVOwm+MHSZdtYGknNtyViK7cxtxqk9GytHtCA
	I3AZnjFhNFtJUxbacxgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH4os-00GOlP-1t;
	Wed, 05 Jul 2023 15:53:30 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH4op-00GOjq-0h;
	Wed, 05 Jul 2023 15:53:28 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id EFB8358022E;
	Wed,  5 Jul 2023 11:53:25 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 05 Jul 2023 11:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1688572405; x=1688579605; bh=Tg
	Vor6ohcB+NOGucTa0+/H0UrCZfx0RkXCTaJQ6Ou3Y=; b=bZd3BHbfRznRfm5I2x
	mOjXLSCOyluuEvD0h/NgjmrXeIOkST15ZuZB3Uk2liHpSwKWfGzE88ukLl2Szy3r
	6laQDD/AcIMEfnO601OUAjAQCQ4xrPAs+b4wC1BlnX+kYX7GY7xqpoz+eud+zLWt
	xLeQuV+XtFaSCKVtpdZMeaZRJEcJtOob4mwo70ITevP/Ud+2yp7r9LfubwfPiAsp
	KsBmpc/M/y58d78Rb97IM207PLtG6FnUGiFPu5JRRmzsN4VMK1ftsq4Ihw/ODixf
	1DcC0Qs5AC0ZfDcEk0Y5pVvpWsNZDjq8ULqaWjNrPDmhmIwZs275NN6HV1ik/8d3
	7v5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688572405; x=1688579605; bh=TgVor6ohcB+NO
	GucTa0+/H0UrCZfx0RkXCTaJQ6Ou3Y=; b=PaviZasCrwTP6JnQlT8cbbYitmE/z
	KSyXeK+7gA0AWvZg/GXt+p5yGju0ZPWdE3X7zjjtQEWh1pQFgGnp8tJV/fsm/NZ9
	ERe8vIuHEnx/Njp2AkJn2DLfP/k2CATGXKjCMNN5bn6e6nZdzUELWmlHieTWBEi1
	VmE438VRxgejxE7KKLGaenNVD2B8mVXLr1KxL93cVbTyzkJx1FjE6UddaNd/i4TE
	e2CCTRAulX5cQ1Wdw9o0f5/ZoMFfUiAe9Nm9eUqbxD3AA6Qf7qeBlcxPV3WJZUu1
	01wfTftcg/TKqMVDoPxa6SLbusImvejgEv62Vh5IZ7GSkX3l3YBNdfaEw==
X-ME-Sender: <xms:8pGlZAJRmCnTPjljtH59dgdF5GXJwkPka7gh6gxT_wE84ftXjEMgkw>
    <xme:8pGlZAJmcECETTIpoCzA528LJnREBeZQTVNQl44V-4Oz2Nl4-RmNY5WJhPiBdJ8Lv
    8FDStj3Q4EQHy4-Bq8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudejgdegkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:8pGlZAuTuSggrX2aXLurqAhgko0_02luDACI57iAyU7GieoSWGuR3g>
    <xmx:8pGlZNbpJm4LXfGBobBVWy8n2piB8tEIj2RYWPvllewaYW_uHK6TgQ>
    <xmx:8pGlZHaYMz7g_VMVAjBO5xjfp76QDNweykU8JNZtwZ3Fo5LF-MnNkQ>
    <xmx:9ZGlZAiHmUJ2O6-pATUKxUXQFp-jCXUHa2VTFGlr4tZikw6EsWazEA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 97530B60086; Wed,  5 Jul 2023 11:53:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <622eee1a-4bf3-4a17-9c2e-e32f0f405fd5@app.fastmail.com>
In-Reply-To: <6ac04399-9c17-b036-5b14-92eadb65522b@oracle.com>
References: <20230705142004.3605799-1-eric.devolder@oracle.com>
 <20230705142004.3605799-4-eric.devolder@oracle.com>
 <09f70de6-9409-4fa4-b9ea-831078d914e7@app.fastmail.com>
 <6ac04399-9c17-b036-5b14-92eadb65522b@oracle.com>
Date: Wed, 05 Jul 2023 17:53:02 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Eric DeVolder" <eric.devolder@oracle.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Huacai Chen" <chenhuacai@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Helge Deller" <deller@gmx.de>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org
Cc: "WANG Xuerui" <kernel@xen0n.name>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Heiko Carstens" <hca@linux.ibm.com>, gor@linux.ibm.com,
 "Alexander Gordeev" <agordeev@linux.ibm.com>, borntraeger@linux.ibm.com,
 "Sven Schnelle" <svens@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "Kees Cook" <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Frederic Weisbecker" <frederic@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "Sami Tolvanen" <samitolvanen@google.com>,
 "Juerg Haefliger" <juerg.haefliger@canonical.com>,
 "Russell King" <rmk+kernel@armlinux.org.uk>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Sebastian Reichel" <sebastian.reichel@collabora.com>,
 "Mike Rapoport" <rppt@kernel.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Zi Yan" <ziy@nvidia.com>, "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>,
 "Zhen Lei" <thunder.leizhen@huawei.com>, "Xin Li" <xin3.li@intel.com>,
 "Tejun Heo" <tj@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, tsi@tuyoix.net,
 "Baoquan He" <bhe@redhat.com>, hbathini@linux.ibm.com,
 sourabhjain@linux.ibm.com,
 "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
 "Konrad Rzeszutek Wilk" <konrad.wilk@oracle.com>
Subject: Re: [PATCH v4 03/13] arm/kexec: refactor for kernel/Kconfig.kexec
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_085327_323827_0A3D4B95 
X-CRM114-Status: GOOD (  19.47  )
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

On Wed, Jul 5, 2023, at 17:22, Eric DeVolder wrote:
> On 7/5/23 10:05, Arnd Bergmann wrote:
>> On Wed, Jul 5, 2023, at 16:19, Eric DeVolder wrote:
>> 
>> I see this is now in linux-next, and it caused a few randconfig
>> build issues, these never happened in the past:
>
> Arnd,
> Thanks for looking at this!
>
> I received randconfig errors from Andrew Morton's machinery. When 
> investigating I
> found that randconfig was able to specify CRASH_DUMP without KEXEC, and 
> that lead
> to problems. I believe this situation existed prior to this series as 
> well.

On Arm, there was definitely a bug because one could enable CRASH_DUMP
without enabling KEXEC, but that had no effect at all. I only noticed
the problem testing linux-next because it turned from silently broken
into a build failure

> Specifically CRASH_DUMP does not have a dependency on KEXEC, or select 
> (only s390
> has this hole closed).
>
> For CRASH_DUMP, this series now selects KEXEC to close this gap, which is what a
> sane config would have (ie both CRASH_DUMP and KEXEC).

Right, that is the easier way out here.

> Do you think the changes outlined below are still needed?

I think only the first one still applies on arm, you need to ensure
that ARCH_SUPPORTS_CRASH_DUMP has the same dependency as
ARCH_SUPPORTS_KEXEC, or it just depends on ARCH_SUPPORTS_KEXEC.

    Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
