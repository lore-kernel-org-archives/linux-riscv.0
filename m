Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F70DCA5FC5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 14:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nh4HZtQf+Y4ZzsUwd0HesDnGMk88UwCNIQcvhZHsI40=; b=C2zilmVGLHfVaL
	UNuCaiofpZidHLz1sNCbO+8nAb7cUNCeK22Rh7lk2zFUlanmEsgwdejgxvf87befWBH2pYGVr0WTg
	b2Ab8OMBBMhTCbbu9K6va3DJdCNlzKDLn4tt8GssO0p5/AErTbQ/AqcpT476Md7FnkYbiUbrYYLje
	MZpGKPkJMelN9111wcWIoSQLv3aBgRI44e1EPZUz9jvrJ+W7vyhijyESoDfNRKebzgr6UdfPeFZX1
	QYfib1nT7osxM5rjhdDMvOE7hiBe0nD2Q6/O45SHjnM4gwtxv0FW4zidpPVc9Aqtnl3NZh2+hqzdM
	TLxgFtFItgdprRlnWxqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvSK-00000006LCt-3iVJ;
	Wed, 30 Sep 2026 14:38:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvSJ-00000006LCl-40ij
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 14:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tBu9b7TLQe7QpwGcplfd51YyxwHo+iad+kdLfEBII/U=; b=gE8KvBdR/6fo0vM702NVFC3NRY
	AmqO+T2ckKK1JDC1iGewg2+aW7l6yq78iHBXyZs9/A3HenuYjslp/L62fQ+zfyneNY6Qjuoeo+DUi
	QMja+c+jQ6pU27w2gw32Z8uhbVpEWSM/6nYdSWpC85SmQf/TRh4XgQzqf/GZfzKj1ZzIfsWc+j223
	ouOl9YdZn3AhBqOiCgkmGVmgQlhxpIEyW/aNNtT1uX9iXcfdSCLexS7xCjS8EFARt8wRECRAKOIcR
	Pbh51ZkHdUquRdIZZ3AjLOGg9XXyoFvls/f5goXkIlscdWOr5IkOOQbaygo3uRCS6sT+UJpNskXWB
	5GHv8Yxw==;
Received: from sender5-op-o15.zoho.com ([165.173.182.15])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBvSG-00000003vsW-3w8C
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 14:38:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790779098; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Yf1S92WSr8Oz7zcvvnh6pxtKqTiMOge44c0nfuTiZ5Qdzks9htwoxn0jzk4kscZglmLefUJmzEVc6y0zkiSqRjhC1mtekqZxAnn+ffFePrOJOl5RWqN5kkx6FiiH8vwgTUG2gq/G3IKj4RPsgsn5CEqgxXW1OhtKqyx8ELH9bLs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790779098; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tBu9b7TLQe7QpwGcplfd51YyxwHo+iad+kdLfEBII/U=; 
	b=J5wz+4UKGb9I6JglBkHnksLniF5RmrCE25QjZGCsoFKO6DaUoLHNqGj/2RjXGKBDF6NaJnIgNBTkh952gJhyfU+t28+4BLlqeOKsNKzyOFtgEvCdeQRHmRMgvqTv2pO3I5DuIU1so3p0+YTbupHwt1aGC6u5047Gm/GhuBEjlg8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790779098;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=tBu9b7TLQe7QpwGcplfd51YyxwHo+iad+kdLfEBII/U=;
	b=RKxtKsqCWHI2iJ0PEfttV7NYLAUgHvE4aENmWzLlX5zlFr067Wff99EWUCPL3UoH
	O9bpTRyrHB8VgDAr10RVq66CSBSUMDPb7iilZ6U8fxRO9ZpaW90spg8K1VMa54k5K8w
	PXbu4Tw+tuE3EG2GKH+Ss58Tr2lzTF8z3B3Jwc/nBTOlRSuBs1GAW16XIMU7+394Vns
	sz1Gi3BGOTrTGi+YPVZf192xKAA8hnsxtvo0tjHfhzc3zi9klQ3hhZBIku6yqsreAr3
	wDaXp/EOnieBJTsrQAZBrDyBqtdBnwG+2rAXID/+sC5/YevYCidCfBFas9AGC2D58ch
	Tap2C/qaNg==
Received: by smtp.zohomail.com with SMTPS id 1790779098161301.8299346542899;
	Wed, 30 Sep 2026 07:38:18 -0700 (PDT)
Message-ID: <32baa664ee2f66618a54c260849b311c581febfc.camel@icenowy.me>
Subject: Re: [RFC PATCH 0/2] drm: add a noncoherent mapping checking helper
From: Icenowy Zheng <uwu@icenowy.me>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard	
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Paul Walmsley	
 <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Dominique
 Belhachemi <domibel@debian.org>, Michal Wilczynski
 <m.wilczynski@samsung.com>, 	dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 	linux-riscv@lists.infradead.org
Date: Wed, 30 Sep 2026 22:38:07 +0800
In-Reply-To: <20260930-zippy-container-d48f72432c1f@wendy>
References: <20260930073528.3369325-1-zhengxingda@iscas.ac.cn>
	 <20260930-zippy-container-d48f72432c1f@wendy>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_153845_141559_3D854D1C 
X-CRM114-Status: GOOD (  29.82  )
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

5ZyoIDIwMjYtMDktMzDkuInnmoQgMTU6MTggKzAxMDDvvIxDb25vciBEb29sZXnlhpnpgZPvvJoK
PiBPbiBXZWQsIFNlcCAzMCwgMjAyNiBhdCAwMzozNToyNlBNICswODAwLCBJY2Vub3d5IFpoZW5n
IHdyb3RlOgo+ID4gVGhpcyBwYXRjaHNldCB0cmllcyB0byBhZGRyZXNzIHRoZSBsYWNrIG9mIHVu
Y2FjaGVkIG1hcHBpbmcgc3VwcG9ydAo+ID4gb24KPiA+IHNldmVyYWwgU2lGaXZlLWNvcmUtYmFz
ZWQgU29DcywgY3VycmVudGx5IHRhcmdldGluZyBKSDcxMTAgYnV0Cj4gPiBFSUM3NzAwCj4gPiB3
b3VsZCBoYXZlIHRoZSBzYW1lIHByb2JsZW0gKGFsdGhvdWdoIGl0IHVzZXMgREM4MDAwIGRpc3Bs
YXkKPiA+IGNvbnRyb2xsZXIKPiA+IGluc3RlYWQgb2YgREM4MjAwIGFuZCByZWFsIGRpc3BsYXkg
c3VwcG9ydCBpcyBwZW5kaW5nKS4KPiA+IAo+ID4gQmVjYXVzZSBvdGhlciB1c2VycyAoZWl0aGVy
IFNvQ3Mgd2l0aCBYdWFudGllIGNvcmVzLCB3aGljaCBoYXZlCj4gPiBYdGhlYWRtYWUgZXh0ZW5z
aW9ucyBvciBub24tUklTQy1WIFNvQ3MpIG9mIHRoZSBkcml2ZXIgaGF2ZSBwcm9wZXIKPiA+IHdy
aXRlY29tYmluZSBzdXBwb3J0LCBhIGhlbHBlciBpcyBhZGRlZCB0byBjaGVjayB3aGV0aGVyIGNv
aGVyZW50Cj4gPiAoY2FjaGUtYnlwYXNzaW5nKSBtYXBwaW5nIGlzIGF2YWlsYWJsZS4gVGhpcyBo
ZWxwZXIgY3VycmVudGx5Cj4gPiByZXR1cm5zCj4gPiB0cnVlIGZvciBhbGwgYXJjaGl0ZWN0dXJl
cyBleGNlcHQgUklTQy1WLCBhbmQgY2hlY2tzIHdoZXRoZXIKPiA+IHBncHJvdF93cml0ZWNvbWJp
bmUoKSBpcyBhIG5vLW9wIG9uIFJJU0MtVi4KPiA+IAo+ID4gVGhlIHBhdGNoIHJlYWxseSBlbmFi
bGluZyBtYW51YWwgY2FjaGUgbWFpbnRlbmFuY2UgZm9yIHRoZQo+ID4gdmVyaXNpbGljb24KPiA+
IGRyaXZlciBpcyBwaWNrZWQgZnJvbSBEb21pbmlxdWUsIGFuZCByZXdvcmtlZCB0byBjaGVjayBi
b3RoCj4gPiBkbWEtbm9uY29oZXJlbnQgcHJvcGVydHkgYW5kIHRoZSBwbGF0Zm9ybSdzIG1hcHBp
bmcgY2FwYWliaWxpdHkuCj4gPiAKPiA+IFRlc3RlZCBvbiBWaXNpb25GaXZlIDIgd2l0aCB0aGUg
ZGlzcGxheSBlbmFibGVtZW50IHBhdGNoc2V0IGF0IFsxXQo+ID4gKGFuZAo+ID4gaXRzIGRlcGVu
ZGVuY3kpLgo+ID4gCj4gPiBBbHNvIHRlc3RlZCBvbiBMaWNoZWUgUGkgNEEgKFRIMTUyMCwgd2hp
Y2ggaGFzIFh0aGVhZG1hZSksCj4gPiBvcGVyYXRpb24gaXMKPiA+IG5vdCBhZmZlY3RlZCwgbWFw
X25vbmNvaGVyZW50IGlzbid0IHNldCBhbmQgWG9yZyBzYXlzIGtlcm5lbCBkaXJ0eQo+ID4gdXBk
YXRlcyBhcmVuJ3QgcmVxdWlyZWQuCj4gPiAKPiA+IFsxXQo+ID4gaHR0cHM6Ly9wYXRjaC5tc2dp
ZC5saW5rLzIwMjYwOTI5LWpoNzExMC1jbGVhbi1zZW5kLXY1LTAtODJiNGQ4ZTNjNmM3QHNhbXN1
bmcuY29tCj4gCj4gT3V0IG9mIGN1cmlvc2l0eSwgaGF2ZSB5b3Ugc2VlbiBCbyBHYW4ncyBzZXJp
ZXMgZnJvbSBhIGZldyBtb250aHMgYWdvCj4gdGhhdCBjcmVhdGVzIGFuIGV4dGVuc2lvbi9lcnJh
dHVtIHRvIGdldCB0aGVzZSBkZXZpY2VzIHdvcmtpbmc/Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtcmlzY3YvMjAyNjAzMTYwNjAzMjguMTE3MzYzNC0xLWdhbmJvaW5nQGdtYWlsLmNv
bS8KPiAKPiBJJ3ZlIGJlZW4gbWVhbmluZyB0byByZXBseSB0byBpdCBvdmVyIGFuZCBvdmVyIGFn
YWluIGZvciB0aGUgbGFzdAo+IG51bWJlcgo+IG9mIG1vbnRocywgYnV0IEkganVzdCBoYXZlbid0
IGhhZCB0aGUgdGltZSB0byBhY3R1YWxseSB1bmRlcnN0YW5kIHRoZQo+IGRldGFpbCBvZiB0aGUg
RUlDNzcwMCBzb2x1dGlvbiBvciBjaGVjayB3aGV0aGVyIGl0IHdvcmtzIHlldC4gSSBrbm93Cj4g
dGhpcyBpcyBqdXN0IG9uZSBkcml2ZXIgYmVjYXVzZSB0aGUgSkg3MTEwIG9ubHkgaGFzIHRoaXMg
cHJvYmxlbSBmb3IKPiB0aGUgCgpJIHBlcnNvbmFsbHkgdGhpbmsgaGlzIEVJQzc3MDAgc29sdXRp
b24gdW5hY2NlcHRhYmxlIC0tIGl0J3Mgbm90CnJ1bm5pbmcgZGlyZWN0bHkgb24gRUlDNzcwMCwg
YnV0IHNvbWUgY3VzdG9tIGh5cGVydmlzb3IgKGJlY2F1c2UgdGhlCnVuY2FjaGVkIG9mZnNldCBv
ZiBFSUM3NzAwIGRvZXNuJ3QgYmVoYXZlIGFzIGEgc2ltcGxlIE9SIG9wZXJ0YWlvbiksCndoaWNo
IHJlcXVpcmVzIDNyZCBwYXJ0eSBjb2RlIGFuZCBwcm9oaWJpdHMgS1ZNIHVzYWdlIG9mIHRoZSBr
ZXJuZWwuCgo+IGRpc3BsYXkgcGlwZWxpbmUsIGJ1dCBhY2NvcmRpbmcgdG8gQm8gR2FuIHRoaXMg
YXBwbGllcyB0byBhbGwKPiBwZXJpcGhlcmFscyBvbiB0aGUgRUlDNzcwMC4gCgpJbiBmYWN0IEpI
NzEwMCBzdWZmZXJzIGZyb20gdGhlIHNhbWUgcHJvYmxlbSB0b28sIHNvIEpINzExMCBwdXQgc29t
ZQpETUEgcGVyaXBoZXJhbHMgdG8gdGhlIEwyIGZyb250IEFYSSBidXM7IGhvd2V2ZXIgYWx0aG91
Z2ggdGhpcyBidXMKa2VlcHMgY29oZXJlbmN5IHdpdGggdGhlIENQVSwgaXRzIGJhbmR3aWR0aCBp
cyBxdWVzdGlvbmFibGUgKEkgdGhpbmsKdGhlIGJvdHRsZW5lY2sgY291bGQgYmUgZXhoaWJpdGVk
IGlmIHlvdSBhdHRhY2ggYSBub3QtdG9vLWJhZCBOVk1lIFNTRApvbiBKSDcxMTAncyBQQ0llKS4K
ClRoYW5rcywKSWNlbm93eQoKPiAKPiA+IAo+ID4gRG9taW5pcXVlIEJlbGhhY2hlbWkgKDEpOgo+
ID4gwqAgZHJtOiB2ZXJpc2lsaWNvbjogc3VwcG9ydCBub24tY29oZXJlbnQgRE1BIGZyYW1lYnVm
ZmVycwo+ID4gCj4gPiBJY2Vub3d5IFpoZW5nICgxKToKPiA+IMKgIGRybTogYWRkIGEgaGVscGVy
IGZ1bmN0aW9uIHRvIGNoZWNrIGF2YWlsYmlsaXR5IG9mIGNvaGVyZW50Cj4gPiBtYXBwaW5nCj4g
PiAKPiA+IMKgZHJpdmVycy9ncHUvZHJtL3ZlcmlzaWxpY29uL3ZzX2N1cnNvcl9wbGFuZS5jIHzC
oCA5ICsrKysrKwo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vdmVyaXNpbGljb24vdnNfZHJtLmPCoMKg
wqDCoMKgwqDCoMKgwqAgfCAzMgo+ID4gKysrKysrKysrKysrKysrKysrLQo+ID4gwqBkcml2ZXJz
L2dwdS9kcm0vdmVyaXNpbGljb24vdnNfZHJtLmjCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDcgKysr
Kwo+ID4gwqAuLi4vZ3B1L2RybS92ZXJpc2lsaWNvbi92c19wcmltYXJ5X3BsYW5lLmPCoMKgwqAg
fMKgIDkgKysrKysrCj4gPiDCoGluY2x1ZGUvZHJtL2RybV9jYWNoZS5owqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyMSArKysrKysrKysrKysKPiA+IMKgNSBm
aWxlcyBjaGFuZ2VkLCA3NyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IC0t
IAo+ID4gMi41NS4wCj4gPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
