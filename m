Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672A3C25B48
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 08:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HOTefhxl1gwhoWm3Fl1qlf0CKbgfkyspf8WvpFb+rCI=; b=H8kGs+wTLM3KVa
	DvpJjZ9dU4Z0MkZnm9AL8gh0Im7JwUQihr08RWiFY3P3cTn1YpGEWAm4YCjyRTrojo06joTWjSwmF
	RacHGtbrCivByOf/rKh7XobMO0HOHQn99ij05/jm74lYkkYv6FYIlNMFacrvtVDw2PBHGchnxGSxH
	MQkmGT4ARVmjOuFlXS6CyzOOSLx1/nl+9cKlSbKEXAIZ3tLqRUBynovMlvGhu3FY9iSRwf/hVbLOD
	NCHdMaijKzJKXVpxAEyeWNrpQHeyf9RLSb8wfxus5JL3Hz808xPr8rorwkMeN1u0Z/hbW/X0PyfvI
	kjXwqPD7Sn/BTGGSbQZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvwBV-00E19S-1I;
	Thu, 26 Oct 2023 08:57:45 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvwBT-00E17Q-13
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 08:57:44 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-32d9effe314so444078f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 26 Oct 2023 01:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698310659; x=1698915459; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZ/824BJO1d/EHWcRhN/veSLWctMw07x5UCm1ELLYiY=;
        b=FWxbLM0pgjPZJlh3fI2XJjuin5ozs50tB/EohSXhr6fCFEAmBgkISXydVcquWjD2dg
         ZbWo2sNC00pzCURrburQ734PDVShnptU+4/vOAMIiGFk59HmQzfGWmxKwkdLhhmHOBDu
         BIt1D8z9SuaP8lSD7cnRsS6vv9Ff+ZzXgbr88naGtLGTRwUKmXC7ICMAGfQ20dZh7GoU
         260iLUlbh+Fi/PCXGTrlTqaAntTweVo+NxmBAi5JYLnWPWLjeIuoGGWii3kV3dSiJKsU
         fuOJyx08Pk90Ju991pKgdGSamzMFtEtfOyyMdTDiOuaFeWnH9+ZHax3NyxH3lQvMaxL6
         tTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698310659; x=1698915459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZ/824BJO1d/EHWcRhN/veSLWctMw07x5UCm1ELLYiY=;
        b=uPCR4mrnTg65mv8AcrpyD+C9cNGijvAuAW19hDhZC4l8HUwCVjxgPo9DZ9msbSmbyL
         18No4HlF1DvIbWnssApDDpbW5CeI/0aedWk/4gubPwsBajT8XqQXLhG9BEchLaCSZBUT
         sR/BNltDc2yuHAiqXW89Ixaut3GH0d3wR1PQKOnj/Q4Qp0xnSLeoUWSECx3WoQHuPdyu
         qy6dBK+GOSjne/ckhNZxfM8ht1T2y/F9R/zNrFmDBRo2reOHNrXif4tNrXmGx2XctP28
         qrlWob8PuqpWi+ob2u2OOzTIwYOD/EB52Yhr5TLYukZ/cwyp8WP459zTcCqcWO7m0Bx6
         +JWg==
X-Gm-Message-State: AOJu0YziJoO0pOvTTy/ZfGbiV6r3jrLJTIgCRNxxeF6o7Uib5LevKuf5
	QerhvDEKyx/plS2lXMQbnzy0qZ8GhdFCIS9LpdyxXg==
X-Google-Smtp-Source: AGHT+IH3muhS4J2stt28w/fF1mg4E8iD8ocY1a/XGGeNGDZ1PbgBpfdORtGH6uJ3k03W0uvTXNi6DVixxCLk5iXWVGY=
X-Received: by 2002:a5d:464a:0:b0:31f:98b4:4b62 with SMTP id
 j10-20020a5d464a000000b0031f98b44b62mr13281281wrs.37.1698310658773; Thu, 26
 Oct 2023 01:57:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230928151846.8229-1-alexghiti@rivosinc.com> <305b4dec-c99d-3cee-4563-8d7dcbae9384@ghiti.fr>
 <20231003090443.67a2e2692b68211e05b53248@linux-foundation.org>
In-Reply-To: <20231003090443.67a2e2692b68211e05b53248@linux-foundation.org>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 26 Oct 2023 10:57:27 +0200
Message-ID: <CAHVXubi5C0hBaXx5tqVHZAJSd1zvHRqoxUEkk9ZbmZ5mq2=mAw@mail.gmail.com>
Subject: Re: [PATCH -fixes 0/2] Fix set_huge_pte_at()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Jones <ajones@ventanamicro.com>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, 
	Ryan Roberts <ryan.roberts@arm.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, "linux-mm@kvack.org" <linux-mm@kvack.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_015743_363375_CDC92C0C 
X-CRM114-Status: GOOD (  13.09  )
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

SGkgQW5kcmV3LAoKT24gVHVlLCBPY3QgMywgMjAyMyBhdCA2OjA04oCvUE0gQW5kcmV3IE1vcnRv
biA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIDMgT2N0IDIw
MjMgMTc6NDM6MTAgKzAyMDAgQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPiB3cm90ZToK
Pgo+ID4gK2NjIEFuZHJldzogV291bGQgIHlvdSBtaW5kIHRha2luZyB0aGlzIHBhdGNoc2V0IGlu
IHlvdXIgdHJlZSBmb3IgdGhlCj4gPiBuZXh0IHJjPyBUaGlzIHBhdGNoc2V0IGRlcGVuZHMgb24g
YSBwcmV2aW91cyBmaXggZm9yIGFybTY0IHRoYXQgeW91Cj4gPiBtZXJnZWQgaW4gcmM0IHdoaWNo
IGlzIG5vdCBpbiB0aGUgcmlzY3YgLWZpeGVzIGJyYW5jaCB5ZXQuCj4gPgo+ID4gSSBzYXcgd2l0
aCBQYWxtZXIgYW5kIGhlIHNob3VsZCBhY2sgdGhpcyBzaG9ydGx5Lgo+Cj4gV2VsbCBJIGdyYWJi
ZWQgdGhlbSBpbnRvIG1tLmdpdCdzIG1tLWhvdGZpeGVzLXVuc3RhYmxlIHF1ZXVlLiAgQWxsCj4g
YmVpbmcgd2VsbCBJJ2xsIG1vdmUgdGhlbSBpbnRvIG1tLWhvdGZpeGVzLXN0YWJsZSB3aXRoaW4g
YSB3ZWVrIHRoZW4KPiBpbnRvIExpbnVzIHNob3J0bHkgYWZ0ZXIuCgpUaG9zZSBmaXhlcyBmaW5h
bGx5IGRpZCBub3QgbWFrZSBpdCB0byA2LjYsIEkgd2FzIGhvcGluZyBmb3IgdGhlbSB0bwpsYW5k
IGluIC1yYzYgb3IgLXJjNzogZm9yIHRoZSBmdXR1cmUsIHdoYXQgc2hvdWxkIGhhdmUgSSBkb25l
IHRvIGF2b2lkCnRoYXQ/CgpUaGFua3MsCgpBbGV4Cgo+Cj4gVW5sZXNzIHNvbWV0aGluZyBjaGFu
Z2VzLiAgSXQncyBvZGQgdGhhdCB0aGUgcmlzY3YgdHJlZShzKSBhcmVuJ3Qgc2V0Cj4gdXAgdG8g
bWVyZ2UgZml4ZXMgYWdhaW5zdCAtcmM0PwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
