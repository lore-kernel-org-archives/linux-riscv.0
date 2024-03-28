Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F39C54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 15:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ikFGfjkDYfA07xA8ZRxfWw5xSdGEFpB8/zmDZ1XTzU=; b=tlmGnF9zt13EVf
	2gZRauWhi+lw2+JUOAlGSxrGCWf/xjKf7m8dF0pab7EDKYKdJb0t3DtGYuoX2FWh42Vg0mZ8pKNd0
	Pu4k40G+ZA1GuSRwEAFM8YUOjVgOSmIk8eJSq13+2l0yiSD740OTGMDFl7ELYxT75pTm5ePsoxlOF
	BV0TBY8n7wN0rXdOygUy4AS5+6/T23XV2PvfSFs9FNt7++zSsbQ1LtuqUqeIbIfs1NvZ+X6hmu/Gm
	lp+xOjI8Sy5yFz74ztrP1NQLdHreW+bfQTyA65nwsJgVxdlgOJpP4ZFB4XwiQGzR6+BB1yopPPp8w
	qSVgKUSrJQhy7DuslWyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rprP6-0000000ETIS-1Gb7;
	Thu, 28 Mar 2024 15:10:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rprP3-0000000ETGn-041V;
	Thu, 28 Mar 2024 15:10:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3EB2D60DD7;
	Thu, 28 Mar 2024 15:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D2BC433C7;
	Thu, 28 Mar 2024 15:10:47 +0000 (UTC)
Date: Thu, 28 Mar 2024 11:13:30 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Jiri Olsa
 <jolsa@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eddy Z <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, "David S.
 Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, Dave
 Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Quentin Monnet
 <quentin@isovalent.com>, bpf <bpf@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 linux-trace-kernel@vger.kernel.org, "open list:KERNEL SELFTEST FRAMEWORK"
 <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [External] Re: [PATCH bpf-next v2 1/9] bpf: tracing: add
 support to record and check the accessed args
Message-ID: <20240328111330.194dcbe5@gandalf.local.home>
In-Reply-To: <CALz3k9jG5Jrqw=BGjt05yMkEF-1u909GbBYrV-02W0dQtm6KQQ@mail.gmail.com>
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
	<20240311093526.1010158-2-dongmenglong.8@bytedance.com>
	<CAADnVQKQPS5NcvEouH4JqZ2fKgQAC+LtcwhX9iXYoiEkF_M94Q@mail.gmail.com>
	<CALz3k9i5G5wWi+rtvHPwVLOUAXVMCiU_8QUZs87TEYgR_0wpPA@mail.gmail.com>
	<CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com>
	<CALz3k9icPePb0c4FE67q=u1U0hrePorN9gDpQrKTR_sXbLMfDA@mail.gmail.com>
	<CAADnVQLwgw8bQ7OHBbqLhcPJ2QpxiGw3fkMFur+2cjZpM_78oA@mail.gmail.com>
	<CALz3k9g9k7fEwdTZVLhrmGoXp8CE47Q+83r-AZDXrzzuR+CjVA@mail.gmail.com>
	<CAADnVQLHpi3J6cBJ0QBgCQ2aY6fWGnVvNGdfi3W-jmoa9d1eVQ@mail.gmail.com>
	<CALz3k9g-U8ih=ycJPRbyU9x_9cp00fNkU3PGQ6jP0WJ+=uKmqQ@mail.gmail.com>
	<CALz3k9jG5Jrqw=BGjt05yMkEF-1u909GbBYrV-02W0dQtm6KQQ@mail.gmail.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_081053_155392_1734C484 
X-CRM114-Status: GOOD (  20.94  )
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

T24gVGh1LCAyOCBNYXIgMjAyNCAyMjo0Mzo0NiArMDgwMArmoqbpvpnokaMgPGRvbmdtZW5nbG9u
Zy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgoKPiBJIGhhdmUgZG9uZSBhIHNpbXBsZSBiZW5jaG1h
cmsgb24gY3JlYXRpbmcgMTAwMAo+IHRyYW1wb2xpbmVzLiBJdCBpcyBzbG93LCBxdWl0ZSBzbG93
LCB3aGljaCBjb25zdW1lIHVwIHRvCj4gNjBzLiBXZSBjYW4ndCBkbyBpdCB0aGlzIHdheS4KPiAK
PiBOb3csIEkgaGF2ZSBhIGJhZCBpZGVhLiBIb3cgYWJvdXQgd2UgaW50cm9kdWNlCj4gYSAiZHlu
YW1pYyB0cmFtcG9saW5lIj8gVGhlIGJhc2ljIGxvZ2ljIG9mIGl0IGNhbiBiZToKPiAKPiAiIiIK
PiBzYXZlIHJlZ3MKPiBicGZzID0gdHJhbXBvbGluZV9sb29rdXBfaXAoaXApCj4gZmVudHJ5ID0g
YnBmcy0+ZmVudHJpZXMKPiB3aGlsZSBmZW50cnk6Cj4gICBmZW50cnkoY3R4KQo+ICAgZmVudHJ5
ID0gZmVudHJ5LT5uZXh0Cj4gCj4gY2FsbCBvcmlnaW4KPiBzYXZlIHJldHVybiB2YWx1ZQo+IAo+
IGZleGl0ID0gYnBmcy0+ZmV4aXRzCj4gd2hpbGUgZmV4aXQ6Cj4gICBmZXhpdChjdHgpCj4gICBm
ZXhpdCA9IGZleGl0LT5uZXh0Cj4gCj4geHh4eHh4Cj4gIiIiCj4gCj4gQW5kIHdlIGxvb2t1cCB0
aGUgImJwZnMiIGJ5IHRoZSBmdW5jdGlvbiBpcCBpbiBhIGhhc2ggbWFwCj4gaW4gdHJhbXBvbGlu
ZV9sb29rdXBfaXAuIFRoZSB0eXBlIG9mICJicGZzIiBpczoKPiAKPiBzdHJ1Y3QgYnBmX2FycmF5
IHsKPiAgIHN0cnVjdCBicGZfcHJvZyAqZmVudHJpZXM7Cj4gIHN0cnVjdCBicGZfcHJvZyAqZmV4
aXRzOwo+ICAgc3RydWN0IGJwZl9wcm9nICptb2RpZnlfcmV0dXJuczsKPiB9Cj4gCj4gV2hlbiB3
ZSBuZWVkIHRvIGF0dGFjaCB0aGUgYnBmIHByb2dBIHRvIGZ1bmN0aW9uIEEvQi9DLAo+IHdlIG9u
bHkgbmVlZCB0byBjcmVhdGUgdGhlIGJwZl9hcnJheUEsIGJwZl9hcnJheUIsIGJwZl9hcnJheUMK
PiBhbmQgYWRkIHRoZSBwcm9nQSB0byB0aGVtLCBhbmQgaW5zZXJ0IHRoZW0gdG8gdGhlIGhhc2gg
bWFwCj4gImRpcmVjdF9jYWxsX2JwZnMiLCBhbmQgYXR0YWNoIHRoZSAiZHluYW1pYyB0cmFtcG9s
aW5lIiB0bwo+IEEvQi9DLiBJZiBicGZfYXJyYXlBIGV4aXN0LCBqdXN0IGFkZCBwcm9nQSB0byB0
aGUgdGFpbCBvZgo+IGJwZl9hcnJheUEtPmZlbnRyaWVzLiBXaGVuIHdlIG5lZWQgdG8gYXR0YWNo
IHByb2dCIHRvCj4gQi9DLCBqdXN0IGFkZCBwcm9nQiB0byBicGZfYXJyYXlCLT5mZW50cmllcyBh
bmQKPiBicGZfYXJyYXlCLT5mZW50cmllcy4KPiAKPiBDb21wYXJlZCB0byB0aGUgdHJhbXBvbGlu
ZSwgZXh0cmEgb3ZlcmhlYWQgaXMgaW50cm9kdWNlZAo+IGJ5IHRoZSBoYXNoIGxvb2t1cGluZy4K
PiAKPiBJIGhhdmUgbm90IGJlZ3VuIHRvIGNvZGUgeWV0LCBhbmQgSSBhbSBub3Qgc3VyZSB0aGUg
b3ZlcmhlYWQgaXMKPiBhY2NlcHRhYmxlLiBDb25zaWRlcmluZyB0aGF0IHdlIGFsc28gbmVlZCB0
byBkbyBoYXNoIGxvb2t1cAo+IGJ5IHRoZSBmdW5jdGlvbiBpbiBrcHJvYmVfbXVsdGksIG1heWJl
IHRoZSBvdmVyaGVhZCBpcwo+IGFjY2VwdGFibGU/CgpTb3VuZHMgbGlrZSB5b3UgYXJlIGp1c3Qg
cmVjcmVhdGluZyB0aGUgZnVuY3Rpb24gbWFuYWdlbWVudCB0aGF0IGZ0cmFjZQpoYXMuIEl0IGFs
c28gY2FuIGFkZCB0aG91c2FuZHMgb2YgdHJhbXBvbGluZXMgdmVyeSBxdWlja2x5LCBiZWNhdXNl
IGl0IGRvZXMKaXQgaW4gYmF0Y2hlcy4gSXQgdGFrZXMgc3BlY2lhbCBzeW5jaHJvbml6YXRpb24g
c3RlcHMgdG8gYXR0YWNoIHRvIGZlbnRyeS4KZnRyYWNlIChhbmQgSSBiZWxpZXZlIG11bHRpLWtw
cm9iZXMpIHVwZGF0ZXMgYWxsIHRoZSBhdHRhY2htZW50cyBmb3IgZWFjaApzdGVwLCBzbyB0aGUg
c3luY2hyb25pemF0aW9uIG5lZWRlZCBpcyBvbmx5IGRvbmUgb25jZS4KCklmIHlvdSByZWFsbHkg
d2FudCB0byBoYXZlIHRob3VzYW5kcyBvZiBmdW5jdGlvbnMsIHdoeSBub3QganVzdCByZWdpc3Rl
ciBpdAp3aXRoIGZ0cmFjZSBpdHNlbGYuIEl0IHdpbGwgZ2l2ZSB5b3UgdGhlIGFyZ3VtZW50cyB2
aWEgdGhlIGZ0cmFjZV9yZWdzCnN0cnVjdHVyZS4gQ2FuJ3QgeW91IGp1c3QgcmVnaXN0ZXIgYSBw
cm9ncmFtIGFzIHRoZSBjYWxsYmFjaz8KCkl0IHdpbGwgcHJvYmFibHkgbWFrZSB5b3VyIGFjY291
bnRpbmcgbXVjaCBlYXNpZXIsIGFuZCBqdXN0IGxldCBmdHJhY2UKaGFuZGxlIHRoZSBmZW50cnkg
bG9naWMuIFRoYXQncyB3aGF0IGl0IHdhcyBtYWRlIHRvIGRvLgoKLS0gU3RldmUKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
