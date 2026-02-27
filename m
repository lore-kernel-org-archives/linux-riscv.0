Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F11EFD9E34
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 05:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+52Cu4h/lLSDMcs+NYSe95xzHh0UMZ7gm1fpERxZ1g=; b=GrB0E8ntDRSWNmY2abWxjawY8E
	/u8wRHI9y0C00/AqJjMSe5q0tC3n73UYJyn89CIeVeJsg7GCqG4ZzfzoRU40S5Vijvh7jwKLTcj0h
	+BA9ESPeGdZQwJXT69BQsCnXYido/Dhn6xhQ/imyh1KA1Vv0poqZarZz9AHY+gcmJQRgl4Q60jBEj
	btth5kQA+SnCZmeGUhcC27A49IUgrnwty6tKhjK8pS5VVMGYVGZg2PchqJQb40zcx5Q2i9bhiuEzD
	n1cyGKCrG3/wMt3m8on9BnD+AIA0BfAbwJPuqGhZQQgU4xnzpvDVLWgLfbZ2fwnlFx6Dv9tJFb0dG
	Ajrloh9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqoo-00000007k8G-1JPy;
	Fri, 27 Feb 2026 05:55:18 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqoj-00000007k77-3Tw1
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 05:55:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1772171658;
	bh=BYVcnLRn5v+cUDho0LUkPdukvb67I+Jv1XckyKd0gtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=LZYHo7ASIxLEbyCRB4psngQDbysF1j8g+7HaUij4HMWkkjljEGTM+DBswss03lA71
	 pt68imgi4astxjjG2FZOLgP2fb5miUl0jYKVpBZP/ah+Wknk4shLexVSe14jK20wxt
	 gcwyVn+w3JID0Dzo1CE+3SRC+s35sF2XSPCkEVc0=
X-QQ-mid: esmtpgz10t1772171655t42f02dc3
X-QQ-Originating-IP: pBeg9DsutXave9qSV7etrk0iKgAsjpTita/phqPQrdA=
Received: from [10.3.91.191] ( [101.70.127.119])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Feb 2026 13:54:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13968557730430242067
Message-ID: <E0900342298E5A5F+1e5c6ddb-3049-4488-9af5-ff3f1eb1544b@linux.spacemit.com>
Date: Fri, 27 Feb 2026 13:54:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] RISC-V IOMMU HPM support
To: yaxing guo <guoyaxing@bosc.ac.cn>, Zong Li <zong.li@sifive.com>,
 tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, robh@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, mark.rutland@arm.com,
 conor+dt@kernel.org, krzk@kernel.org, luxu.kernel@bytedance.com,
 andrew.jones@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-perf-users@vger.kernel.org
References: <20260208063848.3547817-1-zong.li@sifive.com>
 <D8C71AE40393A6FD+89365591-f896-4609-8b0f-8dffe85b5828@linux.spacemit.com>
 <1e2b448f-3a2a-4b1f-872d-a34f7bd53696@bosc.ac.cn>
Content-Language: en-US
From: Lv Zheng <lv.zheng@linux.spacemit.com>
In-Reply-To: <1e2b448f-3a2a-4b1f-872d-a34f7bd53696@bosc.ac.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: MkzizgG39dTmeNimumP83xEw97EsKF3YZlPUgL5vYgddkC2Mwl3brOlN
	BekazWD46ExloUKyLtx8axETI9oGxwFryU3Hkv8UY/NQl+2rYGqojW8tKmmzCc/BpE/plj9
	A4ZGDD24sueNJI9ae5Pg8WWT2nQpnYdnPWbgwmHExfoJxLmbiBwc9F+XPgyyWzBLht5xwpL
	9lrfhwIgw2FI5zMh8FMrgvoUKFE/+8saqYqYbH8fHUbgsfNdhMo9gVsurRIqgnpUovw8Gna
	R+37RqMcf+hML019nnBeiSg62lRGW7jX8khQns+IPqGqDtSbs9jIO0LN2JeWNPm5FqxlF14
	0IeWPqYQBbjhf7sTZB6ddnDuFvNsdjQFIzzWYNzY01zYdQwYoX+G3GjOt3C79RmF75b6lp0
	EgZMEP9ndXl2krnXcOahM5Av7xbBojIq5qP9e0AFR1eiBYt9Jms+FIkPg4zB/Elfy3l++nI
	ifi3DQZ5u0Jh9hRyhWMW/JxrbVNt4WntTvHQdxUm0/3e5DlUqnQdOtlXHQV+Rnr/aVQKCJP
	5/71zSbcJKc4eN0GSqtxk2PeGSjhoYAr0Iz+PWpAmpV9kVeGYrFlmM3K2fXzJdvNQrN0iaM
	orPWfm5P0taVG8L1/Y6//WQwsU3oFS17R7JjzYCU9hdb31XSACkyia9WEtVsilDo2WRiHi4
	9S31c/3znSuWHvYJIxaduRrDxg50Oa2+QnXYZ+j2s5CdcXcVgOBucfwRGw0/EriwuQe57A/
	wdhH90hD07T58ZxQjn2FhJjqM9u5axnfGtlCnl/cd9x+vq9hJrNYkZaeEboAlgjRgwXicBg
	9GJar0QNUPyer4eUr1frxAivhGcVFJNwmqNi1nASS/WlRE+UUERzLF4gfF6vHvWj23/xrOW
	SBjVhDTdedgUMTtJIGJg2kr2WV26wzE+xhifrmkAB7PJTdU4WYInInlBv5Xrfw6SrNDNAu0
	b35GiHycYn2rEvFTWrSQhwcbcyJ4skFHiocUQFPWq2wjy8SeFTUMwPXk2+qV5K0nL2VyHTV
	3vtg0UacxM2me+5ZA4gUeDnldzLjp3NbzG+je1Eg==
X-QQ-XMRINFO: NI4Ajvh11aEjTGfg3rCZA0snif+LPcv00g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_215515_367343_9567FC3B 
X-CRM114-Status: GOOD (  22.31  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMi85LzIwMjYgMTE6MjEgQU0sIHlheGluZyBndW8gd3JvdGU6Cj4gCj4gCj4g5ZyoIDIwMjYv
Mi85IDk6NDAsIEx2IFpoZW5nIOWGmemBkzoKPj4gT24gMi84LzIwMjYgMjozOCBQTSwgWm9uZyBM
aSB3cm90ZToKPj4+IFRoaXMgc2VyaWVzIGltcGxlbWVudHMgc3VwcG9ydCBmb3IgdGhlIFJJU0Mt
ViBJT01NVSBoYXJkd2FyZSBwZXJmb3JtYW5jZQo+Pj4gbW9uaXRvci4KPj4+Cj4+PiBUaGUgUklT
Qy1WIElPTU1VIFBNVSBkcml2ZXIgaXMgaW1wbGVtZW50ZWQgYXMgYW4gYXV4aWxpYXJ5IGRldmlj
ZSBkcml2ZXIKPj4+IGNyZWF0ZWQgYnkgdGhlIHBhcmVudCBSSVNDLVYgSU9NTVUgZHJpdmVyLiBU
aGUgY2hpbGQgZHJpdmVyIGNhbiBvYnRhaW4KPj4+IHJlc291cmNlcyBhbmQgaW5mb3JtYXRpb24g
ZnJvbSB0aGUgcGFyZW50IGRldmljZSwgc3VjaCBhcyB0aGUgTU1JTyBiYXNlCj4+PiBhZGRyZXNz
IGFuZCBJUlEgbnVtYmVyLgo+Pj4KPj4+IEN1c3RvbSBldmVudCBzdXBwb3J0IGlzIG5vdCBpbmNs
dWRlZCBpbiB0aGlzIHNlcmllcyBhbmQgd2lsbCBiZSAKPj4+IHN1Ym1pdHRlZAo+Pj4gYXMgYSBz
ZXBhcmF0ZSBzZXJpZXMuIFRoZSBpZGVhIGlzIHRoYXQgY3VzdG9tIGV2ZW50cyB3aWxsIGJlIGRl
ZmluZWQKPj4+IHRocm91Z2ggdGhlIGRyaXZlciBkYXRhIG9mIHRoZSBhdXhpbGlhcnkgZHJpdmVy
LiBXaGVuIHRoZSBwYXJlbnQgSU9NTVUKPj4+IGRyaXZlciBjcmVhdGVzIHRoZSBhdXhpbGlhcnkg
ZGV2aWNlLCBpdCBzaG91bGQgcGFzcyBhIHZlbmRvci1zcGVjaWZpYwo+Pj4gbmFtZSBhcyB0aGUg
ZGV2aWNlIG5hbWUgaW4gb3JkZXIgdG8gbWF0Y2ggdGhlIGNvcnJlc3BvbmRpbmcgYXV4aWxpYXJ5
Cj4+PiBkZXZpY2UgSUQuCj4+Pgo+Pj4gQWZ0ZXIgbXkgaW5pdGlhbCBSRkMgYW5kIHRoZSB2MSBw
YXRjaCBzZXJpZXMgd2VyZSBwb3N0ZWQsIHNpbWlsYXIgcGF0Y2gKPj4+IHNlcmllcyBhbHNvIGFw
cGVhcmVkIG9uIHRoZSBtYWlsaW5nIGxpc3QuCj4+Pgo+Pj4gT25lIHdhcyBmcm9tIFlheGluZyBH
dW86Cj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA5MTUwMjA5MTEuMTMxMy0x
LWd1b3lheGluZ0Bib3NjLmFjLmNuLwo+Pj4KPj4+IGFuZCBhbm90aGVyIGZyb20gTHYgWmhlbmc6
Cj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMzBDN0FEMzUxREI1NTI3NithOGIwM2Rh
Yy1jNWFmLTQwMzQtODYzMS0gCj4+PiBhYzFjMzUyYTQ2OWZAbGludXguc3BhY2VtaXQuY29tLwo+
Pgo+PiBQbGVhc2UgZG8gbm90IGZvcmdldCB0byBDYzoKPj4gSmluZ3l1IExpIDxqb2V5LmxpQHNw
YWNlbWl0LmNvbT4KPj4gSSBvbmx5IHByb3ZpZGVkIFQxMDAgc3BlY2lmaWMgc3VwcG9ydCBpbiB0
aGUgcG9zdGVkIHNlcmllcywgYW5kIHRoZQo+PiBuZXcgYXBwcm9hY2ggb2YgdGhlIEhQTSBkcml2
ZXIgaW4gdGhlIHNhbWUgc2VyaWVzIGlzIGNvbXBvc2VkIGJ5IGhlci4KPj4KPj4+Cj4+PiBZYXhp
bmcgaGFzIGFncmVlZCB0byBwYXVzZSBoaXMgc2VyaWVzLCBhcyBkaXNjdXNzZWQgaGVyZToKPj4+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWlvbW11LzJjZTlkOGJlLTEwYjMtNDhkZC0g
Cj4+PiBiOTllLTczNTgzNDdmYzE3MUBib3NjLmFjLmNuLwo+Pj4KPj4+IFRoZSBtb3RpdmF0aW9u
IGZvciBzZW5kaW5nIHRoaXMgdjIgdmVyc2lvbiBpcyBub3Qgb25seSB0byBhZGRyZXNzIHRoZQo+
Pj4gZmVlZGJhY2sgYW5kIHN1Z2dlc3Rpb25zIGZyb20gdGhlIHByZXZpb3VzIHJvdW5kLCBidXQg
YWxzbyB0byBpbnRyb2R1Y2UKPj4+IGEgbWFqb3Igc3RydWN0dXJhbCBjaGFuZ2U6IHRoZSBQTVUg
ZHJpdmVyIGhhcyBiZWVuIG1vdmVkIHVuZGVyCj4+PiBkcml2ZXJzL3BlcmYvLCB3aGljaCBoYXMg
YmVlbiBtZW50aW9uZWQgcmVwZWF0ZWRseSBieSBzZXZlcmFsIHBlb3BsZS4KPj4+IFRoaXMgcmVz
dWx0cyBpbiBhIGRpZmZlcmVudCBkcml2ZXIgc3RydWN0dXJlIGNvbXBhcmVkIHRvIG15IGVhcmxp
ZXIKPj4+IHZlcnNpb24gYW5kIHRoZSBvdGhlciB0d28gc2VyaWVzLCBhbmQgSSdkIGxpa2UgdG8g
Z2F0aGVyIGZlZWRiYWNrIGFuZAo+Pj4gc3VnZ2VzdGlvbnMgZnJvbSB0aGUgY29tbXVuaXR5IG9u
IHRoaXMgYXBwcm9hY2guIElmIHRoZSBjb21tdW5pdHkgd291bGQKPj4+IHByZWZlciB0byBnbyB3
aXRoIEx2IFpoZW5n4oCZcyB2ZXJzaW9uIGluc3RlYWQsIEkgYW0gcGVyZmVjdGx5IGZpbmUgd2l0
aAo+Pj4gdGhhdCBhcyB3ZWxsLgo+Pgo+PiBXZSdkIGxpa2UgdG8ga25vdyBpZiB0aGVyZSdzIGFu
eSBjb21tZW50cyByZWxhdGVkIHRvIHB1dHRpbmcgSU9NTVUgSFBNCj4+IGRyaXZlciBpbnRvIGRy
aXZlcnMvcGVyZiBmb2xkZXIgYW5kIHdhbnQgdG8ga25vdyBpZiB0aGlzIGlzIG5lY2Vzc2FyeS4K
Pj4gV2UgYWxzbyBoZXNpdGF0ZWQgaWYgcmlzY3YgaW9tbXUgaHBtIHNob3VsZCBiZSBwdXQgaW50
byBkcml2ZXJzL3BlcmYsCj4+IGFuZCBhY2NvcmRpbmcgdG8gdGhlIGZvbGxvd2luZ3MsIHdlIGZp
bmFsbHkgZGVjaWRlZCB0byBrZWVwIGl0IGluCj4+IGRyaXZlcnMvaW9tbXU6Cj4+IDEuIGRyaXZl
cnMvaW9tbXUgaGFzIGFscmVhZHkgYSBmb2xkZXIgbWFpbnRhaW5pbmcgYWxsIElPTU1VIHN0dWZm
cy4KPj4gMi4gZHJpdmVycy9pb21tdSBoYXMgYWxyZWFkeSBkZWZpbmVkIEhQTSByZWxhdGVkIHJl
Z2lzdGVycy4KPj4gMy4gVW5saWtlIFBNQ0cgb2YgU01NVSB3aGljaCBpcyBsb2NhdGVkIGluIGEg
c2VwYXJhdGUgbmFtZXNwYWNlLCBSSVNDLVYKPj4gwqDCoMKgIElPTU1VIG9ubHkgZGVmaW5lcyA1
IHJlZ2lzdGVycyBpbiB0aGUgc2FtZSBhZGRyZXNzIHNwYWNlIGFzIGl0cwo+PiDCoMKgwqAgdHJh
bnNsYXRpb24gc2NoZW1lcy4KPj4gNC4gRm9yIEhQTSBzY2hlbWVzIHRoYXQgaXMgbm90IGEgc3Rh
bmRhbG9uZSBkZXZpY2UsIEludGVsIGhhcyBwdXQgaXRzCj4+IMKgwqDCoCBwZXJmIGRyaXZlciB1
bmRlciBkcml2ZXJzL2lvbW11L2ludGVsL3BlcmZtb24uYy4KPj4KPiAKPiBXaGVuIEkgcHJldmlv
dXNseSBzdWJtaXR0ZWQgbXkgUklTQy1WIElPTU1VIFBNVSBzZXJpZXMsIFdpbGzvvIhXaWxsIAo+
IERlYWNvbjx3aWxsQGtlcm5lbC5vcmc+77yJIHN1Z2dlc3RlZCBwbGFjaW5nIHRoZSBSSVNDLVYg
SU9NTVUgUE1VIGRyaXZlciAKPiB1bmRlciBkcml2ZXJzL3BlcmYvLCBzaW1pbGFyIHRvIHRoZSBB
Uk0gaW1wbGVtZW50YXRpb24uIEhlIGFsc28gCj4gY29tbWVudGVkOiAiSSdtIHN1cmUgUm9iaW4g
aGFkIGZ1biBkZWFsaW5nIHdpdGggc2hhcmVkIE1NSU8gcmVnaW9ucyAKPiBiZWZvcmUiIOKAlCBy
ZWZlcnJpbmcgdG8gdGhlIGRpc2N1c3Npb24gaGVyZToKPiAgwqBodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmlzY3YvIAo+IHBhdGNoLzIwMjUwOTE1MDIwOTExLjEz
MTMtMS1ndW95YXhpbmdAYm9zYy5hYy5jbi8KClRoYW5rcyBmb3IgdGhlIGluZm9ybWF0aW9uLgpX
ZSB3aWxsIGFsc28gZm9sbG93IHRoaXMgc3VnZ2VzdGlvbi4KClRoYW5rcyBhbmQgYmVzdCByZWdh
cmRzCkx2Cgo+IAo+PiBDaGVlcnMsCj4+IEx2Cj4+Cj4gCj4gQmVzdCByZWdhcmRzLAo+IEd1byBZ
YXhpbmcKPiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
