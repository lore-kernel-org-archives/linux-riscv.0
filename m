Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F69DEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 12:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a0684P+4vqNBAZE3i4oxrnoVhUD6fgMtg9R4CfvpScs=; b=uURIC1FexaKIGa
	Lm96S3xv2iOERamASuHrEJ5Hp5DelnKdUoHkDMh/mbQ2BxiB//FY/J/OnTtoNStjoVXYlg4VQogyL
	wcZP3wBrBP850S+bphOZ6wvub0HjdKNxnWqJ29BhXYljDFABzCSpViC8hJERAUny53sYwfs1uVL4I
	ebOBjbfIBViFAKnQ+3mI2dL/sePMgN2/OqI46mdHMAzCXhv55/bjPtJt62Xge7Wk4Nk2BCtzAE3ec
	z8POTxRsCknzzFZ3hsmVtzWR+6m+dDg/0rm2as4SeNyXEqqTkG6JKkebS4IPwkX8SIv7Z3v4gdsQO
	702VHeSYUnlhf0Zx8aHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHNww-001b7q-04;
	Thu, 06 Jul 2023 12:19:06 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHNws-001b65-0q;
	Thu, 06 Jul 2023 12:19:03 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id E292258041D;
	Thu,  6 Jul 2023 08:18:58 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 06 Jul 2023 08:18:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1688645938; x=1688653138; bh=pm
	sCsD6NfrkTosVBZWjph1ykYGb9O3Dg+fhXVNC3Rvk=; b=hqXi6rJ+i8L2kZUJhp
	0Mss2FzXKRfG5TtwxsfHO91XTTGdJb5INY/W9jHAWWzLlPBe7Mvp2VKA2RjHG4U7
	A7Tn/6PYOrhRZZ9dsXG5Bi4eUVASEAIZJYhnSDteLn7YXKF3a5gKG8Sz4APDcIeH
	otqn5evSnpusqMsRCST1p3CuZOWEnpgsaRpTJEbwbRVCIKY799exH5lTM6WCuLWy
	xJSs8MXWsJljsUtJe5nu/V7vmjVZyibDvRytk1RXpmxkzbFtXnTo04oRx80j8vQT
	fiNWIoLaC+rDJ5n0LayzX2CXwsLpMi3d5mZgErHtvHH4G/hwFFh+3YmM3O+u9SQ8
	BHdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688645938; x=1688653138; bh=pmsCsD6NfrkTo
	sVBZWjph1ykYGb9O3Dg+fhXVNC3Rvk=; b=PNfDwCCFcL1nOW2lsvUD3y5f9PXPM
	7bSSYgdfQRtsQwl5oWNiogKI27KwXUacqn3bHiRUgjonI453Tqe1MsDCCD/a/WSL
	ueZz/XaKMzGPjYX3LVa21M3Nf9p16RNgVcYFMhkWZEludPx4+ph2F0AR7HIHCzRd
	P7Ze3g97T1yWVhMUoqnyl2G9PE3QF94TCXFUIPtaqNllrwhOO9UqyA2SQBEKpxPN
	xXMJDBFRm8YlUb7sIeqv/bK/H7InK4d8Cvb2LSaryRE2C1sunkqGRoqupnuJ9+AG
	7iw2jaLpKjp+Mrqa8fYhpJya9TUzI5NXJpNQWriZsj05TZAuZ7O6fPxfA==
X-ME-Sender: <xms:MbGmZOUMw2R8sGTxL9JRAkoXdej4V1ZuUx7HE8WoP46ZHmE3bqPstQ>
    <xme:MbGmZKlXtOV3cYQODwPsMw-4ydJNsW-K3nzf7NCz0IW4CIhP643aEpD8hkStD25PV
    qzM3byqLrpgHjuX8Ps>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudelgdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:MbGmZCaBtymmLv2wRqKfMv2vL4LTyMpB0WVEcDyZiaQB5RwDtsiBVg>
    <xmx:MbGmZFWNFelUB49vWfuwDwSXC5e90BYWQ3amPuAVMFjNWzujiAV3lA>
    <xmx:MbGmZIlPx9fl-hZcVTcOc8Hs-HdTaDA-H9M8aF4QBvrrlgjonPZEUQ>
    <xmx:MrGmZM-FzMttCFrkfEz9Wo8wgLLkXbGIvX6VTxBWulI6PNlLZw57nA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3EF87B60086; Thu,  6 Jul 2023 08:18:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <c057ba7a-3cc2-44ac-a961-fa062b909876@app.fastmail.com>
In-Reply-To: <20230705142004.3605799-2-eric.devolder@oracle.com>
References: <20230705142004.3605799-1-eric.devolder@oracle.com>
 <20230705142004.3605799-2-eric.devolder@oracle.com>
Date: Thu, 06 Jul 2023 14:18:36 +0200
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
Subject: Re: [PATCH v4 01/13] kexec: consolidate kexec and crash options into
 kernel/Kconfig.kexec
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_051902_608266_97C0A3EB 
X-CRM114-Status: UNSURE (   9.27  )
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

On Wed, Jul 5, 2023, at 16:19, Eric DeVolder wrote:
> +
> +config CRASH_DUMP
> +	bool "kernel crash dumps"
> +	depends on ARCH_SUPPORTS_CRASH_DUMP
> +	select CRASH_CORE
> +	select KEXEC

Today's linux-next now runs into a warning on arm64 and
presumably others, with the same problem as on arm earlier:

WARNING: unmet direct dependencies detected for KEXEC
  Depends on [n]: ARCH_SUPPORTS_KEXEC [=n]
  Selected by [y]:
  - CRASH_DUMP [=y] && ARCH_SUPPORTS_CRASH_DUMP [=y]

I think the easiest way to make this reliable would be
this fixup:

diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index d82a7ce59c051..e58ca6128d6ee 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -91,6 +91,7 @@ config KEXEC_JUMP
 config CRASH_DUMP
        bool "kernel crash dumps"
        depends on ARCH_SUPPORTS_CRASH_DUMP
+       depends on ARCH_SUPPORTS_KEXEC
        select CRASH_CORE
        select KEXEC
        help

   Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
