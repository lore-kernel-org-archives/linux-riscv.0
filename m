Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BC11112274
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 02:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/vLDx5sqAXaIVcfgYcKF89EuhcvRIB+2We1XlZoDlso=; b=yIEgHKoveTy49V
	jlP6qb9bH1VNqFP/LIDql523Mrj30/gFljGHOnbohy4aHkLXzXPCBfxOCHUKUe4Cb5FLHWu4kGGxW
	7BBo+VyW6aLkNY4OW+WKbAS3vWAQF0y7sHSrLcJ9nms5SnDtSt6skzYpvods8J/g47olqkvC36wad
	HsCh4IS7aFdHljK40XSVWEnW2CC5ZgZpVzJuynVKRFO8zguvBFja1Gn5j97LD7b7jdSqrmw1I1Khe
	8hyJfcjWTqbsnQKXL1G2IaIPquadFDF0f4FqqwF/zNzZjzQ2yJrS8XH4D2x68ANBuUeb7BJlK0tid
	7KETmv9+2nv7RIK2bWPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w883F-0000000GdBf-3Hmf;
	Thu, 02 Apr 2026 02:44:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w883E-0000000GdBS-0IJ9;
	Thu, 02 Apr 2026 02:44:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 44AA76185D;
	Thu,  2 Apr 2026 02:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73027C4CEF7;
	Thu,  2 Apr 2026 02:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775097894;
	bh=rx9xKdXJN71RUiaBeg38q4nVQgqAHlUDWmMLMw+OMRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KqZ01y7BcMo3KNVYIEoZ/bcbwlHEokEwhhP0jPfvq21ZKJyXPqQSPvlCtu3in1Llm
	 r637XNyzJfxmLlAfwJc+24ZWBv9J2TF94o8vWKzbabJAn9WVwBatdRj+nbD1tV56AG
	 4qRQ2hzzEDNQcuTivUkNrbuJuQIrXBD9gJvICz1tmjEXft+nwWzIDdX/RwEJgne9SQ
	 5iQcbhGhE/k19kAQCbBVixW1hI/i8d82XPkU+m1Zlzv4wi9PsSitNGj4vwAPjo8EPs
	 Fi70xhpMEtUfnS5C814UiFgshcw1xajJx8y1Z42Vlqn5VkZ11sN+ZrH3Qt7hb+355c
	 o3NGYS2O/Ga4A==
Date: Wed, 1 Apr 2026 19:44:52 -0700
From: Drew Fustini <fustini@kernel.org>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH RFC v2 08/17] RISC-V: QoS: add resctrl interface for
 CBQRI controllers
Message-ID: <ac3YJMI2U/zGEBM0@x1>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
 <20260128-ssqosid-cbqri-v2-8-dca586b091b9@kernel.org>
 <DHH5NGQGQYBE.31X8OI8AKTYRU@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DHH5NGQGQYBE.31X8OI8AKTYRU@oss.qualcomm.com>
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
Cc: Atish Patra <atish.patra@linux.dev>, Adrien Ricciardi <aricciardi@baylibre.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, devicetree@vger.kernel.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, guo.wenjia23@zte.com.cn, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Peter Newman <peternewman@google.com>, x86@kernel.org, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, Dave Martin <Dave.Martin@arm.com>, Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>, Chen Pei <cp0613@linux.alibaba.com>, Albert Ou <aou@eecs.berkeley.edu>, Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>, Babu Moger <babu.moger@amd.com>, Weiwei Li <liwei1518@gmail.com>, yunhui cui <cuiyunhui@bytedance.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ved Shanbhogue <ved@rivosinc.com>, Reinette Chatre <reinette.chatre@intel.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv <linux-riscv-bounces@lists.infradead.org>, Tony Luck <tony.luck@intel.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXIgMzEsIDIwMjYgYXQgMDc6NDg6MjdQTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+IDIwMjYtMDEtMjhUMTI6Mjc6MjktMDg6MDAsIERyZXcgRnVzdGluaSA8ZnVzdGlu
aUBrZXJuZWwub3JnPjoKPiA+IEFkZCBpbnRlcmZhY2UgZm9yIENCUVJJIGNvbnRyb2xsZXIgZHJp
dmVycyB0byBtYWtlIHVzZSBvZiB0aGUgcmVzY3RybAo+ID4gZmlsZXN5c3RlbS4KPiA+Cj4gPiBD
by1kZXZlbG9wZWQtYnk6IEFkcmllbiBSaWNjaWFyZGkgPGFyaWNjaWFyZGlAYmF5bGlicmUuY29t
Pgo+ID4gU2lnbmVkLW9mZi1ieTogQWRyaWVuIFJpY2NpYXJkaSA8YXJpY2NpYXJkaUBiYXlsaWJy
ZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9y
Zz4KPiA+IC0tLQo+IAo+IEhpIERyZXcsIEkgaGF2ZSBqdXN0IGEgZmV3IG1pbm9yIGNvbW1lbnRz
IGFzIEkgbm90aWNlZCB0aGF0IHlvdSBwbGFuIHRvCj4gc2VuZCBhIG5ldyB2ZXJzaW9uIHNvb24s
IHNvIEknbGwgdHJ5IGZvciBhIHJldmlldyB0aGVuLi4uCgpUaGFua3MgZm9yIHJldmlld2luZy4K
Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcW9zL3Fvc19yZXNjdHJsLmMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9xb3MvcW9zX3Jlc2N0cmwuYwo+ID4gK3N0YXRpYyBpbnQgY2Jxcmlf
cHJvYmVfY29udHJvbGxlcihzdHJ1Y3QgY2JxcmlfY29udHJvbGxlcl9pbmZvICpjdHJsX2luZm8s
Cj4gPiArCQkJCSAgc3RydWN0IGNicXJpX2NvbnRyb2xsZXIgKmN0cmwpCj4gPiArewo+ID4gKwlp
bnQgZXJyID0gMCwgc3RhdHVzOwo+ID4gKwl1NjQgcmVnOwo+IFsuLi5dCj4gPiArCWN0cmwtPmJh
c2UgPSBpb3JlbWFwKGN0cmxfaW5mby0+YWRkciwgY3RybF9pbmZvLT5zaXplKTsKPiA+ICsJaWYg
KCFjdHJsLT5iYXNlKSB7Cj4gPiArCQlwcl93YXJuKCIlcygpOiBnb3RvIGVycl9yZWxlYXNlX21l
bV9yZWdpb24iLCBfX2Z1bmNfXyk7Cj4gCj4gTWlzc2luZyAiZXJyID0gLUUuLi4iLgoKR29vZCBw
b2ludCwgSSB3aWxsIGZpeC4KCj4gCj4gPiArCQlnb3RvIGVycl9yZWxlYXNlX21lbV9yZWdpb247
Cj4gPiArCX0KPiBbLi4uXQo+ID4gKwkJY3RybC0+dmVyX21pbm9yID0gcmVnICYgQ0JRUklfQ0Nf
Q0FQQUJJTElUSUVTX1ZFUl9NSU5PUl9NQVNLOwo+ID4gKwkJY3RybC0+dmVyX21ham9yID0gcmVn
ICYgQ0JRUklfQ0NfQ0FQQUJJTElUSUVTX1ZFUl9NQUpPUl9NQVNLOwo+IAo+IE1ham9yIHZlcnNp
b24gaXMgc2hpZnRlZC4KClRoYW5rcywgSSB3aWxsIGZpeC4KCj4gCj4gPiArCj4gPiArCQljdHJs
LT5jYy5zdXBwb3J0c19hbGxvY19vcF9mbHVzaF9yY2lkID0gKHJlZyA+PiBDQlFSSV9DQ19DQVBB
QklMSVRJRVNfRlJDSURfU0hJRlQpCj4gPiArCQkJJiBDQlFSSV9DQ19DQVBBQklMSVRJRVNfRlJD
SURfTUFTSzsKPiAKPiBGSUVMRF9HRVQoKSBjb3VsZCBiZSB1c2VkIHRvIG1ha2UgdGhlIG1hc2sr
c2hpZnQgcGF0dGVybiBuaWNlciB3aGVuCj4gZGVmaW5lZCBieSBHRU5NQVNLKCkuCgpHb29kIHBv
aW50LCBJIHdpbGwgc3dpdGNoIHRvIEdFTk1BU0sgYW5kIEZJRUxEX0dFVC4KClRoYW5rcywKRHJl
dwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
