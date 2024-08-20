Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2BFC3DA4A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 09:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7zoooOAOwXa12CRmlXPJJOlnp5Q688bhCJ/i4OiPu6Q=; b=apzfVp9AFp1btb
	icA5RsqIwzh2EaL3h3p8vklSfT9xc8EBsChKyf5/O5IZXQFWfoNwWhc1QlviJhw1mHxTOAxi/tQao
	zSzNHl0lmLb1H0sOMCGIJaVAt6I10u9dC6x6GkZWVsLlxkU5SPUNFgVWGB2mEXv4Nol+pvN4xZjoP
	yrEf4Qsyv3hsran/5KzBqxa9IaDeYOgHal86NPfu5vc+y+SFJgBoXKNvYt8y19/GplBlkb0Or5ahf
	pt1D8VNZ8JOkxlRaTYgmmBdgn2NGduPin7ljvqpMHDBGbEOzt7pE7GLXe7RUXbBGq/pq8i5337DmW
	h2ZkFyWwB+wHZ78Tiaow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgL3R-00000004Xb1-3acS;
	Tue, 20 Aug 2024 09:21:29 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgL1k-00000004XIj-1cPl
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 09:19:45 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-39d3b31e577so12132075ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Aug 2024 02:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1724145583; x=1724750383; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwPbfctzRfZa2/zhqSrtwrO42MOMX85GRmKfc11Yv8c=;
        b=FYNu7g4Sv1qvCVYiVMFVviPC5/PFz22VBLLiovXf5eN7N52VViIEtmcQ088yC49cQ0
         3b2s+yNL9QG5PcxKaLCYQkoiP7xQLztA1X6bePpEz+q/hBj7OVqyDb2YN3BnwipDMJlM
         aAK/GDjX7Z2CGOTIF/+x/0aoZ/YeTAr9M+a+Xul8kaqlqwTotIj4y0eWuV+pzUufX5ch
         DpFdnI3mE4oMR4tKEn2T6OppCDyR0eShhbmoZixZgSLHqoLQnslUx5qNdiIgYSOOLRH8
         aVF7fsgw2n4ByDDLmHLYmL8j79kT3RW55/qE6bfWYuO3X3F/fqRdQpge/4cM+R8lR4fU
         wt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724145583; x=1724750383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zwPbfctzRfZa2/zhqSrtwrO42MOMX85GRmKfc11Yv8c=;
        b=D3IMmysXFtMdo5bNTaZ7pBF1r1MfLCutudfciG4xnfulwNidShBRJTw6g4Kq7RfGq1
         ja1oUFX6pHss8W3qe0JQYg0JvqtHGSlFPKwfV64/31zmWD6ybKndsb0T7/6ASHyJiSQv
         jQL5AFDgm8mUWYSoAWtZrDQctkyjQcEwu2twMnIKWeJ1+GBgCGF5CFWMsaMaLglgFQ2n
         RL4Vsmd/QprQNjOo1Eh12CEtazQy6+2UItC73/1tB94OjJU5RtVm++FcrnyEHsU6IyvV
         XHZtovDU6mTSfsbb+G+RftelYn6pEuSlglg5EDsLeuPK+EGGTjtjwqP0HvMfSjZR+Avu
         fF0w==
X-Forwarded-Encrypted: i=1; AJvYcCX4sx/OGWhB86SAyDzu7L+0vAnb6+/QmmQkcfQRPGtTw4QpgsI4KiqlPUce2yKDP3C4pDkoHz991BZEYZRSJKzHnTMmYKgGZRIT4g/4Grwm
X-Gm-Message-State: AOJu0YwMST0blZTQHRXRvU7vBqlw7KjQ1IyJYZdgftO4S4pPkcz2Crr+
	qQ/R/rquGH2OPrJAilUzZRE6aUozw6tTx3mK/6JlM6bfeRYCM595CVOSmn1wf+BYNosnwGH7a/1
	fcDqfm/8z5XyhWMr0S59tnKraWqSIxUXyyeJYxA==
X-Google-Smtp-Source: AGHT+IExX7dzgemFOY+5Vhm6vcIRzonwTa1j3n/gS7/d7T+aopXOQDlPfujd3coFGkXkPVCcQNAlbebtpfJSDbgjJjI=
X-Received: by 2002:a05:6e02:1fcf:b0:39b:1ed5:4a55 with SMTP id
 e9e14a558f8ab-39d26d64ac5mr163368045ab.24.1724145583225; Tue, 20 Aug 2024
 02:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <a5a628d6-81d8-4933-81a8-64aad4743ec4@stanley.mountain>
In-Reply-To: <a5a628d6-81d8-4933-81a8-64aad4743ec4@stanley.mountain>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 Aug 2024 14:49:31 +0530
Message-ID: <CAAhSdy1n54TxAiPHwrRBmvNZrijoFGXbgq3xb8LXVtPCD8udow@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-aplic: Fix an IS_ERR() vs NULL bug in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_021944_717621_EE2B47CF 
X-CRM114-Status: GOOD (  16.91  )
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

T24gVHVlLCBBdWcgMjAsIDIwMjQgYXQgMjoxMuKAr1BNIERhbiBDYXJwZW50ZXIgPGRhbi5jYXJw
ZW50ZXJAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBUaGUgZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jl
c291cmNlKCkgZnVuY3Rpb24gZG9lc24ndCByZXR1cm4gTlVMTCwgaXQKPiByZXR1cm5zIGVycm9y
IHBvaW50ZXJzLiAgRml4IHRoZSBlcnJvciBoYW5kbGluZyB0byBtYXRjaC4KPgo+IEZpeGVzOiAy
MzMzZGY1YWU1MWUgKCJpcnFjaGlwOiBBZGQgUklTQy1WIGFkdmFuY2VkIFBMSUMgZHJpdmVyIGZv
ciBkaXJlY3QtbW9kZSIpCj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBl
bnRlckBsaW5hcm8ub3JnPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJy
YWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAgZHJpdmVycy9pcnFjaGlwL2ly
cS1yaXNjdi1hcGxpYy1tYWluLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAv
aXJxLXJpc2N2LWFwbGljLW1haW4uYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMt
bWFpbi5jCj4gaW5kZXggMjhkZDE3NWI1NzY0Li45ODFmYWQ2ZmI4ZjcgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1tYWluLmMKPiArKysgYi9kcml2ZXJzL2ly
cWNoaXAvaXJxLXJpc2N2LWFwbGljLW1haW4uYwo+IEBAIC0xNzUsOSArMTc1LDkgQEAgc3RhdGlj
IGludCBhcGxpY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+Cj4gICAgICAg
ICAvKiBNYXAgdGhlIE1NSU8gcmVnaXN0ZXJzICovCj4gICAgICAgICByZWdzID0gZGV2bV9wbGF0
Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOwo+IC0gICAgICAgaWYgKCFyZWdzKSB7Cj4g
KyAgICAgICBpZiAoSVNfRVJSKHJlZ3MpKSB7Cj4gICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2
LCAiZmFpbGVkIG1hcCBNTUlPIHJlZ2lzdGVyc1xuIik7Cj4gLSAgICAgICAgICAgICAgIHJldHVy
biAtRU5PTUVNOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihyZWdzKTsKPiAgICAg
ICAgIH0KPgo+ICAgICAgICAgLyoKPiAtLQo+IDIuNDMuMAo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
