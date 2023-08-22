Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C233CEE4996
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 07:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8HHUXtbi9AlnIgqCj47wYNJJLu2tUD+RVHm/TAI1hlQ=; b=lUM6vF3Qtx5v7v
	YQYbrzPRBZSfwnaTP49n1JbdP848EKN8DMO2jQOfiJG8R2xebGi5lT9m4oKTETy58ltW8B/kBu8h0
	xzRm16o+uFMG3BKA9hbumsAKTSlTo5q06+pcanM6+F7RnnJg+HZjd00FE+sVxNwuWSZn4iWoCQBz9
	58NpO4VqIxYb3EU6YIhfry0/aaitak8ElGbpasJMqpkBcBxAO7pgm/62TL/SwIz7E/wFJzeG5OpLH
	c40Cbk4Xb1GofrtU657MOqA++RJnGoYRhszwQqLFz60yM26wNkakILD4p0Mzfpt6uEHMQ+jYTkznp
	+hOGJpftEkOdtWrpNAsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYMHj-00FPgl-1G;
	Tue, 22 Aug 2023 07:58:43 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYMHg-00FPeS-2P
	for linux-riscv@lists.infradead.org;
	Tue, 22 Aug 2023 07:58:42 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-64a5bc53646so25688766d6.2
        for <linux-riscv@lists.infradead.org>; Tue, 22 Aug 2023 00:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1692691116; x=1693295916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GL3ymXypfna7VinvoKpEJH49GBKBaM67PwD6qVC/FgQ=;
        b=JPWHkWbP+9fHaq/xc4HWoD9mGWZZ9T8n68daoGrAdQ9+JnF5265pOENKbPEwJER+Dh
         sqLgvXLG2X0RonTxatrqgCY3UUiq96He9K007po09gz47fFVy0qGLL268aMfhVI+Sj33
         gTqO3bAxmQRpeMXExhRdShCmr+TSZnTKJ5XJXbnn/JjXxyAGJ1x0cLGyioYk/RTwsrAE
         epaa8GHeMGQoPqsfleaRZyjVQ7rgpM0MIA1msw6l7rCJC3by3Y18Ml8l4yD8MY3ma4wy
         /xhUU8I4U8bKgltSy0dQAfgGIveg4SFZVcSGxvJHB21EIjkYVV+0HyF6JMLYV/JkZ+m3
         Xvsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692691116; x=1693295916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GL3ymXypfna7VinvoKpEJH49GBKBaM67PwD6qVC/FgQ=;
        b=F9+39fNdny3OGj17Ld5nQIGFBXetVOeycfoNyw/kW0XCuznJS0YXcRYw4dz942XvIU
         7zwf32fOhI0UL6V8ChYFDj90zEjkpcHesVqTCY83vuX7lftr746o/cXBWsrrlk9jpWfb
         NpBx1QFS3sRGzjFjx21B9Fgc9hJGTsSXOQBLCMtsOHz6SibanL4IX6QwlwkTtbDqzS7I
         EWLJ1UZPj2z8THnh7ARVtITd7fu8S6EMsIATnEEIP34W54paZErNKLOIBEiqLpiSQRAN
         8904NwvabMzmPJncwPoU1Fny/VaRFHvkx7q+AIQT+lYDamVFgbdXq5i0DOfoKL2AeJ1o
         OGiQ==
X-Gm-Message-State: AOJu0YyxuZykbhAmTY4FAYdBrqfY/+cwBjKaQ4Fe0YdO96OjsQ7Mo/a8
	9QA0xpKES4YD1TF5uQAJoD3T4QDsWj4ZIr7xRsfaqw==
X-Google-Smtp-Source: AGHT+IGuCzvIWbQvx8c4ZfhZoo9XqXh28bNelyavdxSBwB/dMQXRZxee3pJnDV2zP+o9Y5p18yqjuC1YXagm7a3PSoc=
X-Received: by 2002:a0c:f311:0:b0:649:bf3:6dca with SMTP id
 j17-20020a0cf311000000b006490bf36dcamr11149176qvl.62.1692691116099; Tue, 22
 Aug 2023 00:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230822054739.33552-1-nick.hu@sifive.com> <CAAhSdy32DYoHpBKS3TF1SapM5fuMF5K00oqRxw8JF05v=DrUuw@mail.gmail.com>
In-Reply-To: <CAAhSdy32DYoHpBKS3TF1SapM5fuMF5K00oqRxw8JF05v=DrUuw@mail.gmail.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Tue, 22 Aug 2023 15:58:24 +0800
Message-ID: <CAKddAkDohdZqhjZKSawTg5NLMs0AXkL9SyYQr1q6vM1vm4Csfw@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: suspend: Add syscore ops for suspend
To: Anup Patel <anup@brainfault.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com, 
	conor.dooley@microchip.com, jeeheng.sia@starfivetech.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zong.li@sifive.com, Andy Chiu <andy.chiu@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_005840_843423_5F7E408B 
X-CRM114-Status: GOOD (  25.08  )
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

SGkgQW51cAoKCk9uIFR1ZSwgQXVnIDIyLCAyMDIzIGF0IDI6MTbigK9QTSBBbnVwIFBhdGVsIDxh
bnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXVnIDIyLCAyMDIzIGF0IDEx
OjE34oCvQU0gTmljayBIdSA8bmljay5odUBzaWZpdmUuY29tPiB3cm90ZToKPiA+Cj4gPiBJZiBh
IHRhc2sgaXMgdGhlIG9uZSB3aG8gcGVyZm9ybXMgdGhlIHN1c3BlbmQgZmxvdyBhbmQgaXQgYWxz
byBkbyBzb21lCj4gPiBmbG9hdGluZyBvciB2ZWN0b3Igb3BlcmF0aW9ucyBiZWZvcmUgdGhlIHN1
c3BlbmQsIHdlIG1pZ2h0IGxvc2UgdGhlIEZQVQo+ID4gYW5kIHZlY3RvciBzdGF0ZXMgd2hlbiBp
dCBnb2VzIHRvIHRoZSBub24tcmV0ZW50aW9uIHN5c3RlbSBzdXNwZW5kIHN0YXRlLgo+ID4gQWRk
IHN5c2NvcmUgb3BzIHRvIHNhdmUgYW5kIHJlc3RvcmUgdGhlIEZQVSBhbmQgdmVjdG9yIHN0YXRl
cyBvZiB0aGUKPiA+IGN1cnJlbnQgdGFzayB0byBmaXggdGhlIGlzc3VlIGFib3ZlLgo+Cj4gVGhp
cyBvbmx5IGFwcGxpZXMgdG8gbm9uLXJldGVudGl2ZSBzeXN0ZW0gc3VzcGVuZCBzbyB3aHkgZG8g
d2UgbmVlZAo+IHRoaXMgYmVmb3JlIFNCSSBzeXN0ZW0gc3VzcGVuZCBpcyBtZXJnZWQgPwo+Cj4g
UmVnYXJkcywKPiBBbnVwCj4KPgpIb3cgYWJvdXQgaGliZXJuYXRpb24/CgpSZWdhcmRzLApOaWNr
Cj4gPgo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29t
Pgo+ID4gU2lnbmVkLW9mZi1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KPiA+
IFNpZ25lZC1vZmYtYnk6IE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4KPiA+IC0tLQo+ID4g
Q2hhbmdlcyBpbiB2MjoKPiA+IGEpIEFkZCBDby1kZXZlbG9wZWQtYnkgYW5kIGFkanVzdCB0aGUg
b3JkZXIgb2Ygc2lnbmVkLW9mZgo+ID4gYikgUmVwaHJhc2UgdGhlIGNvbW1pdCBtZXNzYWdlCj4g
Pgo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3N1c3BlbmQuYyB8IDQ1ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygr
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zdXNwZW5kLmMgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9zdXNwZW5kLmMKPiA+IGluZGV4IDNjODliOGVjNjljNC4uZmY2OWZmOGEx
OTc0IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3VzcGVuZC5jCj4gPiArKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9zdXNwZW5kLmMKPiA+IEBAIC00LDkgKzQsMTQgQEAKPiA+ICAg
KiBDb3B5cmlnaHQgKGMpIDIwMjIgVmVudGFuYSBNaWNybyBTeXN0ZW1zIEluYy4KPiA+ICAgKi8K
PiA+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2NwdV9wbS5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9m
dHJhY2UuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvdGhyZWFkX2luZm8uaD4KPiA+ICsjaW5jbHVk
ZSA8bGludXgvc3lzY29yZV9vcHMuaD4KPiA+ICAjaW5jbHVkZSA8YXNtL2Nzci5oPgo+ID4gICNp
bmNsdWRlIDxhc20vc3VzcGVuZC5oPgo+ID4gKyNpbmNsdWRlIDxhc20vc3dpdGNoX3RvLmg+Cj4g
PiArI2luY2x1ZGUgPGFzbS92ZWN0b3IuaD4KPiA+Cj4gPiAgdm9pZCBzdXNwZW5kX3NhdmVfY3Ny
cyhzdHJ1Y3Qgc3VzcGVuZF9jb250ZXh0ICpjb250ZXh0KQo+ID4gIHsKPiA+IEBAIC04NSwzICs5
MCw0MyBAQCBpbnQgY3B1X3N1c3BlbmQodW5zaWduZWQgbG9uZyBhcmcsCj4gPgo+ID4gICAgICAg
ICByZXR1cm4gcmM7Cj4gPiAgfQo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgcmlzY3ZfY3B1X3N1c3Bl
bmQodm9pZCkKPiA+ICt7Cj4gPiArICAgICAgIHN0cnVjdCB0YXNrX3N0cnVjdCAqY3VyX3Rhc2sg
PSBnZXRfY3VycmVudCgpOwo+ID4gKyAgICAgICBzdHJ1Y3QgcHRfcmVncyAqcmVncyA9IHRhc2tf
cHRfcmVncyhjdXJfdGFzayk7Cj4gPiArCj4gPiArICAgICAgIGlmIChoYXNfZnB1KCkpIHsKPiA+
ICsgICAgICAgICAgICAgICBpZiAodW5saWtlbHkocmVncy0+c3RhdHVzICYgU1JfU0QpKQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgZnN0YXRlX3NhdmUoY3VyX3Rhc2ssIHJlZ3MpOwo+ID4g
KyAgICAgICB9Cj4gPiArICAgICAgIGlmIChoYXNfdmVjdG9yKCkpIHsKPiA+ICsgICAgICAgICAg
ICAgICBpZiAodW5saWtlbHkocmVncy0+c3RhdHVzICYgU1JfU0QpKQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgcmlzY3Zfdl92c3RhdGVfc2F2ZShjdXJfdGFzaywgcmVncyk7Cj4gPiArICAg
ICAgIH0KPiA+ICsKPiA+ICsgICAgICAgcmV0dXJuIDA7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRp
YyB2b2lkIHJpc2N2X2NwdV9yZXN1bWUodm9pZCkKPiA+ICt7Cj4gPiArICAgICAgIHN0cnVjdCB0
YXNrX3N0cnVjdCAqY3VyX3Rhc2sgPSBnZXRfY3VycmVudCgpOwo+ID4gKyAgICAgICBzdHJ1Y3Qg
cHRfcmVncyAqcmVncyA9IHRhc2tfcHRfcmVncyhjdXJfdGFzayk7Cj4gPiArCj4gPiArICAgICAg
IGlmIChoYXNfZnB1KCkpCj4gPiArICAgICAgICAgICAgICAgZnN0YXRlX3Jlc3RvcmUoY3VyX3Rh
c2ssIHJlZ3MpOwo+ID4gKyAgICAgICBpZiAoaGFzX3ZlY3RvcigpKQo+ID4gKyAgICAgICAgICAg
ICAgIHJpc2N2X3ZfdnN0YXRlX3Jlc3RvcmUoY3VyX3Rhc2ssIHJlZ3MpOwo+ID4gK30KPiA+ICsK
PiA+ICtzdGF0aWMgc3RydWN0IHN5c2NvcmVfb3BzIHJpc2N2X2NwdV9zeXNjb3JlX29wcyA9IHsK
PiA+ICsgICAgICAgLnN1c3BlbmQgICAgICAgID0gcmlzY3ZfY3B1X3N1c3BlbmQsCj4gPiArICAg
ICAgIC5yZXN1bWUgICAgICAgICA9IHJpc2N2X2NwdV9yZXN1bWUsCj4gPiArfTsKPiA+ICsKPiA+
ICtzdGF0aWMgaW50IF9faW5pdCByaXNjdl9jcHVfc3VzcGVuZF9pbml0KHZvaWQpCj4gPiArewo+
ID4gKyAgICAgICByZWdpc3Rlcl9zeXNjb3JlX29wcygmcmlzY3ZfY3B1X3N5c2NvcmVfb3BzKTsK
PiA+ICsgICAgICAgcmV0dXJuIDA7Cj4gPiArfQo+ID4gK2FyY2hfaW5pdGNhbGwocmlzY3ZfY3B1
X3N1c3BlbmRfaW5pdCk7Cj4gPiAtLQo+ID4gMi4zNC4xCj4gPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
