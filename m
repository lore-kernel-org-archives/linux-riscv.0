Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31005C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 13:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8tY5drvdZ8xrbq8oOO3XGRp9pkVvrcenE69xBBypehY=; b=ZAXLyuJnmoHHI8
	pIVS3O8ns4Jw9e/tKqa+5wo8iy2kLxOdb0qOftXPECB2CFTwFyT4erugsMY1mXs/GMMhrhP6dCE7i
	aKd+mIwmsPcFaxpYWm0m5HX8lPBTdFpK336Y2mH+4itTvYA71uNNGNHYNG0Ihxea61YSKa74Fd+Ih
	Gs4jbEtux1DQVl47VlY3Vhi6EFjBvLNM6IxnqHE5/YcBsg1OQP0FC/8+GHTGtd/7gLSXL4liGMDs1
	LXFDm7LfW1VN99XUESJQoRD6yUdigiToDUaJ0TgMTTUbgBRCXE5IOEHY+QyjDNbyKXyp6ot/A55rp
	dNYFG4mkS/61ZsLs5Y0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3XK-00000005guO-2HeP;
	Tue, 24 Jun 2025 13:18:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3XJ-00000005guG-11rh
	for linux-riscv@bombadil.infradead.org;
	Tue, 24 Jun 2025 13:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IieBpWHrUJv1ck4+wSYHEjk5x9SCb1YNYUD3LP0jkSk=; b=HKhVub41OECmOFO458Cc1rQOVx
	gmwzUzxgfSsChY1YuDlCxnp2Zy99pxyz1pOHFZtssWRVE8pY51a0qeDtYXJW2SR4m6/kM4/laMtbi
	sVFU0Isk/rsSml5YsSr403HQ2pq9cZtTanNNNlaRCq1AvZQ20Qm8HWh0QrDrd1kyhl4/Nofx2Yx7S
	ZGzLMTH/aVIMDHR1zqR6LewDyi4SEmweGx7CHatIOXBKIp6WBuR4V8fFC7HdVhSg3/3/vV5tZretP
	bFZLCLslnqgx9hVCN8CE7qEF2Lc/hy6PdOFfyATwOVu2452MMaabuDo3norkORt5BjzRJlSLYh+So
	cgK9FzTw==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3XG-00000005RYB-1cHa
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 13:18:04 +0000
Date: Tue, 24 Jun 2025 15:17:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750771056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IieBpWHrUJv1ck4+wSYHEjk5x9SCb1YNYUD3LP0jkSk=;
	b=dVh7i0sjSNv6aPgxQQ3ZbfR+PVq9/BRCCT5OvFwO4opVw94YOleFduwwtJ7i35s0RY1mcc
	spkMDXgoW422GwQP6qWPAM0CmCOl+LbO7vvk1oI42cBn31ikvj30RLLzB/lE49oQY7KduT
	yaBtTMMeKTgHPaDyiijt/qzGrYm/GwVCwNV3HVqKRZ8ljkEzSEesDWoEAEauJ2jnydQSqW
	KPcM3FdptK4WSd0JK86mxmDCa5fGFnQ4qGNznydbfIm8qeXtSulkG2+3VFtJwFWqnQ8APQ
	fpYMGkbEodnbIM6uVPLqM2tND7SieEpJZXJ9p+i81HbitX3t4+tQDAplLelxOA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750771056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IieBpWHrUJv1ck4+wSYHEjk5x9SCb1YNYUD3LP0jkSk=;
	b=dj4kO9HfCpnvs8yEFiJQ1vwOtBep2CJz4cxkEeFgjILyB6PMaRzRqeRIOnE/DR03iTOxoI
	CxclgKHT7ijIsMAQ==
From: Nam Cao <namcao@linutronix.de>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	Alexandre Ghiti <alex@ghiti.fr>, bigeasy@linutronix.de,
	clrkwllms@kernel.org, rostedt@goodmis.org,
	linux-rt-devel@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Enable interrupt during exception handling
Message-ID: <20250624131730.XqPd1HUR@linutronix.de>
References: <mhng-60581B88-6FC7-4349-96B6-730D908ABF4A@palmerdabbelt-mac>
 <alpine.DEB.2.21.2506240303170.61655@angie.orcam.me.uk>
 <19cf2371-7293-4e71-a17d-669db4c8270a@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <19cf2371-7293-4e71-a17d-669db4c8270a@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_141802_520679_0BA84651 
X-CRM114-Status: GOOD (  13.37  )
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

On Tue, Jun 24, 2025 at 01:37:13PM +0200, Cl=E9ment L=E9ger wrote:
> On 24/06/2025 04:09, Maciej W. Rozycki wrote:
> > On Mon, 23 Jun 2025, Palmer Dabbelt wrote:
> >> I'm kind of split on a Fixes tag here.  One could argue it's a regress=
ion, as
> >> having interrupts disabled during exceptions is going to cause all sor=
ts of
> >> performance issues for users.  Seems a bit risk to just backport, thou=
gh...
> >>
> >> That said, if nobody noticed then it's probably a good sign nobody is =
really
> >> paying attention and we should just backport it before anyone notices.=
..
> > =

> >  Oh, someone did notice and it's not only performance, cf. =

> > <https://lore.kernel.org/r/alpine.DEB.2.21.2501070143250.18889@angie.or=
cam.me.uk/>.
> =

> I also had a series which was doing so for misaligned accesses handling,
> but after discussion, it was not ok to do so.:
> =

> https://lore.kernel.org/linux-riscv/20250422094419.GC14170@noisy.programm=
ing.kicks-ass.net/

If I understand that right, exceptions from kernel should be treated as
NMI, so that lockdep can tell us if exception handlers touch locks.

But (conditionally) enabling interrupts does not lose us that benefit. It
is still considered NMI by lockdep.

Unless I miss something, the patch is fine as is.

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
