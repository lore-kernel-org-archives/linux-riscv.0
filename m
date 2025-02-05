Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221B4C02198
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 19:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NknA8tgnIOQPYkxjEfuqORQRarV+c2+2vSVjAOnteY4=; b=fZ5TgpXUiDyrKCNPwC5vd142ZJ
	t0zqDRDWcWhu/CRBJnibDjP0ugaGGm2UuSRDAhYFOWSNpU2eCgCHwxb/+uy+3jY6ASnxqNmz1B/55
	2qeI+9tESkiokqLxsh9JIWpcmTj/Uwnf3W8GpRlhpgjTU4RVaOYv7L1lk2yb/aLBsHb2e0SfzgsPY
	7a+IgbY19UKn29HnmzDnww7zqfmYI91nCxfT4hylbyid5+3ZQQx5/4kxfTF95nHpVD3EegnBhKefD
	1HGeE7B34mwn8qe7o2ZA0Fkgd65Z2liX0KK9YVMwKu6YBJhFt9w2TzucnwBsqilLTO1j6aT7ETTuZ
	tTw81v7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tflLw-00000004Rtx-1rR0;
	Wed, 05 Feb 2025 19:46:28 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tflLu-00000004Rt8-1mkJ;
	Wed, 05 Feb 2025 19:46:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1738781507;
	bh=33IQOomqEyLTQbaYoSoQ2PJ57XbkscwA0pHsfJIANsE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hAl/xLVS2r7Z4b6dKCNGQj1YxU7mBAFZLxa0QFxRcOfg9/MMOpCcpPaUILVgfMiCD
	 2Xzh/SDNcO2OkjjW/9VtrMp95w0TNdf6eYPrtPnCGFvHDmq2AGyBc7FSCpF2aiSDIy
	 PXbvCiMuZZA0WsQlqrDQ4EI9w2tceEb6ut8EvkwE=
Received: by gentwo.org (Postfix, from userid 1003)
	id 6887F401F1; Wed,  5 Feb 2025 10:51:47 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 6476D401E1;
	Wed,  5 Feb 2025 10:51:47 -0800 (PST)
Date: Wed, 5 Feb 2025 10:51:47 -0800 (PST)
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
In-Reply-To: <F974BA79-80D8-4414-9DFD-1EEF9395143C@jrtc27.com>
Message-ID: <72837fcd-97a8-c213-0098-c8f308c3415d@gentwo.org>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com> <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org> <F974BA79-80D8-4414-9DFD-1EEF9395143C@jrtc27.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1508829946-1738781507=:2407083"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_114626_495190_E96D82B8 
X-CRM114-Status: UNSURE (   6.65  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1508829946-1738781507=:2407083
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Tue, 4 Feb 2025, Jessica Clarke wrote:

> It’s not “no performance penalty”, there is a cost to tracking the MTE
> tags for checking. In asynchronous (or asymmetric) mode that’s not too


On Ampere Processor hardware there is no penalty since the logic is build
into the usual read/write paths. This is by design. There may be on other
platforms that cannot do this.


--8323329-1508829946-1738781507=:2407083
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1508829946-1738781507=:2407083--

