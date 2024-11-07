Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC00D43369
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 14:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XH8SBG8IDH7S+Uqg7v8wH7mChrzn1qkoKnYo2egE8DQ=; b=TVuSyBHaUuXy7M
	frAMc8cgogyOuhkMFnB+DgTH80qADRedaX2MglmlWQzyHdG7R8IKRMAEngkJw9rQZ+OUGsONEQpaZ
	lhSSMycBHujjieDEaht0/iut8sv3ure5SQC+hohXn5kCSVejU3IhX9Ohe0KbNTZTpLXiO/r6CmU4o
	uEG2nCyJjTOxmuHVwAMELs0ibZkOX7ynKcrrW1xzhcd4GriIuHE37S2MIKGeBAJEgg201T70KNVsV
	lYMODZ9tQjZ8bFwHV9DbC5q+QaPuE9Sr3xb7GwisIqoFuHcSJCR5OGwHBqSm7OPxx28HqnT6xYxhN
	Nvr1enK9U2u4B3M5kDfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t93ZC-00000007Hpk-1sVU;
	Thu, 07 Nov 2024 14:32:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t93Z9-00000007HpD-3AZ2
	for linux-riscv@lists.infradead.org;
	Thu, 07 Nov 2024 14:32:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00EC7A44475
	for <linux-riscv@lists.infradead.org>; Thu,  7 Nov 2024 14:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BBEFC4AF09
	for <linux-riscv@lists.infradead.org>; Thu,  7 Nov 2024 14:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730989974;
	bh=DvkB/sbaZRLhctzLM3g42ELdV1YVsM1roN6Nkn42Otk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=U4CBsTDQ4hYvaI45hMbB3EXSH3dlqUr6xzbauezqLMIv2EjJw2wUIbhj3OxDDleYr
	 hANQijAsuTpmNiWH6OgW5jL6xMn1sIIGSxnLpBEdkY3dxzZvNjNBomWPqWFTI+wm1y
	 lVGfbDt9mGsg/gRd3glbvUvFxYiUMWbzPkLZ98Tc6j2IN4qi/FogRRbMFtsetjQkKY
	 O5RDoiGnWCWbbvfoalTOWLG0oknV/MXE6lMXKBxa6HVXd6bibkTplyCbzJA2xcRea3
	 jTwCbtezdRkCxiwGbT7KjQFWBfVgX4Le4KMAXouiFJnWo3cGFGmW71fFNmauzMoT7/
	 m/voWpidyFxnQ==
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6cbe68f787dso6025786d6.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Nov 2024 06:32:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXeyu+FxRkkOTarMKqROniPRsdVM8GeqCUy04jyWt/9PiFbIEJvCPex+pmg/T/Jwsbulbhh4Lc48Ns9YQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx55+myXgnKPzBgfXGGQzhTE9mefHhVfJ+bQQZ/ZCfj+Mwzjwat
	Ge54ecyeI/YG+iMNwQ9h4qx3RrY7qfkxkFkF/xOxXKrnHPG7nmLz53/5JxKlwkJ5YRvVTltRil1
	RO2LSQbFMt4V512tJvTKIVk1UlyA=
X-Google-Smtp-Source: AGHT+IHUCLtFQ8IuQTRLh1fcgLhAN5eLbq9UIfP6whxl0V14vWJHVvz6l3hhBZU79uygYdnjqGmoYxDIzrGp2K4+w/k=
X-Received: by 2002:a05:6214:4198:b0:6cb:ef22:6274 with SMTP id
 6a1803df08f44-6d39cf9cdcemr1411926d6.3.1730989973620; Thu, 07 Nov 2024
 06:32:53 -0800 (PST)
MIME-Version: 1.0
References: <20240927131355.350918-1-bjorn@kernel.org> <172835823300.66789.3704854116445399222.git-patchwork-notify@kernel.org>
 <87bjyvpa6h.fsf@all.your.base.are.belong.to.us> <CAEf4BzZbq9OwSGi4pdb5_q8YkErfFiQFKYXg3g1rjpdejafx+Q@mail.gmail.com>
In-Reply-To: <CAEf4BzZbq9OwSGi4pdb5_q8YkErfFiQFKYXg3g1rjpdejafx+Q@mail.gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Thu, 7 Nov 2024 15:32:42 +0100
X-Gmail-Original-Message-ID: <CAJ+HfNjiuhOyw2r9+e=CRMXrq_NjP5Sq4oT1tc_vhTZ_HkY7zQ@mail.gmail.com>
Message-ID: <CAJ+HfNjiuhOyw2r9+e=CRMXrq_NjP5Sq4oT1tc_vhTZ_HkY7zQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] libbpf: Add missing per-arch include path
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: patchwork-bot+netdevbpf@kernel.org, andrii@kernel.org, eddyz87@gmail.com, 
	mykolal@fb.com, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	bjorn@rivosinc.com, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	charlie@rivosinc.com, Andreas Schwab <schwab@suse.de>, Anand Moon <linux.amoon@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_063255_879128_5D0A9AC0 
X-CRM114-Status: UNSURE (   9.05  )
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

T24gV2VkLCA2IE5vdiAyMDI0IGF0IDIzOjA0LCBBbmRyaWkgTmFrcnlpa28gPGFuZHJpaS5uYWty
eWlrb0BnbWFpbC5jb20+IHdyb3RlOgo+IEknbSBzb3JyeSwgYnV0IHVuZm9ydHVuYXRlbHkgaXQn
cyB0b28gbGF0ZSBub3cgdG8gbW92ZSB0aG9zZSBwYXRjaGVzCj4gYXMgaXQncyBub3cgYmVlbiBt
b3JlIHRoYW4gYSBtb250aCBzaW5jZSB0aGV5IGxhbmRlZC4gRm9yIHRoZSBmdXR1cmUsCj4gcGxl
YXNlIGxldCB1cyBrbm93IEFTQVAgaWYgeW91IHRoaW5rIHBhdGNoZXMgd2VyZSBtaXNyb3V0ZWQu
IEkgdGhpbmsKPiB3ZSBhcmUgc3R1Y2sgd2l0aCB0aGUgbmVlZCB0byBkbyBhIHN0YWJsZSBiYWNr
cG9ydCBmb3IgdGhlc2UsIHNvcnJ5LgoKWWVhaCwgcmVhbGl6ZSB0aGF0IGl0J3MgcmVhbGx5IGxh
dGUuIFRoYW5rcyBmb3IgZ2V0dGluZyBiYWNrLCBhbmQKbm90ZWQgZm9yIHRoZSBmdXR1cmUuCgpD
aGVlcnMsCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
