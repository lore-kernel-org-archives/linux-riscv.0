Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE2DC79F99
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2026 21:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I9YhZp1AMZK5nbdRoofw1LGMwzuUPDXO043EB21d0HA=; b=JS00uf96GKwcJF
	AXkBcApBBBV/+8zt2P9MDvsL/fuudfcIeFEZKpOk4LQ2c6kHYcQH+ldoIViRpqBT6prP9YcMUX6dY
	MstP6XEL95VuW0EAzD1gWZwmxu3LnLoLRfOPRXAFWNMcUE6YC+vZKRi838eeIhGLuoa0ni8UConfX
	hPDmP9s8kbt3zDnO/OJvJq4hVBjZInYb41QfUk+oxUIieB6RZ5ZKsQ+GfFSmHi8areP3BDGCCDkRN
	Hgx1KuSlThZL4koJmkob01tiRgo1RDElhaVN5MEZJiVO0J2EAP/kS+VwzCj475/j8k/iG7lwyfVu+
	Bq0oys58g3K//2Kl8Fvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2xyL-00000004QVj-3EXc;
	Sat, 05 Sep 2026 21:30:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2xyK-00000004QVU-1vJC;
	Sat, 05 Sep 2026 21:30:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF8314012F;
	Sat,  5 Sep 2026 21:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED1B31F00A3A;
	Sat,  5 Sep 2026 21:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788643847;
	bh=2FsQkijurDodlXzSgnVUIeMF+0Mv7R4D+E6ps34X7dg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=J0AtCoEQhw7cg+X8IGyiq0Qq5QxvKsW5O2L/9mobICDmRnrYp1RTsWKLhFRTYsWhH
	 8CBPzGDujIdxK5EA1ltlDpYpBBMjUElsfinyG9NEAe/cbYVipym3mDGL+e8IVh43jY
	 aV8oDVZpRQDkL7dTtR/r401rEvYCONLjtzN99c1ZsrvaTT7+b5E71XyPj1GrLC0cMr
	 r7asLl6/gt9jcdxKatLeDXajxofeVOV37EBNQblJADQ1tZ9EtT/Zl1fmxzv35KApVe
	 31SkyiHw/625dpL2iLH+vRN+2aA0Kdf+nfji2pg8iyvRLMQjELA5GuNTBbB56e4BVP
	 phOr/ZM4sZfyA==
From: Thomas Gleixner <tglx@kernel.org>
To: Anup Patel <anup@brainfault.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Radu Rendec <radu@rendec.net>, Marc Zyngier <maz@kernel.org>, Paul
 Walmsley <pjw@kernel.org>
Subject: Re: Interrupt chip driver maintainence
In-Reply-To: <CAAhSdy1=Z-VjEhGsGOJ15QptCSZP_6zG1NF=B972KwzEJhFbFg@mail.gmail.com>
References: <871pb9841j.ffs@fw13>
 <CAAhSdy1=Z-VjEhGsGOJ15QptCSZP_6zG1NF=B972KwzEJhFbFg@mail.gmail.com>
Date: Sat, 05 Sep 2026 23:30:44 +0200
Message-ID: <87ecf74c8r.ffs@fw13>
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

T24gU2F0LCBTZXAgMDUgMjAyNiBhdCAxNjozNywgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBGcmks
IFNlcCA0LCAyMDI2IGF0IDg6MTnigK9QTSBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4+IEknbSBzdGlsbCBnb2luZyB0byBwaWNrIHVwIG9idmlvdXMgYW5kIHNpbXBs
ZSBidWcgZml4ZXMsIGJ1dCBmb3IKPj4gYW55dGhpbmcgd2hpY2ggcmVxdWlyZXMgZGVlcCBrbm93
bGVkZ2Ugb24gdGhlIHVuZGVybHlpbmcgaGFyZHdhcmUsIEknbQo+PiBnb2luZyB0byBqdXN0IG1h
cmsgdGhlbSBvYnNvbGV0ZSB3aGVuIHRoZXkgbW9sZGVkIGluIG15IGluYm94IHVucmV2aWV3ZWQK
Pj4gYnkgdGhlIHBlb3BsZSB3aG8gdW5kZXJzdGFuZCBpdCBmb3Igc2l4IHdlZWtzLgo+Pgo+Cj4g
SSB0aGluayB0aGlzIGlzIGEgZmFpciBhc2suCj4KPiBDdXJyZW50bHksIEkgYW0gZm9jdXNlZCBv
biByZXZpZXdpbmcgYW5kIHRlc3RpbmcgYW55dGhpbmcgd2hpY2gKPiB0b3VjaGVzIFJJU0MtViBB
SUEgZHJpdmVycy4gVGhlIFNpRml2ZSBQTElDIGRyaXZlciBvbiBvdGhlciBoYW5kCj4gc2VlbXMg
dG8gaGF2ZSBubyBhY3RpdmUgcmVpdmV3ZXJzIGZyb20gUklTQy1WIHNwYWNlLiBGZXcgeWVhcnMK
PiBiYWNrIEkgZGlkIHRyeSB0byBhY3RpdmVseSByZXZpZXcgU2lGaXZlIFBMSUMgZHJpdmVyIGJ1
dCB0aGVzZSBkYXlzCj4gSSBkb24ndCBoYXZlIGJhbmR3aWR0aCBmb3IgdGhhdC4KCkkgZG9uJ3Qg
YmxhbWUgeW91IGFuZCBJIHB1dCB5b3Ugb24gdGhlIENDIGxpc3QgYmVjYXVzZSB5b3UgYXJlIGlu
IHRoZQpSSVNDViBzcGFjZS4KCkkgZG9uJ3Qga25vdyB3aGF0J3Mgd3Jvbmcgd2l0aCBTaUZpdmUg
YnV0IHRoZXkgcmVhbGx5IG5lZWQgdG8gZ2V0IHRoZWlyCmFjdCB0b2dldGhlci4gUGF1bD8KClRo
YW5rcywKCiAgICAgICAgdGdseAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
