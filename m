Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE81CD4958
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 05:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yrysdtIIPw7gI5ufGIB2EvhCxERa2Yf0wB3QJeINMk8=; b=XBBMaCLCdsnQUE
	oYAcUToTvuW/wYKTIGEL89IvvmZ+igzc9SjJo/E7beP+XlD0f05urI7HXHFMx6gUZOzvp6d63o3Gw
	LRP9ogTywL674XVv7pwn5mhjmzs/rLJA7YWu/pWj63AGb/WY2X9JSbqo/XxA5X6dd44N9p3STmbcl
	U0dzcU05ytKwGOB4i5IyEs1Ll8KDxPjQ1H+m8HiYGR/ahWc3h8FZH5kr7/LXhA4su0dOgZQZtIjmL
	G9ptmP1BOvDFcotUnnCzEOwVlFOzpvmOM0sQAq5dWlf7lfReB4juotfLYB2CKJYNPVl0scgLrqxNg
	mv7IhOk0QLNfdVL4xpKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChS-005Dpu-05;
	Thu, 21 Sep 2023 05:58:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjChO-005Doi-1X
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 05:58:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A9029B81E3C;
	Thu, 21 Sep 2023 05:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA92FC433CC;
	Thu, 21 Sep 2023 05:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695275878;
	bh=MLsGcIRXfwZgXJfU4dYy4+L26UPkpm/1q79i2tEWiLM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EB5CjlF/ICc3opR6zVvYCocFCSZN3miKYZKyOf7tbgYF9ef8NMm2Ay3yTw5JcEGgZ
	 Zwcp4wH4x7VgPjuTyiIi+Jk7o9DoTc4KEBav3LIku1p6lTb7JS2xKqNaXvyHZDGkjh
	 Y+bidq13Xm6DjQvYj12G1p+32CWlfVyi4ouhLeRrdZo9qgB/T1rws5VsAHxwABFlCU
	 T0DlbhZBfCjfNZxueqrPQ4NGHuIq6C0hYPrJP+Wio/8KEBMwmFIQSPsBgEdeG9pLyP
	 aPhX530k1r1ZTESvuEM99k6K3TPHmUpqoYAS0pRqYZ/EYGwLT3B9rrHDokUdfDVO5U
	 WweMzZztMfNvw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, Andy Chiu <andy.chiu@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, "Jason A . Donenfeld"
 <Jason@zx2c4.com>, Samuel Neves <sneves@dei.uc.pt>, =?utf-8?B?QmrDtnJu?=
 =?utf-8?B?IFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 6/6] riscv: Add BLAKE2s V implementation
In-Reply-To: <ZQSieofQfDY5mTlI@ghost>
References: <20230912115728.172982-1-bjorn@kernel.org>
 <20230912115728.172982-7-bjorn@kernel.org> <ZQSieofQfDY5mTlI@ghost>
Date: Thu, 21 Sep 2023 07:57:55 +0200
Message-ID: <87v8c4gja4.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_225802_667260_E54F648F 
X-CRM114-Status: UNSURE (   8.74  )
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

Q2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JpdGVzOgoKPj4gKy5tYWNy
byBWUk9SIFJFRyBCSVRTIFRNUFJFRwo+PiArCXZtdi52LnYJCVxUTVBSRUcsIFxSRUcKPj4gKwl2
c3JsLnZpCQlcUkVHLCBcUkVHLCBcQklUUwo+PiArCXZzbGwudmkJCVxUTVBSRUcsIFxUTVBSRUcs
IDMyLVxCSVRTCj4+ICsJdm9yLnZ2CQlcUkVHLCBcUkVHLCBcVE1QUkVHCj4+ICsuZW5kbQo+Cj4g
VGhpcyBzZWVtcyBsaWtlIGl0IHdvdWxkIGJlIGEgZ29vZCBjYW5kaWRhdGUgdG8gdXNlIHRoZSBa
dmtiIGV4dGVuc2lvbgo+IHRoYXQgaGFzIHZlY3RvciByb3RhdGUgWzFdLiBJdCB3b3VsZCBiZSBh
IHBhaW4gdG8gdXNlIGJlY2F1c2UgeW91IG5lZWQKPiB0d28gdmVyc2lvbnMgb2YgdGhlIHJvdW5k
bG9vcCwgYnV0IHlvdSBjb3VsZCBnZXQgYXdheSB3aXRoIDEgZXh0cmEKPiBicmFuY2gvbm9wIGFu
ZCBzYXZlIDMgaW5zdHJ1Y3Rpb25zIHBlciBWUk9SIHdoaWNoIGxvb2tzIGxpa2UgaXQgaGFwcGVu
cwo+IDgqMTAgdGltZXMsIHNvIDIzOSBmZXdlciBpbnN0cnVjdGlvbnMuCj4KPiBbMV0gaHR0cHM6
Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWNyeXB0by9yZWxlYXNlcwoKSW5kZWVkISBUaGFua3Mh
CgoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
