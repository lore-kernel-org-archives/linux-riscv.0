Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0122AEF0702
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Feb 2026 03:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X7oDdpNdhyQsOMfM3fFpT1yoy2CmGg9p3qvqyi82oCA=; b=XrshbnmUyqWjEFv7TQjBfFheiv
	SZDR3fAKH8nQ8CcywkgdUR3Ik6SqxGqkWSMVCTt8XIBgbKv0sKNHc/OJJK+eaBPKQr0CyT980UVIs
	8s0g3TMv55SKrt4pC3oQUbQjC9MNQYUgIODIb4Me/Fz4u9HYVgiVCygjVL1zvRA9u1y5m1FtWVXGI
	YAAazxsv3kV46xv4XQwDVufh18A/U7GjzxzDjobeMvEHzL2czf30fQ7mXxIenH4cv9o1KIDZ2oAJD
	lrHNof6KfS+wd3bDpAleEgyawB6ZXHjElT/UZNtdNBV9sQwxQQErK3CTUsZxTpkJJ8/0U9nAsOIyh
	vcuJ1xXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpHqV-0000000Elew-2GQL;
	Mon, 09 Feb 2026 03:21:55 +0000
Received: from out28-147.mail.aliyun.com ([115.124.28.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpHqR-0000000EldV-1O1C
	for linux-riscv@lists.infradead.org;
	Mon, 09 Feb 2026 03:21:54 +0000
Received: from 172.38.28.171(mailfrom:guoyaxing@bosc.ac.cn fp:SMTPD_---.gScrj65_1770607296 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 09 Feb 2026 11:21:37 +0800
Message-ID: <1e2b448f-3a2a-4b1f-872d-a34f7bd53696@bosc.ac.cn>
Date: Mon, 9 Feb 2026 11:21:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] RISC-V IOMMU HPM support
To: Lv Zheng <lv.zheng@linux.spacemit.com>, Zong Li <zong.li@sifive.com>,
 tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
 robin.murphy@arm.com, robh@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, mark.rutland@arm.com,
 conor+dt@kernel.org, krzk@kernel.org, luxu.kernel@bytedance.com,
 andrew.jones@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-perf-users@vger.kernel.org
References: <20260208063848.3547817-1-zong.li@sifive.com>
 <D8C71AE40393A6FD+89365591-f896-4609-8b0f-8dffe85b5828@linux.spacemit.com>
From: yaxing guo <guoyaxing@bosc.ac.cn>
In-Reply-To: <D8C71AE40393A6FD+89365591-f896-4609-8b0f-8dffe85b5828@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_192151_646328_789A33C9 
X-CRM114-Status: GOOD (  22.88  )
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

CgrlnKggMjAyNi8yLzkgOTo0MCwgTHYgWmhlbmcg5YaZ6YGTOgo+IE9uIDIvOC8yMDI2IDI6Mzgg
UE0sIFpvbmcgTGkgd3JvdGU6Cj4+IFRoaXMgc2VyaWVzIGltcGxlbWVudHMgc3VwcG9ydCBmb3Ig
dGhlIFJJU0MtViBJT01NVSBoYXJkd2FyZSBwZXJmb3JtYW5jZQo+PiBtb25pdG9yLgo+Pgo+PiBU
aGUgUklTQy1WIElPTU1VIFBNVSBkcml2ZXIgaXMgaW1wbGVtZW50ZWQgYXMgYW4gYXV4aWxpYXJ5
IGRldmljZSBkcml2ZXIKPj4gY3JlYXRlZCBieSB0aGUgcGFyZW50IFJJU0MtViBJT01NVSBkcml2
ZXIuIFRoZSBjaGlsZCBkcml2ZXIgY2FuIG9idGFpbgo+PiByZXNvdXJjZXMgYW5kIGluZm9ybWF0
aW9uIGZyb20gdGhlIHBhcmVudCBkZXZpY2UsIHN1Y2ggYXMgdGhlIE1NSU8gYmFzZQo+PiBhZGRy
ZXNzIGFuZCBJUlEgbnVtYmVyLgo+Pgo+PiBDdXN0b20gZXZlbnQgc3VwcG9ydCBpcyBub3QgaW5j
bHVkZWQgaW4gdGhpcyBzZXJpZXMgYW5kIHdpbGwgYmUgc3VibWl0dGVkCj4+IGFzIGEgc2VwYXJh
dGUgc2VyaWVzLiBUaGUgaWRlYSBpcyB0aGF0IGN1c3RvbSBldmVudHMgd2lsbCBiZSBkZWZpbmVk
Cj4+IHRocm91Z2ggdGhlIGRyaXZlciBkYXRhIG9mIHRoZSBhdXhpbGlhcnkgZHJpdmVyLiBXaGVu
IHRoZSBwYXJlbnQgSU9NTVUKPj4gZHJpdmVyIGNyZWF0ZXMgdGhlIGF1eGlsaWFyeSBkZXZpY2Us
IGl0IHNob3VsZCBwYXNzIGEgdmVuZG9yLXNwZWNpZmljCj4+IG5hbWUgYXMgdGhlIGRldmljZSBu
YW1lIGluIG9yZGVyIHRvIG1hdGNoIHRoZSBjb3JyZXNwb25kaW5nIGF1eGlsaWFyeQo+PiBkZXZp
Y2UgSUQuCj4+Cj4+IEFmdGVyIG15IGluaXRpYWwgUkZDIGFuZCB0aGUgdjEgcGF0Y2ggc2VyaWVz
IHdlcmUgcG9zdGVkLCBzaW1pbGFyIHBhdGNoCj4+IHNlcmllcyBhbHNvIGFwcGVhcmVkIG9uIHRo
ZSBtYWlsaW5nIGxpc3QuCj4+Cj4+IE9uZSB3YXMgZnJvbSBZYXhpbmcgR3VvOgo+PiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA5MTUwMjA5MTEuMTMxMy0xLWd1b3lheGluZ0Bib3Nj
LmFjLmNuLwo+Pgo+PiBhbmQgYW5vdGhlciBmcm9tIEx2IFpoZW5nOgo+PiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMzBDN0FEMzUxREI1NTI3NithOGIwM2RhYy1jNWFmLTQwMzQtODYzMS0g
Cj4+IGFjMWMzNTJhNDY5ZkBsaW51eC5zcGFjZW1pdC5jb20vCj4gCj4gUGxlYXNlIGRvIG5vdCBm
b3JnZXQgdG8gQ2M6Cj4gSmluZ3l1IExpIDxqb2V5LmxpQHNwYWNlbWl0LmNvbT4KPiBJIG9ubHkg
cHJvdmlkZWQgVDEwMCBzcGVjaWZpYyBzdXBwb3J0IGluIHRoZSBwb3N0ZWQgc2VyaWVzLCBhbmQg
dGhlCj4gbmV3IGFwcHJvYWNoIG9mIHRoZSBIUE0gZHJpdmVyIGluIHRoZSBzYW1lIHNlcmllcyBp
cyBjb21wb3NlZCBieSBoZXIuCj4gCj4+Cj4+IFlheGluZyBoYXMgYWdyZWVkIHRvIHBhdXNlIGhp
cyBzZXJpZXMsIGFzIGRpc2N1c3NlZCBoZXJlOgo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1pb21tdS8yY2U5ZDhiZS0xMGIzLTQ4ZGQtIAo+PiBiOTllLTczNTgzNDdmYzE3MUBib3Nj
LmFjLmNuLwo+Pgo+PiBUaGUgbW90aXZhdGlvbiBmb3Igc2VuZGluZyB0aGlzIHYyIHZlcnNpb24g
aXMgbm90IG9ubHkgdG8gYWRkcmVzcyB0aGUKPj4gZmVlZGJhY2sgYW5kIHN1Z2dlc3Rpb25zIGZy
b20gdGhlIHByZXZpb3VzIHJvdW5kLCBidXQgYWxzbyB0byBpbnRyb2R1Y2UKPj4gYSBtYWpvciBz
dHJ1Y3R1cmFsIGNoYW5nZTogdGhlIFBNVSBkcml2ZXIgaGFzIGJlZW4gbW92ZWQgdW5kZXIKPj4g
ZHJpdmVycy9wZXJmLywgd2hpY2ggaGFzIGJlZW4gbWVudGlvbmVkIHJlcGVhdGVkbHkgYnkgc2V2
ZXJhbCBwZW9wbGUuCj4+IFRoaXMgcmVzdWx0cyBpbiBhIGRpZmZlcmVudCBkcml2ZXIgc3RydWN0
dXJlIGNvbXBhcmVkIHRvIG15IGVhcmxpZXIKPj4gdmVyc2lvbiBhbmQgdGhlIG90aGVyIHR3byBz
ZXJpZXMsIGFuZCBJJ2QgbGlrZSB0byBnYXRoZXIgZmVlZGJhY2sgYW5kCj4+IHN1Z2dlc3Rpb25z
IGZyb20gdGhlIGNvbW11bml0eSBvbiB0aGlzIGFwcHJvYWNoLiBJZiB0aGUgY29tbXVuaXR5IHdv
dWxkCj4+IHByZWZlciB0byBnbyB3aXRoIEx2IFpoZW5n4oCZcyB2ZXJzaW9uIGluc3RlYWQsIEkg
YW0gcGVyZmVjdGx5IGZpbmUgd2l0aAo+PiB0aGF0IGFzIHdlbGwuCj4gCj4gV2UnZCBsaWtlIHRv
IGtub3cgaWYgdGhlcmUncyBhbnkgY29tbWVudHMgcmVsYXRlZCB0byBwdXR0aW5nIElPTU1VIEhQ
TQo+IGRyaXZlciBpbnRvIGRyaXZlcnMvcGVyZiBmb2xkZXIgYW5kIHdhbnQgdG8ga25vdyBpZiB0
aGlzIGlzIG5lY2Vzc2FyeS4KPiBXZSBhbHNvIGhlc2l0YXRlZCBpZiByaXNjdiBpb21tdSBocG0g
c2hvdWxkIGJlIHB1dCBpbnRvIGRyaXZlcnMvcGVyZiwKPiBhbmQgYWNjb3JkaW5nIHRvIHRoZSBm
b2xsb3dpbmdzLCB3ZSBmaW5hbGx5IGRlY2lkZWQgdG8ga2VlcCBpdCBpbgo+IGRyaXZlcnMvaW9t
bXU6Cj4gMS4gZHJpdmVycy9pb21tdSBoYXMgYWxyZWFkeSBhIGZvbGRlciBtYWludGFpbmluZyBh
bGwgSU9NTVUgc3R1ZmZzLgo+IDIuIGRyaXZlcnMvaW9tbXUgaGFzIGFscmVhZHkgZGVmaW5lZCBI
UE0gcmVsYXRlZCByZWdpc3RlcnMuCj4gMy4gVW5saWtlIFBNQ0cgb2YgU01NVSB3aGljaCBpcyBs
b2NhdGVkIGluIGEgc2VwYXJhdGUgbmFtZXNwYWNlLCBSSVNDLVYKPiAgwqDCoCBJT01NVSBvbmx5
IGRlZmluZXMgNSByZWdpc3RlcnMgaW4gdGhlIHNhbWUgYWRkcmVzcyBzcGFjZSBhcyBpdHMKPiAg
wqDCoCB0cmFuc2xhdGlvbiBzY2hlbWVzLgo+IDQuIEZvciBIUE0gc2NoZW1lcyB0aGF0IGlzIG5v
dCBhIHN0YW5kYWxvbmUgZGV2aWNlLCBJbnRlbCBoYXMgcHV0IGl0cwo+ICDCoMKgIHBlcmYgZHJp
dmVyIHVuZGVyIGRyaXZlcnMvaW9tbXUvaW50ZWwvcGVyZm1vbi5jLgo+IAoKV2hlbiBJIHByZXZp
b3VzbHkgc3VibWl0dGVkIG15IFJJU0MtViBJT01NVSBQTVUgc2VyaWVzLCBXaWxs77yIV2lsbCAK
RGVhY29uPHdpbGxAa2VybmVsLm9yZz7vvIkgc3VnZ2VzdGVkIHBsYWNpbmcgdGhlIFJJU0MtViBJ
T01NVSBQTVUgZHJpdmVyIAp1bmRlciBkcml2ZXJzL3BlcmYvLCBzaW1pbGFyIHRvIHRoZSBBUk0g
aW1wbGVtZW50YXRpb24uIEhlIGFsc28gCmNvbW1lbnRlZDogIkknbSBzdXJlIFJvYmluIGhhZCBm
dW4gZGVhbGluZyB3aXRoIHNoYXJlZCBNTUlPIHJlZ2lvbnMgCmJlZm9yZSIg4oCUIHJlZmVycmlu
ZyB0byB0aGUgZGlzY3Vzc2lvbiBoZXJlOgogIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cHJvamVjdC9saW51eC1yaXNjdi9wYXRjaC8yMDI1MDkxNTAyMDkxMS4xMzEzLTEtZ3VveWF4aW5n
QGJvc2MuYWMuY24vCgo+IENoZWVycywKPiBMdgo+IAoKQmVzdCByZWdhcmRzLApHdW8gWWF4aW5n
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
