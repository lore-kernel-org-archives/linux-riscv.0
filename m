Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EC2EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 14:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mmHHEu/vIniE+L+EAeOdig0zHjFmt0qZYIPvRsTgxUE=; b=OJ/pWtlE/I2lVX
	VBE+hYzZllPDbXbKqtgPaPzD5RpZaECKvP5j2LdtsrgvYr831uYYcvMRz8nDmhoHLim/SN3yPWHOP
	7LF3n0L7xHY3hy4cxepQbfYO9W7HIjkzMU1QGFoJyvGnUhaIQoQXKY+tcjPYzwqC8dWkTtYxjpfrq
	iiX1F5wbjMk988KlOZ9ujgPGgd4VDAQe8lSyBPxyW0NknFKFfgnqJPWC/seyH6+QbQK1FjWJKc/+2
	RJ2fIhoPZf9fVfD+GOQ9Xj6bo3A8zDKxSCUm6uJ/2OpBjKVzP1/jYSCbbzYzbtuF9kHiLvSB1TSgc
	I8GLzMH/aDAFE69AHYFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKJQE-006LiT-1h;
	Fri, 14 Jul 2023 14:05:26 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKJQA-006Lhn-1i
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 14:05:24 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fbc0314a7bso3288626e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 07:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1689343518; x=1691935518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnFTCmfQr51Jyi3FZr0J8MFBJPMMvcfdmJ7yH61hf14=;
        b=NpgncndOWMiRR8Xyml8UoEY1xzREMaqFk6QiyYloSb5x6ozVoS1i4YFMkBiWcERulW
         CadO6Ij+N310y5vrkesaZ6tl6T1Fz7F5oo+XTtkocuAI0QTCISMoteiXsdUdKBwIBCqg
         6PDiAayVs2G/7MzXv6OnGG7u27l4Dx9v2dZm1sRTK3YRjDOCaovkEIVtNu2W1ulxZ+2S
         CR7kRszFBFq72utvKF16frB9IgQnWfk84FQsK0alxT2lmo9lUUD1Oo8gFCRZpCZN7+om
         Af8mcFXOm+BMxU7HPEASSRQJcwdJt1cUNsn0OTzfl7cjytcsOqjKW+n44Y/X0QgOTkIi
         fE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689343518; x=1691935518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YnFTCmfQr51Jyi3FZr0J8MFBJPMMvcfdmJ7yH61hf14=;
        b=i3SLZ8n5ejWrmdUGTOtuC+BrRf6opMx0gKve3roV5soCUeBAKSxcqw+BmoFg8RMhj/
         fL+5AffpWVV3XCZvtLdluq6SYATnn5i24Wr3JDJIrResck21T2wtXno5Gvb6/Cdf8GCO
         CDua4KtvKniIK9JU5OUKGOj0BDDEJg4j32wNiWvpMvPtpzIqAcgb/kTe5NBg2Fv/amZ9
         qkyEh5bWieGBgYW63ni84cCbBQaeuLOaKGp7yBYc74ge0WD5fn/eWnhYlXncxsr/9WUC
         wjCF9EV7aQmimPh5a5ho27DN8ePTKzK6erK3yV9ZgXOzUTf1LMlYYTDt4JVDSewo7EnR
         8uqA==
X-Gm-Message-State: ABy/qLYRDAQzMHTYvxr/l+9GIHEs51yb5+IJ1yWR1lfXu7ee6H5pGV51
	oEKCiT2hmDxoHAR6Xc54uG/CpT/OWqx6e6pHVoc89w==
X-Google-Smtp-Source: APBJJlHpiApDHfRtmrkPWenZ82kudEb1Dy7+1/rcFajH80YzpIcFj6SCENrVeYhu0lDwrFpyjLGg/WUEpyGXT3oMhhQ=
X-Received: by 2002:a05:6512:340b:b0:4fb:9f24:bba9 with SMTP id
 i11-20020a056512340b00b004fb9f24bba9mr4627841lfr.5.1689343518371; Fri, 14 Jul
 2023 07:05:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230710094321.1378351-1-apatel@ventanamicro.com>
 <20230710094321.1378351-8-apatel@ventanamicro.com> <CAGETcx8kH8cJVdhcv5K4qNUo58godFZEBnOfTGKUUQ6VuUguvQ@mail.gmail.com>
 <86jzv2vpdb.wl-maz@kernel.org> <CAK9=C2ULxsXednwnoyzYKjQFpe_zBSZ4v0FqUYFnxK2TpbiMtg@mail.gmail.com>
 <86cz0uvcof.wl-maz@kernel.org>
In-Reply-To: <86cz0uvcof.wl-maz@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 14 Jul 2023 19:35:07 +0530
Message-ID: <CAAhSdy2sAaA_dmVCt9162kpw8-Ub1wjH_MNKxPOFN_VbW7M7vQ@mail.gmail.com>
Subject: Re: [PATCH v5 7/9] irqchip: Add RISC-V advanced PLIC driver
To: Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_070522_757399_4B8C8CD9 
X-CRM114-Status: GOOD (  51.47  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgNzowNeKAr1BNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCAxNCBKdWwgMjAyMyAxMDozNTozNCArMDEwMCwKPiBB
bnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJp
LCBKdWwgMTQsIDIwMjMgYXQgMjozMeKAr1BNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5lbC5vcmc+
IHdyb3RlOgo+ID4gPgo+ID4gPiBBbnVwLAo+ID4gPgo+ID4gPiBPbiBGcmksIDE0IEp1bCAyMDIz
IDAwOjU2OjIyICswMTAwLAo+ID4gPiBTYXJhdmFuYSBLYW5uYW4gPHNhcmF2YW5ha0Bnb29nbGUu
Y29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIE1vbiwgSnVsIDEwLCAyMDIzIGF0IDI6NDTi
gK9BTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPiA+ID4g
Pgo+ID4gPiA+ID4gVGhlIFJJU0MtViBhZHZhbmNlZCBpbnRlcnJ1cHQgYXJjaGl0ZWN0dXJlIChB
SUEpIHNwZWNpZmljYXRpb24gZGVmaW5lcwo+ID4gPiA+ID4gYSBuZXcgaW50ZXJydXB0IGNvbnRy
b2xsZXIgZm9yIG1hbmFnaW5nIHdpcmVkIGludGVycnVwdHMgb24gYSBSSVNDLVYKPiA+ID4gPiA+
IHBsYXRmb3JtLiBUaGlzIG5ldyBpbnRlcnJ1cHQgY29udHJvbGxlciBpcyByZWZlcnJlZCB0byBh
cyBhZHZhbmNlZAo+ID4gPiA+ID4gcGxhdGZvcm0tbGV2ZWwgaW50ZXJydXB0IGNvbnRyb2xsZXIg
KEFQTElDKSB3aGljaCBjYW4gZm9yd2FyZCB3aXJlZAo+ID4gPiA+ID4gaW50ZXJydXB0cyB0byBD
UFVzIChvciBIQVJUcykgYXMgbG9jYWwgaW50ZXJydXB0cyBPUiBhcyBtZXNzYWdlCj4gPiA+ID4g
PiBzaWduYWxlZCBpbnRlcnJ1cHRzLgo+ID4gPiA+ID4gKEZvciBtb3JlIGRldGFpbHMgcmVmZXIg
aHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWFpYSkKPiA+ID4gPiA+Cj4gPiA+ID4gPiBU
aGlzIHBhdGNoIGFkZHMgYW4gaXJxY2hpcCBkcml2ZXIgZm9yIFJJU0MtViBBUExJQyBmb3VuZCBv
biBSSVNDLVYKPiA+ID4gPiA+IHBsYXRmb3Jtcy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+ID4KPiA+ID4g
Wy4uLl0KPiA+ID4KPiA+ID4gPiA+ICtzdGF0aWMgaW50IF9faW5pdCBhcGxpY19kdF9pbml0KHN0
cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpwYXJlbnQpCj4gPiA+ID4gPiArewo+ID4gPiA+
ID4gKyAgICAgICAvKgo+ID4gPiA+ID4gKyAgICAgICAgKiBUaGUgQVBMSUMgcGxhdGZvcm0gZHJp
dmVyIG5lZWRzIHRvIGJlIHByb2JlZCBlYXJseQo+ID4gPiA+ID4gKyAgICAgICAgKiBzbyBmb3Ig
ZGV2aWNlIHRyZWU6Cj4gPiA+ID4gPiArICAgICAgICAqCj4gPiA+ID4gPiArICAgICAgICAqIDEp
IFNldCB0aGUgRldOT0RFX0ZMQUdfQkVTVF9FRkZPUlQgZmxhZyBpbiBmd25vZGUgd2hpY2gKPiA+
ID4gPiA+ICsgICAgICAgICogICAgcHJvdmlkZXMgYSBoaW50IHRvIHRoZSBkZXZpY2UgZHJpdmVy
IGNvcmUgdG8gcHJvYmUgdGhlCj4gPiA+ID4gPiArICAgICAgICAqICAgIHBsYXRmb3JtIGRyaXZl
ciBlYXJseS4KPiA+ID4gPiA+ICsgICAgICAgICogMikgQ2xlYXIgdGhlIE9GX1BPUFVMQVRFRCBm
bGFnIGluIGRldmljZV9ub2RlIGJlY2F1c2UKPiA+ID4gPiA+ICsgICAgICAgICogICAgb2ZfaXJx
X2luaXQoKSBzZXRzIGl0IHdoaWNoIHByZXZlbnRzIGNyZWF0aW9uIG9mCj4gPiA+ID4gPiArICAg
ICAgICAqICAgIHBsYXRmb3JtIGRldmljZS4KPiA+ID4gPiA+ICsgICAgICAgICovCj4gPiA+ID4g
PiArICAgICAgIG5vZGUtPmZ3bm9kZS5mbGFncyB8PSBGV05PREVfRkxBR19CRVNUX0VGRk9SVDsK
PiA+ID4gPgo+ID4gPiA+IFBsZWFzZSBzdG9wIHNwYW1taW5nIHVzIHdpdGggYnJva2VuIHBhdGNo
ZXMuIEFscmVhZHkgdG9sZCB5b3UgdGhpcyBpcwo+ID4gPiA+IG5vdCBhbiBvcHRpb24uCj4gPiA+
ID4KPiA+ID4gPiBOYWNrLgo+ID4gPgo+ID4gPiBXaGF0IHB1enpsZXMgbWUgaGVyZSBpcyB0aGF0
ICpubyBvdGhlciBhcmNoKiByZXF1aXJlcyB0aGlzIHNvcnQgb2YKPiA+ID4gaGFjay4gV2hhdCBp
cyBzbyBzcGVjaWFsIGFib3V0IHRoZSBBUExJQyB0aGF0IGl0IHJlcXVpcmVzIGl0PyBJIHNlZQo+
ID4gPiBub3RoaW5nIGluIHRoaXMgcGF0Y2ggdGhhdCBldmVuIGhpbnRzIGF0IGl0LCBkZXNwaXRl
IHRoZSAiZGlzY3Vzc2lvbiIKPiA+ID4gaW4gdGhlIGxhc3Qgcm91bmQuCj4gPiA+Cj4gPiA+IFRo
ZSBydWxlcyBhcmUgc2ltcGxlOgo+ID4gPgo+ID4gPiAtIGVpdGhlciB0aGUgQVBMSUMgaXMgc28g
ZnVuZGFtZW50YWwgdG8gdGhlIHN5c3RlbSB0aGF0IGl0IGhhcyB0byBiZQo+ID4gPiAgIGluaXRp
YWxpc2VkIHN1cGVyIGVhcmx5LCBtdWNoIGxpa2UgdGhlIEdJQyBvbiBhcm02NCwgYXQgd2hpY2gg
cG9pbnQKPiA+ID4gICBpdCBjYW5ub3QgYmUgYSBwbGF0Zm9ybSBkZXZpY2UsIGFuZCB0aGUgc3Rv
cnkgaXMgcHJldHR5IHNpbXBsZS4KPiA+ID4KPiA+ID4gLSBvciBpdCBpc24ndCB0aGF0IGZ1bmRh
bWVudGFsLCBhbmQgaXQgY2FuIGJlIHByb2JlZCBhcyBhIHBsYXRmb3JtCj4gPiA+ICAgZGV2aWNl
IHVzaW5nIHRoZSBkZXBlbmRlbmN5IGluZnJhc3RydWN0dXJlIHRoYXQgaXMgYWxyZWFkeSB1c2Vk
IGJ5Cj4gPiA+ICAgbXVsdGlwbGUgb3RoZXIgaW50ZXJydXB0IGNvbnRyb2xsZXIgZHJpdmVycywg
d2l0aG91dCBhbnkgbmVlZCB0bwo+ID4gPiAgIG1lc3Mgd2l0aCBpbnRlcm5hbCBmbGFncy4gQWdh
aW4sIHRoaXMgc2hvdWxkIGJlIHNpbXBsZSBlbm91Z2guCj4gPgo+ID4gQVBMSUMgbWFuYWdlcyBh
bGwgd2lyZWQgaW50ZXJydXB0cyB3aGVyZWFzIElNU0lDIG1hbmFnZXMgYWxsCj4gPiBNU0lzLiBC
b3RoIEFQTElDIGFuZCBJTVNJQyBhcmUgZnVuZGFtZW50YWwgZGV2aWNlcyB3aGljaCBuZWVkCj4g
PiB0byBiZSBwcm9iZWQgc3VwZXIgZWFybHkuCj4gPgo+ID4gTm93IEFQTElDIGhhcyB0d28gbW9k
ZXMgb2Ygb3BlcmF0aW9uczoKPiA+IDEpIERpcmVjdCBtb2RlIHdoZXJlIHRoZXJlIGlzIG5vIElN
U0lDIGluIHRoZSBzeXN0ZW0gYW5kIEFQTElDCj4gPiAgICAgZGlyZWN0bHkgaW5qZWN0cyBpbnRl
cnJ1cHQgdG8gQ1BVcwo+ID4gMikgTVNJIG1vZGUgd2hlcmUgSU1TSUMgaXMgcHJlc2VudCBpbiB0
aGUgc3lzdGVtIGFuZCBBUExJQwo+ID4gICAgIGNvbnZlcnRzIHdpcmVkIGludGVycnVwdHMgaW50
byBNU0lzCj4gPgo+ID4gVGhlIEFQTElDIGRyaXZlciBhZGRlZCBieSB0aGlzIHBhdGNoIGlzIGEg
Y29tbW9uIGRyaXZlciBmb3IKPiA+IGJvdGggYWJvdmUgbW9kZXMuCj4KPiBXaGljaCBpdCBkb2Vz
bid0IG5lZWQgdG8gYmUuIFlvdSBhcmUgcG9pbnRsZXNzbHkgbWFraW5nIGxpZmUgZGlmZmljdWx0
Cj4gZm9yIHlvdXJzZWxmLCBhbmQgZXZlcnlvbmUgZWxzZS4gVGhlIE1TSSBicmlkZ2UgYmVoYXZp
b3VyIGhhcyAqemVybyoKPiByZWFzb24gdG8gYmUgdGhlIHNhbWUgZHJpdmVyIGFzIHRoZSBtYWlu
ICJJIG5lZWQgaXQgc3VwZXIgZWFybHkiCj4gZHJpdmVyLiBUaGV5IG1heSBiZSBjYWxsZWQgdGhl
IHNhbWUsIGJ1dCB0aGV5ICphcmUqIGRpZmZlcmVudCB0aGluZ3MKPiBpbiB0aGUgc3lzdGVtLgo+
Cj4gVGhleSBjYW4gc2hhcmUgY29kZSwgYnV0IHRoZXkgYXJlIGZ1bmRhbWVudGFsbHkgYSBkaWZm
ZXJlbnQgdGhpbmcgaW4KPiB0aGUgc3lzdGVtLiBBbmQgSSBndWVzcyB0aGlzIHNpbGx5IGFwcHJv
YWNoIGhhcyBvdGhlciByYW1pZmljYXRpb25zOgo+IHRoZSBJTVNJQyBpcyBhbHNvIHNvbWUgZWFy
bHkgZHJpdmVyIHdoZW4gaXQgcmVhbGx5IGRvZXNuJ3QgbmVlZCB0byBiZS4KPiBXaG8gbmVlZHMg
TVNJcyB0aGF0IGVhcmx5IGluIHRoZSBsaWZlIG9mIHRoZSBzeXN0ZW0/IEkgZG9uJ3QgYnV5IHRo
aXMKPiBmb3IgZXZlbiBhIHNlY29uZC4KCklNU0lDIGFsc28gcHJvdmlkZXMgSVBJcyB3aGljaCBh
cmUgcmVxdWlyZWQgc3VwZXIgZWFybHkgc28gSSB0aGluawp3ZSBjYW4ndCBtYWtlIElNU0lDIGFz
IGEgcGxhdGZvcm0gZHJpdmVyLgoKPgo+IEZyYW5rbHksIHRoaXMgd2hvbGUgdGhpbmcgbmVlZHMg
dG8gYmUgdGFrZW4gYXBhcnQgYW5kIHJlYnVpbHQgZnJvbSB0aGUKPiBncm91bmQgdXAuCj4KPiA+
IEZvciAjMiwgQVBMSUMgbmVlZHMgdG8gYmUgYSBwbGF0Zm9ybSBkZXZpY2UgdG8gY3JlYXRlIGEg
ZGV2aWNlCj4gPiBNU0kgZG9tYWluIHVzaW5nIHBsYXRmb3JtX21zaV9jcmVhdGVfZGV2aWNlX2Rv
bWFpbigpIHdoaWNoCj4gPiBpcyB3aHkgdGhlIEFQTElDIGRyaXZlciBpcyBhIHBsYXRmb3JtIGRy
aXZlci4KPgo+IFlvdSBjYW4ndCBoYXZlIHlvdXIgY2FrZSBhbmQgZWF0IGl0LiBJZiBuZWVkZWQg
c3VwZXIgZWFybHksIGFuZCBpdAo+IGNhbm5vdCBiZSBhIHBsYXRmb3JtIGRyaXZlci4gRW5kIG9m
IHRoZSBzdG9yeS4KPgo+IEFuZCB0byBteSBlYXJsaWVyIHBvaW50OiBJTVNJQyBhbmQgQVBMSUMt
YXMtTVNJLWJyaWRnZSBoYXZlIG5vIHB1cnBvc2UKPiBiZWluZyBlYXJseSBkcml2ZXJzLiBUaGV5
IG11c3QgYmUgcGxhdGZvcm0gZHJpdmVycywgYW5kIG9ubHkgdGhhdC4KCldlIGNhbiBoYXZlIElN
U0lDIGFuZCBBUExJQy1EaXJlY3QtTW9kZSBhcyBub24tcGxhdGZvcm0gZHJpdmVyCndoZXJlYXMg
QVBMSUMtYXMtTVNJLWJyaWRnZSB3aWxsIGJlIGEgcGxhdGZvcm0gZHJpdmVyLgoKQm90aCBBUExJ
Qy1EaXJlY3QtTW9kZSBhbmQgQVBMSUMtYXMtTVNJLWJyaWRnZSBjYW4gc2hhcmUgYSBsYXJnZQpw
YXJ0IG9mIHRoZSBjdXJyZW50IGRyaXZlci4KCj4KPiA+ID4gSWYgdGhlc2UgcnVsZXMgZG9uJ3Qg
YXBwbHkgdG8geW91ciBzdHVmZiwgcGxlYXNlIGV4cGxhaW4gd2hhdCBpcyBzbwo+ID4gPiBkaWZm
ZXJlbnQuIEFuZCBJIG1lYW4gYWN0dWFsbHkgZXhwbGFpbiB0aGUgaXNzdWUuIFdoaWNoIGlzbid0
IHRlbGxpbmcKPiA+ID4gdXMgIml0IGRvZXNuJ3Qgd29yayB3aXRob3V0IGl0Ii4gQmVjYXVzZSBh
cyB0aGluZ3Mgc3RhbmQsIHRoZXJlIGlzIG5vCj4gPiA+IHdheSBJIHdpbGwgZXZlbiBjb25zaWRl
ciB0YWtpbmcgdGhpcyB1Z2x5IG1peCBvZiBwcm9iaW5nIG1ldGhvZHMuCj4gPgo+ID4gWWVzLCBJ
IGRvbid0IHdhbnQgdGhpcyB1Z2x5IEZXTk9ERV9GTEFHX0JFU1RfRUZGT1JUIGhhY2sKPiA+IGlu
IHRoaXMgZHJpdmVyLgo+Cj4gQW5kIHlldCB5b3UgYXJlIGhhbW1lcmluZyBpdCBldmVuIHdoZW4g
dG9sZCB0aGlzIGlzIHdyb25nLgo+Cj4gPiBJIHRyaWVkIHNldmVyYWwgdGhpbmdzIGJ1dCBzZXR0
aW5nIHRoZSBGV05PREVfRkxBR19CRVNUX0VGRk9SVAo+ID4gZmxhZyBpcyB0aGUgb25seSB0aGlu
ZyB3aGljaCB3b3JrcyByaWdodCBub3cuCj4KPiBIb3cgYWJvdXQgeW91IHRha2UgYSBzdGVwIGJh
Y2sgYW5kIHJlYWxpc2UgdGhhdCB0aGUgd2F5IHlvdSd2ZQo+IGFyY2hpdGVjdGVkIHlvdXIgZHJp
dmVycyBtYWtlcyBsaXR0bGUgc2Vuc2U/IEkgZG9uJ3QgdGhpbmsgeW91IGhhdmUKPiB0cmllZCAq
dGhhdCouCgpCb3RoIEFQTElDIGFuZCBJTVNJQyBhcmUgc2VwYXJhdGUgZGV2aWNlcyBhcyBkZWZp
bmVkIGJ5IHRoZSBBSUEgc3BlYy4KClRoZXJlIGFyZSB0aHJlZSBwb3NzaWJsZSBzeXN0ZW1zOgox
KSBTeXN0ZW1zIHdpdGggb25seSBBUExJQyAoaS5lLiBvbmx5IHdpcmVkIGludGVycnVwdHMpCjIp
IFN5c3RlbXMgd2l0aCBvbmx5IElNU0lDIChpLmUuIG9ubHkgTVNJcykKMykgU3lzdGVtcyB3aXRo
IGJvdGggQVBMSUMgYW5kIElNU0lDIChpLmUuIGJvdGggd2lyZWQgaW50ZXJydXB0cyBhbmQgTVNJ
cykKClRvIGFkZHJlc3MgdGhlIGFib3ZlLCBBUExJQyBhbmQgSU1TSUMgYXJlIHNlcGFyYXRlIGRy
aXZlcnMuIEkgYW0gb2theQp3aXRoIHNwbGl0dGluZyB0aGUgQVBMSUMgZHJpdmVyIGludG8gdHdv
IHNlcGFyYXRlIGRyaXZlcnMgLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
