Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C16C61CE8
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jun 2025 15:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ttEXZa4UTZJ38JqwuYkOPRsQsUACBWvgmZ8rKPZJN3E=; b=cOmLsQV2Kj2GEH
	ngLncPmKrDDy31Z6EAmz/doVW2C5qvC0u/GbGiJiLXZdfKEs+Ro0oRHrghiZDqTcKJT9hqoHxxLSs
	7Z54YzcboLktI0hLnNMFBYoncVGvLlWjXAO6tOjl0xlxCn1PnsY6n4RKtTmkROyP7sylLQdkTHtUr
	EWNHi1TQpniueEBZoBl8kPu///nF8L+8y9Qv0MNgp28JV7Vn/5Sqwzmb5gTiBlgPd4LictP52Ma4P
	4FPDRAFf5Iyhx4JncQpa/uQUMNp/0q+VDu/wtfG8cY46LYYrXc2TicukC36Q2Fxiw+OltuvV1iv6G
	NCrZeRd5Mc1vZ+m/GY5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQpRy-00000002c1q-2pL2;
	Sun, 15 Jun 2025 15:39:14 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQpRw-00000002c0s-0vBv
	for linux-riscv@lists.infradead.org;
	Sun, 15 Jun 2025 15:39:13 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45348bff79fso4276145e9.2
        for <linux-riscv@lists.infradead.org>; Sun, 15 Jun 2025 08:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750001951; x=1750606751; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q7ElqBBxYK8zwqSy2KMj1EAXRpTMg0e1y6o6qhKBrfY=;
        b=P8iPtM5yk8F7HrHHmrTN8ZifiBon959gyzP4eYgxuf65CwjNGzEoAdOnNMJMdOyXDF
         X5cV9aX6tqIlDzh64ELkSHj4kPspeod0Ez58ArO2WAbU44VQt0176ZJ0Wq3bBW0/+Djn
         pLgFHUx85n6lmAEDoEvo1DOs2Kz8tOTRRbiHII47yDNrDyj6nhuF9nV5VHSo3WqkK7IY
         OZtEn7IPv+SdXMqZXN21cRmxfZCvxI7Ds8E5c2xq6ud3IlUznUFKBkMz8B0FrY8mhnJb
         CpPztqOpGKyiyZyfOCPL6ZrZiUzD53Pm0u3ttY8ky0Xf1fguYafG98fkD/rwZSqUrgSh
         5b+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750001951; x=1750606751;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7ElqBBxYK8zwqSy2KMj1EAXRpTMg0e1y6o6qhKBrfY=;
        b=fH/UzueCzoxHy+XMlveOdvrW8LFjSuBneWFcLx/5nlzEqu4u5mVvTiLLskAGP58gHp
         0NleaYuUbFpNIOJ5QM8q4r+4kliP339FoQMHmJhXZjuCqEYYHgUediy3x0m6eRBcEFL5
         kXIBk8+MTExxkWAUzHzeQS/gxAQ0vxLnegwtV/plGxj4ne8NiWwXYli6R2xTmhRE8MGt
         IUP7+s/OQBNZgi1d/Vez2hazpBVc44PCNLoJE/S3g2h7Dx1fhUV61sOTBQO2616MRQQO
         CyHq5xlcWFWvR+GK3qNloUdpFlazaJdfGHguPa7ji3wGVS8IUqnFRCuHUBA2kDdyACjJ
         Lu3g==
X-Forwarded-Encrypted: i=1; AJvYcCVXeIYJf3J8QRlh5EYFpZgBf2XURlSyqsGujbBK4M0UjzSKxCL8vcJ+whaV3nukbDHvSbmUUmBd5yIQNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAMG8hy8Te2VWpWGke3UhS8MEOJDQcW4TLxjkJm7zEQAk4BekB
	KTYlnwWVU1sILOUJfOCLz+tpQGclRimCN/8I4H9DcT3GGtZ1g7R1FrWa
X-Gm-Gg: ASbGncuJaILsNdsjAusy2NpYhKF25KrTH59mCOg0LhC0z63f9KsOmrnthw97IzXzkUS
	KWrVlL1unwNstlG31uQgcuHSusIL06ogv6btL/ydiHnRxfC5fz0Z7FPbu9cz60P8jfu5+4VG0aV
	hT3/EpiDUH0y/Yfjq4cUw6Dfi+lywO2gVTSk05IZdxpBg4819oCPafAKxGje8vIuEVh/f2PDdcz
	/JZq2XPziAwQ4lBcWqTJhmbOqLNd0xhuTLMUDcmqLzE3XsQ3CVBoLCXmAFwsJDMWt72eQJ8VovR
	o84XpBwN+2LrUb5Yql9EAQaOeHD7EfxGq4sVZ1l5m2/fzooKOECE23VMuT0dRV+lDrwW4On6G/x
	1wS2m39YD2QHV/t2r
X-Google-Smtp-Source: AGHT+IE3Nn2aP/qP3xfmKvxxE4Tm9DNlDreyA9eo2JAN2p1efPcWJyOTkPDySsjd3i0sSEsHjflkPQ==
X-Received: by 2002:a05:600c:3b17:b0:442:ff8e:11ac with SMTP id 5b1f17b1804b1-4533caa3473mr60153345e9.12.1750001950395;
        Sun, 15 Jun 2025 08:39:10 -0700 (PDT)
Received: from giga-mm-7.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c2d2sm116082625e9.1.2025.06.15.08.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 08:39:09 -0700 (PDT)
Message-ID: <fe84a75aa6d91bc8de7610660e861f1f60fdf9ef.camel@gmail.com>
Subject: Re: [PATCH v3 2/4] reset: simple: add support for Sophgo CV1800B
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,  Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Chen
 Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti	 <alex@ghiti.fr>, Vinod Koul <vkoul@kernel.org>, Yu Yuan
 <yu.yuan@sjtu.edu.cn>,  Ze Huang <huangze@whut.edu.cn>, Thomas Bonnefille
 <thomas.bonnefille@bootlin.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dmaengine@vger.kernel.org, Yixun Lan
	 <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Date: Sun, 15 Jun 2025 17:39:20 +0200
In-Reply-To: <20250611075321.1160973-3-inochiama@gmail.com>
References: <20250611075321.1160973-1-inochiama@gmail.com>
	 <20250611075321.1160973-3-inochiama@gmail.com>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_083912_346355_E6692C41 
X-CRM114-Status: GOOD (  12.68  )
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

VGhhbmtzIGZvciB0aGUgcGF0Y2gsIElub2NoaSEKCk9uIFdlZCwgMjAyNS0wNi0xMSBhdCAxNTo1
MyArMDgwMCwgSW5vY2hpIEFtYW90byB3cm90ZToKPiBSZXVzZSByZXNldC1zaW1wbGUgZHJpdmVy
IGZvciB0aGUgU29waGdvIENWMTgwMEIgcmVzZXQgZ2VuZXJhdG9yLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IElub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBnbWFpbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFs
ZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4KClN1Y2Nlc3Nm
dWxseSB0ZXN0ZWQgd2l0aCBVU0Igc2VyaWVzIGluIGhvc3QgbW9kZSBvbiBNaWxrLVYgRHVvIE1v
ZHVsZSAwMSBFVkI6CgpUZXN0ZWQtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8YWxleGFuZGVyLnN2
ZXJkbGluQGdtYWlsLmNvbT4KCj4gLS0tCj4gwqBkcml2ZXJzL3Jlc2V0L3Jlc2V0LXNpbXBsZS5j
IHwgMiArKwo+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3Jlc2V0L3Jlc2V0LXNpbXBsZS5jIGIvZHJpdmVycy9yZXNldC9yZXNldC1z
aW1wbGUuYwo+IGluZGV4IDI3NjA2NzgzOTgzMC4uNzllOTRlY2ZlNGY1IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvcmVzZXQvcmVzZXQtc2ltcGxlLmMKPiArKysgYi9kcml2ZXJzL3Jlc2V0L3Jlc2V0
LXNpbXBsZS5jCj4gQEAgLTE1MSw2ICsxNTEsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCByZXNldF9zaW1wbGVfZHRfaWRzW10gPSB7Cj4gwqAJeyAuY29tcGF0aWJsZSA9ICJz
bnBzLGR3LWhpZ2gtcmVzZXQiIH0sCj4gwqAJeyAuY29tcGF0aWJsZSA9ICJzbnBzLGR3LWxvdy1y
ZXNldCIsCj4gwqAJCS5kYXRhID0gJnJlc2V0X3NpbXBsZV9hY3RpdmVfbG93IH0sCj4gKwl7IC5j
b21wYXRpYmxlID0gInNvcGhnbyxjdjE4MDBiLXJlc2V0IiwKPiArCQkuZGF0YSA9ICZyZXNldF9z
aW1wbGVfYWN0aXZlX2xvdyB9LAo+IMKgCXsgLmNvbXBhdGlibGUgPSAic29waGdvLHNnMjA0Mi1y
ZXNldCIsCj4gwqAJCS5kYXRhID0gJnJlc2V0X3NpbXBsZV9hY3RpdmVfbG93IH0sCj4gwqAJeyAv
KiBzZW50aW5lbCAqLyB9LAoKLS0gCkFsZXhhbmRlciBTdmVyZGxpbi4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
