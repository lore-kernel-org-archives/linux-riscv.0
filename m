Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED3DEB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 18:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=cQLmWp7w9gPhUI93Gvv9xnaQrZJ0F7/ZtUDgyOpht2o=; b=T7tq6pMZAu0vyo16nM1V/VQF6U
	hEnPXhNFLbL5Jp6YfHbi6PEczqV4W7BTca2Z3Yn3pL4kjQaBNvwXT5lRwSH11O+Xii6SKZ36PlJ2O
	Mkr+f29q2lTmyIkIKAJtJsH7O6nRnfcnIyRKLh1FF0OVURJQ8BSwVhMY7reJ1joQIX9b5XFHtL0+3
	CCUzm8YY7eUPJG124GBMXL6T9b39Iw2dqazTgx4BrWjj1oBEqjOO5uBeJh8LU69+JtT6jTln+R33+
	3mR6XvftbfV8C8dvZBEqU+3gEVrqwssFP8yHaIaHWGdKRK3XlmmcWfoAILHDTniTZf7w5dQK841Rz
	5bGKZK9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC2Nq-00FMN3-0Q;
	Wed, 21 Jun 2023 18:16:46 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC2Nm-00FMLc-2M
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 18:16:44 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-668730696a4so2394868b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 11:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687371400; x=1689963400;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8e68++NcnQbaArNabGnOgRFzQahDfJmrbZvohFpl9f4=;
        b=q9TmuAuUD1OG8ULGpYXpNuvpNzUz7Mma5wuiexjwyPre+K4QsZm9sVWf37oHf+iDhY
         ah+sF4ZK707t9CcTcpLuvCl/66DgsNFw8rs6P5kgOV9FkQLDMB07b9v0Kg+ane3Qspjj
         FZxNE3rX2CNpBKMJ8oXjzPscxcAnpBAM2qhVA4NRAKbvsUTTXdtGRMjexdIcdUEdPnMr
         S1tk22MqjJ9wxK7atXxb+Q03y3osWUCFpB/wxG5v/Hr/2n8PAugVpv+TJ0cngkjmeyqj
         361gvJMegNak7Pv4/5Sk3FwbP7MbXmk594KRu2IMvA1lhaOfjFycIS0k0mtK0OPq9o37
         03Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687371400; x=1689963400;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8e68++NcnQbaArNabGnOgRFzQahDfJmrbZvohFpl9f4=;
        b=hADKy0E6ztR19K6lOu4tP6TxcV7jpt7aZ5Xe68NU0kBBVT6Ud0M4nVK/6rH1jagoG0
         E27Ydu8vnFEGiDPOr8NZr0qFsfAwueMcFxSyKN+BJtdy2bKZZgUdJKbogY4idCoJVdEd
         vimoQtgqvbBig4C0ajredgJc3KJV33l6h6AFobp26j3G2Dcqeeaq4DZH/qUu4yYRy8zw
         wtdaI4Z8njZ21JNvolNUKZdbWAMqCoWKh+fLX6UjZu+iFN5NmMB/xbo4xetDzXFppLlG
         eTqe/ZgAlFI1zR9MDn2mivd4i5pIF2OqS2j6Nj8xdrq6j7NDhC7fHPyP47U1AZeHDRhz
         paNw==
X-Gm-Message-State: AC+VfDzzxAFGgbdevE2pFqg/+8ZP3pIG9pYx+2DXP0urETyDjOPlfW/q
	sojayjqDvCyleTd+i107cXefiL/j6zIZrqBI6Xs=
X-Google-Smtp-Source: ACHHUZ7kFGDojh47WOCjGXBh098jhENgQacdBnEwnn5W3MoVi9AePASdrDT6Go4BWjstQyupknLNnQ==
X-Received: by 2002:a05:6a00:850:b0:668:8259:18d7 with SMTP id q16-20020a056a00085000b00668825918d7mr8719652pfk.30.1687371400077;
        Wed, 21 Jun 2023 11:16:40 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id a14-20020a62bd0e000000b006579b062d5dsm3201263pff.21.2023.06.21.11.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 11:16:38 -0700 (PDT)
Date: Wed, 21 Jun 2023 11:16:38 -0700 (PDT)
X-Google-Original-Date: Wed, 21 Jun 2023 11:15:54 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Clobber V registers on syscalls
In-Reply-To: <12784326.9UPPK3MAeB@basile.remlab.net>
CC: linux-riscv@lists.infradead.org, andy.chiu@sifive.com, bjorn@kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: remi@remlab.net, Darius Rad <darius@bluespec.com>
Message-ID: <mhng-b4c2eacc-ad74-409c-a6eb-d908866bb602@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_111642_983750_711A9B77 
X-CRM114-Status: GOOD (  35.62  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMSBKdW4gMjAyMyAwOTo0NzozNyBQRFQgKC0wNzAwKSwgcmVtaUByZW1sYWIubmV0
IHdyb3RlOgo+IExlIGtlc2tpdmlpa2tvbmEgMjEuIGtlc8Oka3V1dGEgMjAyMywgMTcuMjYuMTQg
RUVTVCBCasO2cm4gVMO2cGVsIGEgw6ljcml0IDoKPj4gUGFsbWVyIERhYmJlbHQgPHBhbG1lckBy
aXZvc2luYy5jb20+IHdyaXRlczoKPj4gPiBPbiBNb24sIDE5IEp1biAyMDIzIDEyOjAxOjIwIFBE
VCAoLTA3MDApLCBiam9ybkBrZXJuZWwub3JnIHdyb3RlOgo+PiA+PiBQYWxtZXIgRGFiYmVsdCA8
cGFsbWVyQHJpdm9zaW5jLmNvbT4gd3JpdGVzOgo+PiA+PiAKPj4gPj4gWy4uLl0KPj4gPj4gCj4+
ID4+Pj4+ICsJCXJpc2N2X3ZfdnN0YXRlX29mZihyZWdzKTsKPj4gPj4+Pj4gKwo+PiA+Pj4+IAo+
PiA+Pj4+IE5vdCBvZmYsIHJpZ2h0PyBJc24ndCBpdCBfX3Jpc2N2X3ZfdnN0YXRlX2NsZWFuKCkg
dGhhdCB5b3UnZCBsaWtlIHRvCj4+ID4+Pj4gY2FsbD8gU29tZXRoaW5nIGxpa2U6Cj4+ID4+Pj4g
Cj4+ID4+Pj4gc3RhdGljIHZvaWQgdnN0YXRlX2Rpc2NhcmQoc3RydWN0IHB0X3JlZ3MgKnJlZ3Mp
Cj4+ID4+Pj4gewo+PiA+Pj4+IAo+PiA+Pj4+ICAgICAgICBpZiAoKHJlZ3MtPnN0YXR1cyAmIFNS
X1ZTKSA9PSBTUl9WU19ESVJUWSkKPj4gPj4+PiAgICAgICAgCj4+ID4+Pj4gICAgICAgICAgICAg
ICAgX19yaXNjdl92X3ZzdGF0ZV9jbGVhbihyZWdzKTsKPj4gPj4+PiAKPj4gPj4+PiB9Cj4+ID4+
Pj4gCj4+ID4+Pj4gQ29tcGxlbWVudGVkIGJ5IGEgIVYgY29uZmlnIHZhcmlhbnQuCj4+ID4+PiAK
Pj4gPj4+IEkgdGhpbmsgaXQncyBqdXN0IGEgcXVlc3Rpb24gb2Ygd2hhdCB3ZSdyZSB0cnlpbmcg
dG8gZG8gaGVyZTogY2xlYW4KPj4gPj4+IGF2b2lkcyB0aGUga2VybmVsIFYgc3RhdGUgc2F2ZSwg
YnV0IHVubGVzcyB0aGUga2VybmVsIGRlY2lkZXMgdG8gdXNlIFYKPj4gPj4+IGR1cmluZyB0aGUg
c3lzY2FsbCB0aGUgcmVnaXN0ZXIgY29udGVudHMgd2lsbCBzdGlsbCBiZSB1c2FibGUgYnkKPj4g
Pj4+IHVzZXJzcGFjZS4gIE1heWJlIHRoYXQncyBmaW5lIGFuZCB3ZSBjYW4ganVzdCByZWx5IG9u
IHRoZSBJU0Egc3BlYywKPj4gPj4+IHRob3VnaD8gIEkgc2VudCBhbm90aGVyIHBhdGNoIHRvIGp1
c3QgZG9jdW1lbnQgaXQgaW4gTGludXgsIGV2ZW4gaWYgaXQncwo+PiA+Pj4gaW4gdGhlIElTQSBz
cGVjIGl0IHNlZW1zIHdvcnRoIGhhdmluZyBpbiB0aGUga2VybmVsIGFzIHdlbGwuCj4+ID4+PiAK
Pj4gPj4+IFRoYXQgc2FpZCwgSSB0aGluayB0aGUgcmlnaHQgdGhpbmcgdG8gZG8gaGVyZSBtaWdo
dCBiZSB0byB6ZXJvIHRoZSBWCj4+ID4+PiByZWdpc3RlciBzdGF0ZSBhbmQgc2V0IGl0IHRvIGlu
aXRpYWw6IHRoYXQgd2F5IHdlIGNhbiBwcmV2ZW50IHVzZXJzcGFjZQo+PiA+Pj4gZnJvbSBhY2Np
ZGVudGFsbHkgcmVseWluZyBvbiB0aGUgc3RhdGUgc2F2ZSwgYnV0IHdlIGNhbiBhbHNvIGF2b2lk
IHRoZQo+PiA+Pj4gdHJhcCB0aGF0IHdvdWxkIGNvbWUgZnJvbSB0dXJuaW5nIGl0IG9mZi4gIFRo
YXQgbGV0cyB1cyBnaXZlIHRoZQo+PiA+Pj4gaGFyZHdhcmUgYSBuaWNlIGNsZWFuIGluZGljYXRp
b24gd2hlbiB0aGUgViBzdGF0ZSBpc24ndCBpbiB1c2UsIHdoaWNoCj4+ID4+PiB3aWxsIGhvcGVm
dWxseSBoZWxwIHVzIGF2b2lkIHRoZSBzYXZlL3Jlc3RvcmUgcGVyZm9ybWFuY2UgaXNzdWVzIHRo
YXQKPj4gPj4+IG90aGVyIHBvcnRzIGhhdmUgaGl0Lgo+PiA+PiAKPj4gPj4gRldJVywgSSB0aGlu
ayB0aGF0J3MgYSBtdWNoIGJldHRlciBpZGVhIHRoYW4gdHVybmluZyBWIG9mZi4gSSBhbHNvIGxp
a2UKPj4gPj4gdGhhdCBpdCdsbCBwcmV2ZW50aW5nIHVzZXJsYW5kIHRvIHJlbHkgb24gcHJlLWVj
YWxsIHN0YXRlLgo+PiA+IAo+PiA+IE9LLCBhbnlvbmUgZWxzZSBvcHBvc2VkPwo+PiA+IAo+PiA+
IFdlJ3JlIGtpbmQgb2YgaW4gdGhlIHdlZWRzIG9uIHBlcmZvcm1hbmNlLCBJIHRoaW5rIHdlJ2Qg
bmVlZCBIVyB0byBrbm93Cj4+ID4gZm9yIHN1cmUgaWYgZWl0aGVyIGlzIGFuIGlzc3VlLiAgU2Vl
bXMgYmVzdCB0byBqdXN0IHBsYXkgaXQgc2FmZSBXUlQgdGhlCj4+ID4gdUFCSSBmb3Igbm93LCB3
ZSBjYW4gYWx3YXlzIGRlYWwgd2l0aCBhbnkgcGVyZm9ybWFuY2UgaXNzdWVzIGlmIHRoZQo+PiA+
IGV4aXN0Lgo+PiAKPj4gSGVyZSdzIHRoZSBwYXRjaCB5b3UgbWVudGlvbmVkIGF0IHRoZSBQVyBz
eW5jaHVwOyBJJ3ZlIGtlcHQgdGhlIFN1YmplY3QKPj4gYW5kIHN1Y2ggaWYgeW91IHdhbid0IHRv
IGFwcGx5IGl0LiBMTUsgaWYgeW91J2QgbGlrZSBhIHByb3BlciBvbmUuCj4+IAo+PiAtLQo+PiAK
Pj4gU3ViamVjdDogW1BBVENIXSByaXNjdjogRGlzY2FyZCB2ZWN0b3Igc3RhdGUgb24gc3lzY2Fs
bHMKPj4gTUlNRS1WZXJzaW9uOiAxLjAKPj4gQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFy
c2V0PVVURi04Cj4+IENvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKPj4gCj4+IFRoZSBS
SVNDLVYgdmVjdG9yIHNwZWNpZmljYXRpb24gc3RhdGVzOgo+PiAgIEV4ZWN1dGluZyBhIHN5c3Rl
bSBjYWxsIGNhdXNlcyBhbGwgY2FsbGVyLXNhdmVkIHZlY3RvciByZWdpc3RlcnMKPj4gICAodjAt
djMxLCB2bCwgdnR5cGUpIGFuZCB2c3RhcnQgdG8gYmVjb21lIHVuc3BlY2lmaWVkLgo+PiAKPj4g
VGhlIHZlY3RvciBzdGF0dXMgaXMgc2V0IHRvIEluaXRpYWwsIGFuZCB0aGUgdmVjdG9yIHN0YXRl
IGlzCj4+IGV4cGxpY2l0bHkgemVyb2VkLiBUaGF0IHdheSB3ZSBjYW4gcHJldmVudCB1c2Vyc3Bh
Y2UgZnJvbSBhY2NpZGVudGFsbHkKPj4gcmVseWluZyBvbiB0aGUgc3RhdGVkIHNhdmUuCj4+IAo+
PiBTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4+IC0t
LQo+PiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oIHwgMjQgKysrKysrKysrKysrKysr
KysrKysrKysrCj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jICAgICAgIHwgIDIgKysKPj4g
IDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQo+PiAKPj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKPj4gYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3ZlY3Rvci5oIGluZGV4IDA0YzBiMDdiZjZjZC4uYjMwMjBkMDY0ZjQyIDEwMDY0NAo+PiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdmVjdG9yLmgKPj4gQEAgLTE2Myw2ICsxNjMsMjkgQEAgc3RhdGljIGlubGluZSB2
b2lkIF9fc3dpdGNoX3RvX3ZlY3RvcihzdHJ1Y3QKPj4gdGFza19zdHJ1Y3QgKnByZXYsIHZvaWQg
cmlzY3Zfdl92c3RhdGVfY3RybF9pbml0KHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrKTsKPj4gIGJv
b2wgcmlzY3Zfdl92c3RhdGVfY3RybF91c2VyX2FsbG93ZWQodm9pZCk7Cj4+IAo+PiArc3RhdGlj
IGlubGluZSB2b2lkIHJpc2N2X3ZfdnN0YXRlX2Rpc2NhcmQoc3RydWN0IHB0X3JlZ3MgKnJlZ3Mp
Cj4+ICt7Cj4+ICsJdW5zaWduZWQgbG9uZyB2bDsKPj4gKwo+PiArCWlmICghcmlzY3Zfdl92c3Rh
dGVfcXVlcnkocmVncykpCj4+ICsJCXJldHVybjsKPj4gKwo+PiArCXJpc2N2X3ZfdnN0YXRlX29u
KHJlZ3MpOwo+PiArCj4+ICsJcmlzY3Zfdl9lbmFibGUoKTsKPj4gKwlhc20gdm9sYXRpbGUgKAo+
PiArCQkiLm9wdGlvbiBwdXNoXG5cdCIKPj4gKwkJIi5vcHRpb24gYXJjaCwgK3Zcblx0Igo+PiAr
CQkidnNldHZsaQklMCwgeDAsIGU4LCBtOCwgdGEsIG1hXG5cdCIKPj4gKwkJInZtdi52LmkJdjAs
IDBcblx0Igo+PiArCQkidm12LnYuaQl2OCwgMFxuXHQiCj4+ICsJCSJ2bXYudi5pCXYxNiwgMFxu
XHQiCj4+ICsJCSJ2bXYudi5pCXYyNCwgMFxuXHQiCj4+ICsJCSIub3B0aW9uIHBvcFxuXHQiCj4+
ICsJCTogIj0mciIgKHZsKSA6IDogIm1lbW9yeSIpOwo+PiArCXJpc2N2X3ZfZGlzYWJsZSgpOwo+
Cj4gU2hvdWxkbid0IHRoaXMgYWxzbyBzZXQgYHZpbGxgIHRvIDEgdXNpbmcgYHZzZXR2bGA/CgpU
aGF0IHNlZW1zIHJlYXNvbmFibGUgdG8gbWUuCgo+IEluIGZhY3QsIGEgZmFzdGVyIGFsdGVybmF0
aXZlIG1heSB5ZXQgYmUgdG8gKm9ubHkqIHNldCBhbiBpbnZhbGlkIHZlY3RvciAKPiBjb25maWd1
cmF0aW9uLiBJdCdzIHJhdGhlciB1bmxpa2VseSB0aGF0IHVzZXItc3BhY2UgY29kZSB3b3VsZCBz
ZXQgYSB2YWxpZCAKPiBjb25maWd1cmF0aW9uIGFuZCB1c2UgdmVjdG9ycyB3aXRob3V0IGxvYWRp
bmcgdGhlbSBmaXJzdC4gSWYgaXQgZXZlciBkb2VzLCB0aGVuIAo+IGl0J3Mgc28gYnJva2VuIHRo
YXQgdGhlIGtlcm5lbCBwcm9iYWJseSBkb2Vzbid0IG5lZWQgdG8gY2FyZS4KCkkgdGhpbmsgdGhh
dCdzIHN1ZmZpY2llbnQgdG8gZm9yY2UgdXNlcnNwYWNlIHRvIHRyYXAgb24gYSBiYWQgdmFsdWU/
ICAKTW9zdCBvZiB0aGUgdW5zdXBwb3J0ZWQgdmFsdWUgd3JpdGVzIGluIFJJU0MtViBhcmUganVz
dCBXQVJMLCBidXQgYXMgZmFyIAphcyBJIGNhbiB0ZWxsIHRoZSBWIHNwZWMgcmVxdWlyZXMgdmls
bCBoYW5kbGluZy4gIFNwZWNpZmljYWxseQoKICAgIEltcGxlbWVudGF0aW9ucyBtdXN0IGNvbnNp
ZGVyIGFsbCBiaXRzIG9mIHRoZSB2dHlwZSB2YWx1ZSB0byAKICAgIGRldGVybWluZSBpZiB0aGUg
Y29uZmlndXJhdGlvbiBpcyBzdXBwb3J0ZWQuIEFuIHVuc3VwcG9ydGVkIHZhbHVlIGluIAogICAg
YW55IGxvY2F0aW9uIHdpdGhpbiB0aGUgdnR5cGUgdmFsdWUgbXVzdCByZXN1bHQgaW4gdmlsbCBi
ZWluZyBzZXQuCgp3aGljaCBzZWVtcyBwcmV0dHkgY29uY3JldGUgYWJvdXQgdGhpcyBiZWluZyBy
ZXF1aXJlZC4gIFRoYXQncyBmcm9tIHRoZSAKY3VycmVudCBkcmFmdCBvZiB0aGUgViBzcGVjLCB0
aGUgd29yZGluZyBpbiAxLjAgaXNuJ3QgcXVpdGUgYXMgY2xlYXI6IGl0IApzb3J0IG9mIGFsbG93
cyBmb3IgdGhlIFdBUkwtdHlwZSBiZWhhdmlvciwgYnV0IHRoYXQncyBwcm9iYWJseSBzcGxpdHRp
bmcgCmhhaXJzLgoKVGhhdCBzYWlkLCBpdCBwcm92aWRlcyBhIHNsaWdodGx5IGRpZmZlcmVudCBj
b3N0IGN1cnZlOiB3ZSdkIG5lZWQgdG8gCnNhdmUvcmVzdG9yZSB0aGUgViByZWdpc3RlcnMgb24g
bm9uLXN5c2NhbGwgdHJhcHMgZXZlbiB3aGVuIHZpbGwgaXMgc2V0IAppbiB1c2Vyc3BhY2UsIGFz
IHRoZXkndmUgc3RpbGwgZ290IHN0YXRlIGluIHRoZW0gKHVzZXJzcGFjZSBjb3VsZCBiZSBpbiAK
dGhlIG1pZGRsZSBvZiBzb21lIHByb2Jpbmcgcm91dGluZSwgZm9yIGV4YW1wbGUpLgoKQWxzbyBm
cm9tIERhcml1cycgZm9yayBvZiB0aGUgdGhyZWFkOiBJSVVDIHRoZXJlJ3Mgbm90aGluZyBzYXlp
bmcgMCBpcyAKaW5pdGlhbCwgb3IgdGhhdCBpbml0aWFsIGV2ZW4gbmVlZHMgdG8gd29yay4gIFNv
IEkgdGhpbmsgd2UncmUganVzdCAKc3BsaXR0aW5nIGhhaXJzIGhlcmUsIGFzIGxvbmcgYXMgd2Ug
Y2xvYmJlciBlbm91Z2ggc3RhdGUgdGhhdCB1c2Vyc3BhY2UgCmRvZXNuJ3QgYWNjaWRlbnRhbGx5
IGRlcGVuZCBvbiBpcyBmaW5lIHdpdGggbWUuCgo+IC0tIAo+IOmbt+exs+KAp+W+t+WwvC3lupPl
sJTokpkKPiBodHRwOi8vd3d3LnJlbWxhYi5uZXQvCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
