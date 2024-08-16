Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3009C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 10:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dITc5F0lhIZZT3rGHx7M8z+JM0iSInHLqQb983SuYSQ=; b=4Rru+xr5bBXgSg
	eW/2fZqHQsJJFRwUFj+cqluAhs8b24MXQ9w9Yc6bKVoDEGCdgP7o8VaIyViedCns9poxz5UgWtlC3
	91cs7aXu20PTmeOGPQYGQCNazVlYa3CbFwZ7m5zHwHn+UhhOg6y4l1+JlJbohFefxX/kVxQzhqG1C
	3pkEUk+dQh/A06d01z9DvQ+XWZ9r5krZimqbsWZssTzwnHkzCsO1fl4fOQNBhZgcCyDb8bUs99q7e
	XwY997NKfzGP+2BV2KRhuvH6yd0LP3eI0aSsoRWwmF6yyKQRZmGnlsBMGBfdslt6FlSNHQqDfoqSZ
	ec6P4gkRwH0Eiyza7pow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seuSD-0000000Cca9-0Hik;
	Fri, 16 Aug 2024 10:45:09 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seuSA-0000000CcZO-0xcA
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 10:45:07 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-39834949e42so6967805ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2024 03:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1723805105; x=1724409905; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQ76OrJ+D6EglboDmRkksAWPF9+ReWU1C7wwydHo8w8=;
        b=vZDgOzVOFKGsYkQFlZI+qMm1jb0LUz8IcTFpk0LBKg8+mfznoqgVv7EeU5wyrP0rWx
         JgeHPneRwladLq8HWq7HeT5D2NlYmij5r6K3rs6E75sDAZxjSUJYSLyfL9yfh8XDDclt
         QVFG17dMt4/5SPu4mROEKPReNECwZQh7lbM9DbIrWaN+zoUA258AhX3vDtVZlGZApUsu
         kA5NC/k8TOLLp8SpW24AIGlUlR+RLe+r/PpnOJ8LKTMDCO8kWoOLZg3bamKXVW5KZsvy
         Rk2i8vi8YVaPDbqfRuJtbO+GQSH2kFL3KTQQelBfg3yAUukJShJFtO4KsQC76hKrW0EK
         9znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723805105; x=1724409905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQ76OrJ+D6EglboDmRkksAWPF9+ReWU1C7wwydHo8w8=;
        b=eU+dhjT7o0mhLAc2PwnXyGZqwqZkYdWUYhkABRUPvIEnMR5F2PsS2EKDVrSLZtzbkX
         G3X0OXZgH9Auii4aCoMNOqCieDqn5NfLB4Nqy6mpC1jWuk9WTSG+lkedxp3WWESx7nym
         dAKdn3Q2FP/CG938mnX+nxqiF94/v5ycKUqJiwOQCCQh8WfC7u+05UrHc4ivtDy135d8
         yfmPO1hkIvrb/LvKfjTDTSQylWu/YiBRSxPiTivIK3XU+1fz72Io1eE0EjIeoAfOFIB6
         myUJQEahxvsSYEojU41yFCTZM51h/J3MbgM60X/KbF9HK31EaXlO9GCRbbocOtY5Ev77
         bJ8A==
X-Forwarded-Encrypted: i=1; AJvYcCVFOTJPndVSVkymhgJvqROVEEUOVsrB+FiFpBwPfx1OIVaho0TzoiYJNHTFh94yI51gESUa3YyaZ/P/dQyCqIGATAGz4mfZ4dQlPx8waTx1
X-Gm-Message-State: AOJu0Yxqn+qR//wu76yZnYTyPKPivXHtcLG51mnn82njAH7EfrXNJeFw
	86wTPX6Fh5IOSfuJskOBuz634GQCAqKU11Z28USAN0Gu7UJYifKJ8GAlKy9XoQ2lc2cGwUVvcar
	bAOFXQgYxzRnzbmIXhv/rDVmOkY9Kwfk6S9PK6g==
X-Google-Smtp-Source: AGHT+IGOY2wZxg3oQyKstZDxzeAo3jAK3M41BK/FipMiQ0FhdiHyS6sxut/JjEf5JetJ4eJZeTSIb18KGPl1+eyfyBU=
X-Received: by 2002:a05:6e02:13a6:b0:39a:ea20:bf7f with SMTP id
 e9e14a558f8ab-39d26d791ccmr34640735ab.25.1723805104686; Fri, 16 Aug 2024
 03:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240816095520.96348-2-ajones@ventanamicro.com>
In-Reply-To: <20240816095520.96348-2-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 16 Aug 2024 16:14:52 +0530
Message-ID: <CAAhSdy0wxpDXoUmGyuQOeMfNCubdp9_iYdBOSN=EcweG1nkwwg@mail.gmail.com>
Subject: Re: [PATCH] of/irq: Support #msi-cells=<0> in of_msi_get_domain
To: Andrew Jones <ajones@ventanamicro.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, maz@kernel.org, 
	mark.rutland@arm.com, robh@kernel.org, saravanak@google.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_034506_418940_EFBA49EB 
X-CRM114-Status: GOOD (  26.62  )
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

T24gRnJpLCBBdWcgMTYsIDIwMjQgYXQgMzoyNeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gQW4gJ21zaS1wYXJlbnQnIHByb3BlcnR5IHdpdGgg
YSBzaW5nbGUgZW50cnkgYW5kIG5vIGFjY29tcGFueWluZwo+ICcjbXNpLWNlbGxzJyBwcm9wZXJ0
eSBpcyBjb25zaWRlcmVkIHRoZSBsZWdhY3kgZGVmaW5pdGlvbiBhcyBvcHBvc2VkCj4gdG8gaXRz
IGRlZmluaXRpb24gYWZ0ZXIgYmVpbmcgZXhwYW5kZWQgd2l0aCBjb21taXQgMTI2YjE2ZTJhZDk4
Cj4gKCJEb2NzOiBkdDogYWRkIGdlbmVyaWMgTVNJIGJpbmRpbmdzIikuIEhvd2V2ZXIsIHRoZSBs
ZWdhY3kKPiBkZWZpbml0aW9uIGlzIGNvbXBsZXRlbHkgY29tcGF0aWJsZSB3aXRoIHRoZSBjdXJy
ZW50IGRlZmluaXRpb24gYW5kLAo+IHNpbmNlIG9mX3BoYW5kbGVfaXRlcmF0b3JfbmV4dCgpIHRv
bGVyYXRlcyBtaXNzaW5nIGFuZCBwcmVzZW50LWJ1dC0KPiB6ZXJvICpjZWxscyBwcm9wZXJ0aWVz
IHNpbmNlIGNvbW1pdCBlNDJlZTYxMDE3ZjUgKCJvZjogTGV0Cj4gb2ZfZm9yX2VhY2hfcGhhbmRs
ZSBmYWxsYmFjayB0byBub24tbmVnYXRpdmUgY2VsbF9jb3VudCIpLCB0aGVyZSdzIG5vCj4gbmVl
ZCBhbnltb3JlIHRvIHNwZWNpYWwgY2FzZSB0aGUgbGVnYWN5IGRlZmluaXRpb24gaW4KPiBvZl9t
c2lfZ2V0X2RvbWFpbigpLgo+Cj4gSW5kZWVkLCBzcGVjaWFsIGNhc2luZyBoYXMgdHVybmVkIG91
dCB0byBiZSBoYXJtZnVsLCBiZWNhdXNlLCBhcyBvZgo+IGNvbW1pdCA3YzAyNTIzOGI0N2EgKCJk
dC1iaW5kaW5nczogaXJxY2hpcDogRGVzY3JpYmUgdGhlIElNWCBNVSBibG9jawo+IGFzIGEgTVNJ
IGNvbnRyb2xsZXIiKSwgTVNJIGNvbnRyb2xsZXIgRFQgYmluZGluZ3MgaGF2ZSBzdGFydGVkCj4g
c3BlY2lmeWluZyAnI21zaS1jZWxscycgYXMgYSByZXF1aXJlZCBwcm9wZXJ0eSAoZXZlbiB3aGVu
IHRoZSB2YWx1ZQo+IG11c3QgYmUgemVybykgYXMgYW4gZWZmb3J0IHRvIG1ha2UgdGhlIGJpbmRp
bmdzIG1vcmUgZXhwbGljaXQuIEJ1dCwKPiBzaW5jZSB0aGUgc3BlY2lhbCBjYXNpbmcgb2YgJ21z
aS1wYXJlbnQnIG9ubHkgdXNlcyB0aGUgZXhpc3RlbmNlIG9mCj4gJyNtc2ktY2VsbHMnIGZvciBp
dHMgaGV1cmlzdGljLCBhbmQgbm90IHdoZXRoZXIgb3Igbm90IGl0J3MgYWxzbwo+IG5vbnplcm8s
IHRoZSBsZWdhY3kgcGF0aCBpcyBub3QgdGFrZW4uIEZ1cnRoZXJtb3JlLCB0aGUgcGF0aCB0bwo+
IHN1cHBvcnQgdGhlIG5ldywgYnJvYWRlciBkZWZpbml0aW9uIGlzbid0IHRha2VuIGVpdGhlciBz
aW5jZSB0aGF0Cj4gcGF0aCBoYXMgYmVlbiByZXN0cmljdGVkIHRvIHRoZSBwbGF0Zm9ybS1tc2kg
YnVzLgo+Cj4gQnV0LCBuZWl0aGVyIHRoZSBkZWZpbml0aW9uIG9mICdtc2ktcGFyZW50JyBub3Ig
dGhlIGRlZmluaXRpb24gb2YKPiAnI21zaS1jZWxscycgaXMgcGxhdGZvcm0tbXNpLXNwZWNpZmlj
ICh0aGUgcGxhdGZvcm0tbXNpIGJ1cyB3YXMganVzdAo+IHRoZSBmaXJzdCBidXMgdGhhdCBuZWVk
ZWQgJyNtc2ktY2VsbHMnKSwgc28gcmVtb3ZlIGJvdGggdGhlIHNwZWNpYWwKPiBjYXNpbmcgYW5k
IHRoZSByZXN0cmljdGlvbi4gVGhpcyBub3Qgb25seSBzaW1wbGlmaWVzIHRoZSBjb2RlIGJ1dAo+
IGFsc28gcmVzb2x2ZXMgYW4gaXNzdWUgd2l0aCBQQ0kgZGV2aWNlcyBmaW5kaW5nIHRoZWlyIE1T
SSBjb250cm9sbGVycwo+IG9uIHJpc2N2LCBhcyB0aGUgcmlzY3YsaW1zaWNzIGJpbmRpbmcgcmVx
dWlyZXMgJyNtc2ktY2VsbHM9PDA+Jy4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8
YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvb2YvaXJxLmMgfCAzNyAr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
MSBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L29mL2lycS5jIGIvZHJpdmVycy9vZi9pcnEuYwo+IGluZGV4IGM5NDIwM2NlNjViYi4uMDI2YjUy
YzhlZTYzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvb2YvaXJxLmMKPiArKysgYi9kcml2ZXJzL29m
L2lycS5jCj4gQEAgLTcwOSw4ICs3MDksNyBAQCBzdHJ1Y3QgaXJxX2RvbWFpbiAqb2ZfbXNpX21h
cF9nZXRfZGV2aWNlX2RvbWFpbihzdHJ1Y3QgZGV2aWNlICpkZXYsIHUzMiBpZCwKPiAgICogQG5w
OiBkZXZpY2Ugbm9kZSBmb3IgQGRldgo+ICAgKiBAdG9rZW46IGJ1cyB0eXBlIGZvciB0aGlzIGRv
bWFpbgo+ICAgKgo+IC0gKiBQYXJzZSB0aGUgbXNpLXBhcmVudCBwcm9wZXJ0eSAoYm90aCB0aGUg
c2ltcGxlIGFuZCB0aGUgY29tcGxleAo+IC0gKiB2ZXJzaW9ucyksIGFuZCByZXR1cm5zIHRoZSBj
b3JyZXNwb25kaW5nIE1TSSBkb21haW4uCj4gKyAqIFBhcnNlIHRoZSBtc2ktcGFyZW50IHByb3Bl
cnR5IGFuZCByZXR1cm5zIHRoZSBjb3JyZXNwb25kaW5nIE1TSSBkb21haW4uCj4gICAqCj4gICAq
IFJldHVybnM6IHRoZSBNU0kgZG9tYWluIGZvciB0aGlzIGRldmljZSAob3IgTlVMTCBvbiBmYWls
dXJlKS4KPiAgICovCj4gQEAgLTcxOCwzMyArNzE3LDE5IEBAIHN0cnVjdCBpcnFfZG9tYWluICpv
Zl9tc2lfZ2V0X2RvbWFpbihzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gaXJxX2RvbWFpbl9idXNfdG9rZW4gdG9rZW4p
Cj4gIHsKPiAtICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbXNpX25wOwo+ICsgICAgICAgc3Ry
dWN0IG9mX3BoYW5kbGVfYXJncyBhcmdzOwo+ICAgICAgICAgc3RydWN0IGlycV9kb21haW4gKmQ7
Cj4gKyAgICAgICBpbnQgaW5kZXggPSAwOwo+Cj4gLSAgICAgICAvKiBDaGVjayBmb3IgYSBzaW5n
bGUgbXNpLXBhcmVudCBwcm9wZXJ0eSAqLwo+IC0gICAgICAgbXNpX25wID0gb2ZfcGFyc2VfcGhh
bmRsZShucCwgIm1zaS1wYXJlbnQiLCAwKTsKPiAtICAgICAgIGlmIChtc2lfbnAgJiYgIW9mX3By
b3BlcnR5X3JlYWRfYm9vbChtc2lfbnAsICIjbXNpLWNlbGxzIikpIHsKPiAtICAgICAgICAgICAg
ICAgZCA9IGlycV9maW5kX21hdGNoaW5nX2hvc3QobXNpX25wLCB0b2tlbik7Cj4gLSAgICAgICAg
ICAgICAgIGlmICghZCkKPiAtICAgICAgICAgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChtc2lf
bnApOwo+IC0gICAgICAgICAgICAgICByZXR1cm4gZDsKPiAtICAgICAgIH0KCkRyb3BwaW5nIHRo
aXMgc3BlY2lhbCBjYXNlIG9mIHNpbmdsZSBtc2ktcGFyZW50IHByb3BlcnR5IGJyZWFrcwpSSVND
LVYgS1ZNIGd1ZXN0IGNyZWF0ZWQgdXNpbmcgS1ZNVE9PbCB3aXRoIEFJQSBhdmFpbGFibGUKb24g
dGhlIGhvc3QuCgpMZXQncyBub3QgZHJvcCB0aGlzIHNwZWNpYWwgY2FzZS4KCj4gLQo+IC0gICAg
ICAgaWYgKHRva2VuID09IERPTUFJTl9CVVNfUExBVEZPUk1fTVNJKSB7Cj4gLSAgICAgICAgICAg
ICAgIC8qIENoZWNrIGZvciB0aGUgY29tcGxleCBtc2ktcGFyZW50IHZlcnNpb24gKi8KPiAtICAg
ICAgICAgICAgICAgc3RydWN0IG9mX3BoYW5kbGVfYXJncyBhcmdzOwo+IC0gICAgICAgICAgICAg
ICBpbnQgaW5kZXggPSAwOwo+ICsgICAgICAgd2hpbGUgKCFvZl9wYXJzZV9waGFuZGxlX3dpdGhf
YXJncyhucCwgIm1zaS1wYXJlbnQiLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAiI21zaS1jZWxscyIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGluZGV4LCAmYXJncykpIHsKPiArICAgICAgICAgICAgICAgZCA9IGlycV9m
aW5kX21hdGNoaW5nX2hvc3QoYXJncy5ucCwgdG9rZW4pOwo+ICsgICAgICAgICAgICAgICBpZiAo
ZCkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZDsKPgo+IC0gICAgICAgICAgICAg
ICB3aGlsZSAoIW9mX3BhcnNlX3BoYW5kbGVfd2l0aF9hcmdzKG5wLCAibXNpLXBhcmVudCIsCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiNtc2kt
Y2VsbHMiLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGluZGV4LCAmYXJncykpIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICBkID0gaXJxX2Zp
bmRfbWF0Y2hpbmdfaG9zdChhcmdzLm5wLCB0b2tlbik7Cj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgaWYgKGQpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZDsKPiAt
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQoYXJncy5ucCk7Cj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgaW5kZXgrKzsKPiAtICAgICAgICAgICAgICAgfQo+ICsgICAgICAg
ICAgICAgICBvZl9ub2RlX3B1dChhcmdzLm5wKTsKPiArICAgICAgICAgICAgICAgaW5kZXgrKzsK
PiAgICAgICAgIH0KPgo+ICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gLS0KPiAyLjQ1LjIKPgo+CgpS
ZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
