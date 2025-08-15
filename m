Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145E2CA0EE4
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 02:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x71YmxSZRNH6fIRYZoRe7GfUd/TBS6M44JpgDP5Uf8A=; b=v+s1oWA4+fvK75
	9ia6r0Zr/FhS47rzV0S59qy66Xyzz9TZTso+eo79H3hjWNLPXKU/Tc7TRbkg/epxOomI0eKOvmLg2
	3/6/M5HzOUXs8mpmmgogwr5Fmy8AZqcQBhHMLYrtSnxtqz0wJVI6Gvo1nPc6/HtSF88SUM2hBA3BY
	VSAg3wvdpIIqNtLFEz31hpFsFALYa1ADakAHcM9b+w1BBY2hAyAOSWweIXkEbNML5u3LeAqa/YGKa
	B0lE8Ciz3T5mdSz8nXZqfusf1Cr7hP8RpzWbJRWc9WbEoYMtqLLhPNBxy49YFsAFRwRg+cCizktCr
	E93ONBol3h/AE1TQd7wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umk1o-000000018bs-3nRf;
	Fri, 15 Aug 2025 02:18:48 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umk1m-000000018bY-24oS
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 02:18:47 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e931cdba209so1610231276.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 19:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755224325; x=1755829125; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOZvgVfE+JUn9uYJ2foRS0Df6ye2j3Q55Mkq9l/JFHQ=;
        b=CzTrlRikSCdQHDwLHOTTP4wDxrzu6MHzXSGSc67yik0J6kPiWnSFV+sSWmiHGIBqAW
         efhykDSEc8JrZ4ODuP7zmwdq04arxMrPN4NIJ8jopVo4kQhjqxGpHO38KJN1/lToeVBr
         c+skXXv4M9BYYMbC8cEqzZ/Dif5ZJs05y4mPBM+LfKtHyn6m3L/dSHmI3lyCvqViXPkn
         vHtcI26X0RPX4RLXASKEkdNoW2DQXRi63snLcfcZyJ6dK9CHo6XTapq4yN7WJfZrUtIo
         9mNMweauEVQIbUGtgTD+m+W3uqjBZi83SXFQy9IoFokUzVLooGfRx3P+kKlY4F6e53pj
         DvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755224325; x=1755829125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOZvgVfE+JUn9uYJ2foRS0Df6ye2j3Q55Mkq9l/JFHQ=;
        b=fqD2FwlZlduADKcd4ek06ZR8sDTRH2yzhRxgbg5lVtkXP5DBaAJE+VOlJsHf9GZQhx
         RQHpnD2gr/UTwr4iAgXulKT3iQ1qblJGi9FREE28emUkk0KQl7j6o+mKyxjhCMBgsaF9
         4+1tptczzxtYthqIytbSAL8vxI3aepTp7x6SAwDef2VDw4+KMQI5aReGnZEJdiyLz6HD
         4hWNbjiait+s4xmf4OVTqXreEBf0am4SplRp7vcL5YXGY9s21eQ6NOXmZlWE5hcGeW18
         40aGedXK8fpiJSqXAM4W99e9tJMQqKK+4NJ09w2tTc9tG/8N2fvewr7D3g2tVQa6SPg0
         ZDNQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6qR4/C6GpT/OeqIZSSH99KWqv4MOcp07hQRDgLkSoSrG9FqNk+ZU0YmkPhvi4DbFk9pCVB7c+2DY4Gw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZg9omtRHdhPDwNjmAPdZTXitj5sVOz7TU2tR8FJxr8LfMZKUH
	e+mopR6akBte4He20fav9j3GcJFNO6ykA5iP6KaRZJTXmGYAFaxTy+ovH3d8q49KwQNhK700GOy
	Ia294uVGJo5ojLVXWdVsQVJZW0kHhs4HLIEkXRE2hOA==
X-Gm-Gg: ASbGnctgYiXjta3RmPX1tzLG/j0WOtLEmc+k+1Nb7dxI2VSm9EYNtt/AH9CwWAasOGG
	5rGZnwx+IDrJ2SOwVt5CrZcUztaTJH9yiS9S/145n0aSoM1MJmgzGzD/8Z972U0z1pc8hW5//tf
	tep2ZFDlLApFSatTT+D3/2harCBLkfT6Fiw0xNiG5S2j+081LrKA6enLFU/GGssMjQ6f85LjMF8
	vFSYIJGVg==
X-Google-Smtp-Source: AGHT+IElpzlua+gVZHtnvJL7hFwHgS462GQjnAnGMOd/xRwASet4kts+VonpOCNzZY6qEMZ52yEfTGFEq5Y7BbXpjRY=
X-Received: by 2002:a05:6902:15cf:b0:e90:42e4:e094 with SMTP id
 3f1490d57ef6-e93324a14d0mr603903276.38.1755224325105; Thu, 14 Aug 2025
 19:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250806082726.8835-1-nick.hu@sifive.com> <20250806082726.8835-2-nick.hu@sifive.com>
 <878qjwejpr.ffs@tglx>
In-Reply-To: <878qjwejpr.ffs@tglx>
From: Nick Hu <nick.hu@sifive.com>
Date: Fri, 15 Aug 2025 10:18:34 +0800
X-Gm-Features: Ac12FXx_CtgmkrWHwUuo7-39L6uF5EOVU6mDaTufWbFl3BC8HFHO0YbtV49FZxk
Message-ID: <CAKddAkBfBn7TPWB_nbSbPzH+Rgjcci1N4wR3FJ8kxh2QCTWQEw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] irqchip/riscv-imsic: Restore the IMSIC registers
To: Thomas Gleixner <tglx@linutronix.de>
Cc: anup@brainfault.org, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_191846_548174_43E57060 
X-CRM114-Status: GOOD (  26.15  )
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

T24gV2VkLCBBdWcgNiwgMjAyNSBhdCA4OjA44oCvUE0gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxp
bnV0cm9uaXguZGU+IHdyb3RlOgo+Cj4gT24gV2VkLCBBdWcgMDYgMjAyNSBhdCAxNjoyNywgTmlj
ayBIdSB3cm90ZToKPgo+ICJSZXN0b3JlIHRoZSBJTVNJQyByZWdpc3RlcnMiIGRvZXMgbm90IHRl
bGwgbWUgYW55dGhpbmcgdXNlZnVsLiBXaGVuIGFyZQo+IHRoZXkgcmVzdG9yZWQ/Cj4KSeKAmWxs
IHVwZGF0ZSBpdCB0bzog4oCcUHJlc2VydmUgdGhlIElNU0lDIHN0YXRlcyBhZnRlciBQTeKAnQoK
PiA+IFdoZW4gdGhlIHN5c3RlbSB3b2tlbiB1cCBmcm9tIHRoZSBsb3cgcG93ZXIgc3RhdGUsIHRo
ZSBJTVNJQyBtaWdodCBiZSBpbgo+Cj4gaXMgd29rZW4gdXAgZnJvbSBhIGxvdyBwb3dlciBzdGF0
ZQo+Cj4gPiB0aGUgcmVzZXQgc3RhdGUuCj4KPiBUaGUgcmVhbCBpbXBvcnRhbnQgaW5mb3JtYXRp
b24gaXM6Cj4KPiAgICBXaGVuIHRoZSBzeXN0ZW0gZW50ZXJzIGEgbG93IHBvd2VyIHN0YXRlIHRo
ZSBJTVNJQyBtaWdodCBiZSByZXNldCwKPiAgICBidXQgb24gZXhpdCBub3RoaW5nIHJlc3RvcmVz
IHRoZSByZWdpc3RlcnMsIHdoaWNoIHByZXZlbnRzIGludGVycnVwdAo+ICAgIGRlbGl2ZXJ5Lgo+
Cj4gT3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KPgo+ID4gVGhlcmVmb3JlIGFkZGluZyB0aGUgQ1BV
IFBNIGNhbGxiYWNrcyB0byByZXN0b3JlIHRoZSBJTVNJQyByZWdpc3Rlcgo+ID4gd2hlbiB0aGUg
Y3B1IHJlc3VtZSBmcm9tIHRoZSBsb3cgcG93ZXIgc3RhdGUuCj4KPiBUaGlzIGlzIG5vdCBhIHZh
bGlkIHNlbnRlbmNlLgo+Cj4gICBTb2x2ZSB0aGlzIGJ5IHJlZ2lzdGVyaW5nIGEgQ1BVIHBvd2Vy
IG1hbmFnZW1lbnQgbm90aWZpZXIsIHdoaWNoCj4gICByZXN0b3JlcyB0aGUgSU1TSUMgb24gZXhp
dC4KPgo+IE9yIHN1Y2guCj4KPiBTZWUKPgo+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0
bWwvbGF0ZXN0L3Byb2Nlc3MvbWFpbnRhaW5lci10aXAuaHRtbCNjaGFuZ2Vsb2cKPgo+IGZvciBm
dXJ0aGVyIGV4cGxhbmF0aW9uLgo+CkknbGwgY29ycmVjdCBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9u
LiBUaGFua3MuCgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1z
aWMtZWFybHkuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtZWFybHkuYwo+ID4g
aW5kZXggZDlhZTg3ODA4NjUxLi42MmJjYmNhZThiZDQgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJz
L2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLWVhcmx5LmMKPiA+ICsrKyBiL2RyaXZlcnMvaXJxY2hp
cC9pcnEtcmlzY3YtaW1zaWMtZWFybHkuYwo+ID4gQEAgLTcsNiArNyw3IEBACj4gPiAgI2RlZmlu
ZSBwcl9mbXQoZm10KSAicmlzY3YtaW1zaWM6ICIgZm10Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2Fj
cGkuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvY3B1Lmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2Nw
dV9wbS5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4KPgo+IFRoaXMgZG9lcyBu
ZWl0aGVyIGFwcGx5IGFnYWluc3QgTGludXMgdHJlZSBub3IgYWdhaW5zdCB0aXAKPgo+ID4gLXN0
YXRpYyBpbnQgaW1zaWNfc3RhcnRpbmdfY3B1KHVuc2lnbmVkIGludCBjcHUpCj4gPiArc3RhdGlj
IHZvaWQgaW1zaWNfcmVzdG9yZSh2b2lkKQo+Cj4gVGhpcyBmdW5jdGlvbiBpcyB1c2VkIGZvciBi
b3RoIHNldHVwIF9hbmRfIHJlc3RvcmUsIHNvIG5hbWluZyBpdAo+IHJlc3RvcmUoKSBpcyBtaXNs
ZWFkaW5nIGF0IGJlc3QuCj4KV2lsbCByZW5hbWUgaXQgdG8gaW1zaWNfcmVnc19pbml0KCkKCj4g
PiAgewo+ID4gLSAgICAgLyogTWFyayBwZXItQ1BVIElNU0lDIHN0YXRlIGFzIG9ubGluZSAqLwo+
ID4gLSAgICAgaW1zaWNfc3RhdGVfb25saW5lKCk7Cj4gPiAtCj4gPiAtICAgICAvKiBFbmFibGUg
cGVyLUNQVSBwYXJlbnQgaW50ZXJydXB0ICovCj4gPiAtICAgICBlbmFibGVfcGVyY3B1X2lycShp
bXNpY19wYXJlbnRfaXJxLCBpcnFfZ2V0X3RyaWdnZXJfdHlwZShpbXNpY19wYXJlbnRfaXJxKSk7
Cj4gPiAtCj4gPiAgICAgICAvKiBTZXR1cCBJUElzICovCj4gPiAgICAgICBpbXNpY19pcGlfc3Rh
cnRpbmdfY3B1KCk7Cj4gPgo+ID4gQEAgLTEyOCw2ICsxMjMsMTkgQEAgc3RhdGljIGludCBpbXNp
Y19zdGFydGluZ19jcHUodW5zaWduZWQgaW50IGNwdSkKPiA+Cj4gPiAgICAgICAvKiBFbmFibGUg
bG9jYWwgaW50ZXJydXB0IGRlbGl2ZXJ5ICovCj4gPiAgICAgICBpbXNpY19sb2NhbF9kZWxpdmVy
eSh0cnVlKTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGludCBpbXNpY19zdGFydGluZ19jcHUo
dW5zaWduZWQgaW50IGNwdSkKPiA+ICt7Cj4gPiArICAgICAvKiBNYXJrIHBlci1DUFUgSU1TSUMg
c3RhdGUgYXMgb25saW5lICovCj4gPiArICAgICBpbXNpY19zdGF0ZV9vbmxpbmUoKTsKPiA+ICsK
PiA+ICsgICAgIC8qIEVuYWJsZSBwZXItQ1BVIHBhcmVudCBpbnRlcnJ1cHQgKi8KPiA+ICsgICAg
IGVuYWJsZV9wZXJjcHVfaXJxKGltc2ljX3BhcmVudF9pcnEsCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICBpcnFfZ2V0X3RyaWdnZXJfdHlwZShpbXNpY19wYXJlbnRfaXJxKSk7Cj4KPiBObyBs
aW5lIGJyZWFrIHJlcXVpcmVkLiBZb3UgaGF2ZSAxMDAgY2hhcmFjdGVycy4KPgo+ID4gKwo+ID4g
KyAgICAgLyogUmVzdG9yZSB0aGUgaW1zaWMgcmVnICovCj4KPiBPbmUgSU1TSUMgcmVnaXN0ZXI/
IENhbiB5b3UgcGxlYXNlIHdyaXRlIHByb3BlciBzZW50ZW5jZXMgYW5kIHdyaXRlCj4gd29yZHMg
b3V0PyBUaGlzIGlzIG5vdCB0d2l0dGVyLiBBbHNvIHVzZSBJTVNJQyB1cHBlcmNhc2UgYXMgdGhl
IHJlc3Qgb2YKPiB0aGUgY29kZSBkb2VzIGluIHRoZSBjb21tZW50cy4KPgpTb3JyeSwgSeKAmWxs
IGJlIG1vcmUgY2FyZWZ1bC4KCj4gVGhhbmtzLAo+Cj4gICAgICAgICB0Z2x4CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
