Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99300C54798
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 08:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tT9X9E+CJrabeyDAWMs+DZLCX5PReEXKK7tmL9NJYIQ=; b=aww75zCVucBJLR
	7KpnTP0c78ky1nkllB+yLdDgEpxVGOVqUGcN5QNVeYj25h9i27hdRlcYTUyXsXrQKlCtpAY4OU7eZ
	BuPSeFbQJaJ0nxIaeA7qgpPcPMR/h2iSF8FBbrGtX72zaGjFUVdkHrPk1uM52ReMyIJlZHYIGfNVp
	nqB3UoIrtpuDlJ6TRodiMAyJ0ppWXyBctsyBDKj1WCZgfPQonZaae8wtLJ4m6qVztpkk7fhuR24JR
	y+c80Va/SCSbIhmMXwmOF8B5eK0+pkIUJby0JR60mxos86nhhfQvYBKmLV55XgZubS6HNIp766mLU
	QcT1san9SC7K7E1YNh5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhQ30-0000000Cajf-463n;
	Tue, 05 Mar 2024 08:21:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhQ2x-0000000Cahx-2ySE
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 08:21:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F25B860DE5;
	Tue,  5 Mar 2024 08:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4607CC433F1;
	Tue,  5 Mar 2024 08:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709626870;
	bh=WFgIUqss9TAdO9AjaUlgXXkzHAVPaeaf3euW2nSz/wM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HOPPu2Rv+RdmcOkgyYlgmMrXFdBSqx6Lvib1K4Tvnhn3J67hqN2RcG18v/LlVUFFh
	 jpaJpRl+uuBbX9T2FNShyS6KtAkgkO8S7CyG4SY+uWlvHPbo2HFl6mGAW0LTKHqZ0F
	 SWQ4zlsNDWXzN33UMPiKoKQdEJVlFhU2GYr2UmYwOAklK+kq1aaf+/7o6ER9xBqsLx
	 fedo6DW/bucOVcaw5pOch3Pwrw7BRAQlPK//XqKgfh87mc0kD/3xjS2ezlOWPYjcrq
	 bUca/5InbS+0ycCLRscWpkgSe1MY74qpIj8J6wVZmbTMRFn1LEJuttlgXICziEBbd2
	 RXDwoQ2B7A0ww==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>, Anup Patel
 <apatel@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Andrea
 Parri <andrea@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>,
 Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Andrea Parri
 <parri.andrea@gmail.com>
Subject: Re: [PATCH v3 2/2] riscv: Fix text patching when IPI are used
In-Reply-To: <20240305-sarcasm-ending-0f7946490aea@wendy>
References: <20240229121056.203419-1-alexghiti@rivosinc.com>
 <20240229121056.203419-3-alexghiti@rivosinc.com>
 <20240304-makeshift-bakeshop-26c9611de1a3@spud>
 <87msrdzqxi.fsf@all.your.base.are.belong.to.us>
 <CAK9=C2Xjgr9_H-sHkmAAc95dAm2jd+_dxLUxSM3RM3NrQJFKGQ@mail.gmail.com>
 <20240305-sarcasm-ending-0f7946490aea@wendy>
Date: Tue, 05 Mar 2024 09:21:07 +0100
Message-ID: <87frx5ozrg.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_002111_881632_DFF98E5D 
X-CRM114-Status: GOOD (  20.33  )
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

Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JpdGVzOgoKPiBPbiBU
dWUsIE1hciAwNSwgMjAyNCBhdCAwODozMzozMEFNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+
PiBPbiBUdWUsIE1hciA1LCAyMDI0IGF0IDE6NTTigK9BTSBCasO2cm4gVMO2cGVsIDxiam9ybkBr
ZXJuZWwub3JnPiB3cm90ZToKPj4gPgo+PiA+IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9y
Zz4gd3JpdGVzOgo+PiA+Cj4+ID4gPiBPbiBUaHUsIEZlYiAyOSwgMjAyNCBhdCAwMToxMDo1NlBN
ICswMTAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4+ID4gPj4gRm9yIG5vdywgd2UgdXNlIHN0
b3BfbWFjaGluZSgpIHRvIHBhdGNoIHRoZSB0ZXh0IGFuZCB3aGVuIHdlIHVzZSBJUElzIGZvcgo+
PiA+ID4+IHJlbW90ZSBpY2FjaGUgZmx1c2hlcyAod2hpY2ggaXMgZW1pdHRlZCBpbiBwYXRjaF90
ZXh0X25vc3luYygpKSwgdGhlIHN5c3RlbQo+PiA+ID4+IGhhbmdzLgo+PiA+ID4+Cj4+ID4gPj4g
U28gaW5zdGVhZCwgbWFrZSBzdXJlIGV2ZXJ5IENQVSBleGVjdXRlcyB0aGUgc3RvcF9tYWNoaW5l
KCkgcGF0Y2hpbmcKPj4gPiA+PiBmdW5jdGlvbiBhbmQgZW1pdCBhIGxvY2FsIGljYWNoZSBmbHVz
aCB0aGVyZS4KPj4gPiA+Pgo+PiA+ID4+IENvLWRldmVsb3BlZC1ieTogQmrDtnJuIFTDtnBlbCA8
Ympvcm5Acml2b3NpbmMuY29tPgo+PiA+ID4+IFNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwg
PGJqb3JuQHJpdm9zaW5jLmNvbT4KPj4gPiA+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4+ID4gPj4gUmV2aWV3ZWQtYnk6IEFuZHJlYSBQ
YXJyaSA8cGFycmkuYW5kcmVhQGdtYWlsLmNvbT4KPj4gPiA+Cj4+ID4gPiBXaGF0IGNvbW1pdCBk
b2VzIHRoaXMgZml4Pwo+PiA+Cj4+ID4gSG1tLiBUaGUgYnVnIGlzIGV4cG9zZWQgd2hlbiB0aGUg
QUlBIElQSSBhcmUgaW50cm9kdWNlZCwgYW5kIHVzZWQKPj4gPiAoaW5zdGVhZCBvZiB0aGUgZmly
bXdhcmUtYmFzZWQpLgo+PiA+Cj4+ID4gSSdtIG5vdCBzdXJlIHRoaXMgaXMgc29tZXRoaW5nIHdl
J2QgbGlrZSBiYWNrcG9ydGVkLCBidXQgcmF0aGVyIGEKPj4gPiBwcmVyZXF1aXNpdGUgdG8gQUlB
Lgo+PiA+Cj4+ID4gQEFudXAgQEFsZXggV0RZVD8KPj4gPgo+PiAKPj4gVGhlIGN1cnJlbnQgdGV4
dCBwYXRjaGluZyBuZXZlciBjb25zaWRlcmVkIElQSXMgYmVpbmcgaW5qZWN0ZWQKPj4gZGlyZWN0
bHkgaW4gUy1tb2RlIGZyb20gaGFydCB0byBhbm90aGVyIHNvIHdlIGFyZSBzZWVpbmcgdGhpcwo+
PiBpc3N1ZSBub3cgd2l0aCBBSUEgSVBJcy4KPj4gCj4+IFdlIGNlcnRhaW5seSBkb24ndCBuZWVk
IHRvIGJhY2twb3J0IHRoaXMgZml4IHNpbmNlIGl0J3MgbW9yZQo+PiBvZiBhIHByZXBhcmF0b3J5
IGZpeCBmb3IgQUlBIElQSXMuCj4KPiBXaGV0aGVyIG9yIG5vdCB0aGlzIGlzIGJhY2twb3J0YWJs
ZSwgaWYgaXQgZml4ZXMgYSBidWcsIGl0IHNob3VsZCBnZXQKPiBhIEZpeGVzOiB0YWcgZm9yIHRo
ZSBjb21taXQgdGhhdCBpdCBmaXhlcy4gRml4ZXM6IGlzbid0ICJ0aGUgYmFja3BvcnQiCj4gdGFn
LCBjYzogc3RhYmxlIGlzLgoKSSBndWVzcyB0aGUgcXVlc3Rpb24gaXMgaWYgdGhpcyAqaXMqIGEg
Zml4LCBvciByYXRoZXIgYSBjaGFuZ2UgcmVxdWlyZWQKZm9yIEFJQSAobm90IGEgZml4KS4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
