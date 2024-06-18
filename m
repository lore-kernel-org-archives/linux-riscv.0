Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D0AC27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 10:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r2g5CqaBKK77hWHRoWOV+jx+oLV/P/dw6F/6BBxiCzc=; b=xZ58KbmGKcOI6O
	x4hvV8eqLlPD3yYdp7UWFwDnL1yWUvIs7PwoHds+h441BdkSivqC9kEPLkSISv+l0/e7xnOsUc+XP
	Y+daaTrr0KuqoPVPRl4/EjE1kpoSgVODOKsaJYNpqtGXKyGrO/ejv1yup/64PpQssIS54VjOo3H8a
	kRwPZydbXUq8jW/lRUCBpLaFgT2zMNOn7sL6kxsjEyqvRkObvwHJ/GOPnEBrX+h+TQQGPhsvy6VCo
	hem+k0K0CIm72m2StYN73HR3CnNlkd+I4ErZ0ooyxeLB8Os5RqZhIJMMASy6WgWduZmVgy1jzAT3K
	8zACzdVJ0LgG0brR25AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVdk-0000000EFET-00iV;
	Tue, 18 Jun 2024 10:00:36 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJVdf-0000000EFCc-1RgA
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 10:00:33 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-70b2421471aso1293945a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jun 2024 03:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1718704824; x=1719309624; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZR8CcgURsRbvnUXkE0a3SupFeWf/zFWGzZmoJybLWM=;
        b=N386xpXuVb5xCUJcY79nEnxRuriNkXFlw9KYUOMV8GS9ELIh+f9myGWhz/4ZKO+SpQ
         n3yKVGWEILY1uHpZfyAeI+0PTPsBXOwZgfRNPfaOu07ZOZ8PQcTk5IXbJFIu4YiQSo/7
         Xyclh8UW22U9sHrOW0lsagzLSjTiwSxn2LYgSVkpKuzxUoF3iBKeqou9VyIwFVaFEBe6
         yyQq0uRzZeoS0uTwWxbtLlqHpN3N6Eum9uHyd+WMImuAVx4DyIgEAwHWGS17qCNzKG8/
         b9dhqWykhyCODb3gJ37WQw/7loNLCHoAP5Tzcdy2pZ3y6rAJc+NM07lomROQPUhJ+2JV
         KVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718704824; x=1719309624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZR8CcgURsRbvnUXkE0a3SupFeWf/zFWGzZmoJybLWM=;
        b=qfVcR14dGxu85apAgo9exA1OYLYuuvs10OA/ha6ZkWhQxlgmDJQXAOJApOjTBHT/vD
         5RKPX7LjnQp1dZDlkNIe7b2c5izwprD1VNbsFrGGD0LVALSoujLK7q+cxf+eM+mNzl1n
         uL3Tr/6MRzBsDz6SegS4DoBcL4zsPi6YtQKqz7EC84P/7bnmV4Q09PkncbAIGQtgB+PM
         XIqnUXh1Uwdefy7j8KuW+jUKk9j9+awyHqQz4PdV3YaFcOo4X6RQs4D1TozUNayeeJSX
         INH/wNjgne7ZcPUEXOyXxdjZ/BI4XRVGp/E99iNKi8agdK5uj469H3h3hDx2R29UBuTr
         ze9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHU2dxLyz9tOH6u5aN4e28TKrRujo4vqabbhVwM6CLLo6t2cN43OcwBiAtelLiprcwY9Odx4ZMr/p7yX7/bDyNRNPUkaUV6inkY6oLxvb7
X-Gm-Message-State: AOJu0Ywhvie0smvVgN1rXNgNN1UJseUj675IhKEk6RNHeYRPOpiJtV2A
	KZ28pXqEeZjic11gx7lsEFpLa1euZNslHxt8d244zD9VIdnzQbpikvQbR5Phnz/kwxHanHm3BO+
	bsBPOFKnzj4jpiHsjLwfM+jrBdYEkYgU0BPHPpw==
X-Google-Smtp-Source: AGHT+IHx8ALlkkaSwJ4WcPFZ7PFlSkSqM6tzPJZC5DokDwldFt2gGFu1bgX+jONtFmGJCQjSmKZTbOUyQJm+CSgTY8k=
X-Received: by 2002:a05:6a20:1592:b0:1b8:498e:4e29 with SMTP id
 adf61e73a8af0-1bae84146d7mr12687693637.52.1718704824273; Tue, 18 Jun 2024
 03:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230725070549.89810-1-luxu.kernel@bytedance.com>
 <mhng-a0239c56-385e-40a9-8a71-45d50e28b45d@palmer-ri-x1c9>
 <CAPYmKFvXf7q_8QzFe4VFL1s-j0P3ZGSZ8nG1q4HmtU4rzek77Q@mail.gmail.com>
 <CAPYmKFvqpe48zaLKrTz085cJcO9fwL+BtHujU4p48onR1Nodfw@mail.gmail.com> <329b22c6-435c-424a-8211-b9a029b0897d@ghiti.fr>
In-Reply-To: <329b22c6-435c-424a-8211-b9a029b0897d@ghiti.fr>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Tue, 18 Jun 2024 18:00:13 +0800
Message-ID: <CAPYmKFuLap8SZrcgGM36G85TYshuhMhMA1WUHt1A_VkD9JiTqQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] riscv: Fix local irq restore when flags
 indicates irq disabled
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_030031_409274_95670175 
X-CRM114-Status: GOOD (  30.67  )
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

SGkgQWxleCwKCkkgd2lsbCBzZW5kIGEgbmV3IHZlcnNpb24gbGF0ZXIgdG9kYXkuCgpUaGFua3Ms
CgpYdSBMdQoKT24gVHVlLCBKdW4gMTgsIDIwMjQgYXQgNTo0NeKAr1BNIEFsZXhhbmRyZSBHaGl0
aSA8YWxleEBnaGl0aS5mcj4gd3JvdGU6Cj4KPiBIaSBYdSBMdSwKPgo+IE9uIDI0LzA4LzIwMjMg
MTQ6MDgsIFh1IEx1IHdyb3RlOgo+ID4gT24gV2VkLCBBdWcgOSwgMjAyMyBhdCAyOjU44oCvUE0g
5pet6LevIDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPiB3cm90ZToKPiA+PiBPbiBXZWQsIEF1
ZyA5LCAyMDIzIGF0IDI6MDXigK9QTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29t
PiB3cm90ZToKPiA+Pj4gT24gVHVlLCAyNSBKdWwgMjAyMyAwMDowNTo0OSBQRFQgKC0wNzAwKSwg
bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbSB3cm90ZToKPiA+Pj4+IFdoZW4gYXJjaF9sb2NhbF9p
cnFfcmVzdG9yZSgpIGlzIGNhbGxlZCB3aXRoIGZsYWdzIGluZGljYXRpbmcgaXJxcwo+ID4+Pj4g
ZGlzYWJsZWQsIHdlIG5lZWQgdG8gY2xlYXIgU1JfSUUgYml0IGluIENTUl9TVEFUVVMsIHdoZXJl
YXMgY3VycmVudAo+ID4+Pj4gaW1wbGVtZW50YXRpb24gYmFzZWQgb24gY3NyX3NldCgpIGZ1bmN0
aW9uIG9ubHkgc2V0cyBTUl9JRSBiaXQgb2YKPiA+Pj4+IENTUl9TVEFUVVMgd2hlbiBTUl9JRSBi
aXQgb2YgZmxhZ3MgaXMgaGlnaCBhbmQgZG9lcyBub3RoaW5nIHdoZW4KPiA+Pj4+IFNSX0lFIGJp
dCBvZiBmbGFncyBpcyBsb3cuCj4gPj4+Pgo+ID4+Pj4gVGhpcyBjb21taXQgc3VwcGxpZXMgY3Ny
IGNsZWFyIG9wZXJhdGlvbiB3aGVuIGNhbGxpbmcgaXJxIHJlc3RvcmUKPiA+Pj4+IGZ1bmN0aW9u
IHdpdGggZmxhZ3MgaW5kaWNhdGluZyBpcnEgZGlzYWJsZWQuCj4gPj4+Pgo+ID4+Pj4gRml4ZXM6
IDZkNjBiNmVlMGM5NyAoIlJJU0MtVjogRGV2aWNlLCB0aW1lciwgSVJRcywgYW5kIHRoZSBTQkki
KQo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+
Cj4gPj4+PiAtLS0KPiA+Pj4+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pcnFmbGFncy5oIHwg
NSArKysrLQo+ID4+Pj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gPj4+Pgo+ID4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
aXJxZmxhZ3MuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaXJxZmxhZ3MuaAo+ID4+Pj4gaW5k
ZXggMDhkNGQ2YTViN2U5Li43YzMxZmMzYzM1NTkgMTAwNjQ0Cj4gPj4+PiAtLS0gYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2lycWZsYWdzLmgKPiA+Pj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vaXJxZmxhZ3MuaAo+ID4+Pj4gQEAgLTQ5LDcgKzQ5LDEwIEBAIHN0YXRpYyBpbmxpbmUg
aW50IGFyY2hfaXJxc19kaXNhYmxlZCh2b2lkKQo+ID4+Pj4gICAvKiBzZXQgaW50ZXJydXB0IGVu
YWJsZWQgc3RhdHVzICovCj4gPj4+PiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBhcmNoX2xvY2FsX2ly
cV9yZXN0b3JlKHVuc2lnbmVkIGxvbmcgZmxhZ3MpCj4gPj4+PiAgIHsKPiA+Pj4+IC0gICAgIGNz
cl9zZXQoQ1NSX1NUQVRVUywgZmxhZ3MgJiBTUl9JRSk7Cj4gPj4+PiArICAgICBpZiAoZmxhZ3Mg
JiBTUl9JRSkKPiA+Pj4+ICsgICAgICAgICAgICAgY3NyX3NldChDU1JfU1RBVFVTLCBTUl9JRSk7
Cj4gPj4+PiArICAgICBlbHNlCj4gPj4+PiArICAgICAgICAgICAgIGNzcl9jbGVhcihDU1JfU1RB
VFVTLCBTUl9JRSk7Cj4gPj4+IFVubGVzcyBJJ20gbWlzc2luZyBzb21ldGhpbmcsIHRoZSBvcmln
aW5hbCB2ZXJzaW9uIGlzIGNvcnJlY3Q6Cj4gPj4+IGxvY2FsX2lycV9yZXN0b3JlKCkgbXVzdCBi
ZSBwYWlyZWQgd2l0aCBhIGxvY2FsX2lycV9zYXZlKCksIHNvIHdlIGNhbgo+ID4+PiBvbmx5IGdl
dCBoZXJlIHdpdGggaW50ZXJydXB0cyBkaXNhYmxlZC4KPiA+PiBZZXMsIGl0IGlzIGNvcnJlY3Qg
aWYgbG9jYWxfaXJxX3NhdmUoKSBpcyBjYWxsZWQgd2hlbiBpcnEgaXMgZW5hYmxlZCBiZWZvcmUu
Cj4gPj4gVGhlIGZsYWdzIHJldHVybmVkIHdpbGwgYmUgU1JfSUUuIEFuZCBpdCBpcyBzYWZlIHRv
IGNhbGwgbG9jYWxfaXJxX3Jlc3RvcmUoKQo+ID4+IHdpdGggZmxhZyBTUl9JRSBpbiBhbnkgY2Fz
ZS4KPiA+Pgo+ID4+IEhvd2V2ZXIsIGlmIGxvY2FsX2lycV9zYXZlKCkgaXMgY2FsbGVkIHdoZW4g
aXJxIGlzIGRpc2FibGVkLiBUaGUgU1JfSUUgYml0IG9mCj4gPj4gZmxhZyByZXR1cm5lZCBpcyBj
bGVhci4gSWYgc29tZSBjb2RlIGJldHdlZW4gbG9jYWxfaXJxX3NhdmUoKSBhbmQKPiA+PiBsb2Nh
bF9pcnFfcmVzdG9yZSgpIHJlZW5hYmxlcyBpcnEsIGNhdXNpbmcgdGhlIFNSX0lFIGJpdCBvZiBD
U1JfU1RBVFVTCj4gPj4gYmFjayB0byAxLCB0aGVuIGxvY2FsX2lycV9yZXN0b3JlKCkgY2FuIG5v
dCByZXN0b3JlIGlycSBzdGF0dXMgYmFjayB0byBkaXNhYmxlZC4KPiA+Pgo+ID4+IEhlcmUgaXMg
YW4gZXhhbXBsZSBpbiBleGlzdGluZyBkcml2ZXIgKG1heSBub3QgYmVsb25nIHRvIHJpc2N2IGFy
Y2gpIGluCj4gPj4gZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVhbHRlay9ydGx3aWZpL3J0bDg3MjNh
ZS9ody5jLiBUaGUgcHNldWRvIGNvZGUKPiA+PiBiZWhhdmVzIGxpa2U6Cj4gPj4KPiA+PiBpbnQg
cnRsODcyM2VfaHdfaW5pdChzdHJ1Y3QgaWVlZTgwMjExX2h3ICpodykKPiA+PiB7Cj4gPj4gICAg
ICAgaW50IGVycjsKPiA+PiAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+ID4+ICAgICAgIC4u
Lgo+ID4+ICAgICAgIGxvY2FsX2lycV9zYXZlX2ZsYWdzKGZsYWdzKTsKPiA+PiAgICAgICBsb2Nh
bF9pcnFfZW5hYmxlKCk7Cj4gPj4gICAgICAgLi4uCj4gPj4gICAgICAgbG9jYWxfaXJxX3Jlc3Rv
cmUoZmxhZ3MpOwo+ID4+ICAgICAgIC4uLgo+ID4+ICAgICAgIHJldHVybiBlcnI7Cj4gPj4gfQo+
ID4+Cj4gPj4KPiA+Pj4+ICAgfQo+ID4+Pj4KPiA+Pj4+ICAgI2VuZGlmIC8qIF9BU01fUklTQ1Zf
SVJRRkxBR1NfSCAqLwo+ID4gQSBnZW50bGUgcGluZy4KPgo+Cj4gVGhpcyBnb3QgbG9zdCBidXQg
dGhpcyBpcyBzdGlsbCBjb3JyZWN0IGFuZCBuZWVkZWQuCj4KPiBEbyB5b3UgdGhpbmsgeW91IGNh
biByZXNwaW4gYSBuZXcgdmVyc2lvbj8gT3RoZXJ3aXNlLCBJJ2xsIGRvIGl0IGFuZAo+IGtlZXAg
eW91IFNvQi4KPgo+IFRoYW5rcywKPgo+IEFsZXgKPgo+Cj4gPgo+ID4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdAo+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
