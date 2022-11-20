Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46177C433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Nov 2022 11:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qg/P+g7QeyQ+8dkHLV//tXvJmzAC9Js2RGMb+I6Ev4w=; b=KXQIxrGxCfOXwl
	pF1J7TMiw2beRxV6fhf0UH+ERG82F9FSrSMlzp1+fqa7b5uzGgjTQ9VFPBGRy3yurOZXk3Jbw3QD/
	Ekm5LRLnF3FgW+JzVTWxfq1cCgQXgYpsIpooKnPujA8XDnrbaUlRsRhkpHpZyascTVbA+iBR4BHWf
	fHf9jKUGOpGsr+4m27U+26jZq2egNYFHV1vIynA+UIQ9h2EEVhHxNuhQDWi6w+HO7Sg8Oo3xlX4bS
	s5sqtmP31YDk5rSspAf8vZsNxI3eOctHDMkdBY8++5dFCjeezGmK/BQ+uwQDHjCd03B+J0rLuu/2R
	7XmkKDzwRv51gwmGH+Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owiSI-003s3x-UM; Sun, 20 Nov 2022 11:25:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owiSG-003s2g-3D
	for linux-riscv@lists.infradead.org; Sun, 20 Nov 2022 11:25:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 85A5DB80B03;
	Sun, 20 Nov 2022 11:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4EAAC433D6;
	Sun, 20 Nov 2022 11:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668943541;
	bh=CvicEi2gnrYnqmDZV/HRfQ9d4uUEUscbiNOKOA4VLvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QzE4ScY+yQPVnxdhIEUv4V6wLLfcH9KnnEj76Lr1WZDQPOZCG8iS93MIobfuFKQb7
	 fQUWURPlbf/3KdCy5Icwss66BJi/cLZW1sc1083W5YLh+oPCb67nbiIUbEwO/Yqy+B
	 sovnZbz3bzq48JA6/MfP3h2bQ7DqEMNCOHs8EbBCtpA8QS+R5Xe+d5Rr6bnI+MaflD
	 CSJeSHmCaOjorE47TOOwR6bhcB/m7lxmanPAJ6w+c/f140HMAeEB5A4lUMcYdcffVe
	 51RFDouHOMCLSK7uYVeL/qf3md3PvgJJC0xkXUxeV/7RMDGc8Zv0+52rt6HGwwLEoJ
	 LtvuJnINTgr5A==
Date: Sun, 20 Nov 2022 11:25:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 02/12] dt-bindings: riscv: Add T-HEAD C906 and C910
 compatibles
Message-ID: <Y3oOsBxqUxeGMRJK@spud>
References: <20220815050815.22340-1-samuel@sholland.org>
 <20220815050815.22340-3-samuel@sholland.org>
 <76d9c4fb368dca87c64494b927706d0b18d712d2.camel@icenowy.me>
 <Y3oOOOdG4e24ByEc@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y3oOOOdG4e24ByEc@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_032544_308205_664F7B68 
X-CRM114-Status: GOOD (  15.55  )
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

T24gU3VuLCBOb3YgMjAsIDIwMjIgYXQgMTE6MjM6NDJBTSArMDAwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIEZyaSwgTm92IDA0LCAyMDIyIGF0IDEwOjU3OjU4QU0gKzA4MDAsIEljZW5vd3kg
Wmhlbmcgd3JvdGU6Cj4gPiDlnKggMjAyMi0wOC0xNeaYn+acn+S4gOeahCAwMDowOCAtMDUwMO+8
jFNhbXVlbCBIb2xsYW5k5YaZ6YGT77yaCj4gPiA+IFRoZSBDOTA2IGFuZCBDOTEwIGFyZSBSSVND
LVYgQ1BVIGNvcmVzIGZyb20gVC1IRUFEIFNlbWljb25kdWN0b3IuCj4gPiA+IE5vdGFibHksIHRo
ZSBDOTA2IGNvcmUgaXMgdXNlZCBpbiB0aGUgQWxsd2lubmVyIEQxIFNvQy4KPiA+IAo+ID4gQ291
bGQgdGhpcyBnZXQgYXBwbGllZCBmaXJzdD8KPiA+IAo+ID4gQzkwNiBhbmQgQzkxMCBub3cgaGF2
ZSBhIGZpeGVkLWNvbmZpZ3VyYXRpb24gb3Blbi1zb3VyY2UgdmVyc2lvbiwgd2hpY2gKPiA+IG1l
YW5zIHRoZXNlIGNvcmVzIGNvdWxkIGJlIHBsYXllZCBieSBhbnlvbmUsIGFuZCBoYXZpbmcgdGhl
bSBpbiB0aGUgRFQKPiA+IGJpbmRpbmcgcmVhbGx5IGhlbHBzIHBlb3BsZS4gSW4gYWRkaXRpb24g
SSBhbSBhd2FyZSBvZiBzb21lIEM5MDYtCj4gPiBlcXVpcHBlZCBTb0Mgb3V0IG9mIEFsbHdpbm5l
ci4KPiAKPiBJJ3ZlIGFwcGxpZWQgdGhpcyBvbmUgcGF0Y2ggYXMgdjYuMiBtYXRlcmlhbCBzaW5j
ZSBJIGRvdWJ0IHRoaXMgc2VyaWVzIGlzCj4gZ29ubmEgbWFrZSBpdCAmIHRoZSBCb3VmZmFsb2xh
YnMgZHQgaXMgZ29pbmcgdG8gbmVlZCB0aGlzIGNvbXBhdGlibGUgdG9vLgo+IEkgYXBwbGllZCBp
dCBvbiB0b3Agb2YgdjYuMS1yYzEganVzdCBpbiBjYXNlOgo+IAo+IGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvY29ub3IvYy8wZDgxNDAwMGFkMzU4OWJmNGY2OWM5Y2IyNWEzYjc3YmJkNTVmZmVjCgpX
b29wcywgdG90YWxseSB0aGUgd3JvbmcgaGFzaC4gRml4ZWQ6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvY29ub3IvYy80MWFkYzJmYmFkOGJjNDJlZDVmZGY0ODBlNTMxODEzM2E0OTQxYmJiCgpUaGFu
a3MsCkNvbm9yLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
