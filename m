Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA7EC7115B
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 15:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zb9zBRNByxETRAYKxUMBxt4/F8MnaXiNJqweVuLuKgM=; b=m+6REzL/xrpF7w
	ra3xpoxTfV5VOh6Xf7bDmC4OX2NzIq+FXHCLbq/28H8tdTClgQngKfqGHTg182NUE6goTxaG+JdPO
	uE9Ijhq+Yeq9Ksnqv7EyFlmXHorS1ZIL6RgNoK72cA/BP+FMwuxfbLh5Ial7HrL/jtZVeVvJ7y5sO
	Lt+LF8yRabDCrX2f5ncyipozBsN3dHJq8Tq+Py88SYnfoqWdmIs5zyHY3XeBpTPQQUI6qBmTV27WK
	+M8z6NeqghZmzhL/opkj9fV8IVzS5kKIvStA6oJ4nXsKO5j/cx0uCMpZWDmBhXRytqh/cJCrgtKhB
	9eU/FXueGysrRcRnWONg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRugz-0000000Aar8-2bjq;
	Wed, 18 Jun 2025 15:27:13 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRt2h-0000000AKr5-00Km
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 13:41:32 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3122a63201bso6532979a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 06:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750254090; x=1750858890; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yl0PcNOIcNCw+lBv442hGsxXVF1DxIoZVa0h3oivgnQ=;
        b=CAR3D9fVT0EXNidMRnDlPesQdSDATAH/RuVWHIRRX52ywYfFw1XtXZvT70apGW6Xs5
         CDAaWowfrRePajdzlcJWW5H8L1/xje2uDVeBaeTwWLVT3eBuGKrWthKdbAXjwrKs6MZ3
         eNZtva1rpxIEN6CzUmhdkKFg6HJjw5kbysZ4DoL9F4YEOytsPWYoVElYzrihVaOijRvI
         +2C5fnuqtQ6AwwNOt4CDH0ZnFUPnANz5JXbSd0jiFaJgfAi21L3nWBhQBpRG6KcpWUEE
         wD7KjyqmhCkU9lBrV9GJOoULogfnmPxg05sqsaVuw714owPRQF7Ml+uzXuR2F7AMfZ2a
         RQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750254090; x=1750858890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yl0PcNOIcNCw+lBv442hGsxXVF1DxIoZVa0h3oivgnQ=;
        b=SAQXACKDipjW5mjMLnIC0uGTQiCMzBn+dmf0nNgyaQWJ9vxz3jWws4J//jchcu09G5
         jjxqKtXufCL4mApnTDeOnmV16mRn1ifpF3s6r6XZcqnoUviHuSlH6YccafHa2IjNO4Ow
         go8QIufPTBSr7oU5wy25y0vsqTQZOAPvX2Ug9xOm3VN1fb/igVO/UvijIjEKv+cbQxX/
         xv5+vPVfeLyYzMzBi2zefpNt9PRokuGexy6O8YzSePKdVdzowpMkw52OBV4Yn+CmzOvG
         F4WotOQtL6ysI1HvFse5y0BcGptvQlhMRrrDn6hqyCnzNrmH6870oqPIErB/t4S2WgcD
         fAUg==
X-Forwarded-Encrypted: i=1; AJvYcCUL49jBKGA0bnaIq+2kKTob3fuR5ejcmzG2YmZSVuGWahmSL1KppX5ru2bMHTsXlTxyn/uvzy32PcEcrw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKp5rLv3ET3nqlyRwpMu45FSY314J1XT1i9fOFM3F/933nV/pD
	Mi6zDcrtsXk7/SVeMy8gMeX4peRLNyeKH42ls2/LWH7c5f0XxHSGjNsEUucJWqAal6/wXT8G/70
	52M+c4ud3qUl9yUxbzdVHfbW0HRotFA7oI5eo0KqQMQ==
X-Gm-Gg: ASbGncsWcj4Ehd0ybuMthn0Kq0lgZ1FsGKM3UbxXSxHVnnkheWG7ytlKpG52OzW2YRY
	/9QieEOJNFbtsxSf5QbpgyT7RtNhahfUVqhhm3j0wWxCyFcCeJ71Ke/asWyYJITktNLN6Wr7wJJ
	XS9jnSy4XaukQ6EngtRmhx3u+Sqo+8BxNNtni4s7OPcL/1fPFtAvdgen+OUlo7kbvNT2xxLj9ZI
	Q==
X-Google-Smtp-Source: AGHT+IGM3MsC055WE6RGdmTL7+xpqbeOwcWlIGInX1z822Wu3bYLUR0ECZj1HH7bbG4yZBVpGpNdgZd2k9tfvrFyAoE=
X-Received: by 2002:a17:90b:52c6:b0:311:f05b:869b with SMTP id
 98e67ed59e1d1-313f1dcbbc1mr25929568a91.30.1750254090220; Wed, 18 Jun 2025
 06:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618102228eucas1p1906803f73cc004e68f281b2bdf871da3@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com> <20250618-apr_14_for_sending-v5-3-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-3-27ed33ea5c6f@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:41:16 +0200
X-Gm-Features: AX0GCFvz_RthrqCGUMHniOjba_9qiDf9mc2HoVSIdoi-DY1O9poo5r9j_4HtbqM
Message-ID: <CAMRc=MfarMrUrdgAwa6dR2JuWooRhaqPmJeEY9H6LhVkCxf4kA@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] pmdomain: thead: Instantiate GPU power sequencer
 via auxiliary bus
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
X-CRM114-CacheID: sfid-20250618_064131_039846_80E72C8D 
X-CRM114-Status: GOOD (  12.33  )
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
aWxjenluc2tpQHNhbXN1bmcuY29tPiB3cm90ZToKPgo+IEluIG9yZGVyIHRvIHN1cHBvcnQgdGhl
IGNvbXBsZXggcG93ZXIgc2VxdWVuY2luZyByZXF1aXJlZCBieSB0aGUgVEgxNTIwCj4gR1BVLCB0
aGUgQU9OIHBvd2VyIGRvbWFpbiBkcml2ZXIgbXVzdCBiZSByZXNwb25zaWJsZSBmb3IgaW5pdGlh
dGluZyB0aGUKPiBjb3JyZXNwb25kaW5nIHNlcXVlbmNlciBkcml2ZXIuIFRoaXMgZnVuY3Rpb25h
bGl0eSBpcyBzcGVjaWZpYyB0bwo+IHBsYXRmb3JtcyB3aGVyZSB0aGUgR1BVIHBvd2VyIHNlcXVl
bmNpbmcgaGFyZHdhcmUgaXMgY29udHJvbGxlZCBieSB0aGUKPiBBT04gYmxvY2suCj4KPiBFeHRl
bmQgdGhlIEFPTiBwb3dlciBkb21haW4gZHJpdmVyIHRvIGNoZWNrIGZvciB0aGUgcHJlc2VuY2Ug
b2YgdGhlCj4gImdwdS1jbGtnZW4iIHJlc2V0IGluIGl0cyBvd24gZGV2aWNlIHRyZWUgbm9kZS4K
Pgo+IElmIHRoZSBwcm9wZXJ0eSBpcyBmb3VuZCwgY3JlYXRlIGFuZCByZWdpc3RlciBhIG5ldyBh
dXhpbGlhcnkgZGV2aWNlLgo+IFRoaXMgZGV2aWNlIGFjdHMgYXMgYSBwcm94eSB0aGF0IGFsbG93
cyB0aGUgZGVkaWNhdGVkIGBwd3JzZXEtdGhlYWQtZ3B1YAo+IGF1eGlsaWFyeSBkcml2ZXIgdG8g
YmluZCBhbmQgdGFrZSBjb250cm9sIG9mIHRoZSBzZXF1ZW5jaW5nIGxvZ2ljLgo+Cj4gU2lnbmVk
LW9mZi1ieTogTWljaGFsIFdpbGN6eW5za2kgPG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KPiAt
LS0KClJldmlld2VkLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tp
QGxpbmFyby5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
