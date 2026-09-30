Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47883CA5FAB
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 05:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NthOvEpotyXie5TQuhpMZe21ZXMofYZ8SGvMHrkuTa4=; b=QlhNDPy5h8WqJ7
	98+PmJ6w5ZjDP+l79/41+fCus0HrkBPgwQ9MUujYTUeCGXheb1AMOY0VvoNO8bu6ccY7jfGN8isRv
	FVBF9sxSBoi9P7GTFYCG/tcDvfnWkO954+NG+ssMM7Audf+mdwc/G3Hcav+7V0OL1fohlRvTX0w/3
	NYHcwoW70IxXREqdBI904AbCF+lVT9JYMOwU568FAdPGR/noak5MStvFKbJZSPHid2Z+Jyj5pPyv1
	ecg9ERLLKTOQ+hNn0n19LMwktCq6dU2Pxlr9+10k6JTTeDzTYwErQLYVwQj9OHUtIgVpuU9o8o1uJ
	eBk/rnfUIvs02MLmazAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnFn-0000000555r-1Lmr;
	Wed, 30 Sep 2026 05:53:19 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnFk-0000000555Q-3f4O
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 05:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Reply-To:Content-ID:Content-Description;
	bh=HOfe6eGDXWWjbg16M03Zk0OLLSQFcWlNyWNgDc1U1cw=; b=bjfaviDBFHWVxeZ6pMpxtnv8Sx
	0Vz3JjbyRuT6RnU+pFdwhMcvBDa7lQbk71QYnp6xe4+lCtYnRo8osNnuUu+uNYRzhksl7Dkfv/dWx
	HBNGnEReIvhjsBI9EgV9XgFNOXkFhrthn0rDrFpqKHprTb5W/BFVJCo18IXvrtAR9SqrLU3EU9XxW
	Qd3bh2GMG0yzll0ODJmpEZIZuXdc/0jSRa5K6NW/CSZgegddaQsbMTTMI5A2F0pHReOCzk9uNTC8e
	UxkK5PxATb9id/2zQN9Wv8mPuWaUO5IhkCaIjPSJdmQjcDjKVlip+aO9IJE9SKp+XLuV9Yu1q51OH
	6AXY68DQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	(Exim 4.96)
	(envelope-from <domibel@debian.org>)
	id 1xBnFh-008yCl-1i
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 05:53:14 +0000
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-883a16b758dso624573b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 22:53:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxkXgz2tdKmHeAl28kLw4eMybwMX2xemr2BvM/cPIYWn1NGPbILiYJ/aSQk1p6kxbxROxRr1YQCECMqAw==@lists.infradead.org
X-Gm-Message-State: AFuF++l3epnB2cw4JMEhThowDWEoQ3raLpFkUPdD8ifxuA727ocQV4cd
	DpOIHTCWaPPB940/TUP+i6gzocrKGUqeAyY6tOqCIeOqMuU8U9cqH66ulOgATLfD8RJghfELWur
	bdmV2MN3J1T4unYjhMCPTAwr+9SQivPo=
X-Received: by 2002:a05:6a21:1f8c:b0:3dd:65a5:a33 with SMTP id
 adf61e73a8af0-3de9ef4e6e0mr252959637.10.1790747589916; Tue, 29 Sep 2026
 22:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260505042631.1916555-1-domibel@debian.org> <8d1e3735c40b452f7ab89228ad5a0040f5f41b35.camel@iscas.ac.cn>
 <CAAvaLCy7jC-jFM5ZpPVeg7gKpweAW4nPKn4HXR+xpqUHD2soXQ@mail.gmail.com> <84e4511ea8e3e6bdff72ce2038bf3a3272744619.camel@iscas.ac.cn>
In-Reply-To: <84e4511ea8e3e6bdff72ce2038bf3a3272744619.camel@iscas.ac.cn>
From: Dominique Belhachemi <domibel@debian.org>
Date: Wed, 30 Sep 2026 01:52:58 -0400
X-Gmail-Original-Message-ID: <CAAvaLCw1ZPBAAURvCR02zxoDrTSxiHaqDp8cjqHsyL7MsTr=Sw@mail.gmail.com>
X-Gm-Features: AclHuK9-oOR0f56IMuemEpm996PDXvOYEpnJvgiFTYENcHWnCYFGQ9svkIM_Dn0
Message-ID: <CAAvaLCw1ZPBAAURvCR02zxoDrTSxiHaqDp8cjqHsyL7MsTr=Sw@mail.gmail.com>
Subject: Re: [PATCH] drm: verisilicon: support non-coherent DMA framebuffers
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Simona Vetter <simona@ffwll.ch>, 
	Paul Cercueil <paul@crapouillou.net>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, ganboing@gmail.com
X-Debian-User: domibel
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_225316_946768_F3784FE5 
X-CRM114-Status: GOOD (  22.18  )
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

T24gVHVlLCBTZXAgMjksIDIwMjYgYXQgMzoyN+KAr0FNIEljZW5vd3kgWmhlbmcgPHpoZW5neGlu
Z2RhQGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IOWcqCAyMDI2LTA5LTI45LiA55qEIDAxOjIxIC0w
NDAw77yMRG9taW5pcXVlIEJlbGhhY2hlbWnlhpnpgZPvvJoKPiA+IE9uIEZyaSwgU2VwIDExLCAy
MDI2IGF0IDExOjMz4oCvQU0gSWNlbm93eSBaaGVuZwo+ID4gPHpoZW5neGluZ2RhQGlzY2FzLmFj
LmNuPiB3cm90ZToKPiA+ID4KPiA+ID4gSSBhbSBzdGlsbCB0aGlua2luZyBob3cgdG8gZGVjaWRl
IHdoZXRoZXIgdG8gdXNlIGRpcnR5LXRyYWNraW5nLQo+ID4gPiBiYXNlZAo+ID4gPiBjYWNoZSBj
b2hlcmVudCBtYWludGVuYW5jZSBvciB3cml0ZWNvbWJpbmUvdW5jYWNoZWQgbWFwcGluZy4KPiA+
ID4KPiA+IEhpIEljZW5vd3ksCj4gPgo+ID4gSSBsb29rZWQgaW50byB0aGlzIGFnYWluIGFuZCB3
cml0ZWNvbWJpbmUvdW5jYWNoZWQgbWFwcGluZyBpcyB0aGUgd2F5Cj4gPiB0byBnby4KPgo+IEkg
dGhpbmsgZHJtL2ltYWdpbmF0aW9uIHJlYWxseSByZXF1aXJlcyBpdCAoYmVjYXVzZSB0aGUgY29y
cmVzcG9kaW5nCj4gdXNlcnNwYWNlIGRyaXZlciBhZHZlcnRpc2VzIG9ubHkgb25lIG1lbW9yeSB0
eXBlIHdpdGgKPiBgSE9TVF9DT0hFUkVOVF9CSVRgIHNldCksIGhvd2V2ZXIgaW4gdGhlIGZ1dHVy
ZSBpdCBjb3VsZCBhbHNvIGFkZCBjYWNoZQo+IG1haW50ZW5hbmNlIHN1cHBvcnQgZm9yIHBlcmZv
cm1hbmNlIHJlYXNvbnMuCj4KPiA+IEkgdXNlZCBCbyBHYW4ncyBYUGJtdFVDIHNlcmllcyBhbmQg
TWljaGFsIFdpbGN6eW5za2kncyBqaDcxMTAgZGlzcGxheQo+ID4gc2VyaWVzIGFuZCBmaW5hbGx5
IGdvdCB0aGUgaW50ZWdyYXRlZCBCWEUtNC0zMiBHUFUgdG8gd29yay4KPgo+IFRoZSBYUGJtdFVD
IHNlcmllcyBpcyBwcm9ibGVtYXRpYyAtLSBpdCAic3VwcG9ydHMgRUlDNzcwMCIgIndpdGggYQo+
IGh5cGVydmlzb3IiLCB3aGljaCBtZWFucyBpdCBjYW5ub3QgcnVuIG9uIEVJQzc3MDAgbmF0aXZl
bHkuIFRoaXMKPiBzZXZlcmVseSByZXN0cmljdHMgaXRzIHVzYWdlLgo+Cj4gU2FtdWVsIEhvbGxh
bmQgZnJvbSBTaUZpdmUgaXMgd29ya2luZyBvbiBwYXRjaGluZyB0aGUgUFRFIG9uLXRoZS1mbHks
Cj4gYnV0IHRoYXQgd2lsbCBjaGFuZ2UgYWxsIGNvZGUgYWNjZXNzaW5nIFBURSBpbiB0aGUga2Vy
bmVsIGFuZCB0aHVzIGlzIGEKPiBoZWF2eSB3b3JrLgo+Cj4gUC5TLiBGb3IgdGhlIEpINzExMCBy
YXNjYWwrZHVzdCBwb3dlciBpc3N1ZSwgSSBkaWQgYSB0cnktYW5kLWVycm9yIGhhY2sKPiBhdCBb
MV0uIFRoZSBiYXNpY2FsIHJlZ2lzdGVyIGRlZmluaXRpb24gb2YgdGhpcyByZWdpc3RlciAoY2Fs
bGVkCj4gUkdYX0NSX1BPV0VSX0VWRU5UKSBpcyBhdmFpbGFibGUgaW4gdGhlaXIgS00gdm9sY2Fu
aWMgcGFydCAoYnV0IGl0Cj4gc2VlbXMgdG8gYXBwbHkgZm9yIHJvZ3VlIHRvbyksIGJ1dCB0aGUg
aW5kaXZpZHVhbCBiaXRzIGZvciBkb21haW5zIGFyZQo+IHVuZG9jdW1lbnRlZCwgYW5kIHRoZSBo
aWdoZXN0IDgtYml0IHNlZW1zIHRvIGJlIHNvbWUga2luZCBvZiBtdWx0aS1jb3JlCj4gbWFzayBv
biBSb2d1ZS4KPgo+Cj4gWzFdCj4gaHR0cHM6Ly9naXRodWIuY29tL0ljZW5vd3kvbGludXgvY29t
bWl0LzA5ZGIzMTdjOWMyMjllZjM1OWUzNTQ2M2Y4YzA4ZWZkM2UyM2M2ODUKPgpXb3csIHRoYW5r
cyBmb3Igc2hhcmluZyB0aGlzLiBJdCB3b3JrcyByZWxpYWJseSBhbmQgaGVscGVkIG1lIGdldCBy
aWQKb2YgdGhlIGRvdWJsZS1pbnNtb2QgZm9yIHBvd2VydnIuCkkgaW50ZWdyYXRlZCBpdCBpbnRv
IG15IGJyYW5jaCB3aXRoIHVwZGF0ZWQgI2RlZmluZXMuCgpCZXN0Ci1Eb21pbmlxdWUKCj4gPgo+
ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwMzE2MDYwMzI4LjExNzM2MzQtMS1n
YW5ib2luZ0BnbWFpbC5jb20vCj4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA5
MTUtamg3MTEwLWNsZWFuLXNlbmQtdjQtMC1mMGU0ZmQ2ZjJjYzhAc2Ftc3VuZy5jb20vCj4gPiBo
dHRwczovL2dpdGh1Yi5jb20vZG9taWJlbC92aXNpb25maXZlMl9ncHVfYnJpbmd1cAo+ID4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
