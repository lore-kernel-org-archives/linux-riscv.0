Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CCACCF2C9
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 20:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQsbs+EAUwsb3EyAoNCeee+4TJU07nwhP7GDRuqTuUk=; b=X9nRyTEmYqQ7Mh
	852bfEZi/R4tArPi2/OpmejQv3FnwMwSomn6DsjtWUmcR/mA2cmBWqw1/QA4K7hQz5ydCUsUHVx37
	xumj/hRfRZ4M0qWNe/q+wKBmpWQkRQ2SyQ+op3kA9Xum9JIS3pKNHlFIYLqUFM4/WE4njW6fsblvf
	YthFRw1NFoUBL7zCwG/hcc4/uSvR/7eNKUHlcizcQt5CfVU4RBemfI+EjKafTFSWX941X3RzZJ5US
	60joASCEyl8HhyoL38+E4hzhzIKJiLAT2xWeHjhtsmO/tnVopiYmVI6NJFIAw7WbEyTxkqBOQGHwE
	OtvdotvSRA4ZwVm7E86w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIBSa-00000005EXM-2yvA;
	Sat, 17 Oct 2026 20:56:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIBSY-00000005EXD-3vqN
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 20:56:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D8EA260AB6;
	Sat, 17 Oct 2026 20:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BE3C1F000C4;
	Sat, 17 Oct 2026 20:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792270613;
	bh=ICaHlESv3/ZEgb0CL6c9OpvIzwqhaxILgNv0hKoeWb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ocoofUb5j8zOL9hJxSUpD9COIXYE+Qb98ZjzeRsCrYCd2mgQCqyg5Y9Kfmp48uxj/
	 C6vcahxYvFOvszO4UHHTNQvghBy6IQZqB+J16ZtYEKbEDEFWPuJH0xXNniJJ8K0m0u
	 x62noQj5k+QgnRLu1jJJ+8p4WTl2aOM8fNd+Fv8Xqoth1mW47YurD51peFurGGYUMb
	 jDRCCbXsBvqJ0ZOA1xJEuZvq3RwsSRvvitD0ppxwT8yzEuCyosnk0hxjmTEgXBYqPY
	 wFMNSwaLXbD9nzQRvYPgdwwxkUXWWO/bO0cCFODqPnNZNgi/bY1ENy6Fs5KedcMjoU
	 bWwQlAV/qYIUg==
Date: Sat, 17 Oct 2026 13:56:51 -0700
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
Subject: Re: [PATCH v9 2/5] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Message-ID: <atPhE6rF0Uz93qF2@thelio>
References: <20261003-dfustini-atl-sc-cbqri-dt-v9-0-52fd8be98dcf@kernel.org>
 <20261003-dfustini-atl-sc-cbqri-dt-v9-2-52fd8be98dcf@kernel.org>
 <CAB19ukEkAOMnPpi2jVFz68GZ_7cwYmNtrBkxnfEJtFcPb7PJ5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB19ukEkAOMnPpi2jVFz68GZ_7cwYmNtrBkxnfEJtFcPb7PJ5Q@mail.gmail.com>
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

T24gTW9uLCBPY3QgMTIsIDIwMjYgYXQgMTA6MjM6NTdQTSArMDUzMCwgU3VuaWwgViBMIHdyb3Rl
Ogo+IE9uIFNhdCwgT2N0IDMsIDIwMjYgYXQgMTI6NDXigK9QTSBEcmV3IEZ1c3RpbmkgPGZ1c3Rp
bmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gV2lyZSBDQlFSSSBjYXBhY2l0eSBjb250cm9s
bGVycyBpbnRvIHJlc2N0cmwgYXMgUkRUX1JFU09VUkNFX0wyIGFuZAo+ID4gUkRUX1JFU09VUkNF
X0wzIHNjaGVtYXRhLgo+ID4KPiA+IHJlc2N0cmwgZXhwb3NlcyBhIHNpbmdsZSBjYXBhY2l0eSBt
YXNrIHBlciByZXNvdXJjZSwgc28gd2hlbiBtb3JlIHRoYW4KPiA+IG9uZSBjYXBhY2l0eSBjb250
cm9sbGVyIGJhY2tzIGEgY2FjaGUgbGV2ZWwgdGhleSBtdXN0IHJlcG9ydCB0aGUgc2FtZQo+ID4g
bnVtYmVyIG9mIGNhcGFjaXR5IGJsb2Nrcy4gVGhlIHNhbWUgaG9sZHMgZm9yIHRoZSBvdGhlciBj
YXBhYmlsaXRpZXMKPiA+IHJlc2N0cmwgZXhwb3NlcyBvbmNlIHBlciByZXNvdXJjZS4gQSBsZXZl
bCB3aG9zZSBjb250cm9sbGVycyBkaXNhZ3JlZQo+ID4gaXMgbGVmdCB1bmV4cG9zZWQuIE90aGVy
IGxldmVscyBhcmUgdW5hZmZlY3RlZC4KPiA+Cj4gPiBUaGUgc2V0IG9mIGNvbnRyb2xsZXJzIGJh
Y2tpbmcgZWFjaCBsZXZlbCBpcyBmaXhlZCB3aGVuIHJlc2N0cmwgaXMgc2V0Cj4gPiB1cCBhdCBs
YXRlX2luaXRjYWxsLiBDb250cm9sIGRvbWFpbnMgYXJlIGNyZWF0ZWQgaW4gdGhlIGNwdWhwIG9u
bGluZQo+ID4gY2FsbGJhY2sgYW5kIGtleWVkIG9uIHRoZSBvbmxpbmluZyBDUFUncyBjYWNoZSBp
ZCBmcm9tIGNhY2hlaW5mbywgc28gYQo+ID4gQ1BVIHRoYXQgaXMgb2ZmbGluZSBhdCBwcm9iZSB0
aW1lIHN0aWxsIGpvaW5zIGl0cyBkb21haW4gb25jZSBpdCBjb21lcwo+ID4gb25saW5lLCBwcm92
aWRlZCBhIGNvbnRyb2xsZXIgZm9yIGl0cyBjYWNoZSBpcyBpbiB0aGF0IHNldC4gQSBDUFUgd2hv
c2UKPiA+IGNhY2hlIGhhcyBubyBjb250cm9sbGVyIGlzIGxlZnQgb3V0IG9mIHRoYXQgbGV2ZWwg
YW5kIGEgd2FybmluZyBpcwo+ID4gbG9nZ2VkIG9uY2UuIEEgZG9tYWluIGlzIHB1Ymxpc2hlZCBv
biB0aGUgY3RybF9kb21haW5zIFJDVSBsaXN0IG9ubHkKPiA+IGFmdGVyIGl0IGlzIGZ1bGx5IGlu
aXRpYWxpemVkIGFuZCBicm91Z2h0IG9ubGluZSwgYW5kIHJlbW92ZWQgZnJvbSB0aGUKPiA+IGxp
c3QgYmVmb3JlIGl0IGlzIHRha2VuIG9mZmxpbmUsIGZvbGxvd2luZyB0aGUgZG9jdW1lbnRlZCBz
YWZlCj4gPiB0cmF2ZXJzYWwgcnVsZXMuCj4gPgo+ID4gQXNzaXN0ZWQtYnk6IExMTQo+ID4gVGVz
dGVkLWJ5OiBDaGVuIFBlaSA8Y3AwNjEzQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gQ28tZGV2ZWxv
cGVkLWJ5OiBBZHJpZW4gUmljY2lhcmRpIDxhcmljY2lhcmRpQGJheWxpYnJlLmNvbT4KPiA+IFNp
Z25lZC1vZmYtYnk6IEFkcmllbiBSaWNjaWFyZGkgPGFyaWNjaWFyZGlAYmF5bGlicmUuY29tPgo+
ID4gU2lnbmVkLW9mZi1ieTogRHJldyBGdXN0aW5pIDxmdXN0aW5pQGtlcm5lbC5vcmc+Cj4gPiAt
LS0KPiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArCj4gPiAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9yZXNjdHJsLmggfCAxNDcgKysrKysrKwo+ID4gIGRyaXZlcnMv
cmVzY3RybC9LY29uZmlnICAgICAgICAgIHwgICA0ICsKPiA+ICBkcml2ZXJzL3Jlc2N0cmwvTWFr
ZWZpbGUgICAgICAgICB8ICAgMSArCj4gPiAgZHJpdmVycy9yZXNjdHJsL2NicXJpX3Jlc2N0cmwu
YyAgfCA4MzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgNSBm
aWxlcyBjaGFuZ2VkLCA5ODUgaW5zZXJ0aW9ucygrKQpbLi5dCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9yZXNjdHJsL2NicXJpX3Jlc2N0cmwuYyBiL2RyaXZlcnMvcmVzY3RybC9jYnFyaV9yZXNj
dHJsLmMKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmYx
MGEyNDc2MWIyNQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvZHJpdmVycy9yZXNjdHJsL2Ni
cXJpX3Jlc2N0cmwuYwpbLi5dCj4gPiArc3RhdGljIGludCBjYnFyaV9yZXNjdHJsX3NldHVwKHZv
aWQpCj4gPiArewo+ID4gKyAgICAgICBpbnQgcmlkOwo+ID4gKyAgICAgICBpbnQgZXJyOwo+ID4g
Kwo+ID4gKyAgICAgICBmb3IgKHJpZCA9IDA7IHJpZCA8IFJEVF9OVU1fUkVTT1VSQ0VTOyByaWQr
KykKPiA+ICsgICAgICAgICAgICAgICBjYnFyaV9yZXNjdHJsX3Jlc291cmNlc1tyaWRdLnJlc2N0
cmxfcmVzLnJpZCA9IHJpZDsKPiA+ICsKPiBXaHkgY2FuJ3QgY2JxcmlfcmVzY3RybF9jb250cm9s
X2luaXQgZGlyZWN0bHkgdXNlCj4gY2JxcmlfcmVzY3RybF9yZXNvdXJjZXM/IEkgZmVlbCB0aGlz
IGluaXRpYWxpemF0aW9uIGlzIHJlZHVuZGFudC4KClRoaXMgaXMgc2ltaWxhciB0byB3aGF0IHg4
NiBhbmQgYXJtIG1wYW0gYWxzbyBkbyBzaW5jZSBpdCBpcyBpbXBvcnRhbnQKYmVmb3JlIGFueSBy
ZXNjdHJsIGNvZGUgaXMgY2FsbGVkLiBmb3JfZWFjaF9yZHRfcmVzb3VyY2UoKSB3aWxsIGdldApz
dHVjayBpbiBhIGxvb3AgaWYgdGhlIHJpZCB2YWx1ZXMgYXJlIG5vdCBpbml0aWFsaXplZC4gSW4g
Y29udHJhc3QsCmNicXJpX3Jlc2N0cmxfY29udHJvbF9pbml0KCkgb25seSBoYW5kbGVzIHRoZSBy
ZXNvdXJjZXMgZm9yIHdoaWNoCmNicXJpX3Jlc2N0cmxfcGlja19jYWNoZXMoKSBmb3VuZCBhIGNv
bnRyb2xsZXIuCgpUaGUgaW5pdGlhbGl6YXRpb24gY291bGQgYmUgbW92ZWQgaW50byBjYnFyaV9y
ZXNjdHJsX2NvbnRyb2xfaW5pdCgpCmJlZm9yZSBhbnkgZWFybHkgcmV0dXJuIHBhdGhzIGJ1dCBp
dCBkb2VzIGludHJvZHVjZSB0aGUgcG9zc2liaWxpdHkgdGhhdApyaWQgaW5pdGlhbGl6YXRpb24g
Y291bGQgYmUgbWlzc2VkIGlmIGNicXJpX3Jlc2N0cmxfY29udHJvbF9pbml0KCkgaXMKZXZlciBy
ZWZhY3RvcmVkLiBHaXZlbiB0aGF0LCBJJ20gaW5jbGluZWQgdG8ga2VlcCB0aGUgY3VycmVudCBz
dHJ1Y3R1cmUuCgpUaGFua3MsCkRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
