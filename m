Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E77C982FF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 09:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MEC5NxajhLM6PGC4XYRMCKOAEq/YoZgCn4OoougygGE=; b=dpBootPsP3mrac
	4Jbfprtvk6ifRB63f1+N07mp6jLx771Tczam+pWSphP1ZjxThm0siRDr+slEqfBshwdcKfGvacTpp
	Bi1Lz7GdItBb2+GtflI2fLkBIgDB9IDn/SPYiAlWU/TnoqT7Zp989puTtCc0kYZQuNUsJOcwlKXIz
	gwaAoq9Oa6mQ145K1ByA0MLgV9VzvoHxapV+MDzXw4FBbLUjSpc8NvTnAuxPSWEhnEsqliJRSI065
	F7tCoYqjeXodVyryTcNi5lmiUssv7OhGTwIUPz65asrO1VyB6DIj6n9q2B48soa6/xVyTqhTOxOg9
	D+eDmOwhMg3AIo1AhTqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wNY-00000004ohf-3vej;
	Tue, 22 Sep 2026 09:01:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wNW-00000004ogj-3ENR;
	Tue, 22 Sep 2026 09:01:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E75260DDA;
	Tue, 22 Sep 2026 09:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DD21F000FF;
	Tue, 22 Sep 2026 09:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790067689;
	bh=mjGPVOew5ysCF3WUc2TZ8QW0kJr9lTS0DgEOW24GPw4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RKTk+bn3+WrRh+uEPi4QsKpCQMBXdiVXaebzTyFMU52JIHYsRCsBMfXvtU7rub77Q
	 c2fEr37xSa/FgKfpQbOmr0c9p9pK/zq6q4W/drmX1lPcv3vRb3icWMD4gg0qNqTTVp
	 uy4jqLPrcnvvlNYaJ71axxVw70rxXcvMAz1o7bQwK2I4DFT70VIVpDD/fsuuwVCvnA
	 gq5CeO6ZT33+PfALex/ZbfH0KlRpf3mb8fEQaBSo3yx6fPOHe5xxnwc1aQjElG4KjB
	 rL3CjuBhz5Xe/jnj1pnhwqK3B7MWS+9TGPt1ZlARHlpTuVgUjv3joyNdav1qEFlRuN
	 0jXrGWn1YgZuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 7/9] of: reserved_mem: mark /reserved-memory entries
 with MEMBLOCK_NODUMP
To: robh@kernel.org, "Wandun Chen" <chenwandun1@gmail.com>, m.szyprowski@samsung.com, baoquan.he@linux.dev, rppt@kernel.org
Cc: aou@eecs.berkeley.edu, akpm@linux-foundation.org, pjw@kernel.org, chenhuacai@kernel.org, mingo@redhat.com, kexec@lists.infradead.org, palmer@dabbelt.com, pasha.tatashin@soleen.com, hpa@zytor.com, ruirui.yang@linux.dev, iommu@lists.linux.dev, pratyush@kernel.org, kernel@xen0n.name, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, robin.murphy@arm.com, devicetree@vger.kernel.org, catalin.marinas@arm.com, alex@ghiti.fr, linux-kernel@vger.kernel.org, x86@kernel.org, will@kernel.org, loongarch@lists.linux.dev, saravanak@kernel.org, linux-riscv@lists.infradead.org, conor+dt@kernel.org, tglx@kernel.org, mark.rutland@arm.com, bp@alien8.de, dave.hansen@linux.intel.com
In-Reply-To: <20260922084256.1515554-8-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
 <20260922084256.1515554-8-chenwandun1@gmail.com>
Date: Tue, 22 Sep 2026 09:01:25 +0000
Message-Id: <20260922090126.03DD21F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG9mOiByZXNlcnZlZF9t
ZW06IHVuY29uZGl0aW9uYWwgTUVNQkxPQ0tfTk9EVU1QIGJyZWFrcyBmaXJtd2FyZSBkZWJ1Z2dp
bmcKLS0KCmNvbW1pdCA3MGY0Y2JjYTUzOTc2NjUxOWQ4OTY3ZjdlODU3ZDJkYjI3ZGI0YzEzCkF1
dGhvcjogV2FuZHVuIENoZW4gPGNoZW53YW5kdW5AbGl4aWFuZy5jb20+CgpvZjogcmVzZXJ2ZWRf
bWVtOiBtYXJrIC9yZXNlcnZlZC1tZW1vcnkgZW50cmllcyB3aXRoIE1FTUJMT0NLX05PRFVNUAoK
VGhpcyBjb21taXQgbWFya3Mgbm9uLWR1bXBhYmxlIHJlc2VydmVkLW1lbW9yeSByZWdpb25zIHdp
dGggTUVNQkxPQ0tfTk9EVU1QCnNvIGtkdW1wIGNhbiBvbWl0IHRoZW0gZnJvbSB0aGUgdm1jb3Jl
LiBUaGUgbWFya2luZyBpcyBndWFyZGVkIGJ5CkNPTkZJR19DUkFTSF9EVU1QIHRvIGF2b2lkIHNw
bGl0dGluZyBtZW1ibG9jay5tZW1vcnkgZW50cmllcyB1bm5lY2Vzc2FyaWx5Cm9uIG5vbi1rZHVt
cCBrZXJuZWxzLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9vZl9yZXNlcnZlZF9tZW0uYyBi
L2RyaXZlcnMvb2Yvb2ZfcmVzZXJ2ZWRfbWVtLmMKPiAtLS0gYS9kcml2ZXJzL29mL29mX3Jlc2Vy
dmVkX21lbS5jCj4gKysrIGIvZHJpdmVycy9vZi9vZl9yZXNlcnZlZF9tZW0uYwoKWyAuLi4gXQoK
PiBAQCAtNjc3LDYgKzY3NywyMSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZmR0X2luaXRfcmVzZXJ2
ZWRfbWVtX25vZGUoLi4uKQo+ICAJcmVzZXJ2ZWRfbWVtX2NvdW50Kys7Cj4gIH0KPiAgCj4gK3Zv
aWQgX19pbml0IGZkdF9tYXJrX3Jlc2VydmVfbWVtX25vZHVtcCh2b2lkKQo+ICt7Cj4gKwlzdHJ1
Y3QgcmVzZXJ2ZWRfbWVtICpybWVtOwo+ICsJaW50IGk7Cj4gKwo+ICsJaWYgKCFJU19FTkFCTEVE
KENPTkZJR19DUkFTSF9EVU1QKSkKPiArCQlyZXR1cm47Cj4gKwo+ICsJZm9yIChpID0gMDsgaSA8
IHJlc2VydmVkX21lbV9jb3VudDsgaSsrKSB7Cj4gKwkJcm1lbSA9ICZyZXNlcnZlZF9tZW1baV07
Cj4gKwkJaWYgKHJtZW0tPnNpemUgJiYgIXJtZW0tPmR1bXBhYmxlKQo+ICsJCQltZW1ibG9ja19t
YXJrX25vZHVtcChybWVtLT5iYXNlLCBybWVtLT5zaXplKTsKCltTZXZlcml0eTogSGlnaF0KRG9l
cyB0aGlzIHVuY29uZGl0aW9uYWwgbWFza2luZyBwcmV2ZW50IGRlYnVnZ2luZyBvZiBjb3Byb2Nl
c3NvciBtZW1vcnkgYW5kCmZpcm13YXJlIHN0YXRlIGluIHZtY29yZXM/CgpTaW5jZSBvbmx5IHRo
ZSBDTUEgZHJpdmVyIHNldHMgZHVtcGFibGUgdG8gdHJ1ZSwgaXQgYXBwZWFycyBhbGwgb3RoZXIK
Z2VuZXJpYyAvcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMgKHN1Y2ggYXMgRFNQIGxvZ3Mgb3IgcmFt
b29wcykgZGVmYXVsdAp0byBmYWxzZS4KCkJlY2F1c2UgZmR0X21hcmtfcmVzZXJ2ZV9tZW1fbm9k
dW1wKCkgdW5jb25kaXRpb25hbGx5IGFwcGxpZXMKTUVNQkxPQ0tfTk9EVU1QIHRvIHRoZXNlIHJl
Z2lvbnMsIGFuZCB0aGVyZSBpcyBubyBEZXZpY2UgVHJlZSBwcm9wZXJ0eQpwcm92aWRlZCB0byBv
cHQgdGhlbSBiYWNrIGluLCBpcyB0aGVyZSBhIHJpc2sgdGhhdCBzeXN0ZW0gYWRtaW5pc3RyYXRv
cnMKd2lsbCBsb3NlIHRoZSBhYmlsaXR5IHRvIGluc3BlY3QgdGhlc2UgcmVnaW9ucyBhZnRlciBh
IGNyYXNoPwoKPiArCX0KPiArfQo+ICsKPiAgc3RydWN0IHJtZW1fYXNzaWduZWRfZGV2aWNlIHsK
PiAgCXN0cnVjdCBkZXZpY2UgKmRldjsKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczov
L3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MjIwODQyNTYuMTUxNTU1NC0xLWNoZW53YW5k
dW4xQGdtYWlsLmNvbT9wYXJ0PTcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
