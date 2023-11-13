Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA0DC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 07:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jl2xOMgQsT//jYCpl6nK/VPOq2kUmlZUK1kEeac/sqA=; b=W+oxIJ+MhnNEdT
	c2fyjDkf18q5c8GqsMPbOOCu0qsAsAqEfqtJx5XRQBeENiH3wW6WqgpEdpTBXeA2R1Q5BP60som7v
	n+/3lcpUfp907PMW+UYzPm4ldF7vGlR4FJTekuVUl7gX+o5RQClVBrzcyyJBf60HylSE4ZlRP8j/h
	NxSGNN710lgJfu7Q4DQqY8MsKmnyqxmrKM0VZLX6ZGrjV/eAms7lotnGgxNiPKG9W0K2kFZ8rKKcn
	VOtIznhBosWOq4aIGBesXFHA3GPXn5fFEKu8EI/Y9MMiIgbGqoXfmaX8gApLLzmzMdRKgxcDLxf8v
	tsQjF/xjq6xz2192D4sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2RF6-00DQdF-0T;
	Mon, 13 Nov 2023 07:20:20 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2RF1-00DQbv-2a
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 07:20:18 +0000
X-QQ-mid: bizesmtp63t1699859986trcai2ec
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 13 Nov 2023 15:19:43 +0800 (CST)
X-QQ-SSF: 01200000000000B06000000A0000000
X-QQ-FEAT: CR3LFp2JE4kJjXOcdkorczscpSzH6+axHpSU32WFVYbv/RGXMGwZNm0mqCz6D
	gz9/sgtHdEu0Hpdze0GuS3D6Irg4Df8QiNwDsaA6ysM60/Ho50JMfM3UXJDjxhxTAQJmf08
	2g+pmLbzG6sqegUOfI7Bqk0cBi8wPyNlP79jzi4+2G/4EB+bteo4XqATZZMPqdIZxNerVW7
	zYzBrU5bsvqnxAgq9RY7WWSKOF4WLCtt1HmqlkFh/RReaAs7ttv7DELAls5+VJ7BadjYxZ5
	lnXtZ30WpuH37gpQ2xpywx2N6bQQzJWukdBKANUZas2U6RtWXYUj1hf5q4jZyp24XNNb9tI
	jXfxcsenjYsV+UPuIj2lO0Tur+eydKLmUqICFwU
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17312017847681261293
From: Yuan Tan <tanyuan@tinylab.org>
To: i@maskray.me
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sparse@vger.kernel.org,
	linux@weissschuh.net,
	luc.vanoostenryck@gmail.com,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	paulburton@kernel.org,
	paulmck@kernel.org,
	tanyuan@tinylab.org,
	tim.bird@sony.com,
	tsbogend@alpha.franken.de,
	w@1wt.eu
Subject: Re: [PATCH v1 09/14] DCE/DSE: inhibit .size directive for SHF_GROUP
Date: Mon, 13 Nov 2023 15:19:42 +0800
Message-Id: <20231113071942.35259-1-tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DS7PR12MB576503711253C682DCE40524CBABA@DS7PR12MB5765.namprd12.prod.outlook.com>
References: <DS7PR12MB576503711253C682DCE40524CBABA@DS7PR12MB5765.namprd12.prod.outlook.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_232016_178968_9222EE50 
X-CRM114-Status: GOOD (  21.56  )
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

SGksIEZhbmdydWkKClRoYW5rIHlvdSBmb3IgeW91ciB0aW1lIDopCgpPbiAxMS82LzIwMjMgNDo1
MCBBTSwgRmFuZ3J1aSBTb25nIHdyb3RlOgo+IE9uIEZyaSwgTm92IDMsIDIwMjMgYXQgOTowMeKA
r0FNIFl1YW4gVGFuIDx0YW55dWFuQHRpbnlsYWIub3JnPiB3cm90ZToKPiA+Cj4gPiAuc2l6ZSBk
aXJlY3RpdmUgZmFpbHMgaW4gc29tZSBmdW5jdGlvbnMgd2l0aCBTSEZfR1JPVVAsIHRoaXMgaXMg
bm90Cj4gPiByZWFsbHkgcmVxdWlyZWQgZm9yIG5vcm1hbCBidWlsZGluZywgaW5oaWJpdCBpdCB0
byBzaWxlbmNlIHRoZSBjb21waWxpbmcKPiA+IGZhaWx1cmVzIHdpdGggU0hGX0dST1VQLgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IFl1YW4gVGFuIDx0YW55dWFuQHRpbnlsYWIub3JnPgo+ID4gU2ln
bmVkLW9mZi1ieTogWmhhbmdqaW4gV3UgPGZhbGNvbkB0aW55bGFiLm9yZz4KPiA+IC0tLQo+ID4g
IE1ha2VmaWxlIHwgMyArKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKPiA+IGluZGV4IGE0ZTUyMmI3
NDdjYi4uZjY3YjZlOGQyYzQ1IDEwMDY0NAo+ID4gLS0tIGEvTWFrZWZpbGUKPiA+ICsrKyBiL01h
a2VmaWxlCj4gPiBAQCAtOTM2LDYgKzkzNiw5IEBAIGVuZGlmCj4gPiAgIyBgcnVzdGNgJ3MgYC1a
ZnVuY3Rpb24tc2VjdGlvbnNgIGFwcGxpZXMgdG8gZGF0YSB0b28gKGFzIG9mIDEuNTkuMCkuCj4g
PiAgaWZkZWYgQ09ORklHX0xEX0RFQURfQ09ERV9EQVRBX0VMSU1JTkFUSU9OCj4gPiAgS0JVSUxE
X0NGTEFHU19LRVJORUwgKz0gLWZmdW5jdGlvbi1zZWN0aW9ucyAtZmRhdGEtc2VjdGlvbnMKPiA+
ICtpZmRlZiBDT05GSUdfU0VDVElPTl9TSEZfR1JPVVBfU1VQUE9SVAo+ID4gK0tCVUlMRF9DRkxB
R1NfS0VSTkVMICs9IC1maW5oaWJpdC1zaXplLWRpcmVjdGl2ZQo+ID4gK2VuZGlmCj4gPiAgS0JV
SUxEX1JVU1RGTEFHU19LRVJORUwgKz0gLVpmdW5jdGlvbi1zZWN0aW9ucz15Cj4gPiAgTERGTEFH
U192bWxpbnV4ICs9IC0tZ2Mtc2VjdGlvbnMKPiA+ICBpZmRlZiBDT05GSUdfTERfREVBRF9DT0RF
X0RBVEFfRUxJTUlOQVRJT05fREVCVUcKPiA+IC0tCj4gPiAyLjM0LjEKPiA+Cj4gCj4gQ2xhbmcg
ZG9lc24ndCBzdXBwb3J0IC1maW5oaWJpdC1zaXplLWRpcmVjdGl2ZSwgc28gdGhpcyB3b3VsZCBi
cmVhawo+IENsYW5nIGJ1aWxkcy4KCkN1cnJlbnRseSwgQ2xhbmcgZG9lc24ndCBzdXBwb3J0IExE
X0RFQURfQ09ERV9EQVRBX0VMSU1JTkFUSU9OLiBTbyBpbiB0aGlzCnBhdGNoIHNlcmllcyBJIGRp
ZG4ndCB0YWtlIG11Y2ggdGhvdWdodCBhYm91dCBjbGFuZy4KCj4gCj4gR0NDIGhhcyBoYWQgdGhp
cyBvcHRpb24gc2luY2UgMTk5MiwgYnV0IGl0IGlzIG5vdCB1c2VkIGluIHRoZSB3aWxkLgo+IGh0
dHBzOi8vZ2NjLmdudS5vcmcvb25saW5lZG9jcy9nY2MvQ29kZS1HZW4tT3B0aW9ucy5odG1sI2lu
ZGV4LWZpbmhpYml0LXNpemUtZGlyZWN0aXZlCj4gc2F5cwo+IAo+ID4gLi4uIFRoaXMgb3B0aW9u
IGlzIHVzZWQgd2hlbiBjb21waWxpbmcgY3J0c3R1ZmYuYzsgeW91IHNob3VsZCBub3QgbmVlZCB0
byB1c2UgaXQgZm9yIGFueXRoaW5nIGVsc2UuCj4gCj4gV2hhdCBwcm9ibGVtIGhhdmUgeW91IHNl
ZW4gd2l0aCAuc2l6ZSBkaXJlY3RpdmVzIChzdF9zaXplIGZpZWxkIGluCj4gc3ltYm9sIHRhYmxl
IGVudHJpZXMpPwoKJCBtYWtlIEFSQ0g9cmlzY3YgQ1JPU1NfQ09NUElMRT1yaXNjdjY0LWxpbnV4
LWdudS0gZnMvaW9jdGwubwovdG1wL2NjeTVFM3dOLnM6IEVycm9yOiAuc2l6ZSBleHByZXNzaW9u
IGZvciBfX3Jpc2N2X3N5c19pb2N0bCBkb2VzIG5vdCBldmFsdWF0ZSB0byBhIGNvbnN0YW50Cm1h
a2VbM106ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyNDM6IGZzL2lvY3RsLm9dIEVycm9y
IDEKbWFrZVsyXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjQ4MDogZnNdIEVycm9yIDIK
bWFrZVsxXTogKioqIFsvaG9tZS90YW55dWFuL3Byb2plY3RzL2xpbnV4L01ha2VmaWxlOjE5MTY6
IC5dIEVycm9yIDIKbWFrZTogKioqIFtNYWtlZmlsZToyMzQ6IF9fc3ViLW1ha2VdIEVycm9yIDIK
CkFuZCB0aGUgZnMvaW9jdGwucyBpcyBsaWtlCgkuc2VjdGlvbgkudGV4dC5fX3Jpc2N2X3N5c19p
b2N0bCwiYXgiLEBwcm9nYml0cwoJLmFsaWduCTEKCS5nbG9ibAlfX3Jpc2N2X3N5c19pb2N0bAoJ
LnR5cGUJX19yaXNjdl9zeXNfaW9jdGwsIEBmdW5jdGlvbgpfX3Jpc2N2X3N5c19pb2N0bDoKICAg
ICAgICAuLi4KICAgICAgICAuLi4KCS5zaXplCV9fcmlzY3Zfc3lzX2lvY3RsLCAuLV9fcmlzY3Zf
c3lzX2lvY3RsCgpJIGNhbm5vdCB1bmRlcnN0YW5kIHRoaXMgZXJyb3IgYW5kIHRoaXMgb3B0aW9u
IGp1c3Qgc29sdmUgdGhlIHByb2JsZW0gOikKCj4gCj4gJSBjYXQgYS5jCj4gaW50IHY7Cj4gdm9p
ZCBmKCkge30KPiAlIGRpZmYgLXUwIDwoZ2NjIC1TIGEuYyAtbyAtKSA8KGdjYyAtUyAtZmluaGli
aXQtc2l6ZS1kaXJlY3RpdmUgYS5jIC1vIC0pCj4gLS0tIC9wcm9jL3NlbGYvZmQvMTEgICAgMjAy
My0xMS0wNSAxMjo0Mjo1MS4yOTg2MTg0NzUgLTA4MDAKPiArKysgL3Byb2Mvc2VsZi9mZC8xNSAg
ICAyMDIzLTExLTA1IDEyOjQyOjUxLjI5ODYxODQ3NSAtMDgwMAo+IEBAIC03ICs2LDAgQEAKPiAt
ICAgICAgIC5zaXplICAgdiwgNAo+IEBAIC0yNyArMjUsMCBAQAo+IC0gICAgICAgLnNpemUgICBm
LCAuLWYKPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
