Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC88C021B2
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Feb 2025 07:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JHOBI7ZymcycmG8XpmX0hYiv2o3GufC65gaqcrEnEDI=; b=CEF4KZZdcR6IfL
	1sR5BwainutWVpN39pTqdmw4/jOEydJJccW9QULA+Ib1a7JFTlAR0lWNxYDa2HbjDWHeKYtruPh3P
	dYZPOtxdy5f7p4ReF1MlCEmg/xKp4b9Q+NuIYddYCHFVJDnGw4KJNTIsUE/AJFXKwvj4Kw7Qlb8jk
	Ltv0R8Lc5J70brCAvWFNSvs4ylunItxWH18x6qYPx17xHRPwkT9rHanOZmWKkZ9tuGkgk8gW59kAP
	TBeFph/xTgniYs3oFEfSqAFwEiQlmtKzTiQTXoA6rOdpYBLY+nxG2AurXvfA+fIpFhtrGDhBjlgpH
	JkvM1Jwmu7ZZyitVkgKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm6AW-0000000AZO4-2qpa;
	Sun, 23 Feb 2025 07:12:52 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tm6AT-0000000AZNZ-2FjQ
	for linux-riscv@lists.infradead.org;
	Sun, 23 Feb 2025 07:12:50 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e545c1e8a15so4061279276.1
        for <linux-riscv@lists.infradead.org>; Sat, 22 Feb 2025 23:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1740294768; x=1740899568; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldzcQVZLNCUbBkmkSbK9JX+buCbspNWQzfPcTiRZxPU=;
        b=Mtziv8/FJb6p/bWghIPVVf/BVMDtJuF8Jt5FydCYsv+vRCvxhk8/KqJuBLCvNL253B
         JMJObsLU9YsLXXN01ug2iKJT5rR81yL88JRG/+4rnA6AQy6My/NHFUoFvXOZVkDBPF6B
         YOG3eFlf06dgPOI+QDiWpBQwxrEbkL8DWPfML0ok/GdO2boF7dGHSwpQnWv1tdG8UwZO
         wqceXJaL+Me7UwJdjPmBoLUPIWC6p/gvofBSfAqvQyy2ubtktas/aWXNvdu+ypiwGYLb
         wxMGIIinhu5Mil7/qDat2xP3oddWw0YG3AEN1NLM354mSrsO/rm0N4Tv4xgx4AqfK99I
         LJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740294768; x=1740899568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldzcQVZLNCUbBkmkSbK9JX+buCbspNWQzfPcTiRZxPU=;
        b=TiTG6uMm/JO/M96oFAGOgCtmjZ8lG412T/uZjrCPA6lGibzfYMT2ilDl4muF5f5PJq
         ZN9XXmBWRNnhpJn/khNw+apIJw5C+jh7OTDii3MHFYsi7odNZDpeScTOFG5Ju0b10L+E
         1IzBcwI8X34cnGmqMiAhy9Jku6E4ShGK9V7mx/BlNeuE/mOY2M9EttaZpTlKojf3SIsf
         ssvMTVoPd90Dx4lvSQS3H6lFuQ3hHMcWckNUWATXUviWcxCJ9f0m+v6jqAMHA73EGqFq
         DlTXRPaZ6CTDsFlaRuXm29jfERryKYoDCM6U0lQJknNzYiixnwFqKiuWDUVBoUHPorFk
         plyA==
X-Forwarded-Encrypted: i=1; AJvYcCVnUIeuZ2MStbY5+J2Fu5TxLBAXrTf6i0nneM2lERWt9s3/xHLVzLI1pKpPBJ2jTugUWfhgNmtFbP4KDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzK1H8iRq3JrvzU/TnCT4/+8wsgVh8fn8Ty/2V1u/EsMtV39Mg4
	1mpJaZMeygTw6NwfjePyaksQ89th3whdQr4VjT8j1VoUCCoPGlLJ/PYTlCpJImvy/y393EGGgCH
	NEH4P2y9ELN74PY8nkRM9LvJPR05i2JJvFHPPyg==
X-Gm-Gg: ASbGncs9iWwWLTme/i1VWh9Z00lyK6525KFI9eUiSKix1kOeYFm3upkLfd5wrMqwXVP
	iPwG14xMHXNj/U4YZ3DW9xBRcE18ZK7nY/C94IAOSt9hIemdD80IBI7N4J+zr6nEpf1v0rAARq+
	KiXQoQ3llw1eIMQV/Zf1NbyuPBbqpXyEeAVg==
X-Google-Smtp-Source: AGHT+IErv7QjZvqwZj7xwVFEty3DyOMgQT39nCw3foX+DTo4lf4iob2nS49dT5fKuofFWcZyAoIBII3K1uxoegJ4n5M=
X-Received: by 2002:a05:690c:7401:b0:6ee:8363:96d3 with SMTP id
 00721157ae682-6fbcc372266mr78832957b3.27.1740294767658; Sat, 22 Feb 2025
 23:12:47 -0800 (PST)
MIME-Version: 1.0
References: <20250221000924.734006-1-cyrilbur@tenstorrent.com>
In-Reply-To: <20250221000924.734006-1-cyrilbur@tenstorrent.com>
From: Anton Blanchard <antonb@tenstorrent.com>
Date: Sun, 23 Feb 2025 18:12:36 +1100
X-Gm-Features: AWEUYZl2UnE5I4LEXGNcBcYyg7ug4nKfYel88Patux_dppHJ-4gcND83DtzAV8E
Message-ID: <CAN7m+mC18ch=+iqJxarc-Xi_W9hZZkHD-p7ZthXqH9CwDtsqKA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] riscv: uaccess: optimizations
To: Cyril Bur <cyrilbur@tenstorrent.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, charlie@rivosinc.com, jrtc27@jrtc27.com, 
	ben.dooks@codethink.co.uk, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jszhang@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_231249_645558_81FDB00A 
X-CRM114-Status: GOOD (  17.37  )
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

SGkgQ3lyaWwsCgpPbiBGcmksIEZlYiAyMSwgMjAyNSBhdCAxMTowOeKAr0FNIEN5cmlsIEJ1ciA8
Y3lyaWxidXJAdGVuc3RvcnJlbnQuY29tPiB3cm90ZToKPiBUaGlzIHNlcmllcyB0cmllcyB0byBv
cHRpbWl6ZSByaXNjdiB1YWNjZXNzIGJ5IGFsbG93aW5nIHRoZSB1c2Ugb2YKPiB1c2VyX2FjY2Vz
c19iZWdpbigpIGFuZCB1c2VyX2FjY2Vzc19lbmQoKSB3aGljaCBwZXJtaXRzIGdyb3VwaW5nIHVz
ZXIgYWNjZXNzZXMKPiBhbmQgYXZvaWRpbmcgdGhlIENTUiB3cml0ZSBwZW5hbHR5IGZvciBlYWNo
IGFjY2Vzcy4KCkkgdGVzdGVkIHRoaXMgb24gdGhlIHVwY29taW5nIFRlbnN0b3JyZW50IEFzY2Fs
b24gQ1BVIHVzaW5nIGEgc2ltcGxlCm1pY3JvYmVuY2htYXJrIChnZXRkZW50czY0KCkgb24gYSBk
aXJlY3Rvcnkgd2l0aCAxMCBmaWxlcyBpbiBpdCkgYW5kIGl0IHdhcwpzaWduaWZpY2FudGx5IGZh
c3RlciAob3ZlciA0MCUpLiBUaGlzIGNhbWUgZnJvbSBib3RoIGEgcmVkdWN0aW9uIGluCmluc3Ry
dWN0aW9uIGNvdW50IGFzIHdlbGwgYXMgYSByZWR1Y3Rpb24gaW4gc3N0YXR1cyBDU1Igd3JpdGVz
LgoKSXQgd291bGQgYmUgZ3JlYXQgaWYgd2UgY291bGQgZ2V0IHRoaXMgbWVyZ2VkIGNvbnNpZGVy
aW5nIHg4NiwgYXJtNjQgYW5kClBPV0VSIGFyZSBleHBsb2l0aW5nIHRoaXMgb3B0aW1pc2F0aW9u
IGFscmVhZHkuCgpUaGFua3MsCkFudG9uCgo+IFRoZSBlcnJvciBwYXRoIGNhbiBhbHNvIGJlIG9w
dGltaXNlZCB1c2luZyBhc20gZ290byB3aGljaCBwYXRjaGVzIDMgYW5kIDQKPiBhY2hpZXZlLiBU
aGlzIHdpbGwgc3BlZWQgdXAganVtcGluZyB0byBsYWJlbHMgYnkgYXZvaWRpbmcgdGhlIG5lZWQg
b2YgYW4KPiBpbnRlcm1lZGlhcnkgZXJyb3IgdHlwZSB2YXJpYWJsZSB3aXRoaW4gdGhlIHVhY2Nl
c3MgbWFjcm9zCj4KPiBJIGRpZCByZWFkIHRoZSBkaXNjdXNzaW9uIHRoaXMgc2VyaWVzIGdlbmVy
YXRlZC4gSXQgaXNuJ3QgY2xlYXIgdG8gbWUKPiB3aGljaCBkaXJlY3Rpb24gdG8gdGFrZSB0aGUg
cGF0Y2hlcywgaWYgYW55Lgo+Cj4gVjI6Cj4gSSd2ZSB0YWtlbiBvbiB0aGlzIHNlcmllcyBhcyB0
aGVyZSBpc24ndCBhbnkgcmVzcG9uc2UgZnJvbSBKaXNoZW5nLiBObwo+IHNpZ25pZmljYW50IGNo
YW5nZXMgb3RoZXIgdGhhbiBidWlsZCBmaXhlcy4KPiAtIEZpeGVzIGJ1aWxkIGJyZWFrYWdlIGlu
IHBhdGNoIDMgdG8gZG8gd2l0aCBub3QgaGF2aW5nIHVzZWQgJ2dvdG8nIGtleXdvcmQuCj4gLSBG
aXhlcyBidWlsZCBicmVha2FnZSBpbiBwYXRjaCA0IG9uIDMyYml0IG5vdCBoYXZpbmcgZGVsY2Fy
ZWQgX19wdHIgaW4gdGhlCj4gICBtYWNyby4KPgo+IFYzOgo+IFNpZ25pZmljYW50IGNvbW1pdCBt
ZXNzYWdlIHJld3JpdGVzLgo+ICAtIENvcnJlY3RlZCB0aGUganVzdGlmaWNhdGlvbiBmb3IgcGF0
Y2ggMgo+ICAtIEJldHRlciBleHBsYWluZWQvanVzdGlmaWVkIHBhdGNoZXMgMyBhbmQgNAo+IE1p
bm9yIGNvZGUgY2hhbmdlcyBmb3IgbGVnaWJpbGl0eSBhbmQgbW9yZSBjb21tZW50cy4KPgo+IEpp
c2hlbmcgWmhhbmcgKDQpOgo+ICAgcmlzY3Y6IGltcGxlbWVudCB1c2VyX2FjY2Vzc19iZWdpbigp
IGFuZCBmYW1pbGllcwo+ICAgcmlzY3Y6IHVhY2Nlc3M6IHVzZSBpbnB1dCBjb25zdHJhaW50cyBm
b3IgcHRyIG9mIF9fcHV0X3VzZXIoKQo+ICAgcmlzY3Y6IHVhY2Nlc3M6IHVzZSAnYXNtIGdvdG8n
IGZvciBwdXRfdXNlcigpCj4gICByaXNjdjogdWFjY2VzczogdXNlICdhc21fZ290b19vdXRwdXQn
IGZvciBnZXRfdXNlcigpCj4KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91YWNjZXNzLmggfCAy
MDUgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTUy
IGluc2VydGlvbnMoKyksIDUzIGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjM0LjEKPgo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
