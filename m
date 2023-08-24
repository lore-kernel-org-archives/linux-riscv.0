Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C82BC27C40
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 19:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=obCToZj+DB+Y+f2BBC9/WFm/B55odEkf4pQ939pLkMY=; b=VasxNvf9mtU7Y4
	K1yqUHmhuOVRB08JSzgebcn5QFCrGxrt1TXcCuCafz47F7l+d/rGxjAerga5/FzhSAiwO556Rt956
	T2bf6bCYAQFSJosW75OKhaWA7Uf1GKmNdrmnHRKnnFjcTLB/Pg2Q8xscgB8rr3uiZON0Zt8jMiW6h
	Gg6IDif1U2/83N5jRCejCCXd5XQBf5+2nVgMyDJCa4xlzN/0dWh4LtgbGdZhjTI/b1HRObtxX34oQ
	qLXjbKOzN7l4c6JK6SYi1TW0z1uE5hzW3WD1C+aA4J6aGFA2GYiTKua0+s9SwJsYnxyd0Jfs0YYPI
	RXhjlqE8G1t1NMXURKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZFcP-003drM-0W;
	Thu, 24 Aug 2023 19:03:45 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZFcN-003dqw-19
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 19:03:44 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3a7d7de894bso132569b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Aug 2023 12:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692903818; x=1693508618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIOxOAbASEK1ExaxZknXwWWIX7BvuBO6qbXSqSkkplM=;
        b=in7SDO1nCpMs1pW6kZW2GONP33S6cr0Tzr+D5zoGf9HonygP8+Ho7kWZjEoOKA6s4g
         d45VlJ3vVhh4ACl/LqFkXaO6QnczQHQEIYYLcD8RA32+ejXBnWfwneKIsA51JyVJQXSx
         E13fyTljsypiqKlxyoOqjClb4wwL/+i2nmGAsnEFF51vn2E1vWxKyb8skn90GlH869CV
         zcxOC0fDSVNKJlZcGfzEkSIPtie6yKijQyiP9J6zUeRMAOhxKYaa6NaN36Ow6+1w8FAH
         oTemG/zutFjoDyqFV7AZLpo6aCZpB5ZtrdBkImv4isq7MqSEQZZriBzlnXmpSqan0vMF
         7zFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692903818; x=1693508618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIOxOAbASEK1ExaxZknXwWWIX7BvuBO6qbXSqSkkplM=;
        b=IwBxIRSgaWszZQj18PGae/mjnQQXj6WAdHc4rGh/p0rGwRE6matbspJ7o0/YFgIQbZ
         lT8vEJ0XxSJS05GPB9O+nTqGiExjYAD/t2QdsaBFv1nTXedkZWt29WS0UJvWA1esLJFN
         VMaDBQLtO6PWDgOI/SIHhYXbHe8OqCkcJI7QjV/ZPJIiSdP51Wn36aKhgYkLvjPyEeUj
         f+NmgIzyF+nx+iWypTSxyLEy1K6GRebF7GQpiVTEqa1fz7jVpobo/c/+hcc+HtN59K8c
         GmOZcyg/lTbYBAebJzFPZZLqCwJQlGKpn33//DlOkn2fo9FylFB6o9YWLasDn9/C5YU/
         sJpA==
X-Gm-Message-State: AOJu0Yy6SjjsyGnN49wYBeRpF9j24Ux3CzhENNKcbQnt0S1HgOfAqjM3
	agMhVmeOTPMjzd+7jesxjVK5XvHd4WG1f64g2tQ40Q==
X-Google-Smtp-Source: AGHT+IEXfuxs+RNxF7LKh6GmsWDesiSbOR2nqSO8VUt1beRy2Mdk4QadJhGLc+bzDHcxONvRodJuItf2jppA6SS8Bts=
X-Received: by 2002:a05:6808:10cd:b0:3a7:458e:3df4 with SMTP id
 s13-20020a05680810cd00b003a7458e3df4mr600019ois.56.1692903817600; Thu, 24 Aug
 2023 12:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230815203442.1608773-8-samitolvanen@google.com>
 <20230815203442.1608773-10-samitolvanen@google.com> <d3696b2a-3d21-4ab6-8cef-20b8ee21742f@rivosinc.com>
In-Reply-To: <d3696b2a-3d21-4ab6-8cef-20b8ee21742f@rivosinc.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 24 Aug 2023 12:03:00 -0700
Message-ID: <CABCJKud+24TGRX7b8Tb83HdWApC83adY=o2JpejRTHA4nkfpMg@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] riscv: Deduplicate IRQ stack switching
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, 
	Guo Ren <guoren@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Fangrui Song <maskray@google.com>, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_120343_411447_B0BA01A2 
X-CRM114-Status: UNSURE (   9.64  )
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

SGkgQ2zDqW1lbnQsCgpPbiBUaHUsIEF1ZyAyNCwgMjAyMyBhdCAxOjEy4oCvQU0gQ2zDqW1lbnQg
TMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IFNvbWUgZGVmaW5lcyBmb3Ig
c3RhY2sgZnJhbWUgb2Zmc2V0cyBjb3VsZCBiZSBhZGRlZCBpbiBhc20tb2Zmc2V0cyBmb3IKPiB0
aGUgb2Zmc2V0czoKPgo+ICAgICAgICAgREVGSU5FKFNUQUNLRlJBTUVfU0laRV9PTl9TVEFDSywg
QUxJR04oc2l6ZW9mKHN0cnVjdCBzdGFja2ZyYW1lKSwKPiBTVEFDS19BTElHTikpOwo+ICAgICAg
ICAgT0ZGU0VUKFNUQUNLRlJBTUVfRlAsIHN0YWNrZnJhbWUsIGZwKTsKPiAgICAgICAgIE9GRlNF
VChTVEFDS0ZSQU1FX1JBLCBzdGFja2ZyYW1lLCByYSk7Cj4KPiBBbmQgeW91IGNhbiBwcm9iYWJs
eSBpbmNyZW1lbnQgdGhlIHN0YWNrIGF0IG9uY2UgKHNhdmluZyB0d28gYWRkaSBpbgo+IHByb2xv
Z3VlL2VwaWxvZ3VlKSBmb3IgYm90aCBSQSBhbmQgRlAgYW5kIHJldXNlIHRoZSBhc20tb2Zmc2V0
cyBkZWZpbmVzOgo+Cj4gICAgICAgICBhZGRpICAgIHNwLCBzcCwgLVNUQUNLRlJBTUVfU0laRV9P
Tl9TVEFDSwo+ICAgICAgICAgUkVHX1MgICByYSwgU1RBQ0tGUkFNRV9SQShzcCkKPiAgICAgICAg
IFJFR19TICAgczAsIFNUQUNLRlJBTUVfRlAoc3ApCj4gICAgICAgICBhZGRpICAgIHMwLCBzcCwg
U1RBQ0tGUkFNRV9TSVpFX09OX1NUQUNLCgpUaGFua3MgZm9yIHRha2luZyBhIGxvb2shCgpJIGp1
c3QgY29waWVkIHRoZSBleGlzdGluZyBpbmxpbmUgYXNzZW1ibHkgaGVyZSwgYnV0IEkgZG8gYWdy
ZWUgdGhhdApkZWZpbmluZyBzdGFjayBmcmFtZSBvZmZzZXRzIGFuZCBhdm9pZGluZyB0aGUgZXh0
cmEgYWRkaXMgaXMgYSBjbGVhbmVyCmFwcHJvYWNoLiBJJ2xsIGNoYW5nZSB0aGlzIGluIHYzLgoK
U2FtaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
