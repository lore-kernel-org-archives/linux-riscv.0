Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5DDC48BF6
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 12:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IK230zWeTaXCiez9+Nq13hl3b7D1NBIfvxp50OAHXc8=; b=X2o0a690y0XQkJ
	4SLFYsU2kzvkhnoi4CxcOYMjJFaXjSbZWoAP8Yl0Hkdl1QOxj6bG8oqEpt3yNq4u5fqShnbIkpQ2s
	Gwuc7nPHwc56a5vVE5sCx10qB8aJW6v6T18KmWfK6cLB6iDUBr4/8AruueD6hEMrYLH0S4TUJGCsd
	sCq4Tu8k9kycFdkjAJFtat4LFRyC1ZxQ2X8Te1DRh/Dxx1jyv6o6Ya4ysVF+hss4hyeniZt1Yfkso
	vcTGSN2jPwkpNxjfvqsJoAlZ94jMBQRrRCNILV3WErYd3uq65w1VYs4suroETXKR79vqaE2TeW4G7
	LpL8m0or6cDcMaL5XgNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reaAu-00000000bNX-2dIh;
	Mon, 26 Feb 2024 12:33:40 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reaAp-00000000bLU-3B9M;
	Mon, 26 Feb 2024 12:33:37 +0000
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6e48e42a350so1099491a34.1;
        Mon, 26 Feb 2024 04:33:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708950814; x=1709555614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7Jt6uOGYEF2aQdl/7Fp6F1BKKNUfz+MFg3gqXg/aVI=;
        b=Yybi0gbhgeh4q5iBxi+4OcWesD2SMRJhSQqDOfYxMkfUvSFLwPvfhVxMYAhTK+KqrM
         hZLHf0n+fXxiErZfGD+/GuZlawLUeNl2QGLFnpS4OLP3jPUWIX7nXnYosEB/c5kLdsOd
         fGXoakSWnzBLp4TfCzx8pqIaCPgFkMRvva3cfhhMbDM+2C7UDW5SrLuKOyNUUjKI9FvO
         4u4RmQMR6tfJyC/ydF/aq4+Ys/9Jzz2WVvOyBbjPi2cqrUe5QN+CUomM+uR8TWwy/wjs
         YARvWQAxNmp8kHKhOjZ///Cg0BA0bK+fpvYwKWtUC8kP7dlUm6XnP0zBe2+9z7SQ6r5V
         COpA==
X-Forwarded-Encrypted: i=1; AJvYcCVGtm7a61wkcSR9RBlzpALaquCu1aqZKFYk8NI/3xcWdIG0T7PZSTviSfMYUV2l5HPeATryFHGI9AZRNwW2B5JBryYrlkzoULLV3J54leM5mOtMeCdc5QYOUduKRM0E4QmsBuwSjQR8tyowPz6yN1K+JUXFDQA=
X-Gm-Message-State: AOJu0YxIUr2tt1oFCz6muc5v+TjHD4gD4KlczdfNw3y2MG5vY1UUYac+
	6Fpo91ut8NNg56m3KFpmjIFMjiZSblzgRWK9SvraA+5pIjwNYSXje2z+KDC1/Uk=
X-Google-Smtp-Source: AGHT+IFLh3aPRjeWcZy9HXkRTjm8lMR8B4xLkwBWajQDoUb3zegXb9KzVJrRHP4NyD59wq7RmNLFcQ==
X-Received: by 2002:a9d:6652:0:b0:6e2:e00d:8e41 with SMTP id q18-20020a9d6652000000b006e2e00d8e41mr7363014otm.17.1708950814313;
        Mon, 26 Feb 2024 04:33:34 -0800 (PST)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id v25-20020ac873d9000000b0042e51739e44sm2395419qtp.32.2024.02.26.04.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 04:33:34 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-42e4f706847so15381151cf.2;
        Mon, 26 Feb 2024 04:33:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW19OXTHSISiu2QucuQvBBzSFOQKY8g6uE9On0aWBVr5ZBzGneUFan1ktjxV4VGGTbCdkI0LyMBAQ7yKr4HGQCmpwDDmRlMgCltZGu0mJyCNTNzfsHxrpbWHYE8R6WnMkZOI6uvHV0kh3AExhf4AetaTaY8byw=
X-Received: by 2002:a05:6902:3c5:b0:dc2:2041:fc49 with SMTP id
 g5-20020a05690203c500b00dc22041fc49mr4426711ybs.5.1708950484424; Mon, 26 Feb
 2024 04:28:04 -0800 (PST)
MIME-Version: 1.0
References: <20240222083946.3977135-1-peterlin@andestech.com> <20240222083946.3977135-6-peterlin@andestech.com>
In-Reply-To: <20240222083946.3977135-6-peterlin@andestech.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Feb 2024 13:27:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWzzrQBq-RzFnfr8pXgeUOuqG8CwCjwDOwfCJzGQ=ZDJA@mail.gmail.com>
Message-ID: <CAMuHMdWzzrQBq-RzFnfr8pXgeUOuqG8CwCjwDOwfCJzGQ=ZDJA@mail.gmail.com>
Subject: Re: [PATCH v9 05/10] riscv: dts: renesas: r9a07g043f: Update
 compatible string to use Andes INTC
To: Yu Chien Peter Lin <peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_043335_818691_E051F714 
X-CRM114-Status: GOOD (  14.11  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, unicorn_wang@outlook.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org, wefu@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBGZWIgMjIsIDIwMjQgYXQgOTo0MOKAr0FNIFl1IENoaWVuIFBldGVyIExpbgo8cGV0
ZXJsaW5AYW5kZXN0ZWNoLmNvbT4gd3JvdGU6Cj4gVGhlIEFuZGVzIGhhcnQtbGV2ZWwgaW50ZXJy
dXB0IGNvbnRyb2xsZXIgKEFuZGVzIElOVEMpIGFsbG93cyBBWDQ1TVAKPiBjb3JlcyB0byBoYW5k
bGUgY3VzdG9tIGxvY2FsIGludGVycnVwdHMsIHN1Y2ggYXMgdGhlIHBlcmZvcm1hbmNlCj4gY291
bnRlciBvdmVyZmxvdyBpbnRlcnJ1cHQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdSBDaGllbiBQZXRl
ciBMaW4gPHBldGVybGluQGFuZGVzdGVjaC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4gUmV2aWV3ZWQtYnk6IExhZCBQcmFi
aGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiBUZXN0ZWQt
Ynk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNv
bT4KPiAtLS0KPiBDaGFuZ2VzIHYxIC0+IHYyOgo+ICAgLSBOZXcgcGF0Y2gKPiBDaGFuZ2VzIHYy
IC0+IHYzOgo+ICAgLSBGaXhlZCBwb3NzaWJsZSBjb21wYXRpYmxlcyBmb3IgQW5kZXMgSU5UQwo+
IENoYW5nZXMgdjMgLT4gdjQ6Cj4gICAtIE5vIGNoYW5nZQo+IENoYW5nZXMgdjQgLT4gdjU6Cj4g
ICAtIEluY2x1ZGUgR2VlcnQncyBSZXZpZXdlZC1ieQo+ICAgLSBJbmNsdWRlIFByYWJoYWthcidz
IFJldmlld2VkL1Rlc3RlZC1ieQo+IENoYW5nZXMgdjUgLT4gdjY6Cj4gICAtIE5vIGNoYW5nZQo+
IENoYW5nZXMgdjYgLT4gdjc6Cj4gICAtIE5vIGNoYW5nZQo+IENoYW5nZXMgdjcgLT4gdjg6Cj4g
ICAtIE5vIGNoYW5nZQo+IENoYW5nZXMgdjggLT4gdjk6Cj4gICAtIE5vIGNoYW5nZQoKQWNrZWQt
Ynk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CnNvIFBhbG1l
ciBjYW4gcGljayBpdCB1cCB3aXRoIHRoZSByZXN0IG9mIHRoZSBzZXJpZXMKKHRoZSBSZW5lc2Fz
IHRyZWUgaW1lcmdlIHdpbmRvdyBmb3IgdjYuOSBoYXMgY2xvc2VkKQoKR3J7b2V0amUsZWV0aW5n
fXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZl
biAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4
ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJ
IGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0
cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
