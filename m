Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93DAC46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Dec 2023 09:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=so8rLEr4cEIP93KbE4s0I3iyB47wPPqhOolDwnSFjuk=; b=sCQv22wEMjaDAZ
	ymXb2xqoEtFWlo1ngfbXbciZu4o8FBLklrlUsKOve3Wiv6/2Rh09Ut9DAKzALVHVI7izW67KjFVYe
	G5KN+ZlAb384Ted2MPQkA8LFcHyfI+uy+LTH8b3vVxAeBoGEbAzyYmec7WwUnLH0hThVuY7kQTylb
	0AnlW8KadH5InA9f9KWRnj1VOqoZLZUI89s7koKdE3ZIYr2fNu9ztd7D5LCNEXEJMFeCaHsAXp0jJ
	HSLk84YXiAPA4m6aCWM0jZRDim0MBP1FRbJ90+zt4C34aQjgXJq9W5BYYn+sbuDaOSiP530l9jMq3
	4bPDG6LNJygmuAJnwLZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJW2y-002Ul8-1V;
	Sat, 30 Dec 2023 09:54:24 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJW2u-002Ujs-1n
	for linux-riscv@lists.infradead.org;
	Sat, 30 Dec 2023 09:54:22 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-55559e26ccfso3295179a12.3
        for <linux-riscv@lists.infradead.org>; Sat, 30 Dec 2023 01:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1703930058; x=1704534858; darn=lists.infradead.org;
        h=content-transfer-encoding:to:references:message-id:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abUTt15ozYHOLG/fk60Lc57aa9WtZ24J7IwER8hUXeE=;
        b=GRI9g4+VKh3D42o7Vu0mLXa/gPNo6flVmdvvRN1lJYHxjUjGL0mJROdNeVYvoF/GGu
         UAbL5Fo+LB09W9O9k34Bis2LOm1u1wKJ3cJHsranaT6ACzHiPQSq9wfFu7eG2tignPLP
         to1GGUK1zS9lFs5oTRaMjIH/TXhPQs6teFTn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703930058; x=1704534858;
        h=content-transfer-encoding:to:references:message-id:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=abUTt15ozYHOLG/fk60Lc57aa9WtZ24J7IwER8hUXeE=;
        b=JTv+XFyR8Nzp/pPA06XO6Kv0CSqzuu5PT8L6E24whTR3roVJQXQDnnaiOC7OufZjMu
         7Fdsf2w+s7Y8wmQk6TFtbHSUU3u9MWZaVtLD9s+5cirAL1iHumVaxJrkpTvtAVYUxRpB
         g91zcsDOHXfEYBIrL2rZ7gD7/mzbbCkghBmpzXX6gHeHaHxqc4B1IZScpsuaF92wouNj
         UNowC5/5zzAnAduY9MoHx2cHxmrmnV8r7dMsxx9vT0Lkbe+I8XrtxeFgDb6bZL8iz0ME
         5RtmeOU+6SnXpZbO4ATudXU5jYK6g1RKfgFvjJGRT/f198cQv5LcL35JsXx3MsyM5Von
         g2pg==
X-Gm-Message-State: AOJu0YwIq0II8QxcUrQlQ7EOIHhx30dlVi0rBE9Cq6TBAlqWqDchmxtL
	2lIQ5wWNRDWtzrCiK3D9BmHDRvt+19FGeKsfd0/VTLvW75DqKEXIA91ZhkRZT+xrHxPWLwbVdgq
	brJHeVq8bcYHatr8RC0jI4jdGoQ==
X-Google-Smtp-Source: AGHT+IGK1uGrlady2TpLBMfqqY9A7tHn9+lcZGtpiYGeIBTdCURXuQcXKU0VKUNz5G0qW4/zkYvz4w==
X-Received: by 2002:a05:6402:ca3:b0:54c:9dbe:5c03 with SMTP id cn3-20020a0564020ca300b0054c9dbe5c03mr5290445edb.40.1703930057752;
        Sat, 30 Dec 2023 01:54:17 -0800 (PST)
Received: from smtpclient.apple ([132.69.236.92])
        by smtp.gmail.com with ESMTPSA id m9-20020aa7c2c9000000b00552666f4745sm12089039edp.22.2023.12.30.01.54.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 30 Dec 2023 01:54:17 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Re: [PATCH 1/2] mm/tlb: fix fullmm semantics
From: Nadav Amit <nadav.amit@broadcom.com>
In-Reply-To: <20231228084642.1765-2-jszhang@kernel.org>
Date: Sat, 30 Dec 2023 11:54:02 +0200
Cc: Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 linux-arch@vger.kernel.org,
 linux-mm <linux-mm@kvack.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org,
 Nadav Amit <namit@vmware.com>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Andy Lutomirski <luto@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Yu Zhao <yuzhao@google.com>,
 the arch/x86 maintainers <x86@kernel.org>
Message-Id: <204B6410-2EFA-462B-9DF7-64CC5F1D3AD2@broadcom.com>
References: <20231228084642.1765-1-jszhang@kernel.org>
 <20231228084642.1765-2-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
X-Mailer: Apple Mail (2.3774.300.61.1.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231230_015420_975696_AB2DC8E4 
X-CRM114-Status: GOOD (  29.80  )
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

Cgo+IE9uIERlYyAyOCwgMjAyMywgYXQgMTA6NDbigK9BTSwgSmlzaGVuZyBaaGFuZyA8anN6aGFu
Z0BrZXJuZWwub3JnPiB3cm90ZToKPiAKPiBGcm9tOiBOYWRhdiBBbWl0IDxuYW1pdEB2bXdhcmUu
Y29tPgo+IAo+IGZ1bGxtbSBpbiBtbXVfZ2F0aGVyIGlzIHN1cHBvc2VkIHRvIGluZGljYXRlIHRo
YXQgdGhlIG1tIGlzIHRvcm4tZG93bgo+IChlLmcuLCBvbiBwcm9jZXNzIGV4aXQpIGFuZCBjYW4g
dGhlcmVmb3JlIGFsbG93IGNlcnRhaW4gb3B0aW1pemF0aW9ucy4KPiBIb3dldmVyLCB0bGJfZmlu
aXNoX21tdSgpIHNldHMgZnVsbG1tLCB3aGVuIGluIGZhY3QgaXQgd2FudCB0byBzYXkgdGhhdAo+
IHRoZSBUTEIgc2hvdWxkIGJlIGZ1bGx5IGZsdXNoZWQuCj4gCj4gQ2hhbmdlIHRsYl9maW5pc2hf
bW11KCkgdG8gc2V0IG5lZWRfZmx1c2hfYWxsIGFuZCBjaGVjayB0aGlzIGZsYWcgaW4KPiB0bGJf
Zmx1c2hfbW11X3RsYm9ubHkoKSB3aGVuIGRlY2lkaW5nIHdoZXRoZXIgYSBmbHVzaCBpcyBuZWVk
ZWQuCj4gCj4gQXQgdGhlIHNhbWUgdGltZSwgYnJpbmcgdGhlIGFybTY0IGZ1bGxtbSBvbiBwcm9j
ZXNzIGV4aXQgb3B0aW1pemF0aW9uIGJhY2suCj4gCj4gU2lnbmVkLW9mZi1ieTogTmFkYXYgQW1p
dCA8bmFtaXRAdm13YXJlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKaXNoZW5nIFpoYW5nIDxqc3po
YW5nQGtlcm5lbC5vcmc+Cj4gQ2M6IEFuZHJlYSBBcmNhbmdlbGkgPGFhcmNhbmdlQHJlZGhhdC5j
b20+Cj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gQ2M6
IEFuZHkgTHV0b21pcnNraSA8bHV0b0BrZXJuZWwub3JnPgo+IENjOiBEYXZlIEhhbnNlbiA8ZGF2
ZS5oYW5zZW5AbGludXguaW50ZWwuY29tPgo+IENjOiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGlu
ZnJhZGVhZC5vcmc+Cj4gQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+
IENjOiBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwub3JnPgo+IENjOiBZdSBaaGFvIDx5dXpoYW9A
Z29vZ2xlLmNvbT4KPiBDYzogTmljayBQaWdnaW4gPG5waWdnaW5AZ21haWwuY29tPgo+IENjOiB4
ODZAa2VybmVsLm9yZwo+IC0tLQo+IGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vdGxiLmggfCA1ICsr
KystCj4gaW5jbHVkZS9hc20tZ2VuZXJpYy90bGIuaCAgICB8IDIgKy0KPiBtbS9tbXVfZ2F0aGVy
LmMgICAgICAgICAgICAgIHwgMiArLQo+IDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNt
L3RsYi5oIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS90bGIuaAo+IGluZGV4IDg0NmM1NjM2ODlh
OC4uNjE2NGM1ZjNiNzhmIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdGxi
LmgKPiArKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3RsYi5oCj4gQEAgLTYyLDcgKzYyLDEw
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB0bGJfZmx1c2goc3RydWN0IG1tdV9nYXRoZXIgKnRsYikK
PiAJICogaW52YWxpZGF0aW5nIHRoZSB3YWxrLWNhY2hlLCBzaW5jZSB0aGUgQVNJRCBhbGxvY2F0
b3Igd29uJ3QKPiAJICogcmVhbGxvY2F0ZSBvdXIgQVNJRCB3aXRob3V0IGludmFsaWRhdGluZyB0
aGUgZW50aXJlIFRMQi4KPiAJICovCj4gLQlpZiAodGxiLT5mdWxsbW0pIHsKPiArCWlmICh0bGIt
PmZ1bGxtbSkKPiArCQlyZXR1cm47Cj4gKwo+ICsJaWYgKHRsYi0+bmVlZF9mbHVzaF9hbGwpIHsK
PiAJCWlmICghbGFzdF9sZXZlbCkKPiAJCQlmbHVzaF90bGJfbW0odGxiLT5tbSk7Cj4gCQlyZXR1
cm47Cj4gCgpUaGFua3MgZm9yIHB1bGxpbmcgbXkgcGF0Y2ggb3V0IG9mIHRoZSBhYnlzcywgYnV0
IHRoZSBjaHVuayBhYm92ZQpkaWQgbm90IGNvbWUgZnJvbSBteSBvbGQgcGF0Y2guCgpNeSBrbm93
bGVkZ2Ugb2YgYXJtNjQgaXMgYSBiaXQgbGltaXRlZCwgYnV0IHRoZSBjb2RlIGRvZXMgbm90IHNl
ZW0KdG8gbWF0Y2ggdGhlIGNvbW1lbnQsIHNvIGlmIGl0IGlzIGNvcnJlY3QgKHdoaWNoIEkgc3Ry
b25nbHkgZG91YnQpLAp0aGUgY29tbWVudCBzaG91bGQgYmUgdXBkYXRlZC4KClsxXSBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMTAxMzEwMDExMzIuMzM2ODI0Ny0yLW5hbWl0QHZtd2Fy
ZS5jb20vCgoKLS0gClRoaXMgZWxlY3Ryb25pYyBjb21tdW5pY2F0aW9uIGFuZCB0aGUgaW5mb3Jt
YXRpb24gYW5kIGFueSBmaWxlcyB0cmFuc21pdHRlZCAKd2l0aCBpdCwgb3IgYXR0YWNoZWQgdG8g
aXQsIGFyZSBjb25maWRlbnRpYWwgYW5kIGFyZSBpbnRlbmRlZCBzb2xlbHkgZm9yIAp0aGUgdXNl
IG9mIHRoZSBpbmRpdmlkdWFsIG9yIGVudGl0eSB0byB3aG9tIGl0IGlzIGFkZHJlc3NlZCBhbmQg
bWF5IGNvbnRhaW4gCmluZm9ybWF0aW9uIHRoYXQgaXMgY29uZmlkZW50aWFsLCBsZWdhbGx5IHBy
aXZpbGVnZWQsIHByb3RlY3RlZCBieSBwcml2YWN5IApsYXdzLCBvciBvdGhlcndpc2UgcmVzdHJp
Y3RlZCBmcm9tIGRpc2Nsb3N1cmUgdG8gYW55b25lIGVsc2UuIElmIHlvdSBhcmUgCm5vdCB0aGUg
aW50ZW5kZWQgcmVjaXBpZW50IG9yIHRoZSBwZXJzb24gcmVzcG9uc2libGUgZm9yIGRlbGl2ZXJp
bmcgdGhlIAplLW1haWwgdG8gdGhlIGludGVuZGVkIHJlY2lwaWVudCwgeW91IGFyZSBoZXJlYnkg
bm90aWZpZWQgdGhhdCBhbnkgdXNlLCAKY29weWluZywgZGlzdHJpYnV0aW5nLCBkaXNzZW1pbmF0
aW9uLCBmb3J3YXJkaW5nLCBwcmludGluZywgb3IgY29weWluZyBvZiAKdGhpcyBlLW1haWwgaXMg
c3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IHJlY2VpdmVkIHRoaXMgZS1tYWlsIGluIGVycm9y
LCAKcGxlYXNlIHJldHVybiB0aGUgZS1tYWlsIHRvIHRoZSBzZW5kZXIsIGRlbGV0ZSBpdCBmcm9t
IHlvdXIgY29tcHV0ZXIsIGFuZCAKZGVzdHJveSBhbnkgcHJpbnRlZCBjb3B5IG9mIGl0LgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
