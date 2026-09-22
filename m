Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15343C982FF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 08:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IQiDkg/hy/cc2ym7iKlkeVjGWmZUu8IGpJu6BXnmtrw=; b=VXnPudGe7L+2hz
	fALqrf6jpoTRIp3gptPNxE2fcr7xnCS8kxioEwEz7cqz1D7Zq9Pf/VEtudlOPXx3LiAUdgmeKoIlo
	mDBr3JtLJR0pZiBOZ8a3zfIt2BgEbUD3umhCPcCPBSZOiAGpN3anGlCpNs32duO5cijR+oSm9+Ill
	vL9Q2kI8nixeLvXoY02NgNVXL+uZTLcLfKkVdtBj1ulCjK9st4kE/mceau1a/HKlqfs+ugNdJlGRk
	w2NrG0gP+12rnwPcQxNoTg9v/FOgggjZonNLchUi7TfFUCfZiSF5KkZPSxn7fJSd4jSpHSv3MPjvz
	Tigo+B4+qEW/avI+FSoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wIr-00000004n9N-04Uf;
	Tue, 22 Sep 2026 08:56:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wIo-00000004n7Q-420r;
	Tue, 22 Sep 2026 08:56:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D76660234;
	Tue, 22 Sep 2026 08:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 324C21F000FF;
	Tue, 22 Sep 2026 08:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790067397;
	bh=pTlfKzJ0Vr6DSRpLT6CuScs/v+wf5LCST8fvQa+xTPw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UjMMkTL3IajEia8updhKDn0B0sN4uZ+B51lBn49hz7hBmJ7MzWBYI5EcEuEfwLN1o
	 4jfNijR50BmzKGvcn4d3dOkVX34YzyVllzamWislCB7YlbrZGEahwe4J+IwHJKC6N+
	 1iHed7xRRr8Ru9DsDsXeS3ulEnbHJ7mRbt9vy/crzJg0ktncs3zhFh3LbWpiZPc+44
	 4UnH7475pFNCOVwqBQNdH8sjwnNDLUk/7fK7JR1SNGnthWoIVt6fcSbAzIpSdigwMw
	 lla9CdSpA7/mRiWzZ1SLBxmWzFq0xLxG5qwc+iTmamJ1wxAjXz1oC/erw2cD0LGg4j
	 xiUpRSRlL0knw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/9] crash_core: fold duplicated memblock arch hooks
 into the weak default
To: "Wandun Chen" <chenwandun1@gmail.com>, m.szyprowski@samsung.com, robh@kernel.org, rppt@kernel.org, baoquan.he@linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dave.hansen@linux.intel.com, tglx@kernel.org, will@kernel.org, bp@alien8.de, mark.rutland@arm.com, pjw@kernel.org, ruirui.yang@linux.dev, hpa@zytor.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, akpm@linux-foundation.org, mingo@redhat.com, pasha.tatashin@soleen.com, linux-riscv@lists.infradead.org, conor+dt@kernel.org, pratyush@kernel.org, alex@ghiti.fr, x86@kernel.org, loongarch@lists.linux.dev, devicetree@vger.kernel.org, chenhuacai@kernel.org, linux-kernel@vger.kernel.org, saravanak@kernel.org, kexec@lists.infradead.org, robin.murphy@arm.com, linux-mm@kvack.org, catalin.marinas@arm.com, iommu@lists.linux.dev, kernel@xen0n.name
In-Reply-To: <20260922084256.1515554-3-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
 <20260922084256.1515554-3-chenwandun1@gmail.com>
Date: Tue, 22 Sep 2026 08:56:35 +0000
Message-Id: <20260922085636.324C21F000FF@smtp.kernel.org>
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

PiBGcm9tOiBXYW5kdW4gQ2hlbiA8Y2hlbndhbmR1bkBsaXhpYW5nLmNvbT4KPiAKPiBhcm02NCwg
bG9vbmdhcmNoIGFuZCByaXNjdiBvcGVuLWNvZGUgdGhlIHNhbWUgbWVtYmxvY2sgd2FsayBpbgo+
IGFyY2hfZ2V0X3N5c3RlbV9ucl9yYW5nZXMoKSBhbmQgYXJjaF9jcmFzaF9wb3B1bGF0ZV9jbWVt
KCkuIE1vdmUgaXQgaW50bwo+IHRoZSBfX3dlYWsgZGVmYXVsdHMgaW4ga2VybmVsL2NyYXNoX2Nv
cmUuYyBhbmQgZGVsZXRlIHRoZSBhcmNoIGNvcGllcy4KPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5n
ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXYW5kdW4gQ2hlbiA8Y2hlbndhbmR1bkBsaXhpYW5nLmNv
bT4KClNhc2hpa28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4g
SXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtv
LmRldi8jL3BhdGNoc2V0LzIwMjYwOTIyMDg0MjU2LjE1MTU1NTQtMS1jaGVud2FuZHVuMUBnbWFp
bC5jb20/cGFydD0yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
