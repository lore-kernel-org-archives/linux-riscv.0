Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70190C47DDB
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 16:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9iIW8aWVF/VchhN9gPK9n0vWMeMA0oQe8eH1VLm9/e8=; b=k0AduBpeOkiucs
	LGANUqxVefofFmukzfirDrDCkyTW5PX9rfJ2hoaGhhVSN2MY7y9r7Le6j07355S1qqVPFnpdjK6+4
	KVrfIbuQHche/OqgE9dNNxeTRrCxiAeG2qhQ0mF0v/OFS5wD47JoAUQi0EnJcmMFOzEFyaM8is9cK
	i/7FuFxnYyND9Tq3MEIVNdU63AMyp3KHxGhKGamx+HHHcq2nlgT5HORLzV/72MpuoPMjjGxhudG0s
	MdJOhYTXqy3/lktRblkjlso1ZLnlGGCxfex6Ruc2+uU3+e+Pb2mP2Ra7Opl/tiYlRmnsYacmxBBVZ
	FQrRT209f2+gaPSZ0POg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSJlD-00HISK-0m;
	Tue, 23 Jan 2024 16:36:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSJl9-00HIQq-3B;
	Tue, 23 Jan 2024 16:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=l/85CMUwYvGkFstcoi4Kb56LZAx3H/rR4TH74ZR+ABU=; b=aI5GPVMbgrAMQLi/sxpdR2JIEB
	lD7i+cyhbu5o25Cq3bZOXaKDk8cy0Gmn/iCiM5grQc/Lgv5UbI2usWWgflQ0WEMXvX/i374t61Sp8
	JXyHiJfmV1B9tBrrumUkhF4+2QzxPqvR5LjPfK1GpAcTrn3pSCZ87oSUkCMmgZSbzgtfIgXTUbGZP
	B5aJXDK7/UCVmXh2ORo8l0dcCzSBAvDFBXvN+X/ZZMVGJlp1VT7uYvVFvsMO6r3OCSG3dac52Kz7r
	dhMY/wsZf7J+sYDfDey0TJCtGdPZSb8do/Sgu6OnmJ1nLj94n0+uoVuMExEsGDtLPU++QWS5/6er8
	75aVPHTQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33630)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rSJkv-0002kH-2j;
	Tue, 23 Jan 2024 16:36:09 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rSJks-00025O-9V; Tue, 23 Jan 2024 16:36:06 +0000
Date: Tue, 23 Jan 2024 16:36:06 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, acpica-devel@lists.linuxfoundation.org,
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 05/21] ACPI: Rename ACPI_HOTPLUG_CPU to include
 'present'
Message-ID: <Za/q9jivG4OdZM0f@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
 <E1rDOgD-00Dvk2-3h@rmk-PC.armlinux.org.uk>
 <CAJZ5v0g9nfLrEf9u4Ksw6BOWJQ9iv8Z-O8RsLU6jR5zk0ahxRw@mail.gmail.com>
 <20240122180013.000016d5@Huawei.com>
 <Za++/11n5KA1VS3p@shell.armlinux.org.uk>
 <CAJZ5v0h7wsLt8d3ZoLXsK1=crAx66T42WDKNoHcg8CiHpAjS8g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0h7wsLt8d3ZoLXsK1=crAx66T42WDKNoHcg8CiHpAjS8g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_083624_023702_BDF86D30 
X-CRM114-Status: GOOD (  43.17  )
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

T24gVHVlLCBKYW4gMjMsIDIwMjQgYXQgMDU6MTU6NTRQTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gVHVlLCBKYW4gMjMsIDIwMjQgYXQgMjoyOOKAr1BNIFJ1c3NlbGwgS2lu
ZyAoT3JhY2xlKQo+IDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+ID4KPiA+IE9uIE1v
biwgSmFuIDIyLCAyMDI0IGF0IDA2OjAwOjEzUE0gKzAwMDAsIEpvbmF0aGFuIENhbWVyb24gd3Jv
dGU6Cj4gPiA+IE9uIE1vbiwgMTggRGVjIDIwMjMgMjE6MzU6MTYgKzAxMDAKPiA+ID4gIlJhZmFl
bCBKLiBXeXNvY2tpIiA8cmFmYWVsQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiA+IE9u
IFdlZCwgRGVjIDEzLCAyMDIzIGF0IDE6NDnigK9QTSBSdXNzZWxsIEtpbmcgPHJtaytrZXJuZWxA
YXJtbGludXgub3JnLnVrPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBGcm9tOiBKYW1lcyBN
b3JzZSA8amFtZXMubW9yc2VAYXJtLmNvbT4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGUgY29kZSBi
ZWhpbmQgQUNQSV9IT1RQTFVHX0NQVSBhbGxvd3MgYSBub3QtcHJlc2VudCBDUFUgdG8gYmVjb21l
Cj4gPiA+ID4gPiBwcmVzZW50Lgo+ID4gPiA+Cj4gPiA+ID4gUmlnaHQuCj4gPiA+ID4KPiA+ID4g
PiA+IFRoaXMgaXNuJ3QgdGhlIG9ubHkgdXNlIG9mIEhPVFBMVUdfQ1BVLiBPbiBhcm02NCBhbmQg
cmlzY3YKPiA+ID4gPiA+IENQVXMgY2FuIGJlIHRha2VuIG9mZmxpbmUgYXMgYSBwb3dlciBzYXZp
bmcgbWVhc3VyZS4KPiA+ID4gPgo+ID4gPiA+IEJ1dCBzdGlsbCB0aGVyZSBpcyB0aGUgY2FzZSBp
biB3aGljaCBhIG5vbi1wcmVzZW50IENQVSBjYW4gYmVjb21lCj4gPiA+ID4gcHJlc2VudCwgaXNu
J3QgaXQgdGhlcmU/Cj4gPiA+Cj4gPiA+IE5vdCB5ZXQgZGVmaW5lZCBieSB0aGUgYXJjaGl0ZWN0
dXJlcyAoYW5kIEknbSBhc3N1bWluZyBpdCBwcm9iYWJseSBuZXZlciB3aWxsIGJlKS4KPiA+ID4K
PiA+ID4gVGhlIG9yaWdpbmFsIHByb3Bvc2FsIHdlIHRvb2sgdG8gQVJNIHdhcyB0byBkbyBleGFj
dGx5IHRoYXQgLSB0aGV5IHB1c2hlZAo+ID4gPiBiYWNrIGhhcmQgb24gdGhlIGJhc2lzIHRoZXJl
IHdhcyBubyBhcmNoaXRlY3R1cmFsbHkgc2FmZSB3YXkgdG8gaW1wbGVtZW50IGl0Lgo+ID4gPiBU
b28gbXVjaCBvZiB0aGUgQVJNIGFyY2ggaGFzIHRvIGV4aXN0IGZyb20gdGhlIHN0YXJ0IG9mIHRp
bWUuCj4gPiA+Cj4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwv
Y2JhYTZkNjgtNjE0My1lMDEwLTVmM2MtZWM2MmY4NzlhZDk1QGFybS5jb20vCj4gPiA+IGlzIG9u
ZSBvZiB0aGUgcmVsZXZhbnQgdGhyZWFkcyBvZiB0aGUga2VybmVsIHNpZGUgb2YgdGhhdCBkaXNj
dXNzaW9uLgo+ID4gPgo+ID4gPiBOb3QgdG8gcHV0IHNwZWNpZmljIHdvcmRzIGludG8gdGhlIEFS
TSBhcmNoaXRlY3RzIG1vdXRocywgYnV0IHRoZQo+ID4gPiBzaG9ydCBkZXNjcmlwdGlvbiBpcyB0
aGF0IHRoZXJlIGlzIGN1cnJlbnRseSBubyBkZW1hbmQgZm9yIHdvcmtpbmcKPiA+ID4gb3V0IGhv
dyB0byBtYWtlIHBoeXNpY2FsIENQVSBob3RwbHVnIHBvc3NpYmxlLCBhcyBzdWNoIHRoZXkgd2ls
bCBub3QKPiA+ID4gcHJvdmlkZSBhbiBhcmNoaXRlY3R1cmFsbHkgY29tcGxpYW50IHdheSB0byBk
byBpdCBmb3IgdmlydHVhbCBDUFUgaG90cGx1ZyBhbmQKPiA+ID4gYW5vdGhlciBtZWFucyBpcyBu
ZWVkZWQgKHdoaWNoIGlzIHdoeSB0aGlzIHNlcmllcyBkb2Vzbid0IHVzZSB0aGUgcHJlc2VudCBi
aXQKPiA+ID4gZm9yIHRoYXQgcHVycG9zZSBhbmQgd2UgaGF2ZSB0aGUgT25saW5lIGNhcGFibGUg
Yml0IGluIE1BRFQvR0lDQykKPiA+ID4KPiA+ID4gSXQgd2FzIGEgJ2Z1bicgZGFuY2Ugb2Ygc2V2
ZXJhbCB5ZWFycyB0byBnZXQgdG8gdGhhdCBjbGFyaWZpY2F0aW9uLgo+ID4gPiBBcyBhbm90aGVy
IGZ1biBmYWN0LCB0aGUgc2FtZSBpcyBkZWZpbmVkIGZvciB4ODYsIGJ1dCBJIGRvbid0IHRoaW5r
Cj4gPiA+IGFueW9uZSBoYXMgdXNlZCBpdCB5ZXQgKEdJQ0MgZm9yIEFSTSBoYXMgYW4gb25saW5l
IGNhcGFibGUgYml0IGluIHRoZSBmbGFncyB0bwo+ID4gPiBlbmFibGUgdGhpcywgd2hpY2ggd2Fz
IHJlbWFya2FibHkgc2ltaWxhciB0byB0aGUgb25saW5lIGNhcGFibGUgYml0IGluIHRoZQo+ID4g
PiBmbGFncyBvZiB0aGUgTG9jYWwgQVBJQyBlbnRyaWVzIGFzIGFkZGVkIGZhaXJseSByZWNlbnRs
eSkuCj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiA+IE9uIGFybTY0IGFuIG9mZmxpbmUgQ1BVIG1heSBi
ZSBkaXNhYmxlZCBieSBmaXJtd2FyZSwgcHJldmVudGluZyBpdCBmcm9tCj4gPiA+ID4gPiBiZWlu
ZyBicm91Z2h0IGJhY2sgb25saW5lLCBidXQgaXQgcmVtYWlucyBwcmVzZW50IHRocm91Z2hvdXQu
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gQWRkaW5nIGNvZGUgdG8gcHJldmVudCB1c2VyLXNwYWNlIHRy
eWluZyB0byBvbmxpbmUgdGhlc2UgZGlzYWJsZWQgQ1BVcwo+ID4gPiA+ID4gbmVlZHMgc29tZSBh
ZGRpdGlvbmFsIHRlcm1pbm9sb2d5Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IFJlbmFtZSB0aGUgS2Nv
bmZpZyBzeW1ib2wgQ09ORklHX0FDUElfSE9UUExVR19QUkVTRU5UX0NQVSB0byByZWZsZWN0Cj4g
PiA+ID4gPiB0aGF0IGl0IG1ha2VzIHBvc3NpYmxlIENQVXMgcHJlc2VudC4KPiA+ID4gPgo+ID4g
PiA+IEhvbmVzdGx5LCBJIGRvbid0IHRoaW5rIHRoYXQgdGhpcyBjaGFuZ2UgaXMgbmVjZXNzYXJ5
IG9yIGV2ZW4gdXNlZnVsLgo+ID4gPgo+ID4gPiBXaGlsc3QgaXQncyBhbiBhdHRlbXB0IHRvIGF2
b2lkIGZ1dHVyZSBjb25mdXNpb24sIHRoZSByZW5hbWUgaXMKPiA+ID4gbm90IHNvbWV0aGluZyBJ
IHJlYWxseSBjYXJlIGFib3V0IHNvIG15IGFkdmljZSB0byBSdXNzZWxsIGlzIGRyb3AKPiA+ID4g
aXQgdW5sZXNzIHlvdSBhcmUgYXR0YWNoZWQgdG8gaXQhCj4gPgo+ID4gV2hpbGUgSSBhZ3JlZSB0
aGF0IGl0IGlzbid0IGEgbmVjZXNzaXR5LCBJIGRvbid0IGZ1bGx5IGFncmVlIHRoYXQgaXQKPiA+
IGlzbid0IHVzZWZ1bC4KPiA+Cj4gPiBPbmUgb2YgdGhlIGlzc3VlcyB3aWxsIGJlIHRoYXQgd2hp
bGUgQXJtNjQgd2lsbCBzdXBwb3J0IGhvdHBsdWcgdkNQVSwKPiA+IGl0IHdvbid0IGJlIHNldHRp
bmcgQUNQSV9IT1RQTFVHX0NQVSBiZWNhdXNlIGl0IGRvZXNuJ3Qgc3VwcG9ydAo+ID4gdGhlIHBy
ZXNlbnQgYml0IGNoYW5naW5nLiBTbyBJIGNhbiBzZWUgd2h5IEphbWVzIGRlY2lkZWQgdG8gcmVu
YW1lCj4gPiBpdCAtIGJlY2F1c2Ugd2l0aCBBcm02NCdzIGhvdHBsdWcgdkNQVSwgdGhlIGlkZWEg
dGhhdCBBQ1BJX0hPVFBMVUdfQ1BVCj4gPiBzb21laG93IGVuYWJsZXMgaG90cGx1ZyBDUFUgc3Vw
cG9ydCBpcyBub3cgbm8gbG9uZ2VyIHRydWUuCj4gPgo+ID4gS2VlcGluZyBpdCBhcyBBQ1BJX0hP
VFBMVUdfQ1BVIG1ha2VzIHRoZSBjb2RlIGxlc3Mgb2J2aW91cywgYmVjYXVzZSBpdAo+ID4gbGVh
ZHMgb25lIHRvIGFzc3VtZSB0aGF0IGl0IG91Z2h0IHRvIGJlIGVuYWJsZWQgZm9yIEFybTY0J3MK
PiA+IGltcGxlbWVudGF0aW5vbiwgYW5kIHRoYXQgY291bGQgd2VsbCBjYXVzZSBpc3N1ZXMgaW4g
dGhlIGZ1dHVyZSBpZgo+ID4gcGVvcGxlIG1ha2UgdGhlIGFzc3VtcHRpb24gdGhhdCAiQUNQSV9I
T1RQTFVHX0NQVSIgbWVhbnMgaG90cGx1ZyBDUFUKPiA+IGlzIHN1cHBvcnRlZCBpbiBBQ1BJLiBJ
dCBkb2Vzbid0IGFueW1vcmUuCj4gCj4gT24geDg2IHRoZXJlIGlzIG5vIGNvbmZ1c2lvbiBBRkFJ
Q1MuICBJdCdzIGFsd2F5cyBtZWFudCAiYXMgbG9uZyBhcwo+IHRoZSBwbGF0Zm9ybSBzdXBwb3J0
cyBpdCIuCgpUaGF0J3MgeDg2LCB3aGljaCBzdXBwb3J0cyBwaHlzaWNhbCBDUFUgaG90cGx1Zy4g
V2UncmUgaW50cm9kdWNpbmcKc3VwcG9ydCBmb3IgQXJtNjQgaGVyZSB3aGljaCBkb2Vzbid0IHN1
cHBvcnQgcGh5c2ljYWwgQ1BVIGhvdHBsdWcuCgoJCQkJCQlBQ1BJLWJhc2VkCVBoeXNpY2FsCVZp
cnR1YWwKQXJjaAlIT1RQTFVHX0NQVQlBQ1BJX0hPVFBMVUdfQ1BVCUhvdHBsdWcJCUhvdHBsdWcJ
CUhvdHBsdWcKQXJtNjQJWQkJTgkJCVkJCU4JCVkKeDg2CVkJCVkJCQlZCQlZCQlZCgpTbyBBQ1BJ
X0hPVFBMVUdfQ1BVIGJlY29tZXMgdG90YWxseSBtaXNuYW1lZCB3aXRoIHRoZSBpbnRyb2R1Y3Rp
b24Kb2YgaG90cGx1ZyBvbiBBcm02NC4KCklmIHdlIHdhbnQgdG8ganVzdCBsb29rIGF0IHN0dWZm
IGZyb20gYW4geDg2IHBlcnNwZWN0aXZlLCB0aGVuIHllcywKaXQgcmVtYWlucyBjb3JyZWN0IHRv
IGNhbGwgaXQgQUNQSV9IT1RQTFVHX0NQVS4gSXQgaXNuJ3QgY29ycmVjdCBhcwpzb29uIGFzIHdl
IGFkZCBBcm02NCwgYXMgSSBhbHJlYWR5IHNhaWQuCgpBbmQgaG9uZXN0bHksIGEgdHdvIGxpbmUg
cXVpcCB0byBteSByZWFzb25lZCBhcmd1bWVudCBpcyBub3QgSU1ITwphbiBhY2NlcHRhYmxlIHJl
cGx5LgoKLi4uIGdldHRpbmcgY2xvc2UgdG8gdGhyb3dpbmcgdGhlIHJhZyBpbiBvdmVyIHRoaXMu
CgotLSAKUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2
ZWxvcGVyL3BhdGNoZXMvCkZUVFAgaXMgaGVyZSEgODBNYnBzIGRvd24gMTBNYnBzIHVwLiBEZWNl
bnQgY29ubmVjdGl2aXR5IGF0IGxhc3QhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
