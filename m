Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89EFEB64DD
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 06:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FyRIpxzNbyY2lks0duDq1su6hV0mgQC2GK0AQNq4K7o=; b=wy0+Va9fxEjpSV
	Pp0XqAAJCIGt4ZWvpAxyVa2GbYVTPst9lvif5ZSTdJTnL81anzz6jhN92ajFX/nHpEnnEmVbmh6ma
	VNEUIAKYaeSaDDOaoZP8Pkd264gjZ/xNPQTwI+GY3lLzgAeq9ykhMZZC5JCx8P16KBTSimPvhlgTf
	xouctR+zeFeY67wt9UsS+rxqL7iEDG3w4fvxcA/sUtpNrD2vW8+yzeXbXfy/q+tv831wCURxCPVjk
	yCvbjuXvYeT28ACYUmdvmRAVvJBzFPkN+MHQRyjmLrd+VSumKRiujB8g+SqSs1FC1CcpUHBIRCL/l
	i2OXKhPyGI2KpFJ9u4bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGDB0-009Tkw-1g;
	Mon, 03 Jul 2023 06:36:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGDAy-009Tk8-0Z
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 06:36:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AF98960D3E;
	Mon,  3 Jul 2023 06:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7DFC433C7;
	Mon,  3 Jul 2023 06:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688366202;
	bh=UBJc1auuOFFqvw5warnQODe8BuMVkWvGCoyhmOm3m2o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hUWZeNfBu6atkNDe2zOlByfT5AtCmGTcbwIOBL1Cb61CjjOUhLRbMuIxdtRrukK2K
	 ROIL+eJjO6UIT4CJWK3q8QjnFx1uk2L1Y+12iW+3bR67o1+7r5LzLqnFJANJLmm1Xe
	 fPPml0S3pekKtrd7TRD93WSRJPvhchW8DDVdFonnEljD8IdeIekNdQyqMslu0Vp2x/
	 Dy25yWrRRzSY6DaPtQgDKFNtj+3GSIoJWKf+MB50tJ0zSYnqcyQADNg038pKlT1plC
	 +x6d60jfXuksl9MN+le6Fume9/5l/UBMv2jLaiAZApG7zMwoTF8Tx5tD0YulNcj7hK
	 QG71EKMY/JcFQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Alexey Dobriyan <adobriyan@gmail.com>,
 linux-fsdevel@vger.kernel.org, Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH 0/2] Two cross-compilation kselftest fixes
In-Reply-To: <20230629162301.1234157-1-bjorn@kernel.org>
References: <20230629162301.1234157-1-bjorn@kernel.org>
Date: Mon, 03 Jul 2023 08:36:38 +0200
Message-ID: <87ilb11oy1.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_233644_278888_89B301DD 
X-CRM114-Status: UNSURE (   8.37  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBGcm9tOiBCasO2cm4g
VMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4KPiBXaGVuIHlvdSdyZSBjcm9zcy1idWlsZGlu
ZyBrc2VsZnRlc3QsIGluIHRoaXMgY2FzZSBSSVNDLVY6Cj4KPiAgIHwgbWFrZSBBUkNIPXJpc2N2
IENST1NTX0NPTVBJTEU9cmlzY3Y2NC1saW51eC1nbnUtIE89L3RtcC9rc2VsZnRlc3QgXAo+ICAg
fCAgIEhPU1RDQz1nY2MgRk9STUFUPSBTS0lQX1RBUkdFVFM9ImFybTY0IGlhNjQgcG93ZXJwYyBz
cGFyYzY0IHg4NiBcCj4gICB8ICAgc2d4IiAtQyB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cyBnZW5f
dGFyCj4KPiB0aGUgY29tcG9uZW50cyAocGF0aHMpIHRoYXQgZmFpbCB0byBidWlsZCBhcmUgc2tp
cHBlZC4gSW4gdGhpcyBjYXNlLAo+IG9wZW5hdDIgZmFpbGVkIGR1ZSB0byBtaXNzaW5nIGxpYnJh
cnkgc3VwcG9ydCwgYW5kIHByb2MgZHVlIHRvIGFuCj4geDg2LTY0IG9ubHkgdGVzdC4KPgo+IFRo
aXMgdGlueSBzZXJpZXMgYWRkcmVzc2VzIHRoZSBwcm9ibGVtcyBhYm92ZS4KClNodWFoLAoKQWxl
eGV5IHN1Ym1pdHRlZCBhIHNlcmllcyBbMV0gdGhhdCBtYWtlcyB0aGUgMm5kIHBhdGNoIG9mIHRo
aXMgc2VyaWVzCnVubmVjZXNzYXJ5IC4gSXQncyBvbiBBbmRyZXcncyAtbW0gdHJlZS4KClBhdGNo
IDEgaXMgc3RpbGwgcmVsZXZhbnQuIEkgZ3Vlc3MgaXQgY2FuIGdvIHZpYSB5b3VyIHRyZWUsIG9y
IHRoZQpSSVNDLVYgdHJlZS4KCgpCasO2cm4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyMzA2MzAxODM0MzQuMTc0MzQtMi1hZG9icml5YW5AZ21haWwuY29tLwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
