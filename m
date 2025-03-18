Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B559CC28B2F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 16:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w7LuWkARLIm8T+qoTNq1HK2K1bQxdznrOBLQ3eNxIcM=; b=RbSdZOdwKipLQG
	XLS1WqgkUjUJIAUixlxDqMPN1VSiJVE+ae5qMmuZ6W1zgMjxM7Dkxh0pYRocRDEVoiAbkztp0MGqu
	HoUyQR8vRLoo7I6YxmllWGA/8jyp7ROsSj/TAM1YHUgDoXzi9Wo6bq65+G9nNCK5740Wdg6Yu3UfF
	EtT8JDz0oTy8Ew1ZgCNgLTULFacu+o1jinyT9fSVrYWaaNvILoG+58e0r5tG1AVbClqBOuhS3b/RP
	CgrfWdqtV8Q3Q2tE9aLUodgu30VZlXFt5KqPzLYBdrwku851a4dVYNDM4EtBNeXFh5CzGA4BApFz/
	2bPnSiCY6g8djQZIF59A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZTW-00000006Stu-0eop;
	Tue, 18 Mar 2025 16:07:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZTT-00000006StV-0ox1
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 16:07:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A9FE05C53AB
	for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 16:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5D3C4CEDD
	for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 16:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742314046;
	bh=VFDJ6R20oErvJ1RvFC7kFeyiipQ7Njgq7oc2ScOfLV4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mf0jiky0HfSYAcke+XzksLCfXMxzRAKwid1cSMKa+/FqAs8b01hZrNy40ci0cbZR3
	 /GctjHeHaejSImKXrwkjZrCBfDK/1/JHyUSXaDFYhx0IrhfRf+cCx5Q7aTOQ2bQFwp
	 8XZF2MW/surd/uwO2j16xI06beN9nhlg+qnwrxkn3kzW7FEqcECyoHDT3SFFTQwZ1y
	 jfxawao9KpOXKb+XQ4/yd40n0e+mnDCbdfPJ6CQvnyWW8KFuZzlhP8Hk9mPn6araIO
	 VYjcBMx4YX5249UItUKUPyT1X4K5LuWMflP34XCADuZwWGMFrlZyAKAe/2chXszqD/
	 CqdGQ4cj5KXvQ==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so10275399a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 09:07:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVpeSL8dHCx0gHeCEiKRIqnE4t+8Or32rKD8GSAKVAaC72U4Mk1q9ImH5WsHVy9W5EQu6dkvdt7DQfIaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzupP+XhYQuRsNw5MpoLWwqaYfyYUBocx8uWtYTAgtDHYQdjL04
	aWFBjIPw4b0lFebLrzk9RTWTLzZkMcVj+EvoIpC9ffbUWYtYeLFVV/WMr5AgMwiRn1wZV3J/svi
	NOHkq9w++Jcdh6x8FJo/zrC+cAw==
X-Google-Smtp-Source: AGHT+IFfnNV/DMQy8HRb/U6rr2KEZqHbalMfe7H6o6yIu+IcvHNe5Tqpi/2irnP5g7ZQWivPIchyuNgNQlRu8Y5ZLIo=
X-Received: by 2002:a05:6402:3514:b0:5e0:8a34:3b5c with SMTP id
 4fb4d7f45d1cf-5eb1ed8f4e4mr4278576a12.0.1742314044717; Tue, 18 Mar 2025
 09:07:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250314081255.3718-1-nick.hu@sifive.com> <20250314232518.GA2513550-robh@kernel.org>
 <CAKddAkCL1qKG7dRaVDAO0HCdsEiRR3NxOEka8aFONvkXnZ5j5A@mail.gmail.com>
In-Reply-To: <CAKddAkCL1qKG7dRaVDAO0HCdsEiRR3NxOEka8aFONvkXnZ5j5A@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 18 Mar 2025 11:07:12 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKQDQKq-WubM5VOBQh8BJ3ts1dNjKPoZofFu5W3zahgaA@mail.gmail.com>
X-Gm-Features: AQ5f1Jq1SluFDnMmpoz3ztYp0O7KwWv2ESVliCn-nl31fii805EQa98fNbHWhOk
Message-ID: <CAL_JsqKQDQKq-WubM5VOBQh8BJ3ts1dNjKPoZofFu5W3zahgaA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: timer: Add SiFive CLINT2
To: Nick Hu <nick.hu@sifive.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_090727_343402_D90D7DD1 
X-CRM114-Status: GOOD (  24.27  )
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

T24gU3VuLCBNYXIgMTYsIDIwMjUgYXQgOTozNuKAr1BNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBIaSBSb2IKClBsZWFzZSBkb24ndCB0b3AgcG9zdC4KCj4gU29ycnks
IEkgdGhvdWdodCBJIGhhZCByZXBsaWVkIHRvIHRoZSBtYWlsaW5nIGxpc3QsIGJ1dCBpdCBsb29r
cyBsaWtlCj4gSSBvbmx5IHNlbnQgaXQgdG8gQ29ub3IuCj4KPiBUaGUgY29udHJvbCBvZiBzaWZp
dmUsY2xpbnQyIGRpZmZlcnMgZnJvbSB0aGF0IG9mIHNpZml2ZSxjbGludDAsCj4gbWFraW5nIHRo
ZW0gaW5jb21wYXRpYmxlLgoKVGhlIGFuc3dlciBiZWxvbmdzIGluIHRoZSBwYXRjaCwgbm90IGp1
c3QgaW4gYSByZXBseS4gQXNzdW1lIHdlJ3ZlCmZvcmdvdHRlbiBldmVyeXRoaW5nIHNhaWQgaW4g
dGhlIHByaW9yIHZlcnNpb24gYmVjYXVzZSB3ZSBsaWtlbHkgaGF2ZSwKc28geW91IGRvbid0IHdh
bnQgdG8gZ2V0IHRoZSBzYW1lIHF1ZXN0aW9ucyBhZ2Fpbi4KCj4KPiBPbiBTYXQsIE1hciAxNSwg
MjAyNSBhdCA3OjI14oCvQU0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4g
Pgo+ID4gT24gRnJpLCBNYXIgMTQsIDIwMjUgYXQgMDQ6MTI6NTRQTSArMDgwMCwgTmljayBIdSB3
cm90ZToKPiA+ID4gQWRkIGNvbXBhdGlibGUgc3RyaW5nIGFuZCBwcm9wZXJ0eSBmb3IgdGhlIFNp
Rml2ZSBDTElOVCB2Mi4KPiA+Cj4gPiBDb25vciBhc2tlZCBhYm91dCBiZWluZyBiYWNrd2FyZHMg
Y29tcGF0aWJsZSB3aXRoIHYxLiBQbGVhc2Ugc2F5IHdoeSBpdAo+ID4gaXNuJ3QgaGVyZS4KPiA+
Cj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4K
PiA+ID4gUmV2aWV3ZWQtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUu
Y29tPgo+ID4gPiAtLS0KPiA+ID4gLSB2MiBjaGFuZ2VzOgo+ID4gPiAgIC0gRG9uJ3QgYWxsb3cg
c2lmaXZlLGNsaW50MiBieSBpdHNlbGYuIEFkZCAnLXt9JyB0byB0aGUgZmlyc3QgZW50cnkKPiA+
ID4gICAtIE1hcmsgdGhlIHNpZml2ZSxmaW5lLWN0ci1iaXRzIGFzIHRoZSByZXF1aXJlZCBwcm9w
ZXJ0eSB3aGVuCj4gPiA+ICAgICB0aGUgY29tcGF0aWJsZSBpbmNsdWRlcyB0aGUgc2lmaXZlLGNs
aW50Mgo+ID4gPgo+ID4gPiAgLi4uL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1sICAg
ICAgICAgIHwgMjAgKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIw
IGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFtbAo+ID4gPiBpbmRleCA3
NmQ4M2FlYTRlMmIuLjRiOWRhZDExYzFlOSAxMDA2NDQKPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1sCj4gPiA+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFt
bAo+ID4gPiBAQCAtMzYsNiArMzYsMTAgQEAgcHJvcGVydGllczoKPiA+ID4gICAgICAgICAgICAg
ICAgLSBzdGFyZml2ZSxqaDcxMTAtY2xpbnQgICAjIFN0YXJGaXZlIEpINzExMAo+ID4gPiAgICAg
ICAgICAgICAgICAtIHN0YXJmaXZlLGpoODEwMC1jbGludCAgICMgU3RhckZpdmUgSkg4MTAwCj4g
PiA+ICAgICAgICAgICAgLSBjb25zdDogc2lmaXZlLGNsaW50MCAgICAgICAgIyBTaUZpdmUgQ0xJ
TlQgdjAgSVAgYmxvY2sKPiA+ID4gKyAgICAgIC0gaXRlbXM6Cj4gPiA+ICsgICAgICAgICAgLSB7
fQo+ID4gPiArICAgICAgICAgIC0gY29uc3Q6IHNpZml2ZSxjbGludDIgICAgICAgICMgU2lGaXZl
IENMSU5UIHYyIElQIGJsb2NrCj4gPiA+ICsgICAgICAgIGRlc2NyaXB0aW9uOiBTaUZpdmUgQ0xJ
TlQgdjIgaXMgdGhlIEhSVCB0aGF0IHN1cHBvcnRzIHRoZSBaaWNudHIKPiA+ID4gICAgICAgIC0g
aXRlbXM6Cj4gPiA+ICAgICAgICAgICAgLSBlbnVtOgo+ID4gPiAgICAgICAgICAgICAgICAtIGFs
bHdpbm5lcixzdW4yMGktZDEtY2xpbnQKPiA+ID4gQEAgLTYyLDYgKzY2LDIyIEBAIHByb3BlcnRp
ZXM6Cj4gPiA+ICAgICAgbWluSXRlbXM6IDEKPiA+ID4gICAgICBtYXhJdGVtczogNDA5NQo+ID4g
Pgo+ID4gPiArICBzaWZpdmUsZmluZS1jdHItYml0czoKPiA+ID4gKyAgICBtYXhpbXVtOiAxNQo+
ID4gPiArICAgIGRlc2NyaXB0aW9uOiBUaGUgd2lkdGggaW4gYml0cyBvZiB0aGUgZmluZSBjb3Vu
dGVyLgo+ID4gPiArCj4gPiA+ICtpZjoKPiA+ID4gKyAgcHJvcGVydGllczoKPiA+ID4gKyAgICBj
b21wYXRpYmxlOgo+ID4gPiArICAgICAgY29udGFpbnM6Cj4gPiA+ICsgICAgICAgIGNvbnN0OiBz
aWZpdmUsY2xpbnQyCj4gPiA+ICt0aGVuOgo+ID4gPiArICByZXF1aXJlZDoKPiA+ID4gKyAgICAt
IHNpZml2ZSxmaW5lLWN0ci1iaXRzCj4gPiA+ICtlbHNlOgo+ID4gPiArICBwcm9wZXJ0aWVzOgo+
ID4gPiArICAgIHNpZml2ZSxmaW5lLWN0ci1iaXRzOiBmYWxzZQo+ID4gPiArCj4gPiA+ICBhZGRp
dGlvbmFsUHJvcGVydGllczogZmFsc2UKPiA+ID4KPiA+ID4gIHJlcXVpcmVkOgo+ID4gPiAtLQo+
ID4gPiAyLjE3LjEKPiA+ID4KPgo+IEJlc3QgUmVnYXJkcywKPiBOaWNrCj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
