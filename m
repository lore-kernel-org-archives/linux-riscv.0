Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E3FC48297
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 15:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09sWddbKly1EAItcPxzxLiymK8/aaNczuW+W12pZy6I=; b=kA+GR0jiPeSuIb
	lS37KwHI2DAsvbRsk7RjgMAQGDkPt81qVFaaWBtDHtJXaeaSbX5ojJf3+EB+tUIF0EDW04A4Fmxos
	0tNo8UR3/1mDFwVrL+MAdkVvOhvF06eabbZJPKhB8WPodXG8sNJIWaObiavZA/LFg3y8fMkjnZBb/
	/CBFAY54y/RGhEMreVC/8r+8Pvo+GYueCp24nSw/xiAbF68Kb+GOx1n/CqvlMsJf4tQTRzuObp6yf
	8JOfrKzX7NWDUOySZ9qlFWVQTSfV8N3vrXBbQjlrODtiK1AeYJbO3el6k+uBtc46tv2o8UdnRyS+0
	zjZmLFQECnCN/RJpASRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZYAc-00000005wqt-28jI;
	Mon, 12 Feb 2024 15:24:34 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZYAZ-00000005wpt-21Bd
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 15:24:32 +0000
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5958d3f2d8aso1415123eaf.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 07:24:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707751469; x=1708356269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nX61is9XJ+iwyxtpB9egcIfV20xyVh4UfYvVFLqfQe0=;
        b=L9WU7lDn23H1FR3mtwBv2l6xntdRrjO5Su5t3zNODMNqXnqTNu4Oi+chLxJZxQ9DYr
         MsPGhEdKXj0xB+qI5mNayPPrjybHsPnoudkLxGHdEcJjFtnyQVHGTU9Hb2x3mB6XVVGU
         2fRHXOKdOfeO+4WsMWQfxiZT/HnykxyIVj7VF9fQBRq9SwuEGieslmDKOAWHO1XlOivf
         bP1JGEJQJLauMXN2Dm+4D3f4wpMdeVNNbYUOic5D9OwmVPXS7F50mu6SYHiasPQ+CvEC
         ViXJhnjQ4ClnlTLIYGzdBE1iMaqF6E8UhnMPuQ5XViv9YXUrlc4uRVOdqD5NwTdOLqMB
         2UYQ==
X-Gm-Message-State: AOJu0YzuDYGQnbUDSHg2LW3Q1xTFRGzFchJQlgGrqTGQeB0Hs7YhPsx+
	qtKIBRd121Uo33IA0UVHMHYBV3zjgJEV4egwSZYaOlhe/lUywhwINT2X288pPvZZbnL8Xeb0KN9
	kRyUtl4EV1QZNxE4hw4r8eybNRbQ=
X-Google-Smtp-Source: AGHT+IHpuXZxCAVszuhp+l0/3Fc85RyOxNFeAKPWhOMAJXcjXJmBrWeeUmfdxx9w751fPRZuQ33ZkYvvTfpnF3DY0Nk=
X-Received: by 2002:a4a:3502:0:b0:599:fbcc:1c75 with SMTP id
 l2-20020a4a3502000000b00599fbcc1c75mr5321083ooa.0.1707751469357; Mon, 12 Feb
 2024 07:24:29 -0800 (PST)
MIME-Version: 1.0
References: <20240208034414.22579-1-sunilvl@ventanamicro.com>
In-Reply-To: <20240208034414.22579-1-sunilvl@ventanamicro.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 12 Feb 2024 16:24:17 +0100
Message-ID: <CAJZ5v0iwV4mG40hbhomrTgiUoUpn_ocNH_5K84yseSpsZtviVg@mail.gmail.com>
Subject: Re: [PATCH v1 -next 0/3] RISC-V: ACPI: Enable CPPC based cpufreq support
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Kumar Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_072431_544723_07C32479 
X-CRM114-Status: GOOD (  12.64  )
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

T24gVGh1LCBGZWIgOCwgMjAyNCBhdCA0OjQ04oCvQU0gU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gVGhpcyBzZXJpZXMgZW5hYmxlcyB0aGUgc3VwcG9ydCBm
b3IgIkNvbGxhYm9yYXRpdmUgUHJvY2Vzc29yIFBlcmZvcm1hbmNlCj4gQ29udHJvbCAoQ1BQQykg
b24gQUNQSSBiYXNlZCBSSVNDLVYgcGxhdGZvcm1zLiBJdCBkZXBlbmRzIG9uIHRoZQo+IGVuY29k
aW5nIG9mIENQUEMgcmVnaXN0ZXJzIGFzIGRlZmluZWQgaW4gUklTQy1WIEZGSCBzcGVjIFsyXS4K
Pgo+IENQUEMgaXMgZGVzY3JpYmVkIGluIHRoZSBBQ1BJIHNwZWMgWzFdLiBSSVNDLVYgRkZIIHNw
ZWMgcmVxdWlyZWQgdG8KPiBlbmFibGUgdGhpcywgaXMgYXZhaWxhYmxlIGF0IFsyXS4KPgo+IFsx
XSAtIGh0dHBzOi8vdWVmaS5vcmcvc3BlY3MvQUNQSS82LjUvMDhfUHJvY2Vzc29yX0NvbmZpZ3Vy
YXRpb25fYW5kX0NvbnRyb2wuaHRtbCNjb2xsYWJvcmF0aXZlLXByb2Nlc3Nvci1wZXJmb3JtYW5j
ZS1jb250cm9sCj4gWzJdIC0gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3Yt
YWNwaS1mZmgvcmVsZWFzZXMvZG93bmxvYWQvdjEuMC4wL3Jpc2N2LWZmaC5wZGYKPgo+IFRoZSBz
ZXJpZXMgaXMgYmFzZWQgb24gdGhlIExQSSBzdXBwb3J0IHNlcmllcy4KPiBCYXNlZC1vbjogMjAy
NDAxMTgwNjI5MzAuMjQ1OTM3LTEtc3VuaWx2bEB2ZW50YW5hbWljcm8uY29tCj4gKGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNDAxMTgwNjI5MzAuMjQ1OTM3LTEtc3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tLykKPgo+IFN1bmlsIFYgTCAoMyk6Cj4gICBBQ1BJOiBSSVNDLVY6IEFkZCBD
UFBDIGRyaXZlcgo+ICAgY3B1ZnJlcTogTW92ZSBDUFBDIGNvbmZpZ3MgdG8gY29tbW9uIEtjb25m
aWcgYW5kIGFkZCBSSVNDLVYKPiAgIFJJU0MtVjogZGVmY29uZmlnOiBFbmFibGUgQ09ORklHX0FD
UElfQ1BQQ19DUFVGUkVRCj4KPiAgYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZyB8ICAgMSAr
Cj4gIGRyaXZlcnMvYWNwaS9yaXNjdi9NYWtlZmlsZSAgfCAgIDEgKwo+ICBkcml2ZXJzL2FjcGkv
cmlzY3YvY3BwYy5jICAgIHwgMTU3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Cj4gIGRyaXZlcnMvY3B1ZnJlcS9LY29uZmlnICAgICAgfCAgMjkgKysrKysrKwo+ICBkcml2ZXJz
L2NwdWZyZXEvS2NvbmZpZy5hcm0gIHwgIDI2IC0tLS0tLQo+ICA1IGZpbGVzIGNoYW5nZWQsIDE4
OCBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvYWNwaS9yaXNjdi9jcHBjLmMKPgo+IC0tCgpUaGlzIGlzIGZpbmUgd2l0aCBtZSwgc28K
CkFja2VkLWJ5OiBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsQGtlcm5lbC5vcmc+CgphbmQgaXQg
d291bGQgYmUgZ29vZCB0byBhc2sgVmlyZXNoICh3aG8gbWFpbnRhaW5zIHRoZSBDUFBDIGNwdWZy
ZXEKZHJpdmVyKSBmb3IgYW4gQUNLLgoKVGhhbmtzIQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
