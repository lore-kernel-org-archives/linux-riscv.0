Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B0A105F7A8
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 13:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zaHJURqqox0PZfE9bNxgXNPZR05uUGdaPuZIJtp6TlY=; b=v31T2kHSSC4Dd9
	308oahD0Ax1oRe41y3GH7JqC0tSdnk8gPnWWKDadQ3t6F84tO3H+Z0Yb8HXrQltcJF3UCXUbfqKUi
	YRgMLBwTtl+J6vlZcA5yBZWxzXtJnEF06k/9hrd5xNG5a/QX/6EunTtAccFbVF28MDKEl9Pn0oCh/
	7M6heEXPF2pbccW2KoxEPt5oAf3+sFLppCQPuCHjDgFrRRU++ezUnR8tM1ax4mMnpYTyFkKrQ3PfA
	fpyx1Rl3CW8PRLLklqJVyS0epy9u8A9iobxIiPrRZLEAUwapEbeL45ZUlhT/ahfJSgMYwLOglNnFJ
	C8h54Gw3JG9Ko7fs1qNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12wC-00000000KCk-2HJ1;
	Fri, 13 Mar 2026 13:52:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12wA-00000000KCS-1Yam
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 13:52:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1633242AEE
	for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 13:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA265C2BC87
	for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 13:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773409941;
	bh=VoeqO83H0UC5AMfVMLZGLXHpXTuKkVEN28onYYM0e0Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gJ42Ya8SpvaNC28gvCAHFDsAx15eoupSMJp/rmvu5z1FH99JIL3dTI3fIzDRiu5dY
	 UjEbncK64UfhpOuvfSoipxgwP51+XkZePVRRMJ1eB/2KRiauzpbiRK2emnGfaV6cco
	 qURUqgUIFQAxnregyMQMvRhYyA2JPoz7Z5U42kLdBLySyOwnblso8ICG71syuXRzt7
	 nwD6TLELLPnYzuVSLxB+L+nCknQW7VOSvWFAcIN2fzY7AazRyWg8rPlYivYmDqLO2j
	 KIV+SY7HwfRq5jQtaoskrAzJjgqHCcR5cQ4zZHyYEzEMZluykLcbm+W9uJ2W0nMVOo
	 lFR2+9Evr5QAQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38a67221fe8so19031661fa.3
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 06:52:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1k82DpMKDCoO4XH+OtQwuGpcYM+ZNrQiE3tiKUFh3BkzHJjzCd+43ChGdRxQDW/8ThJo+1hYiFMtNPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxvmJg3buUE1bz7p2GpMfETncoIcHHnmUXv9zarhRZw45HDV5g
	bIOuX+n5VlFbxFefm7R2ppSyOoMldcp7ysCrvhiDO8Z8ca35Yw/rv9slAW8HjAytSfJNjlWm5Xi
	q+ghWdJljNXbqROBERRQpgA70jRnVTmJlvgrjZz94wQ==
X-Received: by 2002:a2e:bd14:0:b0:38a:422d:b644 with SMTP id
 38308e7fff4ca-38a897bd810mr10674181fa.23.1773409940424; Fri, 13 Mar 2026
 06:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech> <20260312-k1-gpio-set-config-v1-1-8c3541da16b1@pigmoral.tech>
In-Reply-To: <20260312-k1-gpio-set-config-v1-1-8c3541da16b1@pigmoral.tech>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 13 Mar 2026 14:52:06 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfjA=SPOhcLiNu6L+ZgRm5Adr1kBEw7Ma-zTOdQ1dJ5Gg@mail.gmail.com>
X-Gm-Features: AaiRm52YNR1dZVEn8jJuthdZGp7ne06EpwHE1_pZx_PFXg-Rre7dkHe2Q-4rKok
Message-ID: <CAMRc=MfjA=SPOhcLiNu6L+ZgRm5Adr1kBEw7Ma-zTOdQ1dJ5Gg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: spacemit: return -ENOTSUPP for unsupported
 pin configurations
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Linus Walleij <linusw@kernel.org>, Yixun Lan <dlan@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_065222_450535_E12D2405 
X-CRM114-Status: UNSURE (   6.69  )
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

T24gVGh1LCBNYXIgMTIsIDIwMjYgYXQgOTo0M+KAr0FNIEp1bmh1aSBMaXUgPGp1bmh1aS5saXVA
cGlnbW9yYWwudGVjaD4gd3JvdGU6Cj4KPiBSZXR1cm4gLUVOT1RTVVBQIGluc3RlYWQgb2YgLUVJ
TlZBTCB3aGVuIGVuY291bnRlcmluZyB1bnN1cHBvcnRlZCBwaW4KPiBjb25maWd1cmF0aW9uIHBh
cmFtZXRlcnMuIFRoaXMgaXMgbW9yZSBsb2dpY2FsIGFuZCBhbGxvd3MgdGhlIEdQSU8KPiBzdWJz
eXN0ZW0gdG8gZ3JhY2VmdWxseSBoYW5kbGUgdW5zdXBwb3J0ZWQgcGFyYW1ldGVycyB2aWEgZnVu
Y3Rpb25zIGxpa2UKPiBncGlvX3NldF9jb25maWdfd2l0aF9hcmd1bWVudF9vcHRpb25hbCgpLCB3
aGljaCBzcGVjaWZpY2FsbHkgaWdub3Jlcwo+IC1FTk9UU1VQUCBidXQgdHJlYXRzIG90aGVycyBh
cyBmYWlsdXJlLgo+Cj4gU2lnbmVkLW9mZi1ieTogSnVuaHVpIExpdSA8anVuaHVpLmxpdUBwaWdt
b3JhbC50ZWNoPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRv
c3ouZ29sYXN6ZXdza2lAb3NzLnF1YWxjb21tLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
