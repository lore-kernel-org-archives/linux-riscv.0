Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D70CD343B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 14:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3upOH8MJeauZeuC9d+08AH8sq82rWnzLTBFsTd+3je8=; b=zYhrsKFZaXw0zG
	MjSce7eXn/Vo0MojF305Yn6/SPDhbNjZS7bSyYQchYJnKETlbHiZhmP89hhDDIcCIMyuAMb8W/geO
	A68pdB0bZ2rfEBJZBTHnfoXX3ACTrH3R8CBoNRfIXr1oYfBEMVDV1+H/NBEdXs923SQ99KEvKS4gU
	2V4Z/oYgrKVvx6rExLAH1t4F2IiPuIEaom5O1XYpUkW/nSWVVSGai7FLnaQEozAth9ggkW+CexcUn
	dwWb3jZxgGsBBc/7LKO9usBeRrHr2aau+4hUhhTYe0etcIEtrsWLZEmG8cj3dWAo5Str3SXgz36PU
	Q8abrxK5XBVF69msvbZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdEm-000000015bN-27VN;
	Wed, 06 May 2026 14:28:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdEk-000000015aA-0th4
	for linux-riscv@lists.infradead.org;
	Wed, 06 May 2026 14:28:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F2D2C406F5;
	Wed,  6 May 2026 14:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B67C2BCB0;
	Wed,  6 May 2026 14:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778077708;
	bh=oV6xejldxtF04ynRPRcfaU92DZaX3Oi76voGNDRWSCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B19hnQdgrh1SU62FLy+Lwehydv01ihEVYs3pik7QMTmtw3CpDkazvCSHcS+SRW9gJ
	 2dzIwCWHVmgljk92iZejREW1xA86yRX1D05e5BkCP4NEJsuEZIQH9wIzufCUWDsu7j
	 +wLBT3l4KXTI+PHIvj/7Sgmz8JjPtrMKLNmLV0A7+kFg4sx0ewmvi51+yzwGBoYmop
	 rOPjhaU9oAPrdGsbha2gDqbIH43krB/2Y7XIYerKt8vhSvwB09qREaxIlqm/+UOvij
	 naqHQWEf3GQAiqXcKWdDMCqcQJu7Iw+xxcbhjMLIBDv7sUZv0BHo3u8FDrAhJZ8kgG
	 wAXLX9bSkmTcA==
Date: Wed, 6 May 2026 07:28:26 -0700
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Subject: Re: [External] [PATCH RFC v3 04/11] RISC-V: QoS: add CBQRI hardware
 interface
Message-ID: <aftQCk7f+hpBMkl3@x1>
References: <20260414-ssqosid-cbqri-rqsc-v7-0-v3-0-b3b2e7e9847a@kernel.org>
 <20260414-ssqosid-cbqri-rqsc-v7-0-v3-4-b3b2e7e9847a@kernel.org>
 <CAEEQ3wmkSyThakHy=fe-uNAZbzGaSM=avsqdgcZ2ZTkPNvCkMA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wmkSyThakHy=fe-uNAZbzGaSM=avsqdgcZ2ZTkPNvCkMA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_072830_292437_B9B4F6D4 
X-CRM114-Status: GOOD (  15.87  )
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
Cc: x86@kernel.org, Atish Patra <atish.patra@linux.dev>, Adrien Ricciardi <aricciardi@baylibre.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-kernel@vger.kernel.org, Gong Shuai <gong.shuai@sanechips.com.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, guo.wenjia23@zte.com.cn, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J. Wysocki" <rafael@kernel.org>, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, Dave Martin <Dave.Martin@arm.com>, Len Brown <lenb@kernel.org>, Gong Shuai <gsh517@gmail.com>, Fenghua Yu <fenghua.yu@intel.com>, Chen Pei <cp0613@linux.alibaba.com>, Albert Ou <aou@eecs.berkeley.edu>, Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>, Babu Moger <babu.moger@amd.com>, Weiwei Li <liwei1518@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ved Shanbhogue <ved@rivosinc.com>, Reinette Chatre <reinette.chatre@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, Tony Luck <tony.luck@intel.com>, Peter Newman <peternewman@google.com>, Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXkgMDUsIDIwMjYgYXQgMTI6NDM6NDZQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBEcmV3LAo+IAo+IE9uIFdlZCwgQXByIDE1LCAyMDI2IGF0IDk6NTfigK9BTSBEcmV3
IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gQWRkIHRoZSBDQlFS
SSBjb250cm9sbGVyIGhhcmR3YXJlIGludGVyZmFjZSBsYXllci4KPiA+Cj4gPiBEZWZpbmUgZGF0
YSBzdHJ1Y3R1cmVzIHJlcHJlc2VudGluZyBDQlFSSSBjb250cm9sbGVyIHByb3BlcnRpZXMKPiA+
IChjYnFyaV9jb250cm9sbGVyKSBhbmQgaGFyZHdhcmUgY2FwYWJpbGl0aWVzIGZvciBjYXBhY2l0
eSBhbmQgYmFuZHdpZHRoCj4gPiBjb250cm9sbGVycyAocmlzY3ZfY2JxcmlfY2FwYWNpdHlfY2Fw
cywgcmlzY3ZfY2JxcmlfYmFuZHdpZHRoX2NhcHMpIGluCj4gPiBpbmNsdWRlL2xpbnV4L3Jpc2N2
X3Fvcy5oLgo+ID4KPiA+IERlZmluZSBNTUlPIHJlZ2lzdGVyIG9mZnNldHMsIGZpZWxkIG1hc2tz
LCBhbmQgaW50ZXJuYWwgd3JhcHBlciBzdHJ1Y3RzCj4gPiAoY2JxcmlfcmVzY3RybF9yZXMsIGNi
cXJpX3Jlc2N0cmxfZG9tLCBjYnFyaV9jb25maWcpIGluIGludGVybmFsLmguCj4gPgo+ID4gSW1w
bGVtZW50IE1NSU8gaGVscGVycyBmb3IgY2FwYWNpdHkgYmxvY2sgbWFzayBhbmQgYmFuZHdpZHRo
IHJlc2VydmF0aW9uLAo+ID4gYWxsb2MgY29udHJvbCBvcGVyYXRpb25zIGZvciBjYXBhY2l0eSBh
bmQgYmFuZHdpZHRoIGNvbnRyb2xsZXJzLCBhbmQKPiA+IHByb2JlIGZ1bmN0aW9ucyB0byBkaXNj
b3ZlciBjb250cm9sbGVyIGNhcGFiaWxpdGllcy4gQSBwZXItY29udHJvbGxlcgo+ID4gc3Bpbmxv
Y2sgc2VyaWFsaXplcyBtdWx0aS1zdGVwIE1NSU8gc2VxdWVuY2VzLgo+ID4KPiA+IENvLWRldmVs
b3BlZC1ieTogQWRyaWVuIFJpY2NpYXJkaSA8YXJpY2NpYXJkaUBiYXlsaWJyZS5jb20+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBBZHJpZW4gUmljY2lhcmRpIDxhcmljY2lhcmRpQGJheWxpYnJlLmNvbT4K
PiA+IFNpZ25lZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8ZnVzdGluaUBrZXJuZWwub3JnPgo+ID4g
LS0tCj4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ID4g
IGFyY2gvcmlzY3Yva2VybmVsL3Fvcy9pbnRlcm5hbC5oICAgIHwgIDgxICsrKysrKysKPiA+ICBh
cmNoL3Jpc2N2L2tlcm5lbC9xb3MvcW9zX3Jlc2N0cmwuYyB8IDQzMiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiA+ICBpbmNsdWRlL2xpbnV4L3Jpc2N2X3Fvcy5oICAgICAg
ICAgICB8ICA3NiArKysrKysrCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA1OTAgaW5zZXJ0aW9ucygr
KQo+ID4KWy4uXQo+ID4gKy8qIFNldCBjYXBhY2l0eSBibG9jayBtYXNrIChjY19ibG9ja19tYXNr
KSAqLwo+ID4gK3N0YXRpYyB2b2lkIGNicXJpX3NldF9jYm0oc3RydWN0IGNicXJpX2NvbnRyb2xs
ZXIgKmN0cmwsIHU2NCBjYm0pCj4gPiArewo+ID4gKyAgICAgICBpb3dyaXRlNjQoY2JtLCBjdHJs
LT5iYXNlICsgQ0JRUklfQ0NfQkxPQ0tfTUFTS19PRkYpOwo+ID4gK30KPiAKPiAgQ0JRUkkgY2Fw
YWNpdHkgbGltaXRzIGFwcGVhciB0byBpbmNsdWRlIGJvdGggY2NfYmxvY2tfbWFzayBhbmQKPiBj
Y19jdW5pdHMsIGJ1dCBvbmx5IGNjX2Jsb2NrX21hc2sgc2VlbXMgdG8gYmUgbW9kZWxlZCBoZXJl
LiBIb3cgaXMKPiBjY19jdW5pdHMgZXhwZWN0ZWQgdG8gYmUgaGFuZGxlZD8KClRoZXJlIHdhcyBu
byBtYXRjaCBmb3IgY2NfdW5pdHMgaW4gdGhlIGV4aXN0aW5nIHJlc2N0cmwgc2NoZW1hIHNvIEkg
aGFkCnBsYW5uZWQgdG8gd2FpdCB1bnRpbCB0aGUgaW5pdGlhbCBzdXBwb3J0IGlzIHJldmlld2Vk
IGFuZCBtZXJnZWQgdG8KcHJvcG9zZSBzdXBwb3J0IGZvciBjY191bml0cy4KClRoYW5rcywKRHJl
dwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
