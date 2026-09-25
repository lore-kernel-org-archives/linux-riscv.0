Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CB8C98318
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 00:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4058ndFeSgpYaB3ZALUEsTUkqEsziAxsy06yF+XATUk=; b=0XUjzUYaR+H9eg
	jY3w+KvxB+PU2btgOzGRi67Pt5nfLi1pSniYYziytO2oxybXanqGFL9HmFPaORheNCNP9kbys86Du
	zGvuKbDx3GLcnbogbqfWLjoC1djGqLoKi4YMh1kJaTtFgM6+s8SsWhNz/OlXPvL8b2UvRx+FKpOV4
	y3KWn17UIvf1MOaFVHCxhCYQ1Y4oizdcJDRsNnweZGhp4FR4+tUPjb1An9Y+0tPntPos8duF3V10w
	3BFO+VpQlhnrnvpOFfUBhMSjC9Xi4lPy/Jn/mraPCWso+yCiWBpr7cWSe4RgbUrLC4D0CFPgNBO3D
	rgiOEH+qEr3SAGrp/HNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9toL-0000000CS7z-11kH;
	Fri, 25 Sep 2026 00:29:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9toK-0000000CS7s-2Cwl
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 00:29:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2343C6022E;
	Fri, 25 Sep 2026 00:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 315411F000FF;
	Fri, 25 Sep 2026 00:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790296146;
	bh=DVBRdfN8FrtxutACwQNau7GOnf++xs028/3aBNx68Es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g4aIuWZW7sdIp7OgfBRDtk2ahfICsbZWX7rEgQPmePr2OWs5ndM+ZAq44I/PCg3Me
	 LJdlaTwYmoReDzi3DdlhfDywY98cChu6idNLfwQkRz9597aZ4svccHWyTObrsmQ14l
	 rs5T+ot4sjmB+4QuchkCF9I6Dis1VqLzkoWxN2ujJ3xFvskPclRqWkLkEqDl2vCCAJ
	 Y6RcsMg+U9aY3FUY6uITm5i7vnGd8zIasb3XqUNz8YzHb0Agr9b5ivqDjmg9R399ab
	 Wp2b+o3hbRArxi7531q4B4UWkynPFRlP/MjHEnx1j496MBmmLuC/qRR6P10QT5xSKf
	 8TiLBUqrSms/g==
Date: Thu, 24 Sep 2026 17:29:05 -0700
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Atish Kumar Patra <atishp@rivosinc.com>,
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
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, devicetree@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 2/5] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Message-ID: <arXAUafBYERE7clK@thelio>
References: <20260917-dfustini-atl-sc-cbqri-dt-v8-0-7964e8d73fe8@kernel.org>
 <20260917-dfustini-atl-sc-cbqri-dt-v8-2-7964e8d73fe8@kernel.org>
 <CAEEQ3w=pDjEGfMtHUamxLFa0+qYuZ=od0OhAUH7_h+ybMAiO4g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3w=pDjEGfMtHUamxLFa0+qYuZ=od0OhAUH7_h+ybMAiO4g@mail.gmail.com>
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

T24gV2VkLCBTZXAgMjMsIDIwMjYgYXQgMDU6MTM6MTVQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBGdXN0aW5pLAo+IAo+IE9uIEZyaSwgU2VwIDE4LCAyMDI2IGF0IDEyOjQx4oCvQU0g
RHJldyBGdXN0aW5pIDxmdXN0aW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IFdpcmUgQ0JR
UkkgY2FwYWNpdHkgY29udHJvbGxlcnMgaW50byByZXNjdHJsIGFzIFJEVF9SRVNPVVJDRV9MMiBh
bmQKPiA+IFJEVF9SRVNPVVJDRV9MMyBzY2hlbWF0YS4KPiA+Cj4gPiByZXNjdHJsIGV4cG9zZXMg
YSBzaW5nbGUgY2FwYWNpdHkgbWFzayBwZXIgcmVzb3VyY2UsIHNvIHdoZW4gbW9yZSB0aGFuCj4g
PiBvbmUgY2FwYWNpdHkgY29udHJvbGxlciBiYWNrcyBhIGNhY2hlIGxldmVsIHRoZXkgbXVzdCBy
ZXBvcnQgdGhlIHNhbWUKPiA+IG51bWJlciBvZiBjYXBhY2l0eSBibG9ja3MuIFRoZSBzYW1lIGhv
bGRzIGZvciB0aGUgb3RoZXIgY2FwYWJpbGl0aWVzCj4gPiByZXNjdHJsIGV4cG9zZXMgb25jZSBw
ZXIgcmVzb3VyY2UuIEEgbGV2ZWwgd2hvc2UgY29udHJvbGxlcnMgZGlzYWdyZWUKPiA+IGlzIGxl
ZnQgdW5leHBvc2VkLiBPdGhlciBsZXZlbHMgYXJlIHVuYWZmZWN0ZWQuCj4gPgo+ID4gQ29udHJv
bCBkb21haW5zIGFyZSBjcmVhdGVkIGluIHRoZSBjcHVocCBvbmxpbmUgY2FsbGJhY2sgYW5kIGtl
eWVkIG9uCj4gPiB0aGUgb25saW5pbmcgQ1BVJ3MgY2FjaGUgaWQgZnJvbSBjYWNoZWluZm8sIHNv
IGEgQ1BVIHRoYXQgaXMgb2ZmbGluZSBhdAo+ID4gcHJvYmUgdGltZSBzdGlsbCBqb2lucyBpdHMg
ZG9tYWluIG9uY2UgaXQgY29tZXMgb25saW5lLiBBIGRvbWFpbiBpcwo+ID4gcHVibGlzaGVkIG9u
IHRoZSBjdHJsX2RvbWFpbnMgUkNVIGxpc3Qgb25seSBhZnRlciBpdCBpcyBmdWxseQo+ID4gaW5p
dGlhbGl6ZWQgYW5kIGJyb3VnaHQgb25saW5lLCBhbmQgcmVtb3ZlZCBmcm9tIHRoZSBsaXN0IGJl
Zm9yZSBpdCBpcwo+ID4gdGFrZW4gb2ZmbGluZSwgZm9sbG93aW5nIHRoZSBkb2N1bWVudGVkIHNh
ZmUgdHJhdmVyc2FsIHJ1bGVzLgo+ID4KPiA+IEFzc2lzdGVkLWJ5OiBMTE0KPiA+IFRlc3RlZC1i
eTogQ2hlbiBQZWkgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT4KPiA+IENvLWRldmVsb3BlZC1i
eTogQWRyaWVuIFJpY2NpYXJkaSA8YXJpY2NpYXJkaUBiYXlsaWJyZS5jb20+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBBZHJpZW4gUmljY2lhcmRpIDxhcmljY2lhcmRpQGJheWxpYnJlLmNvbT4KPiA+IFNp
Z25lZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8ZnVzdGluaUBrZXJuZWwub3JnPgo+ID4gLS0tCj4g
PiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwo+ID4gIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vcmVzY3RybC5oIHwgMTQ3ICsrKysrKysrCj4gPiAgZHJpdmVycy9yZXNj
dHJsL0tjb25maWcgICAgICAgICAgfCAgIDQgKwo+ID4gIGRyaXZlcnMvcmVzY3RybC9NYWtlZmls
ZSAgICAgICAgIHwgICAxICsKPiA+ICBkcml2ZXJzL3Jlc2N0cmwvY2JxcmlfcmVzY3RybC5jICB8
IDc4NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICA1IGZpbGVz
IGNoYW5nZWQsIDkzOSBpbnNlcnRpb25zKCspClsuLl0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3Jlc2N0cmwvY2JxcmlfcmVzY3RybC5jIGIvZHJpdmVycy9yZXNjdHJsL2NicXJpX3Jlc2N0cmwu
YwpbLi5dCj4gPiArLyoKPiA+ICsgKiBOb3RlIGFib3V0IHRlcm1pbm9sb2d5IGJldHdlZW4geDg2
IChJbnRlbCBSRFQvQU1EIFFvUykgYW5kIFJJU0MtVjoKPiA+ICsgKiAgIENMT1NJRCBvbiB4ODYg
aXMgUkNJRCBvbiBSSVNDLVYKPiA+ICsgKiAgICAgUk1JRCBvbiB4ODYgaXMgTUNJRCBvbiBSSVND
LVYKPiA+ICsgKi8KPiA+ICt1MzIgcmVzY3RybF9hcmNoX2dldF9udW1fY2xvc2lkKHN0cnVjdCBy
ZHRfcmVzb3VyY2UgKnJlcykKPiA+ICt7Cj4gPiArICAgICAgIHN0cnVjdCBjYnFyaV9yZXNjdHJs
X3JlcyAqaHdfcmVzOwo+ID4gKwo+ID4gKyAgICAgICBod19yZXMgPSBjb250YWluZXJfb2YocmVz
LCBzdHJ1Y3QgY2JxcmlfcmVzY3RybF9yZXMsIHJlc2N0cmxfcmVzKTsKPiA+ICsKPiA+ICsgICAg
ICAgaWYgKCFod19yZXMtPmN0cmwpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gPiAr
Cj4gPiArICAgICAgIHJldHVybiBod19yZXMtPmN0cmwtPnJjaWRfY291bnQ7Cj4gPiArfQo+IAo+
IFdoZW4gQ0RQIGlzIGVuYWJsZWQsIHRoZSByZXNjdHJsIGNvcmUgaGFsdmVzIHRoZSB2YWx1ZSBy
ZXR1cm5lZCBieQo+IHJlc2N0cmxfYXJjaF9nZXRfbnVtX2Nsb3NpZCgpLiBJcyB0aGF0IGNvcnJl
Y3QgZm9yIENCUVJJPwo+IENCUVJJIHYxLjAgZGVmaW5lcyBhbGxvY2F0aW9uIHVzaW5nIGFuIChS
Q0lELCBBVCkgcGFpciwgYW5kIGl0cyBleGFtcGxlCj4gdXNlcyB0aGUgc2FtZSBSQ0lEPTUgZm9y
IHNlcGFyYXRlIEFUPTAgYW5kIEFUPTEgYWxsb2NhdGlvbnMuCj4gCj4gVGhhbmtzLAo+IFl1bmh1
aQoKWW91J3JlIHJpZ2h0IHRoYXQgdGhpcyBpcyBub3QgbmVlZGVkIGZvciBSSVNDLVYuIENEUCBp
cyBzdGlsbCBmdW5jdGlvbmFsCmJ1dCB0aGUgdXBwZXIgaGFsZiBvZiBSQ0lEcyBpcyB1bnVzZWQu
CgpJdCB3b3VsZCByZXF1aXJlIGFuIGZzL3Jlc2N0cmwgY2hhbmdlIHRvIG1ha2UgdGhlIGhhbHZp
bmcgY29uZGl0aW9uYWwuClRoZXJlZm9yZSwgSSB3b3VsZCBsaWtlIHRvIGRlYWwgd2l0aCB0aGF0
IGluIGEgc2VwYXJhdGUgc2VyaWVzIGFuZCBub3QKZXhwYW5kIHRoZSBzY29wZSBvZiB0aGlzIHNl
cmllcy4gSSB3aWxsIGFkZCBhIGNvbW1lbnQgYWJvdmUKcmVzY3RybF9hcmNoX2dldF9udW1fY2xv
c2lkKCkgZm9yIHY5LCBzbyB0aGUgY3VycmVudCBzaXR1YXRpb24gaXMKb2J2aW91cy4KClRoYW5r
cywKRHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
