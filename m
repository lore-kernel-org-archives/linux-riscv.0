Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15091C3064D
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 14:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F0qOsoKlHck6qmqPbEKmXm1hKAwi+V6EdpHL5aVk6GI=; b=Fttowlr2IuTlbK
	lxrQSBYoX5zRjHQ3kfvc+Y3NHiANXaNfkF+/7z9w/jJypOOpNAE/ZVsJyze/UTB8PeP5QrduzeRM3
	hWpJ8DGX/TD2pGctseabZsKjgXOi2uJd4RpAqk7GjemMAPhySnoc3tRwY6RSkAv9UnCn6PIbL8LoS
	qEKIUAfAcun9GjUeU2TZWg9BpCdGGpNhk5ANMlBAFTfp/VA8IXyvVfYdREfwh70+C23FTfebcB61Y
	Zznhh8YMU+3oVpd0Lla7dcrYi+2ug3BzZsy7Kg8cna7tw5yGU9NXVQLieji7jTqrRkpGUnFaHej7Z
	iwAtRO+Vi8bGCbc5F4GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMpnW-0000000AZmY-3VG4;
	Thu, 27 Jun 2024 14:08:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMpnH-0000000AZiU-2CXC
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 14:08:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2D2D961EAD;
	Thu, 27 Jun 2024 14:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D03EC32789;
	Thu, 27 Jun 2024 14:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719497285;
	bh=tOGAjh8fOWBrBKO+gKQpEbeiFrPZiME/ff0aGa99Pak=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qNgSCYABdrETrv9VmirOi7dRe8S+APD37F6qvNKMG4LZHuenFa8LU9/Uz0JP/ZBKO
	 ly+MFzQU03LLPIlruQl0lYg51SP3fiTXazGOOb/GBTBkdLcJd9H8izNnu1D7iJ5Tf8
	 bzrnN5crAmIysc/rVrQh4jahpcxEjVgfEOIR3JNCF/PfAyFykWvI867moj61d3C4ml
	 voxf4C5OhVv8NDobiFbi/XgJviWCq5VwQkZDDJOey2LO57CsH0Y1L+XSEnLh+iCHqF
	 M2BomlNgrn6UvJnCoDSJwnXoOR9LnWN/Mviyht5QeyQeX+o4WkFVBzH8BtCMkd/NxN
	 ydAZLH33AfkAA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Celeste Liu <coelacanthushex@gmail.com>,
 linux-riscv@lists.infradead.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, "Dmitry
 V . Levin" <ldv@strace.io>
Cc: linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Palmer
 Dabbelt <palmer@rivosinc.com>, Emil Renner Berthing
 <emil.renner.berthing@canonical.com>, Felix Yan
 <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>, Celeste Liu
 <CoelacanthusHex@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH] riscv: entry: always initialize regs->a0 to -ENOSYS
In-Reply-To: <20240627103205.27914-2-CoelacanthusHex@gmail.com>
References: <20240627103205.27914-2-CoelacanthusHex@gmail.com>
Date: Thu, 27 Jun 2024 16:08:02 +0200
Message-ID: <87o77mpjgd.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_070812_226222_D9B70C45 
X-CRM114-Status: UNSURE (   6.28  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Q2VsZXN0ZSBMaXUgPGNvZWxhY2FudGh1c2hleEBnbWFpbC5jb20+IHdyaXRlczoKCj4gT3RoZXJ3
aXNlIHdoZW4gdGhlIHRyYWNlciBjaGFuZ2VzIHN5c2NhbGwgbnVtYmVyIHRvIC0xLCB0aGUga2Vy
bmVsIGZhaWxzCj4gdG8gaW5pdGlhbGl6ZSBhMCB3aXRoIC1FTk9TWVMgYW5kIHN1YnNlcXVlbnRs
eSBmYWlscyB0byByZXR1cm4gdGhlIGVycm9yCj4gY29kZSBvZiB0aGUgZmFpbGVkIHN5c2NhbGwg
dG8gdXNlcnNwYWNlLiBGb3IgZXhhbXBsZSwgaXQgd2lsbCBicmVhawo+IHN0cmFjZSBzeXNjYWxs
IHRhbXBlcmluZy4KPgo+IEZpeGVzOiA1MjQ0OWMxN2JkZDEgKCJyaXNjdjogZW50cnk6IHNldCBh
MCA9IC1FTk9TWVMgb25seSB3aGVuIHN5c2NhbGwgIT0gLTEiKQo+IENjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogQ2VsZXN0ZSBMaXUgPENvZWxhY2FudGh1c0hleEBn
bWFpbC5jb20+CgpSZXBvcnRlZC1ieTogIkRtaXRyeSBWLiBMZXZpbiIgPGxkdkBzdHJhY2UuaW8+
ClJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
