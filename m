Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44551CFC297
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 17:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTGw81dGYkyeDjU2NjH7bgHj++kcpJqxUPFfGiEYRbI=; b=tq/am/kTpn6eL6
	40C0+CwcdKVuxM9rnkwyHe8LXdS0nulKfZYmZkuBH8VX4xzQcCo/E/OuI4yqE6+79CPypWVdYcChz
	JKvsPQpS0+KD38njgp2rUyZOD7HSnlYMdZ2vQ5fENKe77U8EFIpLibsIUWLBFpTbvrhk1H73NwZDA
	SPeV+S2/v3SrLpIqGyluRPp45hSVqphqm9aQig5lzGPLRUerxlXOol8owfiK56uXxA/mYrY6+gr0f
	bpFr7f+/mJw3C1l5q7972Oq3Shu34x2qynTjWr8qdX5SHR6e3TubYpFi/cgV0FPQw4HJMw3wTbHOg
	3qdEnbb3hRnbMLO02qcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUqH-00000008nEZ-0Rny;
	Fri, 21 Nov 2025 17:22:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUqG-00000008nEH-0I84
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 17:22:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0FB1560515;
	Fri, 21 Nov 2025 17:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D175C4CEF1;
	Fri, 21 Nov 2025 17:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763745758;
	bh=+h/Yc1dp+CFDd2KN9AzZ5krPiFpi1l2fIrX/TdWsPiY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FV5pDfBV2jcsTBz79mbt5JpGGRP/X4G560gmlcngXYzRsGfIbM+ZvL5KLTBtIhlLD
	 PN2xJ5REsMsNWGlVLjeQdPPAjhj3zsRgkgpvMFkffUsGrbAWzHKHu2AJdmZ5kgxDp3
	 3BOIyx/M4oc+4azxtaORJCSDAGV6rw6ZkQyi1TJ7LAUpw64GiySSAEzjBM+dzS62Eb
	 Jyw4q4fjh3N4F+bRveDoC589oWd8hVQU7WS1Pwz1xKHVvYfoasCTOKyBXUlW0xTemv
	 +boYsnTURbA3mku4rsSbOEc+j4mmUyMWhTiDl1GLAadLk8TzhknO/maSWnKPRb2uji
	 UKHZ92926CMaw==
Message-ID: <88bfaf9f-4483-4bcd-b3a8-de453ce6417f@kernel.org>
Date: Fri, 21 Nov 2025 18:22:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add prefix for
 XuanTie
To: Guo Ren <guoren@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: cp0613@linux.alibaba.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, peterz@infradead.org, mingo@redhat.com,
 acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, james.clark@linaro.org, devicetree@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251121063439.2545-1-cp0613@linux.alibaba.com>
 <20251121063439.2545-2-cp0613@linux.alibaba.com>
 <20251121-able-terrestrial-spaniel-90c3cf@kuoka>
 <20251121-shortlist-coroner-b29e19293b40@spud>
 <CAJF2gTRUmUHrTsOBM82kNq2cSYmeYr9NC_ORacUnqHAefFSaWw@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAJF2gTRUmUHrTsOBM82kNq2cSYmeYr9NC_ORacUnqHAefFSaWw@mail.gmail.com>
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

T24gMjEvMTEvMjAyNSAxNDowMSwgR3VvIFJlbiB3cm90ZToKPiBPbiBGcmksIE5vdiAyMSwgMjAy
NSBhdCA4OjMx4oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPj4K
Pj4gT24gRnJpLCBOb3YgMjEsIDIwMjUgYXQgMTA6MDE6MDdBTSArMDEwMCwgS3J6eXN6dG9mIEtv
emxvd3NraSB3cm90ZToKPj4+IE9uIEZyaSwgTm92IDIxLCAyMDI1IGF0IDAyOjM0OjM2UE0gKzA4
MDAsIGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbSB3cm90ZToKPj4+PiBGcm9tOiBDaGVuIFBlaSA8
Y3AwNjEzQGxpbnV4LmFsaWJhYmEuY29tPgo+Pj4+Cj4+Pj4gQWRkIG5ldyB2ZW5kb3Igc3RyaW5n
cyB0byBkdCBiaW5kaW5ncyBmb3IgUklTQy1WIHZlbmRvciBYdWFuVGllLgo+Pj4+Cj4+Pj4gU2ln
bmVkLW9mZi1ieTogQ2hlbiBQZWkgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT4KPj4+PiAtLS0K
Pj4+PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55
YW1sIHwgMiArKwo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4+Pj4KPj4+
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1w
cmVmaXhlcy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1w
cmVmaXhlcy55YW1sCj4+Pj4gaW5kZXggZjFkMTg4MjAwOWJhLi41ZDI4YjJkYTk0Y2QgMTAwNjQ0
Cj4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVm
aXhlcy55YW1sCj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Zl
bmRvci1wcmVmaXhlcy55YW1sCj4+Pj4gQEAgLTE4MjksNiArMTgyOSw4IEBAIHBhdHRlcm5Qcm9w
ZXJ0aWVzOgo+Pj4+ICAgICAgZGVzY3JpcHRpb246IFhpbGlueAo+Pj4+ICAgICJeeG5hbm8sLioi
Ogo+Pj4+ICAgICAgZGVzY3JpcHRpb246IFhuYW5vCj4+Pj4gKyAgIl54dWFudGllLC4qIjoKPj4+
PiArICAgIGRlc2NyaXB0aW9uOiBDLVNLWSBNaWNyb3N5c3RlbXMgQ28uLCBMdGQuIChYdWFuVGll
KQo+Pj4KPj4+IFdlIGRvIG5vdCBjcmVhdGUgbmV3IHByZWZpeGVzIGZvciBleGlzdGluZyBlbnRy
aWVzLiBZb3UgaGF2ZSBhbHJlYWR5Cj4+PiBjc2t5LCBhbGliYWJhIGFuZCB0aGVhZCBhbmQgcHJv
YmFibHkgbWFueSBtb3JlLiBDaG9vc2Ugc29tZSBhcHByb3ByaWF0ZS4KPiBXZSBjb3VsZCBsZWF2
ZSB0aGUgb25lIEMtU0tZIHZlbmRvciBlbnRyeSwgaG93IGFib3V0Ogo+IAo+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbAo+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbAo+
IEBAIC0zNDcsOCArMzQ3LDggQEAgcGF0dGVyblByb3BlcnRpZXM6Cj4gICAgICBkZXNjcmlwdGlv
bjogQ3JlYXRpdmUgVGVjaG5vbG9neSBMdGQKPiAgICAiXmNyeXN0YWxmb250eiwuKiI6Cj4gICAg
ICBkZXNjcmlwdGlvbjogQ3J5c3RhbGZvbnR6IEFtZXJpY2EsIEluYy4KPiAtICAiXmNza3ksLioi
Ogo+IC0gICAgZGVzY3JpcHRpb246IEhhbmd6aG91IEMtU0tZIE1pY3Jvc3lzdGVtcyBDby4sIEx0
ZAo+ICsgICJeeHVhbnRpZSwuKiI6Cj4gKyAgICBkZXNjcmlwdGlvbjogQy1TS1kgTWljcm9zeXN0
ZW1zIENvLiwgTHRkLiAoWHVhblRpZSkKPiAgICAiXmNzb3QsLioiOgo+ICAgICAgZGVzY3JpcHRp
b246IEd1YW5nemhvdSBDaGluYSBTdGFyIE9wdG9lbGVjdHJvbmljcyBUZWNobm9sb2d5IENvLiwg
THRkCj4gICAgIl5jc3EsLioiOgo+IAo+IFRoZSBhcmNoL2Nza3kgaXMgdGhlIGFyY2hpdGVjdHVy
ZSBuYW1lLCB3aGljaCBtZWFucyAieHVhbnRpZSxjc2t5Ii4KPiAKPiBUaGUgYzgxMCBpcyB0aGUg
Q1BVIHByb2R1Y3QgbmFtZSwgd2hpY2ggbWVhbnMgInh1YW50aWUsYzgxMCIgb2YgdGhlCj4gInh1
YW50aWUsY3NreSIgYXJjaGl0ZWN0dXJlLgo+IAo+IFRoZSBjOTMwIGlzIHRoZSBDUFUgcHJvZHVj
dCBuYW1lLCB3aGljaCBtZWFucyAieHVhbnRpZSxjOTMwIi4KPiAKPj4KPj4gV2hlbiB0aGUgdmVu
ZG9yIGxpdGVyYWxseSBzYXlzICJDLVNLWSIsIGl0J3MgaGFyZCB0byBidXkgd2h5IGNza3kKPj4g
c2hvdWxkbid0IGJlIHVzZWQgaGVyZS4gWHVhbnRpZSBpcyBkZXNjcmliZWQgYXMgYmVpbmcgYSBi
cmFuZCwgd2hlcmUgYXQKPj4gbGVhc3QgdC1oZWFkIHdhcyBhIGNvbXBhbnkuIFRoaXMgc2VlbXMg
YWtpbiB0byBoYXZpbmcKPj4gInNuYXBkcmFnb24sbXNtODY2MCIgaW5zdGVhZCBvZiAicWNvbSxt
c204NjYwIiwgZm9yIGV4YW1wbGUuCj4gWWVzLCBYdWFuVGllIGlzIG5vdCBvbmx5IGEgYnJhbmQs
IGJ1dCBhbHNvIHRoZSBhYmJyZXZpYXRpb24gb2YgQy1TS1kKPiBNaWNyb3N5c3RlbXMgQ28uLCBM
dGQuCgoiWHVhblRpZSBpcyBhIGJyYW5kIiwgc28gbm90IHN1aXRhYmxlIGZvciB2ZW5kb3IgcHJl
Zml4ZXMuCgpodHRwczovL3d3dy54cnZtLmNvbS9kZWNsYXJhdGlvbgoKV2hhdCdzIG1vcmU6Cgo8
PEEgcmVmZXJlbmNlIHRvIOKAnEMtU0tZ4oCdLCDigJx3ZeKAnSBvciDigJx1c+KAnSBpcyBhIHJl
ZmVyZW5jZSB0byBDLVNLWQpNaWNyb3N5c3RlbXMgQ28uLCBMdGQuIG9mIFJvb20gPj4KClNvIGFn
YWluIGMtc2t5LgoKCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
