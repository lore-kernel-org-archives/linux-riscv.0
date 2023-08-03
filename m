Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E68C04FE0
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 15:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jzMwbWOlqRD9o9EIJd70JcUGHGM/1+uQLLylQSISkeE=; b=E6pDa29vzXOFmP
	XhUKtcQJDlG7NmP8PvRatqYrGbyqrOYxHuMlq3thbR2PdgTXauWFiSLjC2l9RIZ831BB58rBRL+76
	LuFifE0dCjvNInjaTOHsD+cFiogVShEpZHOVY3rgokOiY4+azDnpK2GCXO6eDRbzQgbohwG3/fza+
	8QEbcfG6CGczcbcbTyG5KtsCFm7I7Xx65GiKH99zikh6UQAI+xOGjFSCO6tlqVGERTgFeFg5KPMbh
	FMLfPJQXdwEd1xWN2DEP1nzkMl1nHBVN0KbkKmswYJbM6uoxj2fN4fJXbzU/ONJlXOe156uZEdOcL
	Uh0KlEjE5Fhp4V4Y2q+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRZy9-00A44x-2H;
	Thu, 03 Aug 2023 15:10:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRZy5-00A3zb-0a
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 15:10:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 396ED61DF8;
	Thu,  3 Aug 2023 15:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3044BC433CC;
	Thu,  3 Aug 2023 15:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691075423;
	bh=Bc6FMyBSmmt68PuMIaZe74ztIlwvpCvXEsf9pVqRPi0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BfppFodXQG4Ktb6EhZHIPBqooLi/LExFd7off9h7u0/1W4pQ9qVvRc5SZ1INEMHUN
	 2VS8fcJm36U/jhFm8yn5UWmvKG7JjbrYGdYQI7nfHlU3gWmnmF+7gEZocMtj7cu7DB
	 RggSpSgAzIyAiaBiyIejkZQ69GJ/pFjs4/nh57C6xZGZVTukIuXpes+p/pncZkx2Kg
	 7oJhlYm1ixTLPyDOG9+P8yoMbSgbcb1+eHCICLZI/gJ7eLy8VUnbs/I3GilCUPXXEm
	 vTVNH7J/TPTfQXo0OqFLfueipFHFBoxDq52OnIiax8rVNUQs29M27XxkBl6KUH1plM
	 zSW1ohwd0tcvw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 13FAAC43168;
	Thu,  3 Aug 2023 15:10:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] selftests: riscv: Fix compilation error with
 vstate_exec_nolibc.c
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169107542307.19238.3370956488626231897.git-patchwork-notify@kernel.org>
Date: Thu, 03 Aug 2023 15:10:23 +0000
References: <20230713115829.110421-1-alexghiti@rivosinc.com>
In-Reply-To: <20230713115829.110421-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, shuah@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 andy.chiu@sifive.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_081025_278663_1EAD0DB3 
X-CRM114-Status: UNSURE (   9.61  )
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZml4ZXMp
CmJ5IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPjoKCk9uIFRodSwgMTMgSnVs
IDIwMjMgMTM6NTg6MjkgKzAyMDAgeW91IHdyb3RlOgo+IFRoZSBmb2xsb3dpbmcgZXJyb3IgaGFw
cGVuczoKPiAKPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gdnN0YXRlX2V4ZWNfbm9saWJjLmM6MjoK
PiAvdXNyL2luY2x1ZGUvcmlzY3Y2NC1saW51eC1nbnUvc3lzL3ByY3RsLmg6NDI6MTI6IGVycm9y
OiBjb25mbGljdGluZyB0eXBlcyBmb3Ig4oCYcHJjdGzigJk7IGgKPiBhdmUg4oCYaW50KGludCwg
Li4uKeKAmQo+ICAgIDQyIHwgZXh0ZXJuIGludCBwcmN0bCAoaW50IF9fb3B0aW9uLCAuLi4pIF9f
VEhST1c7Cj4gICAgICAgfCAgICAgICAgICAgIF5+fn5+Cj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9t
IC4vLi4vLi4vLi4vLi4vaW5jbHVkZS9ub2xpYmMvbm9saWJjLmg6OTksCj4gICAgICAgICAgICAg
ICAgICBmcm9tIDxjb21tYW5kLWxpbmU+Ogo+IC4vLi4vLi4vLi4vLi4vaW5jbHVkZS9ub2xpYmMv
c3lzLmg6ODkyOjU6IG5vdGU6IHByZXZpb3VzIGRlZmluaXRpb24gb2Yg4oCYcHJjdGzigJkgd2l0
aCB0eXBlCj4g4oCYaW50KGludCwgIGxvbmcgdW5zaWduZWQgaW50LCAgbG9uZyB1bnNpZ25lZCBp
bnQsICBsb25nIHVuc2lnbmVkIGludCwgIGxvbmcgdW5zaWduZWQgaW50KQo+IOKAmQo+ICAgODky
IHwgaW50IHByY3RsKGludCBvcHRpb24sIHVuc2lnbmVkIGxvbmcgYXJnMiwgdW5zaWduZWQgbG9u
ZyBhcmczLAo+ICAgICAgIHwgICAgIF5+fn5+Cj4gCj4gWy4uLl0KCkhlcmUgaXMgdGhlIHN1bW1h
cnkgd2l0aCBsaW5rczoKICAtIHNlbGZ0ZXN0czogcmlzY3Y6IEZpeCBjb21waWxhdGlvbiBlcnJv
ciB3aXRoIHZzdGF0ZV9leGVjX25vbGliYy5jCiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL3Jp
c2N2L2MvMjU2OTYwNjcyMDJmCgpZb3UgYXJlIGF3ZXNvbWUsIHRoYW5rIHlvdSEKLS0gCkRlZXQt
ZG9vdC1kb3QsIEkgYW0gYSBib3QuCmh0dHBzOi8va29yZy5kb2NzLmtlcm5lbC5vcmcvcGF0Y2h3
b3JrL3B3Ym90Lmh0bWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
