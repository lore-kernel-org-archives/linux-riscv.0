Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD5CC74A5B
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 01:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3v2lpaNw3uKSIDc3PoS9pn/DpLHpKVd7ze4cSwtr05c=; b=PluuG7IxY/MbGG
	p5zx8dpy8UcmibVobYxRfqr70QH+XlOmg8xnogfoSpi9w8RA46UeqNVQfovztOut5F62k7IeA2ml3
	wAsRsT7K9LBd2206MqtCnbCLu5PYq4F7ZrHlI6BYGoz23j+BNR12Dw6KkVK9hGUD9kEtVFU87+jEo
	p0A2uXSkQBdzItfWgn/1r2hNYPcqCtuehTvP+DcI3jKAbK3vmMtG6eN6tgAvLbvNRYZe1gBMSZxFb
	CTXmy6R9WvhZDNfG+tzbiDvj+vY+4B8BsbQuQjGuIkKxREkwzrrDNd3xcs8axlhV66oHnbyZXgFBC
	/mjV9UOzMmovkzjrgDhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfWal-003L0W-2h;
	Fri, 24 Mar 2023 01:51:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfWaj-003Kzo-1E
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 01:51:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 483806280B
	for <linux-riscv@lists.infradead.org>; Fri, 24 Mar 2023 01:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0EAC433EF
	for <linux-riscv@lists.infradead.org>; Fri, 24 Mar 2023 01:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679622698;
	bh=562mzg4DKxEFcXpT10oV3Fv8EOb4PoGIVjP7MJVtugI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hOvjAJSqrY6VAyDbWUNOwN9iOCKw52nN7MQG521xAhJwr1jyZ91oxsA4HicDtp9BR
	 oFrSmf6O1xZ6OW1F2M+84NbRl42pwgGwmOsq9XmOuFl+sJk7v9xJKWTs0K/tfdEq/N
	 OPagqeNvn1gBOgfPlHWI1DO9K3RV2z8mK87TQd72v5PM3yMp7t5/NhinIOy/RlQXRa
	 4OgvWzFIqekVoGpKj8lGfcwnyG2RJOk6It/hX6iK1kr7Nbjp/Bf6UJm+ItP2oX+4L4
	 7/4eTFLInyh15fPjT90FKo16AcTH3A6vM9WxlQhcMrfZcYHjHeycN01t9IVXqhAJJe
	 HbcpZunC1dBfA==
Received: by mail-ed1-f48.google.com with SMTP id ew6so2247288edb.7
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 18:51:38 -0700 (PDT)
X-Gm-Message-State: AAQBX9erxLsypT28wP6WR302rOTiyoPvwh1dmlvuauYDXSiEv9EH3D3X
	ngqJBLZbtqLquc0BpS3zvtwjrY35aJLwdsJprZw=
X-Google-Smtp-Source: AKy350a8ZsoaLtzsT+Jmiama3H0sRDs5CyX0uD1V0/Lvmf7UCZqwH3Gl3UzK4SQj1HbLPDciHeCFNeooe7RuIn/BqyY=
X-Received: by 2002:a50:a6d7:0:b0:4fa:71a2:982b with SMTP id
 f23-20020a50a6d7000000b004fa71a2982bmr528130edc.0.1679622697009; Thu, 23 Mar
 2023 18:51:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230222033021.983168-1-guoren@kernel.org> <20230222033021.983168-2-guoren@kernel.org>
 <87ilesu9mr.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87ilesu9mr.fsf@all.your.base.are.belong.to.us>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 24 Mar 2023 09:51:25 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQHk_RxLuCkO+pxnaGj_iR5WNyxfRJgpDf5r-yNVccA-A@mail.gmail.com>
Message-ID: <CAJF2gTQHk_RxLuCkO+pxnaGj_iR5WNyxfRJgpDf5r-yNVccA-A@mail.gmail.com>
Subject: Re: [PATCH -next V17 1/7] compiler_types.h: Add __noinstr_section()
 for noinstr
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	mark.rutland@arm.com, ben@decadent.org.uk, palmer@dabbelt.com, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Lai Jiangshan <laijs@linux.alibaba.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Kees Cook <keescook@chromium.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_185141_499142_81F674F9 
X-CRM114-Status: GOOD (  12.63  )
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

T24gV2VkLCBNYXIgMjIsIDIwMjMgYXQgMTA6NDbigK9QTSBCasO2cm4gVMO2cGVsIDxiam9ybkBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IGd1b3JlbkBrZXJuZWwub3JnIHdyaXRlczoKPgo+ID4gRnJv
bTogTGFpIEppYW5nc2hhbiA8bGFpanNAbGludXguYWxpYmFiYS5jb20+Cj4gPgo+ID4gVXNpbmcg
X19ub2luc3RyX3NlY3Rpb24oKSBkb2Vzbid0IGF1dG9tYXRpY2FsbHkgZGlzYWJsZSBhbGwKPiA+
IGluc3RydW1lbnRhdGlvbnMgb24gdGhlIHNlY3Rpb24uIEluaGliaXRpb24gZm9yIHNvbWUKPiA+
IGluc3RydW1lbnRhdGlvbnMgcmVxdWlyZXMgZXh0cmEgY29kZS4gSS5FLiBLUFJPQkVTIGV4cGxp
Y2l0bHkKPiA+IGF2b2lkcyBpbnN0cnVtZW50aW5nIG9uIC5ub2luc3RyLnRleHQuCj4KPiBHdW8s
IHRoZSBnZW5lcmljIGVudHJ5IHNlcmllcyBkb2Vzbid0IGFwcGx5IGNsZWFubHkgb24KPiByaXNj
di9mb3ItbmV4dCA+Ni4yLXJjMSwgYW5kIHRoaXMgcGF0Y2ggaXMgdGhlIGlzc3VlLgoKSXQgaGFz
IGJlZW4gbWVyZ2VkIGluIHBhbG1lci9mb3ItbmV4dC4KClRoeCBmb3IgdGFraW5nIGNhcmUuCgo1
NGIzOTQ4ZjM4MWMgKEhFQUQgLT4gZm9yLW5leHQsIHBhbG1lci9mb3ItbmV4dCkgTWVyZ2UgcGF0
Y2ggc2VyaWVzCiJyaXNjdjogQWRkIEdFTkVSSUNfRU5UUlkgc3VwcG9ydCIKNDViMzJiOTQ2YTk3
IHJpc2N2OiBlbnRyeTogQ29uc29saWRhdGUgZ2VuZXJhbCByZWdzIHNhdmluZy9yZXN0b3JpbmcK
YWI5MTY0ZGFlMjczIHJpc2N2OiBlbnRyeTogQ29uc29saWRhdGUgcmV0X2Zyb21fa2VybmVsX3Ro
cmVhZCBpbnRvIHJldF9mcm9tX2ZvcmsKMGJmMjk4YWQyYjYxIHJpc2N2OiBlbnRyeTogUmVtb3Zl
IGV4dHJhIGxldmVsIHdyYXBwZXJzIG9mCnRyYWNlX2hhcmRpcnFzX3tvbixvZmZ9CmYwYmRkZjUw
NTg2ZCByaXNjdjogZW50cnk6IENvbnZlcnQgdG8gZ2VuZXJpYyBlbnRyeQpkMGRiMDJjNjI4Nzkg
cmlzY3Y6IGVudHJ5OiBBZGQgbm9pbnN0ciB0byBwcmV2ZW50IGluc3RydW1lbnRhdGlvbiBpbnNl
cnRlZAo4NTc0YmY4ZDBkZGQgcmlzY3Y6IHB0cmFjZTogUmVtb3ZlIGR1cGxpY2F0ZSBvcGVyYXRp
b24KCj4KPiBDb3VsZCB5b3UgZG8gYSByZXNwaW4gKHBvdGVudGlhbGx5IHcvbyB0aGlzIHBhdGNo
KT8KPgo+Cj4gQ2hlZXJzLAo+IEJqw7ZybgoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
