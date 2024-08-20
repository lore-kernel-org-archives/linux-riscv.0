Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9EAC531DF
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 11:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xjgnvd/XT/vfTbRn9Uak3F+yF616tFbUqPymQEdhJ0Q=; b=Gr7Vtk5Cu54/ed
	XuTXebI1nbNRLG+ML1wPnffjQ4zFsWlyIjW+ekhOXnnCybAWnJ5APawLAgCfdfyqykH6A4oK14SkO
	SV0wmkcQe6BvTGJ4qaETCLP/LMh3SWsHzMvnyciI6ynb8ABtql8AAINpLohgmZhmZgqYBkJVkuON8
	JFFhXiPl6OD2bSvP52NzGOM4Vf/HLOM0aaeFOkpXmwCo7gWB/wHGDLm88aZqRbBFKpwA5CoJWSNmL
	K4HH6rnysGcLQbCF2voc9Wy5RQHOpv7ULAKcOpJLrYgyS9MCR9Jv9tyK6MHVKULh+gSA6AL4kVonQ
	A8NI8zZnaNK1IDRzAI8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgMb2-00000004w21-1mQv;
	Tue, 20 Aug 2024 11:00:16 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgMan-00000004vxL-0nLL
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 11:00:03 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-81f86fd9305so289003539f.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Aug 2024 04:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1724151599; x=1724756399; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GN+EIjpNUUx5GfQqCYudQRJbl+lPpTDJG3imDxVORnA=;
        b=u1wY1Qx16UUD3ysfzdeRu9c1YZNuKrXo43lz3DbFmJnESdVPNCnLkeA9cfAUU9rWvV
         3Yu8mK+s24uq95RCXuMPeuNtWDUZZ91j1N2zjiMizVJ0DbWsUH+cXfcIcobqcoaOIOnz
         XAIYLIceJmlE3sxIAv2QQivxZrxDC/bAV8Ynx41RL2PGt95P4Nn8nv5aCOUtgbFrQFul
         4jubss/2jRchWpnzQbYKdHroT3DNqDYrROozlhYIoZXZVm4deeCT1wU9lJvlp7VjtLqT
         Qmn00BLRseVdDxx16EpBL8clmY+4vvtttqlU6W/fGMGddt5MUpnrrV0AfQAYoym1Rw3C
         QHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724151599; x=1724756399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GN+EIjpNUUx5GfQqCYudQRJbl+lPpTDJG3imDxVORnA=;
        b=MwC2nlb2PyfzRXJlyQ9m/UlPbJIzDgbwo57/pYZilSnL07OkopYWHkzK5eH98gjjsg
         meOdtLchih7BH9u9cYk1IasYJo6o1nW2JVdUv5ZmHLxQOu6iyVY1pL1cWm9HI4J4i3Fm
         1MtsxV/4lb06LRKI1NBJ4u9+s/j4Ivcz+52xCwURQ84fevCEZp9IIQHH2QqCfLM3AwAM
         FlOg7P9XN3ToaOCapu38i4aBIVJJwCqF4VUmeia1CykVyB1IoCk94v2wGsDiX9/+r5RP
         geeTMMQFc3FGscfRkvJ4+PzBeHQAZtrT90D/qqZE6cdFGDyRcwDoQj6l7sdAcIo2G4NT
         BV5A==
X-Forwarded-Encrypted: i=1; AJvYcCWgiMktcxo+y+x/Yr/fok6MVxnC6rQv90VYXc8GdgkjCwO1xKxnrwV+a3mu6SS9831ehaSzgJ6wczaom9fZw/UEHfo9JL/Goil7O1UfpDrP
X-Gm-Message-State: AOJu0YyBeoKSlwfhCHJrGDVPW+o1llZNrnGO/FBuJXdFhocnMde59nuC
	TlhH3VXAuGavYda/nNk+/2S3MNYuMFvTRyKFT7IXiZzuGA9uEC/8EDiOB+CBNZr+E1l+XqcyIBh
	/oYbKFzLrhsH+7Sp/gRb841CHAPBX8vJ+1ae9Jg==
X-Google-Smtp-Source: AGHT+IHqjjn2UapHpnmuaFhmYQPyeSNmej7VILcZMgUpLXZilMbqo1VtVFSgCamg32GBi9wtyoqu+sC1TyQmb5Inz4w=
X-Received: by 2002:a05:6e02:152b:b0:39b:2ceb:1a23 with SMTP id
 e9e14a558f8ab-39d26ce6283mr152753085ab.3.1724151599259; Tue, 20 Aug 2024
 03:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240820094023.61155-1-krzysztof.kozlowski@linaro.org> <20240820094023.61155-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240820094023.61155-2-krzysztof.kozlowski@linaro.org>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 Aug 2024 16:29:48 +0530
Message-ID: <CAAhSdy00N62pZfMrBTMASaZUqW6L-zEe_BqNZ4ZsOWdEvxHDZA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] cpuidle: riscv-sbi: Simplify with scoped for each
 OF child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@rivosinc.com>, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_040001_252750_0A0CB70C 
X-CRM114-Status: GOOD (  17.48  )
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

T24gVHVlLCBBdWcgMjAsIDIwMjQgYXQgMzoxMOKAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBVc2Ugc2NvcGVkIGZvcl9l
YWNoX2NoaWxkX29mX25vZGVfc2NvcGVkKCkgd2hlbiBpdGVyYXRpbmcgb3ZlciBkZXZpY2UKPiBu
b2RlcyB0byBtYWtlIGNvZGUgYSBiaXQgc2ltcGxlci4KPgo+IFJldmlld2VkLWJ5OiBKb25hdGhh
biBDYW1lcm9uIDxKb25hdGhhbi5DYW1lcm9uQGh1YXdlaS5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgoKTEdU
TS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJk
cywKQW51cAoKPgo+IC0tLQo+Cj4gQ2hhbmdlcyBpbiB2MjoKPiAxLiBOb25lLCBvbmx5IFJiIHRh
Zy4KPgo+IE90aGVyIHBhdGNoZXMgZnJvbSB0aGUgc2V0IHdlcmUgYXBwbGllZC4KPiAtLS0KPiAg
ZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMgfCA3ICsrLS0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1yaXNjdi1zYmkuYyBiL2RyaXZlcnMvY3B1aWRsZS9j
cHVpZGxlLXJpc2N2LXNiaS5jCj4gaW5kZXggNWJiMzQwMTIyMGQyLi5kMjI4YjRkMThkNTYgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMKPiArKysgYi9k
cml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1yaXNjdi1zYmkuYwo+IEBAIC00NDgsNyArNDQ4LDYgQEAg
c3RhdGljIHZvaWQgc2JpX3BkX3JlbW92ZSh2b2lkKQo+Cj4gIHN0YXRpYyBpbnQgc2JpX2dlbnBk
X3Byb2JlKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCj4gIHsKPiAtICAgICAgIHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbm9kZTsKPiAgICAgICAgIGludCByZXQgPSAwLCBwZF9jb3VudCA9IDA7Cj4KPiAg
ICAgICAgIGlmICghbnApCj4gQEAgLTQ1OCwxMyArNDU3LDEzIEBAIHN0YXRpYyBpbnQgc2JpX2dl
bnBkX3Byb2JlKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCj4gICAgICAgICAgKiBQYXJzZSBjaGls
ZCBub2RlcyBmb3IgdGhlICIjcG93ZXItZG9tYWluLWNlbGxzIiBwcm9wZXJ0eSBhbmQKPiAgICAg
ICAgICAqIGluaXRpYWxpemUgYSBnZW5wZC9nZW5wZC1vZi1wcm92aWRlciBwYWlyIHdoZW4gaXQn
cyBmb3VuZC4KPiAgICAgICAgICAqLwo+IC0gICAgICAgZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZShu
cCwgbm9kZSkgewo+ICsgICAgICAgZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZV9zY29wZWQobnAsIG5v
ZGUpIHsKPiAgICAgICAgICAgICAgICAgaWYgKCFvZl9wcm9wZXJ0eV9wcmVzZW50KG5vZGUsICIj
cG93ZXItZG9tYWluLWNlbGxzIikpCj4gICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7
Cj4KPiAgICAgICAgICAgICAgICAgcmV0ID0gc2JpX3BkX2luaXQobm9kZSk7Cj4gICAgICAgICAg
ICAgICAgIGlmIChyZXQpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgZ290byBwdXRfbm9kZTsK
PiArICAgICAgICAgICAgICAgICAgICAgICBnb3RvIHJlbW92ZV9wZDsKPgo+ICAgICAgICAgICAg
ICAgICBwZF9jb3VudCsrOwo+ICAgICAgICAgfQo+IEBAIC00ODAsOCArNDc5LDYgQEAgc3RhdGlj
IGludCBzYmlfZ2VucGRfcHJvYmUoc3RydWN0IGRldmljZV9ub2RlICpucCkKPgo+ICAgICAgICAg
cmV0dXJuIDA7Cj4KPiAtcHV0X25vZGU6Cj4gLSAgICAgICBvZl9ub2RlX3B1dChub2RlKTsKPiAg
cmVtb3ZlX3BkOgo+ICAgICAgICAgc2JpX3BkX3JlbW92ZSgpOwo+ICAgICAgICAgcHJfZXJyKCJm
YWlsZWQgdG8gY3JlYXRlIENQVSBQTSBkb21haW5zIHJldD0lZFxuIiwgcmV0KTsKPiAtLQo+IDIu
NDMuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
