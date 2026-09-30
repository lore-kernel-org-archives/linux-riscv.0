Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A57CA5FAC
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 12:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lZ5cyog4KH2RjEMctgqaQMZ1/tpFif6YCWFrrIjMoPE=; b=37Erp1OB3BTGNt
	6wqiOM6KPJpHkcLSBs3nQ9JdUqT0GtBzjbCmFsMjZ11deVrEy5EHyxVW4SLshjQOTCDDku3r2QxuT
	kv6BO5Bob+LXqw7dZj+Zp2m4mYgLVkQ3NUVjhtqsLOiIpm3rggZUpehPJq6A7nRplNAZvv2QQV3sh
	0AlcApECoMdE/gOuBMiZasPYKEaaxsdYyICMexaXloZpAqBFxumqz1Kv4gOx/eFLsnCqioIvnX6HJ
	kpFZksqjene9Fe+t5jP9E186639+bbitmZdTxPZeqSs/fyouQJOZK6RJabM/1eo2uoXnI9wPaHiK8
	SLPqJwXfXrAP2zqvyCLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtU9-0000000607P-3Bg0;
	Wed, 30 Sep 2026 12:32:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtU8-00000006074-1CBW
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 12:32:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 59A7060252;
	Wed, 30 Sep 2026 12:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 817BA1F000FF;
	Wed, 30 Sep 2026 12:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790771551;
	bh=7TDGn3GQ4oPu/DFwxrnAvcBWcL2hfREuPElzA5bsAAk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Lu5bL0yZ25wckbpSEVHcpUZSj0ozYcQrOJNZ3FWrVXcWwm4q2Iqzk8YEhtwARdOYE
	 xtVnIrpqr0tIfPuDx1kMcCygxBBQK5hCmjlN1ylGFh5CGFk9Pe3IRYCND1xjdTp4ZN
	 JUSZKWNzSva1PoBVPJpc+7K32en2sMXyrUNvvVQMMGFSaPTl30yM1W5tOsYvT7EnbR
	 cbK898k0OHudXoGWxZnK/3+0dwITqDaf3GcaXC4DG/5AohDCkB2L+8cl3p4PANPxEk
	 PzMTiIV1pWt101AHV4vVS5iHba9p6YbWkuhGRDCmwu1bAlcD6NdxaikqoVaDHBk4Ln
	 FshGgU22rHkIg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya
 Dwivedi <memxor@gmail.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang
 <xi.wang@gmail.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, Pu Lehui
 <pulehui@huawei.com>, Pu Lehui <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf] MAINTAINERS: Add myself as co-maintainer of riscv bpf
In-Reply-To: <20260930104659.1919027-1-pulehui@huaweicloud.com>
References: <20260930104659.1919027-1-pulehui@huaweicloud.com>
Date: Wed, 30 Sep 2026 14:32:28 +0200
Message-ID: <87se2q3oo3.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IEZyb206IFB1IExl
aHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4KPiBPdmVyIHRoZSB5ZWFycywgSSBoYXZlIGJlZW4g
YWN0aXZlbHkgaW52b2x2ZWQgaW4gdGhlIGRldmVsb3BtZW50IGFuZAo+IGhhdmUgcHJvYWN0aXZl
bHkgdGFrZW4gb24gbWFpbnRlbmFuY2UgcmVzcG9uc2liaWxpdGllcyBmb3IgdGhlIFJWNjQgSklU
LAo+IGNvdmVyaW5nIHRoZSByZWxhdGVkIGJwZiBjb3JlLCByaXNjdiBhcmNoaXRlY3R1cmUsIGFu
ZCBzZWxmdGVzdHMvQ0kKPiBpbmZyYXN0cnVjdHVyZS4gV2l0aCB0aGUgY29udGludW91cyBncm93
dGggb2YgcmlzY3YgYnBmIGZlYXR1cmVzIGFuZAo+IHRlc3Rpbmcgd29ya2xvYWQsIGFkZGluZyBh
IGNvLW1haW50YWluZXIgaGVscHMgc2hhcmUgdGhlIHJldmlldyBidXJkZW4KPiBhbmQgZW5zdXJl
IHRpbWVseSBwYXRjaCBoYW5kbGluZy4KPgo+IEFzIGZvciB0aGUgUlYzMiBKSVQsIHRoZXJlIGhh
cyBiZWVuIGEgbGFjayBvZiBhY3RpdmUgbWFpbnRhaW5lciByZXNwb25zZQo+IGZvciBzZXZlcmFs
IHllYXJzLCBsZWF2aW5nIGluY29taW5nIHBhdGNoZXMgb2NjYXNpb25hbGx5IHN0YWxsZWQuIEFj
dGl2ZQo+IG1haW50ZW5hbmNlIGlzIG5lZWRlZCB0byByZXZpZXcgaW5jb21pbmcgcGF0Y2hlcyBh
bmQgZW5zdXJlIGlzc3VlcyBhcmUKPiBhZGRyZXNzZWQgaW4gYSB0aW1lbHkgbWFubmVyLgo+Cj4g
VGhlcmVmb3JlLCBJIHdvdWxkIGxpa2UgdG8gcmVxdWVzdCB0YWtpbmcgb24gdGhlIGNvLW1haW50
YWluZXIgcm9sZSBmb3IKPiBib3RoIHRoZSBSVjY0IGFuZCBSVjMyIEpJVHMuIEZvciBtZSwgYmVp
bmcgYSBtYWludGFpbmVyIGlzIGJvdGggYW4gaG9ub3IKPiBhbmQgYSByZXNwb25zaWJpbGl0eSwg
YW5kIGl0IGFsc28gbWFrZXMgaXQgZWFzaWVyIGZvciBtZSB0byBwYXJ0aWNpcGF0ZQo+IGluIHJp
c2N2IGJwZiB3b3JrLCB3aGVyZSBJIGxvb2sgZm9yd2FyZCB0byBkZWRpY2F0aW5nIG1vcmUgdGlt
ZSBhbmQKPiBlZmZvcnQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3
ZWkuY29tPgoKTGVodWkgaGFzIGJlZW4gYWN0aXZlbHkgd29ya2luZyBvbiB0aGUgcnYzMi82NCBC
UEYgSklUIHNpZGUgb2YgdGhpbmdzCnNpbmNlIGxhdGUgMjAyMi4gR29pbmcgZnJvbSBjb250cmli
dXRvciB0byByZXZpZXdlciwgYW5kIG5vdyBzdGVwcGluZyB1cAphcyBhIG1haW50YWluZXIsIGlz
IGEgbmF0dXJhbCBzdGVwLiBDb25ncmF0cywgTGVodWkhIFdlbGwgZGVzZXJ2ZWQhCgpOb3csIGZp
bmdlcidzIGNyb3NzZWQgZm9yIGdldHRpbmcgdGhlIEJQRiBDSSBydW5uaW5nIG9uIHJlYWwgcnY2
NApoYXJkd2FyZSEKCkFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
