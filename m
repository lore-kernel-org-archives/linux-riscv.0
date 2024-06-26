Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FB8C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 15:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXSqim5tkiVeWmfbngKfrSzihUbvWltsaS/pJ04Woew=; b=Oa9bkhINQ0NOTC
	BHuKpB2tzw2FSh7BGZLgb8BGHgQC0j4RXcMdrm8UIxS+wyodDX9lbE6skKZFpMhbWNuZI5otlsuUY
	iJCZHuAw8RZ/L/fwa9SgofI1OmKZpc2JAOTo+ig/ThGCNwGGkAi9ngkeqcRx4rAPf5zACEcLs8HEN
	BJf3JYHmjnZunVVOkIjbZ1DhWTdxa+AnK+gcOq9rMk8mrbbTBSnlhbgSxj7FjclNkSy7RHPK9jEIp
	UT1OO/nt5u2vD5c/peYlkeDVHgWLxDXfIGJ0mh6LhcdXCk4kFxevWLpnjq3xPBw9jnoL2bdFZLNdQ
	JIqWNy2FYH/6+BaH3G7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUhb-00000007QJF-05bt;
	Wed, 26 Jun 2024 15:36:55 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUhX-00000007QHi-2pAY
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 15:36:53 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3762c172d93so28571675ab.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 08:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1719416210; x=1720021010; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5nnbzV9Zj1DrEqWBNN21M3y+/sCqoD4DK4Ac2OdSSc=;
        b=RymnI3uMPggRxDSk8HD2qrNJekXMqpRFvxVnY1KBTrViebn3hxfOFBixSovO77nf5e
         qCWc204VypPg8VACfYRWKHrhP/xgbI65CJZTtYhZ/lVVjBqLIA9cA+4jFCcoHk1hEGa7
         MRjUaAbAgov1jW/bEvSfuqHOj2f+7Q/+SmrmkEvFniFrX9ojceltUZm/AK2PuVdSUFWP
         cev090CwJaSrWyunsYzfz+U9zH+KtYqWEY8AieJRVu5XYz47yZYEcm0REQoAhkoQf5tf
         E790UUd/bkKMM1p7ZE5BrIzVHuC2ZTQTG1alQDmlQ7e42cUo9KIkd8OnaSilemXMX5O0
         Gg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719416210; x=1720021010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5nnbzV9Zj1DrEqWBNN21M3y+/sCqoD4DK4Ac2OdSSc=;
        b=HRvHasIgUAzK2q5OYsbaKF0xwU55QNlNp9uDs4yzIEeTOzRri2+qq6INLsu7eNuqxP
         e47U9qxjDh8RwgqYpQqi3oq6Rv0RZqOidu5z/sRS13WjrpZbJRCNYnp0+7qJiJI83X0t
         du3B3K71BxrN8qP9OdM8Z4ybVvGpUwlvOkfgjdPlMEXIE5m8MCkXmUvskGtDxUUNSPGd
         w20F74t7rWxl+mPpzSYeAQP5yWM1m26RcATOthroJRBv8eRWIC/AiVKfn7F4cg5oRdu+
         12/N/jDcNayIwn1pWPbNAnoFqTDiHIl0NSf15y/IRzyv9h0JHogxcwx/fMlwlvn/oOvT
         CxAQ==
X-Gm-Message-State: AOJu0YxgqpOsx4bx6n/0u/IIPICTZzHa4BeU1ifxA0J0ZW3/MTvCjryq
	wGfJ8xYDIYcUzl3e6UATaHcgkuL8yrk0Rvmvrl/BF1JZwoRnbXS26TZDpNYiJQuktbZozq26qM1
	QrUWBIwCoXV/0TuHY/kjBs+SnzbB+2/NrOkPzQg==
X-Google-Smtp-Source: AGHT+IEx3n1pAtiFxPV5VbMeVdK9RInuF2hPfxz3wSJhDVUz0zv0tgUX3t1wQrFEoYNKBKurqiXkn8BT7D2wGotfwRk=
X-Received: by 2002:a92:c548:0:b0:375:ae6b:9d92 with SMTP id
 e9e14a558f8ab-3763f5c38a2mr157101095ab.12.1719416210118; Wed, 26 Jun 2024
 08:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240426100820.14762-8-ajones@ventanamicro.com> <20240426100820.14762-13-ajones@ventanamicro.com>
In-Reply-To: <20240426100820.14762-13-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 26 Jun 2024 21:06:38 +0530
Message-ID: <CAAhSdy3a-8Twd0zVJPmAJy3QEsco+gUFMXWaQE-U7OjU3Kra-g@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] KVM: riscv: Support guest wrs.nto
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, conor.dooley@microchip.com, atishp@atishpatra.org, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	christoph.muellner@vrull.eu, heiko@sntech.de, charlie@rivosinc.com, 
	David.Laight@aculab.com, parri.andrea@gmail.com, luxu.kernel@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_083651_913700_9041EC0B 
X-CRM114-Status: GOOD (  19.25  )
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

T24gRnJpLCBBcHIgMjYsIDIwMjQgYXQgMzozOOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gV2hlbiBhIGd1ZXN0IHRyYXBzIG9uIHdycy5udG8s
IGNhbGwga3ZtX3ZjcHVfb25fc3BpbigpIHRvIGF0dGVtcHQKPiB0byB5aWVsZCB0byB0aGUgbG9j
ayBob2xkaW5nIFZDUFUuIEFsc28gZXh0ZW5kIHRoZSBLVk0gSVNBIGV4dGVuc2lvbgo+IE9ORV9S
RUcgaW50ZXJmYWNlIHRvIGFsbG93IEtWTSB1c2Vyc3BhY2UgdG8gZGV0ZWN0IGFuZCBlbmFibGUg
dGhlCj4gWmF3cnMgZXh0ZW5zaW9uIGZvciB0aGUgR3Vlc3QvVk0uCj4KPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgoKTEdUTS4KCkFja2VkLWJ5
OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0K
PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgIDEgKwo+ICBhcmNoL3Jpc2N2
L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggfCAgMSArCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAg
ICAgICAgICAgICB8ICAxICsKPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNuLmMgICAgICAgIHwg
MTUgKysrKysrKysrKysrKysrCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgICAgICB8
ICAyICsrCj4gIDUgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20va3ZtX2hvc3QuaAo+IGluZGV4IDQ4NGQwNGE5MmZhNi4uZTI3YzU2ZTQ0NzgzIDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+ICsrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+IEBAIC02OSw2ICs2OSw3IEBAIHN0cnVjdCBr
dm1fdmNwdV9zdGF0IHsKPiAgICAgICAgIHN0cnVjdCBrdm1fdmNwdV9zdGF0X2dlbmVyaWMgZ2Vu
ZXJpYzsKPiAgICAgICAgIHU2NCBlY2FsbF9leGl0X3N0YXQ7Cj4gICAgICAgICB1NjQgd2ZpX2V4
aXRfc3RhdDsKPiArICAgICAgIHU2NCB3cnNfZXhpdF9zdGF0Owo+ICAgICAgICAgdTY0IG1taW9f
ZXhpdF91c2VyOwo+ICAgICAgICAgdTY0IG1taW9fZXhpdF9rZXJuZWw7Cj4gICAgICAgICB1NjQg
Y3NyX2V4aXRfdXNlcjsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2t2bS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gaW5kZXggYjFjNTAz
YzI5NTljLi44OWVhMDZiZDA3YzIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2t2bS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4g
QEAgLTE2Nyw2ICsxNjcsNyBAQCBlbnVtIEtWTV9SSVNDVl9JU0FfRVhUX0lEIHsKPiAgICAgICAg
IEtWTV9SSVNDVl9JU0FfRVhUX1pGQSwKPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pUU08s
Cj4gICAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9aQUNBUywKPiArICAgICAgIEtWTV9SSVNDVl9J
U0FfRVhUX1pBV1JTLAo+ICAgICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfTUFYLAo+ICB9Owo+Cj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUu
Ywo+IGluZGV4IGI1Y2E5ZjJlOThhYy4uYWJjZGM3ODY3MWUwIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+IEBAIC0yNSw2
ICsyNSw3IEBAIGNvbnN0IHN0cnVjdCBfa3ZtX3N0YXRzX2Rlc2Mga3ZtX3ZjcHVfc3RhdHNfZGVz
Y1tdID0gewo+ICAgICAgICAgS1ZNX0dFTkVSSUNfVkNQVV9TVEFUUygpLAo+ICAgICAgICAgU1RB
VFNfREVTQ19DT1VOVEVSKFZDUFUsIGVjYWxsX2V4aXRfc3RhdCksCj4gICAgICAgICBTVEFUU19E
RVNDX0NPVU5URVIoVkNQVSwgd2ZpX2V4aXRfc3RhdCksCj4gKyAgICAgICBTVEFUU19ERVNDX0NP
VU5URVIoVkNQVSwgd3JzX2V4aXRfc3RhdCksCj4gICAgICAgICBTVEFUU19ERVNDX0NPVU5URVIo
VkNQVSwgbW1pb19leGl0X3VzZXIpLAo+ICAgICAgICAgU1RBVFNfREVTQ19DT1VOVEVSKFZDUFUs
IG1taW9fZXhpdF9rZXJuZWwpLAo+ICAgICAgICAgU1RBVFNfREVTQ19DT1VOVEVSKFZDUFUsIGNz
cl9leGl0X3VzZXIpLAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X2luc24uYyBi
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5zbi5jCj4gaW5kZXggZWU3MjE1ZjQwNzFmLi45N2RlYzE4
ZTY5ODkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNuLmMKPiArKysgYi9h
cmNoL3Jpc2N2L2t2bS92Y3B1X2luc24uYwo+IEBAIC0xNiw2ICsxNiw5IEBACj4gICNkZWZpbmUg
SU5TTl9NQVNLX1dGSSAgICAgICAgICAweGZmZmZmZmZmCj4gICNkZWZpbmUgSU5TTl9NQVRDSF9X
RkkgICAgICAgICAweDEwNTAwMDczCj4KPiArI2RlZmluZSBJTlNOX01BU0tfV1JTICAgICAgICAg
IDB4ZmZmZmZmZmYKPiArI2RlZmluZSBJTlNOX01BVENIX1dSUyAgICAgICAgIDB4MDBkMDAwNzMK
PiArCj4gICNkZWZpbmUgSU5TTl9NQVRDSF9DU1JSVyAgICAgICAweDEwNzMKPiAgI2RlZmluZSBJ
TlNOX01BU0tfQ1NSUlcgICAgICAgICAgICAgICAgMHg3MDdmCj4gICNkZWZpbmUgSU5TTl9NQVRD
SF9DU1JSUyAgICAgICAweDIwNzMKPiBAQCAtMjAzLDYgKzIwNiwxMyBAQCBzdGF0aWMgaW50IHdm
aV9pbnNuKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1biwgdWxvbmcg
aW5zbikKPiAgICAgICAgIHJldHVybiBLVk1fSU5TTl9DT05USU5VRV9ORVhUX1NFUEM7Cj4gIH0K
Pgo+ICtzdGF0aWMgaW50IHdyc19pbnNuKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2
bV9ydW4gKnJ1biwgdWxvbmcgaW5zbikKPiArewo+ICsgICAgICAgdmNwdS0+c3RhdC53cnNfZXhp
dF9zdGF0Kys7Cj4gKyAgICAgICBrdm1fdmNwdV9vbl9zcGluKHZjcHUsIHZjcHUtPmFyY2guZ3Vl
c3RfY29udGV4dC5zc3RhdHVzICYgU1JfU1BQKTsKPiArICAgICAgIHJldHVybiBLVk1fSU5TTl9D
T05USU5VRV9ORVhUX1NFUEM7Cj4gK30KPiArCj4gIHN0cnVjdCBjc3JfZnVuYyB7Cj4gICAgICAg
ICB1bnNpZ25lZCBpbnQgYmFzZTsKPiAgICAgICAgIHVuc2lnbmVkIGludCBjb3VudDsKPiBAQCAt
Mzc4LDYgKzM4OCwxMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGluc25fZnVuYyBzeXN0ZW1fb3Bj
b2RlX2Z1bmNzW10gPSB7Cj4gICAgICAgICAgICAgICAgIC5tYXRjaCA9IElOU05fTUFUQ0hfV0ZJ
LAo+ICAgICAgICAgICAgICAgICAuZnVuYyAgPSB3ZmlfaW5zbiwKPiAgICAgICAgIH0sCj4gKyAg
ICAgICB7Cj4gKyAgICAgICAgICAgICAgIC5tYXNrICA9IElOU05fTUFTS19XUlMsCj4gKyAgICAg
ICAgICAgICAgIC5tYXRjaCA9IElOU05fTUFUQ0hfV1JTLAo+ICsgICAgICAgICAgICAgICAuZnVu
YyAgPSB3cnNfaW5zbiwKPiArICAgICAgIH0sCj4gIH07Cj4KPiAgc3RhdGljIGludCBzeXN0ZW1f
b3Bjb2RlX2luc24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jIGIvYXJjaC9yaXNjdi9r
dm0vdmNwdV9vbmVyZWcuYwo+IGluZGV4IGY0YTYxMjRkMjVjOS4uNjdjNTc5NGFmM2I2IDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKPiArKysgYi9hcmNoL3Jpc2N2
L2t2bS92Y3B1X29uZXJlZy5jCj4gQEAgLTQxLDYgKzQxLDcgQEAgc3RhdGljIGNvbnN0IHVuc2ln
bmVkIGxvbmcga3ZtX2lzYV9leHRfYXJyW10gPSB7Cj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIo
U1ZOQVBPVCksCj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoU1ZQQk1UKSwKPiAgICAgICAgIEtW
TV9JU0FfRVhUX0FSUihaQUNBUyksCj4gKyAgICAgICBLVk1fSVNBX0VYVF9BUlIoWkFXUlMpLAo+
ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpCQSksCj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIo
WkJCKSwKPiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihaQkMpLAo+IEBAIC0xMjAsNiArMTIxLDcg
QEAgc3RhdGljIGJvb2wga3ZtX3Jpc2N2X3ZjcHVfaXNhX2Rpc2FibGVfYWxsb3dlZCh1bnNpZ25l
ZCBsb25nIGV4dCkKPiAgICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfU1ZJTlZBTDoKPiAg
ICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfU1ZOQVBPVDoKPiAgICAgICAgIGNhc2UgS1ZN
X1JJU0NWX0lTQV9FWFRfWkFDQVM6Cj4gKyAgICAgICBjYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1pB
V1JTOgo+ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aQkE6Cj4gICAgICAgICBjYXNl
IEtWTV9SSVNDVl9JU0FfRVhUX1pCQjoKPiAgICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRf
WkJDOgo+IC0tCj4gMi40NC4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
