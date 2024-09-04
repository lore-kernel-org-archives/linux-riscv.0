Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92ACFCD4857
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 16:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hc3uzrDu1BPD6sfWy5S2HWVizG9kAyFceY2qiI8f1o0=; b=A7qjxgERnbs1Ux
	f3gykN9gWiNuANoCwm98jTpLdVyA0+p/YzDFphz4PF8p9gxJqGXkpxneq9JolQD+S/ge7Z1EBysKZ
	Jdnaauf+VCf4z2WC9/qELj63x1/xNMsl6/IkznBGrgdFCu70z5jJCTPXL43ea8EW8zN/psaRX6kz9
	/0x5MLhUC1vfE63KbbuyQZmI02lUi2X8H+6dt/EZVWoOsbS+3sqbaRPiUmuYwY8GFfevlWEA2+Mt4
	kkvpNB69jhnSzU894OA/nuEq7/SGuh8KTQlTkA65B7RM1vUlnab1oHKZbEgo/AZi+/pW8CsNjw7v9
	AeNCF6lTKk8/aZZ9ACsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slsuX-00000005GcQ-2WfN;
	Wed, 04 Sep 2024 16:31:13 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slroN-00000004yET-0pyG
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 15:20:49 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-39f51934f61so15654345ab.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Sep 2024 08:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1725463246; x=1726068046; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhDF0SQeiM2A3Xk/DMuv3JXuwNqZLtLOCwSo8gz5fyA=;
        b=VPYCthQXZV4ho7WirAkNXjP6c4Z8+xvx/5RmjOgKRkCp+MLLdFTMC6iLhVbrL2Z2q1
         6cP2HY9uB3MQUtY4qlkoVkiL6AHqQsNT6mArad2IS1sKUnShT+shKcJwvh2rubJxob4K
         VgxQzYLOXSt18y0+tSi6J/1f5htSNbEfxl7qpamveqzdQ3SAKnnl9hpH5wcH1puyI3Bl
         XOzRAvobi1NtnirDPP+fAmC+POWWgxJeHlbka5fPKhXAgRpzwfCsetT6JqcyQ6VXXX6G
         Yj+P8bKiX9SkxFvyaCtWoBw03ZwvbtczkR1TgwPIAmZbPLuXehEwxre1CDWWsppadz4b
         4u2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725463246; x=1726068046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhDF0SQeiM2A3Xk/DMuv3JXuwNqZLtLOCwSo8gz5fyA=;
        b=mAFJgzrRzLdfxIMW7xV/XFpvOSYMuHcOAVA1+KKiwViX25bqyc+0NWbRawSrUXYGWH
         E5lmzbk1n92GHtsggy8WcqJqTbDcbzzE9vw5ZHUAAmVrUg7thBKsVDYX86pUY7rzMFHF
         +C+hso+KTu+nnNACc92qs4OLWuybAzZO5e3brBEK3ksEhyeb/zYwNwpG+aBy7SdURoUb
         Ka85Z0Hljeww/Wjvmol3TdN7p17H3LdEsgzY2O7GzBzmd+PkpxhmYGtycxQ7Zv+TTOP1
         lpsqqirbmoqrBfW9QM9jmiP/LsRbUR5bMjcMwy4fE3O/NUKZdO5+bLyT/KuBmzsou1Dm
         HXLw==
X-Forwarded-Encrypted: i=1; AJvYcCUp7DnpK0s94cpEi3yPlMjyjclQzBxuQPkzN3H2nlAJYEKc2kTrL52KxWNzSUpx5UGv/Cbgj8r6Gi/T8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJTn+hAWP9V0REXDkZ2GpkjwzfMHF3FYXXCqkLGvi1rBdVAloS
	5GPC6WrkS22iMAFFuQZZM+HQh+y31bWz5by9herxpDwQm5JXVzJhZPSYcNgB0YLfeqs+sbHrDaT
	34qARQts/U2iVxlItVFcwsAw1t8AvjBynFYGt7A==
X-Google-Smtp-Source: AGHT+IFiKaBWReK0tbHlJpXTKJ8AZC/Ae/CVs7LTX1J5vcwRf7FmLNwzwKIaBz82dofnaoXmdcIiu+c9zdUQYU1F7lU=
X-Received: by 2002:a05:6e02:2181:b0:39d:376b:20cb with SMTP id
 e9e14a558f8ab-39f6aa30e14mr79570475ab.25.1725463245792; Wed, 04 Sep 2024
 08:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240829010151.2813377-1-samuel.holland@sifive.com>
 <20240829010151.2813377-10-samuel.holland@sifive.com> <CAK9=C2WjraWjuQCeU2Y4Jhr-gKkOcP42Sza7wVp0FgeGaD923g@mail.gmail.com>
 <b6de8769-7e4e-4a19-b239-a39fd424e0c8@sifive.com> <CAAhSdy08SoDoZCii9R--BK7_NKLnRciW7V3mo2aQRKW1dbOgNg@mail.gmail.com>
 <20ab0fa2-d5dd-446d-9fff-a3ef82e8db35@sifive.com>
In-Reply-To: <20ab0fa2-d5dd-446d-9fff-a3ef82e8db35@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 4 Sep 2024 20:50:35 +0530
Message-ID: <CAAhSdy1pZcEfajg3OZUCaFf9JMYcMzpRVogCT5VL2FHx__vDdA@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] RISC-V: KVM: Allow Smnpm and Ssnpm extensions
 for guests
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com, 
	Atish Patra <atishp@atishpatra.org>, Evgenii Stepanov <eugenis@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_082047_251204_A0FBECF5 
X-CRM114-Status: GOOD (  42.46  )
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

T24gV2VkLCBTZXAgNCwgMjAyNCBhdCA4OjI34oCvUE0gU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5o
b2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gSGkgQW51cCwKPgo+IE9uIDIwMjQtMDktMDQg
OTo0NSBBTSwgQW51cCBQYXRlbCB3cm90ZToKPiA+IE9uIFdlZCwgU2VwIDQsIDIwMjQgYXQgODow
MeKAr1BNIFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToK
PiA+PiBPbiAyMDI0LTA5LTA0IDc6MTcgQU0sIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPj4+IE9uIFRo
dSwgQXVnIDI5LCAyMDI0IGF0IDY6MzLigK9BTSBTYW11ZWwgSG9sbGFuZAo+ID4+PiA8c2FtdWVs
LmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPj4+Pgo+ID4+Pj4gVGhlIGludGVyZmFjZSBm
b3IgY29udHJvbGxpbmcgcG9pbnRlciBtYXNraW5nIGluIFZTLW1vZGUgaXMgaGVudmNmZy5QTU0s
Cj4gPj4+PiB3aGljaCBpcyBwYXJ0IG9mIHRoZSBTc25wbSBleHRlbnNpb24sIGV2ZW4gdGhvdWdo
IHBvaW50ZXIgbWFza2luZyBpbgo+ID4+Pj4gSFMtbW9kZSBpcyBwcm92aWRlZCBieSB0aGUgU21u
cG0gZXh0ZW5zaW9uLiBBcyBhIHJlc3VsdCwgZW11bGF0aW5nIFNtbnBtCj4gPj4+PiBpbiB0aGUg
Z3Vlc3QgcmVxdWlyZXMgKG9ubHkpIFNzbnBtIG9uIHRoZSBob3N0Lgo+ID4+Pj4KPiA+Pj4+IFNp
bmNlIHRoZSBndWVzdCBjb25maWd1cmVzIFNtbnBtIHRocm91Z2ggdGhlIFNCSSBGaXJtd2FyZSBG
ZWF0dXJlcwo+ID4+Pj4gaW50ZXJmYWNlLCB0aGUgZXh0ZW5zaW9uIGNhbiBiZSBkaXNhYmxlZCBi
eSBmYWlsaW5nIHRoZSBTQkkgY2FsbC4gU3NucG0KPiA+Pj4+IGNhbm5vdCBiZSBkaXNhYmxlZCB3
aXRob3V0IGludGVyY2VwdGluZyB3cml0ZXMgdG8gdGhlIHNlbnZjZmcgQ1NSLgo+ID4+Pj4KPiA+
Pj4+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUu
Y29tPgo+ID4+Pj4gLS0tCj4gPj4+Pgo+ID4+Pj4gKG5vIGNoYW5nZXMgc2luY2UgdjIpCj4gPj4+
Pgo+ID4+Pj4gQ2hhbmdlcyBpbiB2MjoKPiA+Pj4+ICAtIE5ldyBwYXRjaCBmb3IgdjIKPiA+Pj4+
Cj4gPj4+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oIHwgMiArKwo+ID4+Pj4g
IGFyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgICAgICB8IDMgKysrCj4gPj4+PiAgMiBmaWxl
cyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiA+Pj4+Cj4gPj4+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2t2bS5oCj4gPj4+PiBpbmRleCBlOTdkYjMyOTY0NTYuLjRmMjQyMDEzNzZiMSAxMDA2NDQK
PiA+Pj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAo+ID4+Pj4gKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gPj4+PiBAQCAtMTc1LDYgKzE3
NSw4IEBAIGVudW0gS1ZNX1JJU0NWX0lTQV9FWFRfSUQgewo+ID4+Pj4gICAgICAgICBLVk1fUklT
Q1ZfSVNBX0VYVF9aQ0YsCj4gPj4+PiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pDTU9QLAo+
ID4+Pj4gICAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9aQVdSUywKPiA+Pj4+ICsgICAgICAgS1ZN
X1JJU0NWX0lTQV9FWFRfU01OUE0sCj4gPj4+PiArICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1NT
TlBNLAo+ID4+Pj4gICAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9NQVgsCj4gPj4+PiAgfTsKPiA+
Pj4+Cj4gPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYyBiL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKPiA+Pj4+IGluZGV4IGIzMTljNGMxM2M1NC4uNmY4
MzNlYzIzNDRhIDEwMDY0NAo+ID4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcu
Ywo+ID4+Pj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwo+ID4+Pj4gQEAgLTM0
LDkgKzM0LDExIEBAIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBsb25nIGt2bV9pc2FfZXh0X2Fycltd
ID0gewo+ID4+Pj4gICAgICAgICBbS1ZNX1JJU0NWX0lTQV9FWFRfTV0gPSBSSVNDVl9JU0FfRVhU
X20sCj4gPj4+PiAgICAgICAgIFtLVk1fUklTQ1ZfSVNBX0VYVF9WXSA9IFJJU0NWX0lTQV9FWFRf
diwKPiA+Pj4+ICAgICAgICAgLyogTXVsdGkgbGV0dGVyIGV4dGVuc2lvbnMgKGFscGhhYmV0aWNh
bGx5IHNvcnRlZCkgKi8KPiA+Pj4+ICsgICAgICAgW0tWTV9SSVNDVl9JU0FfRVhUX1NNTlBNXSA9
IFJJU0NWX0lTQV9FWFRfU1NOUE0sCj4gPj4+Cj4gPj4+IFdoeSBub3QgdXNlIEtWTV9JU0FfRVhU
X0FSUigpIG1hY3JvIGhlcmUgPwo+ID4+Cj4gPj4gQmVjYXVzZSB0aGUgZXh0ZW5zaW9uIG5hbWUg
aW4gdGhlIGhvc3QgZG9lcyBub3QgbWF0Y2ggdGhlIGV4dGVuc2lvbiBuYW1lIGluIHRoZQo+ID4+
IGd1ZXN0LiBQb2ludGVyIG1hc2tpbmcgZm9yIEhTIG1vZGUgaXMgcHJvdmlkZWQgYnkgU21ucG0u
IFBvaW50ZXIgbWFza2luZyBmb3IgVlMKPiA+PiBtb2RlIGlzIHByb3ZpZGVkIGJ5IFNzbnBtIGF0
IHRoZSBoYXJkd2FyZSBsZXZlbCwgYnV0IHRoaXMgbmVlZHMgdG8gYXBwZWFyIHRvIHRoZQo+ID4+
IGd1ZXN0IGFzIGlmIFNtbnBtIHdhcyBpbXBsZW1lbnRlZCwgc2luY2UgdGhlIGd1ZXN0IHRoaW5r
cyBpdCBpcyBydW5uaW5nIG9uIGJhcmUKPiA+PiBtZXRhbC4KPiA+Cj4gPiBPa2F5LCBtYWtlcyBz
ZW5zZS4KPiA+Cj4gPj4KPiA+Pj4+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFNNU1RBVEVFTiks
Cj4gPj4+PiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihTU0FJQSksCj4gPj4+PiAgICAgICAgIEtW
TV9JU0FfRVhUX0FSUihTU0NPRlBNRiksCj4gPj4+PiArICAgICAgIEtWTV9JU0FfRVhUX0FSUihT
U05QTSksCj4gPj4+PiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihTU1RDKSwKPiA+Pj4+ICAgICAg
ICAgS1ZNX0lTQV9FWFRfQVJSKFNWSU5WQUwpLAo+ID4+Pj4gICAgICAgICBLVk1fSVNBX0VYVF9B
UlIoU1ZOQVBPVCksCj4gPj4+PiBAQCAtMTI5LDYgKzEzMSw3IEBAIHN0YXRpYyBib29sIGt2bV9y
aXNjdl92Y3B1X2lzYV9kaXNhYmxlX2FsbG93ZWQodW5zaWduZWQgbG9uZyBleHQpCj4gPj4+PiAg
ICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfTToKPiA+Pj4+ICAgICAgICAgLyogVGhlcmUg
aXMgbm90IGFyY2hpdGVjdHVyYWwgY29uZmlnIGJpdCB0byBkaXNhYmxlIHNzY29mcG1mIGNvbXBs
ZXRlbHkgKi8KPiA+Pj4+ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9TU0NPRlBNRjoK
PiA+Pj4+ICsgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9TU05QTToKPiA+Pj4KPiA+Pj4g
V2h5IG5vdCBhZGQgS1ZNX1JJU0NWX0lTQV9FWFRfU01OUE0gaGVyZSA/Cj4gPj4+Cj4gPj4+IERp
c2FibGluZyBTbW5wbSBmcm9tIEtWTSB1c2VyIHNwYWNlIGlzIHZlcnkgZGlmZmVyZW50IGZyb20K
PiA+Pj4gZGlzYWJsaW5nIFNtbnBtIGZyb20gR3Vlc3QgdXNpbmcgU0JJIEZXRlQgZXh0ZW5zaW9u
Lgo+ID4+Cj4gPj4gVW50aWwgYSBzdWNjZXNzZnVsIFNCSSBGV0ZUIGNhbGwgdG8gS1ZNIHRvIGVu
YWJsZSBwb2ludGVyIG1hc2tpbmcgZm9yIFZTIG1vZGUsCj4gPj4gdGhlIGV4aXN0ZW5jZSBvZiBT
bW5wbSBoYXMgbm8gdmlzaWJsZSBlZmZlY3Qgb24gdGhlIGd1ZXN0LiBTbyBmYWlsaW5nIHRoZSBT
QkkKPiA+PiBjYWxsIGlzIHN1ZmZpY2llbnQgdG8gcHJldGVuZCB0aGF0IHRoZSBoYXJkd2FyZSBk
b2VzIG5vdCBzdXBwb3J0IFNtbnBtLgo+ID4+Cj4gPj4+IFRoZSBLVk0gdXNlciBzcGFjZSBzaG91
bGQgYWx3YXlzIGFkZCBTbW5wbSBpbiB0aGUKPiA+Pj4gR3Vlc3QgSVNBIHN0cmluZyB3aGVuZXZl
ciB0aGUgSG9zdCBJU0Egc3RyaW5nIGhhcyBpdC4KPiA+Pgo+ID4+IEkgZGlzYWdyZWUuIEFsbG93
aW5nIHVzZXJzcGFjZSB0byBkaXNhYmxlIGV4dGVuc2lvbnMgaXMgdXNlZnVsIGZvciB0ZXN0aW5n
IGFuZAo+ID4+IHRvIHN1cHBvcnQgbWlncmF0aW9uIHRvIGhvc3RzIHdoaWNoIGRvIG5vdCBzdXBw
b3J0IHRob3NlIGV4dGVuc2lvbnMuIFNvIEkgd291bGQKPiA+PiBvbmx5IGFkZCBleHRlbnNpb25z
IHRvIHRoaXMgbGlzdCBpZiB0aGVyZSBpcyBubyBwb3NzaWJsZSB3YXkgdG8gZGlzYWJsZSB0aGVt
Lgo+ID4KPiA+IEkgYW0gbm90IHNheWluZyB0byBkaXNhbGxvdyBLVk0gdXNlciBzcGFjZSBkaXNh
YmxpbmcgU21ucG0uCj4KPiBUaGVuIEknbSBjb25mdXNlZC4gVGhpcyBpcyB0aGUgInJldHVybiBm
YWxzZTsiIHN3aXRjaCBjYXNlIGluc2lkZQo+IGt2bV9yaXNjdl92Y3B1X2lzYV9kaXNhYmxlX2Fs
bG93ZWQoKS4gSWYgSSBhZGQgS1ZNX1JJU0NWX0lTQV9FWFRfU01OUE0gaGVyZSwKPiB0aGVuICh1
bmxlc3MgSSBhbSBtaXNyZWFkaW5nIHRoZSBjb2RlKSBJIGFtIGRpc2FsbG93aW5nIEtWTSB1c2Vy
c3BhY2UgZnJvbQo+IGRpc2FibGluZyBTbW5wbSBpbiB0aGUgZ3Vlc3QgKGkuZS4gcHJldmVudGlu
ZyBLVk0gdXNlcnNwYWNlIGZyb20gcmVtb3ZpbmcgU21ucG0KPiBmcm9tIHRoZSBndWVzdCBJU0Eg
c3RyaW5nKS4gSWYgdGhhdCBpcyBub3QgZGVzaXJlZCwgdGhlbiB3aHkgZG8geW91IHN1Z2dlc3Qg
SQo+IGFkZCBLVk1fUklTQ1ZfSVNBX0VYVF9TTU5QTSBoZXJlPwoKWWVzLCBhZGRpbmcgS1ZNX1JJ
U0NWX0lTQV9FWFRfU01OUE0gaGVyZSBtZWFucyBLVk0KdXNlciBzcGFjZSBjYW4ndCBkaXNhYmxl
IGl0IHVzaW5nIE9ORV9SRUcgaW50ZXJmYWNlIGJ1dCBLVk0gdXNlcgpzcGFjZSBjYW4gY2VydGFp
bmx5IG5vdCBhZGQgaXQgaW4gdGhlIEd1ZXN0IElTQSBzdHJpbmcuCgo+Cj4gPiBUaGUgcHJlc2Vu
Y2Ugb2YgU21ucG0gaW4gSVNBIG9ubHkgbWVhbnMgdGhhdCBpdCBpcyBwcmVzZW50IGluIEhXCj4g
PiBidXQgaXQgbmVlZHMgdG8gYmUgZXhwbGljaXRseSBjb25maWd1cmVkL2VuYWJsZWQgdXNpbmcg
U0JJIEZXRlQuCj4gPgo+ID4gS1ZNIHVzZXIgc3BhY2UgY2FuIGNlcnRhaW5seSBkaXNhYmxlIGV4
dGVuc2lvbnMgYnkgbm90IGFkZGluZyBpdCB0bwo+ID4gSVNBIHN0cmluZyBiYXNlZCBvbiB0aGUg
S1ZNVE9PTC9RRU1VLUtWTSBjb21tYW5kIGxpbmUgb3B0aW9uLgo+ID4gQWRkaXRpb25hbGx5LCB3
aGVuIFNCSSBGV0ZUIGlzIGFkZGVkIHRvIEtWTSBSSVNDLVYuIEl0IHdpbGwgaGF2ZSBpdHMKPiA+
IG93biB3YXkgdG8gZXhwbGljaXRseSBkaXNhYmxlIGZpcm13YXJlIGZlYXR1cmVzIGZyb20gS1ZN
IHVzZXIgc3BhY2UuCj4KPiBJIHRoaW5rIHdlIGFncmVlIG9uIHRoaXMsIGJ1dCB5b3VyIGV4cGxh
bmF0aW9uIGhlcmUgYXBwZWFycyB0byBjb25mbGljdCB3aXRoCj4geW91ciBzdWdnZXN0ZWQgY29k
ZSBjaGFuZ2UuIEFwb2xvZ2llcyBpZiBJJ20gbWlzc2luZyBzb21ldGhpbmcuCgpJIHRoaW5rIHRo
ZSBjb25mdXNpb24gaXMgYWJvdXQgd2hhdCBkb2VzIGl0IG1lYW4gd2hlbiBTbW5wbSBpcyBwcmVz
ZW50CmluIHRoZSBJU0Egc3RyaW5nLiBXZSBoYXZlIHR3byBhcHByb2FjaGVzOgoKMSkgUHJlc2Vu
Y2Ugb2YgU21ucG0gaW4gSVNBIHN0cmluZyBvbmx5IG1lYW5zIGl0IGlzIHByZXNlbnQgaW4gSFcg
YnV0CiAgICBzYXlzIG5vdGhpbmcgYWJvdXQgaXRzIGVuYWJsZS9kaXNhYmxlIHN0YXRlLiBUbyBj
b25maWd1cmUvZW5hYmxlCiAgICBTbW5wbSwgdGhlIHN1cGVydmlzb3IgbXVzdCB1c2UgU0JJIEZX
RlQuCgoyKSBQcmVzZW5jZSBvZiBTbW5wbSBpbiBJU0Egc3RyaW5nIG1lYW5zIGl0IGlzIHByZXNl
bnQgaW4gSFcgYW5kCiAgICBlbmFibGVkIGF0IGJvb3QtdGltZS4gVG8gcmUtY29uZmlndXJlL2Rp
c2FibGUgU21ucG0sIHRoZSBzdXBlcnZpc29yCiAgICBtdXN0IHVzZSBTQkkgRldGVC4KCkkgYW0g
c3VnZ2VzdGluZyBhcHByb2FjaCAjMSBidXQgSSBhbSBndWVzc2luZyB5b3UgYXJlIGxlYW5pbmcg
dG93YXJkcwphcHByb2FjaCAjMiA/CgpGb3IgYXBwcm9hY2ggIzIsIGFkZGl0aW9uYWwgaGVuY2Zn
LlBNTSBjb25maWd1cmF0aW9uIGlzIHJlcXVpcmVkIGluCnRoaXMgcGF0Y2ggYmFzZWQgb24gdGhl
IHN0YXRlIG9mIEtWTV9SSVNDVl9JU0FfRVhUX1NNTlBNLgoKUmVnYXJkcywKQW51cAoKPgo+IFJl
Z2FyZHMsCj4gU2FtdWVsCj4KPiA+Pj4gVGhlIEd1ZXN0IG11c3QgZXhwbGljaXRseSB1c2UgU0JJ
IEZXRlQgdG8gZW5hYmxlCj4gPj4+IFNtbnBtIG9ubHkgYWZ0ZXIgaXQgc2VlcyBTbW5wbSBpbiBJ
U0Egc3RyaW5nLgo+ID4+Cj4gPj4gWWVzLCBleGFjdGx5LCBhbmQgdGhlIHB1cnBvc2Ugb2Ygbm90
IGluY2x1ZGluZyBTbW5wbSBpbiB0aGUgc3dpdGNoIGNhc2UgaGVyZSBpcwo+ID4+IHNvIHRoYXQg
S1ZNIHVzZXIgc3BhY2UgY2FuIGNvbnRyb2wgd2hldGhlciBvciBub3QgaXQgYXBwZWFycyBpbiB0
aGUgSVNBIHN0cmluZy4KPiA+Pgo+ID4+IFJlZ2FyZHMsCj4gPj4gU2FtdWVsCj4gPj4KPiA+Pj4+
ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9TU1RDOgo+ID4+Pj4gICAgICAgICBjYXNl
IEtWTV9SSVNDVl9JU0FfRVhUX1NWSU5WQUw6Cj4gPj4+PiAgICAgICAgIGNhc2UgS1ZNX1JJU0NW
X0lTQV9FWFRfU1ZOQVBPVDoKPiA+Pj4+IC0tCj4gPj4+PiAyLjQ1LjEKPiA+Pj4+Cj4gPj4+Pgo+
ID4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+
Pj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4+Pj4gbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+ID4+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo+ID4+Pgo+ID4+PiBSZWdhcmRzLAo+ID4+PiBBbnVwCj4gPj4KPiA+
Cj4gPiBSZWdhcmRzLAo+ID4gQW51cAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
