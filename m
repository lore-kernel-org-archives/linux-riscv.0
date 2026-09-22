Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076EEC982FF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 08:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NstKBmhbLgP70tIyu7H7kMm34oVN6A94h/2D4dkPxwU=; b=giEdtP8V7qQHnP
	GvKIOGZiF9OQ5lk7bkN4EKARhBmgnJUJX+cMQZ3NxhoVJCB6zzwVH2apLjSHMsz9/B4K6WhUNzaBq
	RQOYaGXzUM1xmHiXCP+8wHxVhGGoa/A4UyuOGvBedkMEtY/nT65EkhOmOxaU6I1hW+JtMyKCQCXsI
	hEz/QZDU+5ZRJ8SVKtz8L67eR7v2jBx9h8YX/eEI5ekd0sCdwuMIKU3IMdPgXlh/hqZyKYwOvegAF
	qYWgfeKCsbWbznLGRdsHL4Ms0iY3XV4wxEd6ZBsVZqrpmuBeRG+z38hRUNrpAMFwEv2Ew91iXvj4h
	t1CXE4YVChDgtSu4bmkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wGT-00000004m9f-252B;
	Tue, 22 Sep 2026 08:54:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wGR-00000004m98-3ne3;
	Tue, 22 Sep 2026 08:54:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1AA1260DDA;
	Tue, 22 Sep 2026 08:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A301F000FF;
	Tue, 22 Sep 2026 08:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790067250;
	bh=YLzEa2NgKc01BCihyFFvuyxmNzf4DGeagOdMFCmVpEw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eZBhPXfeygiiU2f/pWtXEIFzdO1vnHyv9utcEzx5sCi5XdKNrN9kNs6QgfMYMO2cl
	 JHdWSJG6JobZ2aIXM0UrxDOm/Nhuzxt9hTmfLApAHw2EqHRBVimWQRaS9tAfMLmfD6
	 A28ePCpBvIfXoIdtIPyuQ1qyX5YDEPfFQzjLOLakzjCh9L9y9ITyD/W6GuRURRZhn3
	 HG3zRcy7T1ZQr4VDjrCo+Vw8XsWqteTMKv/qE9J+UYlygb4nz3aKGuC3N0t5mEbeA7
	 DD7oe4nIcp45NiurQv8bVw4Z4TwyviX22YWABtkICBG7pYIyGUvp/BPbFddhgrwRa8
	 cftqB5tqV8T7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/9] of: reserved_mem: add dumpable flag to opt-in
 vmcore
To: robh@kernel.org, baoquan.he@linux.dev, rppt@kernel.org, "Wandun Chen" <chenwandun1@gmail.com>, m.szyprowski@samsung.com
Cc: mingo@redhat.com, saravanak@kernel.org, pjw@kernel.org, linux-riscv@lists.infradead.org, pasha.tatashin@soleen.com, kernel@xen0n.name, iommu@lists.linux.dev, ruirui.yang@linux.dev, tglx@kernel.org, devicetree@vger.kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, catalin.marinas@arm.com, dave.hansen@linux.intel.com, loongarch@lists.linux.dev, robin.murphy@arm.com, linux-kernel@vger.kernel.org, bp@alien8.de, pratyush@kernel.org, alex@ghiti.fr, chenhuacai@kernel.org, linux-arm-kernel@lists.infradead.org, hpa@zytor.com, linux-mm@kvack.org, kexec@lists.infradead.org, mark.rutland@arm.com, x86@kernel.org, akpm@linux-foundation.org, conor+dt@kernel.org, will@kernel.org
In-Reply-To: <20260922084256.1515554-7-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
 <20260922084256.1515554-7-chenwandun1@gmail.com>
Date: Tue, 22 Sep 2026 08:54:08 +0000
Message-Id: <20260922085409.18A301F000FF@smtp.kernel.org>
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

PiBGcm9tOiBXYW5kdW4gQ2hlbiA8Y2hlbndhbmR1bkBsaXhpYW5nLmNvbT4KPiAKPiBBZGQgYSAn
ZHVtcGFibGUnIGZsYWcgdG8gc3RydWN0IHJlc2VydmVkX21lbSB0byBkZWNpZGUgd2hldGhlciBh
Cj4gcmVzZXJ2ZWQgYXJlYSBzaG91bGQgYmUgaW5jbHVkZWQgaW4gdGhlIGtkdW1wIHZtY29yZS4g
Tm9uLWR1bXBhYmxlCj4gcmVnaW9ucyBhcmUgbGF0ZXIgbWFya2VkIE1FTUJMT0NLX05PRFVNUDt0
aGUgZmlsdGVyaW5nIGl0c2VsZiBoYXBwZW5zCj4gaW4gbWVtYmxvY2ssIGtlZXBpbmcgdGhlIGFy
Y2gga2R1bXAgY29kZSBpbmRlcGVuZGVudCBvZiB0aGUgRFQgQVBJLgo+IAo+IE1vc3QgcmVzZXJ2
ZWQgcmVnaW9ucyBhcmUgb3duZWQgYnkgZGV2aWNlcyBhbmQgZG8gbm90IGNvbnRhaW4gZGF0YQo+
IHVzZWZ1bCBmb3Iga2VybmVsIGNyYXNoIGFuYWx5c2lzLCBzbyBkdW1wYWJsZSBkZWZhdWx0IHRv
IGZhbHNlLgo+IFJldXNhYmxlIENNQSByZWdpb25zIGFyZSBkaWZmZXJlbnQ6IHRoZWlyIHBhZ2Vz
IGFyZSBoYW5kZWQgYmFjayB0byB0aGUKPiBidWRkeSBhbGxvY2F0b3IgYW5kIG1heSBjb250YWlu
IGtleSBkYXRhIGZvciBjcmFzaCBhbmFseXNpcywgc28gc2V0Cj4gZHVtcGFibGUgdG8gdHJ1ZSBp
biBybWVtX2NtYV9zZXR1cCgpLgo+IAo+IFRoZSBkdW1wYWJsZSBmbGFnIGlzIGFsc28gdXNlZCB0
byBjaGVjayAvbWVtcmVzZXJ2ZS8gZW50cmllcyBmb3Igb3ZlcmxhcAo+IHdpdGggb3RoZXIgZHVt
cGFibGUgcmVnaW9ucy4KPiAKPiBTdWdnZXN0ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogV2FuZHVuIENoZW4gPGNoZW53YW5kdW5AbGl4aWFuZy5j
b20+CgpTYXNoaWtvIGhhcyByZXZpZXdlZCB0aGlzIHBhdGNoIGFuZCBmb3VuZCBubyBpc3N1ZXMu
IEl0IGxvb2tzIGdyZWF0IQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlr
by5kZXYvIy9wYXRjaHNldC8yMDI2MDkyMjA4NDI1Ni4xNTE1NTU0LTEtY2hlbndhbmR1bjFAZ21h
aWwuY29tP3BhcnQ9NgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
