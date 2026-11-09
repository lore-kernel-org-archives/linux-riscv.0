Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F381D606A321
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 04:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4C3VHKAm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N95gnPXL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xCkDfSJ7ZXOp+5c1G5g8XIFn9fptSE6hhb5ZvjzsfVw=; b=4C3VHKAm16jv2FCDfhL8O73Peu
	IrkYzV5rPshxUR8XasFT55lY2+eaS9YhZJGV2OtFsHKeY8Wxo8kTJBPZD8UFVSUhGLEjkJgDnaQLl
	OAWrFRoR2FW/JMybRfENc72+PgKUzdZFaiwevDpZtN585hYwoS8rBgA3T9LYsLZMskxVYLkv7D7VD
	8JQetVKnhrEkYpvhjRgTF15ufL3GkHTEo4CV31eOwTKcwp0Rj/Z7r1owPv8P3ghqFJStV9yF+LTVC
	NoSWjrNJMY2CEOum7zDBhBxxj0+HMSJJ4opz30zJralp3uZEZmXM6iW+gAJ+61cFLP91ej3OgZWLM
	IJsnxucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHRb-0000000HMx0-1WmS;
	Mon, 09 Nov 2026 04:57:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHRa-0000000HMwk-0JdQ
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 04:57:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 609B560D23;
	Mon,  9 Nov 2026 04:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1152D1F0089F;
	Mon,  9 Nov 2026 04:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794200240;
	bh=1zNWv97CstwBNheuwZjrwa0R2kSphitL/TC9zaG/Pkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N95gnPXLnpzv+UXjUpQJCQWPHnwlMCE3wfy8ChEdK4EBt37m07f/VDaAK11B2doNk
	 DpoWmXLnxhO33o2Rq+cqHz/6ZzWH2CI/Ab9KsOobE+JX3xVTT75wULQ2YLb5lYadTv
	 +fFW0HXQF2FStsCCbpdQMoIzPuinc28mvJ1Y1CAH9pGxmXXd/uDtWLoWkaXjWZicqs
	 mS9AeVlEqfs/uy+GFLoSw+lYuFZeng03TFRq82FCbwpVaVIMxga88hFuR1VVt/SdGJ
	 eiHwh7d2xs2CsPWvXC0GvHjOLiQhcO88/PK///+rvCTcwyZTUyTAhdgOWPFu3GN5ch
	 aDiNcK/jSWjDg==
Date: Mon, 9 Nov 2026 12:37:00 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: David Laight <david.laight.linux@gmail.com>, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
	eddyz87@gmail.com, memxor@gmail.com, song@kernel.org,
	yonghong.song@linux.dev, jolsa@kernel.org, bjorn@kernel.org,
	pulehui@huawei.com, puranjay@kernel.org, thuth@redhat.com,
	ajones@ventanamicro.com, ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com, samuel.holland@sifive.com,
	zong.li@sifive.com, conor.dooley@microchip.com, tglx@kernel.org,
	debug@rivosinc.com, seanwascoding@gmail.com, andybnac@gmail.com,
	menglong8.dong@gmail.com, cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn, atishp@rivosinc.com,
	apatel@ventanamicro.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	bpf@vger.kernel.org, arnd@arndb.de, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	justinstitt@google.com, qingfang.deng@siflower.com.cn,
	linux-arch@vger.kernel.org, llvm@lists.linux.dev, dave@stgolabs.net,
	emil@etsalapatis.com, ihor.solodrai@linux.dev, broonie@kernel.org
Subject: Re: [External] Re: [PATCH v9 1/3] riscv: implement this_cpu
 operations
Message-ID: <avFN7LbSK0q1gsB6@xhacker>
References: <20261108110406.97495-1-cuiyunhui@bytedance.com>
 <20261108110406.97495-2-cuiyunhui@bytedance.com>
 <20261108213254.67805ef0@pumpkin>
 <CAEEQ3w=5QwwvMJFJkpS51APoBjhed6oriCkvcieRdUFWrKtmSg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3w=5QwwvMJFJkpS51APoBjhed6oriCkvcieRdUFWrKtmSg@mail.gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBOb3YgMDksIDIwMjYgYXQgMTE6NDc6NDNBTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBEYXZpZCwKPiAKPiBPbiBNb24sIE5vdiA5LCAyMDI2IGF0IDU6MzPigK9BTSBEYXZp
ZCBMYWlnaHQKPiA8ZGF2aWQubGFpZ2h0LmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
T24gU3VuLCAgOCBOb3YgMjAyNiAxOTowNDowNCArMDgwMAo+ID4gWXVuaHVpIEN1aSA8Y3VpeXVu
aHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4KPiA+ID4gUklTQy1WIGhhcyBubyBhc20vcGVy
Y3B1LmgsIHNvIHRoaXNfY3B1XyooKSByZWFkLW1vZGlmeS13cml0ZQo+ID4gPiBvcGVyYXRpb25z
IHVzZSBnZW5lcmljIGltcGxlbWVudGF0aW9ucyB0aGF0IGRpc2FibGUgbG9jYWwgaW50ZXJydXB0
cy4KPiA+ID4KPiA+ID4gSW1wbGVtZW50IFJJU0MtVi1zcGVjaWZpYyB0aGlzX2NwdSBvcGVyYXRp
b25zIHdpdGggcHJlZW1wdGlvbiBkaXNhYmxlZAo+ID4gPiB0byBrZWVwIGFjY2Vzc2VzIG9uIHRo
ZSBjdXJyZW50IENQVS4KPiA+Cj4gPiBIYXZlIHlvdSBsb29rZWQgYXQgc29tZSBvZiB0aGUgc2No
ZW1lcyAoSSB0aGluayBhcm02NCBoYXMgdGhlIGxhdGVzdCwKPiA+IGJ1dCBhbHNvIHMzOTApIHRo
YXQgZG8gbW9zdCBwZXItY3B1IG9wcyB3aXRob3V0IGRpc2FibGluZyBwcmVlbXB0aW9uLgo+ID4g
SW4gcGFydGljdWxhciB0aGV5IHNhdmUgdGhlIHByZS1lbXB0aW9uIGNoZWNrIHdoZW4gcHJlLWVt
cHRpb24KPiA+IGlzIGVuYWJsZWQuCj4gPgo+ID4gQmFzaWNhbGx5IHRoZSBjb2RlIHRlbGxzIHRo
ZSBzY2hlZHVsZXIgd2hpY2ggcmVnaXN0ZXIgY29udGFpbnMgdGhlCj4gPiBwZXItY3B1IGRhdGEg
c28gdGhhdCBpdCBjYW4gYmUgJ21hZ2ljYWxseScgZmxpcHBlZCBkdXJpbmcgYSBjb250ZXh0Cj4g
PiBzd2l0Y2guCj4gCj4gTWFueSB0aGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0IGFuZCBzdWdn
ZXN0aW5nIHRoaXMgb3B0aW1pemF0aW9uLiBUaGlzCj4gaXMgYSB2ZXJ5IHVzZWZ1bCBzdWdnZXN0
aW9uLiBJbiB0aGUgY29tbW9uIGNhc2Ugbm8gcHJlZW1wdGlvbiBvciBtaWdyYXRpb24KPiBvY2N1
cnMsIHNvIHRoZSBwcmVlbXB0aW9uIGJvb2trZWVwaW5nIGFuZCByZXNjaGVkdWxlIGNoZWNrIGFy
ZSB1bm5lY2Vzc2FyeQo+IG92ZXJoZWFkLgo+IAo+IEltcGxlbWVudGluZyB0aGlzIHNjaGVtZSBm
b3IgUklTQy1WIHdpbGwgcmVxdWlyZSBhZGRpdGlvbmFsIGNoYW5nZXMgYmV5b25kCj4gdGhlIGN1
cnJlbnQgc2VyaWVzLiBJZiB0aGlzIHNlcmllcyBpcyBvdGhlcndpc2UgYWNjZXB0YWJsZSwgSSB3
b3VsZCBsaWtlCj4gdG8gbGFuZCB0aGUgY3VycmVudCB0aGlzX2NwdV8qIHN1cHBvcnQgZmlyc3Qg
YW5kIHRoZW4gcHJlcGFyZSBhIGZvbGxvdy11cAo+IHNlcmllcyB1c2luZyB0aGlzIGFwcHJvYWNo
LgoKSGkgWXVuaHVpIGFuZCBEYXZpZCwKCkR1cmluZyB0aGUgbWVyZ2Ugd2luZG93IGJ1dCBiZWZv
cmUgcmMxLCBJIGltcGxlbWVudGVkIGEgcmlzY3YgUE9DCmZvbGxvd2luZyBhcm02NCdzIHByZWVt
cHRpYmxlIHRoaXMgY3B1IHNjaGVtZS4gRWFjaCBvcGVyYXRpb24gcmVjb3JkcwppdHMgcGVyLWNw
dSBwb2ludGVyLCBvZmZzZXQgYW5kIGFkZHJlc3MgcmVnaXN0ZXJzLiBFeGNlcHRpb24gZW50cnkg
c2F2ZXMKYW5kIGNsZWFycyB0aGlzIHN0YXRlLCBhbmQgYSBub2luc3RyIGMgaGVscGVyIHJlcGFp
cnMgdGhlIHNhdmVkIG9mZnNldAphbmQgYWRkcmVzcyByZWdpc3RlcnMgb24gZXhjZXB0aW9uIHJl
dHVybiBhZnRlciBhbnkgbWlncmF0aW9uLgoKSG93ZXZlciwgbXkgUG9DIGlzIGJhc2VkIG9uIGN1
cnJlbnQgcGVyY3B1IG9mZnNldC4KCkkgcGxhbmVkIHRvIHNlbnQgaXQgb3V0IGxhc3QgU3VuZGF5
LCBidXQgdGhlbiBJIGZvdW5kIFl1bmh1aSBzZW50CmhpcyBwZXJjcHUgc2VyaWVzKHdoaWNoIGlz
IHVwIHRvIHY5LCBJIGRpZG4ndCBrbm93IHRoaXMgYmVmb3JlKSBvbiBTYXQuClNvIEkgaG9sZCBv
biB0aGUgc2VuZGluZy4KCk5vdyB3b3VsZCBpdCBtYWtlIHNlbnNlIHRvIHJlYmFzZSB0aGUgUG9D
IG9uIFl1bmh1aSdzIHNlcmllcyBwYXRjaDIgYW5kCnBhdGNoMywgZXNwZWNpYWxseSB0aGUgcGVy
Y3B1IG9mZnNldCBvcHRpbWl6YXRpb24/IEkgY2FuIHBvc3QgYW4gUkZDCndpdGggdGhpcyByZWJh
c2VkIGltcGxlbWVudGF0aW9uLgoKVGhhbmtzCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBs
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
