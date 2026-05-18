Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7182CD343F
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 21:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z+5Ri4w2hxRgbmYmrT0H8cnzT0HDkfGmUgRKTWGDHfw=; b=CTsL1kLAkaVOQo
	zIkL8WZjhZr57ZpkTAyhNab4RRPjvv5iULtrW6qujFbTZ6EqOJAWSu2ihX1GucIHdvHJNHkVCaUZY
	ScMbN4HUExwO47IFM5x57uFqvrSqUNKMroJv/BH92vqbJYi2/JaAVt6xeq/5fkz9o7DlXg7pU4/+a
	1lnATZHd+JdqyxRC7EJkwPfomNEwQH5zoSATA9r7QeW0xgZHnfTnXj1MEQ7TAw8vBSeR1cmrm4ogq
	49C2eYfTWMWY4swUI/Ed92MDJ70YjNrvRITf9AKsllSvgr1wYAJcMLZXIQczjGDdynk+7dUZR+345
	dZHc8rLTJJmIdD2g7vjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5G0-0000000Gxeh-1k78;
	Mon, 18 May 2026 21:12:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5Fy-0000000GxeE-1BLf;
	Mon, 18 May 2026 21:12:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E5705600CB;
	Mon, 18 May 2026 21:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC18C2BCB7;
	Mon, 18 May 2026 21:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1779138727;
	bh=6CbWyBWe6ek+skQD7ezBR5R72rf11+dnwrag4D/122Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dmdzNWjTjK3Cc3C2V+DkRdbwT+d12xy/ZdRJ5bQRPDa4Caa5RS6kZ9MZ1ALFQP/+U
	 kc1KEx+sN56byuYGjJ5PbU1JGucdCZy76CwlbeuJ+r1GAPZ0VTw7F7ixRcBQbkK4OE
	 ese4fN8XpUeBQ1LjLfsivknyFMJ0f8eUvHc2/mMw=
Date: Mon, 18 May 2026 14:12:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Herbert Xu <herbert@gondor.apana.org.au>, Dan Williams
 <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>, David Sterba
 <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>, Song Liu
 <song@kernel.org>, Yu Kuai <yukuai@fnnas.com>, Li Nan
 <linan122@huawei.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-raid@vger.kernel.org
Subject: Re: cleanup the RAID6 P/Q library v3
Message-Id: <20260518141205.c100f76eec5f58e78bbbf7af@linux-foundation.org>
In-Reply-To: <20260518051804.462141-1-hch@lst.de>
References: <20260518051804.462141-1-hch@lst.de>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Mon, 18 May 2026 07:17:43 +0200 Christoph Hellwig <hch@lst.de> wrote:

> this series cleans up the RAID6 P/Q library to match the recent updates
> to the RAID 5 XOR library and other CRC/crypto libraries.  This includes
> providing properly documented external interfaces, hiding the internals,
> using static_call instead of indirect calls and turning the user space
> test suite into an in-kernel kunit test which is also extended to
> improve coverage.

Cool, I'll add this to mm.git's mm-nonmm-unstable branch for some
linux-next testing.

AI review found quite a lot to talk about:
	https://sashiko.dev/#/patchset/20260518051804.462141-1-hch@lst.de

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
