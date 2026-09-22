Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA18DC98302
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 09:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kuigi+1Nmhm6Irxu7LvaYWg8A5sf/BnalQ8XJs6MPa0=; b=BKWZfiOm9RRISO
	XIwSkqYE0F42BBwlcBOaqwF7EOhYVDjinT0E2Ux5C5EgajWK6bwHCdl1ZwAs33i5wZ6d4cZeJ7/ln
	kKRqMpPf8V8i9AqnKdHL18OYV/0LQb0sepnQXo+yrWRjk9Ua2ZG57T6AX8B3GtXWbWC3hnhx9N4P6
	OqqmwbVLWu4QgxEcFwVVUk70MkjgYLyV7OQNjEKUDLXSYKy7xoMki2IXKHJxJFk0qZHgNP9rIdow5
	eg/gnUEDiVxdgK2DABfbyBstz54mD3BUcY7SIUkx4VmvAmQDieJbLsokSUBSRryLKZR350kJzKkYe
	ElmjZfh5ACYvp/d46Y0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wQx-00000004q4i-2DVl;
	Tue, 22 Sep 2026 09:05:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wQv-00000004q3D-47HY;
	Tue, 22 Sep 2026 09:05:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 589CE408F4;
	Tue, 22 Sep 2026 09:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5581F000FF;
	Tue, 22 Sep 2026 09:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790067901;
	bh=gVJZTypgXfKJStNVi3R0a2JQB/tvx6NLIBfpEAfH+Ko=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k9LHr2Wd4Rxx3+1boxWUT9I2oXWCmuvgxijo5nc6bPCgxtO998Rsh7NKemCZPMZ7q
	 jCqEgkFPjzxPK4mReOTTd/elY+ciGLQH0sdAs9Gj6meNVO4LfN2kzV+4LXR0oVx6SK
	 7ZH/T7Wv5A2AUNswlgh8q3cB2VzM3drCJ2lhSUow3TBR7t+5QqoSZi80Bp+U336otT
	 6+pWL7hrOojomJ2u753Enniueu6LZnlrBvU6X6vwp9prGtDnyfBK/IXM5CJdbxbR9Z
	 4Y6VvuOiSdy8+S0cHn5PGHelRvFyfDPZFS7siU3DaFG8DB1NQi0pi6gHzGpuQPP6oN
	 01swkhQ7UyoBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 8/9] of: reserved_mem: mark /memreserve/ entries as
 MEMBLOCK_NODUMP
To: robh@kernel.org, baoquan.he@linux.dev, "Wandun Chen" <chenwandun1@gmail.com>, rppt@kernel.org, m.szyprowski@samsung.com
Cc: saravanak@kernel.org, pjw@kernel.org, conor+dt@kernel.org, iommu@lists.linux.dev, ruirui.yang@linux.dev, linux-kernel@vger.kernel.org, mark.rutland@arm.com, loongarch@lists.linux.dev, tglx@kernel.org, bp@alien8.de, x86@kernel.org, pratyush@kernel.org, kexec@lists.infradead.org, chenhuacai@kernel.org, hpa@zytor.com, pasha.tatashin@soleen.com, mingo@redhat.com, linux-mm@kvack.org, robin.murphy@arm.com, linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu, linux-arm-kernel@lists.infradead.org, alex@ghiti.fr, catalin.marinas@arm.com, will@kernel.org, devicetree@vger.kernel.org, dave.hansen@linux.intel.com, akpm@linux-foundation.org, palmer@dabbelt.com, kernel@xen0n.name
In-Reply-To: <20260922084256.1515554-9-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
 <20260922084256.1515554-9-chenwandun1@gmail.com>
Date: Tue, 22 Sep 2026 09:04:58 +0000
Message-Id: <20260922090459.2B5581F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gb2YvZmR0OiBzaWxl
bnQgdTY0IHRydW5jYXRpb24gaW4gZmR0X21hcmtfbWVtcmVzZXJ2ZV9ub2R1bXAgY2F1c2VzIG5v
ZHVtcCBmYWxzZSBwb3NpdGl2ZXMKLS0KCmNvbW1pdCAwNzBlZDY5OWFkYTRkNDU2NjE4YTY0MGM2
YWQ1NDFhYmJlYzk4Zjk1CkF1dGhvcjogV2FuZHVuIENoZW4gPGNoZW53YW5kdW5AbGl4aWFuZy5j
b20+CgpvZjogcmVzZXJ2ZWRfbWVtOiBtYXJrIC9tZW1yZXNlcnZlLyBlbnRyaWVzIGFzIE1FTUJM
T0NLX05PRFVNUAoKVGhlIC9tZW1yZXNlcnZlLyBlbnRyaWVzIGFyZSBtZW1vcnkgcmVzZXJ2YXRp
b25zIG1hZGUgYnkgdGhlIGJvb3Rsb2FkZXIKb3IgZmlybXdhcmUsIHRoZWlyIGNvbnRlbnRzIGFy
ZSBub3QgbmVlZGVkIGZvciBrZXJuZWwgY3Jhc2ggYW5hbHlzaXMuIFRoaXMKY29tbWl0IG1hcmtz
IHRoZW0gTUVNQkxPQ0tfTk9EVU1QIHRvIG9taXQgdGhlbSBmcm9tIHRoZSB2bWNvcmUsIHdoaWxl
IGxlYXZpbmcKb3ZlcmxhcHBpbmcgZHVtcGFibGUgcmVnaW9ucyB1bm1hcmtlZC4KCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvb2Yvb2ZfcmVzZXJ2ZWRfbWVtLmMgYi9kcml2ZXJzL29mL29mX3Jlc2Vy
dmVkX21lbS5jCj4gaW5kZXggZjI5YTA3ZThmYjIzZS4uYTQyY2Y2ZWFjNTViNSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL29mL29mX3Jlc2VydmVkX21lbS5jCj4gKysrIGIvZHJpdmVycy9vZi9vZl9y
ZXNlcnZlZF9tZW0uYwpbIC4uLiBdCj4gQEAgLTI1MSw2ICsyNTEsMzkgQEAgc3RhdGljIHZvaWQg
X19pbml0IF9fcm1lbV9jaGVja19mb3Jfb3ZlcmxhcCh2b2lkKQo+ICAJfQo+ICB9Cj4gIAo+ICt2
b2lkIF9faW5pdCBmZHRfbWFya19tZW1yZXNlcnZlX25vZHVtcCh2b2lkKQo+ICt7Cj4gKwl1NjQg
YmFzZSwgc2l6ZTsKPiArCWludCBuOwo+ICsJY29uc3Qgdm9pZCAqZmR0ID0gaW5pdGlhbF9ib290
X3BhcmFtczsKWyAuLi4gXQo+ICsJCWZvciAoaSA9IDA7IGkgPCByZXNlcnZlZF9tZW1fY291bnQ7
IGkrKykgewo+ICsJCQlzdHJ1Y3QgcmVzZXJ2ZWRfbWVtICpybWVtID0gJnJlc2VydmVkX21lbVtp
XTsKPiArCj4gKwkJCWlmIChybWVtLT5kdW1wYWJsZSAmJgo+ICsJCQkgICAgYmFzZSA8ICh1NjQp
cm1lbS0+YmFzZSArICh1NjQpcm1lbS0+c2l6ZSAmJgo+ICsJCQkgICAgKHU2NClybWVtLT5iYXNl
IDwgYmFzZSArIHNpemUpCj4gKwkJCQlicmVhazsKPiArCQl9Cj4gKwkJaWYgKGkgPT0gcmVzZXJ2
ZWRfbWVtX2NvdW50KQo+ICsJCQltZW1ibG9ja19tYXJrX25vZHVtcChiYXNlLCBzaXplKTsKCltT
ZXZlcml0eTogTWVkaXVtXQpJcyB0aGVyZSBhIHJpc2sgb2Ygc2lsZW50IHRydW5jYXRpb24gaGVy
ZSB3aGVuIHBhc3NpbmcgdTY0IGFyZ3VtZW50cyB0bwptZW1ibG9ja19tYXJrX25vZHVtcCgpIG9u
IDMyLWJpdCBhcmNoaXRlY3R1cmVzPwoKVGhlIHU2NCBiYXNlIGFuZCBzaXplIHZhcmlhYmxlcyBh
cmUgcGFzc2VkIGRpcmVjdGx5IHRvIG1lbWJsb2NrX21hcmtfbm9kdW1wKCkKd2hpY2ggdGFrZXMg
cGh5c19hZGRyX3QgYXJndW1lbnRzLiBPbiBhIDMyLWJpdCBhcmNoaXRlY3R1cmUgd2hlcmUgcGh5
c19hZGRyX3QKaXMgMzItYml0LCBpZiB0aGUgZGV2aWNlIHRyZWUgY29udGFpbnMgYSAvbWVtcmVz
ZXJ2ZS8gZW50cnkgd2l0aCBhbiBhZGRyZXNzCmdyZWF0ZXIgdGhhbiA0R0IsIGZkdF9tYXJrX21l
bXJlc2VydmVfbm9kdW1wKCkgcmVhZHMgaXQgYXMgYSA2NC1iaXQgdmFsdWUuCgpJdCBwZXJmb3Jt
cyBhIDY0LWJpdCBvdmVybGFwIGNoZWNrIGFnYWluc3QgZHVtcGFibGUgcmVnaW9ucyBpbiByZXNl
cnZlZF9tZW0uCkJlY2F1c2UgdGhlIHVwcGVyIDMyIGJpdHMgZGlmZmVyLCBpdCBjb25jbHVkZXMg
dGhlcmUgaXMgbm8gb3ZlcmxhcC4gSXQgdGhlbgpjYWxscyBtZW1ibG9ja19tYXJrX25vZHVtcCgp
LCB3aGVyZSB0aGUgY29tcGlsZXIgc2lsZW50bHkgdHJ1bmNhdGVzIGJhc2UgdG8gMzIKYml0cy4K
CkNvdWxkIHRoaXMgaW5jb3JyZWN0bHkgbWFyayB0aGUgbG93ZXIgMzItYml0IGFkZHJlc3MgYXMg
TUVNQkxPQ0tfTk9EVU1QLAptaXN0YWtlbmx5IGV4Y2x1ZGluZyBhbnkgZHVtcGFibGUgcmVnaW9u
IGxvY2F0ZWQgdGhlcmUgdGhhdCB0aGUgb3ZlcmxhcApjaGVjayB3YXMgaW50ZW5kZWQgdG8gcHJv
dGVjdD8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0
Y2hzZXQvMjAyNjA5MjIwODQyNTYuMTUxNTU1NC0xLWNoZW53YW5kdW4xQGdtYWlsLmNvbT9wYXJ0
PTgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
