Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93044C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 21:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Y8KiM3QDRD5p4Zb3yC77X64pNaT5CK330WHgpByekGg=; b=ycRzNE3F4wwadDOOEpZGIYLNJM
	O0htw2y25ydxmqNlldSl7FRqHZMucj8BJBMHgy6KRG49wpjJlDXz2AS6/CCCDGyONaXs/z2G59iCZ
	kJRNgylC+w9EjdC4Qu/tgBNS5tgOOQoR7xyyzbN+uzpnv6ckYIM5zN44hiTpdZj+ixobxddVYRhuL
	K02EYygIhKXUhBjfdRfo9el0j/9v9G2RPi9Oll5XIbqlihlFuyNAhNMPJtlecT8OFQyyK0VfHDtH2
	htPxDwiq/F5WYduM9hlhF6lShiFXLxlTde3bNRsC/9dAkZpSAlvB7OTsS7qd5O2RztuDkRliQgAKC
	y5TWZ62A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb4w9-0000000HHBe-1a96;
	Mon, 05 Aug 2024 21:08:13 +0000
Received: from fout7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb4vb-0000000HH5d-1Wdt;
	Mon, 05 Aug 2024 21:07:41 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 300101382F9A;
	Mon,  5 Aug 2024 17:07:37 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Mon, 05 Aug 2024 17:07:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1722892057;
	 x=1722978457; bh=tXBWfo0rLBVvDIsHuehFdN8/T8xi3wWv1m9UP4W8yWY=; b=
	P+jmOc0c0Tzk6v8capJcythtt4MaUpvQYSuCmOIPAGiMG1TondoP+HKMhomRMkt4
	Q8ibhZRhrVqtSZITHUfGtBez7mWTFYXYmgV0cC19H/FCXuDulEydRmkcNzORXx57
	IXxqrkLiRWemLnE3hRSbzHIdR+PI90Bi1w7+WQHYknqDENekl0ykyVsZu3m17msh
	sD+YIE3LaKkboQFtuCEcBWYRxlrgKfmOG60RrBt7UzgihApSeq102bioDnZPDmSi
	zedyrKqGhngozlajJ7NVtb1y80f8QZNGFUwHVxsLSMCsAb18Bl+YzpaCCEAfCp0f
	U3yCBiNzSwE2yNMdtXf75w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1722892057; x=
	1722978457; bh=tXBWfo0rLBVvDIsHuehFdN8/T8xi3wWv1m9UP4W8yWY=; b=W
	Dxg+tG/JQZqtE2/7EolizRLTJw5KRIURzRXjgkn4MWkBnLxi38e646cG6uYai9BM
	/jCCdNf+G0FmzS2it3fmJbRbAqFEMJjOOW2Ka+hAr+EvZWioFgDZ8M8urlv+mimG
	48TZDo4guKnY07FlK57tkIxbrZ5Ym3emPcJeG8SvpHpDIXqvjOyPPWM9v++rsKHs
	GBOlIblje5jAdLTLjmvd3efiS+W1BxZ7D2oFrJgcGpNK5OgZ1YsbHyUf88TdXnO7
	oYZ/TmmiHJAOEMiBDFFfNZii9r1CIFgkGWIBtRaQ4fDgxzbVGdrUIFNgUxu/YD7J
	x+tEzAQ6HkAviwm792baQ==
X-ME-Sender: <xms:GD-xZhlTazEV78QF7P2ssFyXR4GeyuauPkXazKWJYaT2GGFwIv1djA>
    <xme:GD-xZs3zXAjyB8w9wbkoNoMLbW_ZHdY_0FPz7Z9LnmGMpqoJQiIR8pNMgNiNtFG5J
    4FNOl0f33TX5lmO0dw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrkeeigdduiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepledtjeekkedtgeeiudduveekgfeugeeftdeigfejtedufefggfekvefgtdeu
    ieffnecuffhomhgrihhnpehrvgguhhgrthdrtghomhenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggp
    rhgtphhtthhopedt
X-ME-Proxy: <xmx:GD-xZnpU-pB2lUFdnhqLAzDNRSeZZEpAxfR0E_aQ4fIeTFfXtJJ1Lw>
    <xmx:GD-xZhkA15N-6py0-a3WOfPg-FxmWi9QqX8H8jErBTICHH18t-qNmw>
    <xmx:GD-xZv1E8R30rYIg2oKAhUddV4jLdn92NUambpFYg_deRBNt1FDv5w>
    <xmx:GD-xZgtK2AOHou5A95thS82BJ0wmc2xZcK--yfvwZPoxAqXLm4bQjA>
    <xmx:GT-xZj48glhUhQptunOq1eCXotrnbEhVuaak-YDbCeNvpXlwAWPeptf3>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E5835B6008D; Mon,  5 Aug 2024 17:07:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 05 Aug 2024 23:07:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jakub Jelinek" <jakub@redhat.com>
Cc: "Rudi Heitbaum" <rudi@heitbaum.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Andreas Schwab" <schwab@suse.de>, "Florian Weimer" <fweimer@redhat.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, "WANG Xuerui" <kernel@xen0n.name>,
 "Masami Hiramatsu" <mhiramat@kernel.org>, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev
Message-Id: <d56f8ba8-21b5-43bc-9726-bd24346ef16a@app.fastmail.com>
In-Reply-To: <ZrEtyJd2qydKcWxQ@tucnak>
References: <20240801123305.2392874-1-arnd@kernel.org>
 <Zq28wejX3U9J1_JV@faede8dcc269> <Zq3jqeq6USL066k+@tucnak>
 <c78916da-ee59-4ecb-9886-7bbc7f077fa5@app.fastmail.com>
 <ZrEtyJd2qydKcWxQ@tucnak>
Subject: Re: [PATCH] syscalls: fix syscall macros for newfstat/newfstatat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_140739_709561_C6F3B4F0 
X-CRM114-Status: GOOD (  24.40  )
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

On Mon, Aug 5, 2024, at 21:53, Jakub Jelinek wrote:
> On Sat, Aug 03, 2024 at 10:12:47AM +0200, Arnd Bergmann wrote:
>> > Probably it would be useful to check
>> > echo '#include <asm/unistd.h>' | gcc -E -dD -xc - | grep '#define __NR_' | sort
>> > for all arches between 6.10 and the latest git, diff them and resolve any
>> > unintended differences.
>> 
>> Right, I should have done that before the original series really:
>> I spent a lot of time validating the kernel's internal changes for
>> consistency (which found a dozen bugs that were unrelated to my
>> series) but missed the unintended changes to the external header
>> contents.
>> 
>> I'll do that now and send another fixup.
>
> I've done 6.10 to 6.11-rc2 <asm/unistd.h> comparison just for the Fedora
> arches (x86_64, aarch64, ppc64le, s390x, i686).  Full details in
> https://bugzilla.redhat.com/show_bug.cgi?id=2301919#c8
> On i686, ppc64le and s390x there are no changes.
> On x86_64
> #define __NR_uretprobe 335

This was a bit of a wild ride, but I think this number one should be
final, and only exist on x86-64.

> has been added, perhaps that is intentional, haven't checked.
> On aarch64 when going just after __NR_ defined macros and their values,
> I see:
> #define __NR_nfsservctl 42
> #define __NR_fstat 80

__NR_fstat was a very embarrassing bug that I introduced
while trying to fix __NR_newfstatat. I got confused by the
the way that the kernel internally uses newfstat() and
newfstatat() as the name, while the only macro name
for fstat() is missing the 'new'.

I also added a patch to add back __NR_nfsservctl to avoid
the unintended change, but this one is less clear since we
already dropped that macro on some architectures while
converting them to the new format but left the macro on
other architectures.

The syscall itself was removed in linux-3.2.

> #define __NR_arch_specific_syscall 244
> #define __NR_syscalls 463
> #define __NR3264_fcntl 25
> #define __NR3264_statfs 43
> #define __NR3264_fstatfs 44
> #define __NR3264_truncate 45
> #define __NR3264_ftruncate 46
> #define __NR3264_lseek 62
> #define __NR3264_sendfile 71
> #define __NR3264_fstatat 79
> #define __NR3264_fstat 80
> #define __NR3264_mmap 222
> #define __NR3264_fadvise64 223
> macros are removed as well (let's hope it is an implementation detail and
> nothing uses those macros, but some search would be helpful).

I did a Debian codesearch search for these and did not find
anything other than a couple of language bindings that copied
these from the kernel headers but nothing actually using them.

All of the above are implementation details that only
existed on arm64/riscv/loongarch/arc/openrisc/xtensa/nios2
because they were still using the old unistd.h format, and
they don't exist on any architecture that generates the
files from syscall.tbl.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
