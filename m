Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF391C38159
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 11:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=i9LqTDhPaiOovuukuzxuVbmmxOEIQ3ptUMo5huOWQe4=; b=Zdv
	VH48ZepLbC4mqYKnrwbkfTohSh0AuiqOkv4xhM4Myt8HQSVASGaHRp2kFmRFed5Q5g1z8jgSl2nPa
	LzQ+Q5C2/1fD/9zfXNEveVahMKh3UH9/lCzxokdwPoSFYzCdvvj4r1DFODcmjN1+HXWZsKixh4YZD
	YM+oBEfVcp5AKrbc1iOAS8gP0HQSbHY2q9GXKpbHvHg6XXcUn7WbmUgndyBlXj9DxxYv/RsURlA49
	UtLXWdPt006SiwnkTHY1CmAppZsog73QMg98yOzN56aENB7ZzfD6vJuUi73LDR+NU5U++qRLrqTa5
	ld2dzfuJtal6hO2GHWFHa5NeyWRNt4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI6JY-000Uss-U9; Wed, 18 Jan 2023 11:09:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI6JU-000Upa-JD
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 11:09:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 55A85B81C16;
	Wed, 18 Jan 2023 11:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA1B5C433D2;
	Wed, 18 Jan 2023 11:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674040139;
	bh=GvpUj3xLuNjjGGKiolsN/80QxOzBKhmKRzegY8kskMI=;
	h=From:To:Cc:Subject:In-Reply-To:Date:From;
	b=isWW50P9c2NFbryW876/62nH0oCkqVQLrurvR60LsZMO8Zwbz93UNRmzM/k4UgZ0b
	 8v44oYLfomS+fDexpJqmNRPd7P2DkqP6u1/4TOJr6myOLVVP0WPG8ARtIrX0BobzyC
	 2l9+gDdTsf2OD+rXNE4Zzx/cMqC2GIJc1CzABzhLhwAZqScD44zAU33osq/2mwV3PS
	 QnoyZuQlzRJ8ac3kOoFM/Jvv+CnD+osBHEF21XcfflTxKFTnO9Q09HKBTi0Dan9be7
	 LHlK5JOgw3V+E60nkQNPoFl7rFdCT+zegQW2s4Z5sSGN59BeDZkRqfNS+ZrrVsDr7j
	 8hHkOc+JliylQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Andreas Schwab <schwab@linux-m68k.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: Add instruction dump to RISC-V splats
In-Reply-To: <CAMuHMdXi7yEiS73YhQAQKqj+3rTCNmuRrdnNKS4prvG96Xgqog@mail.gmail.com>
Date: Wed, 18 Jan 2023 12:08:56 +0100
Message-ID: <87pmbcnlpz.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_030904_840393_58B06AFD 
X-CRM114-Status: GOOD (  10.42  )
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

R2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JpdGVzOgoKPj4gK3N0
YXRpYyB2b2lkIGR1bXBfa2VybmVsX2luc3RyKGNvbnN0IGNoYXIgKmxvZ2x2bCwgc3RydWN0IHB0
X3JlZ3MgKnJlZ3MpCj4+ICt7Cj4+ICsgICAgICAgY2hhciBzdHJbc2l6ZW9mKCIwMDAwICIpICog
MTIgKyAyICsgMV0sICpwID0gc3RyOwo+PiArICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkciA9IHJl
Z3MtPmVwYzsKPgo+IEdpdmVuIHlvdSBuZXZlciB1c2UgdGhpcyBhcyBhbiB1bnNpZ25lZCBsb25n
LCB3aGF0IGFib3V0Cj4KPiAgICAgY29uc3QgdTE2ICppbnNucyA9ICh1MTYgKilpbnN0cnVjdGlv
bl9wb2ludGVyKHJlZ3MpOwo+Cj4gc28geW91IG5vIGxvbmdlciBuZWVkIGNhc3RzIGJlbG93PwoK
SW5kZWVkISBHb29kIHN1Z2dlc3Rpb24sIHRoYW5rIHlvdSEgSSdsbCBkbyB0aGlzIGNoYW5nZSBp
biB2My4KCj4+ICsgICAgICAgbG9uZyBiYWQ7Cj4+ICsgICAgICAgdTE2IHZhbDsKPj4gKyAgICAg
ICBpbnQgaTsKPj4gKwo+PiArICAgICAgIGZvciAoaSA9IC0xMDsgaSA8IDI7IGkrKykgewo+PiAr
ICAgICAgICAgICAgICAgYmFkID0gZ2V0X2tlcm5lbF9ub2ZhdWx0KHZhbCwgJigodTE2ICopYWRk
cilbaV0pOwo+PiArICAgICAgICAgICAgICAgaWYgKCFiYWQpIHsKPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcCArPSBzcHJpbnRmKHAsIGkgPT0gMCA/ICIoJTA0aHgpICIgOiAiJTA0aHggIiwg
dmFsKTsKPj4gKyAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHByaW50aygiJXNDb2RlOiBVbmFibGUgdG8gYWNjZXNzIGluc3RydWN0aW9uIGF0IDB4JWx4
LlxuIiwKPgo+ICVweCwgc28geW91IGNhbiBkcm9wIHRoZSBjYXN0IHRvIGxvbmcgYmVsb3cuCgpN
dWNoIGNsZWFuZXIuIFRoYW5rcyEKCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
