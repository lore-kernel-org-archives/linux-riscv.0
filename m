Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1BFC3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 15:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mWgVCJydyGem/CNzuC62dj67fxPxn9mWO7ReOKb3zMs=; b=S0kaZqBUmX+Ja9
	k93mviAHpdkHkmoO4EqntFSCfqNXPnYWm+7b+d31hsREZ3OLzsVfo+N1nHnC4l8gNDcgItz3+hYnT
	Ks5axV6ixfn0ySFsyC1pxytJ5hBDBE8REieUHkC1If1ARaHU1KDnnHXwDzoI+zJeDv9Xhv8kpIEVZ
	9FWTt+Qfq2ZqYicxpLzjMB43SVuvE6MwUNUHDA+kQ4i7q+dThPGE2uY7QIqPdlk0HJGIRky+dqfHZ
	kPogQVv5Ef/xCsOgfgkYUWiANIMcAiPUrcp9AZG5NJTY+trFDAMJVEnTpeB9gNOU9VBQ+nK8mPa5r
	5U1DRwzu8jjyIVe4WplQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZYBZ-00000005wPO-2yRc;
	Thu, 01 Aug 2024 15:57:49 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZYBW-00000005wOR-2dJq
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 15:57:48 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-4f51551695cso2551577e0c.3
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 08:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722527865; x=1723132665; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snX6qmvGXBlkj4qHxmnqzT8/9j0530F70W9IbEs0MBs=;
        b=AjuP0PqEGn58gjF3maKpISlUq+7m/eV2sdm6eks/x7l6fwisL4tIT61wMYZ/uwQ8mj
         72TUb8QcPBd5vEe4DIwLy0VOQKGPyIzPDsGc+a9k4vqOWBlnK26HXItQ09mG0CuZ8TuN
         ulneIywyeFyr26pW+mH/HC508DLkGOB2svux7ErVtg8LWI8s1VKZvmkMCSa8uPT8ohqF
         d17Hv/inQG6qk1hefNmhojfm1l5jWilt2S7wfhDUBZLQGfIEj3gkoJRlQl+Wfc09+lqu
         YYkj/8SQOWCEoIx38cuEesCTEbMhUmfFJEiOWlicmpdfzS89uSgNV4ZKzaszr5oMMVPc
         vinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722527865; x=1723132665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snX6qmvGXBlkj4qHxmnqzT8/9j0530F70W9IbEs0MBs=;
        b=vzke0KBa1Pp2SdK9PoQ3UvjpHkaww5Tcyr3I52tOSd2dEuGoasmcERXgcYqfMLrMIp
         3pO33QB4JUpf4gCeJLdVkC1be9SHEJaLWZRYWXlfvtM/WVV/zzSPwC2PZ1kwHKF6M25R
         tOK7SM2xmZ0o2FiWkU4k/nwkTdmbw+kzgr4yEgp8FXfA2msXRnArGPbN6cYJEFgj2Cq1
         WAPbXyE+kXTqFozc90nnHUcv5gEnsI+5fhqjBq2wnOPFcs9zCN0ZkxTE1VkMfP5bayoj
         S69iXQt7pY4mP6vX/6fkOB0c1k0yKis0TsrnToJv/EQA0CIJMXIBKgRkZX86gkhnl+lZ
         O3Kg==
X-Forwarded-Encrypted: i=1; AJvYcCXTHgqhKLiTjLL8ekeNaaGKG2jJ9r6oKAyyVoj4/TZkk7A3W/ZsNeOubuIMmeoAxOfh9ZpMtPztK8CEVuTKybkzL8p/28zpbgxdKkQPhW2Q
X-Gm-Message-State: AOJu0YyuHSeH5n1AMzFdvcViZXlsomvfC1Y8v3mE/q/cOBODAGI2ZEwf
	4MqSYVsP2P1S7is71Kudy7nlbQgYl/V6iy5QUuKw3x7Dygs7FBAnEEsYHN0X3jYTXDYQpkEvola
	xRBLCtMpEHRL4Qg3YssETDFQsG2a5AKp0cSHIUg==
X-Google-Smtp-Source: AGHT+IGgmhTnl/HxYppSXaq7VmYQRkFbvdmv2Ue6piokAXA8lXZkX+zswFabpVoI9oJENUYd4nOCoCEtPCB9vMYPqZM=
X-Received: by 2002:a05:6122:1d16:b0:4f2:f1f1:a9f2 with SMTP id
 71dfb90a1353d-4f89ff6c61dmr938235e0c.4.1722527864994; Thu, 01 Aug 2024
 08:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org> <20240730-k1-01-basic-dt-v5-9-98263aae83be@gentoo.org>
In-Reply-To: <20240730-k1-01-basic-dt-v5-9-98263aae83be@gentoo.org>
From: Jesse Taube <jesse@rivosinc.com>
Date: Thu, 1 Aug 2024 11:57:34 -0400
Message-ID: <CALSpo=bUiwAr=Do6QxLT_vUzjuK4t6=nCtaWRLHzLW_qjKdicA@mail.gmail.com>
Subject: Re: [PATCH v5 09/10] riscv: dts: spacemit: add Banana Pi BPI-F3 board
 device tree
To: Yixun Lan <dlan@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_085746_688146_687425E8 
X-CRM114-Status: GOOD (  17.88  )
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
Cc: Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, Meng Zhang <zhangmeng.kevin@spacemit.com>, Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-serial@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Lubomir Rintel <lkundrak@v3.sk>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdWwgMjksIDIwMjQgYXQgODoyOeKAr1BNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28u
b3JnPiB3cm90ZToKPgo+IEZyb206IFlhbmd5dSBDaGVuIDxjeXlAY3l5c2VsZi5uYW1lPgo+Cj4g
QmFuYW5hIFBpIEJQSS1GMyBbMV0gaXMgYSBpbmR1c3RyaWFsIGdyYWRlIFJJU0MtViBkZXZlbG9w
bWVudCBib2FyZCwgaXQKPiBkZXNpZ24gd2l0aCBTcGFjZW1pVCBLMSA4IGNvcmUgUklTQy1WIGNo
aXAgWzJdLgo+Cj4gQ3VycmVudGx5IG9ubHkgc3VwcG9ydCBib290aW5nIGludG8gY29uc29sZSB3
aXRoIG9ubHkgdWFydCBlbmFibGVkLAo+IG90aGVyIGZlYXR1cmVzIHdpbGwgYmUgYWRkZWQgc29v
biBsYXRlci4KPgo+IExpbms6IGh0dHBzOi8vZG9jcy5iYW5hbmEtcGkub3JnL2VuL0JQSS1GMy9C
YW5hbmFQaV9CUEktRjMgWzFdCj4gTGluazogaHR0cHM6Ly93d3cuc3BhY2VtaXQuY29tL2VuL3Nw
YWNlbWl0LWtleS1zdG9uZS0yLyBbMl0KPiBTaWduZWQtb2ZmLWJ5OiBZYW5neXUgQ2hlbiA8Y3l5
QGN5eXNlbGYubmFtZT4KPiBTaWduZWQtb2ZmLWJ5OiBZaXh1biBMYW4gPGRsYW5AZ2VudG9vLm9y
Zz4KQWNrZWQtYnk6IEplc3NlIFRhdWJlIDxqZXNzZUByaXZvc2luYy5jb20+Cgo+IC0tLQo+ICBh
cmNoL3Jpc2N2L2Jvb3QvZHRzL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAg
YXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9NYWtlZmlsZSAgICAgICAgICAgfCAgMiArKwo+
ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cyB8IDE5ICsr
KysrKysrKysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCj4K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9NYWtlZmlsZSBiL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvTWFrZWZpbGUKPiBpbmRleCBmZGFlMDViYmY1NTYzLi5iZmY4ODdkMzhhYmU0IDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvTWFrZWZpbGUKPiArKysgYi9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL01ha2VmaWxlCj4gQEAgLTUsNiArNSw3IEBAIHN1YmRpci15ICs9IG1pY3Jv
Y2hpcAo+ICBzdWJkaXIteSArPSByZW5lc2FzCj4gIHN1YmRpci15ICs9IHNpZml2ZQo+ICBzdWJk
aXIteSArPSBzb3BoZ28KPiArc3ViZGlyLXkgKz0gc3BhY2VtaXQKPiAgc3ViZGlyLXkgKz0gc3Rh
cmZpdmUKPiAgc3ViZGlyLXkgKz0gdGhlYWQKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jv
b3QvZHRzL3NwYWNlbWl0L01ha2VmaWxlIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9N
YWtlZmlsZQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwMC4uYWM2
MTczMTlhNTc0Mgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nw
YWNlbWl0L01ha2VmaWxlCj4gQEAgLTAsMCArMSwyIEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAKPiArZHRiLSQoQ09ORklHX0FSQ0hfU1BBQ0VNSVQpICs9IGsxLWJhbmFu
YXBpLWYzLmR0Ygo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sx
LWJhbmFuYXBpLWYzLmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5h
cGktZjMuZHRzCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAwLi4w
MjMyNzQxODliNDkyCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMv
c3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzCj4gQEAgLTAsMCArMSwxOSBAQAo+ICsvLyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCBPUiBNSVQKPiArLyoKPiArICogQ29weXJpZ2h0
IChDKSAyMDI0IFlhbmd5dSBDaGVuIDxjeXlAY3l5c2VsZi5uYW1lPgo+ICsgKi8KPiArCj4gKyNp
bmNsdWRlICJrMS5kdHNpIgo+ICsKPiArLyB7Cj4gKyAgICAgICBtb2RlbCA9ICJCYW5hbmEgUGkg
QlBJLUYzIjsKPiArICAgICAgIGNvbXBhdGlibGUgPSAiYmFuYW5hcGksYnBpLWYzIiwgInNwYWNl
bWl0LGsxIjsKPiArCj4gKyAgICAgICBjaG9zZW4gewo+ICsgICAgICAgICAgICAgICBzdGRvdXQt
cGF0aCA9ICJzZXJpYWwwIjsKPiArICAgICAgIH07Cj4gK307Cj4gKwo+ICsmdWFydDAgewo+ICsg
ICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ICt9Owo+Cj4gLS0KPiAyLjQ1LjIKPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
