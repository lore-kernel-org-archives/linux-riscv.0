Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3E0C4167D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 15:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWI2NHM+80EHlk/fIfLL8JgOCXPFFrai76rjPpnqEp4=; b=wLCe5qRGHxxPfe
	QDOhmAzKRGNbDXkcWiLLgTyCLOXVya+pp+Btrf7LX9/lrs2sVDv3BAMzc8fS89slMsZazcq3d0/6M
	ZQAx+ck109Xl3V6AZCzm/BqIut6/ts4BU6EiLQTsuEQvre/wQyTD6QjVNiLw4NWxRQn0n6BGkUvxC
	rr5wPltgu3UxYa+or+iltlQVAcf397RlgGflGIdnQIT/nH/W4AqDeDKPIMS3GxtA9+1GeDgilOkD/
	AHsPccd/E4Kepm1m5PWKoPTrAzLc6dJZvfLWUBToZJHOe3PqPcEXc3D6fmZcvcclRsYp7Pz3ygIfC
	0T/wiwY3hBrYvnnMfUyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDR1Q-00FBOI-1b;
	Wed, 13 Dec 2023 15:19:40 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDR1N-00FBMM-0t
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 15:19:39 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2ca0715f0faso97882451fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 07:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702480775; x=1703085575; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNtewRvKdkPKx/kufVZXHodSPMmaednXpW/7XMndJ0U=;
        b=pAai6cgdz6EzDxg17ySC8bglS4ampca5hY78TbVi3dOdF9okRw17STrUQwFnsGi8QM
         lny2nQ04RFVe4nkY0k7/7NmTcdaaWI8ANbTUb2iVgImlVIUDqhI0+S0wA7jakJBGcQP6
         72GNukGlMW6n7G8l/xrvcgY7aKu4CylteS5NyPDtRrWMKWUW2J/g9P0ujCpflOyUf76u
         P4UIlV9vfFCQm/qg3dC7lWydBaX/ce3o6UM/xouOjvLSyq9OoIcW9OKELdQi2UH+dUHF
         jDvYQ1yCoypviGge1OQPVN6gLYVtWMDNBV3SfHFUR47Emy3G3Z1zt2HboLq8ot7+Xzil
         fIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702480775; x=1703085575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNtewRvKdkPKx/kufVZXHodSPMmaednXpW/7XMndJ0U=;
        b=J/kvyygDyMZ1OqaTrousMixadNXWQeEydwqHiWf/XZNC02yL2nnxzlLOq0GXLHXSmH
         +Jlg3iH1d3nBQhQwQ9nYFSXobTWyhGqxo3L4RK/E2vaWvTkJmTcf6gsBSrISAdroGttI
         J7dQ7PHrT+6HUgc4J4lIVlbge5Fqivw7TuUGQjALxtinPs0m9T13T+dqRl+blbTU1yE9
         1pIgu9LSnyI6jFuhHRBKZMToRrRtxOmSFUWTxy2kbZ217Zpx3oZPZC3shoVCxDo7Ek4X
         FXYa6DEwY/PunamendiUFZsuiG4ZpptbbqrXySAKgsA34PeRNqf91zN0lhV0n3QvyaCC
         GvJw==
X-Gm-Message-State: AOJu0YyQjlonmAZkquFcTaI2NpmHefxkijMk9QzKx0Arap44Oae+cP0g
	YlDcgf79h+vAIu1/4xEQWHiPQwcTZwwpQMra6vYB2g==
X-Google-Smtp-Source: AGHT+IEWCau9dWkDM8W8lF/KIFyXrgUvkYmScfqjpzvs5KS7ZHA07igo81qn4oh9bMosVxgpVkuKuvBsoM9ShBq/11s=
X-Received: by 2002:a05:651c:1186:b0:2cc:321c:d8dd with SMTP id
 w6-20020a05651c118600b002cc321cd8ddmr706657ljo.82.1702480775254; Wed, 13 Dec
 2023 07:19:35 -0800 (PST)
MIME-Version: 1.0
References: <20231213070301.1684751-1-peterlin@andestech.com>
 <20231213070301.1684751-3-peterlin@andestech.com> <CAK9=C2WuuYQD8ydrHP16hUXVk6RuKLbfvUe_GpUGw9ppe3Rd8Q@mail.gmail.com>
In-Reply-To: <CAK9=C2WuuYQD8ydrHP16hUXVk6RuKLbfvUe_GpUGw9ppe3Rd8Q@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 13 Dec 2023 20:49:23 +0530
Message-ID: <CAK9=C2U+rSP8YMahPmTHLYZ+ZBfwwY5y52JeU_=R+VL1frR1Uw@mail.gmail.com>
Subject: Re: [PATCH v5 02/16] irqchip/riscv-intc: Allow large non-standard
 interrupt number
To: Yu Chien Peter Lin <peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_071937_315034_20D39A1C 
X-CRM114-Status: GOOD (  36.53  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, jszhang@kernel.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgNzo1OOKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgRGVjIDEzLCAyMDIzIGF0IDEyOjM04oCv
UE0gWXUgQ2hpZW4gUGV0ZXIgTGluCj4gPHBldGVybGluQGFuZGVzdGVjaC5jb20+IHdyb3RlOgo+
ID4KPiA+IEN1cnJlbnRseSwgdGhlIGltcGxlbWVudGF0aW9uIG9mIHRoZSBSSVNDLVYgSU5UQyBk
cml2ZXIgdXNlcyB0aGUKPiA+IGludGVycnVwdCBjYXVzZSBhcyBoYXJkd2FyZSBpbnRlcnJ1cHQg
bnVtYmVyIGFuZCBoYXMgYSBsaW1pdGF0aW9uIG9mCj4gPiBzdXBwb3J0aW5nIGEgbWF4aW11bSBv
ZiA2NCBpbnRlcnJ1cHRzLiBIb3dldmVyLCBhY2NvcmRpbmcgdG8gdGhlCj4gPiBwcml2aWxlZ2Vk
IHNwZWMsIGludGVycnVwdCBjYXVzZXMgPj0gMTYgYXJlIGRlZmluZWQgZm9yIHBsYXRmb3JtIHVz
ZS4KPgo+IEkgZGlzYWdyZWUgd2l0aCB0aGlzIHBhdGNoLgo+Cj4gRXZlbiB0aG91Z2ggUklTQy1W
IHByaXYgc2VwYyBhbGxvd3MgaW50ZXJydXB0IGNhdXNlcyA+PSAxNiwgd2UKPiBzdGlsbCBuZWVk
IENTUnMgdG8gbWFuYWdlIGFyYml0cmFyeSBsb2NhbCBpbnRlcnJ1cHRzCj4KPiBDdXJyZW50bHks
IHdlIGhhdmUgZm9sbG93aW5nIHN0YW5kYXJkIENTUnM6Cj4gMSkgW218c11pZSBhbmQgW218c11p
cCB3aGljaCBhcmUgWExFTiB3aWRlCj4gMikgV2l0aCBBSUEsIHdlIGhhdmUgW218c11pZWggYW5k
IFttfHNdaXBoIGZvciBSVjMyCj4KPiBDbGVhcmx5LCB3ZSBjYW4gb25seSBoYXZlIGEgWExFTiBu
dW1iZXIgb2Ygc3RhbmRhcmQgbG9jYWwKPiBpbnRlcnJ1cHRzIHdpdGhvdXQgQUlBIGFuZCA2NCBs
b2NhbCBpbnRlcnJ1cHRzIHdpdGggQUlBLgo+Cj4gTm93IGZvciBpbXBsZW1lbnRhdGlvbnMgd2l0
aCBjdXN0b20gQ1NScyAoc3VjaCBhcyBBbmRlcyksCj4gd2Ugc3RpbGwgY2FuJ3QgYXNzdW1lIGlu
ZmluaXRlIGxvY2FsIGludGVycnVwdHMgYmVjYXVzZSBIVyB3aWxsCj4gaGF2ZSBhIGZpbml0ZSBu
dW1iZXIgb2YgY3VzdG9tIENTUnMuCj4KPiA+Cj4gPiBUaGlzIGxpbWl0YXRpb24gcHJldmVudHMg
dG8gZnVsbHkgdXRpbGl6ZSB0aGUgYXZhaWxhYmxlIGxvY2FsIGludGVycnVwdAo+ID4gc291cmNl
cy4gQWRkaXRpb25hbGx5LCB0aGUgaW50ZXJydXB0IG51bWJlciB1c2VkIG9uIFJJU0MtViBhcmUg
c3BhcnNlLAo+ID4gd2l0aCBvbmx5IGludGVycnVwdCBudW1iZXJzIDEsIDUgYW5kIDkgKHBsdXMg
U3Njb2ZwbWYgb3IgVC1IZWFkJ3MgUE1VCj4gPiBpbnRlcnJ1cHQpIGJlaW5nIGN1cnJlbnRseSB1
c2VkIGZvciBzdXBlcnZpc29yIG1vZGUuCj4gPgo+ID4gU3dpdGNoIHRvIHVzaW5nIGlycV9kb21h
aW5fY3JlYXRlX3RyZWUoKSB0byBjcmVhdGUgdGhlIHJhZGl4IHRyZWUKPiA+IG1hcCwgc28gYSBs
YXJnZXIgbnVtYmVyIG9mIGhhcmR3YXJlIGludGVycnVwdHMgY2FuIGJlIGhhbmRsZWQuCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogWXUgQ2hpZW4gUGV0ZXIgTGluIDxwZXRlcmxpbkBhbmRlc3RlY2gu
Y29tPgo+ID4gUmV2aWV3ZWQtYnk6IENoYXJsZXMgQ2ktSnl1biBXdSA8ZG1pbnVzQGFuZGVzdGVj
aC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogTGVvIFl1LUNoaSBMaWFuZyA8eWNsaWFuZ0BhbmRlc3Rl
Y2guY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIHYxIC0+IHYyOgo+ID4gICAtIEZpeGVkIGlycSBt
YXBwaW5nIGZhaWx1cmUgY2hlY2tpbmcgKHN1Z2dlc3RlZCBieSBDbMOpbWVudCBhbmQgQW51cCkK
PiA+IENoYW5nZXMgdjIgLT4gdjM6Cj4gPiAgIC0gTm8gY2hhbmdlCj4gPiBDaGFuZ2VzIHYzIC0+
IHY0OiAoU3VnZ2VzdGVkIGJ5IFRob21hcyBbMV0pCj4gPiAgIC0gVXNlIHByX3dhcm5fcmF0ZWxp
bWl0ZWQgaW5zdGVhZAo+ID4gICAtIEZpeCBjb2Rpbmcgc3R5bGUgYW5kIGNvbW1pdCBtZXNzYWdl
Cj4gPiBDaGFuZ2VzIHY0IC0+IHY1OiAoU3VnZ2VzdGVkIGJ5IFRob21hcykKPiA+ICAgLSBGaXgg
Y29tbWl0IG1lc3NhZ2UKPiA+Cj4gPiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
cm9qZWN0L2xpbnV4LXJpc2N2L3BhdGNoLzIwMjMxMDIzMDA0MTAwLjI2NjM0ODYtMy1wZXRlcmxp
bkBhbmRlc3RlY2guY29tLyMyNTU3MzA4NQo+ID4gLS0tCj4gPiAgZHJpdmVycy9pcnFjaGlwL2ly
cS1yaXNjdi1pbnRjLmMgfCAxMiArKysrLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2lycWNoaXAvaXJxLXJpc2N2LWludGMuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50
Yy5jCj4gPiBpbmRleCBlOGQwMWIxNGNjZGQuLjJmZGQ0MGYyYTc5MSAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jCj4gPiArKysgYi9kcml2ZXJzL2lycWNo
aXAvaXJxLXJpc2N2LWludGMuYwo+ID4gQEAgLTI0LDEwICsyNCw5IEBAIHN0YXRpYyBhc21saW5r
YWdlIHZvaWQgcmlzY3ZfaW50Y19pcnEoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiAgewo+ID4g
ICAgICAgICB1bnNpZ25lZCBsb25nIGNhdXNlID0gcmVncy0+Y2F1c2UgJiB+Q0FVU0VfSVJRX0ZM
QUc7Cj4gPgo+ID4gLSAgICAgICBpZiAodW5saWtlbHkoY2F1c2UgPj0gQklUU19QRVJfTE9ORykp
Cj4gPiAtICAgICAgICAgICAgICAgcGFuaWMoInVuZXhwZWN0ZWQgaW50ZXJydXB0IGNhdXNlIik7
Cj4gPiAtCj4gPiAtICAgICAgIGdlbmVyaWNfaGFuZGxlX2RvbWFpbl9pcnEoaW50Y19kb21haW4s
IGNhdXNlKTsKPiA+ICsgICAgICAgaWYgKGdlbmVyaWNfaGFuZGxlX2RvbWFpbl9pcnEoaW50Y19k
b21haW4sIGNhdXNlKSkKPiA+ICsgICAgICAgICAgICAgICBwcl93YXJuX3JhdGVsaW1pdGVkKCJG
YWlsZWQgdG8gaGFuZGxlIGludGVycnVwdCAoY2F1c2U6ICVsZClcbiIsCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjYXVzZSk7Cj4gPiAgfQo+ID4KPiA+ICAvKgo+ID4g
QEAgLTExNyw4ICsxMTYsNyBAQCBzdGF0aWMgaW50IF9faW5pdCByaXNjdl9pbnRjX2luaXRfY29t
bW9uKHN0cnVjdCBmd25vZGVfaGFuZGxlICpmbikKPiA+ICB7Cj4gPiAgICAgICAgIGludCByYzsK
PiA+Cj4gPiAtICAgICAgIGludGNfZG9tYWluID0gaXJxX2RvbWFpbl9jcmVhdGVfbGluZWFyKGZu
LCBCSVRTX1BFUl9MT05HLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAmcmlzY3ZfaW50Y19kb21haW5fb3BzLCBOVUxMKTsKPiA+ICsgICAgICAgaW50
Y19kb21haW4gPSBpcnFfZG9tYWluX2NyZWF0ZV90cmVlKGZuLCAmcmlzY3ZfaW50Y19kb21haW5f
b3BzLCBOVUxMKTsKPgo+IEkgZGlzYWdyZWUgd2l0aCB0aGlzIGNoYW5nZSBiYXNlZCBvbiB0aGUg
cmVhc29uaW5nIGFib3ZlLgo+Cj4gSW5zdGVhZCBvZiB0aGlzLCB3ZSBzaG91bGQgZGV0ZXJtaW5l
IHRoZSBudW1iZXIgb2YgbG9jYWwgaW50ZXJydXB0cwo+IGJhc2VkIG9uIHRoZSB0eXBlIG9mIFJJ
U0MtViBpbnRjOgo+IDEpIEZvciBzdGFuZGFyZCBJTlRDIHdpdGhvdXQgQUlBLCB3ZSBoYXZlIFhM
RU4gKG9yIEJJVFNfUEVSX0xPTkcpCj4gICAgIGxvY2FsIGludGVycnVwdHMKPiAyKSBGb3Igc3Rh
bmRhcnQgSU5UQyB3aXRoIEFJQSwgd2UgaGF2ZSA2NCBsb2NhbCBpbnRlcnJ1cHRzCj4gMykgRm9y
IGN1c3RvbSBJTlRDIChzdWNoIGFzIEFuZGVzKSwgdGhlIG51bWJlciBvZiBsb2NhbCBpbnRlcnJ1
cHQKPiAgICAgc2hvdWxkIGJlIGN1c3RvbSAoQW5kZXMgc3BlY2lmaWMpIHdoaWNoIGNhbiBiZSBk
ZXRlcm1pbmVkIGJhc2VkCj4gICAgIG9uIGNvbXBhdGlibGUgc3RyaW5nLgo+Cj4gQWxzbywgY3Jl
YXRpbmcgYSBsaW5lYXIgZG9tYWluIHdpdGggYSBmaXhlZCBudW1iZXIgb2YgbG9jYWwgaW50ZXJy
dXB0cwo+IGVuc3VyZXMgdGhhdCBkcml2ZXJzIGNhbid0IG1hcCBhIGxvY2FsIGludGVycnVwdCBi
ZXlvbmQgdGhlIGF2YWlsYWJpbGl0eQo+IG9mIENTUnMgdG8gbWFuYWdlIGl0LgoKVGhpbmtpbmcg
YWJvdXQgdGhpcyBtb3JlLiBXZSBkbyBoYXZlIGEgcHJvYmxlbSBiZWNhdXNlIEFuZGVzIGxvY2Fs
CmludGVycnVwdHMgYXJlIHJlYWxseSBzcGFyc2Ugd2hpY2ggaXMgbm90IHRoZSBjYXNlIGZvciBz
dGFuZGFyZCBsb2NhbAppbnRlcnJ1cHRzCgpJIGhhdmUgYW4gYWx0ZXJuYXRlIHN1Z2dlc3Rpb24g
d2hpY2ggZ29lcyBhcyBmb2xsb3dzIC4uLgoKV2UgdXNlIGlycV9kb21haW5fY3JlYXRlX3RyZWUo
KSBpbi1wbGFjZSBvZiBpcnFfZG9tYWluX2NyZWF0ZV9saW5lYXIoKQphbmQgZW5mb3JjZSBjaGVj
a3Mgb24gaHdpcnEgaW4gcmlzY3ZfaW50Y19kb21haW5fYWxsb2MoKSB0byBlbnN1cmUgdGhhdAp3
ZSBvbmx5IGFsbG93IGh3aXJxIGZvciB3aGljaCB3ZSBoYXZlIGNvcnJlc3BvbmRpbmcgc3RhbmRh
cmQgb3IgY3VzdG9tCkNTUi4KClRvIGFjaGlldmUgdGhpcywgcmlzY3ZfaW50Y19pbml0X2NvbW1v
bigpIHdpbGwgaGF2ZSB0byBzYXZlIHRoZSBmb2xsb3dpbmcKYXMgc3RhdGljIGdsb2JhbCB2YXJp
YWJsZXM6CjEpIHJpc2N2X2ludGNfbnJfaXJxczogTnVtYmVyIG9mIHN0YW5kYXJkIGxvY2FsIGlu
dGVycnVwdHMKMikgcmlzY3ZfaW50Y19jdXN0b21fYmFzZSBhbmQgcmlzY3ZfaW50Y19jdXN0b21f
bnJfaXJxczogQmFzZSBhbmQKICAgIG51bWJlciBvZiBjdXN0b20gbG9jYWwgaW50ZXJydXB0cy4K
ClVzaW5nIHRoZSBhYm92ZSBzdGF0aWMgZ2xvYmFsIHZhcmlhYmxlcywgdGhlIHJpc2N2X2ludGNf
ZG9tYWluX2FsbG9jKCkKY2FuIHJldHVybiBlcnJvciBpZiBvbmUgb2YgdGhlIGZvbGxvd2luZyBj
b25kaXRpb25zIGFyZSBtZXQ6CjEpIHJpc2N2X2ludGNfbnJfaXJxczw9IGh3aXJxICYmIGh3aXJx
IDwgcmlzY3ZfaW50Y19jdXN0b21fYmFzZQoyKSAocmlzY3ZfaW50Y19jdXN0b21fYmFzZSArIHJp
c2N2X2ludGNfY3VzdG9tX25yX2lycXMpIDw9IGh3aXJxCgpGb3Igc3RhbmRhcmQgSU5UQywgd2Ug
Y2FuIHNldCB0aGUgc3RhdGljIGdsb2JhbCB2YXJpYWJsZSBhcyBmb2xsb3dzOgpyaXNjdl9pbnRj
X25yX2lycXMgPSBYTEVOIG9yIEJJVFNfUEVSX0xPTkcKcmlzY3ZfaW50Y19jdXN0b21fYmFzZSA9
IHJpc2N2X2ludGNfbnJfaXJxcwpyaXNjdl9pbnRjX2N1c3RvbV9ucl9pcnFzID0gMAoKRm9yIEFu
ZGVzIElOVEMsIHdlIGNhbiBzZXQgdGhlIHN0YXRpYyBnbG9iYWwgdmFyaWFibGVzIGFzIGZvbGxv
d3M6CnJpc2N2X2ludGNfbnJfaXJxcyA9IFhMRU4gb3IgQklUU19QRVJfTE9ORwpyaXNjdl9pbnRj
X2N1c3RvbV9iYXNlID0gMjU2CnJpc2N2X2ludGNfY3VzdG9tX25yX2lycXMgPSBYTEVOIG9yIEJJ
VFNfUEVSX0xPTkcKClJlZ2FyZHMsCkFudXAKCj4KPiA+ICAgICAgICAgaWYgKCFpbnRjX2RvbWFp
bikgewo+ID4gICAgICAgICAgICAgICAgIHByX2VycigidW5hYmxlIHRvIGFkZCBJUlEgZG9tYWlu
XG4iKTsKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOWElPOwo+ID4gQEAgLTEzMiw4ICsx
MzAsNiBAQCBzdGF0aWMgaW50IF9faW5pdCByaXNjdl9pbnRjX2luaXRfY29tbW9uKHN0cnVjdCBm
d25vZGVfaGFuZGxlICpmbikKPiA+Cj4gPiAgICAgICAgIHJpc2N2X3NldF9pbnRjX2h3bm9kZV9m
bihyaXNjdl9pbnRjX2h3bm9kZSk7Cj4gPgo+ID4gLSAgICAgICBwcl9pbmZvKCIlZCBsb2NhbCBp
bnRlcnJ1cHRzIG1hcHBlZFxuIiwgQklUU19QRVJfTE9ORyk7Cj4gPiAtCj4KPiBTYW1lIGFzIGFi
b3ZlLCB3ZSBzaG91bGQgZGVmaW5pdGVseSBhZHZlcnRpc2UgdGhlIHR5cGUgb2YgSU5UQyBhbmQK
PiBudW1iZXIgb2YgbG9jYWwgaW50ZXJydXB0cyBtYXBwZWQuCj4KPiBSZWdhcmRzLAo+IEFudXAK
Pgo+ID4gICAgICAgICByZXR1cm4gMDsKPiA+ICB9Cj4gPgo+ID4gLS0KPiA+IDIuMzQuMQo+ID4K
PiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
