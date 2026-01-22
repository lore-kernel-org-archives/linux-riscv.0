Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA581C44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 11:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hORezmChK8ssgC/Wyn+HEAWmy02np93pB6C4ZPkP9gM=; b=Ei2a4s5rso+eIb
	8AueUSBiYtlSi917RI4LLpoF/YCdcYhZkygafkwm8GiJRHKVp04uqpQYyDJ4ry9APGFSbEcAhclyE
	UoACF2vGun6hQ7aZWWs6MxxoWlZpXGN799o2tjt2knovQuz4ExKtJhE70UJzEOLs0Xhl2zOyS8WnP
	Wmf63sfQwGciHQqhCwOOa7B+Byrc4ZcwbN10bwoR2V/Bvi/m/SKBqygl9echncdpbum7vnJO6rzd3
	/lkOV4PgSfGIlZADkTt3Pc561DusTCZ48IvTsoyDNRw9JxsQjwW7BxSg8QdB67PZAmEVyWIY7ovbQ
	z+TmQx4vMIyImMqyn4/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visit-00000006whV-3Ddi;
	Thu, 22 Jan 2026 11:19:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1visir-00000006wh9-15fd
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 11:19:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C65C44135
	for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 11:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12583C2BCAF
	for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 11:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769080772;
	bh=h2ozgJA/BVuNcMltVMhZP2i6dw0T5W63Gm0m34za7Kk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V/YwZefX3Hq2UvCJZj/PyMQ1h+rerSVCTe5eTmOsw7d9onXLyWoOOnqsV3NC5F/cQ
	 QF8awsHjzJpOmCPgCujeDBATC4kC4wCLN3rzyNmzR1yT8uLRgGyfGfnaBr2yuOstYc
	 whKwbvfGzx6v7Sw4QshAcALIfp/oiHJVZVlxHEKnVNPhMYaVpqoxZhHx/59PXr6NbS
	 hZ71YzFkljIl+wXX8GJ4RDNCIR8n1I/jgsxQ1wRkWDMGaO+3Kv2VVRdePJqcI0tXkZ
	 t6vV3zNd0JtUSQoMah5xCRRmy5TXJjKmuQ3OEZl0Qnc3tbn7xTNQp7Kavw43oKOBpv
	 MsGD2a82O8ZHw==
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-45c733ccc32so286354b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 03:19:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX7UL+rFHa9ZZ8QqlPvnUIx6iQ4uu6Ll8lMemo1o3A40zhJWaAWeodKVK02Wf8fjsSJaF7OG+8BZNgy1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcGsBq2aT1A19+5Hv9XHrAx7BP4FYEWmcb1ZCSncZUiULbCmxA
	Uvx+1HHYh7e6JrIJo9k/Ay/zdlVR6Q7AwlATBRdeMEPgNanM3LpYfIXTStoJ85VYivfjX90acYx
	AeA0scvRVTuBIOTbAyAmNqBNYTjdX2Go=
X-Received: by 2002:a05:6808:3088:b0:44f:8bff:436e with SMTP id
 5614622812f47-45e8a8f79c3mr4689542b6e.12.1769080770867; Thu, 22 Jan 2026
 03:19:30 -0800 (PST)
MIME-Version: 1.0
References: <20260122073446.45628-1-yang.yicong@picoheart.com> <20260122073446.45628-2-yang.yicong@picoheart.com>
In-Reply-To: <20260122073446.45628-2-yang.yicong@picoheart.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 22 Jan 2026 12:19:19 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iwfk4hnj7Lf5hq3uo4p+_CT35ZwJUnenLOzOoGqQcsgw@mail.gmail.com>
X-Gm-Features: AZwV_QhNzuU2Fy-e_RlYyIapwi0uuwzQzar7ec644yn5HdlBYyoNH-OgGilwC8Y
Message-ID: <CAJZ5v0iwfk4hnj7Lf5hq3uo4p+_CT35ZwJUnenLOzOoGqQcsgw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ACPI: scan: Use async schedule function for acpi_scan_clear_dep_fn
To: Yicong Yang <yang.yicong@picoheart.com>
Cc: rafael@kernel.org, lenb@kernel.org, tglx@kernel.org, 
	gregkh@linuxfoundation.org, dakr@kernel.org, akpm@linux-foundation.org, 
	apatel@ventanamicro.com, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, geshijian@picoheart.com, 
	weidong.wd@picoheart.com, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_031933_356907_59F345DD 
X-CRM114-Status: GOOD (  24.92  )
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

T24gVGh1LCBKYW4gMjIsIDIwMjYgYXQgODozNeKAr0FNIFlpY29uZyBZYW5nIDx5YW5nLnlpY29u
Z0BwaWNvaGVhcnQuY29tPiB3cm90ZToKPgo+IFRoZSBkZXZpY2Ugb2JqZWN0IHJlc2NhbiBpbiBh
Y3BpX3NjYW5fY2xlYXJfZGVwX2ZuIGlzIHNjaGVkdWxlZAo+IGluIHRoZSBzeXN0ZW0gd29ya3F1
ZXVlIHdoaWNoIGlzIG5vdCBndWFyYW50ZWVkIHRvIGJlIGZpbmlzaGVkCj4gYmVmb3JlIGVudGVy
aW5nIHVzZXJzcGFjZS4gVGhpcyB3aWxsIGNhdXNlIHRoZSBwcm9ibGVtIHRoYXQKPiBzb21lIGtl
eSBkZXZpY2VzIGFyZSBtaXNzZWQgd2hlbiB0aGUgaW5pdCB0YXNrIHRyeSB0byBmaW5kIHRoZW0s
Cj4gZS5nLiBjb25zb2xlIGRldmljZXMgYW5kIHJvb3QgZGV2aWNlcyAoUENJZSBudm1lLCBldGMp
Lgo+IFRoaXMgaXNzdWVzIGlzIG1vcmUgcG9zc2JpbGUgdG8gaGFwcGVuIG9uIFJJU0NWIHNpbmNl
IHRoZXNlCj4gZGV2aWNlcyB1c2luZyBHU0kgaW50ZXJydXB0IG1heSBkZXBlbmQgb24gQVBMSUMg
YW5kIHdpbGwgYmUKPiBzY2FubmVkIGluIGFjcGlfc2Nhbl9jbGVhcl9kZXBfcXVldWUoKSBhZnRl
ciBBUExJQyBpbml0aWFsaXplZC4KPgo+IEZpeCB0aGlzIGJ5IHNjaGVkdWxpbmcgdGhlIGFjcGlf
c2Nhbl9jbGVhcl9kZXBfcXVldWUoKSB1c2luZyBhc3luYwo+IHNjaGVkdWxlIGZ1bmN0aW9uIHJh
dGhlciB0aGFuIHRoZSBzeXN0ZW0gd29ya3F1ZXVlLiBUaGUgZGVmZXJyZWQKPiB3b3JrcyB3aWxs
IGJlIHN5bmNocm9uaXplZCBieSBhc3luY19zeW5jaHJvbml6ZV9mdWxsKCkgYmVmb3JlCj4gZW50
ZXJpbmcgaW5pdCB0YXNrLgo+Cj4gVXBkYXRlIHRoZSBjb21tZW50IGFzIHdlbGwuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBZaWNvbmcgWWFuZyA8eWFuZy55aWNvbmdAcGljb2hlYXJ0LmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9hY3BpL3NjYW4uYyB8IDM1ICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvc2Nhbi5jIGIvZHJpdmVycy9hY3BpL3Nj
YW4uYwo+IGluZGV4IDQxNmQ4N2Y5YmQxMC4uYmYwZDhiYTliYTE5IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvYWNwaS9zY2FuLmMKPiArKysgYi9kcml2ZXJzL2FjcGkvc2Nhbi5jCj4gQEAgLTUsNiAr
NSw3IEBACj4KPiAgI2RlZmluZSBwcl9mbXQoZm10KSAiQUNQSTogIiBmbXQKPgo+ICsjaW5jbHVk
ZSA8bGludXgvYXN5bmMuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvaW5pdC5oPgo+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+IEBAIC0yMzY1LDM5
ICsyMzY2LDM1IEBAIHN0cnVjdCBhY3BpX3NjYW5fY2xlYXJfZGVwX3dvcmsgewo+ICAgICAgICAg
c3RydWN0IGFjcGlfZGV2aWNlICphZGV2Owo+ICB9Owo+Cj4gLXN0YXRpYyB2b2lkIGFjcGlfc2Nh
bl9jbGVhcl9kZXBfZm4oc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ICtzdGF0aWMgdm9pZCBh
Y3BpX3NjYW5fY2xlYXJfZGVwX2ZuKHZvaWQgKmRldiwgYXN5bmNfY29va2llX3QgY29va2llKQo+
ICB7Cj4gLSAgICAgICBzdHJ1Y3QgYWNwaV9zY2FuX2NsZWFyX2RlcF93b3JrICpjZHc7Cj4gLQo+
IC0gICAgICAgY2R3ID0gY29udGFpbmVyX29mKHdvcmssIHN0cnVjdCBhY3BpX3NjYW5fY2xlYXJf
ZGVwX3dvcmssIHdvcmspOwo+ICsgICAgICAgc3RydWN0IGFjcGlfZGV2aWNlICphZGV2ID0gdG9f
YWNwaV9kZXZpY2UoZGV2KTsKPgo+ICAgICAgICAgYWNwaV9zY2FuX2xvY2tfYWNxdWlyZSgpOwo+
IC0gICAgICAgYWNwaV9idXNfYXR0YWNoKGNkdy0+YWRldiwgKHZvaWQgKil0cnVlKTsKPiArICAg
ICAgIGFjcGlfYnVzX2F0dGFjaChhZGV2LCAodm9pZCAqKXRydWUpOwo+ICAgICAgICAgYWNwaV9z
Y2FuX2xvY2tfcmVsZWFzZSgpOwo+Cj4gLSAgICAgICBhY3BpX2Rldl9wdXQoY2R3LT5hZGV2KTsK
PiAtICAgICAgIGtmcmVlKGNkdyk7Cj4gKyAgICAgICBhY3BpX2Rldl9wdXQoYWRldik7Cj4gIH0K
Pgo+ICBzdGF0aWMgYm9vbCBhY3BpX3NjYW5fY2xlYXJfZGVwX3F1ZXVlKHN0cnVjdCBhY3BpX2Rl
dmljZSAqYWRldikKPiAgewo+IC0gICAgICAgc3RydWN0IGFjcGlfc2Nhbl9jbGVhcl9kZXBfd29y
ayAqY2R3Owo+IC0KPiAgICAgICAgIGlmIChhZGV2LT5kZXBfdW5tZXQpCj4gICAgICAgICAgICAg
ICAgIHJldHVybiBmYWxzZTsKPgo+IC0gICAgICAgY2R3ID0ga21hbGxvYyhzaXplb2YoKmNkdyks
IEdGUF9LRVJORUwpOwo+IC0gICAgICAgaWYgKCFjZHcpCj4gLSAgICAgICAgICAgICAgIHJldHVy
biBmYWxzZTsKPiAtCj4gLSAgICAgICBjZHctPmFkZXYgPSBhZGV2Owo+IC0gICAgICAgSU5JVF9X
T1JLKCZjZHctPndvcmssIGFjcGlfc2Nhbl9jbGVhcl9kZXBfZm4pOwo+ICAgICAgICAgLyoKPiAt
ICAgICAgICAqIFNpbmNlIHRoZSB3b3JrIGZ1bmN0aW9uIG1heSBibG9jayBvbiB0aGUgbG9jayB1
bnRpbCB0aGUgZW50aXJlCj4gLSAgICAgICAgKiBpbml0aWFsIGVudW1lcmF0aW9uIG9mIGRldmlj
ZXMgaXMgY29tcGxldGUsIHB1dCBpdCBpbnRvIHRoZSB1bmJvdW5kCj4gLSAgICAgICAgKiB3b3Jr
cXVldWUuCj4gKyAgICAgICAgKiBBc3luYyBzY2hlZHVsZSB0aGUgZGVmZXJyZWQgYWNwaV9zY2Fu
X2NsZWFyX2RlcF9mbigpIHNpbmNlOgo+ICsgICAgICAgICogLSBhY3BpX2J1c19hdHRhY2goKSBu
ZWVkcyB0byBob2xkIGFjcGlfc2Nhbl9sb2NrIHdoaWNoIGNhbm5vdAo+ICsgICAgICAgICogICBi
ZSBhY3F1aXJlZCB1bmRlciBhY3BpX2RlcF9saXN0X2xvY2sgKGhlbGQgaGVyZSkKPiArICAgICAg
ICAqIC0gdGhlIGRlZmVycmVkIHdvcmsgYXQgYm9vdCBzdGFnZSBpcyBlbnN1cmVkIHRvIGJlIGZp
bmlzaGVkCj4gKyAgICAgICAgKiAgIGJlZm9yZSBlbnRlcmluZyBpbml0IHRhc2sgYnkgdGhlIGFz
eW5jX3N5bmNocm9uaXplX2Z1bGwoKQo+ICsgICAgICAgICogICBiYXJyaWVyCj4gKyAgICAgICAg
Kgo+ICsgICAgICAgICogVXNlIF9ub2NhbGwgdmFyaWFudCBzaW5jZSBpdCdsbCByZXR1cm4gb24g
ZmFpbHVyZSBpbnN0ZWFkIG9mCj4gKyAgICAgICAgKiBydW4gdGhlIGZ1bmN0aW9uIHN5bmNocm9u
b3VzbHkuCj4gICAgICAgICAgKi8KPiAtICAgICAgIHF1ZXVlX3dvcmsoc3lzdGVtX2RmbF93cSwg
JmNkdy0+d29yayk7Cj4gKyAgICAgICBpZiAoIWFzeW5jX3NjaGVkdWxlX2Rldl9ub2NhbGwoYWNw
aV9zY2FuX2NsZWFyX2RlcF9mbiwgJmFkZXYtPmRldikpCgpJZiB0aGUgcHJvYmxlbSBpcyB0aGF0
IHN5c3RlbV9kZmxfd3EgaXMgdG9vIHNsb3csIHdoeSBkb24ndCB5b3UganVzdAp0cnkgYSBkZWRp
Y2F0ZWQgd29ya3F1ZXVlIGZvciB0aGlzPwoKVGhlcmUncyBubyBuZWVkIHRvIG1vZGlmeSBhbGwg
b2YgdGhpcyBjb2RlLgoKPiArICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+Cj4gICAgICAg
ICByZXR1cm4gdHJ1ZTsKPiAgfQo+IC0tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
