Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B72E87859
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 20:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rppx5sAKkCzWa5a6yMpQaE2+DrFMGtC3I/jpFQqPthQ=; b=fFV+SleerHsEYg
	G7VL2c1SajInMuNNYKH43vre2O0Np8HbbFeHd85GnPlYuEFdUrBXtG7GjyxYWx5u2SfRRXuutkdK6
	+3y1V6xoVkNkqEtoxnWxJ3NwsHU4TNuYPm96bG5hWU2k9DSS6jPTgRPZ23p7r56Irr2VjzqAR/aOn
	FJAeNfj7lDqvbV/IWQGw3zsT4pEDI+TDFOGqPrsESel7tT2GJAJ/3Wp5asMHhULz2bXh9qcK9pQ0S
	pOPe/9rg0ShONhBEg5zyC7QIKvv2bhphELHP/1lqz5rvdJeusLi4Gw+TMeUhLrCrMa5kTkWOKVHj8
	aR5Ft9KAN3A1hDjwQcBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnMZq-00000007HGy-2rjC;
	Tue, 03 Feb 2026 20:00:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnMZp-00000007HGn-1vYC
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 20:00:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 37A1760135;
	Tue,  3 Feb 2026 20:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C604C116D0;
	Tue,  3 Feb 2026 20:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770148843;
	bh=eKNCgEBO6pJ63QzdwEPsSvrcDi0qCByDuzz0mMYiFKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vgjzg0JCTwi6+FOUDOBQKyIoi3VkM882ESZIcy/MG2dCcCJs9Ai4arJyd0ixH8v7m
	 S7It/2f7BM11O0G7UWgPil4+56euEY5wTzKUXrz/IXiLRouE1vxXoSrSuYg+QRj5Zt
	 9ltn3owIlgdSX0rys2mVxyHescG6B/LRC7Lmaam45gPO9xj3d1bdmLcdCDhiSADNL2
	 777RTr+vSdumMGGFRngZI+TZ2HzwitiZbd3y7h8kX34Snxiisu/uiy5mP4W1V0Brac
	 ComsQ4qzNb+IUiacCvJBGtYNo7CMxAg39nNbwHdAOyUksePbGrCtKaJZG2ODB6B90l
	 i/ejsWPrZKCag==
Date: Tue, 3 Feb 2026 12:00:42 -0800
From: Drew Fustini <fustini@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Subject: Re: [External] [PATCH RFC v2 16/17] acpi: riscv: Parse RISC-V
 Quality of Service Controller (RQSC) table
Message-ID: <aYJT6pjtWZIUBc1J@x1>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
 <20260128-ssqosid-cbqri-v2-16-dca586b091b9@kernel.org>
 <CAEEQ3wnAqSFUhezyUmJQut8eXThGJ1zxtdNTbFtJusyDstgVUg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wnAqSFUhezyUmJQut8eXThGJ1zxtdNTbFtJusyDstgVUg@mail.gmail.com>
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

T24gTW9uLCBGZWIgMDIsIDIwMjYgYXQgMDc6MDg6NDhQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBEcmV3LAo+IAo+IE9uIFRodSwgSmFuIDI5LCAyMDI2IGF0IDQ6MjjigK9BTSBEcmV3
IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gQWRkIGRyaXZlciB0
byBwYXJzZSB0aGUgQUNQSSBSSVNDLVYgUXVhbGl0eSBvZiBTZXJ2aWNlIENvbnRyb2xsZXIgKFJR
U0MpCj4gPiB0YWJsZSB3aGljaCBkZXNjcmliZXMgdGhlIGNhcGFjaXR5IGFuZCBiYW5kd2lkdGgg
UW9TIGNvbnRyb2xsZXJzIGluIGEKPiA+IHN5c3RlbS4gVGhlIFFvUyBjb250cm9sbGVycyBpbXBs
ZW1lbnQgdGhlIFJJU0MtViBDYXBhY2l0eSBhbmQgQmFuZHdpZHRoCj4gPiBDb250cm9sbGVyIFFv
UyBSZWdpc3RlciBJbnRlcmZhY2UgKENCUVJJKSBzcGVjaWZpY2F0aW9uLgo+ID4KPiA+IExpbms6
IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LWNicXJpL3JlbGVhc2VzL3Rh
Zy92MS4wCj4gPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1y
cXNjL2Jsb2IvbWFpbi9zcmMvCj4gPiBTaWduZWQtb2ZmLWJ5OiBEcmV3IEZ1c3RpbmkgPGZ1c3Rp
bmlAa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAg
IHwgICAxICsKPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FjcGkuaCB8ICAxMCArKysrCj4g
PiAgZHJpdmVycy9hY3BpL3Jpc2N2L01ha2VmaWxlICAgfCAgIDIgKy0KPiA+ICBkcml2ZXJzL2Fj
cGkvcmlzY3YvcnFzYy5jICAgICB8IDExMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDEyNCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gPgpbLi5dCj4gPiAraW50IGFjcGlfcGFyc2VfcnFzYyhzdHJ1Y3QgYWNwaV90
YWJsZV9oZWFkZXIgKnRhYmxlKQo+ID4gK3sKPiA+ICsgICAgICAgc3RydWN0IGFjcGlfdGFibGVf
cnFzYyAqcnFzYzsKPiA+ICsgICAgICAgaW50IGVycjsKPiA+ICsKPiA+ICsgICAgICAgQlVHX09O
KGFjcGlfZGlzYWJsZWQpOwo+ID4gKyAgICAgICBpZiAoIXRhYmxlKSB7Cj4gPiArICAgICAgICAg
ICAgICAgcnFzYyA9IGFjcGlfZ2V0X3Jxc2MoKTsKPiA+ICsgICAgICAgICAgICAgICBpZiAoIXJx
c2MpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0VOVDsKPiA+ICsgICAg
ICAgfSBlbHNlIHsKPiA+ICsgICAgICAgICAgICAgICBycXNjID0gKHN0cnVjdCBhY3BpX3RhYmxl
X3Jxc2MgKil0YWJsZTsKPiA+ICsgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICBmb3IgKGludCBp
ID0gMDsgaSA8IHJxc2MtPm51bTsgaSsrKSB7Cj4gPiArICAgICAgICAgICAgICAgc3RydWN0IGNi
cXJpX2NvbnRyb2xsZXJfaW5mbyAqY3RybF9pbmZvOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAg
IGN0cmxfaW5mbyA9IGt6YWxsb2Moc2l6ZW9mKCpjdHJsX2luZm8pLCBHRlBfS0VSTkVMKTsKPiA+
ICsgICAgICAgICAgICAgICBpZiAoIWN0cmxfaW5mbykKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiAtRU5PTUVNOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIGN0cmxfaW5mby0+
dHlwZSA9IHJxc2MtPmZbaV0udHlwZTsKPiA+ICsgICAgICAgICAgICAgICBjdHJsX2luZm8tPmFk
ZHIgPSBycXNjLT5mW2ldLnJlZ1sxXTsKPiA+ICsgICAgICAgICAgICAgICBjdHJsX2luZm8tPnNp
emUgPSBDQlFSSV9DVFJMX1NJWkU7Cj4gPiArICAgICAgICAgICAgICAgY3RybF9pbmZvLT5yY2lk
X2NvdW50ID0gcnFzYy0+ZltpXS5yY2lkOwo+ID4gKyAgICAgICAgICAgICAgIGN0cmxfaW5mby0+
bWNpZF9jb3VudCA9IHJxc2MtPmZbaV0ubWNpZDsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICBw
cl9pbmZvKCJGb3VuZCBjb250cm9sbGVyIHdpdGggdHlwZSAldSBhZGRyIDB4JWx4IHNpemUgICVs
dSByY2lkICAldSBtY2lkICAldSIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjdHJsX2lu
Zm8tPnR5cGUsIGN0cmxfaW5mby0+YWRkciwgY3RybF9pbmZvLT5zaXplLAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgY3RybF9pbmZvLT5yY2lkX2NvdW50LCBjdHJsX2luZm8tPm1jaWRfY291
bnQpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIGlmIChjdHJsX2luZm8tPnR5cGUgPT0gQ0JR
UklfQ09OVFJPTExFUl9UWVBFX0NBUEFDSVRZKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICBjdHJsX2luZm8tPmNhY2hlLmNhY2hlX2lkID0gcnFzYy0+ZltpXS5yZXMuaWQxOwo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgY3RybF9pbmZvLT5jYWNoZS5jYWNoZV9sZXZlbCA9Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZpbmRfYWNwaV9jYWNoZV9sZXZlbF9mcm9t
X2lkKGN0cmxfaW5mby0+Y2FjaGUuY2FjaGVfaWQpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IGFjcGlfcHB0dF9jYWNoZSAqY2FjaGU7Cj4gPiArCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICBjYWNoZSA9IGZpbmRfYWNwaV9jYWNoZV9mcm9tX2lkKGN0cmxfaW5m
by0+Y2FjaGUuY2FjaGVfaWQpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKGNhY2hl
KSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGN0cmxfaW5mby0+Y2FjaGUu
Y2FjaGVfc2l6ZSA9IGNhY2hlLT5zaXplOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgfSBl
bHNlIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJfd2FybigiJXMoKTog
ZmFpbGVkIHRvIGRldGVybWluZSBzaXplIGZvciBjYWNoZSBpZCAweCV4IiwKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgY3RybF9pbmZvLT5jYWNo
ZS5jYWNoZV9pZCk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGN0cmxfaW5m
by0+Y2FjaGUuY2FjaGVfc2l6ZSA9IDA7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICB9Cj4g
PiArCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBwcl9pbmZvKCJDYWNoZSBjb250cm9sbGVy
IGhhcyBJRCAweCV4IGxldmVsICV1IHNpemUgJXUgIiwKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY3RybF9pbmZvLT5jYWNoZS5jYWNoZV9pZCwgY3RybF9pbmZvLT5jYWNoZS5j
YWNoZV9sZXZlbCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3RybF9pbmZv
LT5jYWNoZS5jYWNoZV9zaXplKTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIC8q
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgKiBGb3IgQ0JRUkksIGFueSBjcHUgKHRlY2hu
aWNhbGx5IGEgaGFydCBpbiBSSVNDLVYgdGVybXMpCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgKiBjYW4gYWNjZXNzIHRoZSBtZW1vcnktbWFwcGVkIHJlZ2lzdGVycyBvZiBhbnkgQ0JRUkkK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIGNvbnRyb2xsZXIgaW4gdGhlIHN5c3RlbS4K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAqLwo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgZXJyID0gY3B1bWFza19wYXJzZSgiRkYiLCAmY3RybF9pbmZvLT5jYWNoZS5jcHVfbWFzayk7
Cj4gCj4gSGFyZGNvZGU/IGFjcGlfcHB0dF9nZXRfY3B1bWFza19mcm9tX2NhY2hlX2lkKGN0cmxf
aW5mby0+Y2FjaGUuY2FjaGVfaWQsCj4gJmN0cmxfaW5mby0+Y2FjaGUuY3B1X21hc2spOyA/CgpU
aGFua3MsIEkgd2lsbCBnaXZlIHRoYXQgYSB0cnkgYXMgdGhlIGN1cnJlbnQgdmFsdWUgMHhGRiBp
cyBub3QgZmxleGlibGUuCgpEcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
