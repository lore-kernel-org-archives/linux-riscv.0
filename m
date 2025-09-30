Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C3DCAC5B9
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 01:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sDsO228+8LOX8LJrov3Nak2p/GhimM3qAfkWvE8B0ag=; b=4/FBMv6jg6BHpw
	3291kf/PWeScTdX/ztzjmEBsQkL/0nI5cnN8RCv6Y11g08zo8N9emHLS6VgfUMi6n61Ug/VeXZpso
	3ppunwpYZNm6nUDml3YEmUv2CA6co/jCMJxZaBNgYZPFZEGa0z+o9VP/XuVJwgzjPSAZasikzHg/f
	cFBT4ahRyJjbCY8IfyLW8OcgaW59hYgQQ7dCsB6itd39/isD99MhmdhdC1jre0UROGiTWpd71rWsa
	AcC/hFYQVBhuJFv0pYIPPS3Rhq/62+s70GTDnrZ4vAP8VpGwXNEcOA5yw/M1wpUa7NXbwILfcSW3n
	IBPr3umLhrSgUcirvoJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3PYf-00000003pgg-2Yel;
	Tue, 30 Sep 2025 01:53:37 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3PYc-00000003pf2-2gFb
	for linux-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 01:53:36 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-6494330b1b9so236256eaf.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Sep 2025 18:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1759197210; x=1759802010; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHamc5L5wTvTPFxS1t1gdHiPJZFL4Y2ngP4edhfwGzA=;
        b=HxJn0ajM7FEZEpzjObYwwmIc+Z3kNNuxzNxcoeGUJr0SO6xcGhmJZoZGNFtOoinNxD
         5PMUE2AP++U0zMd0tkHJp3krhXpqkHGsWrQQzWEfFmLnlsa46UqXhfR0MuoAN1NIS2I3
         rsjrhqgIuDcKTUBTD7Pbs2gIfinxc+AhsrqfF+m+iGlXmLXSfziJj0jXRImysWQwg1ez
         54aZnC3uGtEjzoxYPWOUrghFDgmdjwNK9n/6bpuyAyb5+djoNSNSEwmcgdEgA+smM9JO
         jR00EGfwr6YligOd49nLqA9ysaD8nZ778nZc5qn+rPCVyrnUjrNuY5UvT9fo/KVldOXs
         3Mhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759197210; x=1759802010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gHamc5L5wTvTPFxS1t1gdHiPJZFL4Y2ngP4edhfwGzA=;
        b=r2SnjPghIzotkf+DEKFT2E6/+HsNSXrC8sQX9QRf8ZCUW3D83umdPYkFfluhHzz9yQ
         Vu8UIe+zXBEg3Bgha5lH47YE2fxzl6viuI7qkS03r5ZWwh9zJk5s1BcVZ3eQoBPtL3Jm
         AVD2wqdpXO8sn8mTUovnTT7iaqt8HJQf3R2kdowPg4LMCyh13n86wHNr6UKsGssDabXA
         824/NQ+yN7Vf4fcgQqr8IYBMC4OzpBeWid3NsNyxjibQcqwABK6i1wTO8K4lWz9ka1lz
         FlfIBEhNRZRsLWairRSGnqKxfjCETN/papGIAQI0TFglRp+br2DVFyTFfa4o7mjgCws1
         oF6w==
X-Forwarded-Encrypted: i=1; AJvYcCVk/PhPPIAm7CY9Sg/LCRKACPIOaBnU7X9+gYop3tmQq3yDR95z6GNeaWGIDcXHEEMY3Um++Zxo36g55g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzoLPh8x6TS/iwafOjDzIWd71ZJvb5oswREuLC8l2JJgasRQCg5
	EfDmof+FfymFWwi/y3nUu2xP3/J8fcd/+JI5GWNF9+jGG9WNXbVC4is29Feqpt8y/p2M5V5PaM/
	QJcdDoikKcn8PvGBJPtFqRC2e9RGG4EySYQ2UxsjKXA==
X-Gm-Gg: ASbGncvHs87Xjc6cWcjz/FQQ+9ffaIItiNQp3t2dnqvjOxkR8+J1zFmcvv/+jZk2BbO
	4lrXab4LLA08aOySduxo1XTaYeNZchWvCsLRRslnzZ21/ba+KY7KnfW/PTuE5Oc614IhL6aFY33
	EWHWY+SC6d37v32nKnV8tev1EcJFfKaMP6JoSuMb+QfNuyQuECYbL4lEnxED21qzXKf9ES5y5QL
	C1wb5IMONWos8mKf69tt4xprOp4bjzUU0aTPaDOCm6q4kNvc09k7+w=
X-Google-Smtp-Source: AGHT+IFF+H5NN0a3VCV7KK9x7DfqmNVVmY1tvARIlVfpRzzuFTMLMMebmMXrJVNqsu5Vtt1RgIzJyqFijRAfWLNMznY=
X-Received: by 2002:a05:6820:5204:b0:644:953b:fc04 with SMTP id
 006d021491bc7-644953c01ddmr3120884eaf.1.1759197209849; Mon, 29 Sep 2025
 18:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250925084806.89715-1-cuiyunhui@bytedance.com>
 <20250925084806.89715-2-cuiyunhui@bytedance.com> <CAD=FV=VZLYqPQCOEhbH4QtndeG5e1-0wey24fgYNTeFiqd8qJg@mail.gmail.com>
 <CAEEQ3wnwNdTgt6ByHCzM43fhZMLSxwXvYx-AGBpsktraXqif2Q@mail.gmail.com>
 <CAD=FV=X6Xv_WYPMXKtOWLJX7skCoQmia3JbQej_u38qxqAbqDg@mail.gmail.com>
 <CAEEQ3wn0UckgNTJCPCNDtHW8DwWAJR1PXURvH57yfHATYqs7Gw@mail.gmail.com> <CAD=FV=XoUw6HWoFLMcgyHhYm7oeTOXCAyvBdpOghggmdvYzp6Q@mail.gmail.com>
In-Reply-To: <CAD=FV=XoUw6HWoFLMcgyHhYm7oeTOXCAyvBdpOghggmdvYzp6Q@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 30 Sep 2025 09:53:19 +0800
X-Gm-Features: AS18NWAw7c1iZ6ACt20cNcuqSJALqhbqwUHFleou105FkMTBcbtF3qtTJwuUi-4
Message-ID: <CAEEQ3w==Ekffs4+Z55AXMV52f+8ht1pWm3JexXCSiB7T6rzppA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 1/2] watchdog: move arm64 watchdog_hld
 into common code
To: Doug Anderson <dianders@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	ziqianlu@bytedance.com, akpm@linux-foundation.org, alex@ghiti.fr, 
	anup@brainfault.org, aou@eecs.berkeley.edu, atish.patra@linux.dev, 
	catalin.marinas@arm.com, johannes@sipsolutions.net, lihuafei1@huawei.com, 
	mark.rutland@arm.com, masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_185334_876230_6E2272A2 
X-CRM114-Status: GOOD (  42.03  )
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

SGkgRG91ZywKCk9uIFR1ZSwgU2VwIDMwLCAyMDI1IGF0IDY6NTbigK9BTSBEb3VnIEFuZGVyc29u
IDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiBTYXQsIFNlcCAy
NywgMjAyNSBhdCA3OjM44oCvUE0geXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+
IHdyb3RlOgo+ID4KPiA+IEhpIERvdWcsCj4gPgo+ID4gT24gU2F0LCBTZXAgMjcsIDIwMjUgYXQg
NDo1OOKAr0FNIERvdWcgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4g
PiA+Cj4gPiA+IEhpLAo+ID4gPgo+ID4gPiBPbiBGcmksIFNlcCAyNiwgMjAyNSBhdCAyOjM34oCv
QU0geXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4g
PiA+ID4gSGkgRG91ZywKPiA+ID4gPgo+ID4gPiA+IE9uIEZyaSwgU2VwIDI2LCAyMDI1IGF0IDQ6
MDDigK9BTSBEb3VnIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4g
PiA+ID4KPiA+ID4gPiA+IEhpLAo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIFRodSwgU2VwIDI1LCAy
MDI1IGF0IDE6NDjigK9BTSBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3Jv
dGU6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEBAIC0xNyw2ICsxNyw3IEBACj4gPiA+ID4gPiA+
ICAjaW5jbHVkZSA8bGludXgvY3B1X3BtLmg+Cj4gPiA+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgv
ZXhwb3J0Lmg+Cj4gPiA+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gPiA+ID4g
PiA+ICsjaW5jbHVkZSA8bGludXgvbm1pLmg+Cj4gPiA+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgv
cGVyZi9hcm1fcG11Lmg+Cj4gPiA+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ID4g
PiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L3NjaGVkL2Nsb2NrLmg+Cj4gPiA+ID4gPiA+IEBAIC02
OTYsMTAgKzY5NywxMiBAQCBzdGF0aWMgaW50IGFybXBtdV9nZXRfY3B1X2lycShzdHJ1Y3QgYXJt
X3BtdSAqcG11LCBpbnQgY3B1KQo+ID4gPiA+ID4gPiAgICAgICAgIHJldHVybiBwZXJfY3B1KGh3
X2V2ZW50cy0+aXJxLCBjcHUpOwo+ID4gPiA+ID4gPiAgfQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiAtYm9vbCBhcm1fcG11X2lycV9pc19ubWkodm9pZCkKPiA+ID4gPiA+ID4gKyNpZmRlZiBDT05G
SUdfSEFSRExPQ0tVUF9ERVRFQ1RPUl9QRVJGCj4gPiA+ID4gPiA+ICtib29sIGFyY2hfcGVyZl9u
bWlfaXNfYXZhaWxhYmxlKHZvaWQpCj4gPiA+ID4gPiA+ICB7Cj4gPiA+ID4gPiA+ICAgICAgICAg
cmV0dXJuIGhhc19ubWk7Cj4gPiA+ID4gPiA+ICB9Cj4gPiA+ID4gPiA+ICsjZW5kaWYKPiA+ID4g
PiA+Cj4gPiA+ID4gPiBTaG91bGQgdGhlIHByZXZpb3VzIGNvbW1lbnQgbW92ZSBoZXJlLCBBS0E6
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gLyoKPiA+ID4gPiA+ICAqIGhhcmRsb2NrdXBfZGV0ZWN0b3Jf
cGVyZl9pbml0KCkgd2lsbCBzdWNjZXNzIGV2ZW4gaWYgUHNldWRvLU5NSSB0dXJucyBvZmYsCj4g
PiA+ID4KPiA+ID4gPiBPa2F5LCB3ZSBhbHNvIG5lZWQgdG8gY2hhbmdlIGl0IHRvIOKAnHdhdGNo
ZG9nX2hhcmRsb2NrdXBfcHJvYmUoKeKAnQo+ID4gPiA+Cj4gPiA+ID4gPiAgKiBob3dldmVyLCB0
aGUgcG11IGludGVycnVwdHMgd2lsbCBhY3QgbGlrZSBhIG5vcm1hbCBpbnRlcnJ1cHQgaW5zdGVh
ZCBvZgo+ID4gPiA+ID4gICogTk1JIGFuZCB0aGUgaGFyZGxvY2t1cCBkZXRlY3RvciB3b3VsZCBi
ZSBicm9rZW4uCj4gPiA+ID4gPiAqLwo+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICtz
dGF0aWMgaW50IF9faW5pdCBpbml0X3dhdGNoZG9nX2ZyZXFfbm90aWZpZXIodm9pZCkKPiA+ID4g
PiA+ID4gK3sKPiA+ID4gPiA+ID4gKyAgICAgICByZXR1cm4gY3B1ZnJlcV9yZWdpc3Rlcl9ub3Rp
Zmllcigmd2F0Y2hkb2dfZnJlcV9ub3RpZmllciwKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBDUFVGUkVRX1BPTElDWV9OT1RJRklFUik7Cj4gPiA+
ID4gPgo+ID4gPiA+ID4gSSB0aGluayB5b3UgbmVlZCB0byBkbyBzb21ldGhpbmcgdG8gcHJldmVu
dCB0aGlzIGZyb20gaGFwcGVuaW5nIG9uIGFueQo+ID4gPiA+ID4gcGxhdGZvcm1zIHRoYXQgb3Zl
cnJpZGUgaHdfbm1pX2dldF9zYW1wbGVfcGVyaW9kKCksIHJpZ2h0PyBUaGVzZQo+ID4gPiA+ID4g
Y3B1ZnJlcSBub3RpZmllcnMgd2lsbCBiZSB1c2VsZXNzIGluIHRoYXQgY2FzZS4uLgo+ID4gPiA+
Cj4gPiA+ID4gSSB1bmRlcnN0YW5kIHRoaXMgaXMgbm90IGEgcHJvYmxlbS4gd2F0Y2hkb2dfcGVy
ZiB1c2VzCj4gPiA+ID4gUEVSRl9DT1VOVF9IV19DUFVfQ1lDTEVTLCB3aGljaCBtZWFucyBpdCBp
cyBpbmhlcmVudGx5IGxpbWl0ZWQgYnkgdGhlCj4gPiA+ID4gQ1BVJ3MgbWFpbiBmcmVxdWVuY3ku
IEFmdGVyIHdlIG1ha2Ugc3VjaCBhIGNoYW5nZSwgYSBsYXJnZXIgdmFsdWUgbWF5Cj4gPiA+ID4g
YmUgdXNlZCBhcyB0aGUgcGVyaW9kLCBzbyB0aGUgTk1JIHBlcmlvZCB3aWxsIGJlY29tZSBsb25n
ZXIsIGJ1dCB0aGlzCj4gPiA+ID4gdmFsdWUgd2lsbCBub3QgY2hhbmdlIGFmdGVyIHRoZSBzeXN0
ZW0gc3RhcnRzLgo+ID4gPgo+ID4gPiBJJ20gbm90IHN1cmUgSSBmb2xsb3cuIE9uIHg4NiwgaHdf
bm1pX2dldF9zYW1wbGVfcGVyaW9kKCkgaXM6Cj4gPiA+Cj4gPiA+IHU2NCBod19ubWlfZ2V0X3Nh
bXBsZV9wZXJpb2QoaW50IHdhdGNoZG9nX3RocmVzaCkKPiA+ID4gewo+ID4gPiAgIHJldHVybiAo
dTY0KShjcHVfa2h6KSAqIDEwMDAgKiB3YXRjaGRvZ190aHJlc2g7Cj4gPiA+IH0KPiA+Cj4gPiBJ
IGhhdmUgYWRkZWQgdGhlIG1haW50YWluZXJzIGZvciBhcmNoL3g4Ni4KPiA+Cj4gPiAxLiBjcHVf
a2h6IGNhbiBiZSB1bmRlcnN0b29kIGFzIHJldHVybmluZyB0aGUgYmFzZSBvcGVyYXRpbmcgZnJl
cXVlbmN5Cj4gPiBvZiBhIENQVSwgc3VjaCBhcyAyLjNHSHouIEluIHByYWN0aWNlLCB0aGUgQ1BV
J3MgY29yZSBmcmVxdWVuY3kgbWF5Cj4gPiBkb3duY2xvY2sgdG8gODAwTUh6IHVuZGVyIGxvdyBs
b2FkIGFuZCBvdmVyY2xvY2sgdG8gNC40R0h6IHVuZGVyIGhpZ2gKPiA+IGxvYWQuCj4gPgo+ID4g
Mi4gQmVjYXVzZSB0aGUgZXZlbnQgcHJvdmlkZWQgdG8gdGhlIFBNVSBoYXMgdGhlCj4gPiBQRVJG
X0NPVU5UX0hXX0NQVV9DWUNMRVMgYXR0cmlidXRlLCBhbmQgdGhlIGNvdW50ZXIncyB2YWx1ZSBp
cyBiYXNlZAo+ID4gb24gMi4zR0h6LCB0aGUgZXhlY3V0aW9uIGN5Y2xlIG9mIHdhdGNoZG9nX292
ZXJmbG93X2NhbGxiYWNrKCkgaXMgbm90Cj4gPiBmaXhlZDsgaXQgdmFyaWVzIHdpdGggdGhlIENQ
VSdzIGNvcmUgZnJlcXVlbmN5LiBXaGVuIHRoZSBDUFUgcnVucyBhdCBhCj4gPiBmcmVxdWVuY3kg
aGlnaGVyIHRoYW4gMi4zR0h6LCB0aGUgTk1JIGN5Y2xlIHdpbGwgc2hvcnRlbjsgb3RoZXJ3aXNl
LAo+ID4gaXQgd2lsbCBsZW5ndGhlbi4KPiA+Cj4gPiAzLiBBZnRlciBvdXIgbW9kaWZpY2F0aW9u
LCBpZiB0aGUgYXJjaGl0ZWN0dXJlIGlzIG5vdCBpbnRlZ3JhdGVkIHdpdGgKPiA+IGNwdWZyZXEs
IGl0IHJldHVybnMgMCBhbmQgd2lsbCBub3QgdXBkYXRlIHRoZSBjeWNsZS4gSWYgaW50ZWdyYXRl
ZAo+ID4gd2l0aCBjcHVmcmVxLCBpdCByZXR1cm5zIHRoZSBtYXhpbXVtIGZyZXF1ZW5jeSBzdXBw
b3J0ZWQgYnkgdGhlIENQVSwKPiA+IHNvIHRoZSBOTUkgY3ljbGUgaXMgb25seSBzbGlnaHRseSBs
ZW5ndGhlbmVkLCB3aXRoIG5vIGltcGFjdCBvbiB0aGUKPiA+IGFjdHVhbCBoYXJkbG9ja3VwIGRl
dGVjdGlvbiBmdW5jdGlvbi4KPiA+Cj4gPiA0LiBJIGhhdmUgYWxzbyBjb25kdWN0ZWQgdGVzdHM6
Cj4gPiBzdHJlc3MtbmcgLS1jcHUgMSAtLXRhc2tzZXQgMSAtLWNwdS1sb2FkIDgwCj4gPiBlY2hv
IDgwMDAwMCA+IHNjYWxpbmdfbWF4X2ZyZXEKPiA+IHR1cmJvc3RhdCBzaG93cyB0aGF0IEJ6eV9N
SHogYW5kIFRTQ19NSHogYXJlIDgwMCBhbmQgMjMwMCByZXNwZWN0aXZlbHkuCj4gPiBBbmQgdGhl
IE5NSSBjeWNsZSBiZWNhbWUgYXBwcm94aW1hdGVseSAzMCBzZWNvbmRzOgo+ID4gWyAyMzA5LjQ0
Mjc0M10gTk1JIHdhdGNoZG9nOiAtLS0tLS0gd2F0Y2hkb2cgb3ZlcmZsb3cgY2FsbGJhY2ssIGNw
dSA9IDEKPiA+IFsgMjM0MS41MjYwMzJdIE5NSSB3YXRjaGRvZzogLS0tLS0tIHdhdGNoZG9nIG92
ZXJmbG93IGNhbGxiYWNrLCBjcHUgPSAxCj4KPiBXaGV0aGVyIG9yIG5vdCBoYXZpbmcgeDg2IGFu
ZCBwb3dlcnBjIHN0YXJ0IGxvb2tpbmcgYXQgY3B1ZnJlcSBpcyBhbgo+IGltcHJvdmVtZW50LCBj
ZXJ0YWlubHkgaXQgaXMgYSBjaGFuZ2UgaW4gYmVoYXZpb3IsIHJpZ2h0PyBJZiB3ZSdyZQo+IHJl
YWxseSBjaGFuZ2luZyB0aGUgYmVoYXZpb3IgaGVyZSB0aGVuIHRoZSBjb21taXQgc3ViamVjdCBh
bmQgY29tbWl0Cj4gbWVzc2FnZSBuZWVkIHRvIG1lbnRpb24gdGhpcy4gUmlnaHQgbm93IHRoaXMg
aXMgYmlsbGVkIGFzIGEgc2ltcGxlCj4gcmVuYW1lLi4uCj4KPiBJIGRvbid0IHBlcnNvbmFsbHkg
aGF2ZSBsb3RzIG9mIGV4cGVyaWVuY2Ugd2l0aCB4ODYgY3B1ZnJlcSBidXQgSSBkbwo+IGtub3cg
aXQgZG9lc24ndCB3b3JrIHF1aXRlIHRoZSBzYW1lIGFzIGhvdyBpdCBkb2VzIG9uIGFybS4gSXQg
d291bGQKPiBkZWZpbml0ZWx5IGJlIGdvb2QgdG8gZ2V0IHNvbWVvbmUgb24geDg2IC8gcG93ZXJw
YyB0byBtYWtlIHN1cmUgdGhhdAo+IHRoZXkgYXJlIGhhcHB5IHdpdGggdGhpcy4gLi4ub3IgeW91
IGp1c3Qga2VlcCBtYWtpbmcgaXQgd29yayB0aGUgd2F5Cj4gaXQgZGlkIGJlZm9yZSBhbmQgdGhl
biB5b3UgZG9uJ3QgaGF2ZSB0byB3b3JyeSBhYm91dCBnZXR0aW5nIGFueQo+IGJ1eS1pbiBmcm9t
IHg4NiAvIHBvd2VycGMgZm9sa3MuIFVwIHRvIHlvdSwgSSBndWVzcy4KCldlbGwsIEkgZnVsbHkg
YWdyZWUgd2l0aCB5b3VyIHN1Z2dlc3Rpb24uIFdoYXQgSSBjYW4gdGhpbmsgb2YgZm9yIG5vdwpp
cyB3cmFwcGluZyB0aGUgbmV3bHkgYWRkZWQgY29udGVudCB3aXRoICNpZiBkZWZpbmVkKENPTkZJ
R19BUk02NCkgfHwKZGVmaW5lZChDT05GSUdfUklTQ1YpLiBEbyB5b3UgaGF2ZSBhIG1vcmUgZWxl
Z2FudCBhcHByb2FjaCB0bwpyZWNvbW1lbmQ/Cgo+Cj4gTm90ZSB0aGF0IGZvbGtzIG9uIHg4NiBo
YXZlIGRlZmluaXRlbHkgaGFkIHRvIGRlYWwgd2l0aCB0dXJibyBtb2RlCj4gYmVmb3JlLiAgU2Vl
IGNvbW1pdCA3ZWRhZWI2ODQxZGYgKCJrZXJuZWwvd2F0Y2hkb2c6IFByZXZlbnQgZmFsc2UKPiBw
b3NpdGl2ZXMgd2l0aCB0dXJibyBtb2RlcyIpLgo+Cj4gLURvdWcKPgoKVGhhbmtzLApZdW5odWkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
