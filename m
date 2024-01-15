Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61B6C4707C
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 11:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vxn6dFrUxsJ51UpS3s3+uw1eEcZ/LYO1dPtgtTvrM6s=; b=zYBpOh1Fljtc88
	UtBjeaRZOqXNRAFn0wv2DN3MDO5AdZf01CQgEjKNXc3VHIgoZ9nRd6R5JRkgc3AM7q8hMpdM04n6S
	a/bMLOk0/vTMhL+HeoUXcXHARCDwMEH8ekOlvyAdDQoKGwByduYTJhlGEM6Nb3496g1qYno4dpJOz
	icJhOfyAF1c5jx5RuBff0Wwum0qHHqQrErWX63LWEYisiJb0LqIeK2QKlOs5DbffSWtBx2GQomy+S
	LaHYNWiEvhqZH0iyBy4D/xNuxJt2DeaywTnrSGSxEyVdtf9wwmEHvQnS6pz/tBnqCrrDFLXJIJtSW
	1CDGsD+AXgLQE51Knlmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPKnk-008dqS-08;
	Mon, 15 Jan 2024 11:06:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPKnf-008doM-2l;
	Mon, 15 Jan 2024 11:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=B8snCTk6m/S/IySGz0MUr7RGvF9ztHAy1wNv3isU/8A=; b=If4u5sBwSs6B37nBXDgiTbTUGN
	lDo8qxPOFMMLR9tdUyLFo9NhxhiAei6ak3C/e+2MynMriUcITyfJLZRCR7Ly9EwLVRyTpXgvcUB3V
	dwGg8WGAGKz7K/mPA9CiHN8UfYztvfbPPXOI0b0S+WLTsoNs8EV0O1R9IOUUphih0SDSGEtoXqkyc
	uB4sWSh8b+qMXC/2xsfM+PilLtcS9vlGpghLJvk9GXVZXiWY3hrSNwUQ65+M5e30MzDBuRHWV1QU/
	jXo3DcbVxcVsJSrnfHOPq2fWintWikuBFLjvQHJE8GaX60F8EKAbY9S+jDwY+ZggmQThypOLb+Xcb
	DtnjfwcQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60190)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rPKnW-0002Kh-1U;
	Mon, 15 Jan 2024 11:06:30 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rPKnV-0002tb-9h; Mon, 15 Jan 2024 11:06:29 +0000
Date: Mon, 15 Jan 2024 11:06:29 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
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
Subject: Re: [PATCH RFC v3 03/21] ACPI: processor: Register CPUs that are
 online, but not described in the DSDT
Message-ID: <ZaURtUvWQyjYfiiO@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
 <E1rDOg2-00Dvjk-RI@rmk-PC.armlinux.org.uk>
 <CAJZ5v0ju1JHgpjuFLHZVs4NZiARG6iBZN_wza6c2e0kDhZjK0w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0ju1JHgpjuFLHZVs4NZiARG6iBZN_wza6c2e0kDhZjK0w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_030639_891486_CEAA9B26 
X-CRM114-Status: GOOD (  32.06  )
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

T24gTW9uLCBEZWMgMTgsIDIwMjMgYXQgMDk6MjI6MDNQTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgMTo0OeKAr1BNIFJ1c3NlbGwgS2lu
ZyA8cm1rK2tlcm5lbEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+ID4KPiA+IEZyb206IEphbWVz
IE1vcnNlIDxqYW1lcy5tb3JzZUBhcm0uY29tPgo+ID4KPiA+IEFDUEkgaGFzIHR3byBkZXNjcmlw
dGlvbnMgb2YgQ1BVcywgb25lIGluIHRoZSBNQURUL0FQSUMgdGFibGUsIHRoZSBvdGhlcgo+ID4g
aW4gdGhlIERTRFQuIEJvdGggYXJlIHJlcXVpcmVkLiAoQUNQSSA2LjUncyA4LjQgIkRlY2xhcmlu
ZyBQcm9jZXNzb3JzIgo+ID4gc2F5cyAiRWFjaCBwcm9jZXNzb3IgaW4gdGhlIHN5c3RlbSBtdXN0
IGJlIGRlY2xhcmVkIGluIHRoZSBBQ1BJCj4gPiBuYW1lc3BhY2UiKS4gSGF2aW5nIHR3byBkZXNj
cmlwdGlvbnMgYWxsb3dzIGZpcm13YXJlIGF1dGhvcnMgdG8gZ2V0Cj4gPiB0aGlzIHdyb25nLgo+
ID4KPiA+IElmIENQVXMgYXJlIGRlc2NyaWJlZCBpbiB0aGUgTUFEVC9BUElDLCB0aGV5IHdpbGwg
YmUgYnJvdWdodCBvbmxpbmUKPiA+IGVhcmx5IGR1cmluZyBib290LiBPbmNlIHRoZSByZWdpc3Rl
cl9jcHUoKSBjYWxscyBhcmUgbW92ZWQgdG8gQUNQSSwKPiA+IHRoZXkgd2lsbCBiZSBiYXNlZCBv
biB0aGUgRFNEVCBkZXNjcmlwdGlvbiBvZiB0aGUgQ1BVcy4gV2hlbiBDUFVzIGFyZQo+ID4gbWlz
c2luZyBmcm9tIHRoZSBEU0RUIGRlc2NyaXB0aW9uLCB0aGV5IHdpbGwgZW5kIHVwIG9ubGluZSwg
YnV0IG5vdAo+ID4gcmVnaXN0ZXJlZC4KPiA+Cj4gPiBBZGQgYSBoZWxwZXIgdGhhdCBydW5zIGFm
dGVyIGFjcGlfaW5pdCgpIGhhcyBjb21wbGV0ZWQgdG8gcmVnaXN0ZXIKPiA+IENQVXMgdGhhdCBh
cmUgb25saW5lLCBidXQgd2VyZW4ndCBmb3VuZCBpbiB0aGUgRFNEVC4gQW55IENQVSB0aGF0Cj4g
PiBpcyByZWdpc3RlcmVkIGJ5IHRoaXMgY29kZSB0cmlnZ2VycyBhIGZpcm13YXJlLWJ1ZyB3YXJu
aW5nIGFuZCBrZXJuZWwKPiA+IHRhaW50Lgo+ID4KPiA+IFFlbXUgVENHIG9ubHkgZGVzY3JpYmVz
IHRoZSBmaXJzdCBDUFUgaW4gdGhlIERTRFQsIHVubGVzcyBjcHUtaG90cGx1Zwo+ID4gaXMgY29u
ZmlndXJlZC4KPiAKPiBTbyB3aHkgaXMgdGhpcyBhIGtlcm5lbCBwcm9ibGVtPwoKU28gd2hhdCBh
cmUgeW91IHByb3Bvc2luZyBzaG91bGQgYmUgdGhlIGJlaGF2aW91ciBoZXJlPyBXaGF0IHRoaXMK
c3RhdGVtZW50IHNlZW1zIHRvIGJlIHNheWluZyBpcyB0aGF0IFFFTVUgYXMgaXQgZXhpc3RzIHRv
ZGF5IG9ubHkKZGVzY3JpYmVzIHRoZSBmaXJzdCBDUFUgaW4gRFNEVC4KCkFzIHRoaXMgcGF0Y2gg
c2VyaWVzIGNoYW5nZXMgd2hlbiBhcmNoX3JlZ2lzdGVyX2NwdSgpIGdldHMgY2FsbGVkIChhcwpk
ZXNjcmliZWQgaW4gdGhlIHBhcmFncmFwaCBhYm92ZSkgd2Ugb2J2aW91c2x5IG5lZWQgdG8gcHJl
c2VydmUgdGhlCl9leGlzdGluZ18gYmVoYXZpb3VyIHRvIGF2b2lkIGNhdXNpbmcgcmVncmVzc2lv
bnMuIFNvLCBpZiBjaGFuZ2luZyB0aGUKa2VybmVsIGNhdXNlcyB1c2VyIHZpc2libGUgcmVncmVz
c2lvbnMgKGUuZy4gc3lzZnMgZW50cmllcyB0bwpkaXNhcHBlYXIpIHRoZW4gaXQgb2J2aW91c2x5
IF9pc18gYSBrZXJuZWwgcHJvYmxlbSB0aGF0IG5lZWRzIHRvIGJlCnNvbHZlZC4KCldlIGNhbid0
IHNheSAid2VsbCBmaXggUUVNVSB0aGVuIiB3aXRob3V0IGludm9raW5nIHRoZSB3cmF0aCBvZiBM
aW51cy4KCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBNb3JzZSA8amFtZXMubW9yc2VAYXJtLmNv
bT4KPiA+IFJldmlld2VkLWJ5OiBKb25hdGhhbiBDYW1lcm9uIDxKb25hdGhhbi5DYW1lcm9uQGh1
YXdlaS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4K
PiA+IFRlc3RlZC1ieTogTWlndWVsIEx1aXMgPG1pZ3VlbC5sdWlzQG9yYWNsZS5jb20+Cj4gPiBU
ZXN0ZWQtYnk6IFZpc2hudSBQYWpqdXJpIDx2aXNobnVAb3MuYW1wZXJlY29tcHV0aW5nLmNvbT4K
PiA+IFRlc3RlZC1ieTogSmlhbnlvbmcgV3UgPGppYW55b25nLnd1QGFybS5jb20+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3Jn
LnVrPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9hY3BpL2FjcGlfcHJvY2Vzc29yLmMgfCAxOSArKysr
KysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY3BpL2FjcGlfcHJvY2Vzc29yLmMgYi9kcml2ZXJz
L2FjcGkvYWNwaV9wcm9jZXNzb3IuYwo+ID4gaW5kZXggNmE1NDJlMGNlMzk2Li4wNTExZjJiYzEw
YmMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2FjcGkvYWNwaV9wcm9jZXNzb3IuYwo+ID4gKysr
IGIvZHJpdmVycy9hY3BpL2FjcGlfcHJvY2Vzc29yLmMKPiA+IEBAIC03OTEsNiArNzkxLDI1IEBA
IHZvaWQgX19pbml0IGFjcGlfcHJvY2Vzc29yX2luaXQodm9pZCkKPiA+ICAgICAgICAgYWNwaV9w
Y2NfY3B1ZnJlcV9pbml0KCk7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0aWMgaW50IF9faW5pdCBhY3Bp
X3Byb2Nlc3Nvcl9yZWdpc3Rlcl9taXNzaW5nX2NwdXModm9pZCkKPiA+ICt7Cj4gPiArICAgICAg
IGludCBjcHU7Cj4gPiArCj4gPiArICAgICAgIGlmIChhY3BpX2Rpc2FibGVkKQo+ID4gKyAgICAg
ICAgICAgICAgIHJldHVybiAwOwo+ID4gKwo+ID4gKyAgICAgICBmb3JfZWFjaF9vbmxpbmVfY3B1
KGNwdSkgewo+ID4gKyAgICAgICAgICAgICAgIGlmICghZ2V0X2NwdV9kZXZpY2UoY3B1KSkgewo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcHJfZXJyX29uY2UoRldfQlVHICJDUFUgJXUgaGFz
IG5vIEFDUEkgbmFtZXNwYWNlIGRlc2NyaXB0aW9uIVxuIiwgY3B1KTsKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGFkZF90YWludChUQUlOVF9GSVJNV0FSRV9XT1JLQVJPVU5ELCBMT0NLREVQ
X1NUSUxMX09LKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGFyY2hfcmVnaXN0ZXJfY3B1
KGNwdSk7Cj4gCj4gV2hpY2ggcGFydCBvZiB0aGlzIGNvZGUgaXMgcmVsYXRlZCB0byBBQ1BJPwoK
VGhhdCdzIGEgZ29vZCBxdWVzdGlvbiwgYW5kIEkgc3VzcGVjdCBpdCB3b3VsZCBiZSBtb3JlIHN1
aXRlZCB0byBiZWluZwpwbGFjZWQgaW4gZHJpdmVycy9iYXNlL2NwdS5jIGV4Y2VwdCBmb3IgdGhl
IHByb2JsZW0gdGhhdCB0aGUgZXJyb3IKbWVzc2FnZSByZWZlcnMgdG8gQUNQSS4KCkFzIGxvbmcg
YXMgd2Uga2VlcCB0aGUgYWNwaV9kaXNhYmxlZCB0ZXN0LCBJIGd1ZXNzIHRoYXQncyBmaW5lLgpj
cHVfZGV2X3JlZ2lzdGVyX2dlbmVyaWMoKSB0aGVyZSBhbHJlYWR5IHRlc3RzIGFjcGlfZGlzYWJs
ZWQuCgotLSAKUk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsv
ZGV2ZWxvcGVyL3BhdGNoZXMvCkZUVFAgaXMgaGVyZSEgODBNYnBzIGRvd24gMTBNYnBzIHVwLiBE
ZWNlbnQgY29ubmVjdGl2aXR5IGF0IGxhc3QhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
