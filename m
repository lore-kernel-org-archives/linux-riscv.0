Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AE1C25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 12:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zj4tRIKepw5bP6Apxkd1L/lHcIdnqcrOV8WpT+IPIVM=; b=T/miVY10mDbJUK
	jYLnZxzj4OOjsyBrl8cFfCvbRXoFVyqpi4f8qGMblD3UpMMRHPuxuS+Zv/f1mkB68uX30xkKtVNGu
	OIrSgsrGDi7dHBtpopaWKMBhdcEvi540rhuHSwMdvY7VoGg/7lgAC+S1YDxcL+5Z0pF/X5g2iId2L
	8iq6ayOlrHtKPfWoo2F/lNcMya0X4OCNj0/l+2lknUkFzz9y69GGvQLVpqYgpxSHwWeSiwMbS+mcJ
	qTyREOxvBN31XBno8bUatdH/HFUB0gcgv9r6rImq/0O6ABcptik7JEUeKB4yVndRM8xhaQabPC4Pt
	K+6xxW+Xbyam2BvUZcCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7sc-00000006EpJ-2CJm;
	Thu, 23 May 2024 12:49:10 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7sZ-00000006Emx-3SDK
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 12:49:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 16930CE1717;
	Thu, 23 May 2024 12:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B52C2BD10;
	Thu, 23 May 2024 12:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716468539;
	bh=0LnqLKPO3oHw4EJVIibzy2VTLh33HjinRBhfOHkwyqo=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=gmIwD+NWWG8uf8vz7oJxu92yCfnO5F7AHKAYts7hJ3i7MjyDadHiy9lzsJ6u8U4mI
	 oYCcZSPKX1+Mx6oRo3u1ATvbTWd2gsQZxBuu1wYMeVa1//6i3BYkZJvjVAv8COnPfc
	 UgGMD/d2ScHrcYNYsj02hBwhLrTrXjvfp1y+aI3yAhbktDkDf4MMCEdU1pnGsJ3pNL
	 6ODypG/qGkAdFHLyFRh826sp0Jy7qvGN+SoZNPcwGOYZw8I6JwcpVxJ/b2J/aaE4JC
	 fEM/kpy8wItlOJWXQBUzcGyLb2xGZQcm3X6KlLvkvun89tmccNqmesex35PqRqk6ET
	 Y9yV1AO9U188Q==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Andrea Parri
 <parri.andrea@gmail.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Conor Dooley
 <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix early ftrace nop patching
In-Reply-To: <20240523115134.70380-1-alexghiti@rivosinc.com>
References: <20240523115134.70380-1-alexghiti@rivosinc.com>
Date: Thu, 23 May 2024 14:48:55 +0200
Message-ID: <87y1803d8o.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_054908_281317_0142E705 
X-CRM114-Status: GOOD (  10.22  )
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

QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IENvbW1p
dCBjOTdiZjYyOTk2M2UgKCJyaXNjdjogRml4IHRleHQgcGF0Y2hpbmcgd2hlbiBJUEkgYXJlIHVz
ZWQiKQo+IGNvbnZlcnRlZCBmdHJhY2VfbWFrZV9ub3AoKSB0byB1c2UgcGF0Y2hfaW5zbl93cml0
ZSgpIHdoaWNoIGRvZXMgbm90Cj4gZW1pdCBhbnkgaWNhY2hlIGZsdXNoIHJlbHlpbmcgZW50aXJl
bHkgb24gX19mdHJhY2VfbW9kaWZ5X2NvZGUoKSB0byBkbwo+IHRoYXQuCj4KPiBCdXQgd2UgbWlz
c2VkIHRoYXQgZnRyYWNlX21ha2Vfbm9wKCkgd2FzIGNhbGxlZCB2ZXJ5IGVhcmx5IGRpcmVjdGx5
IHdoZW4KPiBjb252ZXJ0aW5nIG1jb3VudCBjYWxscyBpbnRvIG5vcHMgKGFjdHVhbGx5IG9uIHJp
c2N2IGl0IGNvbnZlcnRzIDJCIG5vcHMKPiBlbWl0dGVkIGJ5IHRoZSBjb21waWxlciBpbnRvIDRC
IG5vcHMpLgo+Cj4gVGhpcyBjYXVzZWQgY3Jhc2hlcyBvbiBtdWx0aXBsZSBIVyBhcyByZXBvcnRl
ZCBieSBDb25vciBhbmQgQmrDtnJuIHNpbmNlCj4gdGhlIGJvb3RpbmcgY29yZSBjb3VsZCBoYXZl
IGhhbGYtcGF0Y2hlZCBpbnN0cnVjdGlvbnMgaW4gaXRzIGljYWNoZQo+IHdoaWNoIHdvdWxkIHRy
aWdnZXIgYW4gaWxsZWdhbCBpbnN0cnVjdGlvbiB0cmFwOiBmaXggdGhpcyBieSBlbWl0dGluZyBh
Cj4gbG9jYWwgZmx1c2ggaWNhY2hlIHdoZW4gZWFybHkgcGF0Y2hpbmcgbm9wcy4KPgo+IEZpeGVz
OiBjOTdiZjYyOTk2M2UgKCJyaXNjdjogRml4IHRleHQgcGF0Y2hpbmcgd2hlbiBJUEkgYXJlIHVz
ZWQiKQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5j
LmNvbT4KCk5pY2UhCgpJJ3ZlIG1hbmdlZCB0byByZXByb2R1Y2UgdGhlIGNyYXNoIG9uIHRoZSBW
aXNpb25GaXZlMiBib2FyZCAoaG93ZXZlcgpvbmx5IHRyaWdnZXJlZCB3aGVuIENPTkZJR19SRUxP
Q0FUQUJMRT15KSwgYW5kIGNhbiB2ZXJpZnkgdGhhdCB0aGlzIGZpeApzb2x2ZXMgdGhlIGlzc3Vl
LgoKUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KVGVzdGVk
LWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
