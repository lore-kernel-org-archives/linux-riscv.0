Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BDAC3DA6E
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 15:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GwFzpDl/fBObl2FWmG00pn/yGnH9cjJw++Yd2a4YkE4=; b=rmmATiHoS9UHfU
	unfpIux62qPqGCytMPUnz//5XbWJZksygrtJwyzIq5zyGf5WgkObZMdwFvo14JTo3kH7CP1sdv1rb
	HzGO31qcOwYlRsDqNnyhThHmFodPByLdeRF8+0SDGL2LxPO4XUCotJ+NMYYM/HpHjt1SxKQSxcV0A
	cfbbGF4am6KeoIQaSTVD7Yue9Hd3VgJWeWfhbCqgwBHB/WRhjp5UQFXwozweRZaHb30x5czDb+ogK
	mgWyOTC7GdMm5/vErbpQM/zN3rs/lgkX/0DyY3trimbErl+LNXgCNp/8TbKe6Oejv+pbjKp5q9Pqt
	taEzPUCOyjf360TxWpeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rH3uJ-0086Zv-1r;
	Sat, 23 Dec 2023 15:27:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rH3uH-0086ZN-17
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 15:27:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E4BA360B35;
	Sat, 23 Dec 2023 15:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4893C433C8;
	Sat, 23 Dec 2023 15:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703345234;
	bh=9i3XR+TJMyQWJ0Qcv3X2cK3YXWLhSXi52Js+s7jB3F0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mrG2Z5E/QeoBgnYWBFqe5vrDg8rO6vNxjGh8OtFX1AXenaxYZuAwSIn1gOcjtXooB
	 +ovYmlf8Cr1LQEPLogPUn22jBS86d/KUA4vs3/WKY2uARiyt0deivaKzSINPsOqM2w
	 XPvVpAclTx0nIOzDpQVz9Fx8weaURwk+EQOzljSDuWrmmTj8ieNwApHbfyaCeFU44h
	 2c4qvJDtZlaZM8mb7u4v9rB3UBwSNzZFT7Jk7fhpN66XkYAlrWn18cwvJgbmlttOM/
	 0LGC9smgEg+kGzaU/Mk7+V91AXLWlG6i5szFzCuth3liKqwylb7zVSsSxoK2F01nHo
	 9E+RVoXlfYyWg==
Date: Sat, 23 Dec 2023 09:27:07 -0600
From: Eric Biggers <ebiggers@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, bjorn@kernel.org, charlie@rivosinc.com,
	ardb@kernel.org, arnd@arndb.de, peterz@infradead.org,
	tglx@linutronix.de, Vincent Chen <vincent.chen@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [v7, 01/10] riscv: Add support for kernel mode vector
Message-ID: <20231223152707.GA901@quark.localdomain>
References: <20231221134318.28105-1-andy.chiu@sifive.com>
 <20231221134318.28105-2-andy.chiu@sifive.com>
 <20231222053014.GC52600@quark.localdomain>
 <CABgGipWFR5KytGgShx9ei6R00rfeTx7Caxm=hei88uzWk5j-Rw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABgGipWFR5KytGgShx9ei6R00rfeTx7Caxm=hei88uzWk5j-Rw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231223_072717_494763_046FE23B 
X-CRM114-Status: GOOD (  27.23  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMDQ6MjY6MDNQTSArMDgwMCwgQW5keSBDaGl1IHdyb3Rl
Ogo+IE9uIEZyaSwgRGVjIDIyLCAyMDIzIGF0IDE6MzDigK9QTSBFcmljIEJpZ2dlcnMgPGViaWdn
ZXJzQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgRGVjIDIxLCAyMDIzIGF0IDAx
OjQzOjA4UE0gKzAwMDAsIEFuZHkgQ2hpdSB3cm90ZToKPiA+ID4gKy8qCj4gPiA+ICsgKiBXZSB1
c2UgYSBmbGFnIHRvIHRyYWNrIGluLWtlcm5lbCBWZWN0b3IgY29udGV4dC4gQ3VycmVudGx5IHRo
ZSBmbGFnIGhhcyB0aGUKPiA+ID4gKyAqIGZvbGxvd2luZyBtZWFuaW5nOgo+ID4gPiArICoKPiA+
ID4gKyAqICAtIGJpdCAwLTcgaW5kaWNhdGVzIHdoZXRoZXIgdGhlIGluLWtlcm5lbCBWZWN0b3Ig
Y29udGV4dCBpcyBhY3RpdmUuIFRoZQo+ID4gPiArICogICAgYWN0aXZhdGlvbiBvZiB0aGlzIHN0
YXRlIGRpc2FibGVzIHRoZSBwcmVlbXB0aW9uLiBPbiBhIG5vbi1SVCBrZXJuZWwsIGl0Cj4gPiA+
ICsgKiAgICBhbHNvIGRpc2FibGUgYmguIEN1cnJlbnRseSBvbmx5IDAgYW5kIDEgYXJlIHZhbGlk
IHZhbHVlIGZvciB0aGlzIGZpZWxkLgo+ID4gPiArICogICAgT3RoZXIgdmFsdWVzIGFyZSByZXNl
cnZlZCBmb3IgZnV0dXJlIHVzZXMuCj4gPiA+ICsgKi8KPiA+ID4gKwo+ID4gPiArI2RlZmluZSBS
SVNDVl9LRVJORUxfTU9ERV9WX01BU0sgICAgIDB4ZmYKPiA+ID4gKwo+ID4gPiArI2RlZmluZSBS
SVNDVl9LRVJORUxfTU9ERV9WICAweDEKPiA+Cj4gPiBJcyB0aGVyZSBhIHJlYXNvbiB0aGlzIGlz
bid0IGp1c3QgYSBzaW5nbGUgYml0IGZsYWc/Cj4gCj4gSSBoYXZlIG5vdCB5ZXQgZHJhd24gYSBj
b25jbHVzaW9uIG9uIHRoaXMuIEJ1dCBJIGFtIHRoaW5raW5nIGlmIGl0Cj4gd291bGQgYmUgdXNl
ZnVsIHRvIGFsbG93IGNhbGxpbmcga2VybmVsX3ZlY3Rvcl9iZWdpbiBtdWx0aXBsZSB0aW1lcyBv
bgo+IGEgY2FsbCBjaGFpbi4gVGhlbiB0aGVzZSBleHRyYSBiaXRzIHdvdWxkIGJlIHVzZWZ1bCBp
ZiB3ZSB3ZXJlIHRvCj4gYWxsb3cgYW5kIGltcGxlbWVudCBpdC4gRm9yIGV4YW1wbGUsIHRoZSB1
c2UgY2FzZSB3b3VsZCBiZSBsaWtlCj4gCj4ga2VybmVsX3ZlY3Rvcl9iZWdpbigpOwo+IG1lbXNl
dCgpOyAvL2NoYWluZWQgdG8gYW5vdGhlciBrZXJuZWxfdmVjdG9yX2JlZ2luIGFuZCB2ZWN0b3Jp
emVkIG1lbXNldAo+IGRvX3RoaW5nc193aXRoX3ZlY3RvcigpOwo+IGtlcm5lbF92ZWN0b3JfZW5k
KCk7CgpNYXliZSBpdCBzaG91bGQganVzdCBiZSBhIHNpbmdsZSBiaXQgZm9yIG5vdywgYW5kIGl0
IGNhbiBiZSBjaGFuZ2VkIGxhdGVyIGlmIHRoZQptb3JlIGNvbXBsZXggdmVyc2lvbiBhY3R1YWxs
eSB0dXJucyBvdXQgdG8gYmUgbmVlZGVkPwoKRldJVywgdGhlIGV4aXN0aW5nIGFyY2hpdGVjdHVy
ZXMgZG9uJ3QgYWxsb3cgcmVlbnRyYW50IGVuYWJsaW5nIG9mIFNJTUQuCgo+ID4gPiArc3RhdGlj
IGlubGluZSB2b2lkIHJpc2N2X3ZfY3R4X2NudF9hZGQodTMyIG9mZnNldCkKPiA+ID4gK3sKPiA+
ID4gKyAgICAgY3VycmVudC0+dGhyZWFkLnJpc2N2X3ZfZmxhZ3MgKz0gb2Zmc2V0Owo+ID4gPiAr
ICAgICBiYXJyaWVyKCk7Cj4gPiA+ICt9Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBpbmxpbmUgdm9p
ZCByaXNjdl92X2N0eF9jbnRfc3ViKHUzMiBvZmZzZXQpCj4gPiA+ICt7Cj4gPiA+ICsgICAgIGJh
cnJpZXIoKTsKPiA+ID4gKyAgICAgY3VycmVudC0+dGhyZWFkLnJpc2N2X3ZfZmxhZ3MgLT0gb2Zm
c2V0Owo+ID4gPiArfQo+ID4KPiA+IFdoYXQgaXMgdGhlIHB1cnBvc2Ugb2YgdGhlIGJhcnJpZXJz
IGFib3ZlPwo+ID4KPiA+ID4gK3N0YXRpYyBpbmxpbmUgdTMyIHJpc2N2X3ZfY3R4X2NudCh2b2lk
KQo+ID4gPiArewo+ID4gPiArICAgICByZXR1cm4gUkVBRF9PTkNFKGN1cnJlbnQtPnRocmVhZC5y
aXNjdl92X2ZsYWdzKTsKPiA+ID4gK30KPiA+Cj4gPiBXaGF0IGlzIHRoZSBwdXJwb3NlIG9mIHVz
aW5nIFJFQURfT05DRSgpIGhlcmU/Cj4gCj4gVGhlc2UgY29kZXMgcHJvdmlkZSBjb21waWxlciBi
YXJyaWVycywgZS5nLiB0byBwcmV2ZW50IHJpc2N2X3ZfZmxhZwo+IGNvdW50aW5nIHNsaXBzIGlu
dG8gVmVjdG9yIG9wZXJhdGlvbnMuIEN1cnJlbnRseS4gaXQgc2hvdWxkIGJlIGZpbmUKPiBmb3Ig
bm9uLXByZWVtcHRpYmxlIFZlY3RvciBhcyByaXNjdl92X2N0eF9jbnRfYWRkKCkvc3ViKCkgYXJl
IGd1YXJkZWQKPiB3aXRoIHByZWVtcHRfZGlzYWJsZSgpL2xvY2FsX2JoX2Rpc2FibGUoKS4gSG93
ZXZlciwgaWYgcHJlZW1wdF92IG9yCj4gdGhlIGFib3ZlIHVzZS1jYXNlIGlzIGNvbmNlcm5lZCwg
dGhlbiB0aGVzZSBjb21waWxlciBiYXJyaWVycyBhcmUKPiBuZWVkZWQgYW5kIHNob3VsZCBub3Qg
YmUgbWl4ZWQgd2l0aCBWZWN0b3Igb3BlcmF0aW9ucyBhZnRlcndhcmQuIE9yLAo+IGl0IHdvdWxk
IGNvbmZ1c2UgdGhlIGNvbnRleHQgdHJhY2tpbmcgd2hlbiB0cmFwcyB0YWtlIHBsYWNlLgo+IAo+
IHJpc2N2X3ZfY3R4X2NudF9hZGQoKQo+IGRvIHRoaW5ncyB3aXRoIFZlY3RvciwgbWF5YmUgaW5s
aW5lZCAodnN0YXRlX3NhdmUpCj4gcmlzY3Zfdl9jdHhfY250X3N1YigpCgpDYW4geW91IGxlYXZl
IGNvbW1lbnRzIGluIHRoZSBjb2RlIGV4cGxhaW5pbmcgdGhpcz8KCkFsc28sIGlmIHRoZXNlIGJh
cnJpZXJzIGFyZW4ndCBuZWVkZWQgdW50aWwgcHJlZW1wdGlibGUgdmVjdG9yIHN1cHBvcnQsIHRo
ZXkKcHJvYmFibHkgc2hvdWxkIGJlIHBhcnQgb2YgdGhhdCBwYXRjaCwgbm90IHRoaXMgb25lLgoK
LSBFcmljCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
