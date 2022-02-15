Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E52C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 07:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWMHgy7TmuxSxpz4lOTgM/0XP5Dx9EokPuMTLuWCjsw=; b=zUMP0Gdcsv//3r
	UtDo0/OiCYlxn7VZeeWUg7+G31LDmAtLINSAEWISVQ+FTtpQV9Y4X64LlIdniIyT2rMorF45xlfV2
	xv3apFAnXVPlJqOz/QT/cXSsCEUm9pBiBI+0DAY+qxsyiriYYisclLsBQZXrs0lgMdhdWrQ4zBZr8
	8khAIWnJsSe65B45hMV4JCm2VvIvA+kcrIJO1U89mOGihz5ALfd0+45WuEr7W1FW/WBU6cCxNXC4S
	xl2i21a+bLt9s3cbT1DQjN/bzie7wJwak4l5UJI2eh4Oe21E5rUr1HfJ7Dz40FIiAEf2RNbQ//Iqh
	9vf8LuCOo6fJkmZzZqMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJs2m-0014Pb-6I; Tue, 15 Feb 2022 07:14:36 +0000
Received: from zeniv-ca.linux.org.uk ([142.44.231.140])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJs2h-0014KG-4E; Tue, 15 Feb 2022 07:14:33 +0000
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nJs1u-001uPd-Et; Tue, 15 Feb 2022 07:13:42 +0000
Date: Tue, 15 Feb 2022 07:13:42 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Cc: Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 will@kernel.org, guoren@kernel.org, bcain@codeaurora.org,
 geert@linux-m68k.org, monstr@monstr.eu, tsbogend@alpha.franken.de,
 nickhu@andestech.com, green.hu@gmail.com, dinguyen@kernel.org,
 shorne@gmail.com, deller@gmx.de, mpe@ellerman.id.au,
 peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com,
 hca@linux.ibm.com, dalias@libc.org, davem@davemloft.net,
 richard@nod.at, x86@kernel.org, jcmvbkbc@gmail.com,
 ebiederm@xmission.com, akpm@linux-foundation.org, ardb@kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH 09/14] m68k: drop custom __access_ok()
Message-ID: <YgtSpk0boDjsyjFK@zeniv-ca.linux.org.uk>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-10-arnd@kernel.org>
 <Ygr11RGjj3C9uAUg@zeniv-ca.linux.org.uk>
 <20220215062942.GA12551@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220215062942.GA12551@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_231431_199405_76FABE61 
X-CRM114-Status: GOOD (  11.97  )
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

On Tue, Feb 15, 2022 at 07:29:42AM +0100, Christoph Hellwig wrote:
> On Tue, Feb 15, 2022 at 12:37:41AM +0000, Al Viro wrote:
> > Perhaps simply wrap that sucker into #ifdef CONFIG_CPU_HAS_ADDRESS_SPACES
> > (and trim the comment down to "coldfire and 68000 will pick generic
> > variant")?
> 
> I wonder if we should invert CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE,
> select the separate address space config for s390, sparc64, non-coldfire
> m68k and mips with EVA and then just have one single access_ok for
> overlapping address space (as added by Arnd) and non-overlapping ones
> (always return true).

parisc is also such...  How about

	select ALTERNATE_SPACE_USERLAND

for that bunch?  While we are at it, how many unusual access_ok() instances are
left after this series?  arm64, itanic, um, anything else?

FWIW, sparc32 has a slightly unusual instance (see uaccess_32.h there); it's
obviously cheaper than generic and I wonder if the trick is legitimate (and
applicable elsewhere, perhaps)...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
