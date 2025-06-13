Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8905FC71136
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 18:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8HQCwTmYrrFDzaDmL86Pc1wLUEBhB/XPoQ2Nytx9mdw=; b=qppi+n3555H2vR
	eaHMYn1oVsrQiuJACJbR/tkeh31MIH7YKvYmxcLaVzKQQwSwxoILRgh+PCmHVXDj8/jvxmWsq0Ivs
	srf3m6EeWQA3wGLHKKbS59teq87XNpwDHIaEFw/odWBB7MCOZbhdAE1/FwA0ELrj9WjGFrgexmd1p
	ny0s1vYiEHqSC/D0JQJ2UpR1GIHCuIVg0TY3dX2zb1KoZLoL66oDf7w9jEfiPsFGP21Fk91rIu8pV
	yX/VXY4Lni4rOvCk0yIojTSd303RBbnEoHFJO7xm2ydUlxKAAgsCobYrW2Sf0XdSxX9K8ARba/K+c
	jWHMghHksY5ijjZCza0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ996-0000000HJaJ-0Oeg;
	Fri, 13 Jun 2025 18:28:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ7wq-0000000H926-31kJ;
	Fri, 13 Jun 2025 17:12:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B2ED61F1A;
	Fri, 13 Jun 2025 17:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43202C4CEEB;
	Fri, 13 Jun 2025 17:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749834730;
	bh=MwLvd5PG7WoLPNV5X3+UTldK/899ju4MNdrqiosDJ9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BhivCur+l0uxRrXdj3m3GKjsKlQNT6CXQx3iCBvVkXSvE4m7EvCcVuRfY6gZB5DtI
	 RrJabvRIGIr3L4g87xf0gTfQDs/DflrsqDAj5QlhN5vplNG9fEENywbAPzXW3gnNlq
	 m+coGK+eBLQeJtsoxM3fU4c5Xpiy8kfmTbUODa1wg4jIDHjdtxdql01cyMgso0UG9q
	 znLaUKdE+SbabPCvrEijY1od4XSYKiQECxgj+txYdWIoB7IUqgUD3yiEVggSkRo5Am
	 oG2oDjLPd9qcjldUhG53BMbb8wG7cjW4jHsngIK0FAWMIuyciYpkyJRP9+ahUBrIUW
	 mqv3dY3gjk5ZQ==
Date: Fri, 13 Jun 2025 10:11:43 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	linux-arch@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 09/12] lib/crc/s390: migrate s390-optimized CRC code
 into lib/crc/
Message-ID: <20250613171143.GB1284@sol>
References: <20250607200454.73587-1-ebiggers@kernel.org>
 <20250607200454.73587-10-ebiggers@kernel.org>
 <aExLZaoBCg55rZWJ@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aExLZaoBCg55rZWJ@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
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

On Fri, Jun 13, 2025 at 06:01:41PM +0200, Alexander Gordeev wrote:
> On Sat, Jun 07, 2025 at 01:04:51PM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Move the s390-optimized CRC code from arch/s390/lib/crc* into its new
> > location in lib/crc/s390/, and wire it up in the new way.  This new way
> > of organizing the CRC code eliminates the need to artificially split the
> > code for each CRC variant into separate arch and generic modules,
> > enabling better inlining and dead code elimination.  For more details,
> > see "lib/crc: prepare for arch-optimized code in subdirs of lib/crc/".
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> ...
> 
> Hi Eric,
> 
> With this series I am getting on s390:
> 
> alg: hash: skipping comparison tests for crc32c-s390 because crc32c-generic is unavailable
> 
> Thanks!

I think that's actually from "crypto/crc32c: register only one shash_alg"
(https://lore.kernel.org/linux-crypto/20250601224441.778374-3-ebiggers@kernel.org/),
not the patch you replied to.

Those self-test warnings are expected.  But I guess they are going to confuse
people, so we should do something to make them go away.

I think we should do what I've proposed for SHA-512: stop worrying about setting
the cra_driver_name to something meaningful (which has never really worked
anyway), instead just use *-lib, and update crypto/testmgr.c accordingly.

I'll send out patches that do that.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
