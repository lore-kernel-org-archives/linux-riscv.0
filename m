Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB2CC2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 10:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eo4qfgANCxM0Q49XU8A1hgMVPaSoEqQgoMMM/e51L1I=; b=aBIVz9KaCXsYbA
	vz+0R5J419uYSZGyLfCA/K4TlNufEGSUUd52ldhtxz2SOhulvxpBPKk3bF2LR7m93TqSaoTE8eLLM
	uTb8SOXUYxLqZ+YRLLX6E+VyFIrTetCs0M8AiNDZ+qFjY76NEGhBStoDpWjn8DYDY5nSi32Es7Y3d
	V8lHSwi1MRCaK6GcE9LaHFwbO3gs0puLiLYrrgbe8fE+vRO+wl+sgiImN7ZVmXT2WkHvjyjosiaBj
	tNsOuG0G39LK0Mbeh9/GUYmie0a20HTO29n/9grTay+M0w0nRJRqvoQqpApPhlafdcsbH96MpCv1N
	ckIxC9FgrsmWZjGPLh/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM3F4-00000002NDQ-25Eq;
	Tue, 25 Jun 2024 10:17:38 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM3F1-00000002NBn-14JZ
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 10:17:36 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-57d1782679fso6315320a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 03:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719310649; x=1719915449; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDqEDuqIncS3i916UUmtAInZv3cnZ3dEG8y4UiZ8Edc=;
        b=KWb/Fn+s9ikvMKbjvyRnBpN/Gdygue5ZvN3IFmrGKtxQnh5Eo9ypZKFjWaeb2Il4Td
         xM4ROu3DjQBaGLq437PMUPicuGnedg8nGc+XwpPsmLlGiKHIV1yGYWgGHnJIO84ASOlz
         567MKKucQ2Vzu8+e0Gr25G30GV944ogPOlBpDiaDzO/pikMrMNrDqgntXf7+Et7gPRGl
         QgFqVelYKjyQ1qYP93omuHnP3tM7HskrOVWojkjLwTff/pbK0cvBrOrqE9sReMfInBD9
         XMyfROxS7qAWMbcslSbRH64AuWannCwUioykvKy7Glq72Qr4J/xGq/1oSdKZg43Hk3px
         N+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719310649; x=1719915449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDqEDuqIncS3i916UUmtAInZv3cnZ3dEG8y4UiZ8Edc=;
        b=CYKabFCLR5EFBSFOMiCQduLBTmESZCwb8Xov9KQgKMJlO/rQM0Uj1SZW2Re2Pi6ae+
         mKI2G1PLNXST4wB1eKN24NR4PKhGQFW++7AIqXQqh6N/nm4pudzR4EcOpsZmHdoTewnq
         5T9jBwhrde5p7vXALumEtK6mG+ZMJ1FbSPN9z3iXdL4IB82Q/H3ovtmcgJ3dhwCb65VV
         uVBCGtbIVDbyIove8gh98KxPxZb4hmigInc6HBdobR4VItgAAD2snFHyY1qZk50k70BI
         jWziNTgINYOEnpr8wFv//mF4QfMk5blqiNMH8UGQPxX+fkRpciFMxzMLv7vt4NkjGSE+
         Ldjw==
X-Forwarded-Encrypted: i=1; AJvYcCWK4W2bas1tpyViyaOeLsNPbNT+4pKFvxbftaZbhhGc7O4s1gAYklPY7b8k/V1Bfg05Ez355pTvk2GXp9SMpWgeaJXphTzQuyKvO6DLYTfz
X-Gm-Message-State: AOJu0Yz7RttGrMqi95N+0UMZ+F7qh0h3+tKBvKPulFaZwXDfdgmK9xAR
	RBbTvMArbvXRdEKni756MbK6ELEUzSZImeVED0yT/SD4oRO9/+hS/BTaZ15IvGy7YNrP2/UAiP2
	9zXEFnF5sGSfzEZDguuhazCDTYcIMHXWCuN/guA==
X-Google-Smtp-Source: AGHT+IHnz+jiST2ObwGwpRhNGzS4fV2cd2JpTXgrhQgW5flC1P8gqI9c+i+tCJ6lqjrnPn65ZSzmomPtcHF6WLtuRP0=
X-Received: by 2002:a50:c054:0:b0:57d:669:cafb with SMTP id
 4fb4d7f45d1cf-57d70075c73mr1867346a12.40.1719310648918; Tue, 25 Jun 2024
 03:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240605-atrium-neuron-c2512b34d3da@spud> <CAK9=C2XH7-RdVpojX8GNW-WFTyChW=sTOWs8_kHgsjiFYwzg+g@mail.gmail.com>
 <40a7d568-3855-48fb-a73c-339e1790f12f@ghiti.fr> <20240621-viewless-mural-f5992a247992@wendy>
 <edcd3957-0720-4ab4-bdda-58752304a53a@ghiti.fr> <20240621-9bf9365533a2f8f97cbf1f5e@orel>
 <20240621-glutton-platonic-2ec41021b81b@spud> <20240621-a56e848050ebbf1f7394e51f@orel>
 <20240621-surging-flounder-58a653747e1d@spud> <20240621-8422c24612ae40600f349f7c@orel>
 <20240622-stride-unworn-6e3270a326e5@spud>
In-Reply-To: <20240622-stride-unworn-6e3270a326e5@spud>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 25 Jun 2024 18:17:16 +0800
Message-ID: <CAMWQL2hDUp4+5W4nOM0R5J-uZtkm9hUTwD0BxPBFuzR7eMpHjQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
To: Conor Dooley <conor@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Conor Dooley <conor.dooley@microchip.com>, Anup Patel <apatel@ventanamicro.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_031735_330117_12E217EF 
X-CRM114-Status: GOOD (  38.59  )
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

SGkgQ29ub3IsCgpPbiBTYXQsIEp1biAyMiwgMjAyNCBhdCA4OjAx4oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVuIDIxLCAyMDI0IGF0IDA1
OjA4OjAxUE0gKzAyMDAsIEFuZHJldyBKb25lcyB3cm90ZToKPiA+IE9uIEZyaSwgSnVuIDIxLCAy
MDI0IGF0IDAzOjU4OjE4UE0gR01ULCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiA+IE9uIEZyaSwg
SnVuIDIxLCAyMDI0IGF0IDA0OjUyOjA5UE0gKzAyMDAsIEFuZHJldyBKb25lcyB3cm90ZToKPiA+
ID4gPiBPbiBGcmksIEp1biAyMSwgMjAyNCBhdCAwMzowNDo0N1BNIEdNVCwgQ29ub3IgRG9vbGV5
IHdyb3RlOgo+ID4gPiA+ID4gT24gRnJpLCBKdW4gMjEsIDIwMjQgYXQgMDM6MTU6MTBQTSArMDIw
MCwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+ID4gPiA+ID4gPiBPbiBGcmksIEp1biAyMSwgMjAyNCBh
dCAwMjo0MjoxNVBNIEdNVCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gPgo+ID4gPiA+ID4g
PiBJIHVuZGVyc3RhbmQgdGhlIGNvbmNlcm47IG9sZCBTQkkgaW1wbGVtZW50YXRpb25zIHdpbGwg
bGVhdmUgc3ZhZHUgaW4gdGhlCj4gPiA+ID4gPiA+IERUIGJ1dCBub3QgYWN0dWFsbHkgZW5hYmxl
IGl0LiBUaGVuLCBzaW5jZSBzdmFkZSBtYXkgbm90IGJlIGluIHRoZSBEVCBpZgo+ID4gPiA+ID4g
PiB0aGUgcGxhdGZvcm0gZG9lc24ndCBzdXBwb3J0IGl0IG9yIGl0IHdhcyBsZWZ0IG91dCBvbiBw
dXJwb3NlLCBMaW51eCB3aWxsCj4gPiA+ID4gPiA+IG9ubHkgc2VlIHN2YWR1IGFuZCBnZXQgdW5l
eHBlY3RlZCBleGNlcHRpb25zLiBUaGlzIGlzIHNvbWV0aGluZyB3ZSBjb3VsZAo+ID4gPiA+ID4g
PiBmb3JjZSBlYXNpbHkgd2l0aCBRRU1VIGFuZCBhbiBTQkkgaW1wbGVtZW50YXRpb24gd2hpY2gg
ZG9lc24ndCBkbyBhbnl0aGluZwo+ID4gPiA+ID4gPiBmb3Igc3ZhZHUuIEkgaG9wZSB2ZW5kb3Jz
IG9mIHJlYWwgcGxhdGZvcm1zLCB3aGljaCB0eXBpY2FsbHkgcHJvdmlkZSB0aGVpcgo+ID4gPiA+
ID4gPiBvd24gZmlybXdhcmUgYW5kIERUcywgd291bGQgZ2V0IHRoaXMgcmlnaHQsIHRob3VnaCwg
ZXNwZWNpYWxseSBzaW5jZSBMaW51eAo+ID4gPiA+ID4gPiBzaG91bGQgZmFpbCBmYXN0IGluIHRo
ZWlyIHRlc3Rpbmcgd2hlbiB0aGV5IGdldCBpdCB3cm9uZy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJ
J2xsIGFkbWl0LCBJIHdhc24ndCByZWFsbHkgdGhpbmtpbmcgaGVyZSBhYm91dCBzb21ldGhpbmcg
bGlrZSBRRU1VIHRoYXQKPiA+ID4gPiA+IHB1dHMgZXh0ZW5zaW9ucyBpbnRvIHRoZSBkdGIgYmVm
b3JlIHRoZWlyIGV4YWN0IG1lYW5pbmdzIGFyZSBkZWNpZGVkCj4gPiA+ID4gPiB1cG9uLiBJIGFs
bW9zdCBvbmx5IGV2ZXIgdGhpbmsgYWJvdXQgInJlYWwiIHN5c3RlbXMsIGFuZCBpbiB0aG9zZSBj
YXNlcwo+ID4gPiA+ID4gSSB3b3VsZCBleHBlY3QgdGhhdCBpZiB5b3UgY2FuIHVwZGF0ZSB0aGUg
cmVwcmVzZW50YXRpb24gb2YgdGhlIGhhcmR3YXJlCj4gPiA+ID4gPiBwcm92aWRlZCB0byAob3Ig
YnkgdGhlIGZpcm13YXJlIHRvIExpbnV4KSB3aXRoIG5ldyBwcm9wZXJ0aWVzLCB0aGVuIHVwZGF0
aW5nCj4gPiA+ID4gPiB0aGUgZmlybXdhcmUgaXRzZWxmIHNob3VsZCBiZSBwb3NzaWJsZS4KPiA+
ID4gPiA+Cj4gPiA+ID4gPiBEb2VzIFFFTVUgaGF2ZSB0aGUgdGhpcyBleGFjdCBwcm9ibGVtIGF0
IHRoZSBtb21lbnQ/IEkga25vdyBpdCBwdXRzCj4gPiA+ID4gPiBTdmFkdSBpbiB0aGUgbWF4IGNw
dSwgYnV0IGRvZXMgaXQgZW5hYmxlIHRoZSBiZWhhdmlvdXIgYnkgZGVmYXVsdCwgZXZlbgo+ID4g
PiA+ID4gd2l0aG91dCB0aGUgU0JJIGltcGxlbWVudGF0aW9uIGFza2luZyBmb3IgaXQ/Cj4gPiA+
ID4KPiA+ID4gPiBZZXMsIGJlY2F1c2UgUUVNVSBoYXMgZG9uZSBoYXJkd2FyZSBBL0QgdXBkYXRp
bmcgc2luY2UgaXQgZmlyc3Qgc3RhcnRlZAo+ID4gPiA+IHN1cHBvcnRpbmcgcmlzY3YsIHdoaWNo
IG1lYW5zIGl0IGRpZCBzdmFkdSB3aGVuIG5laXRoZXIgc3ZhZHUgbm9yIHN2YWRlCj4gPiA+ID4g
d2VyZSBpbiB0aGUgRFQuIFRoZSAiZml4IiBmb3IgdGhhdCB3YXMgdG8gZW5zdXJlIHdlIGhhdmUg
c3ZhZHUgYW5kICFzdmFkZQo+ID4gPiA+IGJ5IGRlZmF1bHQsIHdoaWNoIG1lYW5zIHdlJ3ZlIHBl
cmZlY3RseSByZWFsaXplZCBBbGV4YW5kcmUncyBjb25jZXJuLi4uCj4gPiA+ID4gV2Ugc2hvdWxk
IGJlIGFibGUgdG8gY2hhbmdlIHRoZSBuYW1lZCBjcHUgdHlwZXMgdGhhdCBkb24ndCBzdXBwb3J0
IHN2YWR1Cj4gPiA+ID4gdG8gb25seSBoYXZlIHN2YWRlIGluIHRoZWlyIERUcywgc2luY2UgdGhh
dCB3b3VsZCBhY3R1YWxseSBiZSBmaXhpbmcgdGhvc2UKPiA+ID4gPiBjcHUgdHlwZXMsIGJ1dCB3
ZSdsbCBuZWVkIHRvIGRpc2N1c3MgaG93IHRvIHByb2NlZWQgd2l0aCB0aGUgZ2VuZXJpYyBjcHUK
PiA+ID4gPiB0eXBlcyBsaWtlICdtYXgnLgo+ID4gPgo+ID4gPiBDb3JyZWN0IG1lIHBsZWFzZSwg
c2luY2UgSSB0aGluayBJIGFtIG1pc3VuZGVyc3RhbmRpbmc6IEF0IHRoZSBtb21lbnQKPiA+ID4g
UUVNVSBkb2VzIEEvRCB1cGRhdGluZyB3aGV0aGVyIG9yIG5vdCB0aGUgU0JJIGltcGxhbnRhdGlv
biBhc2tzIGZvciBpdCwKPiA+ID4gd2l0aCB0aGUgbWF4IENQVS4gVGhlIFNCSSBpbXBsZW1lbnRh
dGlvbiBkb2Vzbid0IHVuZGVyc3RhbmQgU3ZhZHUgYW5kCj4gPiA+IHdvbid0IHN0cmlwIGl0LiBU
aGUga2VybmVsIHdpbGwgZ2V0IGEgRFQgd2l0aCBTdmFkdSBpbiBpdCwgYnV0IFN2YWR1IHdpbGwK
PiA+ID4gYmUgZW5hYmxlZCwgc28gaXQgaXMgbm90IGEgcHJvYmxlbS4KPiA+Cj4gPiBPaCwgb2Yg
Y291cnNlIHlvdSdyZSByaWdodCEgSSBtYW5hZ2VkIHRvIHJldmVyc2UgdGhpbmdzIHNvbWUgb2Rk
IG51bWJlciBvZgo+ID4gdGltZXMgKG1vcmUgdGhhbiBvbmNlISkgaW4gbXkgaGVhZCBhbmQgZW5k
ZWQgdXAgYmFja3dhcmRzLi4uCj4KPiBJIG1lYW4sIEkndmUgYmVlbiByZWFsbHkgY29uZnVzZWQg
YWJvdXQgdGhpcyB3aG9sZSB0aGluZyB0aGUgZW50aXJlCj4gdGltZSwgc28geWUuLgo+Cj4gU3Bl
YWtpbmcgb2YgUUVNVSwgd2hhdCBoYXBwZW5zIGlmIEkgdHJ5IHRvIHR1cm4gb24gc3ZhZGUgYW5k
IHN2YWR1IGluCj4gUUVNVT8gSXQgbG9va3MgbGlrZSB0aGVyZSdzIHNvbWUgaGFuZGxpbmcgb2Yg
aXQgdGhhdCBkb2VzIHRoaW5ncwo+IGNvbmRpdGlvbmFsbHkgYmFzZWQgIXN2YWRlICYmIHN2YWRl
LCBidXQgSSBjb3VsZG4ndCB0ZWxsIGlmIGl0IHdvdWxkIGRvCj4gd2hhdCB3ZSBhcmUgZGVzY3Jp
YmluZyBpbiB0aGlzIHRocmVhZC4KCldoZW4gYm90aCBTdmFkdSBhbmQgU3ZhZGUgYXJlIHNwZWNp
ZmllZCBpbiBRRU1VLCB0aGUgcmVzZXQgdmFsdWUgb2YKbWVudmNmZy5BRFVFIGlzIDA6CgplbnYt
Pm1lbnZjZmcgPSAoY3B1LT5jZmcuZXh0X3N2cGJtdCA/IE1FTlZDRkdfUEJNVEUgOiAwKSB8CiAg
ICAgICAgICAgICAgICAoIWNwdS0+Y2ZnLmV4dF9zdmFkZSAmJiBjcHUtPmNmZy5leHRfc3ZhZHUg
PwogICAgICAgICAgICAgICAgTUVOVkNGR19BRFVFIDogMCk7CgpUaGUgcnVudGltZSBiZWhhdmlv
ciBkZXBlbmRzIG9uIG1lbnZjZmcuQURVRToKCiAgICBib29sIHN2YWRlID0gcmlzY3ZfY3B1X2Nm
ZyhlbnYpLT5leHRfc3ZhZGU7CiAgICBib29sIHN2YWR1ID0gcmlzY3ZfY3B1X2NmZyhlbnYpLT5l
eHRfc3ZhZHU7CiAgICBib29sIGFkdWUgPSBzdmFkdSA/IGVudi0+bWVudmNmZyAmIE1FTlZDRkdf
QURVRSA6ICFzdmFkZTsKClJlZ2FyZGxlc3Mgb2Ygd2hldGhlciBPcGVuU0JJIHN1cHBvcnRzIHRo
ZSBTdmFkdSBlbmFibGVtZW50LApTdXBlcnZpc29yIGNhbiBhc3N1bWUgdGhhdCBRRU1VIHVzZXMg
U3ZhZGUgd2hlbiBpdCBkb2Vzbid0CmV4cGxpY2l0bHkgdHVybiBvbiBTdmFkdS4KClJlZ2FyZHMs
CllvbmctWHVhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
