Return-Path: <SRS0=EjPk=N7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F8EC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 06:08:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C29BC61158
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 06:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C29BC61158
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjI3576a0APAuhq1pHjqfck8H6EorwQK6MfQPddlY64=; b=h1tHjqUhekGaYPpWtrWBievaGk
	N6zqieh2QaFds3YS4IxnX4HBdCHUsBHWoqq2q2Faz+b3e4g+SbDNEiGnLGS417lJD3xRKhLmgYz+s
	ruqNsv3WKlKgu4lefLQlJe7HaEYNSlY0DfzEa7DnBf6kjL+RgpFLiO8E6zN59Fa5n3g+FpKjjc5d/
	W+Gt/tAeguI8TAGCoLcxNUUNc88PcqaQyu6LCzvs9na49gwzvcypXUbYN7DlgOJh4ubk8b4u6sr7C
	7mX5lWQ7tBgmoHv4B1/HiDTw7EP3lrfvKtCbO4IrLDLV8ErFkc96w7tO55ATEtgcWqvVkPQ/rKqFo
	bJJkBr+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mODEB-008Jqu-KY; Thu, 09 Sep 2021 06:08:03 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mODE8-008JqX-PV
 for linux-riscv@lists.infradead.org; Thu, 09 Sep 2021 06:08:02 +0000
Received: by mail-ot1-x330.google.com with SMTP id
 l16-20020a9d6a90000000b0053b71f7dc83so1134379otq.7
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 23:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5IZhKmYjWyUNxqS/JWropfkc5GoYoPNRqG2FrnyCWSw=;
 b=Uby1UFSqv+tObg8zy1Qt9JfEE0z4OOZS1mZrQSbWDi0jjncQe48BLUiEkCBnIT0OEH
 XZEM6zsVARUlXeVJksyht7d1Gib8J5mY4X0cwD8cLeV3nlJJKTPKqo6WI+mrt82lFgq8
 FApkveOpRQYKUP/1FEkXoO8h21Ow3ja9KPCw6IFjzKNNfU+7+afhnR/akfRpZdNGlp0T
 lcEBTEqvbbJdbdGUGw6Y+vIhtwvqzpYx3iPXFHBJw7axVEtjK/5LyF7fYiUNP8a9DCEk
 Bj0kX4U3FzIu5lmRVwoJ1aWhneyWpViN7s5hOqA/z7SRBwEVs51RxSVvIohhBbGaAJHq
 5h9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5IZhKmYjWyUNxqS/JWropfkc5GoYoPNRqG2FrnyCWSw=;
 b=76Rr8IKNwkdWWqv8HfOVxPjnGH1/w0bB+4ndLBrQG7KPZ30UnT+MxjYwmiDlIdWhyn
 YCEzUlHM3JjM6v2SLPKEchXgUSnFXX3Iu2EHShtGjoFLp2UEhPZDp4E1iTkA5gtpEEHv
 OHhsqeAMKyA2lteD1QIcOcWWMOl2nrfsc0G2YmmPlI7N2UjcJbKSQfVnmxbmobu21XSb
 d+WJjvMgvFxps3jKvHY7PtvXpQFCCHjEcE8VgUxWGYT+LI01dztj0dRwoNz5k8ZCbKhx
 wLBpVsOs+hobEupK3T4mn2cEAf701lACgXYo3eoCo6iboqLse0QY+je1BAmP4CX4mkif
 HuKA==
X-Gm-Message-State: AOAM530WU2MugaMVdXAxCe9ZbyXMZzam0X3kSEENXdvQ3zkTkxKl0Rf3
 fYI549tQ/uafjXoyGLNrGpY=
X-Google-Smtp-Source: ABdhPJz2e0pQIKzbERrP4yOrC1kq1zJGwp23agv3qtyCHWfk+VzWPFR9D44RgTj57Sc8MlD8s8FyJg==
X-Received: by 2002:a05:6830:4084:: with SMTP id
 x4mr1039349ott.280.1631167679964; 
 Wed, 08 Sep 2021 23:07:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 y7sm180455oov.36.2021.09.08.23.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 23:07:59 -0700 (PDT)
Subject: Re: [PATCH] Enable '-Werror' by default for all kernel builds
To: Christoph Hellwig <hch@infradead.org>, Marco Elver <elver@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, kasan-dev@googlegroups.com,
 Christian =?unknown-8bit?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org
References: <20210906142615.GA1917503@roeck-us.net>
 <CAHk-=wgjTePY1v_D-jszz4NrpTso0CdvB9PcdroPS=TNU1oZMQ@mail.gmail.com>
 <YTbOs13waorzamZ6@Ryzen-9-3900X.localdomain>
 <CAK8P3a3_Tdc-XVPXrJ69j3S9048uzmVJGrNcvi0T6yr6OrHkPw@mail.gmail.com>
 <YTkjJPCdR1VGaaVm@archlinux-ax161>
 <75a10e8b-9f11-64c4-460b-9f3ac09965e2@roeck-us.net>
 <YTkyIAevt7XOd+8j@elver.google.com> <YTmidYBdchAv/vpS@infradead.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <a04c4c37-7151-ef7e-09ce-a61ac7b12106@roeck-us.net>
Date: Wed, 8 Sep 2021 23:07:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTmidYBdchAv/vpS@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_230800_874940_9E9EB5B0 
X-CRM114-Status: GOOD (  19.15  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gOS84LzIxIDEwOjU4IFBNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBPbiBXZWQsIFNl
cCAwOCwgMjAyMSBhdCAxMTo1ODo1NlBNICswMjAwLCBNYXJjbyBFbHZlciB3cm90ZToKPj4gSXQn
ZCBiZSBnb29kIHRvIGF2b2lkLiBJdCBoYXMgaGVscGVkIHVuY292ZXIgYnVpbGQgaXNzdWVzIHdp
dGggS0FTQU4gaW4KPj4gdGhlIHBhc3QuIE9yIGF0IGxlYXN0IG1ha2UgaXQgZGVwZW5kZW50IG9u
IHRoZSBwcm9ibGVtYXRpYyBhcmNoaXRlY3R1cmUuCj4+IEZvciBleGFtcGxlIGlmIGFybSBpcyBh
IHByb2JsZW0sIHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4gCj4gSSdtIGFsc28gc2VlaW5nIHF1aXRl
IGEgZmV3IHN0YWNrIHNpemUgd2FybmluZ3Mgd2l0aCBLQVNBTiBvbiB4ODZfNjQKPiB3aXRob3V0
IENPTVBJTFRfVEVTVCB1c2luZyBnY2MgMTAuMi4xIGZyb20gRGViaWFuLiAgSW4gZmFjdCB0aGVy
ZSBhcmUgYQo+IGZldyB3YXJuaW5ncyB3aXRob3V0IEtBU0FOLCBidXQgd2l0aCBLQVNBTiB0aGVy
ZSBhcmUgYSBsb3QgbW9yZS4KPiBJJ2xsIHRyeSB0byBmaW5kIHNvbWUgdGltZSB0byBkaWcgaW50
byB0aGVtLgo+IAo+IFdoaWxlIHdlJ3JlIGF0IGl0LCB3aXRoIC1XZXJyb3Igc29tZXRoaW5nIGxp
a2UgdGhpcyBpcyByZWFsbHkgZnV0aWxlOgo+IAo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9vYmplY3QuYzogSW4gZnVuY3Rpb24g4oCYYW1kZ3B1X2JvX3N1cHBvcnRfdXN3Y+KA
mToKPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmM6NDkzOjI6IHdh
cm5pbmc6ICN3YXJuaW5nCj4gUGxlYXNlIGVuYWJsZSBDT05GSUdfTVRSUiBhbmQgQ09ORklHX1g4
Nl9QQVQgZm9yIGJldHRlciBwZXJmb3JtYW5jZSB0aGFua3MgdG8gd3JpdGUtY29tYmluaW5nIFst
V2NwcAo+ICAgIDQ5MyB8ICN3YXJuaW5nIFBsZWFzZSBlbmFibGUgQ09ORklHX01UUlIgYW5kIENP
TkZJR19YODZfUEFUIGZvciBiZXR0ZXIgcGVyZm9ybWFuY2UgXAo+ICAgICAgICB8ICBefn5+fn5+
Cj4gCgpJIGhhdmUgYmVlbiB3b25kZXJpbmcgaWYgYWxsIHRob3NlICN3YXJuaW5nICJlcnJvcnMi
IHNob3VsZCBlaXRoZXIKYmUgcmVtb3ZlZCBvciBiZSByZXBsYWNlZCB3aXRoICIjcHJhZ21hIG1l
c3NhZ2UiLgoKR3VlbnRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
