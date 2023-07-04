Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE8BEB64DC
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 02:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4WbRRksb7Gcdw+iyKGXorQ3gqUU3G1BGdQFE0NdAGD4=; b=osHsgbqKrPkYSj
	DTtOJON2WVWPrbUcpKjau0jhYmg7OTZOJ2elYtSMJToczR2V47VTzPSjyKvVJNi4nT9OSkzOqsSaN
	IgfS9+bVii99iPpMgdHchruU9cUruWyUk8jD2ppTvYk9wXIKm3WSZyc8c+zN5N9T//0g6F4/RysxG
	ke+PltVVwKjhk8gLzBovkmXBgv1pFdxmOrDK9OctWWapcUJVlFDwg8Or5F1YvIMFnkRIR0P13iVc2
	QFQAN0iyV/IqqcuDTVZtRCTU9NCLg4dVUwjoEqlv0D+kInSaQWSKFVY3QHCjlIoMA6bwqskwr0jSV
	UbpE4FVwaWKdcnJ36rrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGW1t-00BxAB-24;
	Tue, 04 Jul 2023 02:44:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGW1q-00Bx8l-3D
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 02:44:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4C8EB6105A
	for <linux-riscv@lists.infradead.org>; Tue,  4 Jul 2023 02:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6417C433CA
	for <linux-riscv@lists.infradead.org>; Tue,  4 Jul 2023 02:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688438673;
	bh=2ry2wUhl2WMVG4MRkJi45ZsW532TaR/pjwLU5mXIfCc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aUl4cSCdJ5X6MX+W9I6drCrKeZmGSl6GzooJIZypbQTlDHqr4ImgrQEpRIT8Dcved
	 8MdYMw9HIjUfPjCI0NOfuis66CtqorcguJgknN8X1yF9BlOG1FBqrnhxBVR0IWfU2H
	 MPY5+cBgNJxmwy5zLjlL4oFYVaxXIlhvBd9Ral0So+k+XEQ7xCHnltOf4w3m4SGOmJ
	 RheQR9TXRmaD0bycOPZHRA7PhHqnwP7bfRZZtZmgEtoaphrs/xcrlse7mik7Xys19k
	 k4+btCNNsl4wfnMmaqVG/dk2c38gCCF3Q12vzUQlDgTQ98RylCtNZClEgOcUUklDwQ
	 invRhiirGygFg==
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fbc5d5746cso55752605e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 19:44:33 -0700 (PDT)
X-Gm-Message-State: AC+VfDxL88rl3gkJ3RsccpBs56Sj7KOqQAJ1ySuAN6UbSU2+DY/7VcXW
	a6TTsP4o7sdJOXlA/DBK1Gn/OhYmq/EYRYTh3hs=
X-Google-Smtp-Source: ACHHUZ4aICqMI3CbW0/Bc26b7AmiXVkfoxo3S3bhnlDZvksxazD60nP7rp2uYQWqnW0Wj0S1IRug7Xj5k09eDMHD3tE=
X-Received: by 2002:a05:600c:2305:b0:3f8:c70e:7ed1 with SMTP id
 5-20020a05600c230500b003f8c70e7ed1mr11186990wmo.20.1688438672057; Mon, 03 Jul
 2023 19:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230702025708.784106-1-guoren@kernel.org> <20230703102941.GA4328@aspen.lan>
In-Reply-To: <20230703102941.GA4328@aspen.lan>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 4 Jul 2023 10:44:20 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTaeO_u1tuHyCmWKptvg=W52gLY2xue2DbnbC6kihPTog@mail.gmail.com>
Message-ID: <CAJF2gTTaeO_u1tuHyCmWKptvg=W52gLY2xue2DbnbC6kihPTog@mail.gmail.com>
Subject: Re: [PATCH] riscv: entry: Fixup do_trap_break from kernel side
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	mark.rutland@arm.com, bjorn@kernel.org, palmer@dabbelt.com, 
	bjorn@rivosinc.com, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, stable@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_194435_074937_FA9B241F 
X-CRM114-Status: GOOD (  16.22  )
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

T24gTW9uLCBKdWwgMywgMjAyMyBhdCA2OjI54oCvUE0gRGFuaWVsIFRob21wc29uCjxkYW5pZWwu
dGhvbXBzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBTYXQsIEp1bCAwMSwgMjAyMyBhdCAx
MDo1NzowN1BNIC0wNDAwLCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+IEZyb206IEd1byBS
ZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+Cj4gPiBUaGUgaXJxZW50cnlfbm1pX2Vu
dGVyL2V4aXQgd291bGQgZm9yY2UgdGhlIGN1cnJlbnQgY29udGV4dCBpbnRvIGluX2ludGVycnVw
dC4KPiA+IFRoYXQgd291bGQgdHJpZ2dlciB0aGUga2VybmVsIHRvIGRlYWQgcGFuaWMsIGJ1dCB0
aGUga2RiIHN0aWxsIG5lZWRzICJlYnJlYWsiIHRvCj4gPiBkZWJ1ZyB0aGUga2VybmVsLgo+ID4K
PiA+IE1vdmUgaXJxZW50cnlfbm1pX2VudGVyL2V4aXQgdG8gZXhjZXB0aW9uX2VudGVyL2V4aXQg
Y291bGQgY29ycmVjdCBoYW5kbGVfYnJlYWsKPiA+IG9mIHRoZSBrZXJuZWwgc2lkZS4KPgo+IDxz
bmlwPgo+Cj4gPiBGaXhlczogZjBiZGRmNTA1ODZkICgicmlzY3Y6IGVudHJ5OiBDb252ZXJ0IHRv
IGdlbmVyaWMgZW50cnkiKQo+ID4gUmVwb3J0ZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVs
LnRob21wc29uQGxpbmFyby5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5A
bGludXguYWxpYmFiYS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2Vy
bmVsLm9yZz4KPiA+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4KPiBJIHB1c2hlZCB0aGlz
IHRob3VnaCB0aGUga2dkYiB0ZXN0IHN1aXRlIHRoYXQgb3JpZ2luYWxseSBmb3VuZCB0aGUKPiBw
cm9ibGVtIChhbHRob3VnaCBpdCBkaWRuJ3Qgb2NjdXIgdG8gbWUgd2hlbiBJIHJlcG9ydGVkIGl0
IHRoYXQKPiB0aGUgcHJvYmxlbSB3YXMgbm90aGluZyB0byBkbyB3aXRoIGtnZGIgOy0pICkuIFNv
IEZXSVc6Cj4KPiBUZXN0ZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxp
bmFyby5vcmc+ClRoeCBmb3IgdGhlIHJlcG9ydCAmIHRlc3RlZC1ieS4KCj4KPgo+IERhbmllbC4K
CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
