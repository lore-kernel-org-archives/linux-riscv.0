Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EAACC71157
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 15:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G+G8vYVWugEsENeWys8PSDkzQakYypBPGz4ljJkpTT0=; b=wqS9qn1Zonegfs
	plmIPNlf8UMOjfXtXFKhuuBywt2WNN69IdRHD7r1Gy5VXKz3mQswepE5QrZVKiMfbdjfwHHWTGL2y
	OjXz4ymkT1ctA8vk8jtpwEKnopK/6SQrAT6YN0Am9yb8dhS8BSxRkVb0QO40AXN/JnK8k37sOoaWn
	KSMUaix6GeZKw60793TjTZAhYD9GeQYWLRez4a8544rD+IUJO4Cw01QDcS987Dt55QhQ2V9q9Dowv
	cCwiyN/YotCZ7Nm1gK0UtlEu6AbHLWd7HLctYWZAfgoQEXmMwTxpXt1+qnj7lHn/oVdKbWsUg4JOk
	xoyMvRwnxrf8weG1RJ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRujC-0000000AbL5-0Oi6;
	Wed, 18 Jun 2025 15:29:30 +0000
Received: from mail-lf1-f45.google.com ([209.85.167.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRt4h-0000000AL4j-42cW
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 13:43:37 +0000
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553bcf41440so4360479e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 06:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750254214; x=1750859014; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DH2TdO4qlgMmdVZuOlcVSevdsjnZbtIfQYEMA25f/cg=;
        b=E2rXY61PBs5yUka+lkr/mehAw/HMKIXDrEoE9n0TZHiZgKkSE2f6NjCjOVFJlZtryY
         UoA03NvgO7JjPhI+oYPpQ6BgrmTbhcDnDdBpWVryXX53pEfIqm7iL5wmnOnxJRly+fd9
         giKOaW5YRweJNMyELL+SP0czag7VUOf0M5WZdAfxcIM42Gm27CwJBct3ZnaSN5PyUzQI
         a1HknHJ13Hbx6LUrkKdBTjoSrHWneR/NQNQedv2arbwdDCWKk/tyM/PE9FIN68/9iq+N
         r2UWHsezL9guXFo6rLIX9R3nCbm89uCAktCosiqKRqrVC6KyL19n3nc1+XC0utllv4B5
         JzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750254214; x=1750859014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DH2TdO4qlgMmdVZuOlcVSevdsjnZbtIfQYEMA25f/cg=;
        b=vifDMjTJRfvLd9wBecVw700u5F/hWVpTEEWoJ3c2EMPDkCHzmm20dBAn0Iq+nVggAY
         Z7r2xXi2Wn0B9mP70iVdJ8Ia/By7kTBkF5htnc0QhA7cChVjeBKWkbFUOiC5wKyg6fKp
         yB0NfjHiASnj9qlQqNXwRS9ufRrbgj+WY4zcXyJpBqPx0pkEKKq21Vwp2L9S3q7PKcmM
         biYuSMrHfN9Dfs0FZ8qx9+5KFCbm2MSL0dEicgvc6HgABCnkSeCqVDeCO/y3VYaMlNF1
         AL1ZzPChhpc+pFYFOR2pkzqitpaTT0q341tnJx6ijO7Zk/b02rJOpXsbtyjuunioeaGF
         8czw==
X-Forwarded-Encrypted: i=1; AJvYcCUSlWC9HInpu8xAjYZtE8jS7SNDmIbROwhrbwJ8N7WWTqV7KccaHJwYtBfs8kRANI4XOS26PR6NYuWIkg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFpkdCPWWs31bCQgypPLed+sxL/TwzNyix3NqeWgxrZFNP65yd
	1Ny7k7nu7XCwt0hde3QcEb9xYhuy7yi2SwqBTxIBBxZIg+kojWcJqQIQt4PVVVYchJAM9kbgu8U
	8IxzBe2QJN8pVqq+NLkbw3EuWHvgEl3Vd3tZSlBvBzw==
X-Gm-Gg: ASbGncv9pTiRFjiqvEGqbZHeiQSe9VX9p32tpdqkzcGXmDhqcuvsDHkgocJKUryHyox
	tn0rY8VoIYIj+N0nDTSIlq+lCLgwXIHVnhP/ITQ645H0O1ZuN2FZVhXChf1nLLP3II6Cz1rzVhN
	CwdgwHvRDD4o88241kfLTqb0vj8Iph+HUjHZsKU6wk0p49TtJsK2TSrG6eYMkTCds22aztr1ZVV
	A==
X-Google-Smtp-Source: AGHT+IHftNw+Eih04FWqkzxlxHZa0pUq9QbEcwUOmlySQIbB01O/3QL4rt3xwi2A6yMgr8Es7P1LaWGFLlQxbE/YI0U=
X-Received: by 2002:a05:6512:39cc:b0:553:3770:c912 with SMTP id
 2adb3069b0e04-553b6f42a3fmr4662087e87.47.1750254213943; Wed, 18 Jun 2025
 06:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618102233eucas1p228b24f58e4cb3d15b0f273530b582cea@eucas1p2.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com> <20250618-apr_14_for_sending-v5-7-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-7-27ed33ea5c6f@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:43:23 +0200
X-Gm-Features: AX0GCFsy7p_bfVyodl4lMK_1wlqkCV9i-ffK-YbNgbQ1QgrzZEcf4YhKpp98eDM
Message-ID: <CAMRc=McvK2Og1kxDmN-5YW0UHxe-EEXPg88zh=oVEvSvCZ+-EA@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_064335_999319_3DE74738 
X-CRM114-Status: GOOD (  12.51  )
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

T24gV2VkLCBKdW4gMTgsIDIwMjUgYXQgMTI6MjLigK9QTSBNaWNoYWwgV2lsY3p5bnNraQo8bS53
aWxjenluc2tpQHNhbXN1bmcuY29tPiB3cm90ZToKPgo+IEFkZCBhIGRldmljZSB0cmVlIG5vZGUg
Zm9yIHRoZSBJTUcgQlhNLTQtNjQgR1BVIHByZXNlbnQgaW4gdGhlIFQtSEVBRAo+IFRIMTUyMCBT
b0MgdXNlZCBieSB0aGUgTGljaGVlIFBpIDRBIGJvYXJkLiBUaGlzIG5vZGUgZW5hYmxlcyBzdXBw
b3J0IGZvcgo+IHRoZSBHUFUgdXNpbmcgdGhlIGRybS9pbWFnaW5hdGlvbiBkcml2ZXIuCj4KPiBC
eSBhZGRpbmcgdGhpcyBub2RlLCB0aGUga2VybmVsIGNhbiByZWNvZ25pemUgYW5kIGluaXRpYWxp
emUgdGhlIEdQVSwKPiBwcm92aWRpbmcgZ3JhcGhpY3MgYWNjZWxlcmF0aW9uIGNhcGFiaWxpdGll
cyBvbiB0aGUgTGljaGVlIFBpIDRBIGFuZAo+IG90aGVyIGJvYXJkcyBiYXNlZCBvbiB0aGUgVEgx
NTIwIFNvQy4KPgo+IEFkZCBmaXhlZCBjbG9jayBncHVfbWVtX2NsaywgYXMgdGhlIE1FTSBjbG9j
ayBvbiB0aGUgVC1IRUFEIFNvQyBjYW4ndCBiZQo+IGNvbnRyb2xsZWQgcHJvZ3JhbWF0aWNhbGx5
Lgo+Cj4gUmV2aWV3ZWQtYnk6IFVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPgo+
IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5j
b20+Cj4gLS0tCgpSZXZpZXdlZC1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xh
c3pld3NraUBsaW5hcm8ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
