Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291ABC7618E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Apr 2023 17:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vl71Tyegik+lqZA6wezWCyj4zmVLnL721nzgsN5EsaQ=; b=LA7hwef06Ix6F7
	OQNxemCJbMwdFLu/Zu39e6AkO4b2tIUnK+rE+8dPkhsk0zfXAvn/QB2Q5w+1B/73sXfvp0BhaM14N
	s5+EshAxt8k0hxfK/F/g+Xtbt+aA02TNE6MtnlElgJJR1/LI4qO+QqLMIHahnMJRD/2iyc48bEj0a
	t1kV0ShlsTIdarHuxCFS0pThycoCtH3aigKWhmVaK31nmdDTZaPAuDrEAwWGjTNFxggIpcPo1F7pf
	u9ZZ5K7sthwGEzq342Kdrll8Rw/9Eglpb+PybvasNI3rtRwfLextjUlRXmuZmOZkS14hxOlV5hcqx
	pxE809pJFMJOS90M9USQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pr0Sb-00Gwyq-2U;
	Mon, 24 Apr 2023 17:58:45 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pr0SY-00Gwxy-2a;
	Mon, 24 Apr 2023 17:58:44 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1682359118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/B8ViPkT84zF77YJVg/Vg+DuX3x6sDAhKrSrx63B0t8=;
	b=zNVUbHm89L6WRj2i94+vPyVn3/KO1LB2C60TWY+kKf2/e8X9/9XtdKbM639oCyDfzo+kF6
	y7T/sJmhL5ytO4DUh414kpf+vt4CvUe/YodEpDD02hfzlBINbTEIvI3SsdLqezsCo+5tFW
	AvbLWyv3qGi42txG7eIeRdoNoCDf86KN/QgJXAPPGmhTl1TqeCcHqSPF7eM9+ujvoD5z/m
	AjrKuWx0mKwm8kHTyjPIB1SSadCZzqxSWvKRYA61NK+fA/i4N78zaZprmbihpUvGoCep3s
	2RQE5w5ABRrYdGBrSZjZPmPvtUXxeogAae/i/g9/9f8KekX5LyUd6mtLrTj6qw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1682359118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/B8ViPkT84zF77YJVg/Vg+DuX3x6sDAhKrSrx63B0t8=;
	b=ZaMRZ/Y/wVrPL6Kd1U5Zo8HZlUCLMRTrTHQ/7Xvf+abFcSRFeSo9Dw3jXKeMeUtXfr3+up
	aT9nxD885g2bqnAA==
To: Brian Gerst <brgerst@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Arjan van
 de Veen <arjan@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, Paul
 McKenney <paulmck@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, Sean
 Christopherson <seanjc@google.com>, Oleksandr Natalenko
 <oleksandr@natalenko.name>, Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Piotr Gorski
 <lucjan.lucjanov@gmail.com>, David Woodhouse <dwmw@amazon.co.uk>, Usama
 Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 35/37] x86/smpboot: Support parallel startup of
 secondary CPUs
In-Reply-To: <87mt38yhwh.ffs@tglx>
References: <20230414225551.858160935@linutronix.de>
 <20230414232311.379210081@linutronix.de>
 <CAMzpN2hUbYpYrqDL1ViXUWGKGa7mDEG6iHtWEZg9GvrAoRgvKQ@mail.gmail.com>
 <87mt38yhwh.ffs@tglx>
Date: Mon, 24 Apr 2023 19:58:36 +0200
Message-ID: <878reh17sj.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_105843_000935_CD134782 
X-CRM114-Status: GOOD (  11.28  )
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

T24gU2F0LCBBcHIgMTUgMjAyMyBhdCAyMzowNiwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgoKPiBP
biBTYXQsIEFwciAxNSAyMDIzIGF0IDA5OjIyLCBCcmlhbiBHZXJzdCB3cm90ZToKPj4gT24gRnJp
LCBBcHIgMTQsIDIwMjMgYXQgNzo0NeKAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJv
bml4LmRlPiB3cm90ZToKPj4+IEBAIC0yNDgsMTAgKzMxMSwyMCBAQCBTWU1fSU5ORVJfTEFCRUwo
c2Vjb25kYXJ5X3N0YXJ0dXBfNjRfbm9fCj4+PiAgICAgICAgICAqCj4+PiAgICAgICAgICAqIFJE
WCBjb250YWlucyB0aGUgcGVyLWNwdSBvZmZzZXQKPj4+ICAgICAgICAgICovCj4+PiAtICAgICAg
IG1vdnEgICAgcGNwdV9ob3QgKyBYODZfY3VycmVudF90YXNrKCVyZHgpLCAlcmF4Cj4+PiAtICAg
ICAgIG1vdnEgICAgVEFTS190aHJlYWRzcCglcmF4KSwgJXJzcAo+Pj4gKyAgICAgICBtb3ZxICAg
IHBjcHVfaG90ICsgWDg2X3RvcF9vZl9zdGFjayglcmR4KSwgJXJzcAo+Pgo+PiBTd2l0Y2hpbmcg
dG8gdXNpbmcgcGNwdV9ob3QudG9wX29mX3N0YWNrIGlzIG9rLCBidXQgaXQncyBub3QKPj4gY29t
cGxldGVseSBlcXVpdmFsZW50LiAgdG9wX29mX3N0YWNrIHBvaW50cyB0byB0aGUgZW5kIG9mIHRo
ZSBwdF9yZWdzCj4+IHN0cnVjdHVyZSwgd2hpbGUgdGhlIGtlcm5lbCBzdGFjayBzdGFydHMgYmVs
b3cgcHRfcmVncyBldmVuIGZvciBrZXJuZWwKPj4gdGhyZWFkcy4gIFNvIHlvdSBuZWVkIHRvIHN1
YnRyYWN0IFBUUkVHU19TSVpFIGZyb20gdGhlIHN0YWNrIHBvaW50ZXIKPj4gYWZ0ZXIgdGhpcy4K
Pj4KPj4gVGhpcyBjaGFuZ2Ugc2hvdWxkIGFsc28gYmUgYSBzZXBhcmF0ZSBwYXRjaC4KPgo+IFlv
dSdyZSByaWdodCBvbiBib3RoIGNvdW50cy4KCkFjdHVhbGx5IG5vLiBXZSBjYW4ndCBkbyB0aGF0
IGFzIHRoaXMgYnJlYWtzIHN1c3BlbmQvcmVzdW1lIChhZ2FpbikuCgovbWUgZHJvcHMgaXQuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
