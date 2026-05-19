Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF39FCD4F3C
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 16:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vLOd32ErY+edhuPlzpOmvsTswBRE8knwtHSCIkSqux4=; b=h02EMjbGd3PGdm
	DcR2QReHKXQkIqp0967gI1WHcuwcPt8lxkn3HJ0M4IlVGeFRayl7JXsi04Qg3aOO9SDXQak0EuID1
	2uiR0G+Pp7isrI479k+eLHSBVTkHx/VqgyPshSeSVBEhQCww++uuh6YwNjt07xdc6eZq8XFeLBbPQ
	xoBhW/TfiQ3DummKJJDsmbaDBwPS+Ykr5vvSkC1J0lsU14ILh6eYhb206XoGsKBseE7j1r7KCyKGo
	porBcJ5RFyCNO9eCdI2Twao/zMHH3SXdf97L1f6cpUx/YNjL4pzrT63R7PdUfcVFJtEnPNoK2kVkl
	RRSeMEiodz3/kj0SZnGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNdY-00000002IAk-2adE;
	Tue, 19 May 2026 16:49:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPNdX-00000002IA7-1nXX;
	Tue, 19 May 2026 16:49:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 98D436022C;
	Tue, 19 May 2026 16:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA12C2BCB8;
	Tue, 19 May 2026 16:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779209382;
	bh=xK7G16bEnZgohr2GyDq+tZifrjDBAqojOxTNLJhUbiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZcJ/m4MeM2e98nnOTWyxvz0J/hHpuy2z+cR32k07YBEdAsrTReXtpj7hfVlMsvGlw
	 yJJYp5kvNjdIqpCwscGHQA56+TjGyzl/dZsVPXAwpVk/HE52dM8WNVt2xHGifb4268
	 ukJWQPCeyERVndgALRGPasfOJTh3aaHh6ONkilTpHGPTz0XWSJ3Rxa62xrSxHMjseK
	 e9TsViLHyP+GvHcE8couHEqJSm2xfg/nxEOorcVP9VnTPlk8LKolVT7rgg0EWrpzpU
	 AeYCgpVNMG7Nn2SNACkuPVj0jHTyxhbuG1qAcXJpBwk+7Mvp/PN3W6YUEaVF7Vm8Up
	 P+3U6rw/fm8ZA==
Date: Tue, 19 May 2026 22:19:33 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	jingoohan1@gmail.com, mx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] PCI: dwc: Cache PCIe capability offset and simplify
 drivers
Message-ID: <m332ocvmmdzcgnzmzxmbn2nmczxuhplt5efh64fd22fagrot42@x3okixj5qjb2>
References: <20260509135152.2241235-1-18255117159@163.com>
 <beqy5ykxgo4ianya6r4mahkkyujs6lly475u26vqaemgqsdnhp@2pn5ipczwc34>
 <5cc6fbcc-98eb-4da5-b123-2c04c4d39326@163.com>
 <bejh7em2a67a6wohtakovbg6wqwhjoxkuqtdompsexfm5bbzrf@yqwcqeg6yugq>
 <3464ded9-721a-4eb2-afb6-bbca6fdc8a46@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3464ded9-721a-4eb2-afb6-bbca6fdc8a46@163.com>
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

T24gV2VkLCBNYXkgMjAsIDIwMjYgYXQgMTI6Mjc6MjFBTSArMDgwMCwgSGFucyBaaGFuZyB3cm90
ZToKPiAKPiAKPiBPbiA1LzIwLzI2IDAwOjE1LCBNYW5pdmFubmFuIFNhZGhhc2l2YW0gd3JvdGU6
Cj4gPiBPbiBXZWQsIE1heSAyMCwgMjAyNiBhdCAxMjowOToyOEFNICswODAwLCBIYW5zIFpoYW5n
IHdyb3RlOgo+ID4gPiAKPiA+ID4gCj4gPiA+IE9uIDUvMTkvMjYgMjE6NTcsIE1hbml2YW5uYW4g
U2FkaGFzaXZhbSB3cm90ZToKPiA+ID4gPiBPbiBTYXQsIE1heSAwOSwgMjAyNiBhdCAwOTo1MTo0
OVBNICswODAwLCBIYW5zIFpoYW5nIHdyb3RlOgo+ID4gPiA+ID4gVGhlIERXQyBQQ0llIGNvcmUg
YW5kIGl0cyBtYW55IHBsYXRmb3JtIGRyaXZlcnMgcmVwZWF0ZWRseSBjYWxsCj4gPiA+ID4gPiBk
d19wY2llX2ZpbmRfY2FwYWJpbGl0eShwY2ksIFBDSV9DQVBfSURfRVhQKSB0byBvYnRhaW4gdGhl
IG9mZnNldCBvZiB0aGUKPiA+ID4gPiA+IFBDSSBFeHByZXNzIENhcGFiaWxpdHkgc3RydWN0dXJl
LiBUaGlzIGlzIHdhc3RlZnVsIGFuZCBtYWtlcyB0aGUgY29kZQo+ID4gPiA+ID4gdmVyYm9zZS4g
QW5kIHNvbWUgZXZlbiBzZWFyY2ggZm9yIHRoZSBQQ0lfQ0FQX0lEX0VYUCBvZmZzZXQgdmFsdWUg
d2l0aGluCj4gPiA+ID4gPiB0aGUgc3VzcGVuZC9yZXN1bWUgZnVuY3Rpb25zLgo+ID4gPiA+ID4g
Cj4gPiA+ID4gCj4gPiA+ID4gU2FzaGlrbyBoYXMgZmxhZ2dlZCBzb21lIHJlYWwgaXNzdWVzIHdp
dGggdGhpcyBzZXJpZXMgaW4gYWNjZXNzaW5nIERCSSBzcGFjZQo+ID4gPiA+IHZlcnkgZWFybHkg
YW5kICdwY2ktPnBjaWVfY2FwJyBiZWluZyAwLgo+ID4gPiAKPiA+ID4gCj4gPiA+IEhpIE1hbmks
Cj4gPiA+IAo+ID4gPiBXZSBoYXZlIGRpc2N1c3NlZCB0aGlzIGlzc3VlIGluIHRoZSBDYWRlbmNl
IGRyaXZlci4gSSB0aGluayBpdCB3b24ndCBjYXVzZQo+ID4gPiBhbnkgcHJvYmxlbXMuIFNwZWNp
ZmljYWxseSBhcyBmb2xsb3dzOgo+ID4gPiAKPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtcGNpLzU4MjNmYWVjLWQ5NzItNGM3Ny05MGVjLWEyMTVjNjg2ZTBhOEAxNjMuY29tLwo+
ID4gPiAiIiIKPiA+ID4gQXMgcGVyIFBDSWUgcjcuMCwgc2VjIDcuNS4xLjEuMTEsIFNpbmNlIGFs
bCBQQ0kgRXhwcmVzcyBGdW5jdGlvbnMgYXJlCj4gPiA+IHJlcXVpcmVkIHRvIGltcGxlbWVudCB0
aGUgUENJIEV4cHJlc3MgQ2FwYWJpbGl0eSBzdHJ1Y3R1cmUsIHdoaWNoCj4gPiA+IG11c3QgYmUg
aW5jbHVkZWQgc29tZXdoZXJlIGluIHRoaXMgbGlua2VkIGxpc3QuCj4gPiA+ICIiIgo+ID4gPiAK
PiA+ID4gCj4gPiA+IAo+ID4gPiBCam9ybiBhbHNvIHJlc3BvbmRlZCBhcyBmb2xsb3dzOgo+ID4g
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1wY2kvMjAyNjA1MDUyMTIzMDYuR0E3NDQx
NThAYmhlbGdhYXMvCj4gPiA+ICIiIgo+ID4gPiBJdCdzIHRydWUgdGhhdCBhbGwgUm9vdCBQb3J0
cyBtdXN0IGhhdmUgYSBQQ0llIENhcGFiaWxpdHkuCj4gPiA+ICIiIgo+ID4gPiAKPiA+IAo+ID4g
T2ssIHdoYXQgYWJvdXQgcmVhZGluZyB0aGUgREJJIHJlZ2lzdGVycyB2ZXJ5IGVhcmx5Pwo+IAo+
IEhpIE1hbmksCj4gCj4gWWVzLiBJIGhhdmUgcGVyZm9ybWVkIHRoZSBEQkkgcmVhZCByZWdpc3Rl
ciBvcGVyYXRpb24gYXQgdGhlIHZlcnkgYmVnaW5uaW5nCj4gb2YgdGhlIGZvbGxvd2luZyBjb2Rl
Lgo+IAo+IAo+IGR3X3BjaWVfZXBfaW5pdCgpCj4gICBkd19wY2llX2dldF9wY2llX2NhcChwY2kp
Owo+IAo+IGR3X3BjaWVfaG9zdF9pbml0Cj4gICBkd19wY2llX2dldF9wY2llX2NhcChwY2kpOwo+
IAoKVGhlc2UgYm90aCBjYWxscyB3aWxsIGNhdXNlIGNyYXNoIG9uIGEgbG90IG9mIHBsYXRmb3Jt
cyBiZWNhdXNlIHRoZXNlIHdpbGwgYmUKcmVhZGluZyB0aGUgREJJIHJlZ2lzdGVycyB3aGlsZSB0
aGUgcmVzb3VyY2VzIGFyZSBub3QgZW5hYmxlZC4KCi0gTWFuaQoKLS0gCuCuruCuo+Cuv+CuteCu
o+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
