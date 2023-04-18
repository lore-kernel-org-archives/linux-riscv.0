Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1183DC6FD18
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 18:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/jJeBmIMVA5UaGjCR8IZQidmUmK4f12SBNWdGjXIxmI=; b=VINmsbfU9ROxuV
	8dA5ic/qjbF28qadMdi37ABpTZhpnrhpEnNlzgjV8SdnLEswH+woEtcyJrReA5FLL+/LSnw1A95yZ
	kcYY+Niy6QQ9l7hclPzZdjz15iTF/Lu4fzljecbGF65M5IkNBvBt2aDwt9UUFM1Fb3GP+HUHLACMR
	ihjtEfR93yJXacty10zx5s6HIz/TLx9gMNdHsmJU/r+cD95v2RatcwMcJfaWpR8rub9mJpI2IQBwd
	HavSz1FBvWm9sanEgh8UwEgVlzUPx84FgR2U+XKp8X5iNmjIw0vAgI6zot78SlZYYy1o4EUE4ysCz
	xqURYAQtXcyXa1iL+ERQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poqLo-0037CX-2w;
	Tue, 18 Apr 2023 18:46:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poqLm-0037Bc-0H;
	Tue, 18 Apr 2023 18:46:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 50B4763819;
	Tue, 18 Apr 2023 18:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E09C4339B;
	Tue, 18 Apr 2023 18:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681843604;
	bh=pKJj9g3tBEkFJP6eRoZIhrGdL6/PVt203b7XHIVgCB8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MA532bzdkC8gnUE8qJC+Z9XJx4r60U4jXHWdnFCAP1lqtSvNm63zBg9I7tps0GmeO
	 LZhywIGCGgapvYxPTRWSgInBfrtV1qOOUBoxfUZzd43xfjpfRniaqx7y3xdQroY2Pb
	 YG7PK7BrpCd844yVBrwErw45bhlpqdwYPo4joG9p2uOq46lHNRF3U8u/Oi/KtS5eRq
	 o17pjw1qlLb7yIiMx3swcZFILGOI9UNAtMuhNTvLyHmKiesKs+wx04aay0+N2wu3iX
	 8lN5XQzvH3nnHwnn7BQh3GCjaZ2Vc2Nri+6GT7Gn4OMvjt5P4gbWVpX9opCgjGGdSG
	 ElO46apzLuPCA==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-54fe82d8bf5so156583517b3.3;
        Tue, 18 Apr 2023 11:46:44 -0700 (PDT)
X-Gm-Message-State: AAQBX9dawoGqTuM92w4wqEHdIjPD0JmlhmdfR/9/XL/OWV8goNgKoea8
	bQVyG4vNknmxe8wsS4Vou/Dj9i5DDAADhFVaIA==
X-Google-Smtp-Source: AKy350YZVJSdk9pRa2UGMByWO/Ybo+AAHEAwh2PwITon48BeO0ZkbmsZmJF6/RAw5tyZru+XXDUnu779QuByl8GQZhE=
X-Received: by 2002:a81:bc05:0:b0:54f:b27f:286a with SMTP id
 a5-20020a81bc05000000b0054fb27f286amr476178ywi.5.1681843603770; Tue, 18 Apr
 2023 11:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230412084540.295411-1-changhuang.liang@starfivetech.com>
 <20230412084540.295411-2-changhuang.liang@starfivetech.com>
 <8dd0dc63-e0df-8764-f756-da032d9d671c@linaro.org> <eb47b7c7-bdbb-92d9-ba39-604ce487f297@starfivetech.com>
 <f6a4fb28-d635-4d99-44bb-d929cb41eef2@linaro.org> <b34a8d59-34e4-8358-9d2b-367f4707ca7c@starfivetech.com>
 <f0d82428-aaa5-3dd4-bc29-f1057fe749bc@linaro.org> <20230418184246.GA2103246-robh@kernel.org>
In-Reply-To: <20230418184246.GA2103246-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 18 Apr 2023 13:46:31 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKVa+XHkoDbDLaD+haC2J7QDJ_oLr9RAT=7Pvwa-rWHLg@mail.gmail.com>
Message-ID: <CAL_JsqKVa+XHkoDbDLaD+haC2J7QDJ_oLr9RAT=7Pvwa-rWHLg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: Add starfive,jh7110-dphy-rx
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jack Zhu <jack.zhu@starfivetech.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_114646_198379_94EDAE6B 
X-CRM114-Status: GOOD (  17.45  )
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

T24gVHVlLCBBcHIgMTgsIDIwMjMgYXQgMTo0MuKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBBcHIgMTMsIDIwMjMgYXQgMTA6NDE6MjNBTSArMDIw
MCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiA+IE9uIDEzLzA0LzIwMjMgMDQ6MzQsIENo
YW5naHVhbmcgTGlhbmcgd3JvdGU6Cj4gPiA+Pj4+PiArICBsYW5lX21hcHM6Cj4gPiA+Pj4+Cj4g
PiA+Pj4+IFdoeSBkaWQgdGhpcyBhcHBlYXI/IFVuZGVyc2NvcmVzIGFyZSBub3QgYWxsb3dlZC4g
SXQgbG9va3MgbGlrZSB5b3UKPiA+ID4+Pj4gcmUtaW1wbGVtZW50IHNvbWUgc3RhbmRhcmQgcHJv
cGVydHkuCj4gPiA+Pj4+Cj4gPiA+Pj4KPiA+ID4+PiBXaWxsIGNoYW5nZSB0byBsYW5lLW1hcHMu
Cj4gPiA+Pj4gWWVzLCBhY2NvcmRpbmcgdG8gVmlub2QgYWR2aWNlLCBsYW5lIG1hcHBpbmcgdGFi
bGUgdXNlIGRldmljZSB0cmVlCj4gPiA+Pj4gdG8gcGFyc2UgbWFrZXMgc2Vuc2UuCj4gPiA+Pgo+
ID4gPj4gSG0sIEkgaGF2ZSBhIGZlZWxpbmcgdGhhdCBJIHNhdyBzdWNoIHByb3BlcnR5LCBzbyB5
b3Ugc2hvdWxkIGRpZyBpbnRvCj4gPiA+PiBleGlzdGluZyBhbmQgaW4tZmxpZ2h0IGJpbmRpbmdz
Lgo+ID4gPj4KPiA+ID4+IEJlc3QgcmVnYXJkcywKPiA+ID4+IEtyenlzenRvZgo+ID4gPj4KPiA+
ID4KPiA+ID4gQSBzdGFuZGFyZCBwcm9wZXJ0eT8gTGlrZSAiY2xvY2tzIiBvciAicmVzZXRzIj8K
PiA+Cj4gPiBMaWtlIGxhbmUtcG9sYXJpdGllcyBub3cgc3VibWl0dGVkIHRvIG9uZSBNSVBJLgo+
ID4KPgo+IGRhdGEtbGFuZXMgcGVyaGFwcz8KCkV4Y2VwdCB0aGF0IGlzIGZvciB0aGUgY29udHJv
bGxlcidzIGVuZHBvaW50IHJhdGhlciB0aGFuIHRoZSBwaHkuClByZXN1bWFibHkgaWYgdGhlIGNv
bnRyb2xsZXIga25vd3MgdGhlIG1hcHBpbmcsIHRoZW4gaXQgY2FuIHRlbGwgdGhlCnBoeSBpZiBp
dCBuZWVkcyB0aGUgaW5mb3JtYXRpb24uIElPVywgZG9uJ3QganVzdCBjb3B5ICdkYXRhLWxhbmVz
JyB0bwp0aGUgcGh5LiBGb2xsb3cgdGhlIG5vcm1hbCBwYXR0ZXJucy4KClJvYgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
