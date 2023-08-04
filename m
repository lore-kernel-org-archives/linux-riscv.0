Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A80C001DF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 17:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QoJ4jkcA1ymD42Zl7XNuyv7CPdxo3TAdbqzNsl+zDWQ=; b=g0d8eQgzvg4jg3
	bjLLPp2N8UdFGA3udCiakPxxJ//WUhLQVqWzms4mxeDPVYbWzO0VE707LHoMvgQfTo3wO859BqfK6
	xS2F8SCtdRbifSEQrQb924FV4V9n5kwVwmEqfJ1kITf3UUUIveQejS44nN1hB1/rG4lxH26hnY7vs
	C5mca3yVwFWXUS0iQgkM1HdwTbDX+PNjHF68DgfE0pXJYBvnV/mmrFnma0pkAs1gPEzN6cjf0runY
	uhynFO3qiyCWAULZSvlPmsvMzyiPMno86lpkq3OwstRktqxDhPzjvT2OtlbbLww+h0GnL8SghuINm
	el+U+n0I7fbckcVGLxmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRyrh-00Cva6-39;
	Fri, 04 Aug 2023 17:45:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRyre-00CvZX-25
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 17:45:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 265B6620E0
	for <linux-riscv@lists.infradead.org>; Fri,  4 Aug 2023 17:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0845FC4339A
	for <linux-riscv@lists.infradead.org>; Fri,  4 Aug 2023 17:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691171125;
	bh=SKdiKrmN6Sz1OpEH5WWRpir+7XEJOPyBzfO1EenofaM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FH9+qh3qUSwsR2W/jZAsOwh0YKKXZXN9XCDrRCBDgWGOPD3Cy6SrmqadxqO0IBJ6G
	 uyIxoHPpK9V4TD7QUAvyJYpFO42bmbgXrvgXOB7xg5Mv49iD4XKxJ2i7hllqP3+eR8
	 ZBi/ARJx2KHtc3O2ARcJtufb/PD9doO12L6j5mDfkhpQQ8rsE4X8YCzqHcOpomTSRV
	 hPo5ktegLThAJxFVYZwhJyJ2udh5BVJSEeFqHFzACvQKbMQDQ0bE4O3AI60E9/oco8
	 EPhB59Egvq8e7wLAHlbFIiktGV38IdiXsp0oAF6F9akq0+SuxaKa59AufuAOkLh42b
	 5VcYGIkM2lekA==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-51bece5d935so3026193a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 10:45:24 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz7ZmnFrxcoVoRnvp+rdD5N0UMRJdqauK1WrHXRuycuiZenEIuu
	tRS1sV9V+GOsDBkfpghXv6vypv1YU/eVwAGLbl0=
X-Google-Smtp-Source: AGHT+IH+SIdKRya90YSfxgWiDDPb9HOv3hMCFwPS0M+dlzO2VBsw5mk01hdh3i47Uyuzz4oeEBG88U4ZxuEPJrNlePk=
X-Received: by 2002:aa7:d690:0:b0:522:4f6d:c443 with SMTP id
 d16-20020aa7d690000000b005224f6dc443mr2343632edr.23.1691171123123; Fri, 04
 Aug 2023 10:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230804084900.1135660-2-leobras@redhat.com> <20230804084900.1135660-6-leobras@redhat.com>
In-Reply-To: <20230804084900.1135660-6-leobras@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 4 Aug 2023 13:45:11 -0400
X-Gmail-Original-Message-ID: <CAJF2gTTOT3_3K_cWNY9n_DgRoPhYEhBLno=bh57r9D--OavREQ@mail.gmail.com>
Message-ID: <CAJF2gTTOT3_3K_cWNY9n_DgRoPhYEhBLno=bh57r9D--OavREQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/5] riscv/cmpxchg: Implement cmpxchg for variables
 of size 1 and 2
To: Leonardo Bras <leobras@redhat.com>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_104526_768380_588C05FA 
X-CRM114-Status: GOOD (  20.46  )
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

T24gRnJpLCBBdWcgNCwgMjAyMyBhdCA0OjQ54oCvQU0gTGVvbmFyZG8gQnJhcyA8bGVvYnJhc0By
ZWRoYXQuY29tPiB3cm90ZToKPgo+IGNtcHhjaGcgZm9yIHZhcmlhYmxlcyBvZiBzaXplIDEtYnl0
ZSBhbmQgMi1ieXRlcyBpcyBub3QgeWV0IGF2YWlsYWJsZSBmb3IKPiByaXNjdiwgZXZlbiB0aG91
Z2ggaXRzIHByZXNlbnQgaW4gb3RoZXIgYXJjaGl0ZWN0dXJlcyBzdWNoIGFzIGFybTY0IGFuZAo+
IHg4Ni4gVGhpcyBjb3VsZCBsZWFkIHRvIG5vdCBiZWluZyBhYmxlIHRvIGltcGxlbWVudCBzb21l
IGxvY2tpbmcgbWVjaGFuaXNtcwo+IG9yIHJlcXVpcmluZyBzb21lIHJld29yayB0byBtYWtlIGl0
IHdvcmsgcHJvcGVybHkuCj4KPiBJbXBsZW1lbnQgMS1ieXRlIGFuZCAyLWJ5dGVzIGNtcHhjaGcg
aW4gb3JkZXIgdG8gYWNoaWV2ZSBwYXJpdHkgd2l0aCBvdGhlcgo+IGFyY2hpdGVjdHVyZXMuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBMZW9uYXJkbyBCcmFzIDxsZW9icmFzQHJlZGhhdC5jb20+Cj4gLS0t
Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oIHwgMzUgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykKPgo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NtcHhjaGcuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vY21weGNoZy5oCj4gaW5kZXggNWEwNzY0NmZhZTY1Li5kZmI0MzNhYzU0
NGYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hnLmgKPiArKysg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NtcHhjaGcuaAo+IEBAIC03Miw2ICs3MiwzNiBAQAo+
ICAgKiBpbmRpY2F0ZWQgYnkgY29tcGFyaW5nIFJFVFVSTiB3aXRoIE9MRC4KPiAgICovCj4KPiAr
I2RlZmluZSBfX2FyY2hfY21weGNoZ19tYXNrKHNjX3NmeCwgcHJlcGVuZCwgYXBwZW5kLCByLCBw
LCBvLCBuKSAgICAgICBcCj4gKyh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgLyogRGVwZW5kcyBv
biAyLWJ5dGUgdmFyaWFibGVzIGJlaW5nIDItYnl0ZSBhbGlnbmVkICovICAgICAgICAgIFwKPiAr
ICAgICAgIHVsb25nIF9fcyA9ICgodWxvbmcpKHApICYgMHgzKSAqIEJJVFNfUEVSX0JZVEU7ICAg
ICAgICAgICAgICAgICBcCj4gKyAgICAgICB1bG9uZyBfX21hc2sgPSBHRU5NQVNLKCgoc2l6ZW9m
KCpwKSkgKiBCSVRTX1BFUl9CWVRFKSAtIDEsIDApICAgXAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIDw8IF9fczsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAr
ICAgICAgIHVsb25nIF9fbmV3eCA9ICh1bG9uZykobikgPDwgX19zOyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gKyAgICAgICB1bG9uZyBfX29sZHggPSAodWxvbmcpKG8pIDw8IF9f
czsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgdWxvbmcgX19yZXR4
OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAr
ICAgICAgIHJlZ2lzdGVyIHVuc2lnbmVkIGludCBfX3JjOyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgX19hc21fXyBfX3Zv
bGF0aWxlX18gKCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAr
ICAgICAgICAgICAgICAgcHJlcGVuZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICIwOiAgICAgbHIudyAlMCwgJTJcbiIg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAiICAg
ICAgIGFuZCAgJTAsICUwLCAlejVcbiIgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAr
ICAgICAgICAgICAgICAgIiAgICAgICBibmUgICUwLCAlejMsIDFmXG4iICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCmJ1ZzoKLSAgICAgICAgICAgICAgICIgICAgICAgYW5kICAlMCwgJTAs
ICV6NVxuIiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotICAgICAgICAgICAgICAgIiAg
ICAgICBibmUgICUwLCAlejMsIDFmXG4iICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisg
ICAgICAgICAgICAgICAiICAgICAgIGFuZCAgJTEsICUwLCAlejVcbiIgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKKyAgICAgICAgICAgICAgICIgICAgICAgYm5lICAlMSwgJXozLCAxZlxu
IiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXApZb3VyIGNvZGUgYnJlYWtzIHRoZSAlMC4K
CgoKPiArICAgICAgICAgICAgICAgIiAgICAgICBhbmQgICUxLCAlMCwgJXo2XG4iICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICIgICAgICAgb3IgICAlMSwg
JTEsICV6NFxuIiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAg
ICAiICAgICAgIHNjLnciIHNjX3NmeCAiICUxLCAlMSwgJTJcbiIgICAgICAgICAgICAgICAgICAg
IFwKPiArICAgICAgICAgICAgICAgIiAgICAgICBibmV6ICUxLCAwYlxuIiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgIGFwcGVuZCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAg
ICAiMTpcbiIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPiArICAgICAgICAgICAgICAgOiAiPSZyIiAoX19yZXR4KSwgIj0mciIgKF9fcmMpLCAiK0Ei
ICgqKHApKSAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgIDogInJKIiAoKGxvbmcpX19v
bGR4KSwgInJKIiAoX19uZXd4KSwgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAg
ICAgICJySiIgKF9fbWFzayksICJySiIgKH5fX21hc2spICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPiArICAgICAgICAgICAgICAgOiAibWVtb3J5Iik7ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgciA9IChf
X3R5cGVvZl9fKCoocCkpKShfX3JldHggPj4gX19zKTsgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPiArfSkKPiArCj4KPiAgI2RlZmluZSBfX2FyY2hfY21weGNoZyhscl9zZngsIHNjX3NmeCwg
cHJlcGVuZCwgYXBwZW5kLCByLCBwLCBjbywgbywgbikgICAgICAgIFwKPiAgKHsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gQEAgLTk4LDYgKzEyOCwxMSBAQAo+ICAgICAgICAgX190eXBlb2ZfXygqKHB0cikpIF9f
cmV0OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gICAgICAgICBzd2l0Y2ggKHNpemVvZigqX19wdHIpKSB7ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgY2FzZSAxOiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgIGNh
c2UgMjogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gKyAgICAgICAgICAgICAgIF9fYXJjaF9jbXB4Y2hnX21hc2soc2Nfc2Z4LCBwcmVw
ZW5kLCBhcHBlbmQsICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBfX3JldCwgX19wdHIsIF9fb2xkLCBfX25ldyk7ICAgIFwKPiArICAgICAgICAg
ICAgICAgYnJlYWs7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gICAgICAgICBjYXNlIDQ6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgICAgICAgICBfX2FyY2hfY21weGNo
ZygiLnciLCAiLnciIHNjX3NmeCwgcHJlcGVuZCwgYXBwZW5kLCAgICAgIFwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF9fcmV0LCBfX3B0ciwgKGxvbmcpLCBfX29sZCwgX19uZXcp
OyAgICBcCj4gLS0KPiAyLjQxLjAKPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
