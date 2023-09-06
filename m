Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0081EB8FB6
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 12:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aKfBuwuyR616HGS9fo25BqZJ+xKRm63AKKvcAfH/DWk=; b=e4jx8Lmgi5+nzv
	OnAFo2tRKvVA5q+7/42/eA2GOJCFlQeb5Zl8OaE2NFEzwCbThGR5lZRMgSa0mHliUvHe9+497lf6i
	WcvPnBWIAZpDwbmcYDDXOnuL7s98j72wy0cRuawV28tk5ljbmG1ZxGMS/Qxcc+2MvjLwv6ySJ0ZG9
	TYIzuhZqC3CRoHhDTIZUNCKvw57FYlmtcZgMQCEf8stFolDR0z8/HUXsBY8tJJKhs5f/UFLIoJXmh
	q/eQTyDcU9ZcMQU4sPFLSsRx74w88i3uJlKIIBABTZmhdeWhKI3umVCcdyx1JPz6irliHMT8JHWJt
	EKThikz70bP1FWgzPM6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdrEJ-0097hR-1Z;
	Wed, 06 Sep 2023 12:01:55 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdrEF-0097cy-2k
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 12:01:54 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-31977ace1c8so3175063f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Sep 2023 05:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694001709; x=1694606509; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sp8EZRgwEyyTmPheARIzvhEwRO9ZLG7z8fbcdxO2Tiw=;
        b=ybdRTLxm5iwu1j+1ofLNtCyddjVwpYAcOJZesiCExiT6+0RGqZATN00BA/Mc/RcZgv
         pq52YqkHzsFci61Dm/xYLxBwaTi4S34kLs+//uohTcJc+dFU6iHs0he3MyOBEN4A9MZc
         BVJLJUdggs3qP92/QBE+DnHafAB+eFd7qWA35GWRACiyBuG0HcNHM2KIHEhZs92KLbwK
         ZoIKtkZtrQUEgBYPV8MM9MEjPTGnM/1RoVLdtVk4zOJYzEx67C4d1adlfTQdiyoRl6lr
         cexDslDvkq7Rm6QkDv83l5mhq+Hh0xjyjXfB/uWl6FdiJbnhzS3Z8tvUs6BwlR6lATKY
         k3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694001709; x=1694606509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sp8EZRgwEyyTmPheARIzvhEwRO9ZLG7z8fbcdxO2Tiw=;
        b=aJD8irkHBvNLvTwqH0EtGqJC1NEU3FR645m+9sx9JxvXEBO7epvyjb/HdFK8tPpBo5
         xERLlor20IOmRgflaMNodv9wvfqgk5hlu2DRDy++4MASYKU+It+LhCbGoa5+PiXcmzvm
         wT2uF5BtyOPua1vBoU5eCKfivWSr+jlpbAZRcpCtoL4/px/YWNNHHczphnLKUKz82M4r
         cUGI/Mzfj4cPoQDebraoy/YRmSSxPvVU6ZdRLzqi9/OnZyOCiV8P1RsDBi94zYkvJuIP
         z3PsX+LVyAdwJN3gj1W+7Nb2MfrPHaUz9WZZvRO6R3W6JmnqHBfpN1YuneXqAa4Exenk
         ketw==
X-Gm-Message-State: AOJu0Yzc0CRfNxACwZhTdTM4A86w+oE3dxZNroqQLEFkVJj3dF2BBktL
	Q0fYvvqTgVullSD+M66AOnNDIYrB2zd4be5GQkexxQ==
X-Google-Smtp-Source: AGHT+IEhIllMnM0PjECRqiitAitNZCsEvGEterT8Gl6AxXRapewVRPWj9ivnFDU+enq8y+LvA5OL44z2Ha1PBTDFPVs=
X-Received: by 2002:a5d:6e88:0:b0:319:6b5e:85e3 with SMTP id
 k8-20020a5d6e88000000b003196b5e85e3mr1878514wrz.71.1694001708759; Wed, 06 Sep
 2023 05:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230801085402.1168351-1-alexghiti@rivosinc.com>
 <20230801085402.1168351-5-alexghiti@rivosinc.com> <CA+V-a8t56xDqMTQfoKcsvPF8errkTMydaDz5V6nejLvVfJrW3g@mail.gmail.com>
In-Reply-To: <CA+V-a8t56xDqMTQfoKcsvPF8errkTMydaDz5V6nejLvVfJrW3g@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 6 Sep 2023 14:01:38 +0200
Message-ID: <CAHVXubiENHt36LrcSBoNU0rAMQ8EoT6tde9M8vLP3Hw2nwMm8g@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] riscv: Improve flush_tlb_kernel_range()
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Vincent Chen <vincent.chen@sifive.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_050152_084115_002E31F1 
X-CRM114-Status: GOOD (  32.67  )
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

SGkgUHJhYmhha2FyLAoKT24gV2VkLCBTZXAgNiwgMjAyMyBhdCAxOjQ54oCvUE0gTGFkLCBQcmFi
aGFrYXIKPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIEFsZXhhbmRy
ZSwKPgo+IE9uIFR1ZSwgQXVnIDEsIDIwMjMgYXQgOTo1OOKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8
YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gVGhpcyBmdW5jdGlvbiB1c2Vk
IHRvIHNpbXBseSBmbHVzaCB0aGUgd2hvbGUgdGxiIG9mIGFsbCBoYXJ0cywgYmUgbW9yZQo+ID4g
c3VidGlsZSBhbmQgdHJ5IHRvIG9ubHkgZmx1c2ggdGhlIHJhbmdlLgo+ID4KPiA+IFRoZSBwcm9i
bGVtIGlzIHRoYXQgd2UgY2FuIG9ubHkgdXNlIFBBR0VfU0laRSBhcyBzdHJpZGUgc2luY2Ugd2Ug
ZG9uJ3Qga25vdwo+ID4gdGhlIHNpemUgb2YgdGhlIHVuZGVybHlpbmcgbWFwcGluZyBhbmQgdGhl
biB0aGlzIGZ1bmN0aW9uIHdpbGwgYmUgaW1wcm92ZWQKPiA+IG9ubHkgaWYgdGhlIHNpemUgb2Yg
dGhlIHJlZ2lvbiB0byBmbHVzaCBpcyA8IHRocmVzaG9sZCAqIFBBR0VfU0laRS4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4g
PiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiA+
IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCB8IDExICsrKysrLS0t
LS0KPiA+ICBhcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMgICAgICAgICAgfCAzNCArKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25z
KCspLCAxNCBkZWxldGlvbnMoLSkKPiA+Cj4gQWZ0ZXIgYXBwbHlpbmcgdGhpcyBwYXRjaCwgSSBh
bSBzZWVpbmcgbW9kdWxlIGxvYWQgaXNzdWVzIG9uIFJaL0ZpdmUKPiAoY29tcGxldGUgbG9nIFsw
XSkuIEkgYW0gdGVzdGluZyBkZWZjb25maWcgKyBbMV0gKHJ6L2ZpdmUgcmVsYXRlZAo+IGNvbmZp
Z3MpLgo+Cj4gQW55IHBvaW50ZXJzIG9uIHdoYXQgY291bGQgYmUgYW4gaXNzdWUgaGVyZT8KCkNh
biB5b3UgZ2l2ZSBtZSB0aGUgZXhhY3QgdmVyc2lvbiBvZiB0aGUga2VybmVsIHlvdSB1c2U/IFRo
ZSB0cmFwCmFkZHJlc3NlcyBhcmUgdm1hbGxvYyBhZGRyZXNzZXMsIGFuZCBhIGZpeCBmb3IgdGhv
c2UgbGFuZGVkIHZlcnkgbGF0ZQppbiB0aGUgcmVsZWFzZSBjeWNsZS4KCj4KPiBbMF0gaHR0cHM6
Ly9wYXN0ZS5kZWJpYW4ubmV0LzEyOTExMTYvCj4gWzFdIGh0dHBzOi8vcGFzdGUuZGViaWFuLm5l
dC8xMjkxMTE4Lwo+Cj4gQ2hlZXJzLAo+IFByYWJoYWthcgo+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90
bGJmbHVzaC5oCj4gPiBpbmRleCBmNWM0ZmIwYWU2NDIuLjc0MjZmZGNkOGVjNSAxMDA2NDQKPiA+
IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaAo+ID4gKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gPiBAQCAtMzcsNiArMzcsNyBAQCB2b2lkIGZs
dXNoX3RsYl9tbV9yYW5nZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBzdGFy
dCwKPiA+ICB2b2lkIGZsdXNoX3RsYl9wYWdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1
bnNpZ25lZCBsb25nIGFkZHIpOwo+ID4gIHZvaWQgZmx1c2hfdGxiX3JhbmdlKHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+ID4gICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgbG9uZyBlbmQpOwo+ID4gK3ZvaWQgZmx1c2hfdGxiX2tlcm5lbF9yYW5n
ZSh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCk7Cj4gPiAgI2lmZGVmIENP
TkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRQo+ID4gICNkZWZpbmUgX19IQVZFX0FSQ0hfRkxVU0hf
UE1EX1RMQl9SQU5HRQo+ID4gIHZvaWQgZmx1c2hfcG1kX3RsYl9yYW5nZShzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBzdGFydCwKPiA+IEBAIC01MywxNSArNTQsMTUg
QEAgc3RhdGljIGlubGluZSB2b2lkIGZsdXNoX3RsYl9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYSwKPiA+ICAgICAgICAgbG9jYWxfZmx1c2hfdGxiX2FsbCgpOwo+ID4gIH0KPiA+Cj4g
PiAtI2RlZmluZSBmbHVzaF90bGJfbW0obW0pIGZsdXNoX3RsYl9hbGwoKQo+ID4gLSNkZWZpbmUg
Zmx1c2hfdGxiX21tX3JhbmdlKG1tLCBzdGFydCwgZW5kLCBwYWdlX3NpemUpIGZsdXNoX3RsYl9h
bGwoKQo+ID4gLSNlbmRpZiAvKiAhQ09ORklHX1NNUCB8fCAhQ09ORklHX01NVSAqLwo+ID4gLQo+
ID4gIC8qIEZsdXNoIGEgcmFuZ2Ugb2Yga2VybmVsIHBhZ2VzICovCj4gPiAgc3RhdGljIGlubGlu
ZSB2b2lkIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFydCwKPiA+ICAg
ICAgICAgdW5zaWduZWQgbG9uZyBlbmQpCj4gPiAgewo+ID4gLSAgICAgICBmbHVzaF90bGJfYWxs
KCk7Cj4gPiArICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9hbGwoKTsKPiA+ICB9Cj4gPgo+ID4gKyNk
ZWZpbmUgZmx1c2hfdGxiX21tKG1tKSBmbHVzaF90bGJfYWxsKCkKPiA+ICsjZGVmaW5lIGZsdXNo
X3RsYl9tbV9yYW5nZShtbSwgc3RhcnQsIGVuZCwgcGFnZV9zaXplKSBmbHVzaF90bGJfYWxsKCkK
PiA+ICsjZW5kaWYgLyogIUNPTkZJR19TTVAgfHwgIUNPTkZJR19NTVUgKi8KPiA+ICsKPiA+ICAj
ZW5kaWYgLyogX0FTTV9SSVNDVl9UTEJGTFVTSF9IICovCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9tbS90bGJmbHVzaC5jIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gPiBpbmRleCAw
Yzk1NWM0NzRmM2EuLjY4NzgwODAxMzc1OCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvbW0v
dGxiZmx1c2guYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gPiBAQCAtMTIw
LDE4ICsxMjAsMjcgQEAgc3RhdGljIHZvaWQgX19mbHVzaF90bGJfcmFuZ2Uoc3RydWN0IG1tX3N0
cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBsb25nIHNpemUsIHVuc2lnbmVkIGxvbmcgc3RyaWRlKQo+ID4gIHsK
PiA+ICAgICAgICAgc3RydWN0IGZsdXNoX3RsYl9yYW5nZV9kYXRhIGZ0ZDsKPiA+IC0gICAgICAg
c3RydWN0IGNwdW1hc2sgKmNtYXNrID0gbW1fY3B1bWFzayhtbSk7Cj4gPiAtICAgICAgIHVuc2ln
bmVkIGludCBjcHVpZDsKPiA+ICsgICAgICAgc3RydWN0IGNwdW1hc2sgKmNtYXNrLCBmdWxsX2Nt
YXNrOwo+ID4gICAgICAgICBib29sIGJyb2FkY2FzdDsKPiA+Cj4gPiAtICAgICAgIGlmIChjcHVt
YXNrX2VtcHR5KGNtYXNrKSkKPiA+IC0gICAgICAgICAgICAgICByZXR1cm47Cj4gPiArICAgICAg
IGlmIChtbSkgewo+ID4gKyAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBjcHVpZDsKPiA+ICsK
PiA+ICsgICAgICAgICAgICAgICBjbWFzayA9IG1tX2NwdW1hc2sobW0pOwo+ID4gKyAgICAgICAg
ICAgICAgIGlmIChjcHVtYXNrX2VtcHR5KGNtYXNrKSkKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybjsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICBjcHVpZCA9IGdldF9jcHUoKTsK
PiA+ICsgICAgICAgICAgICAgICAvKiBjaGVjayBpZiB0aGUgdGxiZmx1c2ggbmVlZHMgdG8gYmUg
c2VudCB0byBvdGhlciBDUFVzICovCj4gPiArICAgICAgICAgICAgICAgYnJvYWRjYXN0ID0gY3B1
bWFza19hbnlfYnV0KGNtYXNrLCBjcHVpZCkgPCBucl9jcHVfaWRzOwo+ID4gKyAgICAgICB9IGVs
c2Ugewo+ID4gKyAgICAgICAgICAgICAgIGNwdW1hc2tfc2V0YWxsKCZmdWxsX2NtYXNrKTsKPiA+
ICsgICAgICAgICAgICAgICBjbWFzayA9ICZmdWxsX2NtYXNrOwo+ID4gKyAgICAgICAgICAgICAg
IGJyb2FkY2FzdCA9IHRydWU7Cj4gPiArICAgICAgIH0KPiA+Cj4gPiAtICAgICAgIGNwdWlkID0g
Z2V0X2NwdSgpOwo+ID4gLSAgICAgICAvKiBjaGVjayBpZiB0aGUgdGxiZmx1c2ggbmVlZHMgdG8g
YmUgc2VudCB0byBvdGhlciBDUFVzICovCj4gPiAtICAgICAgIGJyb2FkY2FzdCA9IGNwdW1hc2tf
YW55X2J1dChjbWFzaywgY3B1aWQpIDwgbnJfY3B1X2lkczsKPiA+ICAgICAgICAgaWYgKHN0YXRp
Y19icmFuY2hfdW5saWtlbHkoJnVzZV9hc2lkX2FsbG9jYXRvcikpIHsKPiA+IC0gICAgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nIGFzaWQgPSBhdG9taWNfbG9uZ19yZWFkKCZtbS0+Y29udGV4dC5p
ZCkgJiBhc2lkX21hc2s7Cj4gPiArICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhc2lkID0g
bW0gPyBhdG9taWNfbG9uZ19yZWFkKCZtbS0+Y29udGV4dC5pZCkgJiBhc2lkX21hc2sgOiAwOwo+
ID4KPiA+ICAgICAgICAgICAgICAgICBpZiAoYnJvYWRjYXN0KSB7Cj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICBpZiAocmlzY3ZfdXNlX2lwaV9mb3JfcmZlbmNlKCkpIHsKPiA+IEBAIC0xNjUs
NyArMTc0LDggQEAgc3RhdGljIHZvaWQgX19mbHVzaF90bGJfcmFuZ2Uoc3RydWN0IG1tX3N0cnVj
dCAqbW0sIHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gPiAgICAgICAgICAgICAgICAgfQo+ID4gICAg
ICAgICB9Cj4gPgo+ID4gLSAgICAgICBwdXRfY3B1KCk7Cj4gPiArICAgICAgIGlmIChtbSkKPiA+
ICsgICAgICAgICAgICAgICBwdXRfY3B1KCk7Cj4gPiAgfQo+ID4KPiA+ICB2b2lkIGZsdXNoX3Rs
Yl9tbShzdHJ1Y3QgbW1fc3RydWN0ICptbSkKPiA+IEBAIC0xOTYsNiArMjA2LDEyIEBAIHZvaWQg
Zmx1c2hfdGxiX3JhbmdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25n
IHN0YXJ0LAo+ID4KPiA+ICAgICAgICAgX19mbHVzaF90bGJfcmFuZ2Uodm1hLT52bV9tbSwgc3Rh
cnQsIGVuZCAtIHN0YXJ0LCBzdHJpZGVfc2l6ZSk7Cj4gPiAgfQo+ID4gKwo+ID4gK3ZvaWQgZmx1
c2hfdGxiX2tlcm5lbF9yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVu
ZCkKPiA+ICt7Cj4gPiArICAgICAgIF9fZmx1c2hfdGxiX3JhbmdlKE5VTEwsIHN0YXJ0LCBlbmQs
IFBBR0VfU0laRSk7Cj4gPiArfQo+ID4gKwo+ID4gICNpZmRlZiBDT05GSUdfVFJBTlNQQVJFTlRf
SFVHRVBBR0UKPiA+ICB2b2lkIGZsdXNoX3BtZF90bGJfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBsb25nIGVuZCkKPiA+IC0tCj4gPiAyLjM5LjIKPiA+Cj4gPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
