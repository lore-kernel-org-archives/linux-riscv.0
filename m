Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7ADC54E90
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 15:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XLi/FllZgFUhhF2PNkwT92ftTPUMrtoAPh8je4PFypc=; b=4xgForfSZglNQB
	Zrnh1hoH2jw94WO5Jk4M1ocuE43Os43zSOrhLEgYTBMIKTOBFclv+sVRfOioYw/drfWKFBhQ5H3iK
	3w5oIL186kUNT308O8ar8Vk+T63X8D7rorUeHats7SbrGiwyZpbxLpFwqpvLLqSI6K8cAENHpbce4
	kmX12qjGAE61vTwAUuQrrCxOv7cTW4+HFi+VI0xOyhh/VqNtwi8/NPumlYjsbTBisVBb0XYP8ahDn
	ozG3XPy3Ogy8XYDJnYc2krcTY23/RDcs0oZDpxQb1VjdCEMsr+pCbl9pDjL/nM4b87H0KSpTkFlT6
	qSKIP8mOVfp1GR5YOzkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI81Q-00000001SvE-2oJ0;
	Thu, 22 May 2025 15:39:52 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7aE-00000001Okx-45Rb
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 15:11:49 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4811fca8658so93146841cf.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 08:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747926705; x=1748531505; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkuVu6TLTcH1UO6MtsNK3yTXBjsaezcw9faGJub9wRA=;
        b=JbJPDUUc0E+fqXeXzK8AMKwtELD1qFYlrAsMXYYPFxPGsWInk0WTAddGHnvtIm7KOg
         dYrvh6Fp70En/Cybn7pwNJct4UgCzOHQKuy/F8H6LAapHn9iZoAFzP5eH3Sc+Ddy2iV3
         /NgGZZsVbKD2qpOFAtxHarzXvgYQoIAhNW+UEXOx2CJ5QOyAGRmxkdjifI8uGa+FE+ES
         rD8r1nqEoZWZnUQSySimKiaJgOjjbu8Coi+A640ecv/tZcbUwbl5I4wGjfMvm36QguZJ
         4GH6vGrUt0hNPb3Y7woyAoKZsjYEgP81JOXVktUKNjkQjNU7VZNrYyMNoO38abU5JJ80
         uYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926705; x=1748531505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QkuVu6TLTcH1UO6MtsNK3yTXBjsaezcw9faGJub9wRA=;
        b=jdhHrSMzMbR40mH1qTq20ppyvhxEuJjKv+howF98NNJe7a03K7DT0/CDXqaR2DKaJF
         KIMDvnZ44TPZ6ceAtOJFg3n7gyZ2o9BN9/eJapxmgBlm5/nd7JanUOHbEl0miuWlL/hv
         duo791N07Y8FJGVPo5dp7hWVFTfLXLilmSr0IAwEFubckqY+ozv2Lm6M2Tvsozh+hBWz
         RCFzCMuk5fWrNeUlCW3NXy3oqFcEaH/Ywix102mhQ6oZR8ZVLc1aqi2kYWE2/gZrzhe3
         TDq7Fz/j6edAdW0IHaJAxGWjslSVnqE1Q+8CS13NX4CWzX7/ei0Lmb2MSvDe1MSdnMmP
         KNeQ==
X-Gm-Message-State: AOJu0YxUR6wphcq9PhPHvbr6cFVYgWSWbzTD+17iBKTQPrOtS11Hvr5X
	S824yDHF5vTCVsEKlLxtOj6DaJN123zoCSdpHKLZursD+CLYR+pY1SC22LNl3zMDegvz+Uv0RtX
	VQtzM6n98J4DebbCxhQTtGgiu2tWwcHKGOI3zTuJd0qYH1i5j++K3wYy/2Q==
X-Gm-Gg: ASbGncvzNKc0ZXqfxAzeSGYwPqYaE/31bNYQ0S+Lr2/C3WdtG+h8Qew6rm/WNstDT2o
	ImgQpvzgJgj1W1Lv0BJZ9KQvj60AhlKd0rJ59uom7Th1lfSbtu9oQ1B5P7IMN/PieagoajV7FEQ
	t02q8AEy2h481ylvAMxW7ihVM9ycTk/mTxbg==
X-Google-Smtp-Source: AGHT+IFK4Yt+2cgSXArAeoi1XDZ64HrD1KARb24Tr3q9Foi+yx0/cRfeLxf+ZZaw0XgkdGlmSGMsnojlGKBoJ8/RNnQ=
X-Received: by 2002:a05:622a:424d:b0:494:784a:ee41 with SMTP id
 d75a77b69052e-494ae445618mr415065331cf.42.1747926705384; Thu, 22 May 2025
 08:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240702102637.9074-1-mchitale@ventanamicro.com>
 <mhng-38c26ef6-8d45-4dd1-9c3a-f71f34f1ef81@palmer-ri-x1c9>
 <CAN37VV6DMpsRWnH-1tN2AfT8HXbEFh2We4Yw0XYkuCNvF75o4w@mail.gmail.com> <8faad7be-d7a5-4f71-b020-960ea443f751@ghiti.fr>
In-Reply-To: <8faad7be-d7a5-4f71-b020-960ea443f751@ghiti.fr>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Thu, 22 May 2025 20:41:09 +0530
X-Gm-Features: AX0GCFuj4FI4Iq8tzF2Vm8xgvRmc5GtroFmXxMR9iejG5iUtnCgIPoQ5G81Q79o
Message-ID: <CAN37VV4ohoi48BAM1-OTdSGe9yD=2Eh84pKsHLsWQSaRadJ7tw@mail.gmail.com>
Subject: Re: [PATCH v8] riscv: mm: Add support for Svinval extension
To: Alexandre Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, 
	samuel.holland@sifive.com, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_081147_015183_94F175EE 
X-CRM114-Status: GOOD (  35.12  )
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

SGkgQWxleCwKCk9uIFR1ZSwgTWF5IDIwLCAyMDI1IGF0IDEwOjI14oCvUE0gQWxleGFuZHJlIEdo
aXRpIDxhbGV4QGdoaXRpLmZyPiB3cm90ZToKPgo+IEhpIE1heXVyZXNoIQo+Cj4gT24gNy8zMC8y
NCAxMDo0MywgTWF5dXJlc2ggQ2hpdGFsZSB3cm90ZToKPiA+IE9uIFdlZCwgSnVsIDI0LCAyMDI0
IGF0IDg6MjDigK9QTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPiB3cm90ZToK
PiA+PiBPbiBUdWUsIDAyIEp1bCAyMDI0IDAzOjI2OjM3IFBEVCAoLTA3MDApLCBtY2hpdGFsZUB2
ZW50YW5hbWljcm8uY29tIHdyb3RlOgo+ID4+PiBUaGUgU3ZpbnZhbCBleHRlbnNpb24gc3BsaXRz
IFNGRU5DRS5WTUEgaW5zdHJ1Y3Rpb24gaW50byBmaW5lci1ncmFpbmVkCj4gPj4+IGludmFsaWRh
dGlvbiBhbmQgb3JkZXJpbmcgb3BlcmF0aW9ucyBhbmQgaXMgbWFuZGF0b3J5IGZvciBSVkEyM1M2
NCBwcm9maWxlLgo+ID4+PiBXaGVuIFN2aW52YWwgaXMgZW5hYmxlZCB0aGUgbG9jYWxfZmx1c2hf
dGxiX3JhbmdlX3RocmVzaG9sZF9hc2lkIGZ1bmN0aW9uCj4gPj4+IHNob3VsZCB1c2UgdGhlIGZv
bGxvd2luZyBzZXF1ZW5jZSB0byBvcHRpbWl6ZSB0aGUgdGxiIGZsdXNoZXMgaW5zdGVhZCBvZgo+
ID4+IERvIHlvdSBoYXZlIGFueSBwZXJmb3JtYW5jZSBudW1iZXJzIGZvciB0aGUgb3B0aW1pemF0
aW9uPyAgQXMgcGVyIGhlcmUKPiA+PiA8aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL21obmct
Zjc5OWJkMmItN2YyMi00YzAzLWJkYjItOTAzZmEzYjVkNTA4QHBhbG1lci1yaS14MWM5YS8+Lgo+
ID4gTm8sIGN1cnJlbnRseSB0aGVyZSBhcmUgbm8gbnVtYmVycyBhdmFpbGFibGUgZm9yIGNvbXBh
cmlzb24gYnV0IHRoZQo+ID4gcmF0aW9uYWxlIGZvciB0aGUgb3B0aW1pemF0aW9uIGlzIGRlc2Ny
aWJlZCBpbiB0aGUgc3BlYy4gVGhlIGV4dGVuc2lvbgo+ID4gaXMgbWFuZGF0b3J5IGZvciB0aGUg
UlZBMjNTNjQgcHJvZmlsZSBidXQgYW55IHBsYXRmb3JtIHRoYXQgZG9lc24ndAo+ID4gc3VwcG9y
dCB0aGlzIGV4dGVuc2lvbiB3aWxsIG5vdCBiZSBpbXBhY3RlZCBhcyB0aGUgY29kZSBleGVjdXRl
cyBvbmx5Cj4gPiBpZiB0aGUgc3ZpbnZhbCBleHRlbnNpb24gaXMgZW5hYmxlZCBhdCB0aGUgYm9v
dCB1cC4KPgo+Cj4gU28gSSBmaW5hbGx5IGhhdmUgc29tZSBudW1iZXJzISBJIHRlc3RlZCB0aGlz
IHBhdGNoc2V0IG9uIHRoZSBCYW5hbmFQaToKPiBJIG1lYXN1cmVkIHRoZSBudW1iZXIgb2YgY3lj
bGVzIHdoZW4gZmx1c2hpbmcgNjQgZW50cmllcyAod2hpY2ggaXMgb3VyCj4gY3VycmVudCB0aHJl
c2hvbGQpIGFuZCBJIG1hZGUgc3VyZSB0byB0b3VjaCB0aGUgZW50cmllcyBiZWZvcmVoYW5kLgo+
Cj4gSGVyZSB0aGV5IGFyZToKPgo+ICogc3ZpbnZhbDoKPgo+ICNjeWNsZXM6IDM2NDkyMAo+ICNj
eWNsZXM6IDM2NTg1Ngo+ICNjeWNsZXM6IDM2Nzk5Mwo+Cj4gKiAhc3ZpbnZhbDoKPgo+ICNjeWNs
ZXM6IDY2MzU4NQo+ICNjeWNsZXM6IDY2MzEwNQo+ICNjeWNsZXM6IDY2NDA3Mwo+CgpUaGF0J3Mg
YXdlc29tZSAhISBUaGFuayB5b3Ugc28gbXVjaCBmb3IgZ2V0dGluZyB0aGUgZGF0YS4KCj4gU28g
dGhhdCdzIHJvdWdobHkgLzIgdXNpbmcgc3ZpbnZhbC4gVG8gbWUgdGhhdCdzIGdvb2QgZW5vdWdo
IHRvIG1lcmdlCj4gdGhhdCBmb3IgNi4xNiA6KQo+Cj4gU29ycnkgZm9yIHRoZSB2ZXJ5IHZlcnkg
bG9uZyBkZWxheSBhbmQgdGhhbmtzIGFnYWluIGZvciB0aGUgbXVsdGlwbGUKPiByZXZpc2lvbnMh
Cj4KPiBBbGV4Cj4KPgo+ID4+PiBhIHNpbXBsZSBzZmVuY2Uudm1hOgo+ID4+Pgo+ID4+PiBzZmVu
Y2Uudy5pbnZhbAo+ID4+PiBzdmludmFsLnZtYQo+ID4+PiAgICAuCj4gPj4+ICAgIC4KPiA+Pj4g
c3ZpbnZhbC52bWEKPiA+Pj4gc2ZlbmNlLmludmFsLmlyCj4gPj4+Cj4gPj4+IFRoZSBtYXhpbXVt
IG51bWJlciBvZiBjb25zZWN1dGl2ZSBzdmludmFsLnZtYSBpbnN0cnVjdGlvbnMgdGhhdAo+ID4+
PiBjYW4gYmUgZXhlY3V0ZWQgaW4gbG9jYWxfZmx1c2hfdGxiX3JhbmdlX3RocmVzaG9sZF9hc2lk
IGZ1bmN0aW9uCj4gPj4+IGlzIGxpbWl0ZWQgdG8gNjQuIFRoaXMgaXMgcmVxdWlyZWQgdG8gYXZv
aWQgc29mdCBsb2NrdXBzIGFuZCB0aGUKPiA+Pj4gYXBwcm9hY2ggaXMgc2ltaWxhciB0byB0aGF0
IHVzZWQgaW4gYXJtNjQuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IE1heXVyZXNoIENoaXRh
bGUgPG1jaGl0YWxlQHZlbnRhbmFtaWNyby5jb20+Cj4gPj4+IFJldmlld2VkLWJ5OiBBbmRyZXcg
Sm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4+PiAtLS0KPiA+Pj4gQ2hhbmdlcyBp
biB2ODoKPiA+Pj4gLSBGaXggbGluZSB3cmFwCj4gPj4+IC0gQWRkIFJCIHRhZwo+ID4+Pgo+ID4+
PiBDaGFuZ2VzIGluIHY3Ogo+ID4+PiAtIFVzZSBleGlzdGluZyBzdmludmFsIG1hY3JvcyBpbiB0
aGUgaW5zbi1kZWYuaAo+ID4+PiAtIFJlbmFtZSBsb2NhbF9zaW52YWxfdm1hX2FzaWQgdG8gbG9j
YWxfc2ludmFsX3ZtYQo+ID4+Pgo+ID4+PiBDaGFuZ2VzIGluIHY2Ogo+ID4+PiAtIFJlYmFzZSBv
biBsYXRlc3QgdG9ydmFsZHMvbWFzdGVyCj4gPj4+Cj4gPj4+IENoYW5nZXMgaW4gdjU6Cj4gPj4+
IC0gUmVkdWNlIHRsYiBmbHVzaCB0aHJlc2hvbGQgdG8gNjQKPiA+Pj4gLSBJbXByb3ZlIGltcGxl
bWVudGF0aW9uIG9mIGxvY2FsX2ZsdXNoX3RsYiogZnVuY3Rpb25zCj4gPj4+Cj4gPj4+IENoYW5n
ZXMgaW4gdjQ6Cj4gPj4+IC0gUmViYXNlIGFuZCByZWZhY3RvciBhcyBwZXIgbGF0ZXN0IGNoYW5n
ZXMgb24gdG9ydmFsZHMvbWFzdGVyCj4gPj4+IC0gRHJvcCBwYXRjaCAxIGluIHRoZSBzZXJpZXMK
PiA+Pj4KPiA+Pj4gQ2hhbmdlcyBpbiB2MzoKPiA+Pj4gLSBGaXggaW5jb3JyZWN0IHZtYSB1c2Vk
IGZvciBzaW52YWwgaW5zdHJ1Y3Rpb25zCj4gPj4+IC0gVXNlIHVuaWZpZWQgc3RhdGljIGtleSBt
ZWNoYW5pc20gZm9yIHN2aW52YWwKPiA+Pj4gLSBSZWJhc2VkIG9uIHRvcnZhbGRzL21hc3Rlcgo+
ID4+Pgo+ID4+PiBDaGFuZ2VzIGluIHYyOgo+ID4+PiAtIFJlYmFzZWQgb24gNS4xOC1yYzMKPiA+
Pj4gLSB1cGRhdGUgcmlzY3ZfZmlsbF9od2NhcCB0byBwcm9iZSBTdmludmFsIGV4dGVuc2lvbgo+
ID4+Pgo+ID4+PiAgIGFyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyB8IDMyICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCj4gPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMo
KykKPiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyBiL2Fy
Y2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+ID4+PiBpbmRleCA5YjZlODZjZTM4NjcuLjc4MjE0N2E2
M2YzYiAxMDA2NDQKPiA+Pj4gLS0tIGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gPj4+ICsr
KyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+ID4+PiBAQCAtNiw2ICs2LDI3IEBACj4gPj4+
ICAgI2luY2x1ZGUgPGxpbnV4L2h1Z2V0bGIuaD4KPiA+Pj4gICAjaW5jbHVkZSA8YXNtL3NiaS5o
Pgo+ID4+PiAgICNpbmNsdWRlIDxhc20vbW11X2NvbnRleHQuaD4KPiA+Pj4gKyNpbmNsdWRlIDxh
c20vY3B1ZmVhdHVyZS5oPgo+ID4+PiArCj4gPj4+ICsjZGVmaW5lIGhhc19zdmludmFsKCkgICAg
ICAgIHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoUklTQ1ZfSVNBX0VYVF9TVklOVkFMKQo+
ID4+PiArCj4gPj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgbG9jYWxfc2ZlbmNlX2ludmFsX2lyKHZv
aWQpCj4gPj4+ICt7Cj4gPj4+ICsgICAgIGFzbSB2b2xhdGlsZShTRkVOQ0VfSU5WQUxfSVIoKSA6
OjogIm1lbW9yeSIpOwo+ID4+PiArfQo+ID4+PiArCj4gPj4+ICtzdGF0aWMgaW5saW5lIHZvaWQg
bG9jYWxfc2ZlbmNlX3dfaW52YWwodm9pZCkKPiA+Pj4gK3sKPiA+Pj4gKyAgICAgYXNtIHZvbGF0
aWxlKFNGRU5DRV9XX0lOVkFMKCkgOjo6ICJtZW1vcnkiKTsKPiA+Pj4gK30KPiA+Pj4gKwo+ID4+
PiArc3RhdGljIGlubGluZSB2b2lkIGxvY2FsX3NpbnZhbF92bWEodW5zaWduZWQgbG9uZyB2bWEs
IHVuc2lnbmVkIGxvbmcgYXNpZCkKPiA+Pj4gK3sKPiA+Pj4gKyAgICAgaWYgKGFzaWQgIT0gRkxV
U0hfVExCX05PX0FTSUQpCj4gPj4+ICsgICAgICAgICAgICAgYXNtIHZvbGF0aWxlKFNJTlZBTF9W
TUEoJTAsICUxKSA6IDogInIiICh2bWEpLCAiciIgKGFzaWQpIDogIm1lbW9yeSIpOwo+ID4+PiAr
ICAgICBlbHNlCj4gPj4+ICsgICAgICAgICAgICAgYXNtIHZvbGF0aWxlKFNJTlZBTF9WTUEoJTAs
IHplcm8pIDogOiAiciIgKHZtYSkgOiAibWVtb3J5Iik7Cj4gPj4+ICt9Cj4gPj4+Cj4gPj4+ICAg
LyoKPiA+Pj4gICAgKiBGbHVzaCBlbnRpcmUgVExCIGlmIG51bWJlciBvZiBlbnRyaWVzIHRvIGJl
IGZsdXNoZWQgaXMgZ3JlYXRlcgo+ID4+PiBAQCAtMjYsNiArNDcsMTYgQEAgc3RhdGljIHZvaWQg
bG9jYWxfZmx1c2hfdGxiX3JhbmdlX3RocmVzaG9sZF9hc2lkKHVuc2lnbmVkIGxvbmcgc3RhcnQs
Cj4gPj4+ICAgICAgICAgICAgICAgIHJldHVybjsKPiA+Pj4gICAgICAgIH0KPiA+Pj4KPiA+Pj4g
KyAgICAgaWYgKGhhc19zdmludmFsKCkpIHsKPiA+Pj4gKyAgICAgICAgICAgICBsb2NhbF9zZmVu
Y2Vfd19pbnZhbCgpOwo+ID4+PiArICAgICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBucl9wdGVz
X2luX3JhbmdlOyArK2kpIHsKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGxvY2FsX3NpbnZh
bF92bWEoc3RhcnQsIGFzaWQpOwo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgc3RhcnQgKz0g
c3RyaWRlOwo+ID4+PiArICAgICAgICAgICAgIH0KPiA+Pj4gKyAgICAgICAgICAgICBsb2NhbF9z
ZmVuY2VfaW52YWxfaXIoKTsKPiA+Pj4gKyAgICAgICAgICAgICByZXR1cm47Cj4gPj4+ICsgICAg
IH0KPiA+Pj4gKwo+ID4+PiAgICAgICAgZm9yIChpID0gMDsgaSA8IG5yX3B0ZXNfaW5fcmFuZ2U7
ICsraSkgewo+ID4+PiAgICAgICAgICAgICAgICBsb2NhbF9mbHVzaF90bGJfcGFnZV9hc2lkKHN0
YXJ0LCBhc2lkKTsKPiA+Pj4gICAgICAgICAgICAgICAgc3RhcnQgKz0gc3RyaWRlOwo+ID4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdAo+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4g
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
