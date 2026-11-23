Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E065606A32D
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 04:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0zP+dKc9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m3oxTjVF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8BTjP6GaaFNHClV6D31zpuhNDse+sXGiE/OnmvcKK6w=; b=0zP+dKc9zrqbfrt9h08qu4B0Kw
	qDZ0d8gPQMmrN2yfaDj9DmoxhfR0jnCLOyOoRIFrw6M0Ly47j5Anqq8draiSFvCajE4wPfo6bLGdX
	ZlVDCv4w22cU1h0A79355WZ7B+TWcGwvoFXMWsfhITUN7AzEB78sRoSRPbfS81/LppJiXmNyZbl2X
	cG1QfYg45LZ/UoQFwDCwymnGk58lKpd+x4wSqhnzpfubeux/hZpPk66TF6gP6hpcrT7WiXvKVheC1
	/M+iWYs1VeCa323pY2SGThcx05dGm+npNOaBvnl+e2FK6EYyOBcYaMnXmEdEjN89Aj3B1tB6FhJcn
	xEu+giQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVLW1-00000002FD1-0JGt;
	Mon, 23 Nov 2026 04:18:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVLW0-00000002FCu-2J6H
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 04:18:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C9F9609A2;
	Mon, 23 Nov 2026 04:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0721F000CA;
	Mon, 23 Nov 2026 04:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795407531;
	bh=MGZTPWp2i4b94VE9SMcXmz9d4hQmCYdTz5/vft8xoW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m3oxTjVF5biHPKVWTSY79juLWKEZ0+RTPYDlJ5CJmY9SGsdu0TOngsvFoxhkls/EP
	 BnvYHwP1idyvXSmvcGwCoMcH5hrCdQ4+dGxoN4bMBLfluGN9WNgkeFdPdpuRyz65lg
	 iTo7NEmXEld3M/+IFXsPt58MeIEk3pztNAfEKdKXrUgj69z+rvLSvtvjCkzI7eu2As
	 zz5kyhXI4Xl4UfrcrDiMlFrzhgpISf/3LqB/eMjEB9bNewn02JTdkNIGibC6HrL2oW
	 JmvcIXYA8GXMMgdUO+NWqR+sBE9dz1lQ2ETl9VYVjvwXFjRNwt97Op9plcGFNjXQhE
	 cM97/u1q8+sPw==
Date: Sun, 22 Nov 2026 20:18:49 -0800
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	Tony Luck <tony.luck@intel.com>, Weiwei Li <liwei1518@gmail.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zeng Heng <zengheng@picoheart.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [External] Re: [PATCH v12 1/5] riscv_cbqri: Add capacity
 controller core
Message-ID: <awO-qQe0s0Jp-142@thelio>
References: <20261114-dfustini-atl-sc-cbqri-dt-v12-0-6ef1f627072d@kernel.org>
 <20261114-dfustini-atl-sc-cbqri-dt-v12-1-6ef1f627072d@kernel.org>
 <20261119000846.776930b3@jic23-hlaptop>
 <CAEEQ3w=voZYrfcMuKC_SQG9U8hYN_thcc02nf_PgMu5UyuG32Q@mail.gmail.com>
 <av-WvzoxSv7QpMhQ@thelio>
 <CAEEQ3w=zXTYjAoWcBZB_CSVYKsbOSjGvp4JW63HET_BwLnW1Nw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3w=zXTYjAoWcBZB_CSVYKsbOSjGvp4JW63HET_BwLnW1Nw@mail.gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgMjAsIDIwMjYgYXQgMDU6MzA6NTlQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBEcmV3LAo+IAo+IE9uIEZyaSwgTm92IDIwLCAyMDI2IGF0IDg6MznigK9BTSBEcmV3
IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBOb3Yg
MTksIDIwMjYgYXQgMDc6MDA6MjFQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90ZToKPiA+ID4gSGkg
RHJldywKPiA+ID4KPiA+ID4gT24gVGh1LCBOb3YgMTksIDIwMjYgYXQgODowOeKAr0FNIEpvbmF0
aGFuIENhbWVyb24gPGppYzIzQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24g
U2F0LCAxNCBOb3YgMjAyNiAxNDowNjoyMSAtMDgwMAo+ID4gPiA+IERyZXcgRnVzdGluaSA8ZnVz
dGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+ID4gQWRkIHRoZSBjb3JlIGZv
ciBSSVNDLVYgQ0JRUkkgY2FwYWNpdHkgY29udHJvbGxlcnM6IHRoZSByZWdpc3Rlcgo+ID4gPiA+
ID4gbGF5b3V0LCB0aGUgY2FwYWJpbGl0eSBwcm9iZSwgYW5kIHRoZSBhbGxvY2F0aW9uIG9wZXJh
dGlvbnMgdGhhdAo+ID4gPiA+ID4gcHJvZ3JhbSBhIGNhcGFjaXR5IGJsb2NrIG1hc2sgZm9yIGFu
IFJDSUQgYW5kIHJlYWQgaXQgYmFjay4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBBIGRpc2NvdmVyeSBs
YXllciBtYXBzIHRoZSByZWdpc3RlciBibG9jayBhbmQgZGVzY3JpYmVzIHRoZSBjb250cm9sbGVy
Cj4gPiA+ID4gPiBpbiBhIGNicXJpX2NvbnRyb2xsZXJfaW5mbyBkZXNjcmlwdG9yLiByaXNjdl9j
YnFyaV9yZWdpc3Rlcl9jYygpIHByb2Jlcwo+ID4gPiA+ID4gdGhlIGNvbnRyb2xsZXIgZnJvbSB0
aGF0IGRlc2NyaXB0b3IgYW5kIGFkZHMgaXQgdG8gdGhlIGNvbnRyb2xsZXIgbGlzdCwKPiA+ID4g
PiA+IHdoaWNoIHN0YXlzIHByaXZhdGUgdG8gdGhlIGNvcmUuIFRoZSBjb3JlIG93bnMgdGhlIGNv
bnRyb2xsZXIgc3RhdGUKPiA+ID4gPiA+IGFmdGVyIHJlZ2lzdHJhdGlvbiwgc28gbm90aGluZyBp
biBpdCBkZXBlbmRzIG9uIGhvdyB0aGUgY29udHJvbGxlciB3YXMKPiA+ID4gPiA+IGRpc2NvdmVy
ZWQuIFRoZSBjYWxsZXIga2VlcHMgdGhlIHJlZ2lzdGVyIG1hcHBpbmcgYWxpdmUuCj4gPiA+ID4g
Pgo+ID4gPiA+ID4gVGVzdGVkLWJ5OiBaZW5nIEhlbmcgPHplbmdoZW5nQHBpY29oZWFydC5jb20+
Cj4gPiA+ID4gPiBSZXZpZXdlZC1ieTogWmVuZyBIZW5nIDx6ZW5naGVuZ0BwaWNvaGVhcnQuY29t
Pgo+ID4gPiA+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBBZHJpZW4gUmljY2lhcmRpIDxhcmljY2lhcmRp
QGJheWxpYnJlLmNvbT4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFkcmllbiBSaWNjaWFyZGkg
PGFyaWNjaWFyZGlAYmF5bGlicmUuY29tPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRHJldyBG
dXN0aW5pIDxmdXN0aW5pQGtlcm5lbC5vcmc+Cj4gPiBbLi5dCj4gPiA+ID4gPiArICAgICAvKiBU
aGUgcmVzY3RybCBnbHVlIGtleXMgaXRzIGRvbWFpbnMgb24gY2FjaGVfaWQsIG9uZSBjb250cm9s
bGVyIGVhY2guICovCj4gPiA+ID4gPiArICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KG90aGVyLCAm
Y2JxcmlfY29udHJvbGxlcnMsIGxpc3QpIHsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgaWYgKG90
aGVyLT5jYWNoZS5jYWNoZV9sZXZlbCA9PSBpbmZvLT5jYWNoZV9sZXZlbCAmJgo+ID4gPiA+ID4g
KyAgICAgICAgICAgICAgICAgb3RoZXItPmNhY2hlLmNhY2hlX2lkID09IGluZm8tPmNhY2hlX2lk
KSB7Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgcHJfd2FybigiQ0MgYXQgJXBhIGR1
cGxpY2F0ZXMgdGhlIEwldSBjYWNoZSBpZCAldSBjb250cm9sbGVyIGF0ICVwYSwgc2tpcHBpbmdc
biIsCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmY3RybC0+YWRkciwg
aW5mby0+Y2FjaGVfbGV2ZWwsIGluZm8tPmNhY2hlX2lkLAo+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgJm90aGVyLT5hZGRyKTsKPiA+ID4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gLUVFWElTVDsKPiA+ID4KPiA+ID4gQSBjb250cm9sbGVyIHdpdGggdGhl
IHNhbWUgY2FjaGUgbGV2ZWwgYW5kIENhY2hlIElEIGlzIG5vdCBuZWNlc3NhcmlseQo+ID4gPiBh
IGR1cGxpY2F0ZS4gQSBkaXN0cmlidXRlZCBMTEMgbWF5IGhhdmUgbXVsdGlwbGUgcGh5c2ljYWwg
Y29udHJvbGxlcnMKPiA+ID4gbWFuYWdpbmcgdGhlIHNhbWUgbG9naWNhbCBMMyByZXNvdXJjZS4K
PiA+ID4KPiA+ID4gTWF0Y2hpbmcgY29udHJvbGxlcnMgc2hvdWxkIGluc3RlYWQgYmUgZ3JvdXBl
ZCBpbnRvIGEgbG9naWNhbCBjb21wb25lbnQKPiA+ID4ga2V5ZWQgYnkgKGNhY2hlX2xldmVsLCBj
YWNoZV9pZCksIHdpdGggdGhlIHBoeXNpY2FsIGNvbnRyb2xsZXJzIGtlcHQgaW4KPiA+ID4gYSBs
aW5rZWQgbGlzdC4gVXNlciBzcGFjZSB3b3VsZCBzZWUgb25lIGxvZ2ljYWwgY29udHJvbGxlciBh
cyBhIHNpbmdsZQo+ID4gPiByZXNjdHJsIEwzIGRvbWFpbiwgd2hpbGUgdGhlIHVwZGF0ZSBwYXRo
IHdvdWxkIGl0ZXJhdGUgdGhlIGxpc3QgYW5kCj4gPiA+IHByb2dyYW0gZXZlcnkgcGh5c2ljYWwg
Y29udHJvbGxlci4KPiA+Cj4gPiBHb29kIHBvaW50IHRoYXQgaXQgaXMgbm90IGEgZHVwbGljYXRl
LiBIb3dldmVyLCBJIHdvdWxkIGxpa2UgdG8ga2VlcCB0aGUKPiA+IHNjb3BlIG9mIHRoaXMgc2Vy
aWVzIGZyb20gZXhwYW5kaW5nLCBzbyBJIHdvdWxkIHByZWZlciBmb3IgdGhhdCBzY2VuYXJpbwo+
ID4gdG8gYmUgaGFuZGxlZCBpbiBhIGZ1dHVyZSBzZXJpZXMuIFRoZSBkb21haW4gaWQgaXMgdGhl
IGNhY2hlIGlkIGluIGJvdGgKPiA+IGNhc2VzLCBzbyBpdCB3b24ndCBiZSBhIHByb2JsZW0gdG8g
YWRkIGxhdGVyLgo+ID4KPiA+IERvIHlvdSBoYXZlIGEgcGxhdGZvcm0gd2l0aCBzdWNoIGFuIEwz
IHRoYXQgaXQgY291bGQgYmUgdGVzdGVkIG9uPwo+ID4KPiA+IEZvciB2MTMsIEkgY291bGQgY2hh
bmdlIHRoZSBjb21tZW50IGFuZCB0aGUgd2FybmluZyBzbyB0aGF0IHRoZXkgc2F5IGEKPiA+IHNl
Y29uZCBjb250cm9sbGVyIGZvciBhIGNhY2hlIGlzIG5vdCBzdXBwb3J0ZWQsIGluc3RlYWQgb2Yg
Y2FsbGluZyBpdCBhCj4gPiBkdXBsaWNhdGUuIFRoZSBhbHRlcm5hdGl2ZSBjb3VsZCBiZSB0byBz
a2lwIHRoZSB3aG9sZSBncm91cCBpZiBpdCBpcwo+ID4gYSBwcm9ibGVtIHRvIGp1c3QgbGVhdmUg
dGhlIGZpcnN0IG9mIHRoZSBncm91cCBlbmFibGVkLgo+IAo+IEtlZXBpbmcgb25seSB0aGUgZmly
c3QgY29udHJvbGxlciBjb3VsZCBleHBvc2Ugb25lIGxvZ2ljYWwgTDMgZG9tYWluIHRvCj4gdXNl
ciBzcGFjZSB3aGlsZSBjb25maWd1cmluZyBvbmx5IHBhcnQgb2YgdGhlIHBoeXNpY2FsIHJlc291
cmNlLiBSZXF1ZXN0cwo+IGhhbmRsZWQgYnkgdGhlIHJlbWFpbmluZyBjb250cm9sbGVycyB3b3Vs
ZCBub3QgcmVjZWl2ZSB0aGUgc2FtZSBhbGxvY2F0aW9uLgo+IAo+IFRoaXMgdG9wb2xvZ3kgc2hv
dWxkIGJlIHRlc3RhYmxlIGluIFFFTVUgYnkgY3JlYXRpbmcgdHdvIGNhcGFjaXR5Cj4gY29udHJv
bGxlcnMgd2l0aCBkaWZmZXJlbnQgTU1JTyBiYXNlcyBhbmQgbWFraW5nIGJvdGggUlFTQyByZXNv
dXJjZQo+IGVudHJpZXMgcmVmZXJlbmNlIHRoZSBzYW1lIFBQVFQgQ2FjaGUgSUQuCgpUaGUgUUVN
VSBSUVNDIHNlcmllcyBnaXZlcyBlYWNoIGNhcGFjaXR5IGNvbnRyb2xsZXIgaXRzIG93biBjYWNo
ZSwgc28gSQpjb3VsZCBjaGFuZ2UgaXQgdG8gYWxsb3cgdHdvIGNvbnRyb2xsZXJzIHRvIGhhdmUg
dGhlIHNhbWUgQ2FjaGUgSUQuCgpJcyB0aGVyZSBhbHNvIGEgaGFyZHdhcmUgaW1wbGVtZW50YXRp
b24gdGhhdCBjb3VsZCBiZSB1c2VkIGZvciB0ZXN0aW5nPwoKPiBPbmUgcG9zc2libGUgZ3JvdXBp
bmcgbW9kZWwgaXM6Cj4gCj4gMS4gSW5pdGlhbGl6YXRpb24KPiBHcm91cCBjb250cm9sbGVycyBi
eSAoY2FjaGVfbGV2ZWwsIGNhY2hlX2lkKS4gUmVwcmVzZW50IGVhY2ggZ3JvdXAKPiBhcyBvbmUg
bG9naWNhbCBjb21wb25lbnQgY29udGFpbmluZyBhIGxpbmtlZCBsaXN0IG9mIGl0cyBwaHlzaWNh
bCBjb250cm9sbGVycy4KPiAKPiAyLiBTZXQKPiBMZXQgdGhlIHJlc2N0cmwgZG9tYWluIHJlZmVy
ZW5jZSB0aGUgbG9naWNhbCBjb21wb25lbnQuIE9uIGEgc2NoZW1hdGEKPiB1cGRhdGUsIGl0ZXJh
dGUgb3ZlciB0aGUgY29udHJvbGxlciBsaXN0IGFuZCBwcm9ncmFtIGV2ZXJ5IHBoeXNpY2FsIGNv
bnRyb2xsZXIuCj4gCj4gMy4gR2V0Cj4gUmVhZCB0aGUgY29uZmlndXJhdGlvbiBmcm9tIHRoZSBm
aXJzdCBjb250cm9sbGVyIGFuZCB2ZXJpZnkgdGhhdCB0aGUKPiByZW1haW5pbmcgY29udHJvbGxl
cnMgcmVwb3J0IHRoZSBzYW1lIHZhbHVlLgo+IAo+IDQuIE1vbml0b3IKPiBXaGVuIG1vbml0b3Jp
bmcgc3VwcG9ydCBpcyBhZGRlZCwgcmVhZCB0aGUgY291bnRlciBmb3IgdGhlIHNhbWUgTUNJRAo+
IGZyb20gZXZlcnkgcGh5c2ljYWwgY29udHJvbGxlciBhbmQgcmVwb3J0IHRoZSBzdW0gZm9yIHRo
ZSBsb2dpY2FsCj4gcmVzY3RybCBkb21haW4uCj4gCj4gVXNlciBzcGFjZSB3b3VsZCBjb250aW51
ZSB0byBzZWUgb25lIGxvZ2ljYWwgTDMgZG9tYWluLCB3aGlsZSBhbGwKPiBwaHlzaWNhbCBjb250
cm9sbGVycyBiZWhpbmQgaXQgcmVtYWluIHN5bmNocm9uaXplZC4KPiAKPiBVbnRpbCB0aGlzIGdy
b3VwaW5nIGlzIHN1cHBvcnRlZCwgaXQgd291bGQgYmUgc2FmZXIgdG8gc2tpcCB0aGUgd2hvbGUK
PiBjb21wb25lbnQgcmF0aGVyIHRoYW4gZW5hYmxlIG9ubHkgdGhlIGZpcnN0IGNvbnRyb2xsZXIu
IFNpbmNlIHRoaXMgaXMgYQo+IHZhbGlkIFJRU0MgdG9wb2xvZ3kgYW5kIGNhbiBiZSBjb3ZlcmVk
IGJ5IFFFTVUsIHN1cHBvcnRpbmcgdGhlIGdyb3VwaW5nCj4gaW4gdGhlIGN1cnJlbnQgd29yayB3
b3VsZCBiZSBwcmVmZXJhYmxlLgoKSSB3b3VsZCBsaWtlIHRvIGtlZXAgdGhlIHNjb3BlIG9mIHRo
aXMgc2VyaWVzIGxpbWl0ZWQsIHNvIGluIHYxMyBJIHdpbGwKc2tpcCB0aGUgd2hvbGUgZ3JvdXAu
CgpJIHdpbGwgYWRkIHN1cHBvcnQgZm9yIG11bHRpcGxlIGNvbnRyb2xsZXJzIHBlciBjYWNoZSB0
byB0aGUgTGludXggUlFTQwpzZXJpZXMgaW5zdGVhZC4gWW91ciBncm91cGluZyBtb2RlbCBsb29r
cyBsaWtlIGEgZ29vZCBwbGFuIGZvcgppbXBsZW1lbnRhdGlvbi4KClRoYW5rcywKRHJldwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
