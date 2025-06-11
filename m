Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E30C71133
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 09:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HM7ig274cnMtB5GMcyaLixdONnvpdpUXIyeVOWB2B94=; b=LTBK7Js/QD9sfH
	8gCbI7XMuJ7iWgc5l/L9I4lxI5bwEyf4RlrqitKRaVqyq7GkTZ446jWLTWuXPq7KSyuRNjoBHR0oZ
	/GqBZYR2vDHar4mYme2jqcUpDGfeelL6/ul5Hx0+EZ6TZpPHj2OJC74Un1711ZR3m0EMd6JYSzcZU
	d473k65xeTdcEdqUd7JTaoeacxJsW70ZtLvSM6ZibpnS02PusOxEayYvgldCLt8CFtVsyy3VFyIIH
	ZQ3U+wpK13xwGh6LULH9PncVwnpScLy4qzdudLqvQxmoezLONr4TiEdcd3i4Wi36iJYu/F1rFnuEe
	LQd+DUA5sXwtcuSUynSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHfj-00000009SFo-2WdQ;
	Wed, 11 Jun 2025 09:23:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHfB-00000009S84-3v38
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 09:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=J0wTJl4RIVSFj/J21gRTDQ3w5OE3XK4ggTZJSCDLD2I=; b=O5SEUhRbc28V2bUOze7/TNOXYY
	BolVT0PfwqCyu/X7jGRVClINaRcw6Xktq/q+N/zj2FI3EO74YINd7iRkxBKZ+ETBW140F0kKp9ywe
	pRPNLTBpvjBJL27lEisWwPdkIX3OSGsoQ6Mm+iO2Kd+BK2Xhco2a6OvksodWuhp/SMKyyylCs2RpC
	rzxQcftivmzXLlMTs9qnJTkMAk9847GZyT/KNsH+KP45WDnXtSXFwMn4B8OLXHDjyVrRnLEmBr1zA
	xRDrYW0PQr4+Wx39Q43KJzd4O71x00t3hEVFj+WNQmePcSfOjbPf2VFVI2Ofw/WLLOoCahG8LoqhW
	6yur8QJQ==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHf9-00000002EB8-3Qil
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 09:22:29 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749633745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J0wTJl4RIVSFj/J21gRTDQ3w5OE3XK4ggTZJSCDLD2I=;
	b=GL6NHJdh8oRCBHoc0pCvwGt+FMm6CmPZDaSPIyv0AwYaPhxb6cgvtH+x7vJMNVY1OvbVAI
	0Fcd0Mg5z7ACVlsKkKr9GLrbmp/yN6erZB9Dqysrq4OJ5Wp5KOgoHP7NEjAup6dOP20C8+
	Qj+nQ+46L5YgUEr8Cv78NgVN7B8FVAJZgeIQcMtleDiPCobxuF791zte11xQITQbB5DbJP
	qEkaZ7pqplVdht4OWG2xF9S46mLE85l7rmEMx26hg5dh0fevA7HHj2iBN0hE4s6ycTm9M3
	V7o+ysyNJ6bKBnaNaWJpGv8ctCgNrT1J8rRDGZC3cRjx3oxsP4gTKds75cdnJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749633745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J0wTJl4RIVSFj/J21gRTDQ3w5OE3XK4ggTZJSCDLD2I=;
	b=/7HqhDUo5GHztwH4u2uOVsaIcikw4P3TFVxK9YTQ1WvyeNbCBVTlHRglhhFUb3ok/wdW/N
	137plfNu6ojVANAg==
Date: Wed, 11 Jun 2025 11:22:14 +0200
Subject: [PATCH v3 3/3] vdso: Reject absolute relocations during build
MIME-Version: 1.0
Message-Id: <20250611-vdso-absolute-reloc-v3-3-47897d73784b@linutronix.de>
References: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
In-Reply-To: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749633741; l=2264;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=mIAtGDHPvKeYdgafPU461SwU1pvMX0e9L3qKBEtEQp4=;
 b=saA8vG7G5+nuYZSAIasKPk5cLM4d6JKHzQ2YGvNfixdyOAnpwSO6H7XzKmIVedADkizpqv1bb
 jU+UQS4HuWOD3hih0qgzsdHbpqtAnSo8QNwysBfBekBxh9MTlcW2DV1
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_102227_985603_A4311598 
X-CRM114-Status: UNSURE (   9.78  )
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

QWxsIHZEU08gY29kZSBuZWVkcyB0byBiZSBjb21wbGV0ZWx5IHBvc2l0aW9uIGluZGVwZW5kZW50
LgpTeW1ib2wgcmVmZXJlbmNlcyBhcmUgbWFya2VkIGFzIGhpZGRlbiBzbyB0aGUgY29tcGlsZXIg
ZW1pdHMKUEMtcmVsYXRpdmUgcmVsb2NhdGlvbnMuIEhvd2V2ZXIgdGhlcmUgYXJlIGNhc2VzIHdo
ZXJlIHRoZSBjb21waWxlciBtYXkKc3RpbGwgZW1pdCBhYnNvbHV0ZSByZWxvY2F0aW9ucywgYXMg
dGhleSBhcmUgdmFsaWQgaW4gcmVndWxhciBQSUMgRFNPIGNvZGUuClRoZXNlIHdvdWxkIGJlIHJl
c29sdmVkIGJ5IHRoZSBsaW5rZXIgYW5kIHdpbGwgYnJlYWsgYXQgcnVudGltZS4KVGhpcyBoYXMg
YmVlbiBvYnNlcnZlZCBvbiBhcm02NCB1bmRlciBzb21lIGNpcmN1bXN0YW5jZXMsIHNlZQpjb21t
aXQgMGMzMTRjZGE5MzI1ICgiYXJtNjQ6IHZkc286IFdvcmsgYXJvdW5kIGludmFsaWQgYWJzb2x1
dGUgcmVsb2NhdGlvbnMgZnJvbSBHQ0MiKQoKSW50cm9kdWNlIGEgYnVpbGQtdGltZSBjaGVjayBm
b3IgYWJzb2x1dGUgcmVsb2NhdGlvbnMuClRoZSBjaGVjayBpcyBkb25lIG9uIHRoZSBvYmplY3Qg
ZmlsZXMgYXMgdGhlIHJlbG9jYXRpb25zIHdpbGwgbm90IGV4aXN0CmFueW1vcmUgaW4gdGhlIGZp
bmFsIERTTy4gQXMgdGhlcmUgaXMgbm8gZXh0ZW5zaW9uIHBvaW50IGZvciB0aGUKY29tcGlsYXRp
b24gb2YgZWFjaCBvYmplY3QgZmlsZSwgcGVyZm9ybSB0aGUgdmFsaWRhdGlvbiBpbiB2ZHNvX2No
ZWNrLgoKRGVidWcgaW5mb3JtYXRpb24gY2FuIGNvbnRhaW4gbGVnYWwgYWJzb2x1dGUgcmVsb2Nh
dGlvbnMgYW5kIHJlYWRlbGYgY2FuCm5vdCBwcmludCByZWxvY2F0aW9ucyBmcm9tIHRoZSAudGV4
dCBzZWN0aW9uIG9ubHkuIE1ha2UgdXNlIG9mIHRoZSBmYWN0CnRoYXQgYWxsIGdsb2JhbCB2RFNP
IHN5bWJvbHMgZm9sbG93IHRoZSBuYW1pbmcgcGF0dGVybiAidmRzb191XyIuCgpMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9sa21sL2FBcEdQQW9jdHFfZW9FMmdAdDE0dWx0cmEvCkxpbms6
IGh0dHBzOi8vZ2NjLmdudS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTEyMDAwMgpTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25p
eC5kZT4KLS0tCiBsaWIvdmRzby9NYWtlZmlsZS5pbmNsdWRlIHwgNiArKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIvdmRzby9NYWtlZmlsZS5p
bmNsdWRlIGIvbGliL3Zkc28vTWFrZWZpbGUuaW5jbHVkZQppbmRleCBjZWRiZjE1ZjgwODc0ZDRi
YjI3YzA5NzI0NGJjNWIxMTI3MmYyNjFjLi4wNDI1N2QwZjI4YzBlZDMyNGUzMWFkYmI2ODQ5NzE4
MTA4NTc1MmY4IDEwMDY0NAotLS0gYS9saWIvdmRzby9NYWtlZmlsZS5pbmNsdWRlCisrKyBiL2xp
Yi92ZHNvL01ha2VmaWxlLmluY2x1ZGUKQEAgLTEyLDcgKzEyLDEzIEBAIGMtZ2V0cmFuZG9tLSQo
Q09ORklHX1ZEU09fR0VUUkFORE9NKSA6PSAkKGFkZHByZWZpeCAkKEdFTkVSSUNfVkRTT19ESVIp
LCBnZXRyYW5kCiAjCiAjIEFzIGEgd29ya2Fyb3VuZCBmb3Igc29tZSBHTlUgbGQgcG9ydHMgd2hp
Y2ggcHJvZHVjZSB1bm5lZWRlZCBSXypfTk9ORQogIyBkeW5hbWljIHJlbG9jYXRpb25zLCBpZ25v
cmUgUl8qX05PTkUuCisjCisjIEFsc28gdmFsaWRhdGUgdGhhdCBubyBhYnNvbHV0ZSByZWxvY2F0
aW9ucyBhZ2FpbnN0IGdsb2JhbCBzeW1ib2xzIGFyZSBwcmVzZW50CisjIGluIHRoZSBvYmplY3Qg
ZmlsZXMuCiBxdWlldF9jbWRfdmRzb19jaGVjayA9IFZEU09DSEsgJEAKICAgICAgIGNtZF92ZHNv
X2NoZWNrID0gaWYgJChSRUFERUxGKSAtclcgJEAgfCBncmVwIC12IF9OT05FIHwgZ3JlcCAtcSAi
IFJfXHcqXyI7IFwKIAkJICAgICAgIHRoZW4gKGVjaG8gPiYyICIkQDogZHluYW1pYyByZWxvY2F0
aW9ucyBhcmUgbm90IHN1cHBvcnRlZCI7IFwKKwkJCSAgICAgcm0gLWYgJEA7IC9iaW4vZmFsc2Up
OyBmaSAmJiBcCisJCSAgICAgICBpZiAkKFJFQURFTEYpIC1yVyAkKGZpbHRlciAlLm8sICQocmVh
bC1wcmVyZXFzKSkgfCBncmVwIC1xICIgUl9cdypfQUJTLip2ZHNvX3VfIjsgXAorCQkgICAgICAg
dGhlbiAoZWNobyA+JjIgIiRAOiBhYnNvbHV0ZSByZWxvY2F0aW9ucyBhcmUgbm90IHN1cHBvcnRl
ZCI7IFwKIAkJCSAgICAgcm0gLWYgJEA7IC9iaW4vZmFsc2UpOyBmaQoKLS0gCjIuNDkuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
