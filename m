Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562CACAC5AE
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 20:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rqzb+3B8e1vyhC5dD9fP/IrVCbMcg2GwJ93c20KinuI=; b=kJJEffnQNXiSYW
	5u1GtouAsT1VT72TT08vp7TiR/Bfdycun5jRUQnj/hCewaEOoISedP0b0DSPriMQJ8LRGaMrIE7tc
	3Xy3oDud7evB/lXemr3NqUysPXBtxaiuENiSj5D3NWbBdJUfULV2G9ksPwjvCaG/Orxlz0U0IpA8U
	RLQIT6VWP0CArO2Rf4h4IJLCmQeDYwxjXmqoA5RW/cV+2zTqueiqVWsEfJYU5ZHTojDtROjNfrCI6
	9fWO4W53FF5jcjudrf/uD2iW10wb+mWsqu7OrQ4yn1//KiOs2y0vHu1tS/+SzSgHW3DJApZYa4oAM
	LilMx9WSl6tTTRdKOVtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1VpW-00000003Lkj-1IFE;
	Wed, 24 Sep 2025 20:11:10 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1VpQ-00000003LeT-3A8x
	for linux-riscv@lists.infradead.org;
	Wed, 24 Sep 2025 20:11:09 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250924201059euoutp0276bb75263b372b93fa685c59b3481de1~oUPMmnzgp0380003800euoutp02H
	for <linux-riscv@lists.infradead.org>; Wed, 24 Sep 2025 20:10:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250924201059euoutp0276bb75263b372b93fa685c59b3481de1~oUPMmnzgp0380003800euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758744659;
	bh=yBKtwjJbPQtED8z7fycvzGQLEUnEMfBKiPR2MumIREw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=GZJFO8CmRhsefzb4ZNLdzaYTF6Q/ntMXChwbvLFW41SUpZKQrVaJ2QmhBsuDG4DhM
	 RkZoK2LxmmmoyNNH4TqD8+luA4tXD1CqHfJDf3s0RNtj8s4o2otF4PnLYWOq8Kmz5B
	 4Mg/IE/l5VtD4mMQNfJDT6kYj7gaqLqjOZoeVKvU=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250924201058eucas1p2d73ba09b4daf4e1779f658dfb3d99722~oUPLmwszc0365803658eucas1p2d;
	Wed, 24 Sep 2025 20:10:58 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250924201057eusmtip1dcd4c37a079be0694d2881ebcaa5a599~oUPKi7Zsq1997819978eusmtip10;
	Wed, 24 Sep 2025 20:10:57 +0000 (GMT)
Message-ID: <0bbdb7d1-5d07-4997-955e-497134a4aa30@samsung.com>
Date: Wed, 24 Sep 2025 22:10:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 2/7] rust: pwm: Add Kconfig and basic data
 structures
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Guo Ren
	<guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
	Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
	Ghiti <alex@ghiti.fr>, Marek Szyprowski <m.szyprowski@samsung.com>, Benno
	Lossin <lossin@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Drew Fustini <fustini@kernel.org>, Daniel Almeida
	<daniel.almeida@collabora.com>, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <upgthwp3cyohhe2gkzsramzshmvz3icjbhro6hgk2drbbqczi4@ygaanetydgjv>
X-CMS-MailID: 20250924201058eucas1p2d73ba09b4daf4e1779f658dfb3d99722
X-Msg-Generator: CA
X-RootMTR: 20250820083542eucas1p221dacb3b69524b0dd6f7abf870adbe04
X-EPHeader: CA
X-CMS-RootMailID: 20250820083542eucas1p221dacb3b69524b0dd6f7abf870adbe04
References: <20250820-rust-next-pwm-working-fan-for-sending-v14-0-df2191621429@samsung.com>
	<CGME20250820083542eucas1p221dacb3b69524b0dd6f7abf870adbe04@eucas1p2.samsung.com>
	<20250820-rust-next-pwm-working-fan-for-sending-v14-2-df2191621429@samsung.com>
	<upgthwp3cyohhe2gkzsramzshmvz3icjbhro6hgk2drbbqczi4@ygaanetydgjv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_131105_365587_01F40B72 
X-CRM114-Status: GOOD (  18.83  )
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

CgpPbiA5LzE1LzI1IDEyOjEzLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxsbyBNaWNo
YWwsCj4gCj4gT24gV2VkLCBBdWcgMjAsIDIwMjUgYXQgMTA6MzU6MzdBTSArMDIwMCwgTWljaGFs
IFdpbGN6eW5za2kgd3JvdGU6Cj4+IEludHJvZHVjZSB0aGUgZm91bmRhdGlvbmFsIHN1cHBvcnQg
Zm9yIFBXTSBhYnN0cmFjdGlvbnMgaW4gUnVzdC4KPj4KPj4gVGhpcyBjb21taXQgYWRkcyB0aGUg
YFJVU1RfUFdNX0FCU1RSQUNUSU9OU2AgS2NvbmZpZyBvcHRpb24gdG8gZW5hYmxlCj4+IHRoZSBm
ZWF0dXJlLCBhbG9uZyB3aXRoIHRoZSBuZWNlc3NhcnkgYnVpbGQtc3lzdGVtIHN1cHBvcnQgYW5k
IEMKPj4gaGVscGVycy4KPj4KPj4gSXQgYWxzbyBpbnRyb2R1Y2VzIHRoZSBmaXJzdCBzZXQgb2Yg
c2FmZSB3cmFwcGVycyBmb3IgdGhlIFBXTQo+PiBzdWJzeXN0ZW0sIGNvdmVyaW5nIHRoZSBiYXNp
YyBkYXRhIGNhcnJ5aW5nIEMgc3RydWN0cyBhbmQgZW51bXM6Cj4+IC0gYFBvbGFyaXR5YDogQSBz
YWZlIHdyYXBwZXIgZm9yIGBlbnVtIHB3bV9wb2xhcml0eWAuCj4+IC0gYFdhdmVmb3JtYDogQSB3
cmFwcGVyIGZvciBgc3RydWN0IHB3bV93YXZlZm9ybWAuCj4+IC0gYEFyZ3NgOiBBIHdyYXBwZXIg
Zm9yIGBzdHJ1Y3QgcHdtX2FyZ3NgLgo+PiAtIGBTdGF0ZWA6IEEgd3JhcHBlciBmb3IgYHN0cnVj
dCBwd21fc3RhdGVgLgo+IAo+IEFyZ3MsIFN0YXRlIGFuZCBQb2xhcml0eSBhcmUgb25seSBuZWVk
ZWQgZm9yIHRoZSBjb25zdW1lciBzaWRlIG9mIHRoZQo+IFBXTSBBUEkgaW4gUnVzdCwgcmlnaHQ/
Cj4gCj4gSSBkb24ndCBwYXJ0aWN1bGFyaWx5IGxpa2UgbGlrZSBwd21fYXJncyBhbmQgd29uZGVy
IGlmIHRoaXMgcmVhbGx5IGhhcwo+IHRvIGJlIGV4cG9zZWQgdG8gUnVzdC4KCllvdSdyZSByaWdo
dCB0aGF0IEFyZ3MgaXMgcHJpbWFyaWx5IGZvciB0aGUgY29uc3VtZXIgc2lkZSwgYW5kIG91cgpw
cm92aWRlciBkcml2ZXIgZG9lc24ndCB1c2UgaXQgYXQgYWxsLiBJIG9ubHkgaW5jbHVkZWQgaXQg
Zm9yCmNvbXBsZXRlbmVzcywgc28gSSdtIGhhcHB5IHRvIHJlbW92ZSBpdCBmcm9tIHRoZSBhYnN0
cmFjdGlvbnMuCgpJIGRpZCB1c2UgU3RhdGUgb24gdGhlIHByb3ZpZGVyIHNpZGUsIGhvd2V2ZXIs
IHRvIGNoZWNrIGlmIGEgY2hhbm5lbCBpcwplbmFibGVkIGJlZm9yZSB3cml0aW5nIG5ldyBoYXJk
d2FyZSB2YWx1ZXMgLSBJJ3ZlIHNlZW4geW91ciBjb21tZW50CmFib3V0IGl0IHRoYXQgaXQncyBi
ZXR0ZXIgdG8gdXNlIHRoZSBIVyByZWdpc3RlcnMgaW5zdGVhZCwgSSByZW1lbWJlciBJCnRyaWVk
IGRvaW5nIHNvbWV0aGluZyBsaWtlIHRoaXMgYmFjayBpbiBNYXkgd2hlbiBzdGFydGVkIHdvcmtp
bmcgb24KdGhpcywgYnV0IGhhdmVuJ3Qgc3VjY2VlZGVkIC0gd2lsbCByZWZyZXNoIG15IG1lbW9y
eSBhbmQgcmVzcG9uZCB0byB0aGUKZHJpdmVyIGNvbW1lbnRzLgoKPiAKPiBJIHRoaW5rIGZvciBT
dGF0ZSAoYW5kIHRodXMgUG9sYXJpdHkpIHdlIGhhdmUgdG8gaGF2ZSBpdCBmb3IgdGhlCj4gZm9y
c2VlYWJsZSBmdXR1cmUuCj4gCj4gQmVzdCByZWdhcmRzCj4gVXdlCgpCZXN0IHJlZ2FyZHMsCi0t
IApNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxjenluc2tpQHNhbXN1bmcuY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
