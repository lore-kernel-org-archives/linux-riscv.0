Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03025C7115C
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Jun 2025 10:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OszGfrgGV68JhwZfKJkkgs2XsZgA05VUcIemshumYOA=; b=XWvnRDSKNIcX6u
	ukti+DcBs4+horPeYQEBtpuKXG9OtXMXaBd5WvGZotfkGmIAtTjaVitbxPWast9+2rb/mZGO28tho
	AoOdwZ+Ypw0jYdXZmQPfY4noiS3QJOWleiAf6GhxOMzP3epQCgYAV3iM5Hw5VnXutd6S2T/Nx+QZG
	H1Z3pLOl+tTpcv1YFUBZQ3WgMtPAzVtmqpbBpKQeYU4wB3Mwy7ceq3vumoUcqIBtMdRlkL6a06IUM
	KZJCHx8C+GSgssx7Rqp9+9QIuqGKtXonLI94InOMAjYzYPuIeTRuiN0YHFjcwvwweFj0U0v5K6wcB
	fUDCV/0vf552LG2B90Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTHgG-00000000js1-1iuQ;
	Sun, 22 Jun 2025 10:12:08 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTHgD-00000000jpM-0yDC
	for linux-riscv@lists.infradead.org;
	Sun, 22 Jun 2025 10:12:06 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2363497cc4dso27680515ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 22 Jun 2025 03:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750587121; x=1751191921; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhd7Psksfo9MLj/RnU9tn25T95OkdzIn/rvFvguRfxI=;
        b=PrT3uBM4s+f3/OzAIfbgfGBLsTx4E2DiFwoCEg6mvEVfXySwsd/BDYVdDU4WzbfhDu
         3o69OQC6mUvXHV/Jin2NFA7y0OojlZIzBEys8fnRy2rdcwOEBJioY1V4kwPkgvWpXo/r
         iDWMWKUx9lulRIJlmFHjI70fSnYtfRDx9zFN9l2bPVLokiMW76O4rRtMOGVf7ETBIcfN
         82f8rAeXH7I39yIrQe63xW9734cflHu7yLCUGQCxI7+4uQo0/tAcS0UWLRSQ9/fjZsoo
         hQ4ZZqvTYA+O60etQt6x01N2OfdH0Bjn0YHZzF1myEOVEsfHcL6PhzJT2Wj+jiBYM07f
         wCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750587121; x=1751191921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhd7Psksfo9MLj/RnU9tn25T95OkdzIn/rvFvguRfxI=;
        b=mjGde5VzAT2KAt4QOIGvTIu9CFwgGi0YiQ7lr3lHNnc5KhRMssQUmFbwnU4tsIWuAr
         oZaSAmkjq628QKKOdkiC94LIUT5Cxmy4iiad1EoRCHwh2BMMOWMirZtz6G7WxquUJ7Zm
         smRfi2vdXDVRwbTL6ctT9sQmp+mPryPuz+tMOovyiPRdq9GQ/0Alx8BayVEz1quz9cQA
         LltN0AeQ5AvuAegMWswDxXrQsHZbt0gCr9AST8eFPNIZKJaMI/K7sKIv+ON/LIUDj7HD
         lcdpZ8ki+hI3DFnLD5kuQ8gCz6VOH/gvVF6l87Sw3N+aFZcPvGsHRlAj0fsRYce7m/aO
         fg2g==
X-Forwarded-Encrypted: i=1; AJvYcCWhtVdGp99LdMt5qn/1Pe7TvlYFQFHkAPeS10DEt+pSvuj+k/LWvhawAKtCpsKKdPSDTqgpvX3ca4J6HA==@lists.infradead.org
X-Gm-Message-State: AOJu0YznJB1eSmj+9VDTF/xLlVqEhvHfvKmlmUBzwF+tvGmfvBTeSq9h
	vrDaoTzkkFxYSGMSFj5Na3mij8vvoDQWPVkbHWqlvd7rrRbkxEkKVh7LBIYib0Drj2nSjrdiFbm
	9a4EcuzA7mCH2IGJ0ujMRqRvw295ae8V8/f7SRu5UUA==
X-Gm-Gg: ASbGncv/fVOO1Dl5q+i85JFcKuX62EHjXfJ01we1mowI2YV4YC1ORs0dVTnWuj2BrCO
	687s47fkUHjIzR2lDI1mvk98DasjExr2/qm4SS1Mcesh/dLgjzsG1sFjVe4Ai2GlhPH8wdYN2eI
	UvC0LCL7+MJc2p8P9tLqzaG+m4h4llmmJZqHqS/A+0LbljJR3U8BqGoAAK
X-Google-Smtp-Source: AGHT+IGsWzTP6/gbvQ/CA0ejRIYXVE3ACO/w0NVroX/xY0eGzRwP6PYHlp4erxCJ+zZG6ZfDl+/adXC35SQaJWcaE8g=
X-Received: by 2002:a17:902:c405:b0:235:e8da:8d6 with SMTP id
 d9443c01a7336-237d97c3b5bmr151787145ad.2.1750587120557; Sun, 22 Jun 2025
 03:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250620091720.85633-1-luxu.kernel@bytedance.com> <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
In-Reply-To: <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Sun, 22 Jun 2025 18:11:49 +0800
X-Gm-Features: AX0GCFsb818yKyl7dINvhKYBkJJnEFckaB0ZfIHP1lNH7P09XFDmloWPadWx7s8
Message-ID: <CAPYmKFvcnDJWXAUEX8oY6seQrgwKiZjDqrJ_R2rJ4kWq7RQUSg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: KVM: Delegate illegal instruction fault
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: anup@brainfault.org, atish.patra@linux.dev, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_031205_397090_E42C3BA5 
X-CRM114-Status: GOOD (  12.59  )
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

SGkgUmFkaW0sCgpPbiBGcmksIEp1biAyMCwgMjAyNSBhdCA4OjA04oCvUE0gUmFkaW0gS3LEjW3D
ocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gMjAyNS0wNi0yMFQxNzox
NzoyMCswODowMCwgWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+Ogo+ID4gRGVsZWdh
dGUgaWxsZWdhbCBpbnN0cnVjdGlvbiBmYXVsdCB0byBWUyBtb2RlIGluIGRlZmF1bHQgdG8gYXZv
aWQgc3VjaAo+ID4gZXhjZXB0aW9ucyBiZWluZyB0cmFwcGVkIHRvIEhTIGFuZCByZWRpcmVjdGVk
IGJhY2sgdG8gVlMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWHUgTHUgPGx1eHUua2VybmVsQGJ5
dGVkYW5jZS5jb20+Cj4gPiAtLS0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2t2bV9ob3N0LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiA+IEBA
IC00OCw2ICs0OCw3IEBACj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBCSVQoRVhDX0lOU1RfSUxMRUdBTCkgICAgfCBcCj4KPiBZb3Ugc2hvdWxkIGFsc28gcmVtb3Zl
IHRoZSBkZWFkIGNvZGUgaW4ga3ZtX3Jpc2N2X3ZjcHVfZXhpdC4KCkkgb25seSB3YW50IHRvIGRl
bGVnYXRlIGl0IGJ5IGRlZmF1bHQuIEFuZCBLVk0gbWF5IHN0aWxsIHdhbnQgdG8KZGVsZWdhdGUg
ZGlmZmVyZW50IGV4Y2VwdGlvbnMgZm9yIGRpZmZlcmVudCBWTXMgbGlrZSB3aGF0IGl0IGRvZXMg
Zm9yCkVYQ19CUkVBS1BPSU5ULiBTbyBtYXliZSBpdCBpcyBiZXR0ZXIgdG8gcmVzZXJ2ZSB0aGVz
ZSBjb2Rlcz8KCj4KPiBBbmQgd2h5IG5vdCBkZWxlZ2F0ZSB0aGUgb3RoZXJzIGFzIHdlbGw/Cj4g
KEVYQ19MT0FEX01JU0FMSUdORUQsIEVYQ19TVE9SRV9NSVNBTElHTkVELCBFWENfTE9BRF9BQ0NF
U1MsCj4gIEVYQ19TVE9SRV9BQ0NFU1MsIGFuZCBFWENfSU5TVF9BQ0NFU1MuKQoKVGhhbmtzIGZv
ciB0aGUgcmVtaW5kZXIuIEkgd2lsbCBoYXZlIGEgdGVzdCBhbmQgcmVzZW5kIHRoZSBwYXRjaCBp
ZiBpdCB3b3Jrcy4KCj4KPiBUaGFua3MuCgpCZXN0IFJlZ2FyZHMsClh1IEx1CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
