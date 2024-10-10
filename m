Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A772CCFC5E7
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 16:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zAvmIjh7Fv1ntru8mHovT4eSV5/0UNlAQo4aIsM6cT4=; b=uWrPhTmuF20/ZL
	Eoyg8KTwYimRQUVxRmj12PD/PSW0+6pkrhCYkcVtHy/shMzNkUve6rDxbjo750d4F3V5AR1FYrXaP
	YPToxKKvmE6zMaiqGGET3FOGglSOriIg81KFCQxzXWwkxq2+EWV8vko10HNyfTTndGawmWMSqyqXs
	1DOKzT/PIFx0+SyNVsZ+vtrjKzUJVKwx5iekk/tVdU58Wb3DwdPNFe4N+iT6HIYktUzLLGif3ou2H
	S5JNDCDe7Ln/50qJN+KWdrHQsOIwWUaYfekmRbKaIWjrAnOHkPsIW62VNKkaIXXaSK4/OkdujSOjL
	qzrkDSaIvPM+tsQxPJtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syw7y-0000000DXqI-0W29;
	Thu, 10 Oct 2024 16:35:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syvqI-0000000DUTM-2e4W
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 16:16:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C3A03A44B92;
	Thu, 10 Oct 2024 16:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE894C4CEC5;
	Thu, 10 Oct 2024 16:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728577005;
	bh=3c5Kt/iLXawGDWZ2PMV6WywGBrzzKss62a1eGMkGnhI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=a+GetVYtZZOhc6clCxaL0eFw3qhOhkdw68ZimCDwSUpT+iPvTJzcvVvk15OVkkGST
	 GBOzByWVDDuC3s/nNcMljOt9qBINt2yR0+Hd2VxIGiZCpezqR3IdmFA15/HoZXIevs
	 YkujiAqWcjQlHRrake0VNYHPKKfKkzEmrgJ0KiM43NKNoxwPua7y0y/p/fh9U3Wzh1
	 DvgODEtNNLC8qEfm07IxYEcotPwvj+TCYo0VrIjvolSLiwhMhPvXBAJAHuDmd/Jv0L
	 6wbtech9zRfAwOzDiySbqR8I+YJnnMlGB+AVNAoSL0CIjYnIV5OH4PfH6ft2x21uix
	 6gVo6tJrz+xDQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, linux-riscv <linux-riscv@lists.infradead.org>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Conor Dooley <conor@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>, Emil Renner Berthing
 <emil.renner.berthing@canonical.com>, Drew Fustini
 <dfustini@tenstorrent.com>, Arnd Bergmann <arnd@arndb.de>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: Github RISC-V CI (BoF follow-up)
In-Reply-To: <CAJ+HfNjwqMhAFUvKRsWEAD1BZNC19ouYmJ9XMNP2HrcyKo6Ltg@mail.gmail.com>
References: <CAJ+HfNjwqMhAFUvKRsWEAD1BZNC19ouYmJ9XMNP2HrcyKo6Ltg@mail.gmail.com>
Date: Thu, 10 Oct 2024 18:16:42 +0200
Message-ID: <87jzegrl05.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_091646_753053_08B23F2E 
X-CRM114-Status: UNSURE (   4.23  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBGb2xsb3dpbmcgdXAg
b24gdGhlIGRpc2N1c3Npb24gYXJvdW5kIENJIHRoYXQgY2FtZSB1cCBkdXJpbmcgUGx1bWJlcnMK
PiBSSVNDLVYgQm9GLgo+Cj4gVEw7RFI6IFRoZXJlJ3MgYSBDSSBydW5uaW5nIGJ1aWxkcy9hbmQg
dGVzdHMgZm9yIFJJU0MtVi4gQ2hlY2sgb3V0IFs0XSwKPiBpZiB5b3UncmUgYSBuaWNlIHBlcnNv
biwgdHJ5IHRvIGZpeCB3aGF0J3MgYnJva2VuLgoKSSBqdXN0IGFkZGVkIEFDUEkgKFUtQm9vdCkg
Ym9vdCB0ZXN0cyAoQUlBLCBhbmQgbm9uLUFJQSksIFBSRUVNUFRfUlQKZnJhZ21lbnQsIGFuZCBh
ICItY3B1PW1heCIgdmFyaWFudC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
