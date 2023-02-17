Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65A6C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 15:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=ABwhbA+bxZ0bH2RVcFTGLrTiVcjRHtZnyllsE8s7zmU=; b=LRd
	yC89Zsq5N1kNVk9ubX30WIfvEtyu2AO1o1XHp2+ac8t//vllW7tdEW5VY35ttKR56a4QZIfAFvsmJ
	oXNTXei3HfTT6vXzwoNuMOFqwmpTaL5rkyainsSkd7t/tCqMiQb1+wd8mvCONPq1WSK4EVBRHnYzJ
	kSTl/SChtDiIB+li9Sc/JzLXb4Ev9dP3/MvKEwKV8x5Xn+Kf1gjpqin0nSyJJ2KfmcSTz03LP9RtZ
	0ukeKF/nGAqFxAOwPZERJt+wsNA4TCTKTlLV+WrZjEuKoZmDDkqT6lkTztXv2Y/n5MrdPb3dWp7Th
	UKBa/GzPRCRdEqUy1mc4FfVP2q+gIHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT2Jk-00EkJM-2w; Fri, 17 Feb 2023 15:06:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT2Ao-00EfMR-Sd
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 14:57:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F27E461C30;
	Fri, 17 Feb 2023 14:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5798C4339B;
	Fri, 17 Feb 2023 14:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676645837;
	bh=BTFggd/Tt+eYMh7lG7jR9TXG1g1R8MGJ9JNjMNiGaD4=;
	h=From:To:Cc:Subject:In-Reply-To:Date:From;
	b=i049caV7QowGeYyrdkLo2D7kaH90CDnl/kJLMQvMx6LXEwaa60eKsV5DFFCk+T1OU
	 gesF9+EJKdUhEXCRH0YQ3cGkAlw8KAYxrVvk0t6SyETurpMYYV+H2qLNgSMDIBTEAE
	 Erg7vWUni8MpsyNL9TrX+xq09LF5ICFlqTFPjsjV3FDtqKyAJusbDT4/QQ7CYUYBVc
	 3aXUnJNGLy6MfL/CcDT0cUOR+/+uap4YfGqU+irMPimYuYGevTQwjtN5pDkE87E9uL
	 /tn8BPSYaLH9Jym1fa6rxX2EE8HIGfWB95raBC19SBWS7kAWatBSaOGgisbMnt7cbd
	 TFuNvxspTPNow==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, Andrey Konovalov
 <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-efi@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v4 6/6] riscv: Unconditionnally select KASAN_VMALLOC if
 KASAN
In-Reply-To: <20230203075232.274282-7-alexghiti@rivosinc.com>
Date: Fri, 17 Feb 2023 15:57:14 +0100
Message-ID: <877cwguyph.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_065718_994699_B6E62B96 
X-CRM114-Status: UNSURE (   5.30  )
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

QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IElmIEtB
U0FOIGlzIGVuYWJsZWQsIFZNQVBfU1RBQ0sgZGVwZW5kcyBvbiBLQVNBTl9WTUFMTE9DIHNvIGVu
YWJsZQo+IEtBU0FOX1ZNQUxMT0Mgd2l0aCBLQVNBTiBzbyB0aGF0IHdlIGNhbiBlbmFibGUgVk1B
UF9TVEFDSyBieSBkZWZhdWx0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxh
bGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3Ju
QHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
