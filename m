Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEBDC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 17:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A0GN11L7Gc4S/8kSVt68ibOzzvfvJTtYtaZ2TUFSock=; b=BINw6p3pe01A95
	geQaQoamuYgkcLoRetKci2SHVSsJ9Gb5V/HxuLIRr+8GiEPhptcY8fC8ewMH1kSiYuh+dHIoMYH4j
	rjajMOt7FwM4BlFQdZOcIYmMirmc01gElnyooVOw+OPS2t+x+EA/7BHItvI4+39YuqT0h8IBJl9/X
	m+m97xU230MxtmSGYaHJ4IC1+acEwB9RzgohPZEcrJFYLi98I/vNDrhYmld+4GJU1lULtC0xk4EUd
	P+7FZFJ7AVTimJ/JS4jO3BuBGSfE/jyL2viTdFEk3bZXDq4a/VkrcWBVwuvv3psWIDbARp4YWcojZ
	gDtVUwrCJz9vVI/tSfIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEwir-008YvS-Ke; Fri, 22 Jul 2022 17:45:57 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEwio-008Yq4-AD
	for linux-riscv@lists.infradead.org; Fri, 22 Jul 2022 17:45:56 +0000
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 54BD03F129
	for <linux-riscv@lists.infradead.org>; Fri, 22 Jul 2022 17:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1658511949;
	bh=+MBkXW0LeP92A9MOeqdeUTIUyNCajZyEzKLEvm/heRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=H543RZtfjZRrfmnBr07CcQ1063rRRUM/i3VIL3MMkxlD02xR4QKQ/GL/DDBvBmhj/
	 Kc9KWrerZaYZ8uPBtNiMduC4GowdLgntoACkDCu4GyCbDm7NmenXm0ca1IieyKaW3f
	 mRV8szv0SRPY8MZPcGAMw8M/hwNqS1Hga3va3Lg41/33Tio3XpQlOOoq4zw4H4Vuxu
	 Tx7OQnoHVZTNOBQsgpnu3SujCI5lkANzPnrXtb74OldLLtbN/fcBx4BgZ2bExAUnGs
	 R1MSChCdG7aB5gbR+qsRSBMcHkFzKvtD07C7wguyCrU5bCmFWphQFmyOlW+G5f7dCH
	 HYnRfLrws/PfQ==
Received: by mail-qv1-f72.google.com with SMTP id q3-20020ad45743000000b004735457f428so3455113qvx.23
        for <linux-riscv@lists.infradead.org>; Fri, 22 Jul 2022 10:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+MBkXW0LeP92A9MOeqdeUTIUyNCajZyEzKLEvm/heRc=;
        b=T7HXtq2Uae0F5XQrFaZTD+srKMHaxS9DMuITCj1/rt9NujK62vuoJJwFMp+HyzdKdi
         Nelqc/8hLCvhzs81gWlog2oCFbs3j5n0RMW4PyCaZbpsy+V82yHvxIb4gtCPwUC0P4yF
         sMQa+eA4aJg3E3xmDMGFRkIF2IE8zmlyJKawW2JdYU1WF47r2tB5qOop5zflbOtVO4/g
         UQTP0GpYJV7aBAkmZ74oryxPIEHzvZd2g/TysUxn4gBl+sftdExMP6m8P+cVxOgEpxrA
         fVWdtVIqZElpxuglqWcxegnPz4b1Fx0wolAZHFht5b9u0LObKKGrYY+Y2emIfBlTpu2H
         4LWA==
X-Gm-Message-State: AJIora+5R6GndltDc899R6Fg49n4hatyMpgDwdOcaA9tv3o3nhU7dp64
	EA5rbkJlBofyaSIJVUcnzoNCfuY5KiA8Fqmfzz0FteO7glpxzqL4YqDxttrGjljTr/q+lAO/Ugw
	Rdp6gCXy1lQNjhEhnr5DNb0RW0S8mmsQXkTE6A+OpKllzxMPFYyfou0/C/LjIdg==
X-Received: by 2002:a05:6214:d84:b0:473:3106:a97d with SMTP id e4-20020a0562140d8400b004733106a97dmr1122361qve.112.1658511948381;
        Fri, 22 Jul 2022 10:45:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uqu2/88oFu6K+6x70N3LDOqiqst44RokKg0M3zpdZRePRJs/gIxxH+9Ul/p9UTIPUto5kx29jisV8jOPUWtjA=
X-Received: by 2002:a05:6214:d84:b0:473:3106:a97d with SMTP id
 e4-20020a0562140d8400b004733106a97dmr1122347qve.112.1658511948205; Fri, 22
 Jul 2022 10:45:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220721103129.304697-1-u.kleine-koenig@pengutronix.de> <20220721103129.304697-7-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220721103129.304697-7-u.kleine-koenig@pengutronix.de>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Fri, 22 Jul 2022 19:45:32 +0200
Message-ID: <CAJM55Z_+AOmyFs-QgaQdnk4m7SN=JMcszjG+mtANzBcWkGYBkQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] pwm: sifive: Shut down hardware only after
 pwmchip_remove() completed
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Wan Jiabing <wanjiabing@vivo.com>, kernel@pengutronix.de, 
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Yash Shah <yash.shah@sifive.com>, Atish Patra <atishp@atishpatra.org>, 
	"Wesley W. Terpstra" <wesley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_104554_772496_15E57E42 
X-CRM114-Status: GOOD (  17.65  )
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

T24gVGh1LCAyMSBKdWwgMjAyMiBhdCAxMjozMiwgVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xlaW5l
LWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4gVGhlIFBXTXMgYXJlIGV4cGVjdGVkIHRv
IGJlIGZ1bmN0aW9uYWwgdW50aWwgcHdtY2hpcF9yZW1vdmUoKSBpcyBjYWxsZWQuCj4gU28gZGlz
YWJsZSB0aGUgY2xrcyBvbmx5IGFmdGVyd2FyZHMuCj4KPiBGaXhlczogOWUzN2E1M2ViMDUxICgi
cHdtOiBzaWZpdmU6IEFkZCBhIGRyaXZlciBmb3IgU2lGaXZlIFNvQyBQV00iKQo+IFNpZ25lZC1v
ZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+
CgpIaSBVd2UsCgpZb3UgZGlkbid0IHNlbmQgYSBjb3ZlciBsZXR0ZXIgc28gdW5zdXJlIHdoaWNo
IG1haWwgdG8gcmVzcG9uZCB0bywgYnV0CkkgdGVzdGVkIHRoaXMgc2VyaWVzIHdpdGgKCmh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjIwNzA1MjEwMTQzLjMxNTE1MS0xLWVt
aWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20vCgouLmFuZCBldmVyeXRoaW5nIGtlZXBz
IHdvcmtpbmcsIHNvCgpUZXN0ZWQtYnk6IEVtaWwgUmVubmVyIEJlcmhpbmcgPGVtaWwucmVubmVy
LmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+CgovRW1pbAo+IC0tLQo+ICBkcml2ZXJzL3B3bS9wd20t
c2lmaXZlLmMgfCA1ICsrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jIGIv
ZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCj4gaW5kZXggZGE0MGFkZTBlYmRmLi4yZDRmYTVlNWZk
ZDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCj4gKysrIGIvZHJpdmVy
cy9wd20vcHdtLXNpZml2ZS5jCj4gQEAgLTMwOCw2ICszMDgsOSBAQCBzdGF0aWMgaW50IHB3bV9z
aWZpdmVfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldikKPiAgICAgICAgIHN0cnVj
dCBwd21fZGV2aWNlICpwd207Cj4gICAgICAgICBpbnQgY2g7Cj4KPiArICAgICAgIHB3bWNoaXBf
cmVtb3ZlKCZkZGF0YS0+Y2hpcCk7Cj4gKyAgICAgICBjbGtfbm90aWZpZXJfdW5yZWdpc3Rlcihk
ZGF0YS0+Y2xrLCAmZGRhdGEtPm5vdGlmaWVyKTsKPiArCj4gICAgICAgICBmb3IgKGNoID0gMDsg
Y2ggPCBkZGF0YS0+Y2hpcC5ucHdtOyBjaCsrKSB7Cj4gICAgICAgICAgICAgICAgIHB3bSA9ICZk
ZGF0YS0+Y2hpcC5wd21zW2NoXTsKPiAgICAgICAgICAgICAgICAgaWYgKHB3bS0+c3RhdGUuZW5h
YmxlZCkKPiBAQCAtMzE1LDggKzMxOCw2IEBAIHN0YXRpYyBpbnQgcHdtX3NpZml2ZV9yZW1vdmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQo+ICAgICAgICAgfQo+Cj4gICAgICAgICBjbGtf
dW5wcmVwYXJlKGRkYXRhLT5jbGspOwo+IC0gICAgICAgcHdtY2hpcF9yZW1vdmUoJmRkYXRhLT5j
aGlwKTsKPiAtICAgICAgIGNsa19ub3RpZmllcl91bnJlZ2lzdGVyKGRkYXRhLT5jbGssICZkZGF0
YS0+bm90aWZpZXIpOwo+Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+IC0tCj4gMi4zNi4xCj4K
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
