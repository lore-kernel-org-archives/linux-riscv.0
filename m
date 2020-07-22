Return-Path: <SRS0=J8tV=BB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26BAEC433E1
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 04:51:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8161207BB
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 04:51:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LT8SBdN1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="O2t3NNmb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8161207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5ALqfzY6vS7bmKG8X29HQKvCjj44KUgPgrtv2zv2p+A=; b=LT8SBdN1ox52K4153BpgabIiR
	Tls3dVYWw7WOTGH+SnYQUh7PPbzEwZGG50/Yj9BBFOf0cubs/YWNaBcYr6rpw1X0qBajWBRKQ5QhA
	f6iN4oTLU2UGZx5aMRzx4ua22Pfvnwy1tvy/okGJGTDsiXpEGFy3eIGqqOya5qdhZLXxA02NSHwgG
	VqnXAlig0BTyvARLRU4eiZyk1sPm6jrcTlikNrc7y8JYth9n197nyfsbFHBummrbJPB5QV5eCVmSH
	PpfkntTrTouDso+vnk8nQIEhAiMOCwdeVosMFbpcH1IQphyXzmuifz83nbbP6dgmCcaf97FauZPsL
	z4UYx3ViA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy6iT-0002sv-2f; Wed, 22 Jul 2020 04:50:53 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2] helo=ozlabs.org)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy6iP-0002sE-OZ
 for linux-riscv@lists.infradead.org; Wed, 22 Jul 2020 04:50:51 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BBNM73Xpmz9sSn;
 Wed, 22 Jul 2020 14:50:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595393445;
 bh=EikksBvUVVSgx7PbC9PoBMWAYLrAx1ActPVYUU8rTkE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=O2t3NNmb0TZYIhUfd294PgsE0mDk0NkX5s1kaEv2oF7KxbCWK0AOu14+8RiOCoTRa
 T4mAWJ+SJSElYmJQtB6y4fi3rvkBiIaQ7NXxAaODgjyE5nInphmmRww0/Im03/ehaX
 ypJjRz/oqooZ3L0EP63rd83/6xZX4mIoxF/UOZCC8S2P+Ki2CbMaWsG/zNTpIL74Tc
 GKWn3cXJ1Ki3jrENb3I3H3VSUbEIj07AZbgiHDrz0d1ftQBb8OhUd140mXnnmd4Fvg
 9H3ACTDWC9E10Oi0TdCkgLIebySHJ/MqkcThKvaYh9PRK4/yDDXQ/XhMG7u5XBB1xk
 VNFfjcFWrSAHA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
In-Reply-To: <bb461dde0df3eaf0bed949eebf0657b227431bb3.camel@kernel.crashing.org>
References: <mhng-cd9a74ea-2edf-47e4-aade-b090f1a069f1@palmerdabbelt-glaptop1>
 <bb461dde0df3eaf0bed949eebf0657b227431bb3.camel@kernel.crashing.org>
Date: Wed, 22 Jul 2020 14:50:42 +1000
Message-ID: <87sgdkqhjx.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_005050_191812_363DFBFF 
X-CRM114-Status: GOOD (  10.30  )
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
Cc: aou@eecs.berkeley.edu, alex@ghiti.fr, linux-mm@kvack.org,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, paulus@samba.org, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
> On Tue, 2020-07-21 at 16:48 -0700, Palmer Dabbelt wrote:
>> > Why ? Branch distance limits ? You can't use trampolines ?
>> 
>> Nothing fundamental, it's just that we don't have a large code model in the C
>> compiler.  As a result all the global symbols are resolved as 32-bit
>> PC-relative accesses.  We could fix this with a fast large code model, but then
>> the kernel would need to relax global symbol references in modules and we don't
>> even do that for the simple code models we have now.  FWIW, some of the
>> proposed large code models are essentially just split-PLT/GOT and therefor
>> don't require relaxation, but at that point we're essentially PIC until we
>> have more that 2GiB of kernel text -- and even then, we keep all the
>> performance issues.
>
> My memory might be out of date but I *think* we do it on powerpc
> without going to a large code model, but just having the in-kernel
> linker insert trampolines.

We build modules with the large code model, and always have AFAIK:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/Makefile?commit=4fa640dc52302b5e62b01b05c755b055549633ae#n129

  # -mcmodel=medium breaks modules because it uses 32bit offsets from
  # the TOC pointer to create pointers where possible. Pointers into the
  # percpu data area are created by this method.
  #
  # The kernel module loader relocates the percpu data section from the
  # original location (starting with 0xd...) to somewhere in the base
  # kernel percpu data space (starting with 0xc...). We need a full
  # 64bit relocation for this to work, hence -mcmodel=large.
  KBUILD_CFLAGS_MODULE += -mcmodel=large


We also insert trampolines for branches, but IIUC that's a separate
issue.

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
