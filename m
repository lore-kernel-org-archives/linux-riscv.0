Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84152C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 14:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w4rcsDEeK08A7jOZA1RR736SKJw4+RibVmave3ZYuoI=; b=lKYxXcfa58d29s
	idf354BzMB06goAkvEDX1uwqS2KxLflchf3EIMSLp6+1rbGPu6GBxnVf4OtsPCNqVe947WCQtZjvL
	QeCsizzsaC89jR0A54gRI2lKOeDzFONqjdX288wHeZSLrRolkVotB2DFifu1/hyiFP7mQyCQueMjR
	0GWyeEBLNMLXUhJkpoGgUncEYWRcYpQh9YVUvF5ErDnyt95pwRgZP7SZVzE8B9a6HirjS96In0upg
	/I5zBJ6UEbefH1wDmQJT5jSGr6yKVG+UP08pcWWaHBqgFUC/mXm1VpTW2qOel9NTbYhZSqWLv30h5
	kTSGGOEfj98rRLZDW4Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCgln-00000007Xsi-1bq0;
	Thu, 30 May 2024 14:28:43 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCglj-00000007Xqf-3W44
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 14:28:41 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-7e8dbc4bc67so35938439f.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 May 2024 07:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1717079314; x=1717684114; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrFY0VaYKU2vD77g/VQDb0AaoaOV/tz1VO820emrTH8=;
        b=HX9zy1mq7jNOXFcRhOxu8WIwqtvowtAm8zQ5b1d4z6sgYHCur2juTF9p7xmC/k8eFx
         C2hdPCfPByRIO2NCr/iEROXToiqHF2ewtmnotF2LS99RnCOUSqF8ulb2InI5YKTU+yFB
         uccBgMD3sYWB4E7WSo6jP7EsEJQ1sJKkl9MZfk6HMZxL4lIAuguCHKu8PfljtCZpZMMv
         PoRGoKNz3s+V73KNatBP4QaPtajktdXax+eQh/cCPuWZSMGoM5e75F36rroFqGfQDlqr
         LZIlDzy+RGyaRq9VodA58NM/Jn6XkKMNL9YxigPdzyzBfBTUPBV/9rvZxBOxFWIxwLB5
         vpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717079314; x=1717684114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrFY0VaYKU2vD77g/VQDb0AaoaOV/tz1VO820emrTH8=;
        b=wkPBvPvnMFsWqor09RRvED6kJmtKhxGxXA+CBJ3zecEW0VBWdR8JgnaJD+2hQ0x0wt
         Dbskf+2iTPdnMMgU7kJqUECI+WdJ9nA2DsC4uBZ6FwA5yh2cnp45C6iFyB+uul3aYnER
         9T3JKLu0ISO7nQFAHCvCp8nzxxWjXlqkr99ml2P7XWpl7qJrPH9xO3iY+LcB9JLgVqTH
         8u5OBZYMjA6OJHmRAhNLJPVbD5Ec4oDkStqKafVL0pux1At//oHLsbcAMLgmQZqwY976
         0Qj/ITvkmFcYO+y4LkVP0fwU49NyKx+deRlwHUANSCpa/QJpI1R2ERNtxK03Ieg8OooV
         LfYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCAl/LCCCywWDUwswCMVeOsLEhfdbLoGhxcPT82wnbrmdwxC6GnieIIFA7W/rE9EE81pdOAXKZDSLbUHmJoOAPQJmkeriZpb+UxMUAMEMB
X-Gm-Message-State: AOJu0Yz3F38mt6VyWCqJS9pf5KgWgEnScHTKlOGd7xktony0IA36lQdW
	rWq4M2TVNUqq6iz46IJgnR2onNjO4mIRz9GqhnNRwugaHYXqBnda/4N3nwUfLdgeGhpjadKYDTq
	1FrFNcTmGoRoCcJ1whxj36othx+R9yjuZmEzY1w==
X-Google-Smtp-Source: AGHT+IH7s7fRBncwQz/8YMXyL69aYbbbtWJ7w39VrMU/rk9239KjSERSYxjfvzkXIhh2PcCbFD7ALB2y7Lq+jxLKKk0=
X-Received: by 2002:a05:6e02:1b0e:b0:373:8d04:28a4 with SMTP id
 e9e14a558f8ab-3747e239d28mr17072745ab.13.1717079313717; Thu, 30 May 2024
 07:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240529215458.937817-1-samuel.holland@sifive.com>
In-Reply-To: <20240529215458.937817-1-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 30 May 2024 19:58:22 +0530
Message-ID: <CAAhSdy2kO5TYfh6-h4R3UWNidzYpp-CN7zL=JmAKdt1Q23TrwQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip/sifive-plic: Chain to parent IRQ after handlers
 are ready
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_072840_058027_2EF0F3CB 
X-CRM114-Status: GOOD (  26.46  )
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

T24gVGh1LCBNYXkgMzAsIDIwMjQgYXQgMzoyNeKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IE5vdyB0aGF0IHRoZSBQTElDIHVzZXMgYSBw
bGF0Zm9ybSBkcml2ZXIsIHRoZSBkcml2ZXIgcHJvYmVkIGxhdGVyIGluIHRoZQo+IGJvb3QgcHJv
Y2Vzcywgd2hlcmUgaW50ZXJydXB0cyBmcm9tIHBlcmlwaGVyYWxzIG1pZ2h0IGFscmVhZHkgYmUK
PiBwZW5kaW5nLiBBcyBhIHJlc3VsdCwgcGxpY19oYW5kbGVfaXJxKCkgbWF5IGJlIGNhbGxlZCBh
cyBlYXJseSBhcyB0aGUKPiBjYWxsIHRvIGlycV9zZXRfY2hhaW5lZF9oYW5kbGVyKCkuIEJ1dCB0
aGlzIGNhbGwgaGFwcGVucyBiZWZvcmUgdGhlCj4gcGVyLWNvbnRleHQgaGFuZGxlciBpcyBjb21w
bGV0ZWx5IHNldCB1cCwgc28gdGhlcmUgaXMgYSB3aW5kb3cgd2hlcmUKPiBwbGljX2hhbmRsZV9p
cnEoKSBjYW4gc2VlIGluY29tcGxldGUgcGVyLWNvbnRleHQgc3RhdGUgYW5kIGNyYXNoLiBBdm9p
ZAo+IHRoaXMgYnkgZGVsYXlpbmcgdGhlIGNhbGwgdG8gaXJxX3NldF9jaGFpbmVkX2hhbmRsZXIo
KSB1bnRpbCBhbGwKPiBoYW5kbGVycyBmcm9tIGFsbCBQTElDcyBhcmUgaW5pdGlhbGl6ZWQuCj4K
PiBGaXhlczogOGVjOTliMDMzMTQ3ICgiaXJxY2hpcC9zaWZpdmUtcGxpYzogQ29udmVydCBQTElD
IGRyaXZlciBpbnRvIGEgcGxhdGZvcm0gZHJpdmVyIikKPiBSZXBvcnRlZC1ieTogR2VlcnQgVXl0
dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4KPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3IvQ0FNdUhNZFZZRkZSN0s1U2JIQkxZLUpIaGI3WXBnR01TX2huUldtOEgwS0Qt
d0JvKzRBQG1haWwuZ21haWwuY29tLwo+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxz
YW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVs
IDxhbnVwQGJyYWluZmF1bHQub3JnPgoKVGhhbmtzIGZvciBmaXhpbmcgdGhpcy4KClJlZ2FyZHMs
CkFudXAKCj4gLS0tCj4KPiAgZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jIHwgMzQg
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5z
ZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFj
aGlwL2lycS1zaWZpdmUtcGxpYy5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5j
Cj4gaW5kZXggOGZiMTgzY2VkMWU3Li45ZTIyZjdlMzc4ZjUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jCj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1z
aWZpdmUtcGxpYy5jCj4gQEAgLTg1LDcgKzg1LDcgQEAgc3RydWN0IHBsaWNfaGFuZGxlciB7Cj4g
ICAgICAgICBzdHJ1Y3QgcGxpY19wcml2ICAgICAgICAqcHJpdjsKPiAgfTsKPiAgc3RhdGljIGlu
dCBwbGljX3BhcmVudF9pcnEgX19yb19hZnRlcl9pbml0Owo+IC1zdGF0aWMgYm9vbCBwbGljX2Nw
dWhwX3NldHVwX2RvbmUgX19yb19hZnRlcl9pbml0Owo+ICtzdGF0aWMgYm9vbCBwbGljX2dsb2Jh
bF9zZXR1cF9kb25lIF9fcm9fYWZ0ZXJfaW5pdDsKPiAgc3RhdGljIERFRklORV9QRVJfQ1BVKHN0
cnVjdCBwbGljX2hhbmRsZXIsIHBsaWNfaGFuZGxlcnMpOwo+Cj4gIHN0YXRpYyBpbnQgcGxpY19p
cnFfc2V0X3R5cGUoc3RydWN0IGlycV9kYXRhICpkLCB1bnNpZ25lZCBpbnQgdHlwZSk7Cj4gQEAg
LTQ4NywxMCArNDg3LDggQEAgc3RhdGljIGludCBwbGljX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCj4gICAgICAgICB1bnNpZ25lZCBsb25nIHBsaWNfcXVpcmtzID0gMDsKPiAg
ICAgICAgIHN0cnVjdCBwbGljX2hhbmRsZXIgKmhhbmRsZXI7Cj4gICAgICAgICB1MzIgbnJfaXJx
cywgcGFyZW50X2h3aXJxOwo+IC0gICAgICAgc3RydWN0IGlycV9kb21haW4gKmRvbWFpbjsKPiAg
ICAgICAgIHN0cnVjdCBwbGljX3ByaXYgKnByaXY7Cj4gICAgICAgICBpcnFfaHdfbnVtYmVyX3Qg
aHdpcnE7Cj4gLSAgICAgICBib29sIGNwdWhwX3NldHVwOwo+Cj4gICAgICAgICBpZiAoaXNfb2Zf
bm9kZShkZXYtPmZ3bm9kZSkpIHsKPiAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCAqaWQ7Cj4gQEAgLTU0OSwxNCArNTQ3LDYgQEAgc3RhdGljIGludCBwbGljX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICAgICAgICAgICAgICAgICAg
Y29udGludWU7Cj4gICAgICAgICAgICAgICAgIH0KPgo+IC0gICAgICAgICAgICAgICAvKiBGaW5k
IHBhcmVudCBkb21haW4gYW5kIHJlZ2lzdGVyIGNoYWluZWQgaGFuZGxlciAqLwo+IC0gICAgICAg
ICAgICAgICBkb21haW4gPSBpcnFfZmluZF9tYXRjaGluZ19md25vZGUocmlzY3ZfZ2V0X2ludGNf
aHdub2RlKCksIERPTUFJTl9CVVNfQU5ZKTsKPiAtICAgICAgICAgICAgICAgaWYgKCFwbGljX3Bh
cmVudF9pcnEgJiYgZG9tYWluKSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcGxpY19wYXJl
bnRfaXJxID0gaXJxX2NyZWF0ZV9tYXBwaW5nKGRvbWFpbiwgUlZfSVJRX0VYVCk7Cj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKHBsaWNfcGFyZW50X2lycSkKPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGlycV9zZXRfY2hhaW5lZF9oYW5kbGVyKHBsaWNfcGFyZW50X2lycSwg
cGxpY19oYW5kbGVfaXJxKTsKPiAtICAgICAgICAgICAgICAgfQo+IC0KPiAgICAgICAgICAgICAg
ICAgLyoKPiAgICAgICAgICAgICAgICAgICogV2hlbiBydW5uaW5nIGluIE0tbW9kZSB3ZSBuZWVk
IHRvIGlnbm9yZSB0aGUgUy1tb2RlIGhhbmRsZXIuCj4gICAgICAgICAgICAgICAgICAqIEhlcmUg
d2UgYXNzdW1lIGl0IGFsd2F5cyBjb21lcyBsYXRlciwgYnV0IHRoYXQgbWlnaHQgYmUgYQo+IEBA
IC01OTcsMjUgKzU4NywzNSBAQCBzdGF0aWMgaW50IHBsaWNfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKPiAgICAgICAgICAgICAgICAgZ290byBmYWlsX2NsZWFudXBfY29udGV4
dHM7Cj4KPiAgICAgICAgIC8qCj4gLSAgICAgICAgKiBXZSBjYW4gaGF2ZSBtdWx0aXBsZSBQTElD
IGluc3RhbmNlcyBzbyBzZXR1cCBjcHVocCBzdGF0ZQo+ICsgICAgICAgICogV2UgY2FuIGhhdmUg
bXVsdGlwbGUgUExJQyBpbnN0YW5jZXMgc28gc2V0dXAgZ2xvYmFsIHN0YXRlCj4gICAgICAgICAg
KiBhbmQgcmVnaXN0ZXIgc3lzY29yZSBvcGVyYXRpb25zIG9ubHkgb25jZSBhZnRlciBjb250ZXh0
Cj4gICAgICAgICAgKiBoYW5kbGVycyBvZiBhbGwgb25saW5lIENQVXMgYXJlIGluaXRpYWxpemVk
Lgo+ICAgICAgICAgICovCj4gLSAgICAgICBpZiAoIXBsaWNfY3B1aHBfc2V0dXBfZG9uZSkgewo+
IC0gICAgICAgICAgICAgICBjcHVocF9zZXR1cCA9IHRydWU7Cj4gKyAgICAgICBpZiAoIXBsaWNf
Z2xvYmFsX3NldHVwX2RvbmUpIHsKPiArICAgICAgICAgICAgICAgc3RydWN0IGlycV9kb21haW4g
KmRvbWFpbjsKPiArICAgICAgICAgICAgICAgYm9vbCBnbG9iYWxfc2V0dXAgPSB0cnVlOwo+ICsK
PiAgICAgICAgICAgICAgICAgZm9yX2VhY2hfb25saW5lX2NwdShjcHUpIHsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBoYW5kbGVyID0gcGVyX2NwdV9wdHIoJnBsaWNfaGFuZGxlcnMsIGNwdSk7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFoYW5kbGVyLT5wcmVzZW50KSB7Cj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjcHVocF9zZXR1cCA9IGZhbHNlOwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2xvYmFsX3NldHVwID0gZmFsc2U7Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgICAgICAgICAgICAgICAg
ICB9Cj4gICAgICAgICAgICAgICAgIH0KPiAtICAgICAgICAgICAgICAgaWYgKGNwdWhwX3NldHVw
KSB7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoZ2xvYmFsX3NldHVwKSB7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgLyogRmluZCBwYXJlbnQgZG9tYWluIGFuZCByZWdpc3RlciBjaGFpbmVk
IGhhbmRsZXIgKi8KPiArICAgICAgICAgICAgICAgICAgICAgICBkb21haW4gPSBpcnFfZmluZF9t
YXRjaGluZ19md25vZGUocmlzY3ZfZ2V0X2ludGNfaHdub2RlKCksIERPTUFJTl9CVVNfQU5ZKTsK
PiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoZG9tYWluKQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGxpY19wYXJlbnRfaXJxID0gaXJxX2NyZWF0ZV9tYXBwaW5nKGRvbWFp
biwgUlZfSVJRX0VYVCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKHBsaWNfcGFyZW50
X2lycSkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlycV9zZXRfY2hhaW5lZF9o
YW5kbGVyKHBsaWNfcGFyZW50X2lycSwgcGxpY19oYW5kbGVfaXJxKTsKPiArCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgY3B1aHBfc2V0dXBfc3RhdGUoQ1BVSFBfQVBfSVJRX1NJRklWRV9QTElD
X1NUQVJUSU5HLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJp
cnFjaGlwL3NpZml2ZS9wbGljOnN0YXJ0aW5nIiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwbGljX3N0YXJ0aW5nX2NwdSwgcGxpY19keWluZ19jcHUpOwo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIHJlZ2lzdGVyX3N5c2NvcmVfb3BzKCZwbGljX2lycV9zeXNj
b3JlX29wcyk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcGxpY19jcHVocF9zZXR1cF9kb25l
ID0gdHJ1ZTsKPiArICAgICAgICAgICAgICAgICAgICAgICBwbGljX2dsb2JhbF9zZXR1cF9kb25l
ID0gdHJ1ZTsKPiAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgfQo+Cj4gLS0KPiAyLjQ0LjEK
Pgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
