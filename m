Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CC7CA0ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 18:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SjsVEBZsQlqbGpxKrQhKSz9F5NkMmqdtXhoTwMOD1zk=; b=UMa+evKwgPoUEp
	WBtHX1LDHnOLzoNYyv1JAFW8tmU1R7FigPCORedUWKvGn5/6XDrxYG23ntd+RrPCJ6kkYLHGm0R4L
	Cq2aaUmWLZqJQNAWZGyCYqn7PjJJRSXSdUHfkD/Den88mD0RzjMUmOb8Z9biGPiKkRPrb/INuUCPY
	D7mMGau674PubbQbA6sgavfnpJXXHrPRzzZow28J98JzKTLEqygL/zUaxsi5KIzaxhwC6dv+mIEap
	+diwheWVjSGr8tiTR1ta1JBENO6vBIB7m4NaOC57XhmIS5ZvFnoO4tsBa3GTXx5me4jguJgBKzR7/
	3MaizX3OF6Qtq5d9iYXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umzHS-00000003GE3-2oWp;
	Fri, 15 Aug 2025 18:35:58 +0000
Received: from gate.crashing.org ([63.228.1.57])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxVE-00000002zyF-2aug
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 16:42:06 +0000
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 57FGg0P42568454;
	Fri, 15 Aug 2025 11:42:00 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 57FGfxjE2568453;
	Fri, 15 Aug 2025 11:41:59 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 15 Aug 2025 11:41:59 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Kees Cook <kees@kernel.org>, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 05/17] powerpc: Add __attribute_const__ to ffs()-family
 implementations
Message-ID: <aJ9jV80oYG6rPN1o@gate>
References: <20250804163910.work.929-kees@kernel.org>
 <20250804164417.1612371-5-kees@kernel.org>
 <7f4f4d07-38f7-444c-adff-ec2a2387e86b@linux.ibm.com>
 <aJ9hsHj9lsHvvhcA@gate>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aJ9hsHj9lsHvvhcA@gate>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_094204_778339_CF48BD13 
X-CRM114-Status: UNSURE (   8.67  )
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

On Fri, Aug 15, 2025 at 11:34:56AM -0500, Segher Boessenkool wrote:
> On Thu, Aug 07, 2025 at 03:16:35PM +0530, Madhavan Srinivasan wrote:
> > making them eligible for compiler optimization.
> 
> You can instead use GCC for this.  __builtin_ffs () exists since 2003,

Erm, 1992 actually, but stuff has moved around since then :-)

> and has this attribute built-in, as well as tens of other optimisations
> that the kernel thing misses.
> 
> Of course using existing stuff instead of cobbling together something
> half working prevents you from having a lot of fun ;-)


Segher

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
