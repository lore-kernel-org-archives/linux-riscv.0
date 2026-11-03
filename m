Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230C3606D812
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 15:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SbET8Og/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=IQJr3vFR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=I3V2wte+o1sftVlPpyJLcp+Jq+hKA/dTyQgDeuLkspI=; b=SbET8Og/vE4WFC9OFvwMc4fDPh
	8kQJHVs78dEgVK8+DgMAkPRpHDgS1NYGsuRVx8TukAYGi+bgqQcFWn2CKq7T7BlZicQcqW7eOfC73
	VwfVz4Dz5UmF5tlPIWhrpWPDfA7kmoV7dgkhdNryTs5DkG3xIpKz/JgEmt+g94RlqTyjS5wUjMmZ5
	7CjliwufZ+DWCI5b6XADtxiKUSYde45E5SHgifBR0eP1pEiUPEgmE61vYZo5xKE55qBuwbzR1mYkG
	034adhDSnTr6JUvEO61rikPqgbNPSohOezbdFyzriaAsfLN+asLcYAi6rDXEiZPeizOzaPe/u1hQF
	qjrlm3Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGoR-000000031kX-2xBA;
	Tue, 03 Nov 2026 15:52:39 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGoJ-000000031hv-3h32
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 15:52:33 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48c4be28b82so4519669f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2026 07:52:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793721149; cv=none;
        d=google.com; s=arc-20260327;
        b=QpPYIu+prI2N1CNZNzmAyXHGmvNHfy5cA5WG4BcLhqUZyfyggd4UbEon+rLWF6FNNW
         /YLS7k/MPoDcYCQSV5SWAFHVBxp8NfALE/+8QfhQMsIT7l55+kmVL5rf5jscqAvscZkz
         9jL8TeveBD4Si6gYb8pGvk99piIRE5+7tAmMsmDT0Q3vrp79BC439QF2QmIWdqqA2EYi
         ocXksSciUTogWhqzasCInX+1OmuNmPmXZzNUB8py0Q1FzWzUmyJgDlYh09CDoGHpaBWR
         MMehxxSi4R15fa+EYf18ktfzBuNZA5RhLt4W2CAEc2rizmApFXnWtxATHH9Q9ePNnI9W
         Tg5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cj3GedmPh7Cu6AsgVSUDiDu7DEi6SUzKXZt5ynjowoU=;
        fh=KY5Z6iNcn1htJJ7vvggMvVlKfSb4s/KrkNifR8Rd5v8=;
        b=s6B9NJVTIJSysNA6X6CqK4+1UmFwx4RH4QXEV2DSZGXCYngFEha1I+kKiGA0zu0fGj
         /6kx1mg7fZtt24BuT7flpNmpQplZCK2CFaNFhtZY+cJ3brat12VwQXeE7TLhDoBd+/SH
         0sfBe9EGcIpCUWECZQ5CAUlLMeuoTJLfVUk3Q1QicRxpZ6upZfP+eV2ROvDIbCbf3/yY
         fCWuu86E4E6AqdfpVU5eWgjgk78Nr3r+5uZK/vXRWfkb2xj/EZpEFj3cTGLdnkIw8D4f
         CyO+csYUCe2xXPfOBSqztUvnmoYRmMokt6C+6ZH+Q89UMovzn8gDLjit9Ot7tstQ8Q0x
         haSw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793721149; x=1794325949; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cj3GedmPh7Cu6AsgVSUDiDu7DEi6SUzKXZt5ynjowoU=;
        b=IQJr3vFRm5fpvbm/tM5NT4Sk2QupAPV0SNxEYdLFpsVMSWKtmCgRusvTFSeUPodUMx
         MlpWFSAJ1+/m13E6F8TRGdOw10TR3FYV87jkww9Bn7zlVvivNYA7vbqifjFGuaxYrH4f
         O1PKwtKAct78k6NQhNBwoU8RTXdB3yh6RGYKgGGERqM4eGROgx7rSA/us3sWexjs33E0
         f8LJz0oAGMAjf6N6jZsSH8r0vqYBTz+vaEeZ/f2nvprzbiGFFpwWm5dY2+tjHmWtxMQ8
         fIi4tgoMFef66cxdTceqBFSPqCe1HOAY+xfrVsvdY8P0DBgJNqYyMInp4G2RI4codKkl
         c4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721149; x=1794325949;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cj3GedmPh7Cu6AsgVSUDiDu7DEi6SUzKXZt5ynjowoU=;
        b=tJMo/hmg3jd5vdNN3ybuyO+aw+kuV7X2vXSOECuootVBPBuPN0j0kBXX1FXg89VF4P
         4yvnG0T7arfeynAg1W+qKKqzWCAM18kNThNhycLZPfEqDnEivpJ35BnOmu5HAjjsT8KW
         BSioO4vEUuU+fOVijNb4J7/lgPfIwyNnNlnVqBIig/ODhCI2TMWG3QRJRQmRc0P4tF2/
         7s6OJNdeeSAU9wz6+I6b1MpLyZ4gSv7GHY9EN0s4zIl6HGb1wpRyWnxSBBV9yOYruYF7
         GW0eK9edUCtU+QCfbqWEiAcVIkzJVh1pJHHfKPzxfAYz6zvhLW7F9Z9Z0EqgiUtqAmWr
         MV+w==
X-Forwarded-Encrypted: i=1; AKwUvBzN7PeE8xx5bof34U2eN/JU0s+LI0fJD41RqsejE2kcOPFOuRjsoJMzERYkwkQ2z3OWlmuRpTBnnT1h3Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z+plnXPjYEaFp88Gaqq8TEDarkNJpetVrdgbZWdEyspc6sc+MAc
	oOb0N/Y/Gn7B2z7QFGLeB9bk0IkeWc7d0QiOCGLuyphtkUT371S7Pyi+hV8ng5Dgcq4oB4rjlYI
	bqCRO1zf2wdcwWjjD3z+Y/YjsYwnCrnReI44b+UIkHQ==
X-Gm-Gg: AYBFou0pB6foeLXdp75/DoqiGxTKMxhH7jj/pNML72ewqG+vrriNXYmFSYXR+rQFexi
	j1mvarAoPQG4QVSw+Nwimm8yjcXdfgqn/3cn3LSO1XnPR9VxGfULaK+iN88LUMZfGE7HVRslTyc
	Dn/XT1oRNkCVtml7rDzi/+z8g0yofRj/+9C31qoYA8Pj4vb48W0NHa6noCtqQ50Iq5Vg43wMKPA
	DIuEmj7gIQtbPcSqakl99JhSAisQUgaurvr39Ow/pF/jF2Y8aGfLQbfe8Zkn2+rNG6CadqueoRK
	3MjSEmaKliqcEUcW1gMyaHe3DKS2+QBkgSXs9J+ZfC7U3q71wxGGIj5+cTEniYIN046w3xrJfls
	H0/ADpwQhFI/8xPWrooWAtKttflEz9V1Zp26SaEG0JWm3JMqM1+xpH9xuVkz1YZvb/GLjSvP0cu
	9hOvyVVIy59RSy3u9GWLUoTwngQXchZNXfmx1dYcyUwV/2Nun9di87qTWq
X-Received: by 2002:a05:6000:4026:b0:48b:4a2:8175 with SMTP id
 ffacd0b85a97d-48e6e501911mr30600099f8f.43.1793721149190; Tue, 03 Nov 2026
 07:52:29 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-imsic-remote-sync-irqwork-v1-1-8b5c951fc62a@linux.dev>
In-Reply-To: <20261103-imsic-remote-sync-irqwork-v1-1-8b5c951fc62a@linux.dev>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 3 Nov 2026 21:22:17 +0530
X-Gm-Features: AclHuK-Duz2U2kH9foWsdX6nwnK4quq9DLKbc6uMPaHmTR3hhx4HWy-1ofAnrKc
Message-ID: <CAAhSdy26R41W6OsTpEjMCf6iQXrtn4WrzziuGg+S9pHOHtM--A@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-imsic: Synchronize remote state with IRQ work
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rt-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_075231_959637_BE223861 
X-CRM114-Status: GOOD (  38.03  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBOb3YgMywgMjAyNiBhdCAxOjM04oCvUE0gVHJveSBNaXRjaGVsbCA8dHJveS5taXRj
aGVsbEBsaW51eC5kZXY+IHdyb3RlOgo+Cj4gUmVtb3RlIElNU0lDIHN0YXRlIHVwZGF0ZXMgYXJl
IGRlZmVycmVkIHRvIGEgdGltZXIgb24gdGhlIHRhcmdldCBDUFUuCj4gSWYgdGhhdCBDUFUgaGFz
IHN0b3BwZWQgaXRzIGxvY2FsIGNsb2NrZXZlbnQgYW5kIGlzIHdhaXRpbmcgZm9yIGEKPiBicm9h
ZGNhc3QgaW50ZXJydXB0LCBlbmFibGluZyB0aGUgYnJvYWRjYXN0IElSUSBjYW4gZGVwZW5kIG9u
IGRlbGl2ZXJ5Cj4gb2YgdGhhdCBzYW1lIGludGVycnVwdC4gVGhpcyBjYW4gc3RhbGwgdGltZXIg
ZGVsaXZlcnkgd2hlbiB0aGUgYnJvYWRjYXN0Cj4gSVJRIGlzIHVubWFza2VkIG9yIG1vdmVkIHRv
IGFub3RoZXIgQ1BVLCBpbmNsdWRpbmcgZHVyaW5nIENQVSBob3RwbHVnLgo+Cj4gUXVldWUgaGFy
ZCBJUlEgd29yayB0byBzeW5jaHJvbml6ZSByZW1vdGUgc3RhdGUgaW5kZXBlbmRlbnRseSBvZiB0
aW1lcgo+IGRlbGl2ZXJ5LiBLZWVwIHN5bmNocm9ub3VzIHVwZGF0ZXMgb24gdGhlIGxvY2FsIENQ
VSBhbmQgdGhlIHRpbWVyIHJldHJ5Cj4gZm9yIGFuIHVuZmluaXNoZWQgdmVjdG9yIG1vdmUuIEhh
cmQgSVJRIHdvcmsgYWxzbyBhdm9pZHMgZGVwZW5kaW5nIG9uIGEKPiBzY2hlZHVsYWJsZSB3b3Jr
ZXIgd2hlbiBQUkVFTVBUX1JUIGlzIGVuYWJsZWQuCgpVc2luZyB0aW1lciByZXRyeSBmb3IgbG9j
YWwgQ1BVIGFuZCBJUlEgd29yayBxdWV1ZSBmb3IgcmVtb3RlIENQVXMgbG9va3MKc3RyYW5nZS4g
V2h5IG5vdCB1c2UgSVJRIHdvcmsgcXVldWUgZXZlbiBmb3IgbG9jYWwgQ1BVID8/Cgo+Cj4gRml4
ZXM6IDIxYThmOGEwZWIzNSAoImlycWNoaXA6IEFkZCBSSVNDLVYgaW5jb21pbmcgTVNJIGNvbnRy
b2xsZXIgZWFybHkgZHJpdmVyIikKPiBTaWduZWQtb2ZmLWJ5OiBUcm95IE1pdGNoZWxsIDx0cm95
Lm1pdGNoZWxsQGxpbnV4LmRldj4KPiAtLS0KPiBUaGlzIHdhcyBmb3VuZCB3aGlsZSBicmluZ2lu
ZyB1cCB0aGUgU29DIHRpbWVyIG9uIFNwYWNlbWlUIEszIGFzIGEgdGljawo+IGJyb2FkY2FzdCBk
ZXZpY2UuCj4KPiBXaXRob3V0IGEgcmVhbCBicm9hZGNhc3QgZGV2aWNlLCB0aGUgdGljayBjb2Rl
IGZhbGxzIGJhY2sgdG8gdGhlIGhydGltZXIKPiBiYXNlZCBicm9hZGNhc3QsIHdoaWNoIGtlZXBz
IG9uZSBDUFUncyBsb2NhbCB0aW1lciBydW5uaW5nLiBPbmNlIHRoZSBTb0MKPiB0aW1lciBpcyBy
ZWdpc3RlcmVkIGl0IHJlcGxhY2VzIHRoZSBocnRpbWVyIGJyb2FkY2FzdCwgYW5kIGV2ZXJ5IENQ
VSBtYXkKPiBzdG9wIGl0cyBsb2NhbCB0aW1lciBpbiBpZGxlLgo+Cj4gT24gSzMgdGhlIFNvQyB0
aW1lciBpbnRlcnJ1cHQgZ29lcyB0aHJvdWdoIEFQTElDIGluIE1TSSBtb2RlIHRvIElNU0lDLgo+
IFdoZW4gdGhlIENQVSBvd25pbmcgaXQgZ29lcyBvZmZsaW5lLCB0aGUgaW50ZXJydXB0IGlzIG1v
dmVkIHRvIGEgQ1BVCj4gdGhhdCBtYXkgYWxyZWFkeSBiZSBpZGxlIHdpdGggaXRzIGxvY2FsIHRp
bWVyIHN0b3BwZWQuIElNU0lDIGxlYXZlcyB0aGUKPiBlbmFibGUgb24gdGhlIG5ldyB0YXJnZXQg
dG8gYSB0aW1lciBvbiB0aGF0IENQVSwgYW5kIHRoYXQgdGltZXIgY2FuIG9ubHkKPiBmaXJlIHRo
cm91Z2ggdGhlIGJyb2FkY2FzdCBpbnRlcnJ1cHQsIHdoaWNoIGlzIG5vdCBlbmFibGVkIHlldC4g
VGhlCj4gc3lzdGVtIHN0YWxscy4KPgo+IFRlc3RlZCBvbiBhIEszIENPTTI2MCBib2FyZCBieSBv
ZmZsaW5pbmcgdGhlIENQVSBvd25pbmcgdGhlIGJyb2FkY2FzdAo+IGludGVycnVwdCwgYW5kIHRo
ZW4gZWFjaCBDUFUgaW4gdHVybiwgdW5kZXIgYSB0aW1lcmZkIGxvYWQ6Cj4gLSB2Ny40LXJjMSB3
aXRoIHRoZSBTcGFjZW1pVCBTb0MgdGltZXIgc2VyaWVzIGFuZCBsb2NhbCB0aW1lcnMgZm9yY2Vk
Cj4gICB0byBzdG9wIGluIGlkbGUKPiAtIGEgdmVuZG9yIDYuMTgga2VybmVsIHdpdGggU0JJIGNw
dWlkbGUgc3RhdGVzIHRoYXQgc3RvcCB0aGUgbG9jYWwgdGltZXIKPgo+IEJvdGggc3RhbGwgd2l0
aG91dCB0aGlzIHBhdGNoIGFuZCBwYXNzIHdpdGggaXQuCj4gLS0tCj4gIGRyaXZlcnMvaXJxY2hp
cC9LY29uZmlnICAgICAgICAgICAgICAgICB8ICAxICsKPiAgZHJpdmVycy9pcnFjaGlwL2lycS1y
aXNjdi1pbXNpYy1zdGF0ZS5jIHwgMTkgKysrKysrKysrKysrKy0tLS0tLQo+ICBkcml2ZXJzL2ly
cWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmggfCAgNCArKysrCj4gIDMgZmlsZXMgY2hhbmdl
ZCwgMTggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2lycWNoaXAvS2NvbmZpZyBiL2RyaXZlcnMvaXJxY2hpcC9LY29uZmlnCj4gaW5kZXggMTM2
YmFiNDFmODAxLi41Y2RjM2Y1MjE5OGMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL0tj
b25maWcKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvS2NvbmZpZwo+IEBAIC02NTEsNiArNjUxLDcg
QEAgY29uZmlnIFJJU0NWX0lNU0lDCj4gICAgICAgICBib29sCj4gICAgICAgICBkZXBlbmRzIG9u
IFJJU0NWCj4gICAgICAgICBzZWxlY3QgSVJRX0RPTUFJTl9ISUVSQVJDSFkKPiArICAgICAgIHNl
bGVjdCBJUlFfV09SSyBpZiBTTVAKPiAgICAgICAgIHNlbGVjdCBHRU5FUklDX0lSUV9NQVRSSVhf
QUxMT0NBVE9SCj4gICAgICAgICBzZWxlY3QgR0VORVJJQ19NU0lfSVJRCj4gICAgICAgICBzZWxl
Y3QgSVJRX01TSV9MSUIKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1p
bXNpYy1zdGF0ZS5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5jCj4g
aW5kZXggMDE2MjAzNzNiNDNhLi5mNjM3M2U0MDE5YTIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9p
cnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5jCj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2ly
cS1yaXNjdi1pbXNpYy1zdGF0ZS5jCj4gQEAgLTI1Miw2ICsyNTIsMTEgQEAgdm9pZCBpbXNpY19s
b2NhbF9kZWxpdmVyeShib29sIGVuYWJsZSkKPiAgfQo+Cj4gICNpZmRlZiBDT05GSUdfU01QCj4g
K3N0YXRpYyB2b2lkIGltc2ljX2xvY2FsX3N5bmNfd29yayhzdHJ1Y3QgaXJxX3dvcmsgKndvcmsp
Cj4gK3sKPiArICAgICAgIGltc2ljX2xvY2FsX3N5bmNfYWxsKGZhbHNlKTsKPiArfQo+ICsKPiAg
c3RhdGljIHZvaWQgaW1zaWNfbG9jYWxfdGltZXJfY2FsbGJhY2soc3RydWN0IHRpbWVyX2xpc3Qg
KnRpbWVyKQo+ICB7Cj4gICAgICAgICBpbXNpY19sb2NhbF9zeW5jX2FsbChmYWxzZSk7Cj4gQEAg
LTI2OCwxOCArMjczLDE5IEBAIHN0YXRpYyB2b2lkIF9faW1zaWNfcmVtb3RlX3N5bmMoc3RydWN0
IGltc2ljX2xvY2FsX3ByaXYgKmxwcml2LCB1bnNpZ25lZCBpbnQgY3B1Cj4gICAgICAgICAgKi8K
Pgo+ICAgICAgICAgLyoKPiAtICAgICAgICAqIFdlIHNjaGVkdWxlIGEgdGltZXIgb24gdGhlIHRh
cmdldCBDUFUgaWYgdGhlIHRhcmdldCBDUFUgaXMgbm90Cj4gLSAgICAgICAgKiBzYW1lIGFzIHRo
ZSBjdXJyZW50IENQVS4gQW4gb2ZmbGluZSBDUFUgd2lsbCB1bmNvbmRpdGlvbmFsbHkKPiAtICAg
ICAgICAqIHN5bmNocm9uaXplIElEcyB0aHJvdWdoIGltc2ljX3N0YXJ0aW5nX2NwdSgpIHdoZW4g
dGhlCj4gLSAgICAgICAgKiBDUFUgaXMgYnJvdWdodCB1cC4KPiArICAgICAgICAqIEEgcmVtb3Rl
IENQVSBtYXkgaGF2ZSBzdG9wcGVkIGl0cyBsb2NhbCB0aW1lciBhbmQgYmUgd2FpdGluZyBmb3IK
PiArICAgICAgICAqIHRoZSBicm9hZGNhc3QgaW50ZXJydXB0IHdob3NlIElNU0lDIHN0YXRlIG5l
ZWRzIHVwZGF0aW5nLiBVc2UgYW4KPiArICAgICAgICAqIElQSS1iYWNrZWQgd29yayBpdGVtIHNv
IGVuYWJsaW5nIHRoYXQgaW50ZXJydXB0IGRvZXMgbm90IGRlcGVuZCBvbgo+ICsgICAgICAgICog
aXRzIGRlbGl2ZXJ5LiBBbiBvZmZsaW5lIENQVSBzeW5jaHJvbml6ZXMgSURzIGluIGltc2ljX3N0
YXJ0aW5nX2NwdSgpLgo+ICAgICAgICAgICovCj4gICAgICAgICBpZiAoY3B1X29ubGluZShjcHUp
KSB7Cj4gICAgICAgICAgICAgICAgIGlmIChjcHUgPT0gc21wX3Byb2Nlc3Nvcl9pZCgpKSB7Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgaWYgKF9faW1zaWNfbG9jYWxfc3luYyhscHJpdikpCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgX19pbXNpY19sb2NhbF90aW1lcl9zdGFydChscHJpdiwgY3B1KTsKPiArICAgICAg
ICAgICAgICAgfSBlbHNlIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBpcnFfd29ya19xdWV1
ZV9vbigmbHByaXYtPnN5bmNfd29yaywgY3B1KTsKPiAgICAgICAgICAgICAgICAgfQo+IC0KPiAt
ICAgICAgICAgICAgICAgX19pbXNpY19sb2NhbF90aW1lcl9zdGFydChscHJpdiwgY3B1KTsKPiAg
ICAgICAgIH0KPiAgfQo+ICAjZWxzZQo+IEBAIC01MTAsNiArNTE2LDcgQEAgc3RhdGljIGludCBf
X2luaXQgaW1zaWNfbG9jYWxfaW5pdCh2b2lkKQo+ICAjaWZkZWYgQ09ORklHX1NNUAo+ICAgICAg
ICAgICAgICAgICAvKiBTZXR1cCBsYXp5IHRpbWVyIGZvciBzeW5jaHJvbml6YXRpb24gKi8KPiAg
ICAgICAgICAgICAgICAgdGltZXJfc2V0dXAoJmxwcml2LT50aW1lciwgaW1zaWNfbG9jYWxfdGlt
ZXJfY2FsbGJhY2ssIFRJTUVSX1BJTk5FRCk7Cj4gKyAgICAgICAgICAgICAgIGxwcml2LT5zeW5j
X3dvcmsgPSBJUlFfV09SS19JTklUX0hBUkQoaW1zaWNfbG9jYWxfc3luY193b3JrKTsKPiAgI2Vu
ZGlmCj4KPiAgICAgICAgICAgICAgICAgLyogQWxsb2NhdGUgdmVjdG9yIGFycmF5ICovCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuaCBiL2RyaXZl
cnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuaAo+IGluZGV4IDE4OTgyOWI4NjczYS4u
YTM2YjlmMGVmODQwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1z
aWMtc3RhdGUuaAo+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUu
aAo+IEBAIC05LDYgKzksNyBAQAo+Cj4gICNpbmNsdWRlIDxsaW51eC9pcnFjaGlwL3Jpc2N2LWlt
c2ljLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9pcnFkb21haW4uaD4KPiArI2luY2x1ZGUgPGxpbnV4
L2lycV93b3JrLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9md25vZGUuaD4KPiAgI2luY2x1ZGUgPGxp
bnV4L3RpbWVyLmg+Cj4KPiBAQCAtMzQsNiArMzUsOSBAQCBzdHJ1Y3QgaW1zaWNfbG9jYWxfcHJp
diB7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nICAgICAgICAgICAgICAgICAgICAgICAgICAgKmRp
cnR5X2JpdG1hcDsKPgo+ICAjaWZkZWYgQ09ORklHX1NNUAo+ICsgICAgICAgLyogUmVtb3RlIHN5
bmNocm9uaXphdGlvbiBtdXN0IG5vdCBkZXBlbmQgb24gYSB0aW1lciBpbnRlcnJ1cHQuICovCj4g
KyAgICAgICBzdHJ1Y3QgaXJxX3dvcmsgICAgICAgICAgICAgICAgICAgICAgICAgc3luY193b3Jr
Owo+ICsKPiAgICAgICAgIC8qIExvY2FsIHRpbWVyIGZvciBzeW5jaHJvbml6YXRpb24gKi8KPiAg
ICAgICAgIHN0cnVjdCB0aW1lcl9saXN0ICAgICAgICAgICAgICAgICAgICAgICB0aW1lcjsKPiAg
I2VuZGlmCj4KPiAtLS0KPiBiYXNlLWNvbW1pdDogNjYyOGU3ZDRjNmIyNWM4ZDE4ZjEzNDVlM2Ey
MGQyMTgyOWFhZTdlNAo+IGNoYW5nZS1pZDogMjAyNjExMDMtaW1zaWMtcmVtb3RlLXN5bmMtaXJx
d29yay05Y2ZlYzZjNDEwZGUKPgo+IEJlc3QgcmVnYXJkcywKPiAtLQo+IFRyb3kgTWl0Y2hlbGwg
PHRyb3kubWl0Y2hlbGxAbGludXguZGV2Pgo+CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
