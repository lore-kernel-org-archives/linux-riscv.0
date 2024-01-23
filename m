Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C690C47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 09:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bf374XShouGVeKubybmZS0rhhixRxmoxfW68Mxi8EnU=; b=F71iV8X7CzDsX7
	he+G+F1/jo9b6ZDcwPvO5lvOsSuv+qNAn/CbuXzo8FnuOG4uyaW3BAqXOunfGtFlRdItrpYktuq03
	TWCPITydqQ4bSFOVLQaQAY3yfbIaW1sh2zvmUfOLSeiEKA1ImZ0+nsbzIv44s7sj9n8Z626BfESr1
	TnIkK7lWp5baxDWhy4lET7DQ//wBvCn2baXyLiJ38+r7tfKFZgiMGMOYPizkbwKhn30xpn2b5jqcs
	Cd91e7Ex+FnjZBl6tf6Wk5eFVLa2zMVC+lvYXUkcPKcwx+hSS45ybJOXGTV3fOWU9imwK8hSHi4GC
	SvPlbQ7eOawfRAuLCdYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSD4I-00FkUU-1c;
	Tue, 23 Jan 2024 09:27:42 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSD4E-00FkRI-22;
	Tue, 23 Jan 2024 09:27:40 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TK1rm0gmyz6K6JX;
	Tue, 23 Jan 2024 17:24:56 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 9EBF81406AD;
	Tue, 23 Jan 2024 17:27:26 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Jan
 2024 09:27:26 +0000
Date: Tue, 23 Jan 2024 09:27:25 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, <linux-pm@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-acpi@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <x86@kernel.org>,
	<acpica-devel@lists.linuxfoundation.org>, <linux-csky@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-ia64@vger.kernel.org>,
	<linux-parisc@vger.kernel.org>, Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>, <jianyong.wu@arm.com>,
	<justin.he@arm.com>, James Morse <james.morse@arm.com>,
	<vishnu@os.amperecomputing.com>, <miguel.luis@oracle.com>
Subject: Re: [PATCH RFC v3 03/21] ACPI: processor: Register CPUs that are
 online, but not described in the DSDT
Message-ID: <20240123092725.00004382@Huawei.com>
In-Reply-To: <Za6mHRJVjb6M1mun@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
	<E1rDOg2-00Dvjk-RI@rmk-PC.armlinux.org.uk>
	<CAJZ5v0ju1JHgpjuFLHZVs4NZiARG6iBZN_wza6c2e0kDhZjK0w@mail.gmail.com>
	<ZaURtUvWQyjYfiiO@shell.armlinux.org.uk>
	<20240122160227.00002d83@Huawei.com>
	<CAJZ5v0hamuXJ_w-TSmVb=5jGide=Lb7sCjbzzNb_rFuPrvkgxQ@mail.gmail.com>
	<Za6mHRJVjb6M1mun@shell.armlinux.org.uk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_012738_950236_9CD30FCB 
X-CRM114-Status: GOOD (  39.43  )
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

T24gTW9uLCAyMiBKYW4gMjAyNCAxNzozMDowNSArMDAwMAoiUnVzc2VsbCBLaW5nIChPcmFjbGUp
IiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKCj4gT24gTW9uLCBKYW4gMjIsIDIwMjQg
YXQgMDU6MjI6NDZQTSArMDEwMCwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gPiBPbiBNb24s
IEphbiAyMiwgMjAyNCBhdCA1OjAy4oCvUE0gSm9uYXRoYW4gQ2FtZXJvbgo+ID4gPEpvbmF0aGFu
LkNhbWVyb25AaHVhd2VpLmNvbT4gd3JvdGU6ICAKPiA+ID4KPiA+ID4gT24gTW9uLCAxNSBKYW4g
MjAyNCAxMTowNjoyOSArMDAwMAo+ID4gPiAiUnVzc2VsbCBLaW5nIChPcmFjbGUpIiA8bGludXhA
YXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+ID4gIAo+ID4gPiA+IE9uIE1vbiwgRGVjIDE4LCAy
MDIzIGF0IDA5OjIyOjAzUE0gKzAxMDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOiAgCj4gPiA+
ID4gPiBPbiBXZWQsIERlYyAxMywgMjAyMyBhdCAxOjQ54oCvUE0gUnVzc2VsbCBLaW5nIDxybWsr
a2VybmVsQGFybWxpbnV4Lm9yZy51az4gd3JvdGU6ICAKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
RnJvbTogSmFtZXMgTW9yc2UgPGphbWVzLm1vcnNlQGFybS5jb20+Cj4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+IEFDUEkgaGFzIHR3byBkZXNjcmlwdGlvbnMgb2YgQ1BVcywgb25lIGluIHRoZSBNQURU
L0FQSUMgdGFibGUsIHRoZSBvdGhlcgo+ID4gPiA+ID4gPiBpbiB0aGUgRFNEVC4gQm90aCBhcmUg
cmVxdWlyZWQuIChBQ1BJIDYuNSdzIDguNCAiRGVjbGFyaW5nIFByb2Nlc3NvcnMiCj4gPiA+ID4g
PiA+IHNheXMgIkVhY2ggcHJvY2Vzc29yIGluIHRoZSBzeXN0ZW0gbXVzdCBiZSBkZWNsYXJlZCBp
biB0aGUgQUNQSQo+ID4gPiA+ID4gPiBuYW1lc3BhY2UiKS4gSGF2aW5nIHR3byBkZXNjcmlwdGlv
bnMgYWxsb3dzIGZpcm13YXJlIGF1dGhvcnMgdG8gZ2V0Cj4gPiA+ID4gPiA+IHRoaXMgd3Jvbmcu
Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IElmIENQVXMgYXJlIGRlc2NyaWJlZCBpbiB0aGUgTUFE
VC9BUElDLCB0aGV5IHdpbGwgYmUgYnJvdWdodCBvbmxpbmUKPiA+ID4gPiA+ID4gZWFybHkgZHVy
aW5nIGJvb3QuIE9uY2UgdGhlIHJlZ2lzdGVyX2NwdSgpIGNhbGxzIGFyZSBtb3ZlZCB0byBBQ1BJ
LAo+ID4gPiA+ID4gPiB0aGV5IHdpbGwgYmUgYmFzZWQgb24gdGhlIERTRFQgZGVzY3JpcHRpb24g
b2YgdGhlIENQVXMuIFdoZW4gQ1BVcyBhcmUKPiA+ID4gPiA+ID4gbWlzc2luZyBmcm9tIHRoZSBE
U0RUIGRlc2NyaXB0aW9uLCB0aGV5IHdpbGwgZW5kIHVwIG9ubGluZSwgYnV0IG5vdAo+ID4gPiA+
ID4gPiByZWdpc3RlcmVkLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBBZGQgYSBoZWxwZXIgdGhh
dCBydW5zIGFmdGVyIGFjcGlfaW5pdCgpIGhhcyBjb21wbGV0ZWQgdG8gcmVnaXN0ZXIKPiA+ID4g
PiA+ID4gQ1BVcyB0aGF0IGFyZSBvbmxpbmUsIGJ1dCB3ZXJlbid0IGZvdW5kIGluIHRoZSBEU0RU
LiBBbnkgQ1BVIHRoYXQKPiA+ID4gPiA+ID4gaXMgcmVnaXN0ZXJlZCBieSB0aGlzIGNvZGUgdHJp
Z2dlcnMgYSBmaXJtd2FyZS1idWcgd2FybmluZyBhbmQga2VybmVsCj4gPiA+ID4gPiA+IHRhaW50
Lgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBRZW11IFRDRyBvbmx5IGRlc2NyaWJlcyB0aGUgZmly
c3QgQ1BVIGluIHRoZSBEU0RULCB1bmxlc3MgY3B1LWhvdHBsdWcKPiA+ID4gPiA+ID4gaXMgY29u
ZmlndXJlZC4gIAo+ID4gPiA+ID4KPiA+ID4gPiA+IFNvIHdoeSBpcyB0aGlzIGEga2VybmVsIHBy
b2JsZW0/ICAKPiA+ID4gPgo+ID4gPiA+IFNvIHdoYXQgYXJlIHlvdSBwcm9wb3Npbmcgc2hvdWxk
IGJlIHRoZSBiZWhhdmlvdXIgaGVyZT8gV2hhdCB0aGlzCj4gPiA+ID4gc3RhdGVtZW50IHNlZW1z
IHRvIGJlIHNheWluZyBpcyB0aGF0IFFFTVUgYXMgaXQgZXhpc3RzIHRvZGF5IG9ubHkKPiA+ID4g
PiBkZXNjcmliZXMgdGhlIGZpcnN0IENQVSBpbiBEU0RULiAgCj4gPiA+Cj4gPiA+IFRoaXMgY29u
ZnVzZXMgbWUgc29tZXdoYXQsIGJlY2F1c2UgSSdtIGZhciBmcm9tIHN1cmUgd2hpY2ggbWFjaGlu
ZXMgdGhpcwo+ID4gPiBpcyB0cnVlIGZvciBpbiBRRU1VLiAgSSdtIGd1ZXNzaW5nIGl0J3MgYSBs
ZWdhY3kgdGhpbmcgd2l0aAo+ID4gPiBzb21lIG9sZCBkaXN0cm8gdmVyc2lvbiBvZiBRRU1VIC0g
c28gd2UnbGwgaGF2ZSB0byBwYXBlciBvdmVyIGl0IGFueXdheQo+ID4gPiBidXQgZm9yIGN1cnJl
bnQgUUVNVSBJJ20gbm90IHN1cmUgaXQncyB0cnVlLgo+ID4gPgo+ID4gPiBIZWxwZnVsbHkgdGhl
cmUgYXJlIGEgYnVuY2ggb2YgQUNQSSB0YWJsZSB0ZXN0cyBzbyBJJ3ZlIGJlZW4gY2hlY2tpbmcK
PiA+ID4gdGhyb3VnaCBhbGwgdGhlIG11bHRpIENQVSBjYXNlcy4KPiA+ID4KPiA+ID4gQ1BVIGhv
dHBsdWcgbm90IGVuYWJsZWQuCj4gPiA+IHBjL0RTRFQuZGltbXB4bSAgLSA0eCBQcm9jZXNzb3Ig
ZW50cmllcy4gIC1zbXAgNAo+ID4gPiBwYy9EU0RULmFjcGlobWF0IC0gMnggUHJvY2Vzc29yIGVu
dHJpZXMuICAtc21wIDIKPiA+ID4gcTM1L0RTRFQuYWNwaWhtYXQgLSAyeCBQcm9jZXNzb3IgZW50
cmllcy4gLXNtcCAyCj4gPiA+IHZpcnQvRFNEVC5hY3BpaG1hdHZpcnQgLSA0eCBBQ1BJMDAwNyBl
bnRyaWVzIC1zbXAgNAo+ID4gPiBxMzUvRFNEVC5hY3BpaG1hdC1ub2luaXRpYXRvciAtIDQgeCBQ
cm9jZXNzb3IgKCkgZW50cmllcyAtc21wIDQKPiA+ID4gdmlydC9EU0RULnRvcG9sb2d5IC0gOHgg
QUNQSTAwMDcgZW50cmllcwo+ID4gPgo+ID4gPiBJJ3ZlIGFsc28gbG9va2VkIGF0IHRoZSBjb2Rl
IGFuZCB3ZSBoYXZlIHZhcmlvdXMgdHlwZXMgb2YKPiA+ID4gQ1BVIGhvdHBsdWcgb24geDg2IGJ1
dCB0aGV5IGFsbCBidWlsZCBhcHByb3ByaWF0ZSBudW1iZXJzIG9mCj4gPiA+IFByb2Nlc3Nvcigp
IGVudHJpZXMgaW4gRFNEVC4KPiA+ID4gQXJtIGxpa2V3aXNlIHNlZW1zIHRvIGJ1aWxkIHRoZSBy
aWdodCBudW1iZXIgb2YgQUNQSTAwMDcgZW50cmllcwo+ID4gPiAoYW5kIGRvZXNuJ3QgeWV0IGhh
dmUgQ1BVIEhQIHN1cHBvcnQpLgo+ID4gPgo+ID4gPiBJZiBhbnlvbmUgY2FuIGFkZCBhIHJlZmVy
ZW5jZSBvbiB3aHkgdGhpcyBpcyBuZWVkZWQgdGhhdCB3b3VsZCBiZSB2ZXJ5Cj4gPiA+IGhlbHBm
dWwuICAKPiA+IAo+ID4gWWVzLCBpdCB3b3VsZC4KPiA+IAo+ID4gUGVyc29uYWxseSwgSSB3b3Vs
ZCBwcmVmZXIgdG8gYXNzdW1lIHRoYXQgaXQgaXMgbm90IG5lY2Vzc2FyeSB1bnRpbCBpdAo+ID4g
dHVybnMgb3V0IHRoYXQgKDEpIHRoZXJlIGlzIGZpcm13YXJlIHdpdGggdGhpcyBpc3N1ZSBhY3R1
YWxseSBpbiB1c2UKPiA+IGFuZCAoMikgdXBkYXRpbmcgdGhlIGZpcm13YXJlIGluIHF1ZXN0aW9u
IHRvIGZvbGxvdyB0aGUgc3BlY2lmaWNhdGlvbgo+ID4gaXMgbm90IHByYWN0aWNhbC4KPiA+IAo+
ID4gT3RoZXJ3aXNlLCB3ZSdkIG1ha2UgaXQgZWFzaWVyIHRvIHNoaXAgbm9uLWNvbXBsaWFudCBm
aXJtd2FyZSBmb3Igbm8KPiA+IGdvb2QgcmVhc29uLiAgCj4gCj4gSWYgU2FsaWwgY2FuJ3QgY29t
ZSB1cCB3aXRoIGEgcmVhc29uLCB0aGVuIEknbSBpbiBmYXZvdXIgb2YgZHJvcHBpbmcKPiB0aGUg
cGF0Y2ggbGlrZSBhbHJlYWR5IGRvbmUgZm9yIHBhdGNoIDIuIElmIHRoZSBjb2RlIGNoYW5nZSBz
ZXJ2ZXMgbm8KPiB1c2VmdWwgcHVycG9zZSwgdGhlcmUncyBubyBwb2ludCBpbiBtYWtpbmcgdGhl
IGNoYW5nZS4KPiAKClNhbGlsJ3Mgb3V0IHRvZGF5LCBidXQgSSd2ZSBtZXNzYWdlZCBoaW0gdG8g
Zm9sbG93IHVwIGxhdGVyIGluIHRoZSB3ZWVrLgoKSXQgJ21pZ2h0JyBiZSB0aGUgb2RkIGNvbGQg
cGx1ZyBwYXRoIHdoZXJlIFFFTVUgaGFsZiBjb21lcyB1cCwgdGhlbiBleHRyYQpDUFVzIGFyZSBh
ZGRlZCwgdGhlbiBpdCBib290cy4gKHVzZWQgYnkgc29tZSBvcmNoZXN0cmF0aW9uIGZyYW1ld29y
a3MpCkkgZG9uJ3QgaGF2ZSBhIHNldCB1cCBmb3IgdGhhdCBhbmQgSSB3b24ndCBnZXQgdG8gY3Jl
YXRpbmcgb25lIHRvZGF5IGFueXdheQood2UgYWxsIGxvdmUgc3RhcnQgb2YgdGhlIHllYXIgcGxh
bm5pbmcgd29ya3Nob3BzISkKCkkndmUgK0NDJ2QgYSBmZXcgcGVvcGxlIGhhdmUgcnVuIHRlc3Rz
IG9uIHRoZSB2YXJpb3VzIGl0ZXJhdGlvbnMgb2YgdGhpcwp3b3JrIGluIHRoZSBwYXN0LiAgTWF5
YmUgb25lIG9mIHRoZW0gY2FuIHNoZWQgc29tZSBsaWdodCBvbiB0aGlzPwoKSm9uYXRoYW4KCgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
