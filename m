Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273D5CCF9FE
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 16:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zBOBb6GLG1eiYn4C8ZEcFFD6fUnNl7tiU6eO9Yi078s=; b=MhI8W4BBJchaco
	RJ5kK8g+amp6NPb7h8TrTwTM0rYlXlwVivPj1BLsdj/8/G7G6SulduqaBSLtDqWVd5TihkrJ5A5Zl
	ZmXf+0m0rPY4PXKnU627Nl7pREif60Nl2PHZcfr/pt2QaO37mrNhjejY3dhRPCYF/V4xpY7OjNIm2
	3OkpK+SnV/KFdzRqoMKhNggEjhkgSGAyteekkTjz6KXvQJx/Tx1xZu4dTBTQxx5blVTgzSketWOon
	mc1gq+uDxm2HLOimLHqe8uC3Cb5vJe1DZ0oFDFxFvsY6/92ZQaKdeytH+/1keADoIpDq4g4xnipKy
	di3zbzCkMDRe9bbAmyew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEViJ-00000004TXz-3PeB;
	Thu, 30 Oct 2025 16:41:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEViG-00000004TXQ-1rHQ;
	Thu, 30 Oct 2025 16:41:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0A1441B14;
	Thu, 30 Oct 2025 16:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A17F5C4CEF1;
	Thu, 30 Oct 2025 16:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761842483;
	bh=aIoUwknKACszK3iv7HnkpaK0g2nYzhodMj6uyK4R4cI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OFfTgDYUwwtk9a3MXmhN+C5QZeQcKowOvQ7JtdxMp86xa7GEim8ms4eA76JdlZfHS
	 eFhBevKSCYCx6yMiJ4R3yNh1fEKAOckpxYlBhI00S+GuEHbN3tDMHcHFjIQ1269XM1
	 0162sMPeIP15mj38QzG6640TZdgvl0DyZO+zAfpQ7ma2P8O29xh8ZpHLOZ/sL32xe0
	 iqWWZ9MUG/8ewMu0jydmDJAMYeZyKtiWVz81dJNlG9Bj+piDGu94CB0PcteyGg6uJe
	 yPXStu00GL1l1YREbznHaQFRp4m3fyjHtsoP+kDTeTeOt9XtrZbecyLXwkT6Ds1J5w
	 cFFbUk6PUfVZg==
Date: Thu, 30 Oct 2025 22:11:12 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Johannes Erdfelt <johannes@erdfelt.com>, 
	Aurelien Jarno <aurelien@aurel32.net>
Cc: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, bhelgaas@google.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, vkoul@kernel.org, kishon@kernel.org, dlan@gentoo.org, 
	guodong@riscstar.com, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, p.zabel@pengutronix.de, christian.bruel@foss.st.com, 
	shradha.t@samsung.com, krishna.chundru@oss.qualcomm.com, qiang.yu@oss.qualcomm.com, 
	namcao@linutronix.de, thippeswamy.havalige@amd.com, inochiama@gmail.com, 
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] Introduce SpacemiT K1 PCIe phy and host controller
Message-ID: <5kwbaj2eqr4imcaoh6otqo7huuraqhodxh4dbwc33vqpi5j5yq@ueufnqetrg2m>
References: <20251013153526.2276556-1-elder@riscstar.com>
 <aPEhvFD8TzVtqE2n@aurel32.net>
 <92ee253f-bf6a-481a-acc2-daf26d268395@riscstar.com>
 <aQEElhSCRNqaPf8m@aurel32.net>
 <20251028184250.GM15521@sventech.com>
 <82848c80-15e0-4c0e-a3f6-821a7f4778a5@riscstar.com>
 <20251028204832.GN15521@sventech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251028204832.GN15521@sventech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_094125_166544_3776CBF9 
X-CRM114-Status: GOOD (  25.16  )
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

KyBBdXJlbGllbgoKT24gVHVlLCBPY3QgMjgsIDIwMjUgYXQgMDE6NDg6MzJQTSAtMDcwMCwgSm9o
YW5uZXMgRXJkZmVsdCB3cm90ZToKPiBPbiBUdWUsIE9jdCAyOCwgMjAyNSwgQWxleCBFbGRlciA8
ZWxkZXJAcmlzY3N0YXIuY29tPiB3cm90ZToKPiA+IE9uIDEwLzI4LzI1IDE6NDIgUE0sIEpvaGFu
bmVzIEVyZGZlbHQgd3JvdGU6Cj4gPiA+IEkgaGF2ZSBiZWVuIHRlc3RpbmcgdGhpcyBwYXRjaHNl
dCByZWNlbnRseSBhcyB3ZWxsLCBidXQgb24gYW4gT3JhbmdlIFBpCj4gPiA+IFJWMiBib2FyZCBp
bnN0ZWFkIChhbmQgYW4gZXh0cmEgUlYyIHNwZWNpZmljIHBhdGNoIHRvIGVuYWJsZSBwb3dlciB0
bwo+ID4gPiB0aGUgTS4yIHNsb3QpLgo+ID4gPiAKPiA+ID4gSSByYW4gaW50byB0aGUgc2FtZSBz
eW1wdG9tcyB5b3UgaGFkICgiUUlEIDAgdGltZW91dCIgYWZ0ZXIgYWJvdXQgNjAKPiA+ID4gc2Vj
b25kcykuIEhvd2V2ZXIsIEknbSB1c2luZyBhbiBJbnRlbCA2MDBwLiBJIGNhbiBjb25maXJtIG15
IE5WTUUgZHJpdmUKPiA+ID4gc2VlbXMgdG8gd29yayBmaW5lIHdpdGggdGhlICJwY2llX2FzcG09
b2ZmIiB3b3JrYXJvdW5kIGFzIHdlbGwuCj4gPiAKPiA+IEkgZG9uJ3Qgc2VlIHRoaXMgcHJvYmxl
bSwgYW5kIGhhdmVuJ3QgdHJpZWQgdG8gcmVwcm9kdWNlIGl0IHlldC4KPiA+IAo+ID4gTWFuaSB0
b2xkIG1lIEkgbmVlZGVkIHRvIGFkZCB0aGVzZSBsaW5lcyB0byBlbnN1cmUgdGhlICJydW50aW1l
Cj4gPiBQTSBoaWVyYXJjaHkgb2YgUENJZSBjaGFpbiIgd29uJ3QgYmUgImJyb2tlbiI6Cj4gPiAK
PiA+IAlwbV9ydW50aW1lX3NldF9hY3RpdmUoKQo+ID4gCXBtX3J1bnRpbWVfbm9fY2FsbGJhY2tz
KCkKPiA+IAlkZXZtX3BtX3J1bnRpbWVfZW5hYmxlKCkKPiA+IAo+ID4gSnVzdCBvdXQgb2YgY3Vy
aW9zaXR5LCBjb3VsZCB5b3UgdHJ5IHdpdGggdGhvc2UgbGluZXMgYWRkZWQKPiA+IGp1c3QgYmVm
b3JlIHRoZXNlIGFzc2lnbm1lbnRzIGluIGsxX3BjaWVfcHJvYmUoKT8KPiA+IAo+ID4gCWsxLT5w
Y2kuZGV2ID0gZGV2Owo+ID4gCWsxLT5wY2kub3BzID0gJmsxX3BjaWVfb3BzOwo+ID4gCWR3X3Bj
aWVfY2FwX3NldCgmazEtPnBjaSwgUkVRX1JFUyk7Cj4gPiAKPiA+IEkgZG91YnQgaXQgd2lsbCBm
aXggd2hhdCB5b3UncmUgc2VlaW5nLCBidXQgYXQgdGhlIG1vbWVudCBJJ20KPiA+IHdvcmtpbmcg
b24gc29tZXRoaW5nIGVsc2UuCj4gCj4gVW5mb3J0dW5hdGVseSB0aGVyZSBpcyBubyBkaWZmZXJl
bmNlIHdpdGggdGhlIHJ1bnRpbWUgUE0gaGllcmFyY2h5Cj4gYWRkaXRpb25zLgo+IAoKVGhlc2Ug
YXJlIG5vdCBzdXBwb3NlZCB0byBmaXggdGhlIGlzc3VlcyB5b3Ugd2VyZSBmYWNpbmcuIEkgZGlz
Y3Vzc2VkIHdpdGggQWxleApvZmZsaW5lIGFuZCBmaWd1cmVkIG91dCB0aGF0IEwxIHdvcmtzIGZp
bmUgb24gaGlzIEJQSS1GMyBib2FyZCB3aXRoIGEgTlZNZSBTU0QuCgpBbmQgSSBiZWxpZXZlLCBB
dXJlbGllbiBpcyBhbHNvIHVzaW5nIHRoYXQgc2FtZSBib2FyZCwgYnV0IHdpdGggZGlmZmVyZW50
ClNTRHMuIEJ1dCB3aGF0IGlzIHB1enpsaW5nIG1lIGlzLCBMMSBpcyBicmVha2luZyBBdXJlbGll
bidzIHNldHVwIHdpdGggMyBTU0RzCmZyb20gZGlmZmVyZW50IHZlbmRvcnMuIEl0IGFwcGFyZW50
bHkgd29ya3MgZmluZSBvbiBBbGV4J3Mgc2V0dXAuIFNvIGl0IHNvbWVob3cKY29uZmlybXMgdGhh
dCBSb290IFBvcnQgc3VwcG9ydHMgYW5kIGJlaGF2ZXMgY29ycmVjdGx5IHdpdGggTDEuIEJ1dCBh
dCB0aGUgc2FtZQp0aW1lLCBJIGNhbm5vdCBqdXN0IHNheSB3aXRob3V0IGV2aWRlbmNlIHRoYXQg
TDEgaXMgYnJva2VuIG9uIGFsbCB0aGVzZSBTU0RzCnRoYXQgeW91IGFuZCBBdXJlbGllbiB0ZXN0
ZWQgd2l0aC4KClNvIHVudGlsIHRoYXQgaXMgZmlndXJlZCBvdXQsIEkndmUgYXNrZWQgQWxleCB0
byBkaXNhYmxlIEwxIENBUCBpbiB0aGUKY29udHJvbGxlciBkcml2ZXIuIFNvIGluIHRoZSBuZXh0
IHZlcnNpb24gb2YgdGhpcyBzZXJpZXMsIHlvdXIgU1NEcyBzaG91bGQgd29yawpvdXQgb2YgdGhl
IGJveC4KCi0gTWFuaQoKLS0gCuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7g
rprgrr/grrXgrq7gr40KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
