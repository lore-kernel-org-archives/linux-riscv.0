Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D8EEF06E3
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Feb 2026 01:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmrJvGCc6zbNqrn1dI1/Dugh4T9cmjyxUff49DMb/UA=; b=pbhoDLlEH9po85
	1JU2iq8vlQeTRoTuVdoPDfskvj3FQsUIkKtnUV3rgDRxu+oY7RsmuEr2dCgzCQsRRRrfulwzuiNz2
	iwDGEq+m6lBalFtFcC1PBKVUR/lUg6GB7x/FuYkjTO3RED1RFBhbN+BgQhHUyu+G0jKNLC5yqpZ42
	qln9wDyudWDOF+Krf2jbhsTazBDJzuYVNHX/pXE8eLn5+4SJM8xCC7CN0aNUb539HZpYJuuAEfC6Y
	Sya4Nls3qmlfIBFXe3SjcNUFLbs+GpfqOp1+pdsMWYU5ykrFaLy2RHZ3aDVhulOF2mF1i02Nhk0FU
	SC47AaAmWaSKgTxGstBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vote8-0000000CuPs-1vwu;
	Sun, 08 Feb 2026 01:31:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vote5-0000000CuPR-14bL
	for linux-riscv@lists.infradead.org;
	Sun, 08 Feb 2026 01:31:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D2FBC401C8;
	Sun,  8 Feb 2026 01:31:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5FFC116D0;
	Sun,  8 Feb 2026 01:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770514287;
	bh=RylA3pGv8inVH/Bl08iuiJfbF8raWZhZT1pwh10HYkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aNvowwG9YhSNrhXyOQ+sw+jn8QnzzIuXXbwoddP8uOcEJnnXbhDuQ2v8RNLRaZM3o
	 HkZQT/djWZF28qNC54+FfsiCIBhB2zcB//AQYlYlkyNCZty5Salk2DWOmE2wlZW2Vd
	 PM+619Tz/CvRd/b5iF5vADCAK1d46BcT3YlQ0+rdT4tdIYwXp+GVqzu7vtDPWnk+fQ
	 vrFjjyv5S7hqoVP3X6XW6OVb3sJPH5/ZbJAIzSzO9FBAr+1hPvBW01FqPojUKtIRPH
	 lABidUNG72UKryO3wyJtcTGSuQNgZ87p8/unIgVWBVcjy+YkzAFzo3oMW1J/Mik+Ca
	 8Tb0c6GwA87dQ==
Date: Sat, 7 Feb 2026 17:31:25 -0800
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Subject: Re: [External] [PATCH RFC v2 03/17] RISC-V: Add support for srmcfg
 CSR from Ssqosid ext
Message-ID: <aYfnbc3T81RRxz5r@gen8>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
 <20260128-ssqosid-cbqri-v2-3-dca586b091b9@kernel.org>
 <CAEEQ3wkqC4jFf1LGgh2c6dgGwT=tuvpFV+D4fiw40P3LZ7_8hg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wkqC4jFf1LGgh2c6dgGwT=tuvpFV+D4fiw40P3LZ7_8hg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_173129_360403_6DF07432 
X-CRM114-Status: GOOD (  26.16  )
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

T24gTW9uLCBGZWIgMDIsIDIwMjYgYXQgMTE6MTc6NTJBTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBEcmV3LAo+IAo+IE9uIFRodSwgSmFuIDI5LCAyMDI2IGF0IDQ6MjjigK9BTSBEcmV3
IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gQWRkIHN1cHBvcnQg
Zm9yIHRoZSBzcm1jZmcgQ1NSIGRlZmluZWQgaW4gdGhlIFNzcW9zaWQgSVNBIGV4dGVuc2lvbgo+
ID4gKFN1cGVydmlzb3ItbW9kZSBRdWFsaXR5IG9mIFNlcnZpY2UgSUQpLiBUaGUgQ1NSIGNvbnRh
aW5zIHR3byBmaWVsZHM6Cj4gPgo+ID4gICAtIFJlc291cmNlIENvbnRyb2wgSUQgKFJDSUQpIHVz
ZWQgZGV0ZXJtaW5lIHJlc291cmNlIGFsbG9jYXRpb24KPiA+ICAgLSBNb25pdG9yaW5nIENvdW50
ZXIgSUQgKE1DSUQpIHVzZWQgdG8gdHJhY2sgcmVzb3VyY2UgdXNhZ2UKPiA+Cj4gPiBSZXF1ZXN0
cyBmcm9tIGEgaGFydCB0byBzaGFyZWQgcmVzb3VyY2VzIGxpa2UgY2FjaGUgd2lsbCBiZSB0YWdn
ZWQgd2l0aAo+ID4gdGhlc2UgSURzLiBUaGlzIGFsbG93cyB0aGUgdXNhZ2Ugb2Ygc2hhcmVkIHJl
c291cmNlcyB0byBiZSBhc3NvY2lhdGVkCj4gPiB3aXRoIHRoZSB0YXNrIGN1cnJlbnRseSBydW5u
aW5nIG9uIHRoZSBoYXJ0Lgo+ID4KPiA+IEEgc3JtY2ZnIGZpZWxkIGlzIGFkZGVkIHRvIHRocmVh
ZF9zdHJ1Y3QgYW5kIGhhcyB0aGUgc2FtZSBmb3JtYXQgYXMgdGhlCj4gPiBzcm1jZmcgQ1NSLiBU
aGlzIGFsbG93cyB0aGUgc2NoZWR1bGVyIHRvIHNldCB0aGUgaGFydCdzIHNybWNmZyBDU1IgdG8K
PiA+IGNvbnRhaW4gdGhlIFJDSUQgYW5kIE1DSUQgZm9yIHRoZSB0YXNrIHRoYXQgaXMgYmVpbmcg
c2NoZWR1bGVkIGluLiBUaGUKPiA+IHNybWNmZyBDU1IgaXMgb25seSB3cml0dGVuIHRvIGlmIHRo
ZSB0aHJlYWRfc3RydWN0LnNybWNmZyBpcyBkaWZmZXJlbnQKPiA+IHRoYW4gdGhlIGN1cnJlbnQg
dmFsdWUgb2YgdGhlIENTUi4KPiA+Cj4gPiBBIHBlci1jcHUgdmFyaWFibGUgY3B1X3NybWNmZyBp
cyB1c2VkIHRvIG1pcnJvciB0aGF0IHN0YXRlIG9mIHRoZSBDU1IuCj4gPiBUaGlzIGlzIGJlY2F1
c2UgYWNjZXNzIHRvIEwxRCBob3QgbWVtb3J5IHNob3VsZCBiZSBzZXZlcmFsIHRpbWVzIGZhc3Rl
cgo+ID4gdGhhbiBhIENTUiByZWFkLiBBbHNvLCBpbiB0aGUgY2FzZSBvZiB2aXJ0dWFsaXphdGlv
biwgYWNjZXNzZXMgdG8gdGhpcwo+ID4gQ1NSIGFyZSB0cmFwcGVkIGluIHRoZSBoeXBlcnZpc29y
Lgo+ID4KPiA+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1zc3Fvc2lkL3Jl
bGVhc2VzL3RhZy92MS4wCj4gPiBDby1kZXZlbG9wZWQtYnk6IEtvcm5lbCBEdWzEmWJhIDxtaW5k
YWxAc2VtaWhhbGYuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogS29ybmVsIER1bMSZYmEgPG1pbmRh
bEBzZW1paGFsZi5jb20+Cj4gPiBbZnVzdGluaTogcmVuYW1lIGNzciwgcmVmYWN0b3Igc3dpdGNo
X3RvLCByZWJhc2Ugb24gdXBzdHJlYW1dCj4gPiBTaWduZWQtb2ZmLWJ5OiBEcmV3IEZ1c3Rpbmkg
PGZ1c3RpbmlAa2VybmVsLm9yZz4KWy4uXQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcW9zLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Fvcy5oCj4gPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi44NDgzMGQ3YzZkYzQKPiA+IC0t
LSAvZGV2L251bGwKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcW9zLmgKPiA+IEBA
IC0wLDAgKzEsNDEgQEAKPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAq
Lwo+ID4gKyNpZm5kZWYgX0FTTV9SSVNDVl9RT1NfSAo+ID4gKyNkZWZpbmUgX0FTTV9SSVNDVl9R
T1NfSAo+ID4gKwo+ID4gKyNpZmRlZiBDT05GSUdfUklTQ1ZfSVNBX1NTUU9TSUQKPiA+ICsKPiA+
ICsjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvanVtcF9sYWJl
bC5oPgo+ID4gKwo+ID4gKyNpbmNsdWRlIDxhc20vYmFycmllci5oPgo+ID4gKyNpbmNsdWRlIDxh
c20vY3NyLmg+Cj4gPiArI2luY2x1ZGUgPGFzbS9od2NhcC5oPgo+ID4gKwo+ID4gKy8qIGNhY2hl
ZCB2YWx1ZSBvZiBzcm1jZmcgY3NyIGZvciBlYWNoIGNwdSAqLwo+ID4gK0RFQ0xBUkVfUEVSX0NQ
VSh1MzIsIGNwdV9zcm1jZmcpOwo+ID4gKwo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBfX3N3aXRj
aF90b19zcm1jZmcoc3RydWN0IHRhc2tfc3RydWN0ICpuZXh0KQo+ID4gK3sKPiA+ICsgICAgICAg
dTMyICpjcHVfc3JtY2ZnX3B0ciA9IHRoaXNfY3B1X3B0cigmY3B1X3NybWNmZyk7Cj4gPiArICAg
ICAgIHUzMiB0aHJlYWRfc3JtY2ZnOwo+ID4gKwo+ID4gKyAgICAgICB0aHJlYWRfc3JtY2ZnID0g
UkVBRF9PTkNFKG5leHQtPnRocmVhZC5zcm1jZmcpOwo+IAo+IAo+IEZpcnN0IHNldCB0aGUgY3B1
X2xpc3QsIGFuZCB0aGVuIHRoZSBjb25kaXRpb24gdGhyZWFkX3NybWNmZyAhPQo+ICpjcHVfc3Jt
Y2ZnX3B0ciB3aWxsIG5vdCBiZSBzYXRpc2ZpZWQuIElzIGEgZGVmYXVsdCB2YWx1ZSByZXF1aXJl
ZAo+IGhlcmU/IEJvdGggY29kZSBwYXRocyBmb3IgY3B1X2xpc3QgYW5kIHRhc2tzIGFyZSBjb21w
YXJlZCBhZ2FpbnN0IHRoZQo+IGRlZmF1bHQgdmFsdWU7IHlvdSBtYXkgcmVmZXIgdG8gdGhlIGlt
cGxlbWVudGF0aW9uIG9mIG1wYW0uCgpJJ20gaGF2aW5nIHRyb3VibGUgZmluZGluZyBjcHVfbGlz
dCBidXQgSSB0aGluayB0aGF0IGl0IGRvZXMgbWFrZSBzZW5zZQp0byBzZXQgdGhlIGluaXRpYWwg
dmFsdWUuCgpXZXJlIHlvdSB0aGlua2luZyBJIHNob3VsZCBsb29rIGF0IG1wYW1fc2V0X2NwdV9k
ZWZhdWx0cygpIGluCnRoZSBtcGFtX3Jlc2N0cmxfZ2x1ZV92NCBbMV0gYnJhbmNoPwoKVGhhbmtz
LApEcmV3CgpbMV0gaHR0cHM6Ly9naXRsYWIuYXJtLmNvbS9saW51eC1hcm0vbGludXgtYmguZ2l0
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
