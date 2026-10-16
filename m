Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD95CC6B38
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 00:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QtvLOcojnUWoF9SfzesJgsBKalGCzIj2pOFdZ3KsaN8=; b=hEGj+DdjB09cWj
	UZDyDEQS4+G6QpyedtPjXKpglKIapjuALBodE4Q/ti48wQ9nLtSB6NWNfkaQfcEinUXDKu+9aIvW7
	b/I3ir3fUSPSIZtjRfxwe6xsiOWUsSyKH/a182z9uLeXQv8scmoRAEMlZWmfOGp/TwNEbHsjZY28E
	uZacfSkFNHnqahAG7F6YTvMaROn1Vi2fisNhoW8ZdVL6kdZoNwQW2NBy3+eSUThy3FD0631YydFqE
	Q3aly7id6OfHCwJmsjyDq5fLu5Gw3azqIOK+bJAiD7jZ9km3+jUpnX1+n1lgB+crU/3MjMpRlRwHG
	ByCKO4PZU2knM+I4BKBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVSv-00000001b1V-08AA;
	Fri, 16 Oct 2026 00:06:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVSt-00000001b1P-2dyK
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 00:06:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A84C140327;
	Fri, 16 Oct 2026 00:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB1C1F000C4;
	Fri, 16 Oct 2026 00:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792109186;
	bh=lj0QXNDYWzykhho+9TgSGkXQQEpotIYDIIMXMua7eT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oOHnLwpwzXtkpHlf/6U6iF7vR87WzvWbEDkOSs+3dp8FKUwEDtOEWfd+6JMd2ssjz
	 GksAiaUpsIWqUo0dFVk155pkKrt/uQGX1NYw1QEdERp+A1Nt6fjyyEr0VjxDe3MTLn
	 y3tG+1pIiDhw0uPafqBUYvc9Ob3kIiwceYOBmf8l7m9JtxTkieKn+UDxCnUf+6eCLS
	 OeTrKt80VAXQzJyVsPTmXXwbritv3DMzHM+pKHlhVzZH8TactA4tSM7tc2hImMGgUV
	 ren66sBe8znD4ykW994KGmIo/iQIXn+69G6S9pkjIAYVzlA6PWgkL1vtq3LBsyYzxv
	 dfLtdDCrcOvRw==
Date: Thu, 15 Oct 2026 17:06:24 -0700
From: Drew Fustini <fustini@kernel.org>
To: Sunil V L <sunilvl@oss.qualcomm.com>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
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
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tony Luck <tony.luck@intel.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
	yunhui cui <cuiyunhui@bytedance.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, devicetree@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 1/5] riscv_cbqri: Add capacity controller probe and
 allocation device ops
Message-ID: <atFqgJc4Vg2XPGl0@thelio>
References: <20261003-dfustini-atl-sc-cbqri-dt-v9-0-52fd8be98dcf@kernel.org>
 <20261003-dfustini-atl-sc-cbqri-dt-v9-1-52fd8be98dcf@kernel.org>
 <CAB19ukHJ-TxXu+vMGGNqHz2sJj35Cg0X1RbcdfXzwDYpci1jQw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB19ukHJ-TxXu+vMGGNqHz2sJj35Cg0X1RbcdfXzwDYpci1jQw@mail.gmail.com>
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

T24gTW9uLCBPY3QgMTIsIDIwMjYgYXQgMDk6NDI6NTlQTSArMDUzMCwgU3VuaWwgViBMIHdyb3Rl
Ogo+IEhpIERyZXchCgpIaSBTdW5pbCwgdGhhbmtzIGZvciByZXZpZXdpbmchCgo+IE9uIFNhdCwg
T2N0IDMsIDIwMjYgYXQgMTI6NDXigK9QTSBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gPgo+ID4gQWRkIHN1cHBvcnQgZm9yIHRoZSBSSVNDLVYgQ0JRUkkgY2FwYWNp
dHkgY29udHJvbGxlci4gQSBwbGF0Zm9ybSBkcml2ZXIKPiA+IHBhc3NlcyBhIGNicXJpX2NvbnRy
b2xsZXJfaW5mbyBkZXNjcmlwdG9yIHRvZ2V0aGVyIHdpdGggdGhlIGNhY2hlIGxldmVsCj4gPiB0
byByaXNjdl9jYnFyaV9yZWdpc3Rlcl9jY19kdCgpLCB3aGljaCBwcm9iZXMgdGhlIGNvbnRyb2xs
ZXIgYW5kIGFkZHMgaXQKPiA+IHRvIHRoZSBjb250cm9sbGVyIGxpc3QuCj4gPgo+ID4gQXNzaXN0
ZWQtYnk6IExMTQo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBBZHJpZW4gUmljY2lhcmRpIDxhcmljY2lh
cmRpQGJheWxpYnJlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEFkcmllbiBSaWNjaWFyZGkgPGFy
aWNjaWFyZGlAYmF5bGlicmUuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogRHJldyBGdXN0aW5pIDxm
dXN0aW5pQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMyArCj4gPiAgZHJpdmVycy9yZXNjdHJsL0tjb25maWcgICAgICAgICAgfCAg
IDkgKwo+ID4gIGRyaXZlcnMvcmVzY3RybC9NYWtlZmlsZSAgICAgICAgIHwgICAzICsKPiA+ICBk
cml2ZXJzL3Jlc2N0cmwvY2JxcmlfZGV2aWNlcy5jICB8IDU3NCArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiA+ICBkcml2ZXJzL3Jlc2N0cmwvY2JxcmlfaW50ZXJuYWwu
aCB8IDEyMiArKysrKysrKysKPiA+ICBpbmNsdWRlL2xpbnV4L3Jpc2N2X2NicXJpLmggICAgICB8
ICA0NSArKysKPiA+ICA2IGZpbGVzIGNoYW5nZWQsIDc1NiBpbnNlcnRpb25zKCspClsuLl0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Jlc2N0cmwvY2JxcmlfZGV2aWNlcy5jIGIvZHJpdmVycy9y
ZXNjdHJsL2NicXJpX2RldmljZXMuYwo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4
IDAwMDAwMDAwMDAwMC4uODdkNGVjZjhmMTQxCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9k
cml2ZXJzL3Jlc2N0cmwvY2JxcmlfZGV2aWNlcy5jClsuLl0KPiA+ICtzdGF0aWMgaW50IGNicXJp
X3Byb2JlX2NvbnRyb2xsZXIoc3RydWN0IGNicXJpX2NvbnRyb2xsZXIgKmN0cmwpCj4gPiArewpb
Li5dCj4gPiArCj4gPiArICAgICAgIGlmICghcmVxdWVzdF9tZW1fcmVnaW9uKGN0cmwtPmFkZHIs
IGN0cmwtPnNpemUsICJjYnFyaV9jb250cm9sbGVyIikpIHsKPiA+ICsgICAgICAgICAgICAgICBw
cl9lcnIoInJlcXVlc3RfbWVtX3JlZ2lvbiBmYWlsZWQgZm9yICVwYVxuIiwgJmN0cmwtPmFkZHIp
Owo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUJVU1k7Cj4gPiArICAgICAgIH0KPiA+ICsK
PiBBcG9sb2dpZXMgZm9yIGp1bXBpbmcgb24gdGhpcyBsYXRlLiBCdXQgd2h5IG5vdCBzaW1wbHkg
dXNlCj4gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKCkgPwoKVGhpcyBpcyBhbiBhcnRp
ZmFjdCBvZiBteSBmdWxsZXIgUkZDIHNlcmllcyB3aGljaCBpbXBsZW1lbnRlZCBSUVNDIGFzCndl
bGwuIEZvciBBQ1BJLCBpdCByZWdpc3RlcnMgY29udHJvbGxlcnMgZGlyZWN0bHkgZnJvbSB0aGUg
UlFTQyB0YWJsZQp3aXRob3V0IGEgcGxhdGZvcm0gZGV2aWNlLgoKQnV0IHlvdSBtYWtlIGEgZ29v
ZCBwb2ludCBhbmQgdGhpcyBpcyB3aGF0IE1QQU0gZG9lcyBhcyB3ZWxsLiBJIHdpbGwKc3dpdGNo
IHRvIGRldm1fcGxhdGZvcm1fZ2V0X2FuZF9pb3JlbWFwX3Jlc291cmNlKCkgYW5kIGFkZCBhIGJh
c2UgZmllbGQKdG8gY2JxcmlfY29udHJvbGxlcl9pbmZvLgoKPiA+ICsvKioKPiA+ICsgKiByaXNj
dl9jYnFyaV9yZWdpc3Rlcl9jY19kdCgpIC0gcmVnaXN0ZXIgYSBEVC1kZXNjcmliZWQgY2FwYWNp
dHkgY29udHJvbGxlcgo+ID4gKyAqIEBpbmZvOiAgICAgICAgcmVnaXN0cmF0aW9uIGRlc2NyaXB0
b3IuIGluZm8tPmNhY2hlX2lkIGlzIHVzZWQgYXMgdGhlCj4gPiArICogICAgICAgICAgICAgICBy
ZXNjdHJsIGRvbWFpbiBpZC4gaW5mby0+dHlwZSBtdXN0IGJlIENBUEFDSVRZLgo+ID4gKyAqIEBj
YWNoZV9sZXZlbDogY2FjaGUgbGV2ZWwgKDIgb3IgMykgdGhlIGNvbnRyb2xsZXIgYmFja3MsIG1h
cHBlZCB0byB0aGUKPiA+ICsgKiAgICAgICAgICAgICAgIHJlc2N0cmwgTDIvTDMgcmVzb3VyY2Ug
YnkgdGhlIHJlc2N0cmwgZ2x1ZS4KPiA+ICsgKgo+ID4gKyAqIFRoZSBjYWNoZSBsZXZlbCBhbmQg
aWQgKGluZm8tPmNhY2hlX2lkKSBhcmUgc3VwcGxpZWQgZGlyZWN0bHkgYnkgdGhlCj4gPiArICog
Y2FsbGVyLCB3aGljaCByZXNvbHZlcyB0aGVtIGZyb20gY2FjaGVpbmZvLiBEb21haW4gbWVtYmVy
c2hpcCBpcyByZXNvbHZlZAo+ID4gKyAqIHBlciBDUFUgYXQgaG90cGx1Zywgc28gbm8gY3B1IG1h
c2sgaXMgc3RvcmVkLiBUaGVyZSBpcyBubyBmaXJtd2FyZSB0YWJsZQo+ID4gKyAqIHRvIHJlc29s
dmUgYW55IG9mIHRoaXMgZnJvbS4KPiA+ICsgKgo+ID4gKyAqIFJldHVybjogMCBvbiBzdWNjZXNz
LCAtRUVYSVNUIHdoZW4gYSBjb250cm9sbGVyIGZvciB0aGUgc2FtZSBjYWNoZSBsZXZlbAo+ID4g
KyAqIGFuZCBpZCBpcyBhbHJlYWR5IHJlZ2lzdGVyZWQsIG9yIGFub3RoZXIgbmVnYXRpdmUgZXJy
bm8gb24gZmFpbHVyZS4KPiA+ICsgKi8KPiA+ICtpbnQgcmlzY3ZfY2JxcmlfcmVnaXN0ZXJfY2Nf
ZHQoY29uc3Qgc3RydWN0IGNicXJpX2NvbnRyb2xsZXJfaW5mbyAqaW5mbywKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1MzIgY2FjaGVfbGV2ZWwpCj4gPgo+IFdoYXQgaXMgRFQg
c3BlY2lmaWMgY29kZSBpbiB0aGlzIGZ1bmN0aW9uPyBJTU8sIGl0IGlzIGJldHRlciB0byBnYXRo
ZXIKPiBhbGwgaW5mb3JtYXRpb24gaW4gdGhlIG1haW4KPiBkcml2ZXIgaXRzZWxmIGludG8gYSBn
ZW5lcmljICJpbmZvIiBzdHJ1Y3R1cmUuIFRoYXQgd2F5LCBhbGwgQUNQSSB2cwo+IERUIGRpZmZl
cmVuY2VzIHdpbGwgYmUgaGFuZGxlZCBpbgo+IG9uZSBwbGFjZSBhbmQgZXZlcnl0aGluZyBmdXJ0
aGVyIHdpbGwgYmUgZ2VuZXJpYy4KClRoZXJlIGlzIG5vdGhpbmcgdGhhdCBpcyBEVCBzcGVjaWZp
YyBiZXlvbmQgbmVlZGluZyB0byBwYXNzIHRoZSBjYWNoZQpsZXZlbCB3aGVyZWFzIEFDUEkgY2Fu
IGRldGVybWluZSBpdCBmcm9tIFBQVFQuCgpCdXQgSSB0aGluayBpdCB3b3VsZCBtYWtlIHNlbnNl
IHRvIGJlIG1vcmUgZ2VuZXJpYy4gSSB3aWxsIG1vdmUKY2FjaGVfbGV2ZWwgaW50byBjYnFyaV9j
b250cm9sbGVyX2luZm8gYW5kIGRyb3AgdGhlIF9kdCBzdWZmaXguCgpbLi5dCj4gPiArICAgICAg
IC8qCj4gPiArICAgICAgICAqIFNSTUNGRyBlbmNvZGVzIFJDSUQgaW4gMTIgYml0cy4gUmVqZWN0
IGFuIG91dC1vZi1yYW5nZSBjb3VudCByYXRoZXIKPiA+ICsgICAgICAgICogdGhhbiBzaWxlbnRs
eSB0cnVuY2F0aW5nIGluIGV2ZXJ5IEZJRUxEX1BSRVAoU1JNQ0ZHX1JDSURfTUFTSywgY2xvc2lk
KQo+ID4gKyAgICAgICAgKiBvbiB0aGUgc2NoZWR1bGUtaW4gZmFzdCBwYXRoLgo+ID4gKyAgICAg
ICAgKi8KPiA+ICsgICAgICAgaWYgKGN0cmwtPnJjaWRfY291bnQgPiBGSUVMRF9NQVgoU1JNQ0ZH
X1JDSURfTUFTSykgKyAxKSB7Cj4gPiArICAgICAgICAgICAgICAgcHJfd2FybigiQ0MgYXQgJXBh
IGhhcyBSQ0lEIGNvdW50ICV1IGJleW9uZCB0aGUgMTItYml0IFNSTUNGRyBmaWVsZCwgc2tpcHBp
bmdcbiIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAmY3RybC0+YWRkciwgY3RybC0+cmNp
ZF9jb3VudCk7Cj4gPiArICAgICAgICAgICAgICAgY2JxcmlfY29udHJvbGxlcl9kZXN0cm95KGN0
cmwpOwo+ID4KPiBBbnkgcmVhc29uIHRvIGhhdmUgZXhwbGljaXQgY2xlYW51cHMgPwoKTm8uIEkg
d2lsbCBtb3ZlIHRoZSBpbmZvLT5yY2lkX2NvdW50IGNoZWNrIGJlZm9yZSBhbGxvY2F0aW9uIGFu
ZCB1c2UKX19mcmVlKCkgZm9yIHRoZSBjb250cm9sbGVyLgoKWy4uXQo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcmVzY3RybC9jYnFyaV9pbnRlcm5hbC5oIGIvZHJpdmVycy9yZXNjdHJsL2NicXJp
X2ludGVybmFsLmgKWy4uXQo+ID4gK2V4dGVybiBzdHJ1Y3QgbGlzdF9oZWFkIGNicXJpX2NvbnRy
b2xsZXJzOwo+ID4gK2V4dGVybiBzdHJ1Y3QgbXV0ZXggY2JxcmlfY29udHJvbGxlcnNfbG9jazsK
PiA+ICsKPiA+Cj4gQ2FuIHRoZXNlIGJlIG1hZGUgc3RhdGljIGluIGNicXJpX2RldmljZXMuYyBh
bmQgcHJvdmlkZSBBUEkgZm9yIGNicXJpX3Jlc2N0cmwuYz8KClllcywgdGhlIG9ubHkgdXNlIG91
dHNpZGUgb2YgY2JxcmlfZGV2aWNlcy5jIGlzCmNicXJpX3Jlc2N0cmxfcGlja19jYWNoZXMoKS4g
SSB3aWxsIG1ha2UgYm90aCBzdGF0aWMgYW5kIGFkZCBhIGhlbHBlcgp0aGF0IHJldHVybnMgdGhl
IHJlZ2lzdGVyZWQgY29udHJvbGxlcnMuCgpUaGFua3MsCkRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
