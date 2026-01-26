Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3FCCF65DC
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 10:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=51JxuOCxRyISG3aMqJ2BQeiVffiXBi9U61+lEDSvsBM=; b=CwYwvEvK/7Uj80
	6841QXIHt/vEqPz5RAoo5BVYHzM6QsJ+aBPSceYWFaFvPsL33oVXulcHjxC6fgPZWlslfzZ2T58I4
	z/BBUn+6ZtIPn/2vIQhsrXY6QZ1KTfFlo0yDlPDqp5WCLzC3AN3TJCBIrgi86lDNSxxQvRJsRRuyC
	Peo6UoxCm9AZIIgCH8p7Ufwsxt+K6LUHMI4pc/Nu9WT3KggYUwSce9InL0w8IbCbGOWWxp6VO3mp6
	OHwX3PJNJq61dPymtbIaqa1UFyW3tWPOGeyh2IjOY0csDWXXF2APqi+Q9T1bV6RAY9hbTFA4BoN1T
	MCvebzUlv30zjAc8lFyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKEn-0000000CMj2-49PV;
	Mon, 26 Jan 2026 10:54:30 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKEk-0000000CMi5-2Mi5
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 10:54:27 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-661077c4d36so3838177eaf.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jan 2026 02:54:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769424865; cv=none;
        d=google.com; s=arc-20240605;
        b=LVj3z6l1o5hQ0gwQkC5yBgK/O3aEAYNz/wnVcYtPY1ZJjOWHKwxFKTU6zwVbiELWLW
         K/PohMtjT0jo/fp3JDa9RqRLY4MaScWrMAKHfezjrgsi74U0xlFjtrD8TedP4018bseA
         LMywIxIMlMbN/s0gzeSEpkI0uO42HpNYnrIpUcs1jx314FiehWJ2hOJvjnIJvR1R3uxY
         WGHdEYS3obR4NjB4r2mH/YAT8ipmGrUxFKxQEVEVMCKkeUXcOa8Sh/NemKaKPNvz8PM7
         hW3iYugMI0ZRo3a5LrDjhRBys3mHWjzrPdDWmBD3a3FZsN8MISCDz7XGgXz4JBwXhlbi
         Dnyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lTdfseGGZOBXUDrJx1ZMNK+31Qww06+nWrd3/i+ViQg=;
        fh=6YvyyV11CW7ajIv7gmIQPHFZPpxFYfPHK9pf2tOPVLc=;
        b=Zg6S2g+MJier5+bSJedQn8X9kKP8JYtm4/Hoff9OjY5/9AEUPUYtNZVFkTkfov6zWK
         ySOZMTRMbTlMOVqvN9IDkJPrXk9jwBe/pnhwECTRi6szEaMKT+Or8I0NKqBDGov/hPhc
         bQngYyYIew23zUiab3M/nDqRYALaBoa+hXTtwpJB+xerSDx2eka0OdZg0jbI7uVp84Na
         9n1RGJe0N3V50Og3RQUw5mxDgo+0dPDOzqS9GrRtYg4CLQ7GoOd5PbXGTeGmkJHoqCzD
         NAvj45QYTB0yJqrZ1qeJ+yvXfOj3n6u6YYWEb4CLVKOuLostUsVF0yoaYixS3kSkX8KG
         GVbA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1769424865; x=1770029665; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTdfseGGZOBXUDrJx1ZMNK+31Qww06+nWrd3/i+ViQg=;
        b=Nlpc5H6w54stJR9JkZtYrbRhplFQDUqtlQDfy+irBCWcE+5QBS8csIKCuQWy2E8Bh2
         v9+C4FZfja160nOI6GHyeCaJ8YD3hC34OP97013+j/ByA7+5lQnA+k4eLdxMDU/N79GN
         y4ZJRUC+TiO9oLgu748tTKywNoNHVF5ycJo0OvyYMkgLRGRJHSjOkyMc3Druhp6GN0wV
         ZK1SzqGYt/4m5A7lx4zOiJcyf7l6MG0srzou+IfDz/hMG6zAzpieVkyrJ3wpSp4xVaEr
         E7pVT3x1gNwZln+A6RraMR6t+9SA+nqNmuhayF9Ka5v0Jy4PorwPpqlCkLpzSgIL7RT7
         lbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424865; x=1770029665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lTdfseGGZOBXUDrJx1ZMNK+31Qww06+nWrd3/i+ViQg=;
        b=LtdY/acg1SoOZgllJrLt4HXEKXwiAS2UaA3csz1kMnjVg+PkxXVROSxe+xxvKZ62CR
         p5EVA7TolVFtIKbh/JYnxzTfT8+DsFXWr9US7cbn6DOrB78Vodv/SarKjrKQ2lAIzG/U
         6ZRmua3LAVzO0ukGJEBk3Ivcneq0j40C58JIfBAgPCVDKbhey6YVPmroRCl/ZPsNQyOE
         OCQ42mSRG3aN2wfPbdQv1WHCMspD1qe17cuoA1XM5HQJP9TXaKtrv1sRDFcmcZAAhYXi
         zAidAtrC6BhnMPVj86YQUurOyy5yhEmboKGkc72BMrScG0Kk2vVytCW+NPM0HwRBZJXc
         OTCg==
X-Forwarded-Encrypted: i=1; AJvYcCXAXJcIbexLOgwIMUBEpg5duerEwO1Kvbos0noJsW/wye7kMsQI1g73FQ6O2m8/ZHMNEoBPCqDfRxzgQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDRtzPllun0oksK1yDfNGPSjWnT7/1YF6xUck1D03RxjI/pyYe
	n90EyhrCj5yBOfbypaTu0Lq8hLGnaEfQXuvwZDVRT0PSglav8lYBFGpluZqDnVdxc86Kxj4a/aj
	mv+ju0FMOq+BespSUBzk4kBsXBHIsHPnW01hR/Br3SA==
X-Gm-Gg: AZuq6aL6DpWMsZQQ6KxxU7J9+nMsPoDgZQenp0lNniJtDQVj9dDUKQBXalV8cYMy0X7
	ZvVaR9V/Z3+02gEIcvFvWXFpQ8gFWYku4CEu3Myxleui8rDB6Hp5TwnsdB2Jwv0R7nod6Q/Hnk8
	Y42PPQ1jT9LfhJPo9gqH/7Nq+E6howjONr/Z/sRmaq2TU1HJ3tG/eQ7CaSW6k2s2uIbcXuJOEXY
	eXHq0caEBzHPjlNUkmN+CKHcAHdNhFYd+H7acFBm1zW4Xd2HcpiO428pK93uJLNMxVE0axSkhU+
	LzErxyfY1E793VWeHYdDe3/7G1ScXojT3wqMcvsUTM0CipfydU7bpP0VTREdfTTdlL+c
X-Received: by 2002:a05:6820:985:b0:65f:cda0:e00d with SMTP id
 006d021491bc7-662e0a2ad14mr1878453eaf.17.1769424865038; Mon, 26 Jan 2026
 02:54:25 -0800 (PST)
MIME-Version: 1.0
References: <20260104133457.57742-1-luxu.kernel@bytedance.com>
In-Reply-To: <20260104133457.57742-1-luxu.kernel@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 26 Jan 2026 16:24:14 +0530
X-Gm-Features: AZwV_QglBY6cl8dy5KVwFFrQ4xZeu7w6ijLW_ze3gtLkx6nEKiZ9nXTtQ7Ab3Ms
Message-ID: <CAAhSdy0krY4ou9TpGV=SKUKPNwgweB58QetUajb3HE5Jfy_RbA@mail.gmail.com>
Subject: Re: [PATCH v5] irqchip/riscv-imsic: Adjust the number of available
 guest irq files
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@linutronix.de, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_025426_874612_2ACA207C 
X-CRM114-Status: GOOD (  25.72  )
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

T24gU3VuLCBKYW4gNCwgMjAyNiBhdCA3OjA14oCvUE0gWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVk
YW5jZS5jb20+IHdyb3RlOgo+Cj4gQ3VycmVudGx5LCBLVk0gYXNzdW1lcyB0aGUgbWluaW11bSBv
ZiBpbXBsZW1lbnRlZCBIR0VJRSBiaXRzIGFuZAo+ICJCSVQoZ2MtPmd1ZXN0X2luZGV4X2JpdHMp
IC0gMSIgYXMgdGhlIG51bWJlciBvZiBndWVzdCBmaWxlcyBhdmFpbGFibGUKPiBhY3Jvc3MgYWxs
IENQVXMuIFRoaXMgd2lsbCBub3Qgd29yayB3aGVuIENQVXMgaGF2ZSBkaWZmZXJlbnQgbnVtYmVy
Cj4gb2YgZ3Vlc3QgZmlsZXMgYmVjYXVzZSBLVk0gbWF5IGluY29ycmVjdGx5IGFsbG9jYXRlIGEg
Z3Vlc3QgZmlsZSBvbiBhCj4gQ1BVIHdpdGggZmV3ZXIgZ3Vlc3QgZmlsZXMuCj4KPiBUbyBhZGRy
ZXNzIGFib3ZlLCBkdXJpbmcgaW5pdGlhbGl6YXRpb24sIGNhbGN1bGF0ZSB0aGUgbnVtYmVyIG9m
Cj4gYXZhaWxhYmxlIGd1ZXN0IGludGVycnVwdCBmaWxlcyBhY2NvcmRpbmcgdG8gTU1JTyByZXNv
dXJjZXMgYW5kCj4gY29uc3RyYWluIHRoZSBudW1iZXIgb2YgZ3Vlc3QgaW50ZXJydXB0IGZpbGVz
IHRoYXQgY2FuIGJlIGFsbG9jYXRlZAo+IGJ5IEtWTS4KPgo+IFNpZ25lZC1vZmYtYnk6IFh1IEx1
IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPgoKUGxlYXNlIGNhcnJ5IFJldmlld2VkLWJ5IGFu
ZCBBY2tlZC1ieSB0YWdzIG9idGFpbmVkIGluIHByZXZpb3VzCnJldmlzaW9ucy4gTmV4dCB0aW1l
LCBJIHdpbGwgbm90IHRha2UgdGhlIHBhdGNoIGlmIHByZXZpb3VzIHRhZ3MgYXJlCm1pc3Npbmcu
CgpRdWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNi4yMC4KClJlZ2FyZHMsCkFudXAKCj4gLS0t
Cj4gIGFyY2gvcmlzY3Yva3ZtL2FpYS5jICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGRy
aXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYyB8IDEyICsrKysrKysrKysrLQo+
ICBpbmNsdWRlL2xpbnV4L2lycWNoaXAvcmlzY3YtaW1zaWMuaCAgICAgfCAgMyArKysKPiAgMyBm
aWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYS5jIGIvYXJjaC9yaXNjdi9rdm0vYWlhLmMKPiBpbmRl
eCBkYWQzMTgxODU2NjAwLi5jYWMzYzJiNTFkNzI0IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
a3ZtL2FpYS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vYWlhLmMKPiBAQCAtNjMwLDcgKzYzMCw3
IEBAIGludCBrdm1fcmlzY3ZfYWlhX2luaXQodm9pZCkKPiAgICAgICAgICAqLwo+ICAgICAgICAg
aWYgKGdjKQo+ICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfYWlhX25yX2hnZWkgPSBtaW4oKHVs
b25nKWt2bV9yaXNjdl9haWFfbnJfaGdlaSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIEJJVChnYy0+Z3Vlc3RfaW5kZXhfYml0cykgLSAxKTsKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdjLT5ucl9ndWVzdF9maWxlcyk7
Cj4gICAgICAgICBlbHNlCj4gICAgICAgICAgICAgICAgIGt2bV9yaXNjdl9haWFfbnJfaGdlaSA9
IDA7Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0
ZS5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5jCj4gaW5kZXggZGM5
NWFkODU2ZDgwYS4uZThmMjBlZmIwMjhiZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAv
aXJxLXJpc2N2LWltc2ljLXN0YXRlLmMKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2
LWltc2ljLXN0YXRlLmMKPiBAQCAtNzk0LDcgKzc5NCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGlt
c2ljX3BhcnNlX2Z3bm9kZShzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlLAo+Cj4gIGludCBf
X2luaXQgaW1zaWNfc2V0dXBfc3RhdGUoc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSwgdm9p
ZCAqb3BhcXVlKQo+ICB7Cj4gLSAgICAgICB1MzIgaSwgaiwgaW5kZXgsIG5yX3BhcmVudF9pcnFz
LCBucl9tbWlvcywgbnJfaGFuZGxlcnMgPSAwOwo+ICsgICAgICAgdTMyIGksIGosIGluZGV4LCBu
cl9wYXJlbnRfaXJxcywgbnJfbW1pb3MsIG5yX2d1ZXN0X2ZpbGVzLCBucl9oYW5kbGVycyA9IDA7
Cj4gICAgICAgICBzdHJ1Y3QgaW1zaWNfZ2xvYmFsX2NvbmZpZyAqZ2xvYmFsOwo+ICAgICAgICAg
c3RydWN0IGltc2ljX2xvY2FsX2NvbmZpZyAqbG9jYWw7Cj4gICAgICAgICB2b2lkIF9faW9tZW0g
KiptbWlvc192YSA9IE5VTEw7Cj4gQEAgLTg4OCw2ICs4ODgsNyBAQCBpbnQgX19pbml0IGltc2lj
X3NldHVwX3N0YXRlKHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUsIHZvaWQgKm9wYXF1ZSkK
PiAgICAgICAgIH0KPgo+ICAgICAgICAgLyogQ29uZmlndXJlIGhhbmRsZXJzIGZvciB0YXJnZXQg
Q1BVcyAqLwo+ICsgICAgICAgZ2xvYmFsLT5ucl9ndWVzdF9maWxlcyA9IEJJVChnbG9iYWwtPmd1
ZXN0X2luZGV4X2JpdHMpIC0gMTsKPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBucl9wYXJlbnRf
aXJxczsgaSsrKSB7Cj4gICAgICAgICAgICAgICAgIHJjID0gaW1zaWNfZ2V0X3BhcmVudF9oYXJ0
aWQoZndub2RlLCBpLCAmaGFydGlkKTsKPiAgICAgICAgICAgICAgICAgaWYgKHJjKSB7Cj4gQEAg
LTkyOCw2ICs5MjksMTUgQEAgaW50IF9faW5pdCBpbXNpY19zZXR1cF9zdGF0ZShzdHJ1Y3QgZndu
b2RlX2hhbmRsZSAqZndub2RlLCB2b2lkICpvcGFxdWUpCj4gICAgICAgICAgICAgICAgIGxvY2Fs
LT5tc2lfcGEgPSBtbWlvc1tpbmRleF0uc3RhcnQgKyByZWxvZmY7Cj4gICAgICAgICAgICAgICAg
IGxvY2FsLT5tc2lfdmEgPSBtbWlvc192YVtpbmRleF0gKyByZWxvZmY7Cj4KPiArICAgICAgICAg
ICAgICAgLyoKPiArICAgICAgICAgICAgICAgICogS1ZNIHVzZXMgZ2xvYmFsLT5ucl9ndWVzdF9m
aWxlcyB0byBkZXRlcm1pbmUgdGhlIGF2YWlsYWJsZSBndWVzdAo+ICsgICAgICAgICAgICAgICAg
KiBpbnRlcnJ1cHQgZmlsZXMgb24gZWFjaCBDUFUuIFRha2UgdGhlIG1pbmltdW0gbnVtYmVyIG9m
IGd1ZXN0Cj4gKyAgICAgICAgICAgICAgICAqIGludGVycnVwdCBmaWxlcyBhY3Jvc3MgYWxsIENQ
VXMgdG8gYXZvaWQgS1ZNIGluY29ycmVjdGx5IGFsbG9jYXRpbmcKPiArICAgICAgICAgICAgICAg
ICogYW4gdW5leGlzdGVkIG9yIHVubWFwcGVkIGd1ZXN0IGludGVycnVwdCBmaWxlIG9uIHNvbWUg
Q1BVcy4KPiArICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgIG5yX2d1ZXN0X2Zp
bGVzID0gKHJlc291cmNlX3NpemUoJm1taW9zW2luZGV4XSkgLSByZWxvZmYpIC8gSU1TSUNfTU1J
T19QQUdFX1NaIC0gMTsKPiArICAgICAgICAgICAgICAgZ2xvYmFsLT5ucl9ndWVzdF9maWxlcyA9
IG1pbihnbG9iYWwtPm5yX2d1ZXN0X2ZpbGVzLCBucl9ndWVzdF9maWxlcyk7Cj4gKwo+ICAgICAg
ICAgICAgICAgICBucl9oYW5kbGVycysrOwo+ICAgICAgICAgfQo+Cj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvbGludXgvaXJxY2hpcC9yaXNjdi1pbXNpYy5oIGIvaW5jbHVkZS9saW51eC9pcnFjaGlw
L3Jpc2N2LWltc2ljLmgKPiBpbmRleCA3NDk0OTUyYzU1MTg3Li40M2FlZDUyMzg1MDA4IDEwMDY0
NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvaXJxY2hpcC9yaXNjdi1pbXNpYy5oCj4gKysrIGIvaW5j
bHVkZS9saW51eC9pcnFjaGlwL3Jpc2N2LWltc2ljLmgKPiBAQCAtNjksNiArNjksOSBAQCBzdHJ1
Y3QgaW1zaWNfZ2xvYmFsX2NvbmZpZyB7Cj4gICAgICAgICAvKiBOdW1iZXIgb2YgZ3Vlc3QgaW50
ZXJydXB0IGlkZW50aXRpZXMgKi8KPiAgICAgICAgIHUzMiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBucl9ndWVzdF9pZHM7Cj4KPiArICAgICAgIC8qIE51bWJlciBvZiBndWVz
dCBpbnRlcnJ1cHQgZmlsZXMgcGVyIGNvcmUgKi8KPiArICAgICAgIHUzMiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBucl9ndWVzdF9maWxlczsKPiArCj4gICAgICAgICAvKiBQ
ZXItQ1BVIElNU0lDIGFkZHJlc3NlcyAqLwo+ICAgICAgICAgc3RydWN0IGltc2ljX2xvY2FsX2Nv
bmZpZyBfX3BlcmNwdSAgICAgICpsb2NhbDsKPiAgfTsKPiAtLQo+IDIuMjAuMQo+Cj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
