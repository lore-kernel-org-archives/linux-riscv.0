Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B846FC3A59D
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Oct 2022 07:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOueoyb19NgPP7jlpzxX7arWtoq27Ow7jpwVTXdiEYc=; b=aDBoAGSAMVEAI/
	OUW+v/mrMoFsqGSX+fRvprog9jCrmFb2n6gx+bwCBHXPYGpj+dVSNKdXH101PeGRTQD+us52U1aYh
	Ig+UIsExsl6VvUpVOo5Ne0A49ek96A6eupLhC9wq5yfbJ03xmZJwV+H01bXZJivdGYIY4a/FXt9zO
	HBX9AGarmQOxTTkgOLbZiwVbCWgvh2bjdwHyarCLtfF9DJk6Z40sE3nOsOKfSO1Zs7MErfLV7ZmhX
	rgu98l/AZg+UW5RtUe6rzPn+SanSHgJeC5PuaVDAmPrK7GfHBBR4vZ+IJ6CvzGIkgca3arOGYcWhh
	MCWwmcL2NzmbMKPhe7Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omrYn-00HQYW-7M; Mon, 24 Oct 2022 07:07:45 +0000
Received: from out2.migadu.com ([188.165.223.204])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omrYk-00HQTZ-Di
	for linux-riscv@lists.infradead.org; Mon, 24 Oct 2022 07:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1666595251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V+N9vn0P6R0NJj2sELTzOo4NzUD1BWEF8UWsq1c2RX0=;
	b=bB+7EmY/sKtcvXTR6/6XXh1/s2iANpBqYNhfiTS1pNRQqFxyAueAs8m12STjP6sex/pfUX
	QgwfowBnI/e8a2DlprTQ2Ni8XEDKlJboHodc96d99WOWJKSGCa2/bVk6jK7iq7pcwEIw/j
	otAgqxDfAFypKBqnuVOLZglQ79K2zRs=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 2/2] riscv: Enable ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20221023133205.3493564-3-guoren@kernel.org>
Date: Mon, 24 Oct 2022 15:07:22 +0800
Cc: palmer@dabbelt.com,
 palmer@rivosinc.com,
 heiko@sntech.de,
 arnd@arndb.de,
 Muchun Song <songmuchun@bytedance.com>,
 catalin.marinas@arm.com,
 chenhuacai@loongson.cn,
 Conor.Dooley@microchip.com,
 paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu,
 linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 linux-mm@kvack.org,
 Guo Ren <guoren@linux.alibaba.com>
Message-Id: <1F5AF29D-708A-483B-A29F-CAEE6F554866@linux.dev>
References: <20221023133205.3493564-1-guoren@kernel.org>
 <20221023133205.3493564-3-guoren@kernel.org>
To: guoren@kernel.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_000742_651566_0614E6E2 
X-CRM114-Status: UNSURE (   6.45  )
X-CRM114-Notice: Please train this message.
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

Cgo+IE9uIE9jdCAyMywgMjAyMiwgYXQgMjE6MzIsIGd1b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+
IAo+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiAKPiBUaGlzIHBh
dGNoIGVuYWJsZSB0aGUgZmVhdHVyZSBvZiAiZnJlZSBzb21lIHZtZW1tYXAgcGFnZXMgb2YgSHVn
ZVRMQgoKV2UgaGF2ZSBhIG5ldyBuYW1lIOKAnEhWTyIgdG8gcmVmZXIgdG8gdGhpcyBmZWF0dXJl
LiBTbyBJ4oCZZCBsaWtlIHRvIHJld3JpdGUKVGhlIGNoYW5nZWxvZyB0byBzb21ldGhpbmcgbGlr
ZSDigJxFbmFibGUgSFZPIFsxXSBmb3IgUklTQ1bigJ0uCgo+IHBhZ2UiIFsxXS4gVG8gbWFrZSBp
dCB3b3JrIGNvcnJlY3QsIHdlIGFsc28gbmVlZCBmaXh1cCBQR19kY2FjaGVfY2xlYW4KPiBzZXR0
aW5nIGZvciBodWdlIHBhZ2UgWzJdLgo+IAo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1kb2MvMjAyMTA1MTAwMzAwMjcuNTYwNDQtMS1zb25nbXVjaHVuQGJ5dGVkYW5jZS5jb20v
Cj4gWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1tLzIwMjIwMzAyMDg0NjI0LjMz
MzQwLTEtc29uZ211Y2h1bkBieXRlZGFuY2UuY29tLwo+IAo+IFNpZ25lZC1vZmYtYnk6IEd1byBS
ZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxn
dW9yZW5Aa2VybmVsLm9yZz4KPiBDYzogTXVjaHVuIFNvbmcgPHNvbmdtdWNodW5AYnl0ZWRhbmNl
LmNvbT4KPiBDYzogSHVhY2FpIENoZW4gPGNoZW5odWFjYWlAbG9vbmdzb24uY24+Cj4gQ2M6IEFy
bmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+CgpJ4oCZYW0gcmVhbGx5IGdsYWQgdG8gc2VlIG1v
cmUgYW5kIG1vcmUgYXJjaGVzIGZvciBzdXBwb3J0IEhWTy4KCkFja2VkLWJ5OiBNdWNodW4gU29u
ZyA8c29uZ211Y2h1bkBieXRlZGFuY2UuY29tPgoKVGhhbmtzLgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
