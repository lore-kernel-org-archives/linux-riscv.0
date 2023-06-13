Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B34C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 04:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ag+2ljqqRbByBw2Rl3XpXL5YfyXDgIIkKsNKMQay1dE=; b=LmldVwC8LFOxWX
	TVVzn+2nvWwjg4esb+VHqqyT41I4FoeacEdoSv7vmjGP2TJqvZiU8pQdc3lz50AmZF1AoFgEg9bI5
	zfozlfv6ZIK5+Ms450DPf5aQTMT4LRaRzFRhb9RDzYgQKBHmagW5k/gRS53kdcpL1n32q4iqxVaHT
	qrheqr0kRmHJewuMTLIHaeFE4Di9sNWWtiopQ/vzAwz45s85/o23Mk6YXLq5uTred9e571Y+KNUHf
	t0hq3sGD8OyIOjg5yRwu/dbCFnP1FrYubuO+zgneTC8c9HTjHwRulmNujw+uI9pBvCLq81do5FL9o
	DfDmD87nuAI5E06mTsLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8vru-006tyK-1o;
	Tue, 13 Jun 2023 04:42:58 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8vrr-006txl-1X
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 04:42:57 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51873e43986so399816a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jun 2023 21:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1686631372; x=1689223372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzwXO5LLinsbc81q9m0mJrThXDrRsGSZgZKBrqcWDhU=;
        b=Re/JoZDdl7WWFhPNRzXIFIPRLlnyd5pZGoZse5aP6tFTQ1ruH4SblQBU/qotEyJ8+O
         iMqIDMjO/+jluK8C/6EtzKspe3cTT3unitXHicVeJQf2SUUyk0agBJRXEkoityiA8USl
         v82m85Hryu0TtYHH2IvWElQGzoJEg1Hu9nIdWCU1jFX2Bahe/MV3MRRvw/Ijm+3gPMB5
         oTjOChfwoW7JOm9AYO1Uq0jt6SzTUsTP/bekTVKCXC9wOrzlXcAHZw8HEfWsXmQurh+D
         6NBihHB3EucGRXJ+Rsd7kWSihtlrYwnUX7Kmnsaw2UqKgcpvTyaaNakSa1BFWTDPXa4R
         HabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686631372; x=1689223372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CzwXO5LLinsbc81q9m0mJrThXDrRsGSZgZKBrqcWDhU=;
        b=RD+0cZFHyz6XCiiKueky53iG76HrR3Fj8zPfGN6+JTbEora3cUCPHi4MSssR2wdI6D
         L3p0lU1bPo+AawtJdc/oAseIMMROTjNVia/3dYK3Cw+shTMucZ78p3JV2VCsjpCUJWf1
         YRcu5qcxPHJsFiYMERs8NKe3V3+0WQos/u0jcay5lQKk6xa5wBReJJ8Hvjo/06m1ZWRb
         1+cY03Z9wQVV8A2g3MnQSdCK4twRQcWh+FxrSo5ZIsopql7S0FHu0G5Eo5nf5g/5ScHm
         +pd1F0PX56V8UusCos+jcJJTIcNkFZKUUYIzb1mhAkjvSDrOutfldP/qjItEM7tNBWG1
         k+yA==
X-Gm-Message-State: AC+VfDy4FLhAIEjoctXvudpOhPRuxJtxzUEmFLxCXXqQeJ/KtpNXXZ1/
	CSrEJD480zHFSxOawoJwebvmqdMOf8b7yCn/z1vSiA==
X-Google-Smtp-Source: ACHHUZ4ETr5UZ3VbtqL8LS3ZVa0OXp7qvMh694ytmLxSCEv5jRu14utuMLjd7mOBnSDm2aadOjxLwJ3P3GoNW1vtYdA=
X-Received: by 2002:aa7:c553:0:b0:508:3b1f:e6b5 with SMTP id
 s19-20020aa7c553000000b005083b1fe6b5mr5571374edr.15.1686631371900; Mon, 12
 Jun 2023 21:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230508142842.854564-1-apatel@ventanamicro.com>
 <20230508142842.854564-3-apatel@ventanamicro.com> <20230608182828.GA3183987-robh@kernel.org>
 <CAGETcx_4OH=EmSUL2-rwKa=1uoOj+AH_xn4PoPsc0kt_aU0WOg@mail.gmail.com>
 <CAK9=C2V1LH0739Nq5Ji7gGbgbyFtNAtBYR43fU7vr9omD5tKSA@mail.gmail.com> <CAGETcx--aEEB6ag1qGcEeygPyZM9Q-T1NOY+wK911LGJGisN8Q@mail.gmail.com>
In-Reply-To: <CAGETcx--aEEB6ag1qGcEeygPyZM9Q-T1NOY+wK911LGJGisN8Q@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 13 Jun 2023 10:12:40 +0530
Message-ID: <CAAhSdy2p6K70fc2yZLPdVGqEq61Y8F7WVT2J8st5mQrzBi4WHg@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] of/irq: Set FWNODE_FLAG_BEST_EFFORT for the
 interrupt controller DT nodes
To: Saravana Kannan <saravanak@google.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Rob Herring <robh@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Atish Patra <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, iommu@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_214255_732576_70F4797F 
X-CRM114-Status: GOOD (  33.36  )
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

T24gU2F0LCBKdW4gMTAsIDIwMjMgYXQgMjo0N+KAr0FNIFNhcmF2YW5hIEthbm5hbiA8c2FyYXZh
bmFrQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdW4gOSwgMjAyMyBhdCA0OjQw4oCv
QU0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4KPiA+IE9u
IEZyaSwgSnVuIDksIDIwMjMgYXQgMTozNeKAr0FNIFNhcmF2YW5hIEthbm5hbiA8c2FyYXZhbmFr
QGdvb2dsZS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBUaHUsIEp1biA4LCAyMDIzIGF0IDEx
OjI44oCvQU0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+
ID4gPiArU2FyYXZhbmEKPiA+ID4gPgo+ID4gPiA+IE9uIE1vbiwgTWF5IDA4LCAyMDIzIGF0IDA3
OjU4OjMzUE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiA+ID4gPiBUaGUgUklTQy1WIEFQ
TElDIGludGVycnVwdCBjb250cm9sbGVyIGRyaXZlciBpcyBhIHJlZ3VsYXIgcGxhdGZvcm0KPiA+
ID4gPiA+IGRyaXZlciBzbyB3ZSBuZWVkIHRvIGVuc3VyZSB0aGF0IGl0IGlzIHByb2JlZCBhcyBz
b29uIGFzIHBvc3NpYmxlLgo+ID4gPiA+ID4gVG8gYWNoaWV2ZSB0aGlzLCB3ZSBtYXJrIHRoZSBp
bnRlcnJ1cHQgY29udHJvbGxlciBkZXZpY2Ugbm9kZXMgd2l0aAo+ID4gPiA+ID4gRldOT0RFX0ZM
QUdfQkVTVF9FRkZPUlQgKGp1c3QgbGlrZSBjb25zb2xlIERUIG5vZGUpLgo+ID4gPiA+ID4KPiA+
ID4gPiA+IEZpeGVzOiA4ZjQ4NmNhYjI2M2MgKCJkcml2ZXIgY29yZTogZndfZGV2bGluazogQWxs
b3cgZmlybXdhcmUgdG8gbWFyayBkZXZpY2VzIGFzIGJlc3QgZWZmb3J0IikKPiA+ID4gPgo+ID4g
PiA+IEl0IGlzIGdvb2QgcHJhY3RpY2UgdG8gQ2MgdGhlIGNvbW1pdCBhdXRob3Igb2Ygd2hhdCB5
b3UgYXJlIGZpeGluZy4KPiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRl
bCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICBkcml2
ZXJzL29mL2lycS5jIHwgMTAgKysrKysrKysrKwo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
MCBpbnNlcnRpb25zKCspCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
b2YvaXJxLmMgYi9kcml2ZXJzL29mL2lycS5jCj4gPiA+ID4gPiBpbmRleCAxNzQ5MDAwNzJjMTgu
Ljk0ZTFkOTI0NWNmZiAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvb2YvaXJxLmMKPiA+
ID4gPiA+ICsrKyBiL2RyaXZlcnMvb2YvaXJxLmMKPiA+ID4gPiA+IEBAIC01MzUsNiArNTM1LDE2
IEBAIHZvaWQgX19pbml0IG9mX2lycV9pbml0KGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgKm1h
dGNoZXMpCj4gPiA+ID4gPiAgICAgICBJTklUX0xJU1RfSEVBRCgmaW50Y19kZXNjX2xpc3QpOwo+
ID4gPiA+ID4gICAgICAgSU5JVF9MSVNUX0hFQUQoJmludGNfcGFyZW50X2xpc3QpOwo+ID4gPiA+
ID4KPiA+ID4gPiA+ICsgICAgIC8qCj4gPiA+ID4gPiArICAgICAgKiBXZSBuZWVkIGludGVycnVw
dCBjb250cm9sbGVyIHBsYXRmb3JtIGRyaXZlcnMgdG8gd29yayBhcyBzb29uCj4gPiA+ID4KPiA+
ID4gPiBJZiBpdCdzIHBsYXRmb3JtIGRyaXZlcnMvZGV2aWNlcyB5b3UgY2FyZSBhYm91dCwgdGhl
biBwZXJoYXBzIHRoaXMKPiA+ID4gPiBzaG91bGQgYmUgZG9uZSB3aGVuIHBsYXRmb3JtIGRldmlj
ZXMgYXJlIGNyZWF0ZWQuCj4gPiA+ID4KPiA+ID4gPiA+ICsgICAgICAqIGFzIHBvc3NpYmxlIHNv
IG1hcmsgdGhlIGludGVycnVwdCBjb250cm9sbGVyIGRldmljZSBub2RlcyB3aXRoCj4gPiA+ID4g
PiArICAgICAgKiBGV05PREVfRkxBR19CRVNUX0VGRk9SVCBzbyB0aGF0IGZ3X2RlbGluayBrbm93
cyBub3QgdG8gZGVsYXkKPiA+ID4gPiA+ICsgICAgICAqIHRoZSBwcm9iZSBvZiB0aGUgaW50ZXJy
dXB0IGNvbnRyb2xsZXIgZGV2aWNlIGZvciBzdXBwbGllcnMKPiA+ID4gPiA+ICsgICAgICAqIHdp
dGhvdXQgZHJpdmVycy4KPiA+ID4gPiA+ICsgICAgICAqLwo+ID4gPiA+ID4gKyAgICAgZm9yX2Vh
Y2hfbm9kZV93aXRoX3Byb3BlcnR5KG5wLCAiaW50ZXJydXB0LWNvbnRyb2xsZXIiKQo+ID4gPiA+
Cj4gPiA+ID4gVGhpcyBmdW5jdGlvbiBvbmx5IG9wZXJhdGVzIG9uIG5vZGVzIG1hdGNoaW5nICdt
YXRjaGVzJywgYnV0IHRoaXMKPiA+ID4gPiBvcGVyYXRlcyBvbiBldmVyeXRoaW5nLgo+ID4gPiA+
Cj4gPiA+ID4gSXQgZG9lcyBtYWtlIHNlbnNlIHRoYXQgaWYgd2UgaW5pdCBhbiBpbnRlcnJ1cHQg
Y29udHJvbGxlciBoZXJlLCB0aGVuIHdlCj4gPiA+ID4gd2lsbCBzdXJlbHkgd2FudCB0byBwcm9i
ZSBpdHMgZHJpdmVyIGxhdGVyIG9uLiBTbyBtYXliZSBqdXN0IG1vdmUKPiA+ID4gPiBzZXR0aW5n
IEZXTk9ERV9GTEFHX0JFU1RfRUZGT1JUIHdpdGhpbgo+ID4gPiA+IGZvcl9lYWNoX21hdGNoaW5n
X25vZGVfYW5kX21hdGNoKCkgYmVsb3cuCj4gPiA+ID4KPiA+ID4gPiA+ICsgICAgICAgICAgICAg
bnAtPmZ3bm9kZS5mbGFncyB8PSBGV05PREVfRkxBR19CRVNUX0VGRk9SVDsKPiA+ID4gPiA+ICsK
PiA+ID4KPiA+ID4gRGVmaW5pdGUgTmFjay4gWW91IGFyZSBwcmV0dHkgbXVjaCBkaXNhYmxpbmcg
ZndfZGV2bGluayBmb3IgYWxsCj4gPiA+IGludGVycnVwdCBjb250cm9sbGVycy4gVGhlcmUgYXJl
IHBsZW50eSBvZiBleGFtcGxlcyBvZiB0aGUgSVJRIGRyaXZlcnMKPiA+ID4gYmVpbmcgbmVlZGVk
IHZlcnkgZWFybHkgb24gYW5kIHN0aWxsIHByb2JpbmcgcHJvcGVybHkgd2l0aG91dCB0aGUgbmVl
ZAo+ID4gPiBmb3IgdGhpcyBmbGFnLiBQbGVhc2UgZml4IHlvdXIgZHJpdmVyL0RULgo+ID4KPiA+
IE9rYXksIEkgd2lsbCB0cnkgdG8gc2V0IEZXTk9ERV9GTEFHX0JFU1RfRUZGT1JUIG9ubHkgZm9y
Cj4gPiBBUExJQyBkZXZpY2Vfbm9kZSB2aWEgSVJRQ0hJUF9ERUNMQVJFKCkuCj4KPiBObywgbXkg
cG9pbnQgaXMgdGhhdCB5b3UgdmVyeSBsaWtlbHkgZG9uJ3QgbmVlZCB0byB1c2UgdGhhdCBmbGFn
Lgo+Cj4gV2hhdCBleGFjdGx5IGlzIHRoZSBwcm9ibGVtIHlvdSBhcmUgZmFjaW5nPyBQb2ludCB0
byBhbiBleGFtcGxlIFJJU0MtVgo+IGR0cyAobm90IGR0c2kpIGluIHVwc3RyZWFtIGFuZCBnaXZl
IHNwZWNpZmljcyBwbGVhc2UuCgpUaGUgQVBMSUMgaXJxY2hpcCBkcml2ZXIgYWRkZWQgYnkgdGhp
cyBzZXJpZXMgaXMgYSBwbGF0Zm9ybSBkcml2ZXIuIEl0CnVzZWQgdG8gd29yayBmaW5lIHdpdGhv
dXQgc2V0dGluZyBGV05PREVfRkxBR19CRVNUX0VGRk9SVApmbGFnIGluIGZ3bm9kZSBidXQgYWZ0
ZXIgY29tbWl0IDhmNDg2Y2FiMjYzYyB0aGUgQVBMSUMgaXJxY2hpcApkcml2ZXIgZGlkIG5vdCBw
cm9iZSBoZW5jZSB0aGlzIGZpeC4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
