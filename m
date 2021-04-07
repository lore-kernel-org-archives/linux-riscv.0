Return-Path: <SRS0=uKmQ=JE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F1AC433ED
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 15:53:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1463261262
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 15:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1463261262
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=srGtzSCC/OlbVBWtgSLKzGVHceKbOAqlGR1CSkbaOPU=; b=Ucp9xyDnU408GaILhJi0zlZNf
	MkEODVrMkPumYyPxtoGOV679KU1nSfb2W0iZ+nyiGXo9KTlZYmXrZyTGpA4BbReE3And4v2DH/iRi
	zEVgGwmmcVKrHodCWt0paZWyLDZE4x93Oly76KKn1nku0t/BbRPBIRo/DLThAY4Dg+MQG/3d3STJ9
	MmkK3KNrtOu09EZ8p17lhme/cgjNQZZeuAOASo4ZvgGw53r4VDwvaHctcfu4S1N2QWCj5vwQO+XdA
	tPazIyR4pa9mGW6Ew/MnagRaKK/LEEj/rS0LAEGg2iJrME8YLy/ukJ5vUiLXY2Ih7drdQUTvB71aU
	rB8WWk6ZQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUAUd-005L7b-3O; Wed, 07 Apr 2021 15:53:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUAUJ-005L1v-HZ
 for linux-riscv@desiato.infradead.org; Wed, 07 Apr 2021 15:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=a8elwdZOsCHEPMraxac9e3Y9q00OjQSrAqqfC563Li0=; b=hT6rnPygmAOYuDBJ32gkAH24DN
 y0EskBQYVhmESQygX/JL1U9CFVN+vrw/X7f9JTPcPCgdQ0LfUq9HawJDre8t8SVigUPAP7gB/glVm
 qgAIylcHxk4Si+FR+ujhExsOgHLe7mhsLbe5p7LaCwVlflxb5He+EL7JVv1UnjRMWP6inKBD5KMwv
 nu0686GQIB6TMS465yR1qCNjO7osE7Oz1r2O1wVhf1N2AdhYQEaUzwHGexje1/o1iKA3DErFp/mQM
 fUWkDL41gAFBEkN8r5Uj8W9Nj8cxy31EKCUCk8SAm9oHb9jRFGbmZMBzzEb00QQllAZzoElXkIyXB
 1r8acCwQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lUASU-00Ehp1-Ej; Wed, 07 Apr 2021 15:51:45 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 994483015D3;
 Wed,  7 Apr 2021 17:51:07 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 42E382BF09268; Wed,  7 Apr 2021 17:51:07 +0200 (CEST)
Date: Wed, 7 Apr 2021 17:51:07 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, Guo Ren <guoren@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <YG3U677P9QKqFGMY@hirez.programming.kicks-ass.net>
References: <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTS4jexKsSiXBY=5rz53LjcLUZ1K4pxjYJDVQCWx_8JTuA@mail.gmail.com>
 <YGwKpmPkn5xIxIyx@hirez.programming.kicks-ass.net>
 <20210407094224.GA3393992@infradead.org>
 <CAHB2gtROGuoNzv5f9QrhWX=3ZtZmUM=SAjYhKqP7dTiTTQwkqA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHB2gtROGuoNzv5f9QrhWX=3ZtZmUM=SAjYhKqP7dTiTTQwkqA@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 07, 2021 at 04:29:12PM +0200, Christoph M=FCllner wrote:
> Further, it is not the case that RISC-V has no guarantees at all.
> It just does not provide a forward progress guarantee for a
> synchronization implementation,
> that writes in an endless loop to a memory location while trying to
> complete an LL/SC
> loop on the same memory location at the same time.

Userspace can DoS the kernel that way, see futex.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
