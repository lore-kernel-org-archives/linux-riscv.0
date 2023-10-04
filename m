Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC9CE7B5E5
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 10:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/aEaCCAtqTBf1JEG97maUG8R1JvECL6zNt95AiCQBe4=; b=Z+rCcstTqIdCWR
	wl698jPgeI+kGbaX+54HphbQlXuPpyjsvvIexwQ2Yds+BqJLAvfRrYeuFVagrtn7zYYakn5ozp4mk
	icC0tTEg84vGsLugUq74aS7VcRujAONRnE2eS5cMc7qr59/Mth04MnQCOnGnxLNI3NMN1s2t5W8dl
	MvUP9tpr8jpTr0AtdtMWuda04tyuBPUaERwPnI1z/osUjeqoqW2Kq8yMavP1fU29hxq7YThLiQXiB
	AjH/lZVPOhlrC3xqe6VmTz5fiKaev+6PIaijblKrYH+ndbXCSfJ0LVRZOZKuQ5UNLpP2CPnLnbX3U
	8/ZAn3qsMsJ9Wuh8sAoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnzBu-00HMoY-2y;
	Wed, 04 Oct 2023 10:33:18 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnzBs-00HMnx-0C
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 10:33:17 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3515aad4a87so7458575ab.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 03:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696415594; x=1697020394; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IPdQhoPm+GbgN7ZVx8L+id2JS3S18F2GF5veflK7uBA=;
        b=l7k7A/1W7aLCZV3do93ZnX98NZ43cq0I/5JSu01vbdWi3NaErlZa2f/7/h9ebY2rYK
         DZ932J2u7pjUp1+T88YKq5lFRKDWlHp5qrJrpzp4v/GAlkIzdehcwuna8e+yIj4XPj7O
         xWwyiaKKUJpE7W29PB8699KnOiFLHn7gS2quPZ90I543khc3pC2vclC5V4Y3N3E9wSNA
         O8E4YABZWXV9IoQ7x4CBqM6xnB6Vp+vrCzKDOW+/MmzgKJD3b6PSKYWJQXkSnB/mKFh5
         eS93PQ12CSWo1cqP8sgPhTHCXkBdu1aAY4pYS3fGStHSnIRynrC13Y8LgB8/uVgAQyK6
         cmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696415594; x=1697020394;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IPdQhoPm+GbgN7ZVx8L+id2JS3S18F2GF5veflK7uBA=;
        b=A1H1kaQ/DCXKmnUpaBnYrs7vdcl9ixdvsF+snoHEJ/8kHoAeoXnsZnmsUNaB9VI7BZ
         B/5S4V1hJ4wPKWIKnnyNgovXG+eB8/iU0O4BLRFJNJR1AMXaQTdlLi/xCPlI3mbr/G2x
         6nWP71IYVTnBttYesJrquYvR7eR06gee5e9AUm+EHOtprcBybvL+bCduRg3kL7gDk29o
         NjvM3oMlYfVz+l95oiu4K35nhokdIoryl9/6+l11hX9aT3zrXWFy6WbkuTJ6KgvU1gdt
         gPqQPjpYKBCvI5jsuND4a4vsaPHPATiOinJKEJymS2iMh+mYpGL0JS4OHBJz54+P0yvh
         xzGA==
X-Gm-Message-State: AOJu0Yz8Kw7qm4EJ3rwn+VLNdvTCglCzRVI8BH0nUnP/ApNcob3pdwol
	t9xAZxRShpSRgFfwdYowyOduHQ==
X-Google-Smtp-Source: AGHT+IEqVN0kHBmtshrFLo8YgWgHUv1tXSbSnje4gJg+PZFNCOW/VIupCwTLHveBwXWiFMcFTC7mew==
X-Received: by 2002:a05:6e02:219b:b0:351:2053:c6cd with SMTP id j27-20020a056e02219b00b003512053c6cdmr2074083ila.3.1696415593914;
        Wed, 04 Oct 2023 03:33:13 -0700 (PDT)
Received: from sunil-laptop ([106.51.188.78])
        by smtp.gmail.com with ESMTPSA id a7-20020a92d107000000b0034f6f2eca21sm898204ilb.69.2023.10.04.03.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 03:33:13 -0700 (PDT)
Date: Wed, 4 Oct 2023 16:03:02 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v2 -next 1/4] RISC-V: ACPI: Enhance acpi_os_ioremap with
 MMIO remapping
Message-ID: <ZR0/Xis6Bzh+iAGt@sunil-laptop>
References: <20230927170015.295232-1-sunilvl@ventanamicro.com>
 <20230927170015.295232-2-sunilvl@ventanamicro.com>
 <CAHVXubjp_hTS7so1eO4V6nwYEqr1ruvMt05u-Y3efDgvP2YNHg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHVXubjp_hTS7so1eO4V6nwYEqr1ruvMt05u-Y3efDgvP2YNHg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_033316_121392_0AD5B08A 
X-CRM114-Status: GOOD (  37.29  )
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

SGkgQWxleCwKCk9uIFR1ZSwgT2N0IDAzLCAyMDIzIGF0IDA4OjUzOjEyUE0gKzAyMDAsIEFsZXhh
bmRyZSBHaGl0aSB3cm90ZToKPiBIaSBTdW5pbCwKPiAKPiBPbiBXZWQsIFNlcCAyNywgMjAyMyBh
dCA3OjAw4oCvUE0gU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+
ID4KPiA+IEVuaGFuY2UgdGhlIGFjcGlfb3NfaW9yZW1hcCgpIHRvIHN1cHBvcnQgb3ByZWdpb25z
IGluIE1NSU8gc3BhY2UuIEFsc28sCj4gPiBoYXZlIHN0cmljdCBjaGVja3MgdXNpbmcgRUZJIG1l
bW9yeSBtYXAgdG8gYWxsb3cgcmVtYXBwaW5nIHRoZSBSQU0gc2ltaWxhcgo+ID4gdG8gYXJtNjQu
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5j
b20+Cj4gPiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNv
bT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICB8ICAxICsKPiA+ICBhcmNo
L3Jpc2N2L2tlcm5lbC9hY3BpLmMgfCA4NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA4NiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jp
c2N2L0tjb25maWcKPiA+IGluZGV4IGQ2MDdhYjBmN2M2ZC4uYWMwMzljZjhhZjdhIDEwMDY0NAo+
ID4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcK
PiA+IEBAIC0zOSw2ICszOSw3IEBAIGNvbmZpZyBSSVNDVgo+ID4gICAgICAgICBzZWxlY3QgQVJD
SF9IQVNfVElDS19CUk9BRENBU1QgaWYgR0VORVJJQ19DTE9DS0VWRU5UU19CUk9BRENBU1QKPiA+
ICAgICAgICAgc2VsZWN0IEFSQ0hfSEFTX1VCU0FOX1NBTklUSVpFX0FMTAo+ID4gICAgICAgICBz
ZWxlY3QgQVJDSF9IQVNfVkRTT19EQVRBCj4gPiArICAgICAgIHNlbGVjdCBBUkNIX0tFRVBfTUVN
QkxPQ0sKPiAKPiBTaG91bGRuJ3Qgd2UgcmVzdHJpY3QgdGhpcyB0byBBQ1BJPwo+IApTdXJlLCBM
ZXQgbWUgdXBkYXRlLgoKPiA+ICAgICAgICAgc2VsZWN0IEFSQ0hfT1BUSU9OQUxfS0VSTkVMX1JX
WCBpZiBBUkNIX0hBU19TVFJJQ1RfS0VSTkVMX1JXWAo+ID4gICAgICAgICBzZWxlY3QgQVJDSF9P
UFRJT05BTF9LRVJORUxfUldYX0RFRkFVTFQKPiA+ICAgICAgICAgc2VsZWN0IEFSQ0hfU1RBQ0tX
QUxLCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvYWNwaS5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvYWNwaS5jCj4gPiBpbmRleCA1NmNiMmM5ODZjNDguLmU2MTllZGM4YjBjYyAxMDA2
NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2FjcGkuYwo+ID4gKysrIGIvYXJjaC9yaXNj
di9rZXJuZWwvYWNwaS5jCj4gPiBAQCAtMTQsOSArMTQsMTAgQEAKPiA+ICAgKi8KPiA+Cj4gPiAg
I2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvZWZpLmg+Cj4gPiAg
I2luY2x1ZGUgPGxpbnV4L2lvLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L21lbWJsb2NrLmg+Cj4g
PiAgI2luY2x1ZGUgPGxpbnV4L3BjaS5oPgo+ID4gLSNpbmNsdWRlIDxsaW51eC9lZmkuaD4KPiA+
Cj4gPiAgaW50IGFjcGlfbm9pcnEgPSAxOyAgICAgICAgICAgIC8qIHNraXAgQUNQSSBJUlEgaW5p
dGlhbGl6YXRpb24gKi8KPiA+ICBpbnQgYWNwaV9kaXNhYmxlZCA9IDE7Cj4gPiBAQCAtMjE3LDcg
KzIxOCw4OSBAQCB2b2lkIF9faW5pdCBfX2FjcGlfdW5tYXBfdGFibGUodm9pZCBfX2lvbWVtICpt
YXAsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKPiA+Cj4gPiAgdm9pZCBfX2lvbWVtICphY3BpX29zX2lv
cmVtYXAoYWNwaV9waHlzaWNhbF9hZGRyZXNzIHBoeXMsIGFjcGlfc2l6ZSBzaXplKQo+ID4gIHsK
PiA+IC0gICAgICAgcmV0dXJuICh2b2lkIF9faW9tZW0gKiltZW1yZW1hcChwaHlzLCBzaXplLCBN
RU1SRU1BUF9XQik7Cj4gPiArICAgICAgIGVmaV9tZW1vcnlfZGVzY190ICptZCwgKnJlZ2lvbiA9
IE5VTEw7Cj4gPiArICAgICAgIHBncHJvdF90IHByb3Q7Cj4gPiArCj4gPiArICAgICAgIGlmIChX
QVJOX09OX09OQ0UoIWVmaV9lbmFibGVkKEVGSV9NRU1NQVApKSkKPiA+ICsgICAgICAgICAgICAg
ICByZXR1cm4gTlVMTDsKPiA+ICsKPiA+ICsgICAgICAgZm9yX2VhY2hfZWZpX21lbW9yeV9kZXNj
KG1kKSB7Cj4gPiArICAgICAgICAgICAgICAgdTY0IGVuZCA9IG1kLT5waHlzX2FkZHIgKyAobWQt
Pm51bV9wYWdlcyA8PCBFRklfUEFHRV9TSElGVCk7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAg
aWYgKHBoeXMgPCBtZC0+cGh5c19hZGRyIHx8IHBoeXMgPj0gZW5kKQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgY29udGludWU7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgaWYgKHBoeXMg
KyBzaXplID4gZW5kKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBwcl93YXJuKEZXX0JV
RyAicmVxdWVzdGVkIHJlZ2lvbiBjb3ZlcnMgbXVsdGlwbGUgRUZJIG1lbW9yeSByZWdpb25zXG4i
KTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ID4gKyAgICAgICAg
ICAgICAgIH0KPiA+ICsgICAgICAgICAgICAgICByZWdpb24gPSBtZDsKPiA+ICsgICAgICAgICAg
ICAgICBicmVhazsKPiA+ICsgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICAvKgo+ID4gKyAgICAg
ICAgKiBJdCBpcyBmaW5lIGZvciBBTUwgdG8gcmVtYXAgcmVnaW9ucyB0aGF0IGFyZSBub3QgcmVw
cmVzZW50ZWQgaW4gdGhlCj4gPiArICAgICAgICAqIEVGSSBtZW1vcnkgbWFwIGF0IGFsbCwgYXMg
aXQgb25seSBkZXNjcmliZXMgbm9ybWFsIG1lbW9yeSwgYW5kIE1NSU8KPiA+ICsgICAgICAgICog
cmVnaW9ucyB0aGF0IHJlcXVpcmUgYSB2aXJ0dWFsIG1hcHBpbmcgdG8gbWFrZSB0aGVtIGFjY2Vz
c2libGUgdG8KPiA+ICsgICAgICAgICogdGhlIEVGSSBydW50aW1lIHNlcnZpY2VzLgo+ID4gKyAg
ICAgICAgKi8KPiA+ICsgICAgICAgcHJvdCA9IFBBR0VfS0VSTkVMX0lPOwo+ID4gKyAgICAgICBp
ZiAocmVnaW9uKSB7Cj4gPiArICAgICAgICAgICAgICAgc3dpdGNoIChyZWdpb24tPnR5cGUpIHsK
PiA+ICsgICAgICAgICAgICAgICBjYXNlIEVGSV9MT0FERVJfQ09ERToKPiA+ICsgICAgICAgICAg
ICAgICBjYXNlIEVGSV9MT0FERVJfREFUQToKPiA+ICsgICAgICAgICAgICAgICBjYXNlIEVGSV9C
T09UX1NFUlZJQ0VTX0NPREU6Cj4gPiArICAgICAgICAgICAgICAgY2FzZSBFRklfQk9PVF9TRVJW
SUNFU19EQVRBOgo+ID4gKyAgICAgICAgICAgICAgIGNhc2UgRUZJX0NPTlZFTlRJT05BTF9NRU1P
Ulk6Cj4gPiArICAgICAgICAgICAgICAgY2FzZSBFRklfUEVSU0lTVEVOVF9NRU1PUlk6Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBpZiAobWVtYmxvY2tfaXNfbWFwX21lbW9yeShwaHlzKSB8
fAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICFtZW1ibG9ja19pc19yZWdpb25fbWVt
b3J5KHBoeXMsIHNpemUpKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBy
X3dhcm4oRldfQlVHICJyZXF1ZXN0ZWQgcmVnaW9uIGNvdmVycyBrZXJuZWwgbWVtb3J5XG4iKTsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICB9Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAv
Kgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICogTWFwcGluZyBrZXJuZWwgbWVtb3J5IGlz
IHBlcm1pdHRlZCBpZiB0aGUgcmVnaW9uIGluCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
KiBxdWVzdGlvbiBpcyBjb3ZlcmVkIGJ5IGEgc2luZ2xlIG1lbWJsb2NrIHdpdGggdGhlCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgKiBOT01BUCBhdHRyaWJ1dGUgc2V0OiB0aGlzIGVuYWJs
ZXMgdGhlIHVzZSBvZiBBQ1BJCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgKiB0YWJsZSBv
dmVycmlkZXMgcGFzc2VkIHZpYSBpbml0cmFtZnMuCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgKiBUaGlzIHBhcnRpY3VsYXIgdXNlIGNhc2Ugb25seSByZXF1aXJlcyByZWFkIGFjY2Vzcy4K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAqLwo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgZmFsbHRocm91Z2g7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgY2FzZSBFRklfUlVOVElN
RV9TRVJWSUNFU19DT0RFOgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgLyoKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAqIFRoaXMgd291bGQgYmUgdW51c3VhbCwgYnV0IG5vdCBwcm9i
bGVtYXRpYyBwZXIgc2UsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgKiBhcyBsb25nIGFz
IHdlIHRha2UgY2FyZSBub3QgdG8gY3JlYXRlIGEgd3JpdGFibGUKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAqIG1hcHBpbmcgZm9yIGV4ZWN1dGFibGUgY29kZS4KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAqLwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcHJvdCA9IFBBR0Vf
S0VSTkVMX1JPOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiArCj4gPiAr
ICAgICAgICAgICAgICAgY2FzZSBFRklfQUNQSV9SRUNMQUlNX01FTU9SWToKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIC8qCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgKiBBQ1BJIHJl
Y2xhaW0gbWVtb3J5IGlzIHVzZWQgdG8gcGFzcyBmaXJtd2FyZSB0YWJsZXMKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAqIGFuZCBvdGhlciBkYXRhIHRoYXQgaXMgaW50ZW5kZWQgZm9yIGNv
bnN1bXB0aW9uIGJ5Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgKiB0aGUgT1Mgb25seSwg
d2hpY2ggbWF5IGRlY2lkZSBpdCB3YW50cyB0byByZWNsYWltCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgKiB0aGF0IG1lbW9yeSBhbmQgdXNlIGl0IGZvciBzb21ldGhpbmcgZWxzZS4gV2Ug
bmV2ZXIKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIGRvIHRoYXQsIGJ1dCB3ZSB1c3Vh
bGx5IGFkZCBpdCB0byB0aGUgbGluZWFyIG1hcAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICogYW55d2F5LCBpbiB3aGljaCBjYXNlIHdlIHNob3VsZCB1c2UgdGhlIGV4aXN0aW5nCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgKiBtYXBwaW5nLgo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICovCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAobWVtYmxvY2tfaXNfbWFw
X21lbW9yeShwaHlzKSkKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
ICh2b2lkIF9faW9tZW0gKilfX3ZhKHBoeXMpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ZmFsbHRocm91Z2g7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgZGVmYXVsdDoKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGlmIChyZWdpb24tPmF0dHJpYnV0ZSAmIEVGSV9NRU1PUllfV0Ip
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByb3QgPSBQQUdFX0tFUk5FTDsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGVsc2UgaWYgKChyZWdpb24tPmF0dHJpYnV0ZSAm
IEVGSV9NRU1PUllfV0MpIHx8Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAo
cmVnaW9uLT5hdHRyaWJ1dGUgJiBFRklfTUVNT1JZX1dUKSkKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcHJvdCA9IHBncHJvdF93cml0ZWNvbWJpbmUoUEFHRV9LRVJORUwpOwo+
IAo+IEkgaGF2ZSB0byBhc2s6IHdoeSBpcyB3cml0ZS10aHJvdWdoIG1hcHBlZCB0byB3cml0ZS1j
b21iaW5lZCBoZXJlPwo+IApJSVVDLCB3cml0ZS10aHJvdWdoIGVuc3VyZXMgdGhlIGNvcHkgaW4g
dGhlIGNhY2hlIGFuZCBtZW1vcnkgYXJlIGFsd2F5cwppbiBzeW5jLiBTbywgaW5zdGVhZCBvZiB1
c2luZyBXQiwgbm9uLWNhY2hlYWJsZSBXQyBpcyB1c2VkIGFzIFJJU0MtVgpkb2Vzbid0IHJlYWxs
eSBkZWZpbmUgdGhlc2UgYXR0cmlidXRlcy4gTGV0IG1lIGtub3cgaWYgdGhpcyBpcyBub3QKY29y
cmVjdC4KCj4gPiArICAgICAgICAgICAgICAgfQo+ID4gKyAgICAgICB9Cj4gPiArCj4gPiArICAg
ICAgIHJldHVybiBpb3JlbWFwX3Byb3QocGh5cywgc2l6ZSwgcGdwcm90X3ZhbChwcm90KSk7Cj4g
PiAgfQo+ID4KPiA+ICAjaWZkZWYgQ09ORklHX1BDSQo+ID4gLS0KPiA+IDIuMzkuMgo+ID4KPiAK
PiBMaWtlIEFuZHJldyBzYWlkIGluIHYxLCB0b28gYmFkIHdlIGNhbid0IG1lcmdlIHRoYXQgd2l0
aCBhcm02NCBpbnN0ZWFkCj4gb2YgZHVwbGljYXRpbmcuCj4gCkkgYWdyZWUuIEJ1dCBzaW5jZSBh
Y3BpX29zX2lvcmVtYXAoKSBpcyBzdXBwb3NlZCB0byBiZSBhcmNoIGZ1bmN0aW9uLCBJCmtlcHQg
aXMgc2VwYXJhdGUuIEFsc28sIEkgbmVlZCBmZWVkYmFjayBmcm9tIEFyZCB3aGV0aGVyIHdlIHNo
b3VsZCBtYWtlCml0IGNvbW1vbiBhbmQgd2hlcmUgdG8gYWRkIHRoaXMgY29tbW9uIGZ1bmN0aW9u
LgoKPiBCdXQgb3RoZXJ3aXNlLCB5b3UgY2FuIGFkZDoKPiAKPiBSZXZpZXdlZC1ieTogQWxleGFu
ZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+IAoKVGhhbmtzIQpTdW5pbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
