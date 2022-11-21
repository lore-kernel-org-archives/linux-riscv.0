Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B237EC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 21:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bc4led1RQ3rdpbVyIIrxoiDhmUQc1U/jiAgPAomyXyU=; b=h8K5gBSxVpzDA5
	xSKkTHUExLxPQcIeErIhhPan2BJar03qPgqbZtRg2IQsOj8oYzIRY7c0UPUpWyq0Nun5f172OetQq
	sw1ISUHVjCxjBRW6Ui3enn178f4NZxmpSpfb40eIZ61GbMGs2FLJE+KA4sSrGAMTfl/crcU3fKh0m
	qQdeVlRL5Aj2VA8VBz2pauA2lBmtiY9T4Bh2atiUs+6wAhHGa9J8L2L4Np50Bc/suek2WKSrcnteo
	m0rv19lyy3LyevNeyrKoSns/M+6uwskCjk5aZoPuKK71McUEbedp9oOncPsPpckARYovhZIQoMlWV
	YFtbN970YK+ysFkUBZog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxEYD-000VWn-2W; Mon, 21 Nov 2022 21:42:01 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxEYA-000VPZ-N7
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 21:41:59 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A3A8B377;
	Mon, 21 Nov 2022 21:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A3A8B377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1669066913; bh=L31rqfsRwDOZSz+AgtzsoDa8WjVPdfQZ+R8ah/MoVnw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Kc3mKRK17MJTz04/m6S/Yq1b+xIhNVWSbxmvH19M1fCvsCroUgUF5QFdepQ4qNgTd
	 dos81jFMMMIEw4RdogP/WLfSVFKIgC54ej+t5jVQnAV3jJZtqgYDXJ0/5agvIbIh5+
	 cISIjmAd9v5x6Go6MGgwp7bBduWBbxN3gsH4gfPk8Zu4em6a/Ypm3Fz2ujl2CXl6rP
	 /CIjG5yMKFuco4hTidDKmWtAlCtOiQN3sOGIniNxadsXVrgH36/9Q92IQzpJoLCa7M
	 lHFYst91aols4ppfDjp/wLcdvxljTExfzMI822AZ7KX0aCEhObgD560S/BtL71ZT/j
	 KQ33nEXHqpPhg==
From: Jonathan Corbet <corbet@lwn.net>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, Alexandre Ghiti
 <alex@ghiti.fr>
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: riscv: Document the sv57 VM layout
In-Reply-To: <20221118171556.1612190-1-bjorn@kernel.org>
References: <20221118171556.1612190-1-bjorn@kernel.org>
Date: Mon, 21 Nov 2022 14:41:52 -0700
Message-ID: <87k03o7zof.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_134158_773366_E4405E0A 
X-CRM114-Status: GOOD (  10.12  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBGcm9tOiBCasO2cm4g
VMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4KPiBSSVNDLVYgaGFzIGJlZW4gc3VwcG9ydGlu
ZyB0aGUgInN2NTciIGFkZHJlc3MgdHJhbnNsYXRpb24gbW9kZSBmb3IgYQo+IHdoaWxlLCBidXQg
aXMgaGFzIG5vdCBiZWVuIGFkZGVkIHRvIHRoZSBWTSBsYXlvdXQgZG9jdW1lbnRhdGlvbi4gTGV0
Cj4gdXMgZml4IHRoYXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBy
aXZvc2luYy5jb20+Cj4gLS0tCj4gdjI6ICogQ29zbWVzdGljcyAoQWxleCkKPiAgICAgKiBDb3Jy
ZWN0ZWQga2FzYW4gYWRkcmVzcyAoQWxleCkKPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9yaXNjdi92
bS1sYXlvdXQucnN0IHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKQoKQXBwbGllZCwgdGhhbmtzLgoKam9uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
