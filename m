Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672A4C61DCD
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 08:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VzWE7HNt7T0QBwbucAEdz7j8F151efQ5IOF5IUJOTbc=; b=GbH0vE82oxbaoO
	ZGT2xDbB7QzcGGu+ekHQyAMLscdV5X3WTmdljUB5NWMCOXr9fgUwspPboi4prdT5LptbNl2jgSUiw
	X1Kf3k+4MYTVb7I1roGABqmJ0jW3cwYav5NApWaua0YFg7sXvEMawOpmA0G0HfLF7x7G54aTTSEXP
	ea9aLP7I83n6/wHl/xyiqNMl0JU6gD3+s//g/w3HkHGN+AZ3esXLGiV6IIa7NCufIv+9cVhGdTRyc
	udOB1Zp/OzsJkskxslUgR1KKZL4gwzxQ5jh64GwaXxnN02/NO2JaKZl5mnQilWcaR3Qxa4aRs/dYH
	Lps35wFsWWXZeua3iMHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsHI-00000005Lrp-1e2T;
	Fri, 28 Aug 2026 08:49:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsHE-00000005LlX-3PhJ
	for linux-riscv@lists.infradead.org;
	Fri, 28 Aug 2026 08:49:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 61B1C43901
	for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2026 08:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464151F00A3F
	for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2026 08:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787906972;
	bh=iTWaHzCUhsUqSvPXQIT56fUgv/7xsB7jv15+ZqkCd+Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YzrntH/FKApkQCnp2DkZ/OqeTiGAQeaXPbc1DsrTDPhD67cQ6oCY5KBVfr1EktH01
	 y7pz8TmoeBXQqwnEmSeK/MWG/bdhBneVuI1ongPR5dM31PqIgbuqyu/S8fV/qeK2uq
	 Zxmm+OMGOv8Z4BM38wd5HK4A2w7+4C+uxEJItUmI9PX6pt6XIXDIj4hkTR8Fagqwv3
	 5HHXmdGLvDbl1jpbxypBHgfzUQi7ZeTchhd1oalz4MKS2piROQBJ1CNn0KnfT1js8H
	 ochtkwVugVELi6gGVgzyMmitAErmbOzDA62jiUOgOXyZ0PweKcleGOXidT/l5ECdWP
	 ht7VYfgOz+XVg==
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so2528645e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2026 01:49:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq73oLHLOHGXMcoBNy3FfeH6XrIaPfgXmZgmbo9ssqg0/yfpTIja2zKZi9mPWymMHLN4c0dxtTdmBmeCw==@lists.infradead.org
X-Gm-Message-State: AFuF++kgB1C8hb19MezEW3WuBKpgsmATAoJKm3sCBWBMIlRZt2fIgEwm
	+qsgfCK/ouM22Svc74saYqTO61TGMOfAkbTdM0MxEF+QPthOQz2MY3j+l//4lmUay4G601QwTqP
	Gn8PalWfb3abm/liph7nesazvbmVfSVk=
X-Received: by 2002:a05:600c:c3cf:10b0:49b:8f18:714a with SMTP id
 5b1f17b1804b1-49b91c47b76mr56390145e9.12.1787906970884; Fri, 28 Aug 2026
 01:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260828070747.4009519-1-zong.li@sifive.com>
In-Reply-To: <20260828070747.4009519-1-zong.li@sifive.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 28 Aug 2026 16:49:17 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ-1pKoBvnRSLkDGqwKDzon_yfyT74haifeGD=VRBanYg@mail.gmail.com>
X-Gm-Features: AcwNN1VMCHhJ9U1VulIu65DXTUxtzDFoDLDzisWOEQmJfMR_Ji-KYifhbSJdPrk
Message-ID: <CAJF2gTQ-1pKoBvnRSLkDGqwKDzon_yfyT74haifeGD=VRBanYg@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] RISC-V IOMMU HPM support
To: Zong Li <zong.li@sifive.com>
Cc: tomasz.jeznach@linux.dev, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, mark.rutland@arm.com, 
	andrew.jones@oss.qualcomm.com, david.laight.linux@gmail.com, 
	zhangzhanpeng.jasper@bytedance.com, yang.yicong@picoheart.com, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
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

SGkgTGkgWm9uZywKCkp1c3QgdHdvIHBhdGNoZXM/IFdoZXJlIGRpZCB0aGUgcmlzY3YtaW9tbXUg
UE1VIGRyaXZlciBwYXRjaCBnbz8KCi0tCkJlc3QgUmVnYXJkcwogR1VPIFJlbgoKT24gRnJpLCBB
dWcgMjgsIDIwMjYgYXQgMzowN+KAr1BNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4gd3Jv
dGU6Cj4KPiBUaGlzIHNlcmllcyBpbXBsZW1lbnRzIHN1cHBvcnQgZm9yIHRoZSBSSVNDLVYgSU9N
TVUgaGFyZHdhcmUgcGVyZm9ybWFuY2UKPiBtb25pdG9yLgo+Cj4gVGhlIFJJU0MtViBJT01NVSBQ
TVUgZHJpdmVyIGlzIGltcGxlbWVudGVkIGFzIGFuIGF1eGlsaWFyeSBkZXZpY2UgZHJpdmVyCj4g
Y3JlYXRlZCBieSB0aGUgcGFyZW50IFJJU0MtViBJT01NVSBkcml2ZXIuIFRoZXJlZm9yZSwgdGhl
IGNoaWxkIGRyaXZlcgo+IGNhbiBvYnRhaW4gcmVzb3VyY2VzIGFuZCBpbmZvcm1hdGlvbiBmcm9t
IHRoZSBwYXJlbnQgZGV2aWNlLCBzdWNoIGFzCj4gdGhlIE1NSU8gYmFzZSBhZGRyZXNzIGFuZCBJ
UlEgbnVtYmVyLgo+Cj4gVGhlIHRocmlkIGNvbW1pdCBhZGRzIHJhdyBzcGlubG9jayBmb3IgcmFj
ZSBjb25kaXRpb24gd2hlbiBQQ0kgTVNJL01TSS1YCj4gb24gSU1TSUMuIEFzIHRoZSBjb21taXQg
bWVzc2FnZSBtZW50aW9uZWQ6Cj4gRXZlbnRzIGFyZSBib3VuZCB0byBvbmUgQ1BVIGFuZCB0aGUg
aW50ZXJydXB0IGlzIGFmZmluZSB0byBpdCwgc28gdGhlCj4gcGVyZiBjYWxsYmFja3MgcnVubmlu
ZyB3aXRoIGludGVycnVwdHMgZGlzYWJsZWQgd291bGQgYmUgZW5vdWdoIHRvCj4gZXhjbHVkZSB0
aGUgaGFuZGxlci4gQnV0IFBDSSBNU0kvTVNJLVggb24gSU1TSUMgYnJlYWtzIHRoYXQ6Cj4gVGhl
IGlycWNoaXAgc2V0cyBJUlFDSElQX01PVkVfREVGRVJSRUQsIHNvIGlycV9zZXRfYWZmaW5pdHko
KSByZXBvcnRzCj4gc3VjY2VzcyB3aGlsZSBvbmx5IHJlY29yZGluZyB0aGUgcmVxdWVzdCwgYW5k
IHRoZSBtb3ZlIGlzIGFwcGxpZWQgaW4KPiBpbnRlcnJ1cHQgY29udGV4dCB1cG9uIHRoZSBuZXh0
IGRldmljZSBpbnRlcnJ1cHQuIFVudGlsIHRoZW4gdGhlCj4gaW50ZXJydXB0IGlzIHN0aWxsIHJv
dXRlZCB0byB0aGUgQ1BVIElNU0lDIHBpY2tlZCBpbml0aWFsbHksIHNvIHRoZQo+IGZpcnN0IG92
ZXJmbG93IGludGVycnVwdCBjYW4gcnVuIGNvbmN1cnJlbnRseSB3aXRoIHRoZSBwZXJmIGNhbGxi
YWNrcwo+IG9uIHRoZSBDUFUgdGhlIGV2ZW50cyBhcmUgYm91bmQgdG8uCj4KPiBJIG5vdGljZWQg
dGhhdCB4Z2VuZV9wbXUgYW5kIGFybS1jY2kgaGF2ZSBzaW1pbGFyIGltcGxlbWVudGF0aW9uLCBz
byBhZGQKPiBpdCBpbiByaXNjdl9pb21tdV9wbXUgc2hvdWxkIGJlIGFjY2VwdGVkLgo+Cj4gQ2hh
bmdlZCBpbiB2NjoKPiAtIFJlYmFzZWQgb250byB0aGUgbGF0ZXN0IHY3LjMtcmMKPiAtIFVzZSBz
eXNmc19lbWl0IGluc3RlYWQgb2YgY3B1bWFwX3ByaW50X3RvX3BhZ2VidWYKPiAtIFNldCB1cCBv
bl9jcHUgYW5kIGlycSBhZmZpbml0eSBieSBjcHVocCBjYWxsYmFja3MKPiAtIENoYW5nZSB0eXBl
IG9mIG9uX2NwdSBmcm9tIHVuc2lnbmVkIGludCB0byBpbnQKPiAtIFJlamVjdCBmaWx0ZXIgb3Bl
cmFuZHMgb2YgY3ljbGUgZXZlbnQgaW4gZXZlbnRfaW5pdAo+IC0gQ2hlY2sgcmV0dXJuIHZhbHVl
IG9mIGNvdW50ZXIgbnVtYmVyIGFuZCAgbWFza3MgaW4gcHJvYmUKPiAtIEFkZCByYXcgc3Bpbmxv
Y2sgZm9yIHJhY2UgY29uZGl0aW9uICh0aGlyZCBjb21taXQpCj4KPiBDaGFuZ2VkIGluIHY1Ogo+
IC0gUGljayB1cCBzdWdnZXN0aW9ucyBmcm9tIHNhc2hpa28tYm90IGFzIGZvbGxvd3MKPiAtIEZp
eCBldmVudCBncm91cCB2YWxpZGF0aW9uIGZvciBzdyBldmVudAo+IC0gQmluZCBJUlEgdG8gYXV4
IFBNVSBkZXYgaW5zdGVhZCBvZiBwYXJlbnQgSU9NTVUgZGV2Cj4gLSBDbGVhciBPRiBiaXQgd2hl
biBldmVudCBpcyBOVUxMCj4gLSBJbXByb3ZlIGhpLWxvLWhpIHBhdHRlbgo+IC0gQWRkIGJhY2sg
SVJRRl9TSEFSRUQgZmxhZyBkdWUgdG8gbWlzbWF0Y2gKPiAtIE1hbmFnZSBjcHVocCBhbmQgcG11
IHJlZ2lzdGVyIGJ5IGRldnJlCj4KPiBDaGFuZ2VkIGluIHY0Ogo+IC0gUmViYXNlZCBvbnRvIHY3
LjMtcmMKPiAtIFVzZSBpc19zYW1wbGluZ19ldmVudCgpIGluc3RlYWQgb2YgYWNjZXNzaW5nIHZh
aXJhYmxlIGRpcmVjdGx5Cj4gLSBSZW5hbWUgdGhlIG1hdGNoaW5nIG5hbWUgZnJvbSAiaW9tbXUu
cG11IiB0byAicmlzY3YtaW9tbXUucG11Igo+IC0gQ2hhbmdlIHRoZSBuYW1pbmcgb2YgUE1VIGRl
dmljZSBmb3IgYXZvaWQgIjoiIGluIFBDSWUgY2FzZQo+IC0gQWRkIHN1cHByZXNzX2JpbmRfYXR0
cnMgYXR0cmlidXRlCj4gLSBSZW1vdmUgSVJRRl9TSEFSRUQgZmxhZwo+IC0gU2V0IGlycSBhZmZp
bml0eSB0byBsb2NhbCBDUFUgb2YgSU9NTVUKPiAtIEFsbG9jYXRlIElEIGJ5IElEQSBmb3IgYXV4
aWxpYXJ5IGRldmljZQo+IC0gUGljayB1cCBzdWdnZXN0aW9ucyBmcm9tIHNhc2hpa28tYm90Cj4K
PiBDaGFuZ2VkIGluIHYzOgo+IC0gUmViYXNlZCBvbnRvIHY3LjItcmMzCj4gLSBVc2UgaGlfbG9f
d3JpdGVxL3JlYWRxIHRvIGFjY2VzcyByZWdpc3Rlcgo+IC0gUGljayBjb21tZW50cyBmcm9tIHNh
c2hpa28tYm90IGFzIGZvbGxvd3MKPiAtIFNldCBJUlEgQ1BVIGFmZmluaXR5Cj4gLSBSZW1vdmUg
SVJRRl9PTkVTSE9UIGZsYWcgd2hlbiByZXF1ZXN0IGlycQo+IC0gQWRqdXN0IGN5Y2xlIGV2ZW50
IGNoZWNrIGJ5IGNoZWNraW5nIGV2ZW50X2lkIGZpZWxkIG9ubHkKPiAtIEZpeCBidWcgZm9yIGdy
b3VwIGV2ZW50cyB2ZXJpZmljYWl0b24KPiAtIEZpeCBLQVNBTiBpc3N1ZSBhYm91dCBjYXN0aW5n
IDMyLWJpdCB2YXJpYWJsZSB0byB1bnNpZ25lZCBsb25nIHBvaW50ZXIKPiAtIENsZWFyIElQU1Ig
cGVuZGluZyBiaXQgYmVmb3JlIHN0YXJ0aW5nIGNvdW50ZXIKPiAtIENsZWFyIE9GIGJpdCBpbiBl
dmVudCBzZWxlY3RvciByZWdpc3RlciBpbiBpcnEgaGFuZGxlcgo+IC0gUmVsZWFzZSBpcnEgYnkg
ZGV2bSBpbnN0ZWFkIG9mIGV4cGxpY2l0IGZyZWVfaXJxCj4KPiBDaGFuZ2VkIGluIHYyOgo+IC0g
UmViYXNlZCBvbnRvIHY3LjItcmMxCj4gLSBVc2UgaGktbG8taGkgbWVjaGFuaXNtIHRvIHJlYWQg
Y291bnRlci4KPiAgIFN1Z2dlc3RlZCBieSBHdW8gUmVuIGFuZCBEYXZpZCBMYWlnaHQKPgo+IENo
YW5nZWQgaW4gdjE6Cj4gLSBSZWJhc2VkIG9udG8gdjYuMTktcmM4Cj4gLSBQaWNrIGFsbCBzdWdn
ZXN0aW9ucyBhbmQgZmVlZGJhY2tzIGZyb20gdjEgc2VyaWVzCj4gLSBBZGQgY3B1IGhvdHBsdWcg
aW1wbGVtZW50YXRpb24gdG8gYXZvaWQgcmFjZSBlbmFibGVtZW50Cj4gLSBNb3ZlIFBNVS1yZWxh
dGVkIGRlZmluaXRpb24gZnJvbSBoZWFkZXIgdG8gYyBmaWxlCj4gLSBDaGFuZ2UgUE1VIGRyaXZl
ciB0byBhdXhpbGlhcnkgZGV2aWNlIGRyaXZlcgo+Cj4gQ2hhbmdlZCBpbiBSRkM6Cj4gLSBSZWJh
c2Ugb250byB2Ni4xMy1yYzcKPiAtIENsZWFyIGludGVycnVwdCBwZW5kaW5nIGJlZm9yZSBoYW5k
bGluZyBpbnRlcnJ1cHQKPiAtIEZpeCB0aGUgY291bnRlciB2YWx1ZSBpc3N1ZSBjYXVzZWQgYnkg
T0YgYml0IGluIHRoZSBjeWNsZSBjb3VudGVyLgo+IC0gSW52b2tlIHJpc2N2X2lvbW11X2hwbV9k
aXNhYmxlKCkgaW5zdGVhZCBvZiByaXNjdl9pb21tdV9wbXVfdW5pbml0KCkKPiAgIGluIHJpc2N2
X2lvbW11X3JlbW92ZSgpCj4KPiBab25nIExpICgyKToKPiAgIGlvbW11L3Jpc2N2OiBjcmVhdGUg
YSBhdXhpbGlhcnkgZGV2aWNlIGZvciBIUE0KPiAgIGRyaXZlcnMvcGVyZjogcmlzY3YtaW9tbXU6
IHByb3RlY3Qgc2hhcmVkIHN0YXRlIHdpdGggYSByYXcgc3BpbmxvY2sKPgo+ICBkcml2ZXJzL2lv
bW11L3Jpc2N2L0tjb25maWcgICAgfCAgMSArCj4gIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUu
YyAgICB8IDM3ICsrKysrKysrKysrKysrKysrKysKPiAgZHJpdmVycy9wZXJmL3Jpc2N2X2lvbW11
X3BtdS5jIHwgNjYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQo+ICAzIGZpbGVz
IGNoYW5nZWQsIDk4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuNDMu
Nwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
