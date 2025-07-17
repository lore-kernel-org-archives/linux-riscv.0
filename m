Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4EAC83F34
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 16:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YX80QDrZ/9llYfhvlHWVTDfzjVsgYjhWAsTNGZxKFUE=; b=kKrf6kxN6pnvf/
	df/n0HyRfit6sEUlkAkx9GdwB/OWxMHFN4CjXEvLDIGYzFbWblGQUZJt+uXgSaa5JrSuPaR/T3Lr3
	p2cSCy3/3b+zOOxjEFm9Exq2M/DyIXNxXqehJl0lPgKaqFtCKwl+F8xy5nCjmGvI4x61hb8FBDz6Q
	C3jx5C+I9pvQ5m8tahpf4OdR3ZP3NOV3rKr0tNyZhnmMr1XuKR56C/6EB7nze2fN4q1eEd7vXR8UI
	jXr/zzYQde27T+0YQLxaK/NOqoLLb3Z12olZE+4te/OfhHRIqHe2wXwDWwtH5CM1MRj3fxQThx+PH
	+EQjCBXBx4p/5h8koxYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRq1-0000000AhPB-1EZI;
	Thu, 17 Jul 2025 16:52:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQG4-0000000ATsO-0nGS
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 15:10:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752765051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HnTl8YyVmCQ+6lx7TAls0CZruBl5qS1i458aSA1jJeM=;
	b=NE5xQbD6T2sEoEJkCVNygdT3hJll+1xw0HcaUqf0bVVxVOz6P5QRub/KefpfzWaR2ZedoW
	hil9vlbMpTKQVRq6QyIv+NOphZjyZu64V4joz6dyXT8wRnlZv4zlNEny1+vGnsi7YD1dUm
	iY7QhiWUZvgrZD/CJsewaFX5GXKUYEs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-tdV7EamyOFGynQY6seUPfQ-1; Thu, 17 Jul 2025 11:10:49 -0400
X-MC-Unique: tdV7EamyOFGynQY6seUPfQ-1
X-Mimecast-MFC-AGG-ID: tdV7EamyOFGynQY6seUPfQ_1752765049
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f7f1b932so702297f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 17 Jul 2025 08:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752765048; x=1753369848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HnTl8YyVmCQ+6lx7TAls0CZruBl5qS1i458aSA1jJeM=;
        b=Ni/18BupvgEVjheMOgvpIKDhNzZJ9OQLP7NulD0oXI6WBcH1lOO4PE9d0NZvdkl1F6
         LOzhErRWwUGBGl2HCTr+xjn95N+qWsw9XTdUAc9+y7zztfj5osCAv1SisoDaBQdngO1y
         5hEQoNq1sRSMifs0yDWvV5KPHihn8YV7A40LJp+t4gbwUiGvW9I/HNc0m/Ufbzx4PEHn
         cuoNnohHMenPjhLnRFFCMPORJ+3aQ/ZJsDZxkBQ/BjuebCXYNPuWFECOokJRbfuFeiQ6
         CBilD/sSRXR2TjniCnC5v+fVHqFdayAgul8JTPvHEpinO7PJQ/5j/hd288fH9XzFCzEK
         TZDw==
X-Forwarded-Encrypted: i=1; AJvYcCWpdcw8yAZ1S45uL5pdPD0YwzULsuz8rrA7vaCT3RbSAXAU/0ER1ysnx7Mlyg0ItRKvV6yTg8IDz2XUSg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfEzxHmJmwf2c07l8k1z2wGseT96/oGJOwT4WRlQxq2+J06mk9
	Y8OTp/9g/s8P5tVgx/6PbRZB0OxFdlsUMUd6q+EFjsrLiZbmmgTP6qJrL9zTs5WIep5aBv929a3
	aw6qAr70V4zrB9Mal83o2tJ0jWt71foyyHbc+Vn5LRFYt2hjEm86soaLWCpcpwnyCuRzbF7vt3S
	A/dJhd4jwao/hfaNI1CCQiVPe98X3zyElJGI8HJUeAZkI2
X-Gm-Gg: ASbGnctJih7OrlyjbPmpaH7hwJow5nCVNgse6X2stw7Dkbcf0HlNgTnbhNKRk9fYt6P
	OpG/6xvPIyypYHHWHtS/BwLt5IBGBk48zmPX0xzEK0rkjNXRQCUfHlskpF+s6GYZctTM9+e7iGV
	4JhOS9YkicGOfg4qKrn+Tp
X-Received: by 2002:a05:6000:24c9:b0:3a5:1c0d:85e8 with SMTP id ffacd0b85a97d-3b60e4c219fmr5043598f8f.22.1752765048522;
        Thu, 17 Jul 2025 08:10:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6ENUSGVWfYmEMdWSfORC9F6DnzUU+kA3Bcwc1adVmjk2OuNyCtcLU+5XLyyeGoMwkUt3MfaixMxCh5LTkmLg=
X-Received: by 2002:a05:6000:24c9:b0:3a5:1c0d:85e8 with SMTP id
 ffacd0b85a97d-3b60e4c219fmr5043562f8f.22.1752765048033; Thu, 17 Jul 2025
 08:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy3_OE=R1jhF5-KBiw4mGOqHUXHdkvyeAAR18Qm8dezavQ@mail.gmail.com>
In-Reply-To: <CAAhSdy3_OE=R1jhF5-KBiw4mGOqHUXHdkvyeAAR18Qm8dezavQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 17 Jul 2025 17:10:35 +0200
X-Gm-Features: Ac12FXwFt8xOw-1JkHEa0ebnk7oHtzkOFfGQMkyq0xmPpds5qhTf7aNpQULhrXU
Message-ID: <CABgObfaqDdY8rv=Oq-BHSXLk_iUCReh_EcUKAhGbcXu7xpL6VQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 6.16 take #2
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -5GcMVXtGPNBkKnhwdQx45xV4IOTnFQaRqWl_lUG488_1752765049
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_081052_299573_CBB50672 
X-CRM114-Status: GOOD (  13.07  )
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

T24gU2F0LCBKdWwgMTIsIDIwMjUgYXQgMTI6MjXigK9QTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPiB3cm90ZToKPgo+IEhpIFBhb2xvLAo+Cj4gV2UgaGF2ZSB0d28gbW9yZSBmaXhl
cyBmb3IgdGhlIDYuMTYga2VybmVsLiBUaGUgZmlyc3Qgb25lCj4gZml4ZXMgYW4gaXNzdWUgcmVw
b3J0ZWQgYnkgQ2Fub25pY2FsIFsxXSB3aGljaCB0dXJuZWQtb3V0Cj4gdG8gYmUgYW4gaXNzdWUg
cmVsYXRlZCB0byB0aW1lciBjbGVhbnVwIHdoZW4gZXhpdGluZyB0bwo+IHVzZXItc3BhY2UuIFRo
ZSBzZWNvbmQgZml4IGFkZHJlc3NlcyBhIHJhY2UtY29uZGl0aW9uCj4gaW4gdXBkYXRpbmcgSEdF
SUUgQ1NSIHdoZW4gSU1TSUMgVlMtZmlsZXMgYXJlIGluLXVzZS4KPgo+IFBsZWFzZSBwdWxsLgo+
Cj4gUmVnYXJkcywKPiBBbnVwCj4KPiBbMV0gaHR0cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvdWJ1
bnR1Lytzb3VyY2UvbGludXgvK2J1Zy8yMTEyNTc4U2lnbmVkLW9mZi1ieQo+Cj4gVGhlIGZvbGxv
d2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBkN2I4ZjhlMjA4MTNmMDE3OWQ4ZWY1MTk1NDFhMzUy
N2U3NjYxZDNhOgo+Cj4gICBMaW51eCA2LjE2LXJjNSAoMjAyNS0wNy0wNiAxNDoxMDoyNiAtMDcw
MCkKPgo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+Cj4gICBodHRw
czovL2dpdGh1Yi5jb20va3ZtLXJpc2N2L2xpbnV4LmdpdCB0YWdzL2t2bS1yaXNjdi1maXhlcy02
LjE2LTIKPgo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA0Y2VjODlkYjgwYmE4MWZh
NDUyNGM2NDQ5YzA0OTRiOGFlMDhlZWIwOgo+Cj4gICBSSVNDLVY6IEtWTTogTW92ZSBIR0VJW0V8
UF0gQ1NSIGFjY2VzcyB0byBJTVNJQyB2aXJ0dWFsaXphdGlvbgo+ICgyMDI1LTA3LTExIDE4OjMz
OjI3ICswNTMwKQoKUHVsbGVkLCB0aGFua3MuCgpQYW9sbwoKPgo+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBLVk0vcmlz
Y3YgZml4ZXMgZm9yIDYuMTYsIHRha2UgIzIKPgo+IC0gRGlzYWJsZSB2c3RpbWVjbXAgYmVmb3Jl
IGV4aXRpbmcgdG8gdXNlci1zcGFjZQo+IC0gTW92ZSBIR0VJW0V8UF0gQ1NSIGFjY2VzcyB0byBJ
TVNJQyB2aXJ0dWFsaXphdGlvbgo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEFudXAgUGF0ZWwgKDIpOgo+ICAgICAg
IFJJU0MtVjogS1ZNOiBEaXNhYmxlIHZzdGltZWNtcCBiZWZvcmUgZXhpdGluZyB0byB1c2VyLXNw
YWNlCj4gICAgICAgUklTQy1WOiBLVk06IE1vdmUgSEdFSVtFfFBdIENTUiBhY2Nlc3MgdG8gSU1T
SUMgdmlydHVhbGl6YXRpb24KPgo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9haWEuaCAg
fCAgNCArKy0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgIDMgKysrCj4g
IGFyY2gvcmlzY3Yva3ZtL2FpYS5jICAgICAgICAgICAgICB8IDUxICsrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYyAgICAg
ICAgfCA0NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGFyY2gvcmlzY3Yv
a3ZtL3ZjcHUuYyAgICAgICAgICAgICB8IDEwIC0tLS0tLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3Zj
cHVfdGltZXIuYyAgICAgICB8IDE2ICsrKysrKysrKysrKwo+ICA2IGZpbGVzIGNoYW5nZWQsIDc0
IGluc2VydGlvbnMoKyksIDU1IGRlbGV0aW9ucygtKQo+CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
