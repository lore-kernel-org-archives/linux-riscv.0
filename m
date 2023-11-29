Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302A7C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 06:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GIcjI2qIcaH5GtOsPXIDWrw0r0/8IhuJQaB8M0+TuiY=; b=clUifQbIkWJVHf
	lYABE8w75GCK7i6mZ8GZMj8hCL1urFdMolE0AMGhyN1Tzh+MXrIc7ckH7MUzqsWverDq178GYb5nQ
	M5RRgCRfACZU24Uvs7oFSAk7w6Ne71NsUqGNn6YxT0cCTA3xA9WgPje68G+fsKTfEovXtclUfuiUL
	+mfr+R+kzADJu0HYspkH0aUmxbSLMW/vFOCYBRrB0neOqKZgZM8x+mhF7qBDzJ07CpyghaTUVxRNX
	TL+KtMKDOYUcDnF8kllAGmMFCIN0G50JIW7kSDYVpsApMAk4Kuyc8nL3vP8J/rfsGTX2ZSBvaq/hC
	LSM6b+E5FagzxtAlOjOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8EK1-007GUF-1F;
	Wed, 29 Nov 2023 06:45:21 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8EJy-007GTT-0h;
	Wed, 29 Nov 2023 06:45:19 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 3AT6hinY004282;
	Wed, 29 Nov 2023 14:43:44 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Wed, 29 Nov 2023 14:43:41 +0800
Date: Wed, 29 Nov 2023 14:43:37 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v4 04/13] dt-bindings: riscv: Add Andes interrupt
 controller compatible string
Message-ID: <ZWbdmRFfhMcQY_zS@APC323>
References: <20231122121235.827122-1-peterlin@andestech.com>
 <20231122121235.827122-5-peterlin@andestech.com>
 <CA+V-a8t+vgrwDe9OxqMNHdcVX+qq76DuskF0ETCri4VeP-FAbg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8t+vgrwDe9OxqMNHdcVX+qq76DuskF0ETCri4VeP-FAbg@mail.gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3AT6hinY004282
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_224518_700068_C8FE924D 
X-CRM114-Status: GOOD (  21.35  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, jszhang@kernel.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUHJhYmhha2FyLAoKT24gRnJpLCBOb3YgMjQsIDIwMjMgYXQgMDM6MDM6NTFQTSArMDAwMCwg
TGFkLCBQcmFiaGFrYXIgd3JvdGU6Cj4gT24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgMTI6MTjigK9Q
TSBZdSBDaGllbiBQZXRlciBMaW4KPiA8cGV0ZXJsaW5AYW5kZXN0ZWNoLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gQWRkICJhbmRlc3RlY2gsY3B1LWludGMiIGNvbXBhdGlibGUgc3RyaW5nIHRvIGluZGlj
YXRlIHRoYXQKPiA+IEFuZGVzIHNwZWNpZmljIGxvY2FsIGludGVycnVwdCBpcyBzdXBwb3J0ZWQg
b24gdGhlIGNvcmUsCj4gPiBlLmcuIEFYNDVNUCBjb3JlcyBoYXZlIDMgdHlwZXMgb2Ygbm9uLXN0
YW5kYXJkIGxvY2FsIGludGVycnVwdAo+ID4gY2FuIGJlIGhhbmRsZWQgaW4gc3VwZXJ2aXNvciBt
b2RlOgo+ID4KPiA+IC0gU2xhdmUgcG9ydCBFQ0MgZXJyb3IgaW50ZXJydXB0Cj4gPiAtIEJ1cyB3
cml0ZSB0cmFuc2FjdGlvbiBlcnJvciBpbnRlcnJ1cHQKPiA+IC0gUGVyZm9ybWFuY2UgbW9uaXRv
ciBvdmVyZmxvdyBpbnRlcnJ1cHQKPiA+Cj4gPiBUaGVzZSBpbnRlcnJ1cHRzIGFyZSBlbmFibGVk
L2Rpc2FibGVkIHZpYSBhIGN1c3RvbSByZWdpc3Rlcgo+ID4gU0xJRSBpbnN0ZWFkIG9mIHRoZSBz
dGFuZGFyZCBpbnRlcnJ1cHQgZW5hYmxlIHJlZ2lzdGVyIFNJRS4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBZdSBDaGllbiBQZXRlciBMaW4gPHBldGVybGluQGFuZGVzdGVjaC5jb20+Cj4gPiAtLS0K
PiA+IENoYW5nZXMgdjEgLT4gdjI6Cj4gPiAgIC0gTmV3IHBhdGNoCj4gPiBDaGFuZ2VzIHYyIC0+
IHYzOgo+ID4gICAtIFVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UKPiA+ICAgLSBGaXhlZCBwb3NzaWJs
ZSBjb21wYXRpYmxlcyBmb3IgQW5kZXMgSU5UQwo+ID4gQ2hhbmdlcyB2MyAtPiB2NDoKPiA+ICAg
LSBBZGQgY29uc3QgZW50cnkgaW5zdGVhZCBvZiBlbnVtIChTdWdnZXN0ZWQgYnkgQ29ub3IpCj4g
PiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55
YW1sIHwgNiArKysrKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcmlzY3YvY3B1cy55YW1sCj4gPiBpbmRleCBmMzkyZTM2N2Q2NzMuLjUwMzA3NTU0NDc4ZiAx
MDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9j
cHVzLnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNj
di9jcHVzLnlhbWwKPiA+IEBAIC0xMDAsNyArMTAwLDExIEBAIHByb3BlcnRpZXM6Cj4gPiAgICAg
ICAgICBjb25zdDogMQo+ID4KPiA+ICAgICAgICBjb21wYXRpYmxlOgo+ID4gLSAgICAgICAgY29u
c3Q6IHJpc2N2LGNwdS1pbnRjCj4gPiArICAgICAgICBvbmVPZjoKPiA+ICsgICAgICAgICAgLSBp
dGVtczoKPiA+ICsgICAgICAgICAgICAgIC0gY29uc3Q6IGFuZGVzdGVjaCxjcHUtaW50Ywo+IGdp
dmVuIHRoYXQgdGhlIGZpcnN0IHBhdGNoIHJlbmFtZXMgYW5kZXN0ZWNoIC0+IGFuZGVzLCBkbyB5
b3Ugd2FudCB0bwo+IGZvbGxvdyB0aGUgc2FtZSBoZXJlPwoKVGhhbmtzIGZvciBwb2ludGluZyB0
aGlzIG91dC4KV2Ugd291bGQgbGlrZSB0byB1c2UgImFuZGVzdGVjaCIgZm9yIGNvbXBhdGlibGUg
c3RyaW5nLgoKRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhl
cy55YW1sCjExODogICJeYW5kZXN0ZWNoLC4qIjoKMTE5LSAgICBkZXNjcmlwdGlvbjogQW5kZXMg
VGVjaG5vbG9neSBDb3Jwb3JhdGlvbgoKPiA+ICsgICAgICAgICAgICAgIC0gY29uc3Q6IHJpc2N2
LGNwdS1pbnRjCj4gPiArICAgICAgICAgIC0gY29uc3Q6IHJpc2N2LGNwdS1pbnRjCj4gPgo+ID4g
ICAgICAgIGludGVycnVwdC1jb250cm9sbGVyOiB0cnVlCj4gPgo+IFJldmlld2VkLWJ5OiBMYWQg
UHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+CgpUaGFu
a3MgZm9yIHRoZSByZXZpZXchCgpCZXN0IHJlZ2FyZHMsClBldGVyIExpbgoKPiBDaGVlcnMsCj4g
UHJhYmhha2FyCj4gCj4gPiAtLQo+ID4gMi4zNC4xCj4gPgo+ID4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
