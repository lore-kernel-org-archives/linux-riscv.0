Return-Path: <SRS0=Rh5D=OG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C67CC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 14:41:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E8B361214
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 14:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E8B361214
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f5mUreCKA+W+78M0dLZt1yHQ6/imHxy69QzUBVQt8P4=; b=LcAKc7S126dmhN
	virdFr9v6gDiXP6Mbark7GfNnFVUo11eHDmSICtG8I1bBFlxQwAxAn8Rs9mpv9CdHpGStgBqefryt
	EV6SdRe8sL56xVrsi2pzEg4H8+J/kw3vaj/fBlWCsGMw+45Q1oZ1TJgwg3lW3bTmT4J4n66tkBmIM
	aVM5+6MtII5uGz7W1SecclZx6E4eTtTCMIC4hY2a3r+aizBSBXaf/EY6Rb7iEDwWzuOfpgVp2CJjg
	kHv+Kr/NRFHSKcavgz5QXGDgHupRJkbcOnAq5yviJ+10AuCNg/Q8jqhuic8Fhz6z2SrHkmCsV04bt
	GU55i3tCzpjgSKEEe8lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQsa2-00BNBd-Df; Thu, 16 Sep 2021 14:41:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQsZY-00BN0x-JH; Thu, 16 Sep 2021 14:41:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 292C46120C;
 Thu, 16 Sep 2021 14:41:04 +0000 (UTC)
Date: Thu, 16 Sep 2021 15:41:01 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-kernel@vger.kernel.org, Keith Packard <keithpac@amazon.com>,
 Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>, Kees Cook <keescook@chromium.org>,
 Andy Lutomirski <luto@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
Subject: Re: [RFC PATCH 1/8] arm64: add CPU field to struct thread_info
Message-ID: <YUNXfWKZ7XYvw2EK@arm.com>
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-2-ardb@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914121036.3975026-2-ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_074108_688926_3DCA8A07 
X-CRM114-Status: UNSURE (   9.92  )
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

On Tue, Sep 14, 2021 at 02:10:29PM +0200, Ard Biesheuvel wrote:
> The CPU field will be moved back into thread_info even when
> THREAD_INFO_IN_TASK is enabled, so add it back to arm64's definition of
> struct thread_info.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
