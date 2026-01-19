Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAE9D29C46
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 16:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4sque638nRp5Y1/+cnGVF5DBqP4JMGCPYKAxp/fTD0U=; b=oR/iGkJFgSeuOR
	6ehX2I7pG4gZh1KaZ1LrW4dp6CdzL5i5PbKIztpQLcY0v/Ffmg9B5pTR5yQSdFXM2hhflldIUl9OO
	cnDJOtXCadBLCV+N8hpWeFjy/Z/1fa1yGq91hL/epu0jb4F+/vaUAx5q6N9PQreMea1KUXRYyOBbN
	r2A9KoReXuxElUmq+ojpp6kLHDxzu89cFHCbifIUGWVT1olhKGyFOoz4wviZJtdp/YZbJF/u5yaB9
	5nVfD6s0KmUHbHYy6CTFKXnb0pMi5x/3I10XNDN9dF37XAQt56rUGbU+A9TRE4p/TaOdH/foVLivz
	owM80xRNyhhdxELdBA/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsMY-00000002XKw-1emT;
	Mon, 19 Jan 2026 16:44:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsMX-00000002XKP-0Icb;
	Mon, 19 Jan 2026 16:44:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 22A0760054;
	Mon, 19 Jan 2026 16:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B80FAC116C6;
	Mon, 19 Jan 2026 16:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768841059;
	bh=16FGOoiet4+IrVT+FcqrHcvY6YUTC0QcugfuzrxpDdk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=q0tAOJQSpR4lAPo9D9a0ZLzj9fmk4VEFSuwyHRGgr6m2/2bnlj2msqm1OK35ZA72i
	 BsoEW2Hi1Kd0mpXDYPCuFTDERjp9sFatntALxM7RaexoblAcWHEgiVDgn5GR/Cfhs5
	 lJ+7nmPuUhjsYr7LMg0JLovICzoM9fTlHD0eazCWxNpHY+vxS6kc8rz0ZKG0d1VEWg
	 IIhlCXiVHIe0pBTCOoVEENtJxJ+QEakuwJKi7yA2fm+eSBFbxX2gEsdDI8+DoA1Vyk
	 WSTb5IyXokPQcIaRg69SRVfbN0PLcfWUE2soFEJxCYrdO9X8LHmJmpvUejzzI3uzi8
	 2/W6/Js/SDGRw==
Date: Mon, 19 Jan 2026 08:44:17 -0800
From: Kees Cook <kees@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Mark Rutland <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Ard Biesheuvel <ardb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 David Laight <david.laight.linux@gmail.com>
CC: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_0/3=5D_Fix_bugs_and_perfo?=
 =?US-ASCII?Q?rmance_of_kstack_offset_randomisation?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20fb97f1-7e50-485a-bdfd-a2901d20ec84@intel.com>
References: <20260119130122.1283821-1-ryan.roberts@arm.com> <20fb97f1-7e50-485a-bdfd-a2901d20ec84@intel.com>
Message-ID: <C502BCE6-2FB2-4A06-93A8-E8DEDFC22914@kernel.org>
MIME-Version: 1.0
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



On January 19, 2026 8:00:00 AM PST, Dave Hansen <dave.hansen@intel.com> wrote:
>On 1/19/26 05:01, Ryan Roberts wrote:
>> x86 (AWS Sapphire Rapids):
>> +-----------------+--------------+-------------+---------------+
>> | Benchmark       | Result Class |   v6.18-rc5 | per-task-prng |
>> |                 |              | rndstack-on |               |
>> |                 |              |             |               |
>> +=================+==============+=============+===============+
>> | syscall/getpid  | mean (ns)    |  (R) 13.32% |     (R) 4.60% |
>> |                 | p99 (ns)     |  (R) 13.38% |    (R) 18.08% |
>> |                 | p99.9 (ns)   |      16.26% |    (R) 19.38% |
>
>Like you noted, this is surprising. This would be a good thing to make
>sure it goes in very early after -rc1 and gets plenty of wide testing.

Right, we are pretty late in the dev cycle (rc6). It would be prudent to get this into -next after the coming rc1 (1 month from now).

On the other hand, the changes are pretty "binary" in the sense that mistakes should be VERY visible right away. Would it be better to take this into -next immediately instead?

>But I don't see any problems with the approach, and the move to common
>code looks like a big win as well:

Agreed; I think it's looking great.

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
