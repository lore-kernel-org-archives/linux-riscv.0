Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D232EC7EE23
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 20:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BfHzn7JPxfI+n147igfs9KOFU0ByOj/uhGLyKzVJUQA=; b=kXUkV/RpiFXDFs
	xBlYHFLXgJUIcaXWKQ0c9u7LwtOxO803MYEeWZGcF3KQeNceq3JzbDm5Vo26ZzEbIphKG4/A1+PK6
	tLHjWcFbdmS7LmT6WS5Iz7ipZ5ktGsRhVDoxEGr1vxJZWz9PT5KR+nPQJDyOmxJH20m80tJt0fIkF
	Cg7h6hgNA8lxRjJ1cLirqMlWf5qgxkaD+LAD48aY5fNZsMs4VLShOxUPC/mSXWaoTYQGFZPrMumLt
	wwY1RKbDc4WyFv7aHBIDJhxaMMSiCFB8qCUzGHMlmVTtPNWMTeolkY3Lwpki1DkziWZKUROdHdlPH
	VFUGOKzWpV+0fpxuiHfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5uDn-00D0ht-2a;
	Sun, 04 Jun 2023 20:21:03 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5uDk-00D0gR-2H;
	Sun, 04 Jun 2023 20:21:02 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-96f50e26b8bso687739566b.2;
        Sun, 04 Jun 2023 13:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685910056; x=1688502056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pc901lSB1t/5njyHaOGc8Szlz99xchoB9LNubqrB9pc=;
        b=DoNX4mNR4KsN0iXSQQhd4DQCDKAy/YiYQuMQD6ru8VRddZ5HU9qYoL1jaIugifNuZq
         7hZI3Fc7GCBMSXoxGBPUIekHPqx6cxXD+ifUYBWCSSi1VxGnmjlKDVzY3Yvqt0gsz7by
         B2jj1+gU6W63y37bzdsUk55TL10jVRoYRWDmsiD4IE/iyREUrHeUWdo8ZdmSmYW9byyP
         o2kUCLPpNeIMZDxH6g03V2Zx2o13q5xifpMdawywWXXZV1tF8ye3f/8BbGvMrNCYwByX
         WBLHgmVUNzFsAOQHrT9LEk6onwWScg0UncK9BSgbit/tQBh0JmLCWszHpOpeYgs7u2fl
         BSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685910056; x=1688502056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pc901lSB1t/5njyHaOGc8Szlz99xchoB9LNubqrB9pc=;
        b=ApTfQeAqr1MSlSKSgTkceuAzT/IzJTuE0wKIeJLgmNC51QvMpEhxT1G2eaxMDIVmDS
         LX3y2Be7lJT4YCb6izOezjmLh3S/W+Bft7AWkzu8dqpc2adpoEYy+RS7nBARlYjlOkOs
         5aRu+JgNl2mm5EXZor6Y3xo3xecuhMCqSms/RbGIDTqJp6gy319+vZWdvUzmIJkZCnQU
         Kxs7xerBTMfrcvNOSzyU8ctWCTXKujTYFPS4/v+/R+nR8H5cOwiZuNAQZOd3OSaFEXPT
         zywzN4AMjqQpZWajZ0PkoIXKtMYLJ4YgSQzh8noJk3I3zjy3gUiMobuFcAGFQhCoKoLK
         Mg/w==
X-Gm-Message-State: AC+VfDyjYCdRBvVL5oZwfeW5gbDgMwMYgC6hH21wqJjK0thop97HMT5R
	oJwcLlPMVsFglC7ptloJkfcE/quvbqAuyErYxYU=
X-Google-Smtp-Source: ACHHUZ7HJh+h9S1Y+0QLnh+mPkHQqhlWKeX5TeLGIsBww9yr2NxJpXCvJ2n+CmB71U+vMZhwSkpXWhlo0NM6x+JnCj0=
X-Received: by 2002:a17:906:730b:b0:970:132f:698f with SMTP id
 di11-20020a170906730b00b00970132f698fmr5945181ejc.2.1685910055898; Sun, 04
 Jun 2023 13:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230601223104.1243871-1-bigunclemax@gmail.com>
 <20230601223104.1243871-3-bigunclemax@gmail.com> <fbcc5688-387c-32fb-edac-17848c92b936@linaro.org>
In-Reply-To: <fbcc5688-387c-32fb-edac-17848c92b936@linaro.org>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sun, 4 Jun 2023 23:20:43 +0300
Message-ID: <CALHCpMizv52yj0rw0pR8pYjSys2UivS4L4GkWLgc-d91bdmDCA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: iio: adc: Add Allwinner
 D1/T113s/R329/T507 SoCs GPADC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Cosmin Tanislav <demonsingur@gmail.com>, 
	Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	William Breathitt Gray <william.gray@linaro.org>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	Mike Looijmans <mike.looijmans@topic.nl>, ChiYuan Huang <cy_huang@richtek.com>, 
	Ramona Bolboaca <ramona.bolboaca@analog.com>, Ibrahim Tilki <Ibrahim.Tilki@analog.com>, 
	Caleb Connolly <caleb.connolly@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, ChiaEn Wu <chiaen_wu@richtek.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_132100_749561_639D9098 
X-CRM114-Status: GOOD (  15.09  )
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

0L/RgiwgMiDQuNGO0L0uIDIwMjPigK/Qsy4g0LIgMTE6MzgsIEtyenlzenRvZiBLb3psb3dza2kK
PGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz46CkhpIEtyenlzenRvZiwKPgo+IE9uIDAy
LzA2LzIwMjMgMDA6MzAsIE1ha3NpbSBLaXNlbGV2IHdyb3RlOgo+ID4gRnJvbTogTWF4aW0gS2lz
ZWxldiA8YmlndW5jbGVtYXhAZ21haWwuY29tPgo+ID4KPiA+IEFsbHdpbm5lcidzIEQxL1QxMTNz
L1IzMjkvVDUwNyBTb0NzIGhhdmUgYSBuZXcgZ2VuZXJhbCBwdXJwb3NlIEFEQy4KPiA+IFRoaXMg
QURDIGlzIHRoZSBzYW1lIGZvciBhbGwgb2YgdGhpcyBTb0NzLiBUaGUgb25seSBkaWZmZXJlbmNl
IGlzCj4gPiB0aGUgbnVtYmVyIG9mIGF2YWlsYWJsZSBjaGFubmVscy4KPgo+IEV4Y2VwdCB0aGF0
IGl0IHdhc24ndCB0ZXN0ZWQuLi4KClllcywgeW91IGFyZSByaWdodC4gSSB0ZXN0ZWQgaXQgb25s
eSBvbiB0aGUgVDExM3MgYm9hcmQuIEFuZCBJIHdpbGwgYmUgZ2xhZCBpZgpzb21lb25lIHRlc3Rz
IGl0IG9uIGFub3RoZXIgU29DLgoKLi4uCgo+IFBsZWFzZSBydW4gc2NyaXB0cy9jaGVja3BhdGNo
LnBsIGFuZCBmaXggcmVwb3J0ZWQgd2FybmluZ3MuIFNvbWUKPiB3YXJuaW5ncyBjYW4gYmUgaWdu
b3JlZCwgYnV0IHRoZSBjb2RlIGhlcmUgbG9va3MgbGlrZSBpdCBuZWVkcyBhIGZpeC4KPiBGZWVs
IGZyZWUgdG8gZ2V0IGluIHRvdWNoIGlmIHRoZSB3YXJuaW5nIGlzIG5vdCBjbGVhci4KCkkgZ290
IGEgd2FybmluZyBhYm91dCByZXF1aXJlZCBtYWludGFpbmVyIHByb3BlcnR5LiBTaG91bGQgSSBk
bwphbnl0aGluZyB3aXRoIHRoaXM/CklmIHllcywgdGhlbiB3aG8gc2hvdWxkIGJlIGEgbWFpbnRh
aW5lcj8KCi4uLgoKPiBIbT8gU28geW91IGRvIG5vdCBhbGxvdyBhbnl0aGluZyBmcm9tIGFkYy55
YW1sIHJlbGF0ZWQ/IEFyZSB5b3Ugc3VyZQo+IHRoaXMgaXMgeW91ciBpbnRlbnRpb24/CgpJJ20g
bm90IHN1cmUgYWJvdXQgaXQuIEkgbG9va2VkIGF0IG90aGVyIEFEQyBiaW5kaW5ncyBhbmQgZGlk
bid0IGZpbmQKYW5vdGhlciBkcml2ZXIgd2l0aCAnYWRkaXRpb25hbFByb3BlcnRpZXM6IHRydWUn
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
