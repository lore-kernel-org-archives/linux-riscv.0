Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AA3CA0FE6
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 08:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=10n8gOXqXsrAMpRdHuE/BhQsyqWT8iGwmfqG6pQHICw=; b=lXfQ0cTXA4gVKQ
	t+FJxg80e8uvpLWGYCpc0brdCqnkfzvPw+4JjxHQ55kh69+6LBJXqvUWFd6DjJoRIWA/bLjQnTdCK
	ZpSEtAnVFV8Wij95/k5t1bTDY/COnIlA+PA2AIGd9vvJ2slwPkITtrvtwFNxKLZoGFxEHGqZNrssr
	t4EQYA5XRE+BTkPkxf53DRqFMS/oX6v3JoTZJnMtGzqEeGzlmqNRfeeU0m0a8FzH6k4Dk2fmhGa33
	mjk4h8fcmjNepUgnezTbPkYhel4JhuzeQHZFFWyN7yMM1s9f+X3WaEvZtitMyhSUV7PbCa3v9DWvZ
	DBuC2oZcTxoqpn56uk/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbz8A-00Gdyv-01;
	Fri, 01 Sep 2023 08:03:50 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbz86-00Gdx7-20
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 08:03:48 +0000
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-99bcc0adab4so198405566b.2
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 01:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693555422; x=1694160222; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0PJF2sdOqWMTdhnOy+ah6h0lRpj4+pB07jQ8lCelNXs=;
        b=WqeXzrGM39OApjas/St/SeqheJfhRDzQar24FmDc6DYATF5mw9z+x3r3hxXH9Gm1D0
         WqRO+q63HeQnqF/IvBg/ke9bdwgrdaj3Rrcd6pc+7j7nuSH0DfVzIheSgfHBoJYpHJxU
         7EMqrm6ojhelnRIqdB5ItqFbgMt6P8EwVc48nmfIi9owRieuFCT7vEYbHzAF34ZSzFeU
         CjKvy3wygsn5fO9cBTYUrEvrISn66CeSucOWYuc5MXbfhbbskZek372q8d0a+v1uxAgv
         xvw3Le4HyNH05SjE/RsiyXocZjm82SBBhEnhZAmR+I+wPqKyBevcNG4hjdLKcGeR799y
         e+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693555422; x=1694160222;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0PJF2sdOqWMTdhnOy+ah6h0lRpj4+pB07jQ8lCelNXs=;
        b=ZOy6FqZtCu/m0NAS4dqZlXA2857Bjl3i8JOPFHoiNOx8g5AeN+a3R/5lr3AbF2rCEB
         4m0PGK1n9ifIaKjE7jIwLEwydBCJeMJ/XyVuU5Jsslt4/1iKQDT2Ni+OTMmpHemkLBK/
         kIxSbdZ1Os+aEaA+kPUTxjN0PniYokaUteNro1eJ+KPNm3tFNwKrJDDUKXb6nBp3uS4s
         DM39UKRy9B9D2U3Rtd7i9WWNOaD75E5BnVz9hM4/O6t/lmDHA+qMA0ZAWq12wD9GziRL
         I42QZR7aU4U3a3nqUy14K8HFXEmX+T8tEPKOIPrX9bR/esRBwIGU+73EowRGCioal6c+
         R9tw==
X-Gm-Message-State: AOJu0YyUeCjVbNp1GVRwxA45f4LOj+QAHBBiEG8UHXvB6Q7SI2Sbs2F3
	j1ZDtgk1GS4o7p/eLf53LoZxHg==
X-Google-Smtp-Source: AGHT+IGymkOKommHWfDqJ3IlTz+5W9APgk0soidXVbcbnmRwhMH15DRV2R3BelGzHFNdLEB4Ag12Pw==
X-Received: by 2002:a17:906:1cf:b0:9a5:a068:5548 with SMTP id 15-20020a17090601cf00b009a5a0685548mr1082864ejj.75.1693555421945;
        Fri, 01 Sep 2023 01:03:41 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id t1-20020a170906268100b00993150e5325sm1685356ejc.60.2023.09.01.01.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 01:03:41 -0700 (PDT)
Date: Fri, 1 Sep 2023 10:03:40 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Atish Patra <atishp@atishpatra.org>, 
	Atish Patra <atishp@rivosinc.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.6
Message-ID: <20230901-a316e896c1355315c18dbe41@orel>
References: <CAAhSdy2XiFD1QC+v_UZ5G0TAhmT8uH48=UQdu6=bL=EPWy+2Kg@mail.gmail.com>
 <CABgObfbHSkoavDYqKhhotn0cOFr+x2QRYD4NN9v_55tK4nxQoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABgObfbHSkoavDYqKhhotn0cOFr+x2QRYD4NN9v_55tK4nxQoQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_010346_843187_991DB45E 
X-CRM114-Status: GOOD (  18.69  )
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

T24gVGh1LCBBdWcgMzEsIDIwMjMgYXQgMDc6Mjg6NDFQTSArMDIwMCwgUGFvbG8gQm9uemluaSB3
cm90ZToKPiBPbiBXZWQsIEF1ZyAyMywgMjAyMyBhdCA3OjI14oCvUE0gQW51cCBQYXRlbCA8YW51
cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4gPgo+ID4gSGkgUGFvbG8sCj4gPgo+ID4gV2UgaGF2
ZSB0aGUgZm9sbG93aW5nIEtWTSBSSVNDLVYgY2hhbmdlcyBmb3IgNi42Ogo+ID4gMSkgWmJhLCBa
YnMsIFppY250ciwgWmljc3IsIFppZmVuY2VpLCBhbmQgWmlocG0gc3VwcG9ydCBmb3IgR3Vlc3Qv
Vk0KPiA+IDIpIEFkZGVkIE9ORV9SRUcgaW50ZXJmYWNlIGZvciBTQVRQIG1vZGUKPiA+IDMpIEFk
ZGVkIE9ORV9SRUcgaW50ZXJmYWNlIHRvIGVuYWJsZS9kaXNhYmxlIG11bHRpcGxlIElTQSBleHRl
bnNpb25zCj4gPiA0KSBJbXByb3ZlZCBlcnJvciBjb2RlcyByZXR1cm5lZCBieSBPTkVfUkVHIGlu
dGVyZmFjZXMKPiA+IDUpIEFkZGVkIEtWTV9HRVRfUkVHX0xJU1QgaW9jdGwoKSBpbXBsZW1lbnRh
dGlvbiBmb3IgS1ZNIFJJU0MtVgo+ID4gNikgQWRkZWQgZ2V0LXJlZy1saXN0IHNlbGZ0ZXN0IGZv
ciBLVk0gUklTQy1WCj4gPgo+ID4gUGxlYXNlIHB1bGwuCj4gPgo+ID4gUmVnYXJkcywKPiA+IEFu
dXAKPiA+Cj4gPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDUyYTkzZDM5YjE3
ZGM3ZWI5OGI2YWEzZWRiOTM5NDMyNDhlMDNiMmY6Cj4gPgo+ID4gICBMaW51eCA2LjUtcmM1ICgy
MDIzLTA4LTA2IDE1OjA3OjUxIC0wNzAwKQo+ID4KPiA+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdp
dCByZXBvc2l0b3J5IGF0Ogo+ID4KPiA+ICAgaHR0cHM6Ly9naXRodWIuY29tL2t2bS1yaXNjdi9s
aW51eC5naXQgdGFncy9rdm0tcmlzY3YtNi42LTEKPiA+Cj4gPiBmb3IgeW91IHRvIGZldGNoIGNo
YW5nZXMgdXAgdG8gNDc3MDY5Mzk4ZWQ2ZTA0OThlZTI0M2U3OTljYjZjNjhiYWY2Y2NiODoKPiA+
Cj4gPiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIGdldC1yZWctbGlzdCB0ZXN0ICgyMDIz
LTA4LTA5IDEyOjE1OjI3ICswNTMwKQo+ID4KPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+IEtWTS9yaXNjdiBjaGFu
Z2VzIGZvciA2LjYKPiA+Cj4gPiAtIFpiYSwgWmJzLCBaaWNudHIsIFppY3NyLCBaaWZlbmNlaSwg
YW5kIFppaHBtIHN1cHBvcnQgZm9yIEd1ZXN0L1ZNCj4gPiAtIEFkZGVkIE9ORV9SRUcgaW50ZXJm
YWNlIGZvciBTQVRQIG1vZGUKPiA+IC0gQWRkZWQgT05FX1JFRyBpbnRlcmZhY2UgdG8gZW5hYmxl
L2Rpc2FibGUgbXVsdGlwbGUgSVNBIGV4dGVuc2lvbnMKPiA+IC0gSW1wcm92ZWQgZXJyb3IgY29k
ZXMgcmV0dXJuZWQgYnkgT05FX1JFRyBpbnRlcmZhY2VzCj4gPiAtIEFkZGVkIEtWTV9HRVRfUkVH
X0xJU1QgaW9jdGwoKSBpbXBsZW1lbnRhdGlvbiBmb3IgS1ZNIFJJU0MtVgo+ID4gLSBBZGRlZCBn
ZXQtcmVnLWxpc3Qgc2VsZnRlc3QgZm9yIEtWTSBSSVNDLVYKPiA+Cj4gPiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiBB
bmRyZXcgSm9uZXMgKDkpOgo+ID4gICAgICAgUklTQy1WOiBLVk06IEltcHJvdmUgdmVjdG9yIHNh
dmUvcmVzdG9yZSBlcnJvcnMKPiA+ICAgICAgIFJJU0MtVjogS1ZNOiBJbXByb3ZlIHZlY3RvciBz
YXZlL3Jlc3RvcmUgZnVuY3Rpb25zCj4gPiAgICAgICBLVk06IGFybTY0OiBzZWxmdGVzdHM6IFJl
cGxhY2Ugc3RyX3dpdGhfaW5kZXggd2l0aCBzdHJkdXBfcHJpbnRmCj4gPiAgICAgICBLVk06IGFy
bTY0OiBzZWxmdGVzdHM6IERyb3AgU1ZFIGNhcCBjaGVjayBpbiBwcmludF9yZWcKPiA+ICAgICAg
IEtWTTogYXJtNjQ6IHNlbGZ0ZXN0czogUmVtb3ZlIHByaW50X3JlZydzIGRlcGVuZGVuY3kgb24g
dmNwdV9jb25maWcKPiA+ICAgICAgIEtWTTogYXJtNjQ6IHNlbGZ0ZXN0czogUmVuYW1lIHZjcHVf
Y29uZmlnIGFuZCBhZGQgdG8ga3ZtX3V0aWwuaAo+ID4gICAgICAgS1ZNOiBhcm02NDogc2VsZnRl
c3RzOiBEZWxldGUgY29yZV9yZWdfZml4dXAKPiA+ICAgICAgIEtWTTogYXJtNjQ6IHNlbGZ0ZXN0
czogU3BsaXQgZ2V0LXJlZy1saXN0IHRlc3QgY29kZQo+ID4gICAgICAgS1ZNOiBhcm02NDogc2Vs
ZnRlc3RzOiBGaW5pc2ggZ2VuZXJhbGl6aW5nIGdldC1yZWctbGlzdAo+IAo+IFB1bGxlZCwgdGhh
bmtzLCBidXQgSSdsbCBnaXZlIGEgY2xvc2VyIGxvb2sgdG8gdGhlc2UgcGF0Y2hlcyBhZnRlcgo+
IGtpY2tpbmcgdGhlIGxvbmctcnVubmluZyB0ZXN0cy4gSXQgd291bGQgaGF2ZSBiZWVuIG5pY2Vy
IHRvIGdldCBhbgo+IEFja2VkLWJ5IGZyb20gZWl0aGVyIG1lIG9yIE1hcmMgb3IgT2xpdmVyLCBi
dXQgbm8gaHVnZSBkZWFsLgoKRldJVywgd2UgZ290IGEgInNlZW1zIGZpbmUiIGZyb20gTWFyYyBb
MV0uCgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvODd5MWlscHozbS53bC1tYXpAa2VybmVs
Lm9yZy8KClRoYW5rcywKZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
