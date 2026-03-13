Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437D5107BCE2
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 21:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x0dv7MmAFAG6yzK9RadmZsMuwPP0/AgxQXi/nyPLg2A=; b=ozpbV0HgEu9loL
	en/+wJtA/UFeMRrw1BLM7cAKpA6vo0E7PKAFJnrpxvoLHwHzz3b3nVstH07xKjn+/X11YepjyD+Eq
	iBb4Q+qrnfglrDjC7E2+L37fVjV/A9rLZBwmtJ34PZKUXpGy2MvaPtCyTfcRQykf5E4LPf3kZrfmh
	rwqY/Hb5RmAIL+s43X1dsOnYUNNpTHUeWpawKOCmCN3xuRno+lS5dnChyKbjrvH2elZBgw+z4nQcy
	C4nXExSrO7bmhVAUoMmgLBDWgtu5gTAUSp0ghNxbCsVFb6OJTaBncSrJoPk30tpyF1hjsb0FTsXN8
	m/2Jt2jSJLgqsmyLH2iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1AVN-00000001FTH-2zY8;
	Fri, 13 Mar 2026 21:57:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1AVC-00000001FSa-3Y7i;
	Fri, 13 Mar 2026 21:57:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8FEB56183F;
	Fri, 13 Mar 2026 21:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE5AC19421;
	Fri, 13 Mar 2026 21:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773439021;
	bh=BwGIzF3Y1kGJ7LSzEz+7QIlkvRAEX1ybLPLbwYlypHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D8LFC/Y2BvExaUUaQwCZ1enN784C4eGC3QLIYlLXoQRLLoZbcIPAW+9UHxunos89u
	 W2FcjOgbPlul4rkrHWNMnWcebVKNCNJBcZAC9W9bHqSllID/Yx8/g7Pg0waFNdbV1F
	 PZkKpvhQhygkjCvndRt4AGAp3O3ce5dB8Hf9tYRkl1Yd2G1/EC1V7ihRTEFOlFWtJD
	 TVRWH74L5h1udZNpGw4w/HeSz46hbFXg77yqFlXWTNDJcGX7icfPbrJEmetdc7x+30
	 MorgajnbJ3XPvDp3w4FMrauooCX4QG0hYbWRVYVLx7aMFlZXvlf6/A/GVpusGs1ME1
	 T/VOcVRh6Fn9Q==
Date: Fri, 13 Mar 2026 16:56:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: loongarch@lists.linux.dev, cfsworks@gmail.com, alex@ghiti.fr,
	skhan@linuxfoundation.org, liaoyuanhong@vivo.com,
	ritesh.list@gmail.com, linux-arm-kernel@lists.infradead.org,
	kees@kernel.org, leitao@debian.org, lirongqing@baidu.com,
	corbet@lwn.net, pmladek@suse.com, jbohac@suse.cz,
	eajames@linux.ibm.com, sourabhjain@linux.ibm.com,
	palmer@dabbelt.com, vishal.moola@gmail.com, npiggin@gmail.com,
	dapeng1.mi@linux.intel.com, brgerst@gmail.com, will@kernel.org,
	paulmck@kernel.org, tglx@kernel.org, rdunlap@infradead.org,
	hbathini@linux.ibm.com, kexec@lists.infradead.org, bhe@redhat.com,
	dyoung@redhat.com, x86@kernel.org, pjw@kernel.org, rppt@kernel.org,
	linux-doc@vger.kernel.org, kernel@xen0n.name,
	dave.hansen@linux.intel.com, catalin.marinas@arm.com,
	saravanak@kernel.org, samuel.holland@sifive.com,
	songshuaishuai@tinylab.org, coxu@redhat.com,
	fuqiang.wang@easystack.cn, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, osandov@fb.com, chenhuacai@kernel.org,
	aou@eecs.berkeley.edu, tangyouling@kylinos.cn, hpa@zytor.com,
	chleroy@kernel.org, linuxppc-dev@lists.ozlabs.org, bp@alien8.de,
	vgoyal@redhat.com, fvdl@google.com, kevin.brodsky@arm.com,
	mingo@redhat.com, maddy@linux.ibm.com, akpm@linux-foundation.org,
	junhui.liu@pigmoral.tech, ardb@kernel.org, mpe@ellerman.id.au,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 4/5] arm64: kexec: Add support for crashkernel CMA
 reservation
Message-ID: <177343901948.3415566.6726187926870600451.robh@kernel.org>
References: <20260302035315.3892241-1-ruanjinjie@huawei.com>
 <20260302035315.3892241-5-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260302035315.3892241-5-ruanjinjie@huawei.com>
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

Ck9uIE1vbiwgMDIgTWFyIDIwMjYgMTE6NTM6MTQgKzA4MDAsIEppbmppZSBSdWFuIHdyb3RlOgo+
IENvbW1pdCAzNWMxOGYyOTMzYzUgKCJBZGQgYSBuZXcgb3B0aW9uYWwgIixjbWEiIHN1ZmZpeCB0
byB0aGUKPiBjcmFzaGtlcm5lbD0gY29tbWFuZCBsaW5lIG9wdGlvbiIpIGFuZCBjb21taXQgYWI0
NzU1MTBlMDQyICgia2R1bXA6Cj4gaW1wbGVtZW50IHJlc2VydmVfY3Jhc2hrZXJuZWxfY21hIikg
YWRkZWQgQ01BIHN1cHBvcnQgZm9yIGtkdW1wCj4gY3Jhc2hrZXJuZWwgcmVzZXJ2YXRpb24uCj4g
Cj4gQ3Jhc2gga2VybmVsIG1lbW9yeSByZXNlcnZhdGlvbiB3YXN0ZXMgcHJvZHVjdGlvbiByZXNv
dXJjZXMgaWYgdG9vCj4gbGFyZ2UsIHJpc2tzIGtkdW1wIGZhaWx1cmUgaWYgdG9vIHNtYWxsLCBh
bmQgZmFjZXMgYWxsb2NhdGlvbiBkaWZmaWN1bHRpZXMKPiBvbiBmcmFnbWVudGVkIHN5c3RlbXMg
ZHVlIHRvIGNvbnRpZ3VvdXMgYmxvY2sgY29uc3RyYWludHMuIFRoZSBuZXcKPiBDTUEtYmFzZWQg
Y3Jhc2hrZXJuZWwgcmVzZXJ2YXRpb24gc2NoZW1lIHNwbGl0cyB0aGUgImxhcmdlIGZpeGVkCj4g
cmVzZXJ2YXRpb24iIGludG8gYSAic21hbGwgZml4ZWQgcmVnaW9uICsgbGFyZ2UgQ01BIGR5bmFt
aWMgcmVnaW9uIjogdGhlCj4gQ01BIG1lbW9yeSBpcyBhdmFpbGFibGUgdG8gdXNlcnNwYWNlIGR1
cmluZyBub3JtYWwgb3BlcmF0aW9uIHRvIGF2b2lkCj4gd2FzdGUsIGFuZCBpcyByZWNsYWltZWQg
Zm9yIGtkdW1wIHVwb24gY3Jhc2jigJRzYXZpbmcgbWVtb3J5IHdoaWxlCj4gaW1wcm92aW5nIHJl
bGlhYmlsaXR5Lgo+IAo+IFNvIGV4dGVuZCBjcmFzaGtlcm5lbCBDTUEgcmVzZXJ2YXRpb24gc3Vw
cG9ydCB0byBhcm02NC4gVGhlIGZvbGxvd2luZwo+IGNoYW5nZXMgYXJlIG1hZGUgdG8gZW5hYmxl
IENNQSByZXNlcnZhdGlvbjoKPiAKPiAtIFBhcnNlIGFuZCBvYnRhaW4gdGhlIENNQSByZXNlcnZh
dGlvbiBzaXplIGFsb25nIHdpdGggb3RoZXIgY3Jhc2hrZXJuZWwKPiAgIHBhcmFtZXRlcnMuCj4g
LSBDYWxsIHJlc2VydmVfY3Jhc2hrZXJuZWxfY21hKCkgdG8gYWxsb2NhdGUgdGhlIENNQSByZWdp
b24gZm9yIGtkdW1wLgo+IC0gSW5jbHVkZSB0aGUgQ01BLXJlc2VydmVkIHJhbmdlcyBmb3Iga2R1
bXAga2VybmVsIHRvIHVzZS4KPiAtIEV4Y2x1ZGUgdGhlIENNQS1yZXNlcnZlZCByYW5nZXMgZnJv
bSB0aGUgY3Jhc2gga2VybmVsIG1lbW9yeSB0bwo+ICAgcHJldmVudCB0aGVtIGZyb20gYmVpbmcg
ZXhwb3J0ZWQgdGhyb3VnaCAvcHJvYy92bWNvcmUsIHdoaWNoIGlzIGFscmVhZHkKPiAgIGRvbmUg
aW4gdGhlIGNyYXNoIGNvcmUuCj4gCj4gVXBkYXRlIGtlcm5lbC1wYXJhbWV0ZXJzLnR4dCB0byBk
b2N1bWVudCBDTUEgc3VwcG9ydCBmb3IgY3Jhc2hrZXJuZWwgb24KPiBhcm02NCBhcmNoaXRlY3R1
cmUuCj4gCj4gQWNrZWQtYnk6IE1pa2UgUmFwb3BvcnQgKE1pY3Jvc29mdCkgPHJwcHRAa2VybmVs
Lm9yZz4KPiBBY2tlZC1ieTogQXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKaW5qaWUgUnVhbiA8cnVhbmppbmppZUBodWF3ZWkuY29tPgo+IC0tLQo+IHY3
Ogo+IC0gQ29ycmVjdCB0aGUgaW5jbHVzaW9uIG9mIENNQS1yZXNlcnZlZCByYW5nZXMgZm9yIGtk
dW1wCj4gICBrZXJuZWwgaW4gb2Yva2V4ZWMuCj4gdjM6Cj4gLSBBZGQgQWNrZWQtYnkuCj4gdjI6
Cj4gLSBGcmVlIGNtZW0gaW4gcHJlcGFyZV9lbGZfaGVhZGVycygpCj4gLSBBZGQgdGhlIG10aXZh
dGlvbi4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVy
cy50eHQgfCAyICstCj4gIGFyY2gvYXJtNjQva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jICAg
ICAgICAgIHwgMiArLQo+ICBhcmNoL2FybTY0L21tL2luaXQuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDUgKysrLS0KPiAgZHJpdmVycy9vZi9mZHQuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCA5ICsrKysrLS0tLQo+ICBkcml2ZXJzL29mL2tleGVjLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDkgKysrKysrKysrCj4gIDUgZmlsZXMgY2hhbmdlZCwgMTkg
aW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAKCkFja2VkLWJ5OiBSb2IgSGVycmluZyAo
QXJtKSA8cm9iaEBrZXJuZWwub3JnPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
