Return-Path: <SRS0=jyWZ=FH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 347F1C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 22:37:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FEA82231F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 22:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FEA82231F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k8r1dzY00lrv5em4UZbR0k4LwN1YV1D1vJNvtts6Jto=; b=wSLdOJqcjeNYJFM8dn8EOG5I8
	PBMiq+G2WekRHLawgO3MTZYcBNDTZY1oYHmwEw7SvnRgXNfNCTRoswk/8VxLNhnbHaMMFSztjbB1d
	BSSn1taR6SYeV2LdpKISOxUvfl5qBrIENlXdllQSlld23ievV6DlCD9rW4PztBKcPWmAwyVp5bT7l
	Sa6p7e1bOSFy56ggwAFv1pY1XvHncN3gslw+POfsAbLdtOjWQXNqbhpGumRGdEGDHn/o4JSooCVsm
	ec1UEVv5PEwqVa5ug3AFofw/iCHyAo4QYkDuoJ9ryv1D066VJiwRYk+rZbum3W+dd7WzVdTW8kd/q
	zBngoZF3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkxDa-00064t-2h; Thu, 03 Dec 2020 22:36:54 +0000
Received: from ms.lwn.net ([45.79.88.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkxDV-000638-2I; Thu, 03 Dec 2020 22:36:50 +0000
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id A638F2204;
 Thu,  3 Dec 2020 22:36:43 +0000 (UTC)
Date: Thu, 3 Dec 2020 15:36:42 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 0/6] Add documentation for Documentation/features at the
 built docs
Message-ID: <20201203153642.594afd85@lwn.net>
In-Reply-To: <cover.1606748711.git.mchehab+huawei@kernel.org>
References: <cover.1606748711.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_173649_196130_23C58BF5 
X-CRM114-Status: GOOD (  15.59  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, x86@kernel.org,
 linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jonas Bonn <jonas@southpole.se>,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 linux-sh@vger.kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 30 Nov 2020 16:36:29 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> This series got already submitted last year:
> 
>    https://lore.kernel.org/lkml/cover.1561222784.git.mchehab+samsung@kernel.org/
> 
> Yet, on that time, there were too many other patches related to ReST
> conversion floating around. So, at the end, I guess this one got missed.
> 
> So, I did a rebase on the top of upstream, and added a few new changes.

OK, I've gone ahead and applied these; it gains me a new trivial conflict
with x86, but so be it...

That said, I think that the RST table formatting could be *way* improved.
The current tables are all white space and hard to make sense of.  What if
we condensed the information?  Just looking at the first entry in
Documentation/admin-guide/features.html, perhaps it could look like:

    FEATURE	KCONFIG/DESCRIPTION		STATUS

    cBPF-JIT	HAVE_CBPF_JIT			TODO: alpha, arc, arm...
    						ok: mips, powerpc, ...
		arch supports cBPF JIT
		optimizations

The result would be far more compact and easy to read, IMO.  I may get
around to giving this a try if (hint :) nobody else gets there first.

Thanks,

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
