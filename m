Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDFEFEA812
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 06:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0aelih6sGg0NCIeblVD317dTtoVbbYIDuaQ3DFcWPh4=; b=brv/nckA/Hhc9I
	bXm7dtKVMTiM2OLd82s4iArU6At9o6gdwGlrPJfoDVM2Po6cEWTNIkZWdHkEQ0uqs0TwaGPBPq99P
	Xt5OaA+zsOiP1NW+eYEyc7ovVa5Zjt3szAIJiieB8kZEWBIV7phOC7RsxhfejpX5EslexLEjZHdjF
	xtTwmDS9H8TvQaANuwsAXvbMjsqtyJjUAjlHfoB86ytjedeeoMoCB17njwqWfxuDK5ludwLqAwP4S
	XSPdqaWyxOBclTrE4E5gcmMcKmBmTKCnP1wgULXZceM+SXE06gskCRvAFhhJqhUFHdWuhOk0glQTj
	0FxTqUTJGJcPQmERsEig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5I3c-00000002oAq-3Ygl;
	Wed, 25 Mar 2026 06:49:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5I3a-00000002oAR-2T5g
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 06:49:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 315AA42B1E;
	Wed, 25 Mar 2026 06:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF05C4CEF7;
	Wed, 25 Mar 2026 06:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774421372;
	bh=95lYTHue/SdDp6ojzfWgmuRBAdbrr1zdE10hcBzkT8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Poa8f0jFKuo0FR0TIFYW5lnZ4Esi2lG789Iuvn508VlWg6pidvRWVFd5BOjI6A0ig
	 X169JeQO0tQ+Jxq7hKChtXPEr0vplFxUoY5Gsei8moHQYOODwCCaLcCnB/Wa/xH3jf
	 /pIt6lUwMupiKyma5ip2JSNY74ir4tvblSy1qdltE1T3eNkKgW1OqhQK93Bj+Tfs0g
	 1mBRn5hRstd4YmR7QabFxeQa48YB90Hf6XvJEgXF3Hg4W4bxbgSSq5xihcUZNL/8Ac
	 +7YQzA8R97pIO54/iG6IkR3/7kGdJL4R2ghdbZzOvyGNdAhwsrhmsRS1M4sBMlyUd1
	 1g14/qrSpVcVQ==
Date: Tue, 24 Mar 2026 23:49:29 -0700
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Subject: Re: [External] [PATCH RFC v2 06/17] RISC-V: QoS: define CBQRI
 resctrl resources and domains
Message-ID: <acOFef6f9og1hft2@gen8>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
 <20260128-ssqosid-cbqri-v2-6-dca586b091b9@kernel.org>
 <CAEEQ3wmuAnHU1VBFDwbCBFb8j63ZcizJ3jEC2SiVWnoMPc4=SA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wmuAnHU1VBFDwbCBFb8j63ZcizJ3jEC2SiVWnoMPc4=SA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_234934_689416_5CE5EB91 
X-CRM114-Status: GOOD (  17.08  )
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
Cc: Atish Patra <atish.patra@linux.dev>, Adrien Ricciardi <aricciardi@baylibre.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, devicetree@vger.kernel.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, guo.wenjia23@zte.com.cn, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Peter Newman <peternewman@google.com>, x86@kernel.org, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, Dave Martin <Dave.Martin@arm.com>, Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>, Chen Pei <cp0613@linux.alibaba.com>, Albert Ou <aou@eecs.berkeley.edu>, Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>, Babu Moger <babu.moger@amd.com>, Weiwei Li <liwei1518@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ved Shanbhogue <ved@rivosinc.com>, Reinette Chatre <reinette.chatre@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, Tony Luck <tony.luck@intel.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXIgMjUsIDIwMjYgYXQgMTA6MzE6MzlBTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBEcmV3LAo+IAo+IE9uIFRodSwgSmFuIDI5LCAyMDI2IGF0IDQ6MjjigK9BTSBEcmV3
IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gRGVmaW5lIGRhdGEg
c3RydWN0dXJlcyB0byBlbmNhcHN1bGF0ZSB0aGUgcmVzY3RybCByZXNvdXJjZQo+ID4gYW5kIGRv
bWFpbiBzdHJ1Y3R1cmVzLgo+ID4KPiA+IENvLWRldmVsb3BlZC1ieTogQWRyaWVuIFJpY2NpYXJk
aSA8YXJpY2NpYXJkaUBiYXlsaWJyZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBZHJpZW4gUmlj
Y2lhcmRpIDxhcmljY2lhcmRpQGJheWxpYnJlLmNvbT4KPiA+IFtmdXN0aW5pOiByZWJhc2VkIGN1
cnJlbnQgdXBzdHJlYW1dCj4gPiBTaWduZWQtb2ZmLWJ5OiBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlA
a2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3Fvcy9pbnRlcm5hbC5o
IHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI3
IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcW9z
L2ludGVybmFsLmggYi9hcmNoL3Jpc2N2L2tlcm5lbC9xb3MvaW50ZXJuYWwuaAo+ID4gaW5kZXgg
ZmYyYzdlZmY1MGJlLi5jMDQwMmRkMDZjZmEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tl
cm5lbC9xb3MvaW50ZXJuYWwuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcW9zL2ludGVy
bmFsLmgKPiA+IEBAIC02NSw2ICs2NSwxMSBAQAo+ID4gICNkZWZpbmUgQ0JRUklfQkNfQUxMT0Nf
Q1RMX09QX1JFQURfTElNSVQgICAyCj4gPiAgI2RlZmluZSBDQlFSSV9CQ19BTExPQ19DVExfU1RB
VFVTX1NVQ0NFU1MgIDEKPiA+Cj4gPiAraW50IHFvc19yZXNjdHJsX3NldHVwKHZvaWQpOwo+ID4g
K3ZvaWQgcW9zX3Jlc2N0cmxfZXhpdCh2b2lkKTsKPiA+ICtpbnQgcW9zX3Jlc2N0cmxfb25saW5l
X2NwdSh1bnNpZ25lZCBpbnQgY3B1KTsKPiA+ICtpbnQgcW9zX3Jlc2N0cmxfb2ZmbGluZV9jcHUo
dW5zaWduZWQgaW50IGNwdSk7Cj4gPiArCj4gPiAgLyogQ2FwYWNpdHkgQ29udHJvbGxlciBoYXJk
d2FyZSBjYXBhYmlsaXRpZXMgKi8KPiA+ICBzdHJ1Y3QgcmlzY3ZfY2JxcmlfY2FwYWNpdHlfY2Fw
cyB7Cj4gPiAgICAgICAgIHUxNiBuY2Jsa3M7IC8qIG51bWJlciBvZiBjYXBhY2l0eSBibG9ja3Mg
Ki8KPiA+IEBAIC0xMjUsNCArMTMwLDI2IEBAIHN0cnVjdCBjYnFyaV9jb250cm9sbGVyIHsKPiA+
ICAgICAgICAgYm9vbCBtb25fY2FwYWJsZTsKPiA+ICB9Owo+ID4KPiA+ICtzdHJ1Y3QgY2Jxcmlf
cmVzY3RybF9yZXMgewo+ID4gKyAgICAgICBzdHJ1Y3QgcmR0X3Jlc291cmNlICAgICByZXNjdHJs
X3JlczsKPiA+ICsgICAgICAgc3RydWN0IGNicXJpX2NvbnRyb2xsZXIgY29udHJvbGxlcjsKPiA+
ICsgICAgICAgdTMyIG1heF9yY2lkOwo+ID4gKyAgICAgICB1MzIgbWF4X21jaWQ7Cj4gPiArfTsK
PiA+ICsKPiA+ICtzdHJ1Y3QgY2JxcmlfcmVzY3RybF9kb20gewo+ID4gKyAgICAgICBzdHJ1Y3Qg
cmR0X2RvbWFpbl9oZHIgICAgICAgcmVzY3RybF9kb21faGRyOwo+ID4gKyAgICAgICBzdHJ1Y3Qg
cmR0X2N0cmxfZG9tYWluICByZXNjdHJsX2N0cmxfZG9tOwo+ID4gKyAgICAgICBzdHJ1Y3QgcmR0
X21vbl9kb21haW4gICByZXNjdHJsX21vbl9kb207Cj4gPiArICAgICAgIHU2NCBjYm07Cj4gPiAr
ICAgICAgIHU2NCByYndiOwo+ID4gKyAgICAgICB1NjQgKmN0cmxfdmFsOwo+ID4gKyAgICAgICBz
dHJ1Y3QgY2JxcmlfY29udHJvbGxlciAqaHdfY3RybDsKPiA+ICt9Owo+ID4gKwo+IAo+IENhbiB3
ZSB0cmltIGRvd24gc29tZSBmaWVsZHM/IEZvciBleGFtcGxlOgo+ICBzdHJ1Y3QgY2JxcmlfcmVz
Y3RybF9yZXMgewo+ICAgICAgICAgc3RydWN0IHJkdF9yZXNvdXJjZSAgICAgcmVzY3RybF9yZXM7
Cj4gLSAgICAgICBzdHJ1Y3QgY2JxcmlfY29udHJvbGxlciBjb250cm9sbGVyOwo+ICAgICAgICAg
dTMyIG1heF9yY2lkOwo+ICAgICAgICAgdTMyIG1heF9tY2lkOwo+ICB9Owo+IAo+ICBzdHJ1Y3Qg
Y2JxcmlfcmVzY3RybF9kb20gewo+IC0gICAgICAgc3RydWN0IHJkdF9kb21haW5faGRyICAgICAg
IHJlc2N0cmxfZG9tX2hkcjsKPiAgICAgICAgIHN0cnVjdCByZHRfY3RybF9kb21haW4gIHJlc2N0
cmxfY3RybF9kb207Cj4gICAgICAgICBzdHJ1Y3QgcmR0X21vbl9kb21haW4gICByZXNjdHJsX21v
bl9kb207Cj4gLSAgICAgICB1NjQgY2JtOwo+IC0gICAgICAgdTY0IHJid2I7Cj4gICAgICAgICB1
NjQgKmN0cmxfdmFsOwo+ICAgICAgICAgc3RydWN0IGNicXJpX2NvbnRyb2xsZXIgKmh3X2N0cmw7
Cj4gIH07CgpDYW4geW91IGV4cGxhaW4gd2h5IHlvdSBkb24ndCB0aGluayB0aGVzZSBhcmUgbmVl
ZGVkPz8KClRoYW5rcywKRHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
