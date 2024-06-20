Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2F1C27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 10:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=olpgL0mK98CJlAvm4QlPqVQde3TnJ7bBYqbDkeqt03E=; b=TYrN+2r+bDjysw
	ERoGT0T2StNNR8gjITak+HzpyZoEwYbmMHnDBpLTCn9RZIqUOUTB6rkezQ1dFozpyQYJEubu57xHl
	+5r1a6dtd3AHHEWDcfPMOywyHNeIzK2rKmAykzXqjll5fFbDL90kOxSuZB/gdEyyGn83/wNehNJEJ
	M564MTzUIOFeCqx7/5VYg8WMaVpiYuXWOtzmu4NPbFCMRIzMijsR3fUOhBGrkyaq34juNbE1QjsIe
	uFvfrtzXs5zplzW2+X1InvVWrR61J6bsQ7SCHGnxdt+c74BxryYO1PEyzdLRrtLmDtn06KFpL/fee
	8crfxIop8L5w88pAnILA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEhQ-00000004VB1-0N8i;
	Thu, 20 Jun 2024 10:07:24 +0000
Received: from mail-lj1-f172.google.com ([209.85.208.172])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEhM-00000004V9n-1cfv
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 10:07:21 +0000
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ebec2f11b7so7082651fa.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jun 2024 03:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718878031; x=1719482831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ir1hVcg7ykDi/DMYCtyM630+t+MR02LhBXB13vEhoEE=;
        b=IaawrFiEbPR9hBJ9Uu2t65V6ThFnlOgadRh4V4Rgfsb0w7G+FVzX/54hT7kO32KwNO
         VXUT4rTOVI4mZI/lhQiR1FBgcLCvlq0OlQMalQb72G6wkX/SfOkXCs5anNjDemlKEIvN
         LicFjNh0BGxwHZ3G9yohZ5FQHvJRTY32BGivRUqnrBkRf4GY5SWnFqArOIU8TgS/vkEB
         bouMxPVi5Yy23yxI1pHMBJOLIjAbVwJ654l8+OuE0zf3q/4jbL9Pxh1b129KX9qlYKqO
         GYz9sK5pDA4WV20XitLpyNAdxX8pQ8yEaUAvmmzgqfIOXYM4R6MIwb+NWL8z5gTVSDFf
         Vbyw==
X-Forwarded-Encrypted: i=1; AJvYcCXovMe6IC7WdF6ek3lMeIS5tO9t9Qcy7Lxb4sbg/fmRwRkX7xv1AuPlMsI6lgHn1Bbrbrs+VO5MELFhO8AQV0E3k6cgeO4mAXHpr5Y/qzaT
X-Gm-Message-State: AOJu0YztApMq2NNaEkCoz360TErPRag5JVw5LOO6RqedvjHpltMrmhVc
	H47fczMDWS6tjmS37RmIJMIGeKORIs7ry57bKF+CXDHy8cqVLBDzXTlDJQjd
X-Google-Smtp-Source: AGHT+IHHe1CWi8TlfhAnDWkrKdJgsqTPefeI9lRwA2VJyAnKjJp9MFWGSTxrhpVtk12EVsTsAgYJiw==
X-Received: by 2002:a05:651c:c8:b0:2ec:1810:e509 with SMTP id 38308e7fff4ca-2ec3cfe694fmr30738051fa.40.1718878030598;
        Thu, 20 Jun 2024 03:07:10 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec42199c83sm3171241fa.87.2024.06.20.03.07.08
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 03:07:09 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ec1620a956so7274901fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jun 2024 03:07:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXsebrv6roswbVK9082zCMJrkwMII8wLnJTkztmDEqFkprbeweOPse+u7BLOYljOX1yFLcTmvSvPQlnn0GgqzJpqRaDQVzKabuW7WTntfxb
X-Received: by 2002:a05:651c:90:b0:2eb:f8d1:87d9 with SMTP id
 38308e7fff4ca-2ec3cecca82mr30693691fa.31.1718878028507; Thu, 20 Jun 2024
 03:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com> <20240619-xtheadvector-v3-3-bff39eb9668e@rivosinc.com>
In-Reply-To: <20240619-xtheadvector-v3-3-bff39eb9668e@rivosinc.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 20 Jun 2024 18:06:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v64ZuLhnZn4G_Zbqqosh46Fh57WtXCcCFkwMA2phtLzq1g@mail.gmail.com>
Message-ID: <CAGb2v64ZuLhnZn4G_Zbqqosh46Fh57WtXCcCFkwMA2phtLzq1g@mail.gmail.com>
Subject: Re: [PATCH v3 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_030720_449670_A5E9895C 
X-CRM114-Status: GOOD (  15.06  )
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
Reply-To: wens@csie.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdW4gMjAsIDIwMjQgYXQgNzo1N+KAr0FNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gVGhlIEQxL0QxcyBTb0NzIHN1cHBvcnQgeHRoZWFk
dmVjdG9yIHNvIGl0IGNhbiBiZSBpbmNsdWRlZCBpbiB0aGUKPiBkZXZpY2V0cmVlLiBBbHNvIGlu
Y2x1ZGUgdmxlbmIgZm9yIHRoZSBjcHUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtp
bnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNv
bm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgoKQWNrZWQtYnk6IENoZW4tWXUgVHNhaSA8d2Vuc0Bj
c2llLm9yZz4KCklmIHRoZSBSSVNDLVYgbWFpbnRhaW5lcnMgd2FudCB0byB0YWtlIHRoZSB3aG9s
ZSBzZXJpZXMuCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4yMGkt
ZDFzLmR0c2kgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIv
c3VuMjBpLWQxcy5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VuMjBpLWQx
cy5kdHNpCj4gaW5kZXggNjRjM2MyZTZjYmUwLi42MzY3MTEyZTYxNGEgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VuMjBpLWQxcy5kdHNpCj4gKysrIGIvYXJj
aC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VuMjBpLWQxcy5kdHNpCj4gQEAgLTI3LDcgKzI3
LDggQEAgY3B1MDogY3B1QDAgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJpc2N2LGlzYSA9
ICJydjY0aW1hZmRjIjsKPiAgICAgICAgICAgICAgICAgICAgICAgICByaXNjdixpc2EtYmFzZSA9
ICJydjY0aSI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmlzY3YsaXNhLWV4dGVuc2lvbnMg
PSAiaSIsICJtIiwgImEiLCAiZiIsICJkIiwgImMiLCAiemljbnRyIiwgInppY3NyIiwKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ6aWZlbmNlaSIsICJ6
aWhwbSI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
emlmZW5jZWkiLCAiemlocG0iLCAieHRoZWFkdmVjdG9yIjsKPiArICAgICAgICAgICAgICAgICAg
ICAgICB0aGVhZCx2bGVuYiA9IDwxMjg+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgICNjb29s
aW5nLWNlbGxzID0gPDI+Owo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgY3B1MF9pbnRjOiBp
bnRlcnJ1cHQtY29udHJvbGxlciB7Cj4KPiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
