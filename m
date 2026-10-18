Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E802CCF2C9
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Oct 2026 06:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKtw804eauDLO/qeg0XHiqrO48O3RBhGYUxXc8Ued/8=; b=U3Z1tGP7biVtHy
	/nVFeZNB4ZgVj3JwjV9nidMkRWITTNHq4tdw7v4vyvEaq3IqfqBCurZ8h19JSd/6zHqJAPsxUUqCK
	POyfd6/LDD4C2MKTvA0PXQ+VqNQpOpRtS9PmEgm+/X+X3iIrTh3Kz5SSS73tMa6yDGP66qEV/oLxR
	oU8ymBEfY1939vpeGAO7hJiFcfsFMYJjBL8UPllBrwcrbdmcNXW6PSfBZCbdNFLbXVE3OAzxDGWJn
	S0EweMAq4sGdoqDDRSmaoPmD6cw3Sqew7j3wB44LyAzVdRAVv7GK+a64JXGmgGmK6euWGGWwGCTKZ
	bOccRfEzYYgVPzpHwUaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIKJj-00000005cKw-2MGA;
	Sun, 18 Oct 2026 06:24:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIKJh-00000005cKf-3NAI
	for linux-riscv@lists.infradead.org;
	Sun, 18 Oct 2026 06:24:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 10FC340A94;
	Sun, 18 Oct 2026 06:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63CA51F000C4;
	Sun, 18 Oct 2026 06:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792304660;
	bh=w2Qw0jIYjCcszsE1XhibnTlIkBb9EQqyKTQh4sDtAhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ePeHDgCzDAgLo5tVEJsA16jTv75lNDD4irGGQJwjWhGDdajzpwDF1XoZKX2cH8FKG
	 6+84L4TEf90k5sfW+5L0TxhPmVmwCWlmu6H+ZGx8D0RX67pZp744hZPBx9G1cHMBot
	 UdMQaY3PzH1HKDwkxskY0TPGkM4ms2SL1DZcxvgCbnagZIRlGcBPr0XL7gbNWxaaQf
	 JAsWz6BXTpZdRev/RVo/hBr4Zj8ghnrg0namZ1kxJS40CHQhfFnLtZ57xyk73av15d
	 ZCXRYLjrG5uGL7EwCp1kRZbF1khfUAb/o+8QTP4rJ9tHcijYsoX88mHRWVDalZCG4O
	 u5IIlWgJaAxvA==
Date: Sat, 17 Oct 2026 23:24:19 -0700
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
Subject: Re: [PATCH v9 5/5] riscv_cbqri: Add CBQRI capacity allocation
 platform driver
Message-ID: <atRmE5lKNxmskzTm@thelio>
References: <20261003-dfustini-atl-sc-cbqri-dt-v9-0-52fd8be98dcf@kernel.org>
 <20261003-dfustini-atl-sc-cbqri-dt-v9-5-52fd8be98dcf@kernel.org>
 <CAB19ukEMKp7iFHrTPawNj2dwf1n0D9VDBC2ycBPdCRbkGYN2eg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB19ukEMKp7iFHrTPawNj2dwf1n0D9VDBC2ycBPdCRbkGYN2eg@mail.gmail.com>
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

T24gTW9uLCBPY3QgMTIsIDIwMjYgYXQgMTA6MzM6MjFQTSArMDUzMCwgU3VuaWwgViBMIHdyb3Rl
Ogo+IE9uIFNhdCwgT2N0IDMsIDIwMjYgYXQgMTI6NDXigK9QTSBEcmV3IEZ1c3RpbmkgPGZ1c3Rp
bmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gQWRkIGEgcGxhdGZvcm0gZHJpdmVyIGZvciBD
QlFSSSBjYXBhY2l0eSBjb250cm9sbGVycyBkZXNjcmliZWQgaW4KPiA+IGRldmljZSB0cmVlIHdp
dGggdGhlIHJpc2N2LGNicXJpLWNhcGFjaXR5LWNvbnRyb2xsZXIgY29tcGF0aWJsZS4KPiA+Cj4g
PiBUaGUgY29udHJvbGxlciBub2RlIHBvaW50cyBhdCB0aGUgY2FjaGUgaXQgZ292ZXJucyB3aXRo
IGEKPiA+IHJpc2N2LGNicXJpLWNhY2hlIHBoYW5kbGUuIFRoZSBkcml2ZXIgbG9va3MgdGhhdCBj
YWNoZSB1cCBpbiBjYWNoZWluZm8KPiA+IGFuZCB1c2VzIGl0cyBjYWNoZSBpZCBhcyB0aGUgcmVz
Y3RybCBkb21haW4gaWQsIHNvIHRoZSBiaW5kaW5nIGRvZXMgbm90Cj4gPiBuZWVkIHRvIGNhcnJ5
IGEgQ1BVIG1hc2suIFRoZSBjb250cm9sbGVyIGlzIHRoZW4gaGFuZGVkIHRvIHRoZSBDQlFSSQo+
ID4gY29yZSwgd2hpY2ggcHJvYmVzIGl0cyBjYXBhYmlsaXRpZXMgYW5kIGRlY2lkZXMgd2hldGhl
ciB0byBleHBvc2UgaXQKPiA+IHRocm91Z2ggcmVzY3RybC4KPiA+Cj4gPiBOb3RoaW5nIGlzIHZl
bmRvci1zcGVjaWZpYyBhbmQgcmVnIGlzIHRoZSBDQlFSSSByZWdpc3RlciBibG9jayBpdHNlbGYs
Cj4gPiBzbyBhbnkgU29DIHRoYXQgZGVzY3JpYmVzIGEgQ0JRUkkgY2FwYWNpdHkgY29udHJvbGxl
ciBpbiBkZXZpY2UgdHJlZSBjYW4KPiA+IHVzZSB0aGUgZHJpdmVyIHVuY2hhbmdlZC4KPiA+Cj4g
PiBBc3Npc3RlZC1ieTogTExNCj4gPiBUZXN0ZWQtYnk6IENoZW4gUGVpIDxjcDA2MTNAbGludXgu
YWxpYmFiYS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlAa2Vy
bmVsLm9yZz4KPiA+IC0tLQo+ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgIHwg
ICAxICsKPiA+ICBkcml2ZXJzL3Jlc2N0cmwvS2NvbmZpZyAgICAgICAgICB8ICAxNSArKysrKwo+
ID4gIGRyaXZlcnMvcmVzY3RybC9NYWtlZmlsZSAgICAgICAgIHwgICAxICsKPiA+ICBkcml2ZXJz
L3Jlc2N0cmwvY2JxcmlfY2FwYWNpdHkuYyB8IDEyNyArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDE0NCBpbnNlcnRpb25zKCspClsu
Ll0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Jlc2N0cmwvY2JxcmlfY2FwYWNpdHkuYyBiL2Ry
aXZlcnMvcmVzY3RybC9jYnFyaV9jYXBhY2l0eS5jCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4wNjcwYTY3NmJkYjEKPiA+IC0tLSAvZGV2L251bGwKPiA+
ICsrKyBiL2RyaXZlcnMvcmVzY3RybC9jYnFyaV9jYXBhY2l0eS5jClsuLl0KPiA+ICtzdGF0aWMg
aW50IGNicXJpX2NhcGFjaXR5X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4g
PiArewo+ID4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+ID4gKyAg
ICAgICBzdHJ1Y3QgY2JxcmlfY29udHJvbGxlcl9pbmZvIGluZm8gPSB7fTsKPiA+ICsgICAgICAg
c3RydWN0IGRldmljZV9ub2RlICpjYWNoZV9ucDsKPiA+ICsgICAgICAgc3RydWN0IHJlc291cmNl
ICpyZXM7Cj4gPiArICAgICAgIHUzMiByY2lkX2NvdW50LCBjYWNoZV9sZXZlbDsKPiA+ICsgICAg
ICAgaW50IGNhY2hlX2lkLCBjcHUsIHJldDsKPiA+ICsKPiA+ICsgICAgICAgcmVzID0gcGxhdGZv
cm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsKPiA+ICsgICAgICAgaWYg
KCFyZXMpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiArCj4gVW5sZXNz
IEkgYW0gbWlzc2luZyBzb21ldGhpbmcsIEkgdGhpbmsgeW91IGNhbiBzaW1wbGlmeSB0aGUgY29k
ZSBieQo+IHVzaW5nIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpLgoKWWVzLCBJJ2xs
IHN3aXRjaCB0byBkZXZtX3BsYXRmb3JtX2dldF9hbmRfaW9yZW1hcF9yZXNvdXJjZSgpLgoKWy4u
XQo+ID4gKwo+ID4gKyAgICAgICBpbmZvLnR5cGUgPSBDQlFSSV9DT05UUk9MTEVSX1RZUEVfQ0FQ
QUNJVFk7Cj4gPiArICAgICAgIGluZm8uYWRkciA9IHJlcy0+c3RhcnQ7Cj4gPiArICAgICAgIGlu
Zm8uc2l6ZSA9IHJlc291cmNlX3NpemUocmVzKTsKPiA+ICsgICAgICAgaW5mby5yY2lkX2NvdW50
ID0gcmNpZF9jb3VudDsKPiA+ICsgICAgICAgaW5mby5jYWNoZV9pZCA9IGNhY2hlX2lkOwo+ID4g
Kwo+ID4gKyAgICAgICByZXQgPSByaXNjdl9jYnFyaV9yZWdpc3Rlcl9jY19kdCgmaW5mbywgY2Fj
aGVfbGV2ZWwpOwo+ID4KPiBBcyBJIG1lbnRpb25lZCBpbiB0aGUgY29tbWVudCBmb3IgYW5vdGhl
ciBwYXRjaCwgdGhpcyBmdW5jdGlvbiBkb2Vzbid0Cj4gbmVlZCB0byBoYXZlICJfZHQiIGluIGl0
cyBuYW1lLgoKR29vZCBwb2ludCwgSSdsbCBkcm9wIGl0LgoKVGhhbmtzLApEcmV3CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
