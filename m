Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5D5C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 07:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XfBQJJ5wJg3DLitxgbAbXvlG50tngDNgpJmWd4BPy+g=; b=CHmfNtqSLNeNte
	rSTHX6qkfyfWll4BH7NuQj4VC68IkL9oh5aaNz57xZevpkkCWBtv+e+DvdkQCvWXd4ppOI85nB5KE
	YkjyhkMvzQYHIVZ61NY3ZwL3NXM+aT0DjXg8CNOJFczKGLucM0+qSwklPrrWTz6HciQBWSO1hKKS7
	nAw7g5STqNNrN/RU0S4dxI/ZcScXePEm3IjLWBnpTgG87CmczvICgXplXm6hVSl1zyRbn5hzYP1CO
	1XrZ2QNoG9Zy96bTiv6Ml4+CWhQ/kwTHsZ34oksopIAXqaPpuzlf7hi14Mz2fbGArTwGaPUTM+cum
	MhxESe8VPsPDgaCEOZYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4d56-009Klt-35; Mon, 12 Dec 2022 07:18:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4d4q-009KfB-Vx
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 07:18:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C6120B80B6B;
	Mon, 12 Dec 2022 07:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930DCC433EF;
	Mon, 12 Dec 2022 07:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670829493;
	bh=HhgAx6952Z9nYKnYTtBIl7A9R8rM/sJD3+XUZwGcCTs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nTAnbi0XG4ppR6DuVf8l2jlqBAC+S227UY7PaYU534ldzCQNpzF4RJ8YAnx3LvrZq
	 7xOy+3tSXwRq5bGme/5eV8zaIWpnyZfrKSdMS9XavWQPLWdX7j40VeuHBL2GKUk9X/
	 Xld2DFuG/vaPx7r8/yyIqNxpJsLp9phM9SxQ1XTMnN1/KcsN62wz5JBWFndygSZuxM
	 CGjBHAblahY2GLl9XQVD56ldB9nGrcTzahOIvAhMveyR2oRg9zTW8v4rubrkZAiHKB
	 EycTX9jxCO9EVLjrP8aSm0MuR1ylpNPSiAkKaiKKgT6tC/MNXL/PuPYPSHDemIbE+g
	 iFRhSf9g1tqWg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: guoren@kernel.org, arnd@arndb.de, guoren@kernel.org,
 palmer@rivosinc.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, conor.dooley@microchip.com, heiko@sntech.de,
 jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org,
 chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org,
 paul.walmsley@sifive.com, mark.rutland@arm.com, greentime.hu@sifive.com,
 andy.chiu@sifive.com, ben@decadent.org.uk
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH -next V11 0/7] riscv: Add GENERIC_ENTRY support
In-Reply-To: <20221210171141.1120123-1-guoren@kernel.org>
References: <20221210171141.1120123-1-guoren@kernel.org>
Date: Mon, 12 Dec 2022 08:18:08 +0100
Message-ID: <87o7s9ay4v.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_231817_218079_F330DB41 
X-CRM114-Status: GOOD (  10.03  )
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

Z3VvcmVuQGtlcm5lbC5vcmcgd3JpdGVzOgoKPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXgu
YWxpYmFiYS5jb20+Cj4KPiBUaGUgcGF0Y2hlcyBjb252ZXJ0IHJpc2N2IHRvIHVzZSB0aGUgZ2Vu
ZXJpYyBlbnRyeSBpbmZyYXN0cnVjdHVyZSBmcm9tCj4ga2VybmVsL2VudHJ5LyouIFNvbWUgb3B0
aW1pemF0aW9uIGZvciBlbnRyeS5TIHdpdGggbmV3IC5tYWNybyBhbmQgbWVyZ2UKPiByZXRfZnJv
bV9rZXJuZWxfdGhyZWFkIGludG8gcmV0X2Zyb21fZm9yay4KPgo+IFRoZSAxLDIgYXJlIHRoZSBw
cmVwYXJhdGlvbiBvZiBnZW5lcmljIGVudHJ5LiAzfjcgYXJlIHRoZSBtYWluIHBhcnQKPiBvZiBn
ZW5lcmljIGVudHJ5Lgo+Cj4gQWxsIHRlc3RlZCB3aXRoIHJ2NjQsIHJ2MzIsIHJ2NjQgKyAzMnJv
b3RmcywgYWxsIGFyZSBwYXNzZWQuCj4KPiBZb3UgY2FuIGRpcmVjdGx5IHRyeSBpdCB3aXRoOgo+
IFsxXSBodHRwczovL2dpdGh1Yi5jb20vZ3VvcmVuODMvbGludXgvdHJlZS9nZW5lcmljX2VudHJ5
X3YxMQoKRldJVywgdGhlIHYxMSBicmFuY2ggaXMgbm90IGF2YWlsYWJsZSBoZXJlLgoKVGhpcyBz
ZXJpZXMgaXMgYSByZWFsbHkgbmljZSBjbGVhbnVwIGZvciB0aGUgUklTQy1WIGVudHJ5IGNvZGUu
IEkndmUgcnVuCml0IG9uIHNvbWUga2VybmVsIHNlbGZ0ZXN0cywgYW5kIGhhdmVuJ3Qgc2VlbiBh
bnkgaXNzdWVzLgoKSSdtIGxvb2tpbmcgZm9yd2FyZCB0byBoYXZpbmcgdGhpcyBzZXJpZXMgcHVs
bGVkIGluIQoKUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
