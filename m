Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1BFC7EE30
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 11:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Ynwdw5KVBHikvOwDAlJTmw5xzY67pYPOETPa9OmRBQ=; b=B+N0yCBsTe4hmN
	Lv4fbIHF4k6F6FrPBjKivH5ua8JOj3QXUrXtnVGGT/UieUuAPN6WdRiXkyjnHK2fcfSeW5d6gg6XC
	Tgzm6locCm89/1cjPmPqjW8m7qmqm23fzSx48LmX9KeQS/7z8VzMWB7GP9AugsROCoPnsDwWjDZa1
	zKxKhIxRhKcTlE0FcKOm/6dRCzG02F8JgmbLTaitugTT6fFViR+7/x6VaFykfIQqi+3cwIELDovAX
	juDPy207pxiX8xCzkK50+N4H4vPDAzNGYPiQxPod+xU9qcONB2l9otfNTa2ryDGdPdqBDR5U30fSt
	NdMolx6JCMBrTzn/dbVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYoE-00000004pdt-2Hxv;
	Tue, 01 Jul 2025 11:05:54 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXf1-00000004eAe-1GDh
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 09:52:20 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e81ec95d944so5651012276.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 02:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751363538; x=1751968338; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKA6FwPF97E3KxijHqFbWyBNdWNWu66wkqfXYan6V+A=;
        b=eaVKUngSDpfeqgtw7QHZsQdQZcyJ43xlG7zfo7nwAXyzf9PDWcD37ElR62Sf+n+FxB
         cTHW5kpQXZ7Y8Awi+3RV5OQtuppvIUVpuxB9hTiRldDhVBTfoTb0qmfsfSxv79gQWMbg
         6C8wTmy0PD18JOLRCl1REQBebGi7+P0ZmS83ojlDVPABNSyKn5UFK4Zx9tYeZeX4BN+y
         LK94Ih3jEcUkmYhLEDxr0k3XmM4ztFqXRdWuTwHYAo6G+OUWT3vTOHD+FTzb9CZdfrNG
         d3islP3FLISAKTvIQua+D7FWBElVwSM3Ujll1hgjyRM3N5J5hkqprROA6e0l8sQwMtpE
         1juA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751363538; x=1751968338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKA6FwPF97E3KxijHqFbWyBNdWNWu66wkqfXYan6V+A=;
        b=f20Q1NMq3ARciX6s+O0dbpLXNWH7zZP0cpnKOEe13jMNRvl6zcIJRtryAS7TLwQzRd
         4bYn7MoS3dnyg5OvCsevT/72Kc0KnghPyG2CJo1GSClF07aRFO5PT3VYL8NTXh/+rN1I
         H79mjZhRdhfhbZ29GXaPmqZgSZt6YgaeGcWpnu60T5xMKt8Y4jZf85MO1Fdv8o1tM8pI
         oW7y8abkLVCDJVCIOCFNsMqiee2M3n6NW05aFI1xT5SdJpzX3shFNShLw8aTlzq0nJp9
         fEO3/tVlwM0XTAsgjb0O98HRH238gW0dF4AXBSynMaIE3U5eGKLdMhd04K3+3rR9SLZv
         oNCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1KVS4OhZFnpMwvNGiCmcwHCqUj91PUuG105OJzQmHoFWclh+5aJphgeSF8dya+WMpeydFeR0d7dTtNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjE8ef75QMqK8NS5ntHrZtjej1Ucf/bDHCMM69EluOCU9pngU6
	FcMdNKYsb9v2cCX98fyxnF/aXN4vR5aRgDIBuefXZc6A/r9XbZU+rbAUyv01Ul4buDyeMR5kXzn
	0I/L3OlK/Wga2tCesPBfJ/b5QtUSVcB/8V8hTtqUhBw==
X-Gm-Gg: ASbGncv+OQmrkMyVrDz2fnQfO6DwToxb2TlJL1YKuupP5pV8b9eWklNNt0ka05DtHzv
	EsmgJMRbc5pETbaiX7cHLebRSrcOkBdLPVmshtcaPlQ4vThNxfCO/XtGngzAOxYl1qGLqNT6sO2
	9RzOU8lhz/tWae2RHchGp5CSNdv2DjHxzKw2eXCavVZrZzicHZ70yhdSa9tHc=
X-Google-Smtp-Source: AGHT+IGzHyECCHeiUYQOgvHa6UJ9WkRPSzDk6WELLYNag9ls2mHas7vRAKuqf10+XgRIe5X8BpYEYpQLbmrpRpbXWcM=
X-Received: by 2002:a05:690c:6102:b0:711:6ea1:8d12 with SMTP id
 00721157ae682-7163ee4d03dmr40769417b3.1.1751363538182; Tue, 01 Jul 2025
 02:52:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
 <20250701-working_dma_0701_v2-v2-1-ab6ee9171d26@riscstar.com> <de965773-bab1-4c50-b111-19896465e53e@kernel.org>
In-Reply-To: <de965773-bab1-4c50-b111-19896465e53e@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 1 Jul 2025 17:52:07 +0800
X-Gm-Features: Ac12FXxrwUxphoCfQfkTD7volCQBmLx90I-g-CSXGPV4ZQwkJtWnCbMfwgC8RlU
Message-ID: <CAH1PCMbKGeXL9Te6M28ZdX8VBvaToKcK7f+JmN6JsCfttG_Mtg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: dma: marvell,mmp-dma: Add SpacemiT K1
 PDMA support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alex Elder <elder@riscstar.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_025219_451264_7E990C2C 
X-CRM114-Status: GOOD (  29.42  )
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

SGksIEtyenlzenRvZgoKT24gVHVlLCBKdWwgMSwgMjAyNSBhdCAzOjM14oCvUE0gS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIDAxLzA3LzIwMjUgMDc6
MzYsIEd1b2RvbmcgWHUgd3JvdGU6Cj4gPiBBZGQgInNwYWNlbWl0LGsxLXBkbWEiIGNvbXBhdGli
bGUgc3RyaW5nIHRvIHN1cHBvcnQgU3BhY2VtaVQgSzEgUERNQQo+ID4gY29udHJvbGxlci4gVGhp
cyB2YXJpYW50IHJlcXVpcmVzOgo+Cj4gV2h5IGlzIHRoaXMgbWFydmVsbD8gVGhpcyBzaG91bGQg
YmUgZXhwbGFpbmVkIGhlcmUsIGl0J3MgcmVhbGx5IHVuZXhwZWN0ZWQuCj4KClNwYWNlbWlUIEsx
IFNvQyB1c2VzIHRoZSBzYW1lIERNQSBjb250cm9sbGVyIGFzIE1hcnZlbGwgTU1QLiBUaGV5IHNo
YXJlIG1vc3QKb2YgdGhlIHJlZ2lzdGVycyAoYW5kIGFkZHJlc3Mgb2Zmc2V0cykgYW5kIG9ubHkg
ZW5oYW5jZWQgaW4gYWRkcmVzc2luZyBzcGFjZQpjYXBhYmlsaXR5IChmcm9tIDMyYml0IHRvIDY0
Yml0KS4KCkFsc28sIHNwYWNlbWl0LGsxLXBkbWEgYW5kIG1hcnZlbGwscGRtYS0xLjAgdXNlIHRo
ZSBzYW1lIGRyaXZlciAobW1wX3BkbWEuYyksCnRoYXQncyB0aGUgcmVhc29uIHdoeSBJIGNob3Nl
IGtlZXBpbmcgdGhlbSBpbiB0aGUgc2FtZSBiaW5kaW5nIGZpbGUuCgoKPiA+IC0gY2xvY2tzOiBD
bG9jayBjb250cm9sbGVyIGZvciB0aGUgRE1BCj4gPiAtIHJlc2V0czogUmVzZXQgY29udHJvbGxl
ciBmb3IgdGhlIERNQQo+ID4KPiA+IEFsc28gYWRkIGV4cGxpY2l0ICNkbWEtY2VsbHMgcHJvcGVy
dHkgZGVmaW5pdGlvbiB3aXRoIHByb3BlciBjb25zdHJhaW50czoKPiA+IC0gMiBjZWxscyBmb3Ig
bWFydmVsbCxwZG1hLTEuMCBhbmQgc3BhY2VtaXQsazEtcGRtYQo+ID4gICAgIC0gKHJlcXVlc3Qg
bnVtYmVyICsgdW51c2VkKQo+ID4gLSAxIGNlbGwgZm9yIG90aGVyIHZhcmlhbnRzCj4gPiAgICAg
LSAocmVxdWVzdCBudW1iZXIgb25seSkKPiA+Cj4gPiBUaGlzIGZpeGVzICJtYWtlIGR0YnNfY2hl
Y2sgVz0zIiB3YXJuaW5ncyBhYm91dCB1bmV2YWx1YXRlZCBwcm9wZXJ0aWVzLgo+Cj4gSG93IGNh
biBJIHJlcHJvZHVjZSB0aGVzZSB3YXJuaW5ncz8gTG9va3MgbGlrZSB0aGlzIGlzIG5vdCByZWxl
dmFudAo+IGhlcmUuIEVhY2ggcGF0Y2ggaXMgYXBwbGllZCBvbmUgYWZ0ZXIgYW5vdGhlciBhbmQg
Y29tbWl0IG1zZyBtdXN0IGJlCj4gY29ycmVjdCBhdCB0aGlzIHBvaW50Lgo+CgpZb3UncmUgYWJz
b2x1dGVseSByaWdodCBhYm91dCB0aGUgY29tbWl0IG1lc3NhZ2UgbmVlZGluZyB0byBiZSBhY2N1
cmF0ZQphdCB0aGlzIHBvaW50LiBUaGUgZHRic19jaGVjayB3YXJuaW5ncyBvbmx5IG9jY3VyIHdo
ZW4gY29tcGlsaW5nIGJvYXJkIERUUwpmaWxlcyB0aGF0IGNvbnRhaW4gbm9kZXMgd2l0aCBtYXJ2
ZWxsLHBkbWEtMS4wIG9yIHNwYWNlbWl0LGsxLXBkbWEKY29tcGF0aWJsZSBzdHJpbmdzIC0gc3Bl
Y2lmaWNhbGx5IHdoZW4gUEFUQ0ggNyBvZiB0aGlzIHNlcmllcy4KCkknbGwgcmV2aXNlIHRoZSBj
b21taXQgbWVzc2FnZSB0byBiZXR0ZXIgcmVmbGVjdCB0aGF0IHRoaXMgcGF0Y2ggZW5oYW5jZXMK
dGhpbmdzLCByYXRoZXIgdGhhbiBjbGFpbWluZyBpdCAiZml4ZXMiIHdhcm5pbmdzIGF0IHRoaXMg
c3RhZ2UuCgo+Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNj
c3Rhci5jb20+Cj4gPiAtLS0KPiA+IHYyOgo+ID4gLSBVc2VkIG1vcmUgc3BlY2lmaWMgY29tcGF0
aWJsZSBzdHJpbmcgInNwYWNlbWl0LGsxLXBkbWEiCj4gPiAtIEVuaGFuY2VkIERUIGJpbmRpbmdz
IHdpdGggY29uZGl0aW9uYWwgY29uc3RyYWludHM6Cj4gPiAgIC0gY2xvY2tzL3Jlc2V0cyBwcm9w
ZXJ0aWVzIG9ubHkgcmVxdWlyZWQgZm9yIFNwYWNlbWlUIEsxCj4gPiAgIC0gI2RtYS1jZWxscyBz
ZXQgdG8gMiBmb3IgbWFydmVsbCxwZG1hLTEuMCBhbmQgc3BhY2VtaXQsazEtcGRtYQo+ID4gICAt
ICNkbWEtY2VsbHMgc2V0IHRvIDEgZm9yIG90aGVyIHZhcmlhbnRzLCBpZS4KPiA+ICAgICAgIG1h
cnZlbGwsYWRtYS0xLjAgYW5kICBtYXJ2ZWxsLHB4YTkxMC1zcXUKPiA+IC0tLQo+ID4gIC4uLi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2RtYS9tYXJ2ZWxsLG1tcC1kbWEueWFtbCAgIHwgNDkgKysrKysr
KysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEv
bWFydmVsbCxtbXAtZG1hLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZG1hL21hcnZlbGwsbW1wLWRtYS55YW1sCj4gPiBpbmRleCBkNDQ3ZDUyMDdiZTA0MzZiYzdmYjY0
OGRmZmUzMWY4Yjc4MGI0OTFkLi43YjVmN2NjZmM5ZGJiNjliZmVmMjUwMTQ2Y2JhNTQzNDU0OGYz
NzAyIDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rt
YS9tYXJ2ZWxsLG1tcC1kbWEueWFtbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2RtYS9tYXJ2ZWxsLG1tcC1kbWEueWFtbAo+ID4gQEAgLTE4LDYgKzE4LDcgQEAg
cHJvcGVydGllczoKPiA+ICAgICAgICAtIG1hcnZlbGwscGRtYS0xLjAKPiA+ICAgICAgICAtIG1h
cnZlbGwsYWRtYS0xLjAKPiA+ICAgICAgICAtIG1hcnZlbGwscHhhOTEwLXNxdQo+ID4gKyAgICAg
IC0gc3BhY2VtaXQsazEtcGRtYQo+ID4KPiA+ICAgIHJlZzoKPiA+ICAgICAgbWF4SXRlbXM6IDEK
PiA+IEBAIC0zMiw2ICszMywxOSBAQCBwcm9wZXJ0aWVzOgo+ID4gICAgICAgIEEgcGhhbmRsZSB0
byB0aGUgU1JBTSBwb29sCj4gPiAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmlu
aXRpb25zL3BoYW5kbGUKPiA+Cj4gPiArICBjbG9ja3M6Cj4gPiArICAgIGRlc2NyaXB0aW9uOiBD
bG9jayBmb3IgdGhlIGNvbnRyb2xsZXIKPiA+ICsgICAgbWF4SXRlbXM6IDEKPiA+ICsKPiA+ICsg
IHJlc2V0czoKPiA+ICsgICAgZGVzY3JpcHRpb246IFJlc2V0IGNvbnRyb2xsZXIgZm9yIHRoZSBE
TUEgY29udHJvbGxlcgo+ID4gKyAgICBtYXhJdGVtczogMQo+ID4gKwo+ID4gKyAgJyNkbWEtY2Vs
bHMnOgo+ID4gKyAgICBkZXNjcmlwdGlvbjoKPiA+ICsgICAgICBETUEgc3BlY2lmaWVyLCBjb25z
aXN0aW5nIG9mIGEgcGhhbmRsZSB0byBETUEgY29udHJvbGxlciBwbHVzIHRoZQo+ID4gKyAgICAg
IGZvbGxvd2luZyBpbnRlZ2VyIGNlbGxzCj4KPiBXaHkgZG8geW91IG5lZWQgaXQgaGVyZT8gSXNu
J3QgdGhpcyBjb21pbmcgZnJvbSBkbWEgY29tbW9uIHNjaGVtYXM/CgpUaGFua3MgZm9yIHBvaW50
aW5nIG91dCB0aGlzLiBJdCBzaG91bGQgYmUgcmVtb3ZlZC4KSSB3aWxsIGZpeCBpdC4KCj4gPiAr
Cj4gPiAgICAnI2RtYS1jaGFubmVscyc6Cj4gPiAgICAgIGRlcHJlY2F0ZWQ6IHRydWUKPiA+Cj4g
PiBAQCAtNTIsMTIgKzY2LDQ3IEBAIGFsbE9mOgo+ID4gICAgICAgICAgICBjb250YWluczoKPiA+
ICAgICAgICAgICAgICBlbnVtOgo+ID4gICAgICAgICAgICAgICAgLSBtYXJ2ZWxsLHBkbWEtMS4w
Cj4gPiArICAgICAgICAgICAgICAtIHNwYWNlbWl0LGsxLXBkbWEKPiA+ICAgICAgdGhlbjoKPiA+
ICAgICAgICBwcm9wZXJ0aWVzOgo+ID4gICAgICAgICAgYXNyYW06IGZhbHNlCj4gPiAgICAgIGVs
c2U6Cj4gPiAgICAgICAgcmVxdWlyZWQ6Cj4gPiAgICAgICAgICAtIGFzcmFtCj4gPiArICAtIGlm
Ogo+ID4gKyAgICAgIHByb3BlcnRpZXM6Cj4gPiArICAgICAgICBjb21wYXRpYmxlOgo+ID4gKyAg
ICAgICAgICBjb250YWluczoKPiA+ICsgICAgICAgICAgICBjb25zdDogc3BhY2VtaXQsazEtcGRt
YQo+ID4gKyAgICB0aGVuOgo+ID4gKyAgICAgIHJlcXVpcmVkOgo+ID4gKyAgICAgICAgLSBjbG9j
a3MKPiA+ICsgICAgICAgIC0gcmVzZXRzCj4gPiArICAgIGVsc2U6Cj4gPiArICAgICAgcHJvcGVy
dGllczoKPiA+ICsgICAgICAgIGNsb2NrczogZmFsc2UKPiA+ICsgICAgICAgIHJlc2V0czogZmFs
c2UKPiA+ICsgIC0gaWY6Cj4gPiArICAgICAgcHJvcGVydGllczoKPiA+ICsgICAgICAgIGNvbXBh
dGlibGU6Cj4gPiArICAgICAgICAgIGNvbnRhaW5zOgo+ID4gKyAgICAgICAgICAgIGVudW06Cj4g
PiArICAgICAgICAgICAgICAtIG1hcnZlbGwscGRtYS0xLjAKPiA+ICsgICAgICAgICAgICAgIC0g
c3BhY2VtaXQsazEtcGRtYQo+ID4gKyAgICB0aGVuOgo+ID4gKyAgICAgIHByb3BlcnRpZXM6Cj4g
PiArICAgICAgICAnI2RtYS1jZWxscyc6Cj4gPiArICAgICAgICAgIGNvbnN0OiAyCj4gPiArICAg
ICAgICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAgICAgICAgICAgIFRoZSBmaXJzdCBjZWxsIGNvbnRh
aW5zIHRoZSBETUEgcmVxdWVzdCBudW1iZXIgZm9yIHRoZSBwZXJpcGhlcmFsCj4gPiArICAgICAg
ICAgICAgZGV2aWNlLiBUaGUgc2Vjb25kIGNlbGwgaXMgY3VycmVudGx5IHVudXNlZCBidXQgbXVz
dCBiZSBwcmVzZW50IGZvcgo+ID4gKyAgICAgICAgICAgIGJhY2t3YXJkIGNvbXBhdGliaWxpdHku
Cj4gPiArICAgIGVsc2U6Cj4gPiArICAgICAgcHJvcGVydGllczoKPiA+ICsgICAgICAgICcjZG1h
LWNlbGxzJzoKPiA+ICsgICAgICAgICAgY29uc3Q6IDEKPiA+ICsgICAgICAgICAgZGVzY3JpcHRp
b246Cj4gPiArICAgICAgICAgICAgVGhlIGNlbGwgY29udGFpbnMgdGhlIERNQSByZXF1ZXN0IG51
bWJlciBmb3IgdGhlIHBlcmlwaGVyYWwgZGV2aWNlLgo+Cj4KPiBJdCdzIGdldHRpbmcgY29tcGxp
Y2F0ZWQuIEkgc3VnZ2VzdCB0byBtYWtlIHlvdXIgb3duIHNjaGVtYS4gVGhlbiB5b3UKPiB3b3Vs
ZCBhbHNvIHN3aXRjaCB0byBwcmVmZXJyZWQgJ3NyYW0nIHByb3BlcnR5IGluc3RlYWQgb2YgdGhh
dCBsZWdhY3kKPiAnYXNyYW0nLgo+Cj4gUmVhbGx5LCBhbmNpZW50IHNjaGVtYXMgc2hvdWxkIG5v
dCBiZSBncm93biBmb3IgbmV3LCBjb21wbGV0ZWx5CgpUaGUgcmVhc29uIHRoYXQgdGhleSBzaGFy
ZSB0aGUgc2FtZSBkZXZpY2UgZHJpdmVyIG1heSBub3QgYmUgc3Ryb25nIGVub3VnaApjb21wYXJl
ZCB0byB3aGF0IHlvdSBzYWlkIGhlcmUuCgo+IGRpZmZlcmVudCBwbGF0Zm9ybXMuCj4KCkNvbXBs
ZXhpdHkgd2lzZSwgSSBhZ3JlZSB3aXRoIHlvdS4gSSBzaG91bGQgYWRtaXQgdGhhdCBJIGhhdmVu
J3QgZHVnIGludG8KdGhlIGhpc3RvcnkgZW5vdWdoLiBBbnl3YXksIHVubGVzcyBvdGhlciBwZW9w
bGUgaGF2ZSBzdHJvbmcgb3BpbmlvbiwgSSB3aWxsCmNyZWF0ZSBhIG5ldyBzY2hlbWEgbmFtZWx5
IHNwYWNlbWl0LGsxLXBkbWEueWFtbAoKVGhhbmtzIEtyenlzenRvZi4KCkJSLApHdW9kb25nCgoK
Pgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
