Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F44C0219B
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 19:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mzj0CDSQ/9CyDrK5fxvnADvVd/0OcgYzs+vld/3O7ZI=; b=Rjzv6ZximLOibx5X8KyPoZvMdh
	01d3G85npFFqqRAl+F3U+WP05u7GAue6TQSy0P5o/XoBnEdhA7h0Hn7/407YAE/+fFh3DBfz0Zq5b
	2e+brq48MjAd4R1KaRSG2nT/MuAp4LvUjTd61wvTR+7yCzxlJZVR1Xc6aBimrB9nwifWwcL+MjQmr
	HwkX/i/1VPxR5arMnRzM38gfH28vJBXiFSBfxW7MPVyaJqrkktR2m+gJqsru7kAH6cSfmo5elTsP4
	85X0JONFBqUXxQhULvJUMMrYd1GpHfBA9fsls7acONhwdha0jEu0nr+xNV0j3iRnGfIcz3BpHARVb
	Ut093D4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg7kg-00000007NmM-44dE;
	Thu, 06 Feb 2025 19:41:30 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg7kf-00000007NlD-0UQo;
	Thu, 06 Feb 2025 19:41:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1738869076;
	bh=F2jqlpwTo2MW743dx82l7OJPk/nMa2jFFcu4kDo1YtI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FYcvTqLETvIDV898S86+xT9SbePWJllnFgwWELTqoYC+Ih5/O0lacqyjKvIwxKeYl
	 0bRynm64ajsLxhkOs9IC2kkFJOFCeX8dIdo5rb/+Td+a2jaoRxPwY+5pkECXs4UPOq
	 jRDzNL1vUjiJGkL0HmYhRBF7jwa5kXwPsOZoma2c=
Received: by gentwo.org (Postfix, from userid 1003)
	id 257D54028B; Thu,  6 Feb 2025 11:11:16 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 215A9400CA;
	Thu,  6 Feb 2025 11:11:16 -0800 (PST)
Date: Thu, 6 Feb 2025 11:11:16 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Jessica Clarke <jrtc27@jrtc27.com>
cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, luto@kernel.org, 
    xin@zytor.com, kirill.shutemov@linux.intel.com, palmer@dabbelt.com, 
    tj@kernel.org, andreyknvl@gmail.com, brgerst@gmail.com, ardb@kernel.org, 
    dave.hansen@linux.intel.com, jgross@suse.com, will@kernel.org, 
    akpm@linux-foundation.org, arnd@arndb.de, corbet@lwn.net, 
    dvyukov@google.com, richard.weiyang@gmail.com, ytcoode@gmail.com, 
    tglx@linutronix.de, hpa@zytor.com, seanjc@google.com, 
    paul.walmsley@sifive.com, aou@eecs.berkeley.edu, justinstitt@google.com, 
    jason.andryuk@amd.com, glider@google.com, ubizjak@gmail.com, 
    jannh@google.com, bhe@redhat.com, vincenzo.frascino@arm.com, 
    rafael.j.wysocki@intel.com, ndesaulniers@google.com, mingo@redhat.com, 
    catalin.marinas@arm.com, junichi.nomura@nec.com, nathan@kernel.org, 
    ryabinin.a.a@gmail.com, dennis@kernel.org, bp@alien8.de, 
    kevinloughlin@google.com, morbo@google.com, dan.j.williams@intel.com, 
    julian.stecklina@cyberus-technology.de, peterz@infradead.org, 
    kees@kernel.org, kasan-dev@googlegroups.com, x86@kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
    linux-doc@vger.kernel.org
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode
 for x86
In-Reply-To: <29A74A26-E922-4A4F-9B4A-8DB0336B99DF@jrtc27.com>
Message-ID: <94f81328-a135-b99b-7f73-43fb77bd7292@gentwo.org>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com> <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org> <F974BA79-80D8-4414-9DFD-1EEF9395143C@jrtc27.com> <72837fcd-97a8-c213-0098-c8f308c3415d@gentwo.org>
 <29A74A26-E922-4A4F-9B4A-8DB0336B99DF@jrtc27.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-815475849-1738869076=:2425008"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_114129_187766_BBA4536F 
X-CRM114-Status: GOOD (  16.51  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-815475849-1738869076=:2425008
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Thu, 6 Feb 2025, Jessica Clarke wrote:

> On 5 Feb 2025, at 18:51, Christoph Lameter (Ampere) <cl@gentwo.org> wrote:
> > On Ampere Processor hardware there is no penalty since the logic is build
> > into the usual read/write paths. This is by design. There may be on other
> > platforms that cannot do this.
>
> You helpfully cut out all the explanation of where the performance
> penalty comes from. But if it’s as you say I can only assume your
> design chooses to stall all stores until they have actually written, in
> which case you have a performance cost compared with hardware that
> omitted MTE or optimises for non-synchronous MTE. The literature on MTE
> agrees that it is not no penalty (but can be low penalty). I don’t
> really want to have some big debate here about the ins and outs of MTE,
> it’s not the place for it, but I will stand up and point out that
> claiming MTE to be “no performance penalty” is misrepresentative of the
> truth

I cannot share details since this information has not been released to be
public yet. I hear that a whitepaper will be coming soon to explain this
feature. The AmpereOne processors have been released a couple of months
ago.

I also see that KASAN_HW_TAGS exist but this means that the tags can only
be used with CONFIG_KASAN which is a kernel configuration for debug
purposes.

What we are interested in is a *production* implementation with minimal
software overhead that will be the default on ARM64 if the appropriate
hardware is detected. That in turn will hopefully allow other software
instrumentation that is currently used to keep small objects secure and in
turn creates overhead.

--8323329-815475849-1738869076=:2425008
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-815475849-1738869076=:2425008--

