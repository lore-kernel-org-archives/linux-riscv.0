Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C701EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 09:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FRTgO7Y63UKgzYv7BKsRszz3tIL8lAP+64leXQ0da3o=; b=L8ZmMdSrpQZOyt
	yM7odsENhSbCSDbDiDxizW1UR76PY/z6/1tTKvHSJxzCXyNU0p6g3i6yrAxreo0Id/8UAoO18RgBq
	tmZ2qDPi+yM+yOWKy3a7FEiERYFXDb/qp8HggOM/wH8E6El0Ev7bnuKfwIxhzvcANvCoKIOrs147g
	UIiRj0XO9mqpFbp54DS/r0XnpXHK+ledDfYGQ0NNNbZG18RwN+GaASHz1/MSwGGxO95FowNhzI4nj
	EtDSX++qQl0r6qfTsXiket/JOhQxGRDdVM8T0Y9Nnzwkj9NuzNExT8k8M+l2Duu6CbJLL4pEY+egt
	tQ6d+vRyu8U9feb46OiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKFDO-005h13-1p;
	Fri, 14 Jul 2023 09:35:54 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKFDK-005h07-38
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 09:35:52 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-c5cf26e9669so1459408276.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 02:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689327345; x=1691919345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pt39Bw/1ICieuy3xPQ3V/nq5k9xeT5GMxbYyADM5Ukk=;
        b=eslUTpMWrNAx2aATLEtT8SRgCHC+OB6UqLIj2Eer+pOjVMfBLWucrB0s3DvfklSfBl
         2V4VfHd7NkbeQgvGYsSfgx9I7wtAQSam18rcFpP0OqWknK0FJBh6B76rdcsFuiOkyZsO
         Wjx1v23ukYT2WqgnpMJx+ho5D8D4W/EmOzn9c3LllJl4v1U4P+p8x/cxUTYf72KhlUqa
         etOO4BTiMJ9g1ZN/96rrcCGWDJhVlTS0gc/Aco6tLHOFXqU9CJO5oSK7w5lTHFCCLF+V
         ge5aFp3/gdoaoDLiH2UJ8kCXvmP1Qa53CQCvBwdRYCPwN0IFlYi6aHG/NvBQ/wzLQkc5
         Makg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689327345; x=1691919345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pt39Bw/1ICieuy3xPQ3V/nq5k9xeT5GMxbYyADM5Ukk=;
        b=C194fBRzHjjxJ6KKeIXqN+Klz9ZyX/pVtrNir9RCkZ/tZf1yryGGhIkcCtnSFvUXXV
         IaIRehRL06SoRc5mvJpcMxntOkEVgZvWsR0/b6rHkbmDhMed9+JlkdPZP96LHIaOxKf7
         U1bI8WDbeJwohgfceguL68+6jamIONHjcpsYeZuLJIHI0d0nDaraHKuPaw5xoiKE2KEt
         iEbCLwwe39yoDbJyLfxxvQWOkfNLetlmaL4ZvaDxr80fDPWIhH6y84qU8whjEu/LsJHS
         WXq5bD9xATd7HVqKvd+pU+xTO0hpJmDWxu1iBKNfnxIP0Wlhq2oetoFjub45LIKLZ4wL
         UY9A==
X-Gm-Message-State: ABy/qLbytsfeMN09M3S+hGaWAeyTi4H34Rsn8Z2qUhWTxX0Zj9aurxB/
	YY+J94Iyic+qsFqpFaJFo1ZLDs7ssW6R4P2eGlpqHA==
X-Google-Smtp-Source: APBJJlFnjaoGpAtQUN7x4jgU73upuuxFNXMx+nVUkht79U11I0K8h99tqhekeYm3ockpIX5yS0dq10/tiPAkFZJvpVE=
X-Received: by 2002:a81:540a:0:b0:56d:2038:c254 with SMTP id
 i10-20020a81540a000000b0056d2038c254mr4796899ywb.44.1689327345450; Fri, 14
 Jul 2023 02:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230710094321.1378351-1-apatel@ventanamicro.com>
 <20230710094321.1378351-8-apatel@ventanamicro.com> <CAGETcx8kH8cJVdhcv5K4qNUo58godFZEBnOfTGKUUQ6VuUguvQ@mail.gmail.com>
 <86jzv2vpdb.wl-maz@kernel.org>
In-Reply-To: <86jzv2vpdb.wl-maz@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 14 Jul 2023 15:05:34 +0530
Message-ID: <CAK9=C2ULxsXednwnoyzYKjQFpe_zBSZ4v0FqUYFnxK2TpbiMtg@mail.gmail.com>
Subject: Re: [PATCH v5 7/9] irqchip: Add RISC-V advanced PLIC driver
To: Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_023551_011044_3F59AB87 
X-CRM114-Status: GOOD (  38.10  )
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
Cc: devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgMjozMeKAr1BNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gQW51cCwKPgo+IE9uIEZyaSwgMTQgSnVsIDIwMjMgMDA6NTY6MjIg
KzAxMDAsCj4gU2FyYXZhbmEgS2FubmFuIDxzYXJhdmFuYWtAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gT24gTW9uLCBKdWwgMTAsIDIwMjMgYXQgMjo0NOKAr0FNIEFudXAgUGF0ZWwgPGFwYXRl
bEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gVGhlIFJJU0MtViBhZHZhbmNl
ZCBpbnRlcnJ1cHQgYXJjaGl0ZWN0dXJlIChBSUEpIHNwZWNpZmljYXRpb24gZGVmaW5lcwo+ID4g
PiBhIG5ldyBpbnRlcnJ1cHQgY29udHJvbGxlciBmb3IgbWFuYWdpbmcgd2lyZWQgaW50ZXJydXB0
cyBvbiBhIFJJU0MtVgo+ID4gPiBwbGF0Zm9ybS4gVGhpcyBuZXcgaW50ZXJydXB0IGNvbnRyb2xs
ZXIgaXMgcmVmZXJyZWQgdG8gYXMgYWR2YW5jZWQKPiA+ID4gcGxhdGZvcm0tbGV2ZWwgaW50ZXJy
dXB0IGNvbnRyb2xsZXIgKEFQTElDKSB3aGljaCBjYW4gZm9yd2FyZCB3aXJlZAo+ID4gPiBpbnRl
cnJ1cHRzIHRvIENQVXMgKG9yIEhBUlRzKSBhcyBsb2NhbCBpbnRlcnJ1cHRzIE9SIGFzIG1lc3Nh
Z2UKPiA+ID4gc2lnbmFsZWQgaW50ZXJydXB0cy4KPiA+ID4gKEZvciBtb3JlIGRldGFpbHMgcmVm
ZXIgaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWFpYSkKPiA+ID4KPiA+ID4gVGhpcyBw
YXRjaCBhZGRzIGFuIGlycWNoaXAgZHJpdmVyIGZvciBSSVNDLVYgQVBMSUMgZm91bmQgb24gUklT
Qy1WCj4gPiA+IHBsYXRmb3Jtcy4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRl
bCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4KPiBbLi4uXQo+Cj4gPiA+ICtzdGF0aWMgaW50
IF9faW5pdCBhcGxpY19kdF9pbml0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwKPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKnBhcmVudCkK
PiA+ID4gK3sKPiA+ID4gKyAgICAgICAvKgo+ID4gPiArICAgICAgICAqIFRoZSBBUExJQyBwbGF0
Zm9ybSBkcml2ZXIgbmVlZHMgdG8gYmUgcHJvYmVkIGVhcmx5Cj4gPiA+ICsgICAgICAgICogc28g
Zm9yIGRldmljZSB0cmVlOgo+ID4gPiArICAgICAgICAqCj4gPiA+ICsgICAgICAgICogMSkgU2V0
IHRoZSBGV05PREVfRkxBR19CRVNUX0VGRk9SVCBmbGFnIGluIGZ3bm9kZSB3aGljaAo+ID4gPiAr
ICAgICAgICAqICAgIHByb3ZpZGVzIGEgaGludCB0byB0aGUgZGV2aWNlIGRyaXZlciBjb3JlIHRv
IHByb2JlIHRoZQo+ID4gPiArICAgICAgICAqICAgIHBsYXRmb3JtIGRyaXZlciBlYXJseS4KPiA+
ID4gKyAgICAgICAgKiAyKSBDbGVhciB0aGUgT0ZfUE9QVUxBVEVEIGZsYWcgaW4gZGV2aWNlX25v
ZGUgYmVjYXVzZQo+ID4gPiArICAgICAgICAqICAgIG9mX2lycV9pbml0KCkgc2V0cyBpdCB3aGlj
aCBwcmV2ZW50cyBjcmVhdGlvbiBvZgo+ID4gPiArICAgICAgICAqICAgIHBsYXRmb3JtIGRldmlj
ZS4KPiA+ID4gKyAgICAgICAgKi8KPiA+ID4gKyAgICAgICBub2RlLT5md25vZGUuZmxhZ3MgfD0g
RldOT0RFX0ZMQUdfQkVTVF9FRkZPUlQ7Cj4gPgo+ID4gUGxlYXNlIHN0b3Agc3BhbW1pbmcgdXMg
d2l0aCBicm9rZW4gcGF0Y2hlcy4gQWxyZWFkeSB0b2xkIHlvdSB0aGlzIGlzCj4gPiBub3QgYW4g
b3B0aW9uLgo+ID4KPiA+IE5hY2suCj4KPiBXaGF0IHB1enpsZXMgbWUgaGVyZSBpcyB0aGF0ICpu
byBvdGhlciBhcmNoKiByZXF1aXJlcyB0aGlzIHNvcnQgb2YKPiBoYWNrLiBXaGF0IGlzIHNvIHNw
ZWNpYWwgYWJvdXQgdGhlIEFQTElDIHRoYXQgaXQgcmVxdWlyZXMgaXQ/IEkgc2VlCj4gbm90aGlu
ZyBpbiB0aGlzIHBhdGNoIHRoYXQgZXZlbiBoaW50cyBhdCBpdCwgZGVzcGl0ZSB0aGUgImRpc2N1
c3Npb24iCj4gaW4gdGhlIGxhc3Qgcm91bmQuCj4KPiBUaGUgcnVsZXMgYXJlIHNpbXBsZToKPgo+
IC0gZWl0aGVyIHRoZSBBUExJQyBpcyBzbyBmdW5kYW1lbnRhbCB0byB0aGUgc3lzdGVtIHRoYXQg
aXQgaGFzIHRvIGJlCj4gICBpbml0aWFsaXNlZCBzdXBlciBlYXJseSwgbXVjaCBsaWtlIHRoZSBH
SUMgb24gYXJtNjQsIGF0IHdoaWNoIHBvaW50Cj4gICBpdCBjYW5ub3QgYmUgYSBwbGF0Zm9ybSBk
ZXZpY2UsIGFuZCB0aGUgc3RvcnkgaXMgcHJldHR5IHNpbXBsZS4KPgo+IC0gb3IgaXQgaXNuJ3Qg
dGhhdCBmdW5kYW1lbnRhbCwgYW5kIGl0IGNhbiBiZSBwcm9iZWQgYXMgYSBwbGF0Zm9ybQo+ICAg
ZGV2aWNlIHVzaW5nIHRoZSBkZXBlbmRlbmN5IGluZnJhc3RydWN0dXJlIHRoYXQgaXMgYWxyZWFk
eSB1c2VkIGJ5Cj4gICBtdWx0aXBsZSBvdGhlciBpbnRlcnJ1cHQgY29udHJvbGxlciBkcml2ZXJz
LCB3aXRob3V0IGFueSBuZWVkIHRvCj4gICBtZXNzIHdpdGggaW50ZXJuYWwgZmxhZ3MuIEFnYWlu
LCB0aGlzIHNob3VsZCBiZSBzaW1wbGUgZW5vdWdoLgoKQVBMSUMgbWFuYWdlcyBhbGwgd2lyZWQg
aW50ZXJydXB0cyB3aGVyZWFzIElNU0lDIG1hbmFnZXMgYWxsCk1TSXMuIEJvdGggQVBMSUMgYW5k
IElNU0lDIGFyZSBmdW5kYW1lbnRhbCBkZXZpY2VzIHdoaWNoIG5lZWQKdG8gYmUgcHJvYmVkIHN1
cGVyIGVhcmx5LgoKTm93IEFQTElDIGhhcyB0d28gbW9kZXMgb2Ygb3BlcmF0aW9uczoKMSkgRGly
ZWN0IG1vZGUgd2hlcmUgdGhlcmUgaXMgbm8gSU1TSUMgaW4gdGhlIHN5c3RlbSBhbmQgQVBMSUMK
ICAgIGRpcmVjdGx5IGluamVjdHMgaW50ZXJydXB0IHRvIENQVXMKMikgTVNJIG1vZGUgd2hlcmUg
SU1TSUMgaXMgcHJlc2VudCBpbiB0aGUgc3lzdGVtIGFuZCBBUExJQwogICAgY29udmVydHMgd2ly
ZWQgaW50ZXJydXB0cyBpbnRvIE1TSXMKClRoZSBBUExJQyBkcml2ZXIgYWRkZWQgYnkgdGhpcyBw
YXRjaCBpcyBhIGNvbW1vbiBkcml2ZXIgZm9yCmJvdGggYWJvdmUgbW9kZXMuCgpGb3IgIzIsIEFQ
TElDIG5lZWRzIHRvIGJlIGEgcGxhdGZvcm0gZGV2aWNlIHRvIGNyZWF0ZSBhIGRldmljZQpNU0kg
ZG9tYWluIHVzaW5nIHBsYXRmb3JtX21zaV9jcmVhdGVfZGV2aWNlX2RvbWFpbigpIHdoaWNoCmlz
IHdoeSB0aGUgQVBMSUMgZHJpdmVyIGlzIGEgcGxhdGZvcm0gZHJpdmVyLgoKPgo+IElmIHRoZXNl
IHJ1bGVzIGRvbid0IGFwcGx5IHRvIHlvdXIgc3R1ZmYsIHBsZWFzZSBleHBsYWluIHdoYXQgaXMg
c28KPiBkaWZmZXJlbnQuIEFuZCBJIG1lYW4gYWN0dWFsbHkgZXhwbGFpbiB0aGUgaXNzdWUuIFdo
aWNoIGlzbid0IHRlbGxpbmcKPiB1cyAiaXQgZG9lc24ndCB3b3JrIHdpdGhvdXQgaXQiLiBCZWNh
dXNlIGFzIHRoaW5ncyBzdGFuZCwgdGhlcmUgaXMgbm8KPiB3YXkgSSB3aWxsIGV2ZW4gY29uc2lk
ZXIgdGFraW5nIHRoaXMgdWdseSBtaXggb2YgcHJvYmluZyBtZXRob2RzLgoKWWVzLCBJIGRvbid0
IHdhbnQgdGhpcyB1Z2x5IEZXTk9ERV9GTEFHX0JFU1RfRUZGT1JUIGhhY2sKaW4gdGhpcyBkcml2
ZXIuCgpJIHRyaWVkIHNldmVyYWwgdGhpbmdzIGJ1dCBzZXR0aW5nIHRoZSBGV05PREVfRkxBR19C
RVNUX0VGRk9SVApmbGFnIGlzIHRoZSBvbmx5IHRoaW5nIHdoaWNoIHdvcmtzIHJpZ2h0IG5vdy4K
Cj4KPiBJbiBhbnkgY2FzZSwgcmVwb3N0aW5nIHRoZSBzYW1lIHN0dWZmIGFkIG5hdXNlYW0gaXMg
b25seSBnb2luZyB0bwo+IHJlc3VsdCBpbiB0aGlzIHNlcmllcyBiZWluZyBpZ25vcmVkLCB3aGlj
aCBJIGRvbid0IHRoaW5rIGlzIHdoYXQgeW91Cj4gd2FudC4KPgo+IFRoYW5rcywKPgo+ICAgICAg
ICAgTS4KPgo+IC0tCj4gV2l0aG91dCBkZXZpYXRpb24gZnJvbSB0aGUgbm9ybSwgcHJvZ3Jlc3Mg
aXMgbm90IHBvc3NpYmxlLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
