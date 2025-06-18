Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4D2C7115D
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 15:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0crm3zngecKuVCWZvuP16GKLL3jDmLf7yXEGSQuFfqI=; b=lDNafu94qu/eRd
	3dH1ERFtm0KEXLrP+/dcvvyt+1FaS1wIHpPkeDWDeHipfIJkEXJA1obmbK+YMXOOB9GCgxVyFkvTb
	YiJfTIF5cXIG53Wi/vilptHKzUi6cS15sNhje8ddq8WvVxOGxQTRbP/8YIoMIJFlzGlAeHl6sCHIA
	52bzUd/Pi3MJ1DHP0f/cQcWAT7tRO3fSHyB7RNHfi7/5qbve2OOzjTwuE/FLAzIhRPhVdYOAgHTic
	cj4wLAYwLcleW0/mCNdOCz33Kt+axkzNcuDZ9w9/wCVR8cSnuNfHJXaW2HhFHIWJFQ3nBMJRQ/msq
	2iMfZrA27DSGa8O1tSpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuh0-0000000Aarl-1IAn;
	Wed, 18 Jun 2025 15:27:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRt3r-0000000AKyR-0ygs
	for linux-riscv@bombadil.infradead.org;
	Wed, 18 Jun 2025 13:42:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eEO+Aw2g4Ye3zeBEqfCg7cLkZgwkmnjuAHAb/18yzBw=; b=VQTNAu9XDuFsWQOMaObPt2Jguo
	hGhSbHe31+sljkdiQbpTOOc/4Ke9Z8LVmar3ZV2BBIXStEU5BNXp+xQ88nt+blPrbRfEZdZfjHgv1
	Vdu0b3OD+do7q6LgTK4CuDlK5xk6E304skCY7NRAi6T6y8kSxV+OuACXXkfwhx2IBkzsNnCTMyqhy
	eUo85SZzbK8/I0s32376GFa8CwiKC4HIqQ9JurJkVbnKLhCaz2nryA/EOoSw5hA3cKfvQhfGQUlLP
	1Fei7FD9e7KJNY6iiC9EmJLBhqCvNwcJO45j8IQ/0drrBN7jHx0Sdll9voTNme9zpy3N+O4i9xrZr
	hSP7yKQg==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRt3p-0000000445y-07nr
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 13:42:42 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-235a3dd4f0dso44781885ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 06:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750254158; x=1750858958; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eEO+Aw2g4Ye3zeBEqfCg7cLkZgwkmnjuAHAb/18yzBw=;
        b=crV+RFrfrdwqAIAHmrnEYKqDz+SbMqahbSR2xWn3Nd8oCuFupLN8PRScpA8OPaxbgc
         B2hTBW1KHOSNy6Rb7MAkJAflS1RRF5NGuFIL3ToR023nvffZUoaeavYjeMXc/NvAw3XL
         ELPP+N3AVegnM3F7asv3llqpPNkDSHbnWsYQMxubbACPnWqagQKOhPx3FndbWKiSU3S6
         Q2SrUcOMmUBGwFyfQU5uwxpHazhFpzLdSyXRablkDGXRAb799NzXFBD9WMbtolBVE7ku
         YAVajCOvHheovyyFkGInpBZ79BkfH4gr/n5jAXs7+T3LHP67J76leDjOUrcCfJTC3Srq
         Vimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750254158; x=1750858958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eEO+Aw2g4Ye3zeBEqfCg7cLkZgwkmnjuAHAb/18yzBw=;
        b=oJvdvaJKHMi/5RcBu9WY6mtolQNENCefB+6zh6DWINJ7swedAVgl+/aU6d4sYHaPoP
         JL1BDZa3Tf11Gikk5lRqAUoskWtWmuI0nl1TQ4RsQmcAFjqS6+59qVwpv/cxSxhscHfz
         3xIg6JefbREkSHP2R8TVc+I9QfR5YPpJocFNPvW+03B0xZo8r9uIR7GhBwBT1K1eTrc/
         ifP4kQNVKF2KesLaglr9+lDfcLNnsNMDZlXUCb4gXT8yzFsBk/ZFqVNbkxu7sZ9rJDba
         omSQ6JIEgpHTiR2/H9/f1fEUWgMZHFh8ue2StrYWI5sY0bsdxI9jZjNEiGrje9tXKXoX
         gM8A==
X-Forwarded-Encrypted: i=1; AJvYcCVsSbAMd3MivZ8dnx/R2I4ZyhVvMZjC8uZrtYmqujfYf/iIKDCIbqUMIsfN4UUC0YIgX2kO903VyyTDrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzcM+TUPU2Vn3VfB+BcNNs+ZJ6Fl1pRYJhwyFm9KvgNkF/qtrj
	SNbXYiZ7amClqwMbJw0jYZ+qjo2EWvCJDHuUfyy/MwBTVC8+h/ljdUPr+5NKuoPunINuDyN6GQ9
	hk40d+fevMOaq5crsaATwY5qiOyWC5rsGuVmo1U8jNg==
X-Gm-Gg: ASbGncvPvket5qP0WP648zMTWmBHpi4P8FcrkslHaUqoAjZN6mOEycTuT4yZWexJfPC
	OxCJyOVJszHTHRX50zoYk5Ou0NG/5+N0S8eVPs5jQFvwY89ZGbV5iZuUs1GU5tOzTzoe+JOzQJX
	3+piFmV0fXYRTBolA8DrzZbsekKVHIBq44sX7s/2SboDi/EoyD2a566xffMhkHrL8DYB0hSgMTI
	g==
X-Google-Smtp-Source: AGHT+IE9RRF0iBcbNFXcUb8SkJRKabvVWjmiE253LTqxfYGXwndQn6/QT3ohHBsxRY1SrMjuBvVMrN/uQK3qBsQXw3o=
X-Received: by 2002:a17:902:cf0e:b0:234:d7b2:2aa9 with SMTP id
 d9443c01a7336-2366b1221femr273087145ad.29.1750254158312; Wed, 18 Jun 2025
 06:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618102229eucas1p2a5d38013ee52a8a4a10d43449073e79e@eucas1p2.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com> <20250618-apr_14_for_sending-v5-4-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-4-27ed33ea5c6f@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:42:23 +0200
X-Gm-Features: AX0GCFtH0tHQpQVePKw4GRZe0_n4DXj2kfns9aQPVtqgBIhjJI4B39bCzPcceGU
Message-ID: <CAMRc=Mcv6KJOCypOHF-KtFk6N-Z=eoMCqH0KuuUND=8J1YvrEw@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] drm/imagination: Use pwrseq for TH1520 GPU power management
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
X-CRM114-CacheID: sfid-20250618_144241_202853_A5400A17 
X-CRM114-Status: GOOD (  14.86  )
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
aWxjenluc2tpQHNhbXN1bmcuY29tPiB3cm90ZToKPgo+IFVwZGF0ZSB0aGUgSW1hZ2luYXRpb24g
UFZSIERSTSBkcml2ZXIgdG8gbGV2ZXJhZ2UgdGhlIHB3cnNlcSBmcmFtZXdvcmsKPiBmb3IgbWFu
YWdpbmcgdGhlIHBvd2VyIHNlcXVlbmNlIG9mIHRoZSBHUFUgb24gdGhlIFQtSEVBRCBUSDE1MjAg
U29DLgo+Cj4gVG8gY2xlYW5seSBoYW5kbGUgdGhlIFRIMTUyMCdzIHNwZWNpZmljIHBvd2VyIHJl
cXVpcmVtZW50cyBpbiB0aGUKPiBnZW5lcmljIGRyaXZlciwgdGhpcyBwYXRjaCBpbXBsZW1lbnRz
IHRoZSAiZHJpdmVyIG1hdGNoIGRhdGEiIHBhdHRlcm4uCj4gVGhlIHB2cl9zb2NfZGF0YSBzdHJ1
Y3QsIGFzc29jaWF0ZWQgd2l0aCBhIGNvbXBhdGlibGUgc3RyaW5nIGluIHRoZQo+IG9mX2Rldmlj
ZV9pZCB0YWJsZSwgbm93IGhvbGRzIHBvaW50ZXJzIHRvIHBsYXRmb3JtLXNwZWNpZmljIHBvd2Vy
X29uIGFuZAo+IHBvd2VyX29mZiBmdW5jdGlvbnMuCj4KPiBBdCBwcm9iZSB0aW1lLCB0aGUgZHJp
dmVyIGluc3BlY3RzIHRoZSBhc3NpZ25lZCBwb3dlcl9vbiBmdW5jdGlvbgo+IHBvaW50ZXIuIElm
IGl0IHBvaW50cyB0byB0aGUgcHdyc2VxIHZhcmlhbnQsIHRoZSBkcml2ZXIgY2FsbHMKPiBkZXZt
X3B3cnNlcV9nZXQoImdwdS1wb3dlciIpLCByZXF1aXJpbmcgYSB2YWxpZCBzZXF1ZW5jZXIgYW5k
IGRlZmVycmluZwo+IHByb2JlIG9uIGZhaWx1cmUuIE90aGVyd2lzZSwgaXQgZmFsbHMgYmFjayB0
byBpdHMgc3RhbmRhcmQgbWFudWFsIHJlc2V0Cj4gaW5pdGlhbGl6YXRpb24uCj4KPiBUaGUgcnVu
dGltZSBQTSBjYWxsYmFja3MsIHB2cl9wb3dlcl9kZXZpY2VfcmVzdW1lKCkgYW5kCj4gcHZyX3Bv
d2VyX2RldmljZV9zdXNwZW5kKCksIGNhbGwgdGhlIHBvd2VyX29uIGFuZCBwb3dlcl9vZmYgZnVu
Y3Rpb24KPiBwb2ludGVycy4gSGVscGVyIGZ1bmN0aW9ucyBmb3IgYm90aCBtYW51YWwgYW5kIHB3
cnNlcS1iYXNlZCBzZXF1ZW5jZXMKPiBhcmUgaW50cm9kdWNlZCB0byBzdXBwb3J0IHRoaXMuCj4K
PiBSZXZpZXdlZC1ieTogVWxmIEhhbnNzb24gPHVsZi5oYW5zc29uQGxpbmFyby5vcmc+Cj4gU2ln
bmVkLW9mZi1ieTogTWljaGFsIFdpbGN6eW5za2kgPG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4K
PiAtLS0KCklNTyBpdCdzIG11Y2ggYmV0dGVyIHRoaXMgd2F5LCB0aGFua3MuCgpSZXZpZXdlZC1i
eTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
