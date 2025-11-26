Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2319D10399
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 09:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mn1Oy7BS+vUARQ5+U6QlnQ1YLI5Zm6ocBPF7+1S1XwY=; b=Ozm18gntxjnP4E
	jdPzs1dI2lHpcTXqyB4j02kKcn0GC5fOunIsM1VykXqtL4RTX9l9N3+SoCfj4gvJibTh59K73Whuz
	SchYFPtn5HSXYosh829RHL8tbtCkth5ijS71H21OBhHiRrN7nCp4ov/mlIC/tdQECK1Jtej96GcFn
	QTDGEDpAGtjYLFQPlo0Xq6QtdIe35F6uSxmsldPAfXKCnxJUcPEYBdhuDBREx4b9Ju1DLMgyEXQh6
	+pdSkFKFoWHQhRJD0oS6GlsohK290TGJ0P4DdrEOVtu/4WiW0nklNrz/pVy4ywNJMsaUydirYN/wm
	GicKHlRJIt2zbRn46QkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBkt-0000000Ehgx-1jef;
	Wed, 26 Nov 2025 09:24:07 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBkq-0000000EhgK-3ohX
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 09:24:06 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764149040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7FqM5Wnnl94ag6oBJ+M9iRWwcQjsCvnH0zYX9MIORQ4=;
	b=rfQ1HFBpIxiilHt+KLt5NN4gD2z77WVeUtbZBGYvWOPZw92ny4Y2YgqSHbbWdE5R9+OM/h
	YVhadbJqtRrsluhHci9BZxNR4bLgYlzSIR9UpXYUxCTEL4fYeVWygi9sPcodFXI0RUBqGT
	4UPcW/Bu0hvSfsf1JHUaobeuCRRGZT9YqNH+1hqo2v+eamUOrnaCjX83EHs0N9zeZ5RdpM
	rZ320K4UmFF9YS7Th2L1I3QbFeYT2omORhHa+Uh6RnJBj7TQ5zgwYOZI+kFGKSkrxgZ03+
	ngF2UTjJLTf1gx5IJQAEOxSHB9dWZEd8FYzz18WQfa9WyjeDWQPh7i35fbk4hQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764149040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7FqM5Wnnl94ag6oBJ+M9iRWwcQjsCvnH0zYX9MIORQ4=;
	b=4ivR1zZoMegPK/lIsjIvbmYCvwob9gmJbbA4PW9nvwTHOrYhNgjPt4DNAuI7JYzhVoOQ3U
	kr4Qzd1+tL1KkyBw==
To: =?utf-8?B?6K645L2z5Yev?= <xujiakai2025@iscas.ac.cn>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH] riscv: fix KUnit test_kprobes crash when building with
 Clang
In-Reply-To: <738dd4e2.ff73.19a7cd7b4d5.Coremail.xujiakai2025@iscas.ac.cn>
References: <738dd4e2.ff73.19a7cd7b4d5.Coremail.xujiakai2025@iscas.ac.cn>
Date: Wed, 26 Nov 2025 10:23:59 +0100
Message-ID: <875xax5eq8.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_012405_091121_03FBA2CE 
X-CRM114-Status: UNSURE (   6.97  )
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

6K645L2z5YevIDx4dWppYWthaTIwMjVAaXNjYXMuYWMuY24+IHdyaXRlczoKPiBDbGFuZyBtaXNh
bGlnbnMgdGhlIHRlc3Rfa3Byb2Jlc19hZGRyZXNzZXMgYW5kIHRlc3Rfa3Byb2Jlc19mdW5jdGlv
bnMKPiBhcnJheXMsIG9yIGRvZXMgbm90IGV4cG9ydCBsb2NhbCBsYWJlbHMgYnkgZGVmYXVsdC4g
Qm90aCBjYW4gY2F1c2UKPiBrbWFsbG9jX2FycmF5KCkgYWxsb2NhdGlvbiBlcnJvcnMgYW5kIEtV
bml0IGZhaWx1cmVzLgo+Cj4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgaXNzdWUgYnk6Cj4gLSBBZGRp
bmcgLnNlY3Rpb24gLnJvZGF0YSB0byBleHBsaWNpdGx5IHBsYWNlIGFycmF5cyBpbiB0aGUgcmVh
ZC1vbmx5IGRhdGEgc2VnbWVudC4KPiAtIEFkZGluZyAuYWxpZ24gMyB0byBhbGlnbiBhcnJheXMg
dG8gOCBieXRlcy4KPiAtIEFkZGluZyAuZ2xvYmwgdG8gcHJvYmUgbGFiZWxzIHRvIGVuc3VyZSBz
eW1ib2xzIGFyZSB2aXNpYmxlLgoKV2UgZG8gbm90IGhhdmUgdG8gbWFrZSBpdCBleGFjdGx5IHRo
ZSBzYW1lIGFzIGJ1aWxkaW5nIHdpdGggR0NDLCByaWdodD8KT25seSBtb3ZpbmcgdGhlIGFycmF5
cyB0byAucm9kYXRhIHNlZW1zIHN1ZmZpY2llbnQgdG8gZml4IHRoZSBpc3N1ZSwgYnV0CkkgY2Fu
bm90IGV4cGxhaW4gd2h5IHlldC4KCldoYXQgSSBvYnNlcnZlZCBpcyB0aGF0IHdpdGggQ09ORklH
X1JFTE9DQVRBQkxFPXksIHRoZSBrZXJuZWwncwoucmVsYS5keW4gc2VjdGlvbiwgd2hpY2ggaG9s
ZHMgdGhlIHJlbG9jYXRpb24gZW50cmllcyBmb3IgdGhlIHR3bwphcnJheXMsIGhhdmUgaW5jb3Jy
ZWN0IGFkZHJlc3NlcyAodGhleSBhcmUgYWxsIGluY29ycmVjdGx5IG9mZnNldCBieSA2CmJ5dGVz
IGZvciBteSBidWlsZCkuIFRoZSBrZXJuZWwgdXNlcyB0aGVzZSByZWxvY2F0aW9uIGluZm9ybWF0
aW9uIHRvCmZpbGwgdGhlIGFycmF5cyBkdXJpbmcgYm9vdCwgYW5kIGZpbGwgdGhlbSBhdCB3cm9u
ZyBhZGRyZXNzZXMuCgpJIHNtZWxsIGEgbGlua2VyIHByb2JsZW0sIGJ1dCBtb3JlIGludmVzdGln
YXRpb24gbmVlZGVkLi4uCgpOYW0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
