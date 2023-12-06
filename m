Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE043C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 02:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b6zLa0l0IcIu2e3DT9NnsyJVrjA4uCYK1i79x/RPVVs=; b=IIJWDYS/wmTEkh
	uuHDfN+ZepnsyKRweXiUvE67DbxOvO5fMlB4XKpZXKNtCKdcOeoRsb88mbdjkfVXXvgquxCI2JLw0
	UTVVzD2+Y1i8XCFdufPXs0BpirXptKipaDVV8PNVMtM1WxO/AafzA2omFdjuocJ2URbWakcsr3oOw
	n7hr0E2uZBHGBOUvSJcdw8PYF3OqfjFY0PgHN/2N9UjRtA5eS2OnOb+YB5CXVbqAZvO2qCt/AsKa9
	lF5IJYkPv/9+Y7l3h2P9AfDhmyhl2GguPVIUKEUWSEYtIvXHOIofVsomPZLljqIAxpCReOq8M91BK
	A2KZr8CN051xCnXsrHXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAhlF-008tee-1V;
	Wed, 06 Dec 2023 02:35:41 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAhlD-008tdy-1b
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 02:35:40 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d9caf5cc948so4779735276.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 18:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701830136; x=1702434936; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlDuu53vbrn6lPFwY45IWnvR+3YA7mUVyinONkEtmto=;
        b=fpts921WmqxXgJG47Mzivue321606veuhmFiBL3+F0XsIxm6QfzjotZyz3oK401/0u
         V939KDZboduk5lGIsE9xbqxQ8VcRjJkbS/8Z01bA/+ZIOkgeWl7TILCEp3k6P5d/bg5c
         Hh3KMvulw4iQ/LoWhHgsdIv6/X1Qr8oInCP6zeQ1Xh7FcW1kj2MIXFjiekU6thq5zjY+
         pMCJTDAfLQ5gsWNyctCPcGr9e2SUvRh+QRgPluc9PeGfCWlNc1Xh21l+kjB/WbMIiOGA
         l3rKKVDfC6g1Z9Iki3gqcmGllQgEjnFlT7cAmnTkXbVSfgbh7IF4uaIB1LyBC1oE7EPT
         yjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701830136; x=1702434936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlDuu53vbrn6lPFwY45IWnvR+3YA7mUVyinONkEtmto=;
        b=qmrypzeB06qpXU8APRb2TrUu7GJ6pwI/GlLRJdxiM7CEqh7vV/hyipz6bEfQz84bM/
         aNihCZyqoVIwOoeVfgvDJGEh/xG7GiKs8tf6pz82PRathLTafjnPH0i8uzC4pNUPeR9q
         8eygFd8BSPINMpb1LuYDNMSQ1qIjxv79zPpfIzV5d3Pyy9F/pN4RyAmc7cPcFc22iJrv
         93jJtQuYVVFbI+LldOzMsFZpWg4hEHMiFRkLXlIKy9p6BVN82cv7GYf7tqvz0PDfXrvO
         2dXvO1VtAz1Q6vREJTgTRPDj67C7dOo8MyWXok03qfw/tFNSeu+rs8WGYCX0ltMtbMjQ
         Y+lQ==
X-Gm-Message-State: AOJu0YxLuuSGZpwkOrQc1TF+jnOkgwifSvY30yu4ItKS/9AXb2j0ahZZ
	le18iXLkbBLRjIeGTIF1HReyADQfpmZm3ZCY0dyHLQ==
X-Google-Smtp-Source: AGHT+IEAAK7nw9Tt/NLs1EhilQZoE6ZJOZfYmBJo7cb7QrMdkaOgVc2RlX9xN6TjZVgIA+w28XmZQLETw6at2bm172k=
X-Received: by 2002:a05:6902:522:b0:db7:dacf:3faf with SMTP id
 y2-20020a056902052200b00db7dacf3fafmr126141ybs.92.1701830135801; Tue, 05 Dec
 2023 18:35:35 -0800 (PST)
MIME-Version: 1.0
References: <20231024101902.6689-1-nylon.chen@sifive.com> <20231024101902.6689-3-nylon.chen@sifive.com>
 <CAHh=Yk_i-tH-n_5wuwp6H8QRu3cZovkukDzMbeUZrgiih46V8g@mail.gmail.com> <21985579-e017-4a56-b5e3-697fd9d0c9d7@linaro.org>
In-Reply-To: <21985579-e017-4a56-b5e3-697fd9d0c9d7@linaro.org>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Wed, 6 Dec 2023 10:35:24 +0800
Message-ID: <CAHh=Yk_=JJnBXVY4nrcmam6aQVN6Db=sPp59je=_BXj140QP3Q@mail.gmail.com>
Subject: Re: [v5 2/2] pwm: sifive: change the PWM controlled LED algorithm
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, 
	emil.renner.berthing@canonical.com, vincent.chen@sifive.com, 
	greentime.hu@sifive.com, zong.li@sifive.com, nylon7717@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_183539_569070_489FC448 
X-CRM114-Status: UNSURE (   9.08  )
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

SGkgUGluZyBvbiB0aGUgc2VyaWVzLgoKVGhlIG1lcmdlIHdpbmRvdyBzaG91bGQgaGF2ZSBlbmRl
ZC4KCklzIHRoZXJlIGFueXRoaW5nIG1vcmUgSSBjYW4gZG8gdG8gcHVzaCB0aGUgcHJvY2VzcyBm
b3J3YXJkPwoKS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8u
b3JnPiDmlrwgMjAyM+W5tDEx5pyIOeaXpSDpgLHlm5sg5LiL5Y2INDoyMuWvq+mBk++8mgo+Cj4g
T24gMDkvMTEvMjAyMyAwODowMiwgTnlsb24gQ2hlbiB3cm90ZToKPiA+IEhpLCBQaW5nIG9uIHRo
ZSBzZXJpZXMuCj4gPgo+ID4gVXdlLCBpcyB0aGVyZSBhbnl0aGluZyBtb3JlIEkgY2FuIGRvIHRv
IHB1c2ggdGhlIHByb2Nlc3MgZm9yd2FyZD8KPgo+IEl0J3MgbWVyZ2Ugd2luZG93LiBXaGF0IGRv
IHlvdSBleGFjdGx5IGV4cGVjdCB0byBoYXBwZW4/Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6
dG9mCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
