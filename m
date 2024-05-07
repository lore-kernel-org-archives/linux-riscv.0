Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3667CC10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 14:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gsClwQI7QxenxcOvrvFgvMSjRKmOAPrMx7zifg0UQQE=; b=kEz8eNc/BfixKh
	X2HfWk0yKAIWG0vIty3sqdOr++q2ARCL8eWRmMOvdFLz5gfdY7aFF56LTkF6ZboYln34rTC21jyJr
	v0Dd53HRy3qqesxHyX1ajFny9iTH/NwQ6jVKL1vOa+ElCl9nNLaeECGtRuKryScWdc4A5pZG3Q2Kq
	5OzGylbFKJ0CcfQyqU6cEZkX0XvS4FWaUEhhIimZkAUyUqvc8X+9lxE3tkS1FVZKGQd6SwxW1CInr
	TfPNhrzga9S30Igtu5FaX0yNjjNrkVLixmzX+bomD/gunULTsGc8a3u0gChkeDikkhX6seowYWNaQ
	ojWU72GzxAoyoZrRLzpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4LmV-0000000BUSP-1iyF;
	Tue, 07 May 2024 14:26:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4LmS-0000000BUQE-1q4I
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 14:26:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE39561794
	for <linux-riscv@lists.infradead.org>; Tue,  7 May 2024 14:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95DA4C4AF68
	for <linux-riscv@lists.infradead.org>; Tue,  7 May 2024 14:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715092015;
	bh=lYrQrnCSDVMAZMcY6WaFG+KBzi8OpV4qLgKv1Deazgw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QzhZpYxxRD7X41gFhOocwbf9cskiPbVsNmPoadZK2uRX/1ukfzajz9KEmN7IfvQS5
	 Cd1bWG/YcHCiZVpgKs5mqQu2B117nTRvKc9mbrvUyZeuEveKT/QffiBSUPQ3SaNvqN
	 5wHINKJ+2PJcdVbAy3KuuXk4DJ1t0NB+MIMXwoXdlwjCPsMpAwPqCALE7iPJxsoHa6
	 EEmjBtRFDFdM9ME4cMa5vxBvL7RGePSSRcw2+BNhNqG/mMSCGt8uXF/ZSsVJS4kKvq
	 iAEunH9gr1S5neq0Iy4faWnd21ZhNRKMOAaQ67Qv13ZNPtWqEWDe8oPsfDZny+iXfs
	 J2wNkPM6ybvIQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51f4d2676d1so3582896e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 07:26:55 -0700 (PDT)
X-Gm-Message-State: AOJu0YwpEUeE8QAVlAYIoycWgkf7xGt0tSvXZPQbCitQ+oZfnvulyiyI
	/wZZaOPz9F36cOWTCjPz7AOm3WiwY1Yg4vEBXt4iVxMbwUlTXp01ihTXl7eMh1RJYC7IZMbYFBS
	7DlgEYsS7Ik4F6WBi6giPY5OMQDE=
X-Google-Smtp-Source: AGHT+IHs4kKfrAUEx7t0s1MVsgWGje/LfqkGEHnXw4rWGq9/3VHuD/mMGzeQ5DHF1TvYMzSpucR1cpweLSSuqCMr4RI=
X-Received: by 2002:a05:6512:3da3:b0:521:684:ce1b with SMTP id
 k35-20020a0565123da300b005210684ce1bmr2905088lfv.20.1715092014346; Tue, 07
 May 2024 07:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240504193446.196886-1-emil.renner.berthing@canonical.com> <20240504193446.196886-3-emil.renner.berthing@canonical.com>
In-Reply-To: <20240504193446.196886-3-emil.renner.berthing@canonical.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 7 May 2024 23:26:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ30jMv9FUQaf5kGRG+FTsn0pB=ydeMUPTxbZ2aSHZ4LQ@mail.gmail.com>
Message-ID: <CAK7LNAQ30jMv9FUQaf5kGRG+FTsn0pB=ydeMUPTxbZ2aSHZ4LQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: show help string for riscv-specific targets
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Nick Terrell <terrelln@fb.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_072656_538585_58278629 
X-CRM114-Status: UNSURE (   7.96  )
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

T24gU3VuLCBNYXkgNSwgMjAyNCBhdCA0OjM04oCvQU0gRW1pbCBSZW5uZXIgQmVydGhpbmcKPGVt
aWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+Cj4gRGVmaW5lIHRoZSBh
cmNoaGVscCB2YXJpYWJsZSBzbyB0aGF0ICdtYWtlIEFDUkg9cmlzY3YgaGVscCcgd2lsbCBzaG93
Cj4gdGhlIHRhcmdldHMgc3BlY2lmaWMgdG8gYnVpbGRpbmcgYSBSSVNDLVYga2VybmVsIGxpa2Ug
b3RoZXIKPiBhcmNoaXRlY3R1cmVzLgo+Cj4gVGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9y
bkByaXZvc2luYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRW1pbCBSZW5uZXIgQmVydGhpbmcgPGVt
aWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+Cj4gLS0tCgpSZXZpZXdlZC1ieTogTWFz
YWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4KCgotLSAKQmVzdCBSZWdhcmRzCk1h
c2FoaXJvIFlhbWFkYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
