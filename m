Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF617CD98ED
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 12:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E2IpG0oSgsbzrzjmUg7SuEE0nHkMlqBHj+6PH4jqKwc=; b=n4SdYHy9gNcaLo
	e1U4MF2FDCDySRqRi6JiTgKiXG0N9P3hC8scJiJKmuEYKVvGcIZozQjkii+6ZUNJW/4v5+khvfr6q
	ZwkUUwK0u2VlrJXEqoO8Od6w89nPxkaoxw8Ny9CB1mAL96xpm+JcZwOBfyMZo8mByhOb0nIAPa80n
	PpVQxIcWzEdEgr8GG97UYxagfpmKNpyqb+36E8JHa4AanOBIFsjGguMWqy1+VyDy+pv5OOOyJWoT4
	I3j5JHturmv46J7MD4pzv3063vmSlXzn18BkrMQJBFjJtjbd3cJ//vbaeZeK+6PyoX3l3DoIQ9ovZ
	hYM0NFPm/Zmo5s8MM4Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBkH-00000001Fz5-1NRr;
	Thu, 18 Jun 2026 12:21:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waBkG-00000001FyI-1oxb;
	Thu, 18 Jun 2026 12:21:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 20C8960008;
	Thu, 18 Jun 2026 12:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014171F000E9;
	Thu, 18 Jun 2026 12:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781785278;
	bh=Jxvhe6p1siX027yhrT2z3XtNk0V+WNmEv1s3Z1RR4ZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Abiv2iO4RiW//8pR9dLhCcfHcyT0i58RzDg5KzLOl4m1sOVrs9DawRFk1ryHLcLTZ
	 GPY4ji0YfFluVDNoGFEQXe/s9wWAINc1y53L2TgIChzRQy+tck3KRiTB4YXjBtxuF/
	 dKOzf0YDV7JDGJYBomYM/m/3eJJw0ECQPGWyOA2dny3d1EqMKYJ5bv0qL/FdTFInjo
	 UwObl+tH/TA8ZI2XIv81QMpK+UGTHEWY2yqpQg+12mo83OKk5o3NZmROcMePyhmjO+
	 piAkoCTIX25wwfovDDqzcGs4sdtJWDhEf0M8suoHHDosU2AvUXb3uErsuxUgwmrIPT
	 xJGfjxrHWZ73A==
Date: Thu, 18 Jun 2026 13:21:08 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Michael Kelley <mhklinux@outlook.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"pjw@kernel.org" <pjw@kernel.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"alex@ghiti.fr" <alex@ghiti.fr>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"kees@kernel.org" <kees@kernel.org>,
	"nathan@kernel.org" <nathan@kernel.org>,
	"linusw@kernel.org" <linusw@kernel.org>,
	"ojeda@kernel.org" <ojeda@kernel.org>,
	"david.kaplan@amd.com" <david.kaplan@amd.com>,
	"lukas.bulwahn@redhat.com" <lukas.bulwahn@redhat.com>,
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"timothy.hayes@arm.com" <timothy.hayes@arm.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"thuth@redhat.com" <thuth@redhat.com>,
	"oupton@kernel.org" <oupton@kernel.org>,
	"yeoreum.yun@arm.com" <yeoreum.yun@arm.com>,
	"miko.lenczewski@arm.com" <miko.lenczewski@arm.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"kevin.brodsky@arm.com" <kevin.brodsky@arm.com>,
	"james.clark@linaro.org" <james.clark@linaro.org>,
	"tabba@google.com" <tabba@google.com>,
	"mrigendra.chaubey@gmail.com" <mrigendra.chaubey@gmail.com>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"anshuman.khandual@arm.com" <anshuman.khandual@arm.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH RFC 3/3] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
Message-ID: <ajPitENEHWa8lDfC@willie-the-truck>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-4-ruanjinjie@huawei.com>
 <SN6PR02MB41575306521E6223561F476FD4182@SN6PR02MB4157.namprd02.prod.outlook.com>
 <e96a2579-c010-4198-a2a3-6ba35b14aef0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e96a2579-c010-4198-a2a3-6ba35b14aef0@huawei.com>
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

SGkgSmluamllLAoKT24gTW9uLCBKdW4gMTUsIDIwMjYgYXQgMDQ6NTE6NDhQTSArMDgwMCwgSmlu
amllIFJ1YW4gd3JvdGU6Cj4gT24gNi8xMi8yMDI2IDExOjQ1IFBNLCBNaWNoYWVsIEtlbGxleSB3
cm90ZToKPiA+IEZyb206IEppbmppZSBSdWFuIDxydWFuamluamllQGh1YXdlaS5jb20+IFNlbnQ6
IFRodXJzZGF5LCBKdW5lIDExLCAyMDI2IDY6MzggQU0KPiA+Pgo+ID4+IFN1cHBvcnQgZm9yIHBh
cmFsbGVsIHNlY29uZGFyeSBDUFUgYnJpbmd1cCBpcyBhbHJlYWR5IHV0aWxpemVkIGJ5IHg4NiwK
PiA+PiBNSVBTLCBhbmQgUklTQy1WLiBUaGlzIHBhdGNoIGJyaW5ncyB0aGlzIGNhcGFiaWxpdHkg
dG8gdGhlIGFybTY0Cj4gPj4gYXJjaGl0ZWN0dXJlLgo+ID4+Cj4gPj4gUmV3b3JrIHRoZSBnbG9i
YWwgYHNlY29uZGFyeV9kYXRhYCBhY2Nlc3NlZCBkdXJpbmcgZWFybHkgYm9vdCBpbnRvCj4gPj4g
YSBwZXItQ1BVIGFycmF5LiBUaGlzIGFycmF5IG1hcHMgbG9naWNhbCBDUFUgSURzIHRvIE1QSURS
X0VMMSB2YWx1ZXMsCj4gPj4gZW5hYmxpbmcgdGhlIGVhcmx5IGJvb3QgY29kZSBpbiBoZWFkLlMg
dG8gcmVzb2x2ZSBlYWNoIHNlY29uZGFyeSBDUFUncwo+ID4+IGxvZ2ljYWwgSUQgY29uY3VycmVu
dGx5Lgo+ID4+Cj4gPj4gVG8gZnVsbHkgZW5hYmxlIEhPVFBMVUdfUEFSQUxMRUwsIHRoaXMgcGF0
Y2ggaW1wbGVtZW50czoKPiA+PiAxKSBBbiBhcm02NC1zcGVjaWZpYyBhcmNoX2NwdWhwX2tpY2tf
YXBfYWxpdmUoKSBoYW5kbGVyLgo+ID4+IDIpIENhbGxiYWNrcyB0byBjcHVocF9hcF9zeW5jX2Fs
aXZlKCkgaW5zaWRlIHNlY29uZGFyeV9zdGFydF9rZXJuZWwoKS4KPiA+Pgo+ID4+IFN1Y2Nlc3Nm
dWxseSB0ZXN0ZWQgb24gUUVNVSBBUk02NCB2aXJ0IG1hY2hpbmUgKEtWTSBvbiwgMTI4IHZDUFVz
KS4KPiA+Pgo+ID4+IHwgICAgIHRlc3Qga2VybmVsCSAgIHwgc2Vjb25kYXJ5IENQVXMgYm9vdCB0
aW1lIHwKPiA+PiB8ICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0gICB8CS0tLS0tLS0tLS0tLS0tLS0t
LS0tICB8Cj4gPj4gfCAgIFdpdGhvdXQgdGhpcyBwYXRjaCAgICAgfAkJMTU1LjY3MgkgICAgICB8
Cj4gPj4gfCAgIGNwdWhwLnBhcmFsbGVsPTAJICAgfAkJNjIuODk3CSAgICAgIHwKPiA+PiB8ICAg
Y3B1aHAucGFyYWxsZWw9MQkgICB8CQkxNjYuNzAzCSAgICAgIHwKPiA+IAo+ID4gVGhlIGxhc3Qg
dHdvIHJvd3Mgc2VlbSBtaXhlZCB1cC4gSSB3b3VsZCBleHBlY3QgcGFyYWxsZWw9MCB0bwo+ID4g
cmVzdWx0IGluIGEgbG9uZ2VyIGJvb3QgdGltZS4KPiAKPiBIaSwgTWljaGFlbCwKPiAKPiBUaGUg
cmVzdWx0cyBhcmUgY29ycmVjdCBhbmQgbm90IG1peGVkIHVwLgo+IAo+IENvbXBhcmVkIHRvIHRo
ZSBvcmlnaW5hbCBub27igJFIT1RQTFVHX1BBUkFMTEVMIGFwcHJvYWNoLCB0aGUgYWR2YW50YWdl
IG9mCj4gY3B1aHAucGFyYWxsZWw9MCBsaWVzIGluIGl0cyB1c2Ugb2YgY3B1X3JlbGF4KGB5aWVs
ZGAgb24gYXJtNjQpIGluc3RlYWQKPiBvZiB0aGUgd2FpdF9mb3JfY29tcGxldGlvbl90aW1lb3V0
KCkgbWVjaGFuaXNtICh3aGljaCBtYXkgY2F1c2Ugc2xlZXAKPiBhbmQgY29udGV4dCBzd2l0Y2hp
bmcpLiBUaGlzIHNpZ25pZmljYW50bHkgcmVkdWNlcyB0aGUgb3ZlcmhlYWQgb2YgVk0KPiBleGl0
cyBhbmQgY29udGV4dCBzd2l0Y2hlcyBpbiBhIEtWTSBndWVzdCwgdGhlcmVieSBjdXR0aW5nIHRo
ZSBzZWNvbmRhcnkKPiBDUFUgYm9vdCB0aW1lIGJ5IG1vcmUgdGhhbiBoYWxmLgoKSSBkb24ndCB0
aGluayB0aGF0J3MgYSBwYXJ0aWN1bGFybHkgY29tcGVsbGluZyByZWFzb24gdG8gZW5hYmxlIHRo
aXMgZm9yCmFybTY0LCBpbiBhbGwgaG9uZXN0eS4gVGhlIHlpZWxkIGluc3RydWN0aW9uIHR5cGlj
YWxseSBkb2Vzbid0IGRvCmFueXRoaW5nIG9uIGFjdHVhbCBhcm02NCBzaWxpY29uLCBzbyB0aGlz
IHByb2JhYmx5IG1lYW5zIHRoYXQgeW91J3JlCmludHJvZHVjaW5nIGJ1c3ktbG9vcHMgd2hpY2gg
dGVuZCB0byBiZSBiYWQgZm9yIHBvd2VyIGFuZCBzY2FsYWJpbGl0eS4KCkkgaW1wbGVtZW50ZWQg
dGhpcyBhIHdoaWxlIGFnbyBbMV0gYnV0IGRpZG4ndCBtYW5hZ2UgdG8gc2VlIG11Y2ggaW4gdGVy
bXMKb2YgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQgYW5kIHNvIEkgZGlkbid0IGJvdGhlciB0byBz
ZW5kIHRoZSBwYXRjaGVzIG91dAphZnRlciB0YWxraW5nIGFib3V0IGl0IGF0IEtWTSBmb3J1bSBb
Ml0uIEhvd2V2ZXIsIGFzIG1lbnRpb25lZCBhdCB0aGUgZW5kCm9mIHRoYXQgdGFsaywgaXQgX2lz
XyBzdGlsbCB1c2VmdWwgZm9yIGNvbmZpZGVudGlhbCBWTXMgdXNpbmcgUFNDSSBzbwpsZXQgbWUg
ZHVzdCBvZmYgbXkgb2xkIHNlcmllcyBhbmQgc2VuZCBpdCBvdXQgdG8gc2VlIHdoYXQgeW91IHRo
aW5rLgoKSXQgcmVsaWVzIG9uIFBTQ0kgdjAuMiwgd2hpY2ggbWVhbnMgd2UgZG9uJ3QgbmVlZCB0
aGUgTlJfQ1BVUyBzaXplIGFycmF5CmZvciBzZWNvbmRhcnlfZGF0YSBhbmQgSSBhbHNvIGhhdmUg
c29tZSBzdXBwb3J0IGZvciBlcnJvciBoYW5kbGluZyAoaXQKZG9lc24ndCBsb29rIGxpa2UgeW91
IGhhbmRsZSBfX2Vhcmx5X2NwdV9ib290X3N0YXR1cyBwcm9wZXJseSkuCgpJdCBsb29rcyBsaWtl
IEkgY291bGQgaW5jbHVkZSB5b3VyIGZpcnN0IHBhdGNoLCB0aG91Z2ghCgpXaWxsCgpbMV0gaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvd2lsbC9saW51eC5n
aXQvbG9nLz9oPWNwdS1ob3RwbHVnClsyXSBodHRwczovL3d3dy55b3V0dWJlLmNvbS93YXRjaD92
PVE2a09zaG5uUXVFCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
