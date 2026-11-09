Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AB9606A337
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 13:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L2uo6NzG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=FPncPHrn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Message-Id:Cc:References:
	In-Reply-To:Mime-Version:Subject:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sSUpOC7Bh7pDzKGW6bYA4PGC7vcorNyvGr8D2+wm1Gc=; b=L2uo6NzG7yxzYVMB3OZ/HtFG9a
	gAXbGDpZkxcqrAtUIaevThYGfEYMG5OfE/jUsrZxbWO3PcvIO3kUBxdc7Y3OlTTxeOMNPeSVdS14o
	mfigWY/Gihcg57bWTnEzKKl3dmQZOZXTJvea+TPuUqF44aZ5BCo/9IFNpigjpbparP7ON3CfRC+Vw
	iEBLBzJ9MtXYDXjz398it/DwWfp/+c11lHfFOOzwf0OircVIc9jLD5lOql6lmYAUeJ5Okp7ozVIE6
	+w/eVUXTAe/H4YR4B+E9CoBnA//WLz9W4jKOQ8fSQDqREfngIqPmuHphnmdSlYZ3HVIj/z9HaSq/o
	FQRtOiXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQP52-00000000lVJ-09o9;
	Mon, 09 Nov 2026 13:06:36 +0000
Received: from va-2-27.ptr.blmpb.com ([209.127.231.27])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQP4y-00000000lUY-3R7Y
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 13:06:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1794229584; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=eH2m2Zew8oyu1f0utHA4YTbxzS4hIWuowjmaOpnZyec=;
 b=FPncPHrnGO+ZqH6h4jZezfHOh68vzD6GFyBL9l21fKlsjKOgOM96kH5+woKABP9ihuvKnV
 SM91Ohyn7Bv1fjK5h4mEroQOsJzvKy1hMCAC/TndzXs/ZH0I328yxCFJEiHinh4ctVayui
 ZRf+KPrEPgHEa0bnSVJbqzpRI9Bq9b1XN0y6bn4sER4SIs2QpxfbR6VBjo9JeUlAOzp5G5
 HRukT3+mfocpS4Rwh6Td4H0wMihXt3SmDhn/2ySCE8SVvd1dn+vnyLc+h8kra6b5p5lpzN
 7PKvLa6jyzNvaE0+SeBciYWWyotFeo3gZrWUvevi7uuIi64Lb5LMyk+8hHDSag==
From: "Zeng Heng" <zengheng@picoheart.com>
Subject: Re: [PATCH v11 0/5] riscv: Add initial CBQRI resctrl support
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
In-Reply-To: <20261108-dfustini-atl-sc-cbqri-dt-v11-0-33a1bf0cf01c@kernel.org>
References: <20261108-dfustini-atl-sc-cbqri-dt-v11-0-33a1bf0cf01c@kernel.org>
X-Original-From: Zeng Heng <zengheng@picoheart.com>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>, 
	"Jonathan Cameron" <jic23@kernel.org>, 
	"Shaopeng Tan" <tan.shaopeng@jp.fujitsu.com>, 
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<x86@kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-doc@vger.kernel.org>
Message-Id: <bb2f816c-9c8d-4a27-8353-a946ba58870c@picoheart.com>
To: "Drew Fustini" <fustini@kernel.org>, 
	"Adrien Ricciardi" <aricciardi@baylibre.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Atish Patra" <atish.patra@linux.dev>, "Babu Moger" <babu.moger@amd.com>, 
	"Ben Horgan" <ben.horgan@arm.com>, "Borislav Petkov" <bp@alien8.de>, 
	"Chen Pei" <cp0613@linux.alibaba.com>, 
	"Conor Dooley" <conor.dooley@microchip.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Dave Hansen" <dave.hansen@linux.intel.com>, 
	"Dave Martin" <Dave.Martin@arm.com>, "Fenghua Yu" <fenghuay@nvidia.com>, 
	"Gong Shuai" <gong.shuai@sanechips.com.cn>, 
	"Gong Shuai" <gsh517@gmail.com>, <guo.wenjia23@zte.com.cn>, 
	"James Morse" <james.morse@arm.com>, 
	=?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, <liu.qingtao2@zte.com.cn>, 
	"Liu Zhiwei" <zhiwei_liu@linux.alibaba.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>, 
	"Peter Newman" <peternewman@google.com>, 
	=?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
	"Reinette Chatre" <reinette.chatre@intel.com>, 
	"Rob Herring" <robh@kernel.org>, 
	"Samuel Holland" <samuel.holland@sifive.com>, 
	"Sunil V L" <sunilvl@oss.qualcomm.com>, 
	"Tony Luck" <tony.luck@intel.com>, "Weiwei Li" <liwei1518@gmail.com>, 
	"yunhui cui" <cuiyunhui@bytedance.com>, 
	"Zhanpeng Zhang" <zhangzhanpeng.jasper@bytedance.com>
Date: Mon, 9 Nov 2026 21:06:09 +0800
X-Lms-Return-Path: <lba+26af1c545+184757+lists.infradead.org+zengheng@picoheart.com>
Received: from [172.16.137.224] ([124.160.26.250]) by smtp.feishu.cn with ESMTPS; Mon, 09 Nov 2026 21:06:12 +0800
User-Agent: Mozilla Thunderbird
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_050633_051034_2D29AF10 
X-CRM114-Status: GOOD (  15.99  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgRHJldywKCuWcqCAxMS85LzI2IOS4iuWNiDc6MjAsIERyZXcgRnVzdGluaSDlhpnpgZM6Cj4g
VGhpcyBzZXJpZXMgYWRkcyBpbml0aWFsIFJJU0MtViBRb1Mgc3VwcG9ydCB0aHJvdWdoIHRoZSBD
QlFSSQo+IGNvbnRyb2xsZXIgaW50ZXJmYWNlIFsxXSBpbnRlZ3JhdGVkIHdpdGggcmVzY3RybCBb
Ml0sIHBsdXMgYSBEVC1iYXNlZAo+IHBsYXRmb3JtIGRyaXZlciBmb3IgY2FjaGUgY29udHJvbGxl
cnMuIEl0IGJ1aWxkcyBvbiB0aGUgU3Nxb3NpZAo+IGV4dGVuc2lvbiBbM10gKHNybWNmZyBDU1Ip
IHN1cHBvcnQgdGhhdCBsYW5kZWQgaW4gdGhlIHY3LjMgbWVyZ2UKPiB3aW5kb3cuIEl0IGhhcyBi
ZWVuIHRlc3RlZCBvbiBib3RoIHRoZSBUZW5zdG9ycmVudCBBc2NhbG9uIFNoYXJlZCBDYWNoZQo+
IGNvbnRyb2xsZXIgYW5kIGEgUUVNVSBpbXBsZW1lbnRhdGlvbiBbNF0uCj4gCj4gICAgcWVtdS1z
eXN0ZW0tcmlzY3Y2NCAtTSB2aXJ0LGFpYT1hcGxpYy1pbXNpYyAtbm9ncmFwaGljIC1tIDFHIC1z
bXAgOCBcCj4gICAgICAgIC1rZXJuZWwgYXJjaC9yaXNjdi9ib290L0ltYWdlIFwKPiAgICAgICAg
LWFwcGVuZCAicm9vdD0vZGV2L3ZkYSBybyBjb25zb2xlPXR0eVMwIHJvb3R3YWl0IiBcCj4gICAg
ICAgIC1kcml2ZSBpZj1ub25lLGZpbGU9cm9vdGZzLmV4dDIsZm9ybWF0PXJhdyxpZD1oZDAgXAo+
ICAgICAgICAtZGV2aWNlIHZpcnRpby1ibGstZGV2aWNlLGRyaXZlPWhkMCBcCj4gICAgICAgIC1k
ZXZpY2UgcmlzY3YuY2JxcmkuY2FwYWNpdHksbWF4X21jaWRzPTI1NixtYXhfcmNpZHM9NjQsbmNi
bGtzPTE2LG1taW9fYmFzZT0weDA0ODIwMDAwCj4gCj4gQ2FjaGUgYWxsb2NhdGlvbiBjYW4gYmUg
ZXhlcmNpc2VkIG9uIHRoZSBib290ZWQgc3lzdGVtLiBNb3VudCByZXNjdHJsCj4gYW5kIHJlYWQg
dGhlIGRlZmF1bHQgc2NoZW1hdGEuIFRoZSBMMiBjb250cm9sbGVyIGhhcyAxNiBjYXBhY2l0eQo+
IGJsb2Nrcywgc28gdGhlIGRlZmF1bHQgY2FwYWNpdHkgYml0bWFzayAoQ0JNKSBpcyAweGZmZmY6
Cj4gCj4gICAgIyBtb3VudCAtdCByZXNjdHJsIHJlc2N0cmwgL3N5cy9mcy9yZXNjdHJsCj4gICAg
IyBjYXQgL3N5cy9mcy9yZXNjdHJsL3NjaGVtYXRhCj4gICAgTDI6MD1mZmZmCj4gCj4gV3JpdGUg
YSBuYXJyb3dlciBDQk0gdG8gYSBuZXcgY29udHJvbCBncm91cCBhbmQgcmVhZCBpdCBiYWNrIHRv
IGNvbmZpcm0KPiB0aGUgTDIgY29udHJvbGxlciBhcHBsaWVkIGl0Ogo+IAo+ICAgICMgbWtkaXIg
L3N5cy9mcy9yZXNjdHJsL2dyb3VwMAo+ICAgICMgZWNobyAiTDI6MD1mZiIgPiAvc3lzL2ZzL3Jl
c2N0cmwvZ3JvdXAwL3NjaGVtYXRhCj4gICAgIyBjYXQgL3N5cy9mcy9yZXNjdHJsL2dyb3VwMC9z
Y2hlbWF0YQo+ICAgIEwyOjA9ZmYKPiAKPiBOb3RlIHRoYXQgdGhpcyBzZXJpZXMgb25seSBpbXBs
ZW1lbnRzIHN1cHBvcnQgZm9yIHJlc2N0cmwgTDIgYW5kIEwzCj4gY2FjaGUgcmVzb3VyY2VzIHVz
aW5nIENCUVJJIGNhcGFjaXR5IGFsbG9jYXRpb24gY29udHJvbC4gY2NfYmxvY2tfbWFzawo+IG1h
cHMgb250byByZXNjdHJsJ3MgZXhpc3RpbmcgY2JtIHNjaGVtYS4gSG93ZXZlciwgY2NfY3VuaXRz
IGlzIG5vdAo+IHN1cHBvcnRlZCBhcyB0aGVyZSBpcyBubyBleGlzdGluZyBlcXVpdmFsZW50IGZv
ciBjYXBhY2l0eSB1bml0cyBpbiB0aGUKPiByZXNjdHJsIHNjaGVtYXRhLgo+IAo+IEkgcHJldmlv
dXNseSBpdGVyYXRlZCBvbiBhbiBSRkMgc2VyaWVzIFs1XSB0aGF0IGltcGxlbWVudGVkIGFsbCBv
Zgo+IENCUVJJLCBpbmNsdWRpbmcgY2FwYWNpdHkgbW9uaXRvcmluZywgYmFuZHdpZHRoIGFsbG9j
YXRpb24gYW5kCj4gbW9uaXRvcmluZy4gVGhlIGJhbmR3aWR0aCBjb250cm9scyBmb3IgQ0JRUkkg
ZG8gbm90IGZpdCB3ZWxsIGludG8KPiByZXNjdHJsJ3MgZXhpc3RpbmcgdGhyb3R0bGUtYmFzZWQg
TUIgc2NoZW1hdGEuIEkgYmVsaWV2ZSB0aGF0IHRoZSBwYXRoCj4gZm9yd2FyZCBpcyBSZWluZXR0
ZSdzIGdlbmVyaWMgc2NoZW1hIGRlc2NyaXB0aW9uIHByb29mIG9mIGNvbmNlcHQgWzZdLgo+IE15
IHBsYW4gaXMgdG8gcmViYXNlIHRoZSBmdWxsIHN1cHBvcnQgb2YgQ0JRUkkgb250byB0aGUgZ2Vu
ZXJpYyBzY2hlbWEKPiBvbmNlIGl0IGlzIHJlYWR5Lgo+IAo+IFRvbnkgTHVjaydzIEFFVCBzZXJp
ZXMgWzddIHJlcGxhY2VzIHJlc2N0cmxfYXJjaF9hbGxvY19jYXBhYmxlKCkgYW5kCj4gcmVzY3Ry
bF9hcmNoX21vbl9jYXBhYmxlKCkgd2l0aCBnZW5lcmljIGhlbHBlcnMgdGhhdCB3YWxrIHRoZSBy
ZXNvdXJjZXMuCj4gVGhpcyBzZXJpZXMga2VlcHMgdGhlIHR3byBob29rcyBiZWNhdXNlIHJlc2N0
cmwgb24gdjcuNC1yYzEgc3RpbGwKPiBjYWxscyB0aGVtLCBhbmQgYW5zd2VycyB0aGUgYWxsb2Mg
aG9vayBmcm9tIHJkdF9yZXNvdXJjZTo6YWxsb2NfY2FwYWJsZQo+IHNvIHdoaWNoZXZlciBzZXJp
ZXMgbGFuZHMgc2Vjb25kIG9ubHkgaGFzIHRvIGRlbGV0ZSB0aGVtLiBJZiB0aGUgQUVUCj4gc2Vy
aWVzIGxhbmRzIGZpcnN0LCB0aGUgQ0JRUkkgZ2x1ZSB3aWxsIGFsc28gbmVlZCB0aGUgdGhyZWUg
YXJjaCBob29rcwo+IGl0IGFkZHMsIHJlc2N0cmxfYXJjaF9zeXN0ZW1fbWF4X3JtaWRfaWR4KCks
Cj4gcmVzY3RybF9hcmNoX2dldF9udW1fcm1pZF9pZHgoKSBhbmQgcmVzY3RybF9hcmNoX3VubW91
bnQoKS4KPiAKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3YtY2Jx
cmkvcmVsZWFzZXMvdGFnL3YxLjAKPiBbMl0gaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvZmlsZXN5
c3RlbXMvcmVzY3RybC5odG1sCj4gWzNdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1z
c3Fvc2lkL3JlbGVhc2VzL3RhZy92MS4wCj4gWzRdIGh0dHBzOi8vZ2l0aHViLmNvbS90dC1mdXN0
aW5pL3FlbXUvdHJlZS9yaXNjdi1jYnFyaS1jYWNoZQo+IFs1XSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1yaXNjdi8yMDI2MDYwMS1zc3Fvc2lkLWNicXJpLXJxc2MtdjctMC12Ni0wLWJh
ZjAwZjUwMDI4YUBrZXJuZWwub3JnLwo+IFs2XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
ZDI1OGEzMmYtMTJkNS00NjRkLWFiZTktNDcyMGZiM2U0NGIzQGludGVsLmNvbS8KPiBbN10gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI2MTAxOTIwNTAzMS4xNjk3Ny0xLXRvbnkubHVj
a0BpbnRlbC5jb20vCj4gCgpJIGhhdmUgdGVzdGVkIHRoZSBDQlFSSSBwYXRjaCBzZXJpZXMsIGNv
dmVyaW5nIHRoZSBmb2xsb3dpbmc6CgogICAqIEJvb3QtdGltZSBpbml0aWFsaXphdGlvbgogICAq
IE1vdW50aW5nIGFuZCByZW1vdW50aW5nIHRoZSByZXNjdHJsIGZpbGVzeXN0ZW0KICAgKiBDcmVh
dGluZyByZXNjdHJsIGNvbnRyb2wgZ3JvdXBzCiAgICogQ29uZmlndXJpbmcgc2NoZW1hdGEgZm9y
IEwzIGJsb2NrX21hc2sgcmVzb3VyY2UgYWxsb2NhdGlvbgoKQWxsIG9mIHRoZSBhYm92ZSB3b3Jr
ZWQgYXMgZXhwZWN0ZWQuCgpUZXN0ZWQtYnk6IFplbmcgSGVuZyA8emVuZ2hlbmdAcGljb2hlYXJ0
LmNvbT4KUmV2aWV3ZWQtYnk6IFplbmcgSGVuZyA8emVuZ2hlbmdAcGljb2hlYXJ0LmNvbT4KCgpC
ZXN0IHJlZ2FyZHMsClplbmcgSGVuZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
