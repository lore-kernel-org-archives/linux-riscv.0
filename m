Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D27C982FF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 09:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b6cdWB3m50fk8C49plW/8R7LLiu1ggJCsSqkLY1tEGE=; b=yDyDXynMsKLVRo
	5NF42glH2D1adAIrZhmkL+tnS+o1M44mPOft/0Czew2Xteq7q46WWTjPu0QUop4peAxogVUjn4zUT
	RSjHGREsIsi7lJX23skYaiI8WDKc5b6jnMD8tFppssdnI+eh5cndF4BsIIoiwvO/Na0CsgAsnUgn1
	ZudNkZlX+csD+pbMCyiCdx7+skcWkWNqbBlTb26y7efHiRYPAaNEwZYY0Fjg/3Y+ss1nwEusR1c0q
	gyuXRliTQ9crFGgXHFWoFsiCpUPqHBUGUFc0rU9v7p/w95JSTKoA4VzPmJLto14uZnMrBht7RJj8R
	mLFfB3QPFyfARpCzn7qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wOv-00000004pEe-3Fyi;
	Tue, 22 Sep 2026 09:02:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wOt-00000004pCt-26QI;
	Tue, 22 Sep 2026 09:02:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FB6740C4A;
	Tue, 22 Sep 2026 09:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B01541F000FF;
	Tue, 22 Sep 2026 09:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790067775;
	bh=JnhzTAx413FwpdKahXPNOcr3FwWYv2J2Y6dhd+67auQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e17ouVhx7pCa4EJXvSkinhLyV94jWOdGlljXb86UFt04mTtWxN7lu6AysEmUU3QLo
	 AY/5/KTGz63a1+nHe+QBAv7i9L3bkjvPynyjRfU1ZKNv39Ud+MifCRynvPn4HfDheh
	 /qodv7Z+OrXbHXZqlzP36IohhsehpVwOMtTCPMRaUWthRowSEohGKneZhUzEIWf48B
	 +RQ0gOP/EPvltRkXJ/AL9wU/EPgrO8maZ0xKOAvkdpqMfAX5JcoShYoS+IQIzmWQkZ
	 cfWweH9aPTBakCZQdL3x6Uw1Z/VAMetOe1jYzWpZLI1Hjn9BkaGnmlNtDWAUYaCfP/
	 WkRJ8YEnGI6hw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/9] memblock: introduce MEMBLOCK_NODUMP flag
To: "Wandun Chen" <chenwandun1@gmail.com>, robh@kernel.org, rppt@kernel.org, baoquan.he@linux.dev, m.szyprowski@samsung.com
Cc: aou@eecs.berkeley.edu, palmer@dabbelt.com, akpm@linux-foundation.org, conor+dt@kernel.org, bp@alien8.de, pasha.tatashin@soleen.com, ruirui.yang@linux.dev, mingo@redhat.com, hpa@zytor.com, saravanak@kernel.org, x86@kernel.org, robin.murphy@arm.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, alex@ghiti.fr, pratyush@kernel.org, kernel@xen0n.name, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, dave.hansen@linux.intel.com, kexec@lists.infradead.org, linux-riscv@lists.infradead.org, pjw@kernel.org, loongarch@lists.linux.dev, tglx@kernel.org, linux-mm@kvack.org, chenhuacai@kernel.org
In-Reply-To: <20260922084256.1515554-6-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
 <20260922084256.1515554-6-chenwandun1@gmail.com>
Date: Tue, 22 Sep 2026 09:02:52 +0000
Message-Id: <20260922090252.B01541F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG1tOiBsb2NrbGVzcyBt
dXRhdGlvbiBvZiBtZW1ibG9jay5tZW1vcnkgY2F1c2VzIFVBRiBpbiBjb25jdXJyZW50IHJlYWRl
cnMKLS0KCmNvbW1pdCAzZTBkNGY1Nzk0OTMzMDI2OGM3MDhiZWViNjZkYzFjMGZiNjVkYjMyCkF1
dGhvcjogV2FuZHVuIENoZW4gPGNoZW53YW5kdW5AbGl4aWFuZy5jb20+ClN1YmplY3Q6IG1lbWJs
b2NrOiBpbnRyb2R1Y2UgTUVNQkxPQ0tfTk9EVU1QIGZsYWcKClRoaXMgcGF0Y2ggaW50cm9kdWNl
cyB0aGUgTUVNQkxPQ0tfTk9EVU1QIGZsYWcgdG8gbWFyayBtZW1vcnkgcmVnaW9ucyB0aGF0CnNo
b3VsZCBiZSBleGNsdWRlZCBmcm9tIGtkdW1wIHZtY29yZXMuIEl0IGFsc28gYWRkcyBsb2dpYyB0
byBjbGVhciB0aGlzIGZsYWcKd2hlbiByZXNlcnZlZCBtZW1vcnksIHN1Y2ggYXMgdGhlIGluaXRy
ZCwgaXMgZnJlZWQgc28gdGhlIG1lbW9yeSBjYW4gYmUKcHJvcGVybHkgcmV1c2VkLgoKPiBkaWZm
IC0tZ2l0IGEvbW0vbWVtYmxvY2suYyBiL21tL21lbWJsb2NrLmMKPiBpbmRleCBlYTBkZTRiNWYz
NTY4Li40OGNhYmZlNWNkZjE2IDEwMDY0NAo+IC0tLSBhL21tL21lbWJsb2NrLmMKPiArKysgYi9t
bS9tZW1ibG9jay5jClsgLi4uIF0KPiBAQCAtOTQ5LDkgKzk1MSwxMyBAQCB1bnNpZ25lZCBsb25n
IGZyZWVfcmVzZXJ2ZWRfYXJlYSh2b2lkICpzdGFydCwgdm9pZCAqZW5kLCBpbnQgcG9pc29uLCBj
b25zdCBjaGFyCj4gIAl9Cj4gIAo+ICAJaWYgKElTX0VOQUJMRUQoQ09ORklHX0FSQ0hfS0VFUF9N
RU1CTE9DSykpIHsKPiAtCQlpZiAoc3RhcnRfcGEgPCBlbmRfcGEpCj4gKwkJaWYgKHN0YXJ0X3Bh
IDwgZW5kX3BhKSB7Cj4gIAkJCW1lbWJsb2NrX3JlbW92ZV9yYW5nZSgmbWVtYmxvY2sucmVzZXJ2
ZWQsCj4gIAkJCQkJICAgICAgc3RhcnRfcGEsIGVuZF9wYSAtIHN0YXJ0X3BhKTsKPiArCj4gKwkJ
CWlmIChJU19FTkFCTEVEKENPTkZJR19DUkFTSF9EVU1QKSkKPiArCQkJCW1lbWJsb2NrX2NsZWFy
X25vZHVtcChzdGFydF9wYSwgZW5kX3BhIC0gc3RhcnRfcGEpOwo+ICsJCX0KPiAgCX0KCltTZXZl
cml0eTogSGlnaF0KQ291bGQgdGhpcyBsb2NrbGVzcyBtdXRhdGlvbiBvZiBtZW1ibG9jay5tZW1v
cnkgcmFjZSB3aXRoIGNvbmN1cnJlbnQgcmVhZGVycz8KClRoaXMgY29kZSBwYXRoIGlzIHRyaWdn
ZXJlZCBkdXJpbmcgYXN5bmNocm9ub3VzIGluaXRyZCBmcmVlaW5nCihlLmcuLCB2aWEgZG9fcG9w
dWxhdGVfcm9vdGZzIHVzaW5nIGFzeW5jX3NjaGVkdWxlX2RvbWFpbikuCgpDYWxsaW5nIG1lbWJs
b2NrX2NsZWFyX25vZHVtcCgpIG1vZGlmaWVzIHRoZSBtZW1ibG9jay5tZW1vcnkgYXJyYXkgbG9j
a2xlc3NseQp2aWEgbWVtYmxvY2tfc2V0Y2xyX2ZsYWcoKSBhbmQgbWVtYmxvY2tfaXNvbGF0ZV9y
YW5nZSgpLgptZW1ibG9ja19pc29sYXRlX3JhbmdlKCkgY2FuIHNwbGl0IHJhbmdlcyB1c2luZyBt
ZW1tb3ZlKCksIHdoaWNoIGRpc3J1cHRzCmFycmF5IG9yZGVyaW5nLCBhbmQgY2FuIGV2ZW4gY2Fs
bCBtZW1ibG9ja19kb3VibGVfYXJyYXkoKSB3aGljaCBrZnJlZSgpcwp0aGUgb2xkIGFycmF5LgoK
Q29uY3VycmVudGx5LCBzdWJzeXN0ZW1zIHJlbHkgb24gbWVtYmxvY2subWVtb3J5IGJlaW5nIGlt
bXV0YWJsZSBhZnRlciBlYXJseQpib290LiBGb3IgZXhhbXBsZSwgb24gQVJNNjQsIGlvcmVtYXAo
KSBjYWxscyBwZm5faXNfbWFwX21lbW9yeSgpLCB3aGljaApwZXJmb3JtcyBhIGxvY2tsZXNzIGJp
bmFyeSBzZWFyY2ggKG1lbWJsb2NrX3NlYXJjaCgpKSBkaXJlY3RseSBvbgptZW1ibG9jay5tZW1v
cnkucmVnaW9ucy4KCklmIG1lbWJsb2NrX2NsZWFyX25vZHVtcCgpIHNwbGl0cyBvciByZWFsbG9j
YXRlcyB0aGUgYXJyYXkgd2hpbGUgaW9yZW1hcCgpCmlzIGV4ZWN1dGluZyBkdXJpbmcgZHJpdmVy
IHByb2JlcywgY291bGQgdGhpcyByZXN1bHQgaW4gYSB1c2UtYWZ0ZXItZnJlZQpvbiB0aGUgZnJl
ZWQgYXJyYXkgb3IgYW4gb3V0LW9mLWJvdW5kcyBhY2Nlc3MgZnJvbSBicm9rZW4gYmluYXJ5IHNl
YXJjaAppbnZhcmlhbnRzPwoKWyAuLi4gXQo+IEBAIC05OTUsOCArMTAwMSwxMSBAQCBpbnQgX19p
bml0X21lbWJsb2NrIG1lbWJsb2NrX3BoeXNfZnJlZShwaHlzX2FkZHJfdCBiYXNlLCBwaHlzX2Fk
ZHJfdCBzaXplKQo+ICAKPiAgCWttZW1sZWFrX2ZyZWVfcGFydF9waHlzKGJhc2UsIHNpemUpOwo+
ICAKPiAtCWlmICghc2xhYl9pc19hdmFpbGFibGUoKSB8fCBJU19FTkFCTEVEKENPTkZJR19BUkNI
X0tFRVBfTUVNQkxPQ0spKQo+ICsJaWYgKCFzbGFiX2lzX2F2YWlsYWJsZSgpIHx8IElTX0VOQUJM
RUQoQ09ORklHX0FSQ0hfS0VFUF9NRU1CTE9DSykpIHsKPiAgCQlyZXQgPSBtZW1ibG9ja19yZW1v
dmVfcmFuZ2UoJm1lbWJsb2NrLnJlc2VydmVkLCBiYXNlLCBzaXplKTsKPiArCQlpZiAoSVNfRU5B
QkxFRChDT05GSUdfQ1JBU0hfRFVNUCkpCj4gKwkJCW1lbWJsb2NrX2NsZWFyX25vZHVtcChiYXNl
LCBzaXplKTsKPiArCX0KCltTZXZlcml0eTogSGlnaF0KU2ltaWxhciB0byB0aGUgYWJvdmUsIGRv
ZXMgdGhpcyBpbnRyb2R1Y2UgdGhlIHNhbWUgbG9ja2xlc3MgbXV0YXRpb24gcmlzawp3aGVuIGNh
bGxlZCBkdXJpbmcgcnVudGltZSBtb2R1bGUgdW5sb2FkcyBvciBDTUEgZnJlZXM/CgotLSAKU2Fz
aGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTIy
MDg0MjU2LjE1MTU1NTQtMS1jaGVud2FuZHVuMUBnbWFpbC5jb20/cGFydD01CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
