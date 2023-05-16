Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73FAC77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 02:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWKIN3PLB/GlgL470oERU0ZWlBYIJFDjfgJePown00o=; b=CM7KxvOVqJM30T
	myPnhu7C2Iwak/M/w/08PEKelVgNuywMv0HY4LonTkx4deR8whgvN37WW6tH3rQST5k4vfmVE9Ucv
	GVZ8HgAVGEzAFzYssiuyYpMwAEccj6vlKjLe+sDgaqK56CZmgfES8wiqm7HwGnZsL9pYZG3SuvZho
	9GchEwYBDZM9YV+i8mmlKG8JvhV6jRyFusJn4nI4f9yL12kFxJMMiMSD/5nY+m5NzWStiftgwZKWS
	Nw3uOGh8Emf1kFFrCaHR/+lo69vvFq1z38dp0PMKvCDK9mtJe/zCIpLSKbCwu4FLfH2VshpSj7NqV
	Nk/GOecfrOLhuKv7L3vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pykiz-004B3Q-2t;
	Tue, 16 May 2023 02:47:41 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pykiv-004B1e-38
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 02:47:39 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f383d6f2f8so1904276e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 May 2023 19:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684205253; x=1686797253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDLmHnpvk15EZ9t+4mD2jGDqT9ebZTM14ao6Km5+uRY=;
        b=dyF3YpJfebcxGU8xQlepQ2FyLKlhsjT6sJF7rZzkKl0P24S+FtUzSTyt2MDHZj6x6e
         Aw44soumI2lu3Y/mNDiiyEOlfPRZPnbZsJ35ZXa4trswzRaQHFcb7zi1yaifH5O7++l+
         YRi+yP7plIIX8TTdSlL9sGqzC7rGVXFZ6N2m2Y1Co7xhw7ugKDz3HuVQ2wOepXOYrhWe
         PxQOn3KG9P3ZejbT0q0LjZA2/2UDfXzBpAgPRPc95MbuuGSD4PgkMksxCeKGV7RRKuPo
         iA+7QrVHfKhdgB+R4QVGBTRfJMyEPXXjPAMIUXvcdWkW3pEdDj630nKW/4nXH4KCpGXO
         V1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684205253; x=1686797253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDLmHnpvk15EZ9t+4mD2jGDqT9ebZTM14ao6Km5+uRY=;
        b=GX9GZxQhRbc0pN0dkXV7RwwQj3lila75YXSW4J6im0kDOIIrpGDdz/m06lb6Ok1RH3
         pyQKRcsC2UlAhRKFkkV6NHxvzF85yvhSWG3eRPWoio0kJaU4MOexkHa5ndUN5jgRuuHp
         ml3nCt6AtO3DbY8/DW7W+sn7g61rtZqBJsra3o0AxYJ2MyKmjZfzP2ThccGIF+LQVVr3
         mZ3Npwnmgoh8wlxfZLta1ET9MEieiKI4LEDKiNDn/gGsLWU1hA77Qme+VQNrdLzmWYaF
         KLP+oK1+lyacD2uqKecqJwXyxJZR5YfgLYswuJaLVTB1cibUrDUPmrPWPpLQOjdwqx6s
         VzCg==
X-Gm-Message-State: AC+VfDzFcKmyHKVhZqGe1tA5d4ltP+ViuvLaGknitYcVjAFrmCJl9/Os
	g9v6Zb98FmyBUDcEXgbe1OdMT3hpzj5rD2OLI0A7Jw==
X-Google-Smtp-Source: ACHHUZ7uHIgMczQDhqVzrXSpb/I1cUQWnTXkrh16XZmxjDNv+BBoqvsiCVI+u8uAcaYK6CVlk5ZG9Vylrez0ukFv7jg=
X-Received: by 2002:ac2:5fa5:0:b0:4d7:59e6:388e with SMTP id
 s5-20020ac25fa5000000b004d759e6388emr6063478lfe.46.1684205253535; Mon, 15 May
 2023 19:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230509103033.11285-2-andy.chiu@sifive.com> <mhng-b8482399-b363-402b-b095-ce1b1dc1fe71@palmer-ri-x1c9a>
In-Reply-To: <mhng-b8482399-b363-402b-b095-ce1b1dc1fe71@palmer-ri-x1c9a>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 16 May 2023 10:47:22 +0800
Message-ID: <CABgGipVS=Zww5DSQf__axMRf7DrbA3BfPyq2k5L-pXtV1nsjjw@mail.gmail.com>
Subject: Re: [PATCH -next v19 01/24] riscv: Rename __switch_to_aux() -> fpu
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Vineet Gupta <vineetg@rivosinc.com>, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	ren_guo@c-sky.com, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	heiko.stuebner@vrull.eu, guoren@kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, jszhang@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_194738_136301_A686D5E9 
X-CRM114-Status: GOOD (  18.01  )
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

T24gRnJpLCBNYXkgMTIsIDIwMjMgYXQgNjo1NuKAr0FNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
ZGFiYmVsdC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCAwOSBNYXkgMjAyMyAwMzozMDoxMCBQRFQg
KC0wNzAwKSwgYW5keS5jaGl1QHNpZml2ZS5jb20gd3JvdGU6Cj4gPiBGcm9tOiBHdW8gUmVuIDxy
ZW5fZ3VvQGMtc2t5LmNvbT4KPiA+Cj4gPiBUaGUgbmFtZSBvZiBfX3N3aXRjaF90b19hdXgoKSBp
cyBub3QgY2xlYXIgYW5kIHJlbmFtZSBpdCB3aXRoIHRoZQo+ID4gZGV0ZXJtaW5lIGZ1bmN0aW9u
OiBfX3N3aXRjaF90b19mcHUoKS4gTmV4dCB3ZSBjb3VsZCBhZGQgb3RoZXIgcmVncycKPiA+IHN3
aXRjaC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxyZW5fZ3VvQGMtc2t5LmNvbT4K
PiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+
IFNpZ25lZC1vZmYtYnk6IEdyZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+Cj4g
PiBSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KPiA+IFJldmll
d2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5jb20+Cj4gPiBUZXN0ZWQtYnk6IEhl
aWtvIFN0dWVibmVyIDxoZWlrby5zdHVlYm5lckB2cnVsbC5ldT4KPiA+IFJldmlld2VkLWJ5OiBI
ZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJAdnJ1bGwuZXU+Cj4gPiBSZXZpZXdlZC1ieTog
Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiA+IC0tLQo+ID4gIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vc3dpdGNoX3RvLmggfCA2ICsrKy0tLQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3dpdGNoX3RvLmggYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3N3aXRjaF90by5oCj4gPiBpbmRleCA2MGY4Y2EwMWQzNmUuLjRiOTZiMTNkZWUyNyAx
MDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3dpdGNoX3RvLmgKPiA+ICsr
KyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3dpdGNoX3RvLmgKPiA+IEBAIC00Niw3ICs0Niw3
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBmc3RhdGVfcmVzdG9yZShzdHJ1Y3QgdGFza19zdHJ1Y3Qg
KnRhc2ssCj4gPiAgICAgICB9Cj4gPiAgfQo+ID4KPiA+IC1zdGF0aWMgaW5saW5lIHZvaWQgX19z
d2l0Y2hfdG9fYXV4KHN0cnVjdCB0YXNrX3N0cnVjdCAqcHJldiwKPiA+ICtzdGF0aWMgaW5saW5l
IHZvaWQgX19zd2l0Y2hfdG9fZnB1KHN0cnVjdCB0YXNrX3N0cnVjdCAqcHJldiwKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB0YXNrX3N0cnVjdCAqbmV4dCkKPiA+
ICB7Cj4gPiAgICAgICBzdHJ1Y3QgcHRfcmVncyAqcmVnczsKPiA+IEBAIC02Niw3ICs2Niw3IEBA
IHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCBoYXNfZnB1KHZvaWQpCj4gPiAgc3RhdGljIF9f
YWx3YXlzX2lubGluZSBib29sIGhhc19mcHUodm9pZCkgeyByZXR1cm4gZmFsc2U7IH0KPiA+ICAj
ZGVmaW5lIGZzdGF0ZV9zYXZlKHRhc2ssIHJlZ3MpIGRvIHsgfSB3aGlsZSAoMCkKPiA+ICAjZGVm
aW5lIGZzdGF0ZV9yZXN0b3JlKHRhc2ssIHJlZ3MpIGRvIHsgfSB3aGlsZSAoMCkKPiA+IC0jZGVm
aW5lIF9fc3dpdGNoX3RvX2F1eChfX3ByZXYsIF9fbmV4dCkgZG8geyB9IHdoaWxlICgwKQo+ID4g
KyNkZWZpbmUgX19zd2l0Y2hfdG9fZnB1KF9fcHJldiwgX19uZXh0KSBkbyB7IH0gd2hpbGUgKDAp
Cj4gPiAgI2VuZGlmCj4gPgo+ID4gIGV4dGVybiBzdHJ1Y3QgdGFza19zdHJ1Y3QgKl9fc3dpdGNo
X3RvKHN0cnVjdCB0YXNrX3N0cnVjdCAqLAo+ID4gQEAgLTc3LDcgKzc3LDcgQEAgZG8geyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4g
ICAgICAgc3RydWN0IHRhc2tfc3RydWN0ICpfX3ByZXYgPSAocHJldik7ICAgICAgICAgICAgXAo+
ID4gICAgICAgc3RydWN0IHRhc2tfc3RydWN0ICpfX25leHQgPSAobmV4dCk7ICAgICAgICAgICAg
XAo+ID4gICAgICAgaWYgKGhhc19mcHUoKSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ID4gLSAgICAgICAgICAgICBfX3N3aXRjaF90b19hdXgoX19wcmV2LCBfX25leHQpOyAg
ICAgICAgXAo+ID4gKyAgICAgICAgICAgICBfX3N3aXRjaF90b19mcHUoX19wcmV2LCBfX25leHQp
OyAgICAgICAgXAo+ID4gICAgICAgKChsYXN0KSA9IF9fc3dpdGNoX3RvKF9fcHJldiwgX19uZXh0
KSk7ICAgICAgICAgXAo+ID4gIH0gd2hpbGUgKDApCj4KPiBSZXZpZXdlZC1ieTogUGFsbWVyIERh
YmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgpJIG5vdGljZWQgdGhhdCB5b3VyIFItYiBoYXMg
YmVlbiBoZXJlIGZvciBhIHdoaWxlIChhdCBsZWFzdCBzaW5jZSB2MTMKd2hlcmUgSSBzdGFydGVk
IHRvIGhhbmRsZSB0aGlzIHNlcmllcykuIERvIHlvdSB3YW50IG1lIHRvIGtlZXAgdGhlCm9yaWdp
bmFsLCBvciB0aGUgbGFzdCBvbmU/CgpUaGFua3MsCkFuZHkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
