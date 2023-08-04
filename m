Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE54EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 02:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o7poJaosh62OgX5LtvL0wrw7nhyIopU39Sri/kEBWIQ=; b=kYn4ZnR0p0iu8e
	+VDgpu2VlfsoLeXrjTgYtpTMYtU5gkYKLF4oY4pvY/auKN+DOoPfdhmWYdf4ObCTci0ij8d95jCHe
	Z0xWfHRYzfCgUy4tTIU/c+QAdC3lrf1iAA3M2tqRKihjkwgTAsLeJU8iCaywzptn74SZBSm34l1cT
	NX/KB8qqeTZQLVJlt2ofuIo6tqk7VdVXaK4o9LqXUEQ2JjfGwebD4R9iaeS3YxA7VSXamUD/RBVSD
	oeeZqetP0dBp9AkFjV5J79l2HhTdIUwgRVff/EwVyCMAPxBuOwTMfMKdB+GQix5aWP4hp45vVAqgK
	NGsvFPuDZDjwFAB5A9Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRkQE-00BMZr-03;
	Fri, 04 Aug 2023 02:20:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRkQB-00BMZ3-0C
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 02:20:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691115602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k9MPUsS9LKeZA9xUhJn9WI4fyyN2Ecl5BqHSfm/ZQkM=;
	b=cqT40ExWQCQcP40NtJQ3If0caSXVz2HvxquuYMfnoCfyab9W90cxm6eRlrXLyktp0PeHBR
	N0R9UH3YbCTUOYtU6CEbMS3wcIEYojQfjo6qB+4q4+ckCh7gZwl7rHZx4HkD4FTYwgTTRP
	JnaS8X7Arw69g2jbQuah0mWLKlcpno0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-gyJz4CV_O9SfLvhC4xv2Vg-1; Thu, 03 Aug 2023 22:20:01 -0400
X-MC-Unique: gyJz4CV_O9SfLvhC4xv2Vg-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-40539d12372so18400461cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 19:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691115600; x=1691720400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9MPUsS9LKeZA9xUhJn9WI4fyyN2Ecl5BqHSfm/ZQkM=;
        b=gMxUP7mhb8c/wNXo9xpeHpXhKpXqhOhPkSQDyOWrJFUWxd/6prXtUHeYQIxdgcSqRL
         LFQmsr+3pENSYjnbN6ImBKbawuSryspjxMzvv8SdXgQ61DVMzxZNXHNmwcMWSt1ooDAA
         A8s/P29R0jb9DXrQATZRnFaYgqNz3EnSeD/3MGE1yVh3FDMdswvECSmbvyyGGHMQAaRk
         hAfpxjNAEArz9BklRs6b8DmL/4YIyYa5Kgm306uuIrs4MKJAVjb9fn0brqHAqvZNIiUZ
         uuTcdJOOZBLQPkcDOJ3+iUlMYhcIbeQiA29Joj2ijpV2PnP7r9CkkkfqbjuKAZPFDiHE
         LC9g==
X-Gm-Message-State: AOJu0YyOahGQBHfzb9GkFW4FrlEXuzOfZbkkUkppkWHpPwQ4QCkhWyRJ
	ZGnn9OlhQHjd7xMdChpRqTpGkWem1+HXtVwKy5apFUsY6ooL9kvQQV+yNzl0JnkaPkutz74GP10
	oiF702bXIiIRURomuA1yjuk9JM/HIkd7wA+Bfm+fADQdX
X-Received: by 2002:a05:622a:11c1:b0:403:9e72:5e93 with SMTP id n1-20020a05622a11c100b004039e725e93mr691501qtk.9.1691115600721;
        Thu, 03 Aug 2023 19:20:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcGPylXNUCjdMCZunzjgYe6gHUKU7d0KRBYVhys4h+KsxLECchdEAao4TbRZpogi/6HAAcdy2vTjm9XSW2YFY=
X-Received: by 2002:a05:622a:11c1:b0:403:9e72:5e93 with SMTP id
 n1-20020a05622a11c100b004039e725e93mr691479qtk.9.1691115600415; Thu, 03 Aug
 2023 19:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230803051401.710236-2-leobras@redhat.com> <CAJF2gTShfMzVZw5TVqBvLNAzEBMzhWxNGC9JS70euPcKKN85zQ@mail.gmail.com>
In-Reply-To: <CAJF2gTShfMzVZw5TVqBvLNAzEBMzhWxNGC9JS70euPcKKN85zQ@mail.gmail.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 3 Aug 2023 23:19:49 -0300
Message-ID: <CAJ6HWG5mzxN=txnbdi-=c+=wLsDfSe7Me+1DQE79ZX0NN6U1_g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] Deduplicate RISCV cmpxchg.h and atomic.c macros
To: Guo Ren <guoren@kernel.org>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_192007_193554_2D86B549 
X-CRM114-Status: GOOD (  31.01  )
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

T24gVGh1LCBBdWcgMywgMjAyMyBhdCA5OjUz4oCvUE0gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBBdWcgMywgMjAyMyBhdCAxOjE04oCvUE0gTGVvbmFyZG8g
QnJhcyA8bGVvYnJhc0ByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4gPiBJIHVuaWZpZWQgcHJldmlv
dXMgcGF0Y2hzZXRzIGludG8gYSBzaW5nbGUgb25lLCBzaW5jZSB0aGUgd29yayBpcyByZWxhdGVk
Lgo+ID4KPiA+IFdoaWxlIHN0dWR5aW5nIHJpc2N2J3MgY21weGNoZy5oIGZpbGUsIEkgZ290IHJl
YWxseSBpbnRlcmVzdGVkIGluCj4gPiB1bmRlcnN0YW5kaW5nIGhvdyBSSVNDViBhc20gaW1wbGVt
ZW50ZWQgdGhlIGRpZmZlcmVudCB2ZXJzaW9ucyBvZgo+ID4ge2NtcCx9eGNoZy4KPiA+Cj4gPiBX
aGVuIEkgdW5kZXJzdG9vZCB0aGUgcGF0dGVybiwgaXQgbWFkZSBzZW5zZSBmb3IgbWUgdG8gcmVt
b3ZlIHRoZQo+ID4gZHVwbGljYXRpb25zIGFuZCBjcmVhdGUgbWFjcm9zIHRvIG1ha2UgaXQgZWFz
aWVyIHRvIHVuZGVyc3RhbmQgd2hhdCBleGFjdGx5Cj4gPiBjaGFuZ2VzIGJldHdlZW4gdGhlIHZl
cnNpb25zOiBJbnN0cnVjdGlvbiBzdWZpeGVzICYgYmFycmllcnMuCj4gPgo+ID4gQWxzbywgZGlk
IHRoZSBzYW1lIGtpbmQgb2Ygd29yayBvbiBhdG9taWMuYy4KPiA+Cj4gPiBOb3RlIHRvIEd1byBS
ZW46Cj4gPiBJIGRpZCBzb21lIGZ1cnRoZXIgaW1wcm92ZW1lbnQgYWZ0ZXIgeW91ciBwcmV2aW91
cyByZXZpZXdzLCBzbyBJIGVuZGVkCj4gPiB1cCBhZnJhaWQgaW5jbHVkaW5nIHlvdXIgUmV2aWV3
ZWQtYnkgYmVmb3JlIGNoZWNoaW5nIGlmIHRoZSBjaGFuZ2VzIGFyZQo+ID4gb2sgZm9yIHlvdS4g
UGxlYXNlIGNoZWNrIGl0IG91dCBhZ2FpbiwgSSBqdXN0IHJlbW92ZWQgc29tZSBoZWxwZXIgbWFj
cm9zCj4gPiB0aGF0IHdlcmUgbm90IGJlaW5nIHVzZWQgZWxzZXdoZXJlIGluIHRoZSBrZXJuZWwu
Cj4gSSBmb3VuZCB0aGlzIG9wdGltaXphdGlvbiBoYXMgY29uZmxpY3RzIHdpdGggdGhlIGJlbG93
IHBhdGNoZXM6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzA4MDIx
NjQ3MDEuMTkyNzkxLTE1LWd1b3JlbkBrZXJuZWwub3JnLwo+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXJpc2N2LzIwMjMwODAyMTY0NzAxLjE5Mjc5MS01LWd1b3JlbkBrZXJuZWwub3Jn
Lwo+Cj4gSWYgeW91cnMgbWVyZ2VkLCBob3cgZG8gd2Ugc3VwcG9ydCB0aGUgaW5saW5lIGNtcHhj
aGcveGNoZ19zbWFsbAo+IGZ1bmN0aW9uPwoKT2gsIEkgYWN0dWFsbHkgaW50cm9kdWNlZCBteSBz
ZXJpZXMgc28gSSBjb3VsZCBpbnRyb2R1Y2UgbmV3IHhjaGcgYW5kCmNtcHhjaGcgZm9yIHNpemUg
MSBhbmQgMi4gSXMgdGhhdCB3aGF0IHlvdXIgcGF0Y2hlcyBhcmUgYWJvdXQsIHJpZ2h0PwoKSSB3
YXMgd29ya2luZyBvbiB0aGF0IHllc3RlcmRheSwgYW5kIGRlY2lkZWQgdG8gc2VuZCB0aGUgcGF0
Y2hzZXQKd2l0aG91dCB0aGVtIGJlY2F1c2UgSSB3YXMgc3RpbGwgbm90IHN1cmUgZW5vdWdoLgoK
QWJvdXQgaW1wbGVtZW50YXRpb24gc3RyYXRlZ3ksIEkgd2FzIGludHJvZHVjaW5nIGEgbmV3IG1h
Y3JvcyBmb3IgeGNoZwomIGNtcHhjaGcgd2l0aCBhc20gd2hpY2ggd291bGQgd29yayBmb3IgYm90
aCBmb3Igc2l6ZSAxICYgc2l6ZSAyLCBhbmQKdXNlIHRoZSBzd2l0Y2gtY2FzZSB0byBjcmVhdGUg
dGhlIG1hc2sgYW5kIGFuZF92YWx1ZS4KCllvdSB0aGluayB0aGF0IHdvcmtzIGVub3VnaD8KCj4g
SXQncyB2ZXJ5IHN0cnVnZ2xpbmcgdG8gdXNlIG1hY3JvcyB0byBpbXBsZW1lbnQgY29tcGxleAo+
IGZ1bmN0aW9ucy4KCkkgYWdyZWUsIGJ1dCB3aXRoIHRoaXMgd2UgY2FuIGFjaGlldmUgbW9yZSBn
ZW5lcmljIGNvZGUsIHdoaWNoIG1ha2VzCm1vcmUgY2xlYXIgd2hhdCBpcyB0aGUgcGF0dGVybiBm
b3IgZ2l2ZW4gZnVuY3Rpb24uCgo+IENvdWxkIHlvdSBjb25zaWRlciBhIG1vcmUgcmVsYXhlZCBv
cHRpbWl6YXRpb24gaW4gd2hpY2ggd2UgY291bGQKPiBpbnNlcnQgaW5saW5lIGNtcHhjaGcveGNo
Z19zbWFsbD8KCldoYXQgYWJvdXQgdGhpczogSSBmaW5pc2ggdGhlIHBhdGNoZXMgSSBoYXZlIGJl
ZW4gd29ya2luZyB3aXRoCihjbXB4Y2hnICYgeGNoZyBmb3Igc2l6ZXMgMSBhbmQgMiksIGFuZCBp
ZiB0aGV5IGFyZSBmaW5lIHdlIGV4cGFuZAp0aGlzIHBhdGNoc2V0IHdpdGggdGhlbS4gIElmIG5v
dCwgSSB0cnkgcmVsYXhpbmcgdGhlbSBhIGxpdHRsZSBzbyB3ZQpjYW4gbWVyZ2Ugd2l0aCB5b3Vy
IHNldC4KCkRvZXMgdGhhdCB3b3JrIGZvciB5b3U/CgpCZXN0IHJlZ2FyZHMsCkxlbwoKCj4KPiA+
Cj4gPiBUaGFua3MhCj4gPiBMZW8KPiA+Cj4gPgo+ID4gQ2hhbmdlcyBzaW5jZSBzcXVhc2hlZCBj
bXB4Y2hnOgo+ID4gLSBVbmlmaWVkIHdpdGggYXRvbWljLmMgcGF0Y2hzZXQKPiA+IC0gUmViYXNl
ZCBvbiB0b3Agb2YgdG9ydmFsZHMvbWFzdGVyICh0aGFua3MgQW5kcmVhIFBhcnJpISkKPiA+IC0g
UmVtb3ZlZCBoZWxwZXIgbWFjcm9zIHRoYXQgd2VyZSBub3QgYmVpbmcgdXNlZCBlbHNld2hlcmUg
aW4gdGhlIGtlcm5lbC4KPiA+Cj4gPiBDaGFuZ2VzIHNpbmNlIChjbXB4Y2hnKSBSRkN2MzoKPiA+
IC0gU3F1YXNoZWQgdGhlIDYgb3JpZ2luYWwgcGF0Y2hlcyBpbiAyOiBvbmUgZm9yIGNtcHhjaGcg
YW5kIG9uZSBmb3IgeGNoZwo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwNDA0
MTYzNzQxLjI3NjIxNjUtMS1sZW9icmFzQHJlZGhhdC5jb20vCj4gPgo+ID4gQ2hhbmdlcyBzaW5j
ZSAoY21weGNoZykgUkZDdjI6Cj4gPiAtIEZpeGVkICBtYWNyb3MgdGhhdCBkZXBlbmQgb24gaGF2
aW5nIGEgbG9jYWwgdmFyaWFibGUgd2l0aCBhIG1hZ2ljIG5hbWUKPiA+IC0gUHJldmlvdXMgY2Fz
dCB0byAobG9uZykgaXMgbm93IG9ubHkgYXBwbGllZCBvbiA0LWJ5dGVzIGNtcHhjaGcKPiA+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDMyMTA3NDI0OS4yMjIxNjc0LTEtbGVvYnJh
c0ByZWRoYXQuY29tLwo+ID4KPiA+IENoYW5nZXMgc2luY2UgKGNtcHhjaGcpIFJGQ3YxOgo+ID4g
LSBGaXhlZCBwYXRjaCA0LzYgc3VmZml4IGZyb20gJ3cuYXFybCcgdG8gJy53LmFxcmwnLCB0byBh
dm9pZCBidWlsZCBlcnJvcgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwMzE4
MDgwMDU5LjExMDkyODYtMS1sZW9icmFzQHJlZGhhdC5jb20vCj4gPgo+ID4KPiA+IExlb25hcmRv
IEJyYXMgKDMpOgo+ID4gICByaXNjdi9jbXB4Y2hnOiBEZWR1cGxpY2F0ZSB4Y2hnKCkgYXNtIGZ1
bmN0aW9ucwo+ID4gICByaXNjdi9jbXB4Y2hnOiBEZWR1cGxpY2F0ZSBjbXB4Y2hnKCkgYXNtIGFu
ZCBtYWNyb3MKPiA+ICAgcmlzY3YvYXRvbWljLmggOiBEZWR1cGxpY2F0ZSBhcmNoX2F0b21pYy4q
Cj4gPgo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXRvbWljLmggIHwgMTY0ICsrKysrKysr
LS0tLS0tLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NtcHhjaGcuaCB8IDMxOCArKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMjMgaW5z
ZXJ0aW9ucygrKSwgMzU5IGRlbGV0aW9ucygtKQo+ID4KPiA+IC0tCj4gPiAyLjQxLjAKPiA+Cj4K
Pgo+IC0tCj4gQmVzdCBSZWdhcmRzCj4gIEd1byBSZW4KPgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
