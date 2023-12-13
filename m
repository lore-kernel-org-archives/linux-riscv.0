Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B79DC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 08:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JrF90/aybznrFzgeSocVJPeZqBv39QYCEHEsTIeHO90=; b=HqoGkx+S0CCNwL
	2qkJ9aeitxNw89rlWcDyOW9MwsnAlspvNn9tSWch9ugojFMpeX54rw0DT3pFnetfS6RsfL5WFPKoa
	rBxSC7H7kSdp5rgpgfVI6edL4eSgWxncS8fpFkpIWh+KWFEjrmGtrunBWkZampVgxGaZ2ebR8zauT
	Mx7jCZdf15OXjHPDZi/1XMXZNep8Rvf3L/dlnMY0mjECK/rBuGJr6CmBGpCGXI8iru16+bSn/lPhi
	qRU2Zg2WGax1wWBYc6DmS+nqsTvbtJgwzD/y4AUIjgbK5APZwMVzfJmN8nHJTVSyNtnYpHaFuFUVF
	YNyijuozhwvCF514+fcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDKjI-00E2iQ-1p;
	Wed, 13 Dec 2023 08:36:32 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDKjF-00E2h5-0n
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 08:36:30 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-20315d10afaso603507fac.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 00:36:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702456587; x=1703061387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6anvPPkB7zC5RyRZfp8ATi41Ad4dEiA0WoUIsmcFlew=;
        b=lp9VXWn2CLD24kZngIiRFCXUn5UUXKxMM3Xtl3Iqyes4p979BNX+15SFFRputqsOab
         XizACuHmC2UELbSum6HY76qS/WmTFKUvmNWgk12o1wabMz/wyIl25qdkdLilzAsX/8SW
         3CNloxYN25wTAP+aYqDMxc/mmCT2lOGoO7eE1OSXXDTdSGJRXHxrToziZZtYRsb1Cx2E
         PG2KaV3XXt7bWXUc3jOrrbFuVdaGb9XRUZNJWkABc6YPhbnYhDcHzdWZEOP41XzIKTeM
         jX17NWL4VCECofyWE6IWk3yy+AijJNb846w2jFL5QyM+Bk2QuB6MMvDAzK99U1WirLeD
         1YoQ==
X-Gm-Message-State: AOJu0YyqIrntBRv48OurwmCJCB10bQk7Stcv8CvhzYhBvjRH1ATkpCID
	xiV47eDMoI0j8Qhi9YSLbSjx4P2w5LUDNg==
X-Google-Smtp-Source: AGHT+IHNopDLIp7weXMDsNfyOP6Vf2RYgQSR+NwDduP5/6PgZpkOo/gaNE1qYlL3GVnFHlgkimUp4A==
X-Received: by 2002:a05:6871:414d:b0:203:2c18:8083 with SMTP id lb13-20020a056871414d00b002032c188083mr98750oab.27.1702456587433;
        Wed, 13 Dec 2023 00:36:27 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id u2-20020a816002000000b005d0fea7ad01sm4466646ywb.122.2023.12.13.00.36.27
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 00:36:27 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5e2ce5c8f04so547527b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 00:36:27 -0800 (PST)
X-Received: by 2002:a81:a1ce:0:b0:5e2:2917:273d with SMTP id
 y197-20020a81a1ce000000b005e22917273dmr1045743ywg.43.1702456586772; Wed, 13
 Dec 2023 00:36:26 -0800 (PST)
MIME-Version: 1.0
References: <20231212213457.132605-1-alexghiti@rivosinc.com> <20231212213457.132605-2-alexghiti@rivosinc.com>
In-Reply-To: <20231212213457.132605-2-alexghiti@rivosinc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Dec 2023 09:36:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWMuSBKHaPGKTf2pGdgsD5dMaxcrZw3Ox3G=ShjnOAKnQ@mail.gmail.com>
Message-ID: <CAMuHMdWMuSBKHaPGKTf2pGdgsD5dMaxcrZw3Ox3G=ShjnOAKnQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mm: Introduce flush_cache_vmap_early()
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-arch@vger.kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_003629_290680_29C2E243 
X-CRM114-Status: GOOD (  20.95  )
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

T24gVHVlLCBEZWMgMTIsIDIwMjMgYXQgMTA6MzbigK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhn
aGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+IFRoZSBwY3B1IHNldHVwIHdoZW4gdXNpbmcgdGhl
IHBhZ2UgYWxsb2NhdG9yIHNldHMgdXAgYSBuZXcgdm1hbGxvYwo+IG1hcHBpbmcgdmVyeSBlYXJs
eSBpbiB0aGUgYm9vdCBwcm9jZXNzLCBzbyBlYXJseSB0aGF0IGl0IGNhbm5vdCB1c2UgdGhlCj4g
Zmx1c2hfY2FjaGVfdm1hcCgpIGZ1bmN0aW9uIHdoaWNoIG1heSBkZXBlbmQgb24gc3RydWN0dXJl
cyBub3QgeWV0Cj4gaW5pdGlhbGl6ZWQgKGZvciBleGFtcGxlIGluIHJpc2N2LCB3ZSBjdXJyZW50
bHkgc2VuZCBhbiBJUEkgdG8gZmx1c2gKPiBvdGhlciBjcHVzIFRMQikuCj4KPiBCdXQgb24gc29t
ZSBhcmNoaXRlY3R1cmVzLCB3ZSBtdXN0IGNhbGwgZmx1c2hfY2FjaGVfdm1hcCgpOiBmb3IgZXhh
bXBsZSwKPiBpbiByaXNjdiwgc29tZSB1YXJjaHMgY2FuIGNhY2hlIGludmFsaWQgVExCIGVudHJp
ZXMgc28gd2UgbmVlZCB0byBmbHVzaAo+IHRoZSBuZXcgZXN0YWJsaXNoZWQgbWFwcGluZyB0byBh
dm9pZCB0YWtpbmcgYW4gZXhjZXB0aW9uLgo+Cj4gU28gZml4IHRoaXMgYnkgaW50cm9kdWNpbmcg
YSBuZXcgZnVuY3Rpb24gZmx1c2hfY2FjaGVfdm1hcF9lYXJseSgpIHdoaWNoCj4gaXMgY2FsbGVk
IHJpZ2h0IGFmdGVyIHNldHRpbmcgdGhlIG5ldyBwYWdlIHRhYmxlIGVudHJ5IGFuZCBiZWZvcmUK
PiBhY2Nlc3NpbmcgdGhpcyBuZXcgbWFwcGluZy4gVGhpcyBuZXcgZnVuY3Rpb24gaW1wbGVtZW50
cyBhIGxvY2FsIGZsdXNoCj4gdGxiIG9uIHJpc2N2IGFuZCBpcyBuby1vcCBmb3Igb3RoZXIgYXJj
aGl0ZWN0dXJlcyAoc2FtZSBhcyB0b2RheSkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUg
R2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cgo+ICBhcmNoL202OGsvaW5jbHVkZS9hc20v
Y2FjaGVmbHVzaF9tbS5oICB8IDEgKwoKQWNrZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAg
ICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBM
aW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29u
dmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIu
IEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1t
ZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
