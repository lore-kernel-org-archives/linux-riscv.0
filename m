Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340C7C001DB
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Aug 2023 03:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v/49l5/MvC+fKBjtIW4zeWOPGTr4+gZ89Ndd3dUm+eg=; b=uxGN91Lg+8DLbs
	hPDb7ebxdpYy5eCVAkyQLbygUjx0qW1UfCRAJUaIFqJFTcSDHRXWGbXQlkurMQSck/kPBVwkoQhGk
	5A13dcQzGSwWfixke8bh3yG5alkBYoXkIaDRjUP2EPOnBISFFIfQSeapgXzCdZ3/0dENTeNhAjUv/
	vLi5Rn9HzkNyK8o8K5VkeL4zZNG6BtI0FD7mz+g7q5r7SYR93QOvpnGBzYASTQpqH4vTRF2nZ8JRk
	24Dmss/Fzpi4qLDVZJrzakPUyJ1vLcStU1BPKh8CmxN2HywvOJvvqwvjrRCzEIXDKhdKxLzh131ds
	zkZJ4voMZXpvbFcV3yGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qS7kj-00DcDa-06;
	Sat, 05 Aug 2023 03:14:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qS7kf-00DcCj-2H
	for linux-riscv@lists.infradead.org;
	Sat, 05 Aug 2023 03:14:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691205285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cbOnpetRdksvYmHQrc1VnOUvWL6pFOiaAZEA/zz5j+M=;
	b=T70zeuibdO4ec1aKBTqg0d/JLC4VHLzCuVdJviPUVP7LXflrzod7RF7tCowW72+TR1Gm/6
	fkUtllspWQozxplPwAvD6r/MMaJ5+dGepfmATrYnrGiR19dvTIHE/kH0Ncs1Y20fpZhVLr
	crYjW4Sb2uQzfyC4DoKAjygzqIACDQE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-_hpBfiekOv-J9424KU58gA-1; Fri, 04 Aug 2023 23:14:43 -0400
X-MC-Unique: _hpBfiekOv-J9424KU58gA-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-767564705f5so307920785a.1
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 20:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691205283; x=1691810083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbOnpetRdksvYmHQrc1VnOUvWL6pFOiaAZEA/zz5j+M=;
        b=cR+b4eiLLaqmvLoKE9A7if90KgYQv73dRwSKxIRfsavD40FZoUQo/wcdLGlh60rjHo
         N1G5k/2WyNmF230tPbMk3DFjuxyx2srHfr7FNVB+yzz+WPky3A6YsP8zMSQK4Fb4dRyX
         yE9g+xSMMdH95w8+w25tIDtP/Jl6P+3jvnJWAKmTiTOa3aRri87j/OYhV5ZOugN4cFzQ
         lG/0Oug33ttZRQv6AQDAi0ftWDDpKkp47zrrAmI7wwaIJqEEeKiuCBSPuVOYZnDkAuF1
         A9lZhYh+GALkQITWk3SmPZSjHSrUYN8lHAOy85tLGDf4gEQAnA42Uv0XQYgzOb3aWax5
         wDgA==
X-Gm-Message-State: AOJu0YyiP+oUNeSLj7ifitJhk6Oy4jWrRygXbWRm5+TmgCsOEsBxDe7w
	O6BalrXGRbcaoTv3Wumem1NqHwKtbS0OurJVN4yjaCLkbLcLwzc+XNnPVITQqXUe9TtQUXRLHGs
	u+QB0+tZSOkt88L5SUt/VDlGNlbHvAvvs6PtZpHkD3QK1
X-Received: by 2002:a05:622a:199f:b0:403:b869:9d37 with SMTP id u31-20020a05622a199f00b00403b8699d37mr4911923qtc.0.1691205283332;
        Fri, 04 Aug 2023 20:14:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9hCtZkKsNcH3RInYQsyPY9FuS0uXfJQ8KVHGGSVyrOAym5sd9HYXY78yRP/LQTvr/kqaCKw2GiWRDw7MDG+o=
X-Received: by 2002:a05:622a:199f:b0:403:b869:9d37 with SMTP id
 u31-20020a05622a199f00b00403b8699d37mr4911908qtc.0.1691205283091; Fri, 04 Aug
 2023 20:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230804084900.1135660-2-leobras@redhat.com> <20230804084900.1135660-6-leobras@redhat.com>
 <CAJF2gTTOT3_3K_cWNY9n_DgRoPhYEhBLno=bh57r9D--OavREQ@mail.gmail.com>
In-Reply-To: <CAJF2gTTOT3_3K_cWNY9n_DgRoPhYEhBLno=bh57r9D--OavREQ@mail.gmail.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Sat, 5 Aug 2023 00:14:31 -0300
Message-ID: <CAJ6HWG4gy7HV11-cdoB0VAP2z1Zw-zyJhNRpJ1eDMmrkvnob3w@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/5] riscv/cmpxchg: Implement cmpxchg for variables
 of size 1 and 2
To: Guo Ren <guoren@kernel.org>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_201449_832303_74D7A481 
X-CRM114-Status: GOOD (  24.01  )
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

SGVsbG8gR3VvIFJlbiwgdGhhbmtzIGZvciB0aGUgZmVlZGJhY2shCgpPbiBGcmksIEF1ZyA0LCAy
MDIzIGF0IDI6NDXigK9QTSBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBP
biBGcmksIEF1ZyA0LCAyMDIzIGF0IDQ6NDnigK9BTSBMZW9uYXJkbyBCcmFzIDxsZW9icmFzQHJl
ZGhhdC5jb20+IHdyb3RlOgo+ID4KPiA+IGNtcHhjaGcgZm9yIHZhcmlhYmxlcyBvZiBzaXplIDEt
Ynl0ZSBhbmQgMi1ieXRlcyBpcyBub3QgeWV0IGF2YWlsYWJsZSBmb3IKPiA+IHJpc2N2LCBldmVu
IHRob3VnaCBpdHMgcHJlc2VudCBpbiBvdGhlciBhcmNoaXRlY3R1cmVzIHN1Y2ggYXMgYXJtNjQg
YW5kCj4gPiB4ODYuIFRoaXMgY291bGQgbGVhZCB0byBub3QgYmVpbmcgYWJsZSB0byBpbXBsZW1l
bnQgc29tZSBsb2NraW5nIG1lY2hhbmlzbXMKPiA+IG9yIHJlcXVpcmluZyBzb21lIHJld29yayB0
byBtYWtlIGl0IHdvcmsgcHJvcGVybHkuCj4gPgo+ID4gSW1wbGVtZW50IDEtYnl0ZSBhbmQgMi1i
eXRlcyBjbXB4Y2hnIGluIG9yZGVyIHRvIGFjaGlldmUgcGFyaXR5IHdpdGggb3RoZXIKPiA+IGFy
Y2hpdGVjdHVyZXMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTGVvbmFyZG8gQnJhcyA8bGVvYnJh
c0ByZWRoYXQuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hn
LmggfCAzNSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAzNSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vY21weGNoZy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hnLmgKPiA+
IGluZGV4IDVhMDc2NDZmYWU2NS4uZGZiNDMzYWM1NDRmIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hnLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vY21weGNoZy5oCj4gPiBAQCAtNzIsNiArNzIsMzYgQEAKPiA+ICAgKiBpbmRpY2F0ZWQgYnkg
Y29tcGFyaW5nIFJFVFVSTiB3aXRoIE9MRC4KPiA+ICAgKi8KPiA+Cj4gPiArI2RlZmluZSBfX2Fy
Y2hfY21weGNoZ19tYXNrKHNjX3NmeCwgcHJlcGVuZCwgYXBwZW5kLCByLCBwLCBvLCBuKSAgICAg
ICBcCj4gPiArKHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgIC8qIERlcGVuZHMgb24gMi1ieXRl
IHZhcmlhYmxlcyBiZWluZyAyLWJ5dGUgYWxpZ25lZCAqLyAgICAgICAgICBcCj4gPiArICAgICAg
IHVsb25nIF9fcyA9ICgodWxvbmcpKHApICYgMHgzKSAqIEJJVFNfUEVSX0JZVEU7ICAgICAgICAg
ICAgICAgICBcCj4gPiArICAgICAgIHVsb25nIF9fbWFzayA9IEdFTk1BU0soKChzaXplb2YoKnAp
KSAqIEJJVFNfUEVSX0JZVEUpIC0gMSwgMCkgICBcCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICA8PCBfX3M7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAr
ICAgICAgIHVsb25nIF9fbmV3eCA9ICh1bG9uZykobikgPDwgX19zOyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gPiArICAgICAgIHVsb25nIF9fb2xkeCA9ICh1bG9uZykobykgPDwg
X19zOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgIHVsb25nIF9f
cmV0eDsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gPiArICAgICAgIHJlZ2lzdGVyIHVuc2lnbmVkIGludCBfX3JjOyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgIF9f
YXNtX18gX192b2xhdGlsZV9fICggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gPiArICAgICAgICAgICAgICAgcHJlcGVuZCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgICAgIjA6ICAgICBs
ci53ICUwLCAlMlxuIiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArICAg
ICAgICAgICAgICAgIiAgICAgICBhbmQgICUwLCAlMCwgJXo1XG4iICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gPiArICAgICAgICAgICAgICAgIiAgICAgICBibmUgICUwLCAlejMsIDFm
XG4iICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCgo+IGJ1ZzoKPiAtICAgICAgICAgICAg
ICAgIiAgICAgICBhbmQgICUwLCAlMCwgJXo1XG4iICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gLSAgICAgICAgICAgICAgICIgICAgICAgYm5lICAlMCwgJXozLCAxZlxuIiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAiICAgICAgIGFuZCAgJTEs
ICUwLCAlejVcbiIgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAg
ICAgIiAgICAgICBibmUgICUxLCAlejMsIDFmXG4iICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gWW91ciBjb2RlIGJyZWFrcyB0aGUgJTAuCgpXaGF0IGRvIHlvdSBtZWFuIGJ5IGJyZWFr
cyBoZXJlPwoKSW4gdGhlIGVuZCBvZiB0aGlzIG1hY3JvLCBJIGludGVuZGVkICB0byBoYXZlIF9f
cmV0eCA9ICgqcCAmIF9fbWFzaykKd2hpY2ggbWVhbnMgdGhlIHZhbHVlIGlzIGNsZWFuIHRvIGJl
IHJvdGF0ZWQgYXQgdGhlIGVuZCBvZiB0aGUgbWFjcm8KKG5vIG5lZWQgdG8gYXBwbHkgdGhlIG1h
c2sgYWdhaW4pOiByID0gX19yZXQgPj4gX19zOwoKQWxzbywgSSBhc3N1bWVkIHdlIGFyZSBzdXBw
b3NlZCB0byByZXR1cm4gdGhlIHNhbWUgdmFyaWFibGUgdHlwZQphcyB0aGUgcG9pbnRlciwgc28g
dGhpcyBpcyB2YWxpZDoKdTggYSwgKmIsIGM7CmEgPSB4Y2hnKGIsIGMpOwoKSXMgdGhpcyBjb3Jy
ZWN0PwoKPiA+ICsgICAgICAgICAgICAgICBhcHBlbmQgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgICAiMTpcbiIgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAg
ICAgICAgICAgICA6ICI9JnIiIChfX3JldHgpLCAiPSZyIiAoX19yYyksICIrQSIgKCoocCkpICAg
ICAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgICA6ICJySiIgKChsb25nKV9fb2xkeCksICJy
SiIgKF9fbmV3eCksICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgICAgICJy
SiIgKF9fbWFzayksICJySiIgKH5fX21hc2spICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+
ICsgICAgICAgICAgICAgICA6ICJtZW1vcnkiKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgICAgciA9IChf
X3R5cGVvZl9fKCoocCkpKShfX3JldHggPj4gX19zKTsgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPiA+ICt9KQo+ID4gKwo+ID4KPiA+ICAjZGVmaW5lIF9fYXJjaF9jbXB4Y2hnKGxyX3NmeCwg
c2Nfc2Z4LCBwcmVwZW5kLCBhcHBlbmQsIHIsIHAsIGNvLCBvLCBuKSAgICAgICAgXAo+ID4gICh7
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ID4gQEAgLTk4LDYgKzEyOCwxMSBAQAo+ID4gICAgICAgICBfX3R5cGVv
Zl9fKCoocHRyKSkgX19yZXQ7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAo+ID4gICAgICAgICBzd2l0Y2ggKHNpemVvZigqX19wdHIp
KSB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICBj
YXNlIDE6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+ID4gKyAgICAgICBjYXNlIDI6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgIF9fYXJjaF9j
bXB4Y2hnX21hc2soc2Nfc2Z4LCBwcmVwZW5kLCBhcHBlbmQsICAgICAgICAgICAgXAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fcmV0LCBfX3B0ciwgX19vbGQs
IF9fbmV3KTsgICAgXAo+ID4gKyAgICAgICAgICAgICAgIGJyZWFrOyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gICAgICAgICBjYXNlIDQ6ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
ID4gICAgICAgICAgICAgICAgIF9fYXJjaF9jbXB4Y2hnKCIudyIsICIudyIgc2Nfc2Z4LCBwcmVw
ZW5kLCBhcHBlbmQsICAgICAgXAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBf
X3JldCwgX19wdHIsIChsb25nKSwgX19vbGQsIF9fbmV3KTsgICAgXAo+ID4gLS0KPiA+IDIuNDEu
MAo+ID4KPgo+Cj4gLS0KPiBCZXN0IFJlZ2FyZHMKPiAgR3VvIFJlbgo+CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
