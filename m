Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC7EC77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 17:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P32OjhAzHrHZJy/DQpoTyLAy/pbl7ShtfEyR529vLHM=; b=JTpfeThUXKU+MH
	e/2zdXcsmRMM1w3V3cFxyiglgwI+KttkMc9HlUc6xKlP15DglwVL/AK59MXcFRVggCjMESn0EPm4f
	zlz0+7rt3tiJztTkniJHrNFgZ5nzLMcqgticKeshG+wEQiKSaPjzj14dpNyVWd1JlU2I1wUjF6xkf
	nD5eAhXPvlN8cr103v0TVpfg7VUAPkUmv46JnY7hq8s7I7uNQbj3zyP2e+f4Esc/6NpMSOPmVO3F1
	4aA2CC5l1WIQvCvlxk4UReLuFMGQMpwNG0uGv5gnFMCq6avBzvu0mnExteDj6CeG2RiGxMiEXLUwE
	454J/2IFPa506jGFE6Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU78x-00000006Lv0-2Z6p;
	Tue, 24 Jun 2025 17:09:11 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4pT-00000005wrd-2IvT
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 14:40:56 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-553b60de463so5879111e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 07:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750776054; x=1751380854; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzNCs9Ria+/nsHScn6KKXudzA13G16dAU3b2TbhXQXY=;
        b=cwSkYGpU20RX/+71MCVmIjVTwJ47XaJIwF3oGV5rqV050+nQvxGjkL1o8AokO/4lUU
         j63d7K152evppT6Wh5+eQnbNSlJqUpzsmlR3Wm9HcVKkG3G7IzTVmLtHEs0vlwlbrkzV
         +3l1KdVOd7T38mtEL88veFtsxm/RRnYMnQD6qeYLBQJR+KQVYZb0LR8OMas+JQSCrD70
         uKiv37i9+kp6JIDhEXTPn5lE5Q+Mcvfl9aFtAJd90Wiq8X0wGln1mXqqSnXRKPS9yYCD
         n2hCjdtv7CX691cKylmeuZmXA+6NJzU65uTBTAdTQjrYr2axuBHSxtWfK1UHADrWXqRP
         RXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750776054; x=1751380854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EzNCs9Ria+/nsHScn6KKXudzA13G16dAU3b2TbhXQXY=;
        b=FZHKWSjENh64+XS4ZiH/TdZAQggTaWZqPW6GgQ0ig1GzAwEnOwE9lZ9NpcFw5JHSaK
         e01EUV6n7P/ruTNMfWGVWtxZR8zVB4gwiKVClG618SkoPSxYUvBVwde/Hcu0BIgSxiwa
         tay8rjmMmiRhpH1zmvcjPPffB92BJS76hP0qMW432cqNbYWaenmeB2vqn6+V4A1MyEtd
         upZtYapGHbFB08s8+hS5mm8XNXVyqsYk43ivggtuiesR6miOn3qoqRaTDfT4/sZc6wVQ
         F6EVIe5gXfgFbGlyPMiPl279KFSkB62S0EYMepJ8zq3FhWBt/iNByB88ChTl3qEEc2JQ
         uECw==
X-Gm-Message-State: AOJu0YwoAR5+tDIU/oR2k47Z5EFqoa4itQ1GI2ic1HPKEeOSNccSfJJO
	6QlIQuiIfBPahju16//OqBN8jtVW4k8obNrwBFkvHvJS1seN/JzJTvz7ACKBLQpl9PlERfSG9Nw
	WQRsS7yme46P426FUjyRLRpw9gnppjvhY30duZuX0qA==
X-Gm-Gg: ASbGncscw3VtsaEXu9nZmlZHCs5C+8SEdJwN0G/+yXe2VolC5EY92YD1pPENo9w4ogv
	25tpqoLzovfoeIfjoaKpXwL2YgeQfGCOhPp0HrWw3A+5gfiPi59BRxaPvjCthqRvCbTkm4DRHPu
	CDOc+mOhBbk81byT3xEesTGYzkMGYtbsm+EEJLh+E+mAjsJBCCBDoI/DNMaTK2iuCVf+r7S2ZP7
	1Y=
X-Google-Smtp-Source: AGHT+IHoYTMP7f+GMTw3uTP6k4I0Bn231yrpp+uoyy9GCq8Fgqpn1kY4nGbARRHfnOknqCIYL6cW4GTWqP9E24930M8=
X-Received: by 2002:a05:6512:6ca:b0:553:3621:efee with SMTP id
 2adb3069b0e04-553e3d07037mr4828362e87.50.1750776053838; Tue, 24 Jun 2025
 07:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250624141013.81358-1-brgl@bgdev.pl>
In-Reply-To: <20250624141013.81358-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 16:40:43 +0200
X-Gm-Features: AX0GCFtRDOKAyexKw3msruWQ3iVjYn3wJRU2OMc42QM_NdUIN3Q2ZlDVDbMilcc
Message-ID: <CAMRc=MeKfWsf8T1tJLdj=+7aq0zGpQ07pHd2Mz-Y=Bwae0sAbw@mail.gmail.com>
Subject: Re: [GIT PULL] Immutable tag between the pwrseq, drm and pmdomain
 trees for v6.17-rc1
To: Ulf Hansson <ulf.hansson@linaro.org>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_074055_585255_36720590 
X-CRM114-Status: GOOD (  10.53  )
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

T24gVHVlLCBKdW4gMjQsIDIwMjUgYXQgNDoxMOKAr1BNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAYmdkZXYucGw+IHdyb3RlOgo+Cj4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9z
ei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+Cj4gSGVyZSdzIGFuIGltbXV0YWJsZSB0YWcgY29u
dGFpbmluZyB0aGUgdGhlYWQgMTUyMCBwb3dlciBzZXF1ZW5jaW5nIGRyaXZlcgo+IGZvciB0aGUg
ZHJtIGFuZCBwbWRvbWFpbiB0cmVlcyB0byBwdWxsIGZyb20uCj4KPiBCZXN0IFJlZ2FyZHMsCj4g
QmFydG9zeiBHb2xhc3pld3NraQoKSnVzdCBhbiBGWUkgLSB0aGVyZSBkb24ndCBzZWVtIHRvIGJl
IGFueSBhY3R1YWwgYnVpbGQtdGltZQpkZXBlbmRlbmNpZXMgYmV0d2VlbiB0aGlzIGRyaXZlciBh
bmQgdGhlIHJlc3Qgb2YgdGhlIGNvZGUgdGhhdCB1c2VzIGl0Cih0aGFua3MgdG8gdGhlIGF1eCBi
dXMgdXNhZ2UgZXRjLikgc28gTWljaGFsLCBVbGYgZXQgYWw6IHlvdSBjYW4KcHJvYmFibHkgc2tp
cCB0aGUgcHVsbCBpZiB5b3UgY2FuIHJlbHkgb24gdGhpcyBiZWluZyBhdmFpbGFibGUgaW4KbGlu
dXgtbmV4dCBmb3IgcnVuLXRpbWUgdGVzdGluZy4KCkJhcnRvc3oKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
