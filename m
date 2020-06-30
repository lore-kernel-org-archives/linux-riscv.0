Return-Path: <SRS0=QRI7=AL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E0C5C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 13:27:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1826A206B6
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 13:27:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pcIWTXDi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="AOodFTid"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1826A206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4jvKqZ9OYlclK2iBXCQlmZqf0wW3ISYMmeJelDKQCzE=; b=pcIWTXDiJoi44/f3txF7JbeiC
	v7EEJBavKCU+A7oRyRaaiNnCfXQAEYHKkIqVZEpsd4HTH/9nB8ZZEw1oOJueVrlibGzTZ39Dd4EFm
	E/L7WmxKOy/nDNaD1RaiElnas0x//f6rsTLDjoDMkBcZErVhPgORv4znljcSFEFfaPHWERQC5hMiN
	nbGEZ8BMaRzEGVe7mhD+stE7W/dldMvYQgJvZCVjvnP0IhsPgaFIiOMFLeXhR+9nNhvcCDU9Z7veP
	GO8ntJOogV/0loKLjSIlRCmhzCI9FmVPZiTqHkJVCi9f49PhFhtv7OOfr5uAlGL18ZEWvpCBCt6rY
	5nH6WE2pA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqGHz-0003II-Rf; Tue, 30 Jun 2020 13:27:07 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqGHx-0003HM-1y
 for linux-riscv@lists.infradead.org; Tue, 30 Jun 2020 13:27:06 +0000
Received: by mail-qv1-xf42.google.com with SMTP id p7so9244071qvl.4
 for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2020 06:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lgGIwdCOmSm1pj/B/xkOa3+SBHaLYcKSOgKyUMrycMY=;
 b=AOodFTidTpvYqr3PSdN/Fu03nKPMSzJetnE+wN+w78vdT/WOmYCfmjIgVIl+5UPuKB
 ZhcS4W5fA8C6T7hnQ+/qkXmm2ME8OmSyInj38zag93a3lrv/j3tdoe9PQn735MZPe+RK
 74emYpbNKaU5W4BWWHjMTqfF+Yk8nWMiQF7F/iwrr/BvnqXjhvCrVdXkOnk+78eBmbiM
 cOc0aUCuLBRE9h701fVyKOgiSm8faAp+CkJOWygb6x+VzdlHB3ryIlw3E2tvxV+VhnLd
 ROhiW8WB2HsE0zkOqIrf/t8JQgApCoGYb/Hm/jS8aZfiYGwuic026+DGj02M4LiOM6yS
 3/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lgGIwdCOmSm1pj/B/xkOa3+SBHaLYcKSOgKyUMrycMY=;
 b=Tf9RgLcUxBZA8Dz+Afp2UbD+lKHMw9O2H6YMvufXkRZBohSWT8d69wKiIoylXu6xuQ
 t+Z/U2tuEr/JvoPRq9OgpnMgNlqnNx7hw1lB4mjcoc6ED8qj3/73vaKXzrY8cE1W21+N
 uFEZuPixMgP4LAkto+V1k+pc0xX4pGDOpaBcVajUMjIvzjEPNLnh+ag4gV0ZUHaumm3y
 nOF5MVmw8nPU0zH0QHWDbDYO2jl2jQD/BSZ9c9Mf3vd3+7khpR/zQBvXp29LkhjjYEBk
 FM6Y8VU1HTk2Hxm5H0TdcNR2X656pW77dcHEoFuw9Gl0N0k+lkar80vUbq5OekRzgQeD
 mwCA==
X-Gm-Message-State: AOAM532ux++C50jxPtUa4HcgOt5INgMCnlhSA6fvfZTe36tfk0hlYhZH
 LJikni4vBG6phO2GBQ2EvTPYdF/WekiLWgnBlHMzlQ==
X-Google-Smtp-Source: ABdhPJy37jye1FQiuNBbzPbV8Geg0MwMc5SOxuh4xHPC3x3VOalj3Uj9/2HR+47BHHrFB4HB77Egrt6p8CnMbs+ia8I=
X-Received: by 2002:a0c:bf06:: with SMTP id m6mr20429654qvi.80.1593523622977; 
 Tue, 30 Jun 2020 06:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <CACT4Y+a3A6DEvUjCsk_jKz9nZ=5iAzXTyG4WDPkug6u7BVrceQ@mail.gmail.com>
 <mvmtuysn227.fsf@suse.de>
In-Reply-To: <mvmtuysn227.fsf@suse.de>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 30 Jun 2020 15:26:50 +0200
Message-ID: <CACT4Y+Y8=0m+Xku_+kQYuiiABgFUDzHBEqUK_FNGs8=f9NGZng@mail.gmail.com>
Subject: Re: syzkaller on risc-v
To: Andreas Schwab <schwab@suse.de>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Tobias Klauser <tklauser@distanz.ch>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdW4gMzAsIDIwMjAgYXQgMzoxNCBQTSBBbmRyZWFzIFNjaHdhYiA8c2Nod2FiQHN1
c2UuZGU+IHdyb3RlOgo+Cj4gT24gSnVuIDMwIDIwMjAsIERtaXRyeSBWeXVrb3Ygd3JvdGU6Cj4K
PiA+IEtBU0FOIHdvdWxkIGJlIGEgcHJlcmVxdWlzaXRlIGZvciB0ZXN0aW5nIHJpc2MtdiBvbiBz
eXpib3QuCj4KPiBZb3UgbmVlZCB0byBpbXBsZW1lbnQgdGhlIEdDQyBzdXBwb3J0IGZpcnN0LgoK
SW50ZXJlc3RpbmcuIEJqw7ZybiBjbGFpbWVkIEtBU0FOIHdvcmtzIGFscmVhZHkuICBBbmQgdGhl
cmUgaXM6Cgpjb21taXQgOGFkOGI3MjcyMWQwZjA3ZmEwMmRiZTcxZjkwMTc0M2Y5YzcxYzhlNgpB
dXRob3I6IE5pY2sgSHUKRGF0ZTogICBNb24gSmFuIDYgMTA6Mzg6MzIgMjAyMCAtMDgwMAogICAg
cmlzY3Y6IEFkZCBLQVNBTiBzdXBwb3J0CgpJcyB0aGVyZSBhbnkga25vd24gaXNzdWUgd2l0aCBn
Y2M/CkRpZCBhbnlvbmUgdHJ5IGNsYW5nPyBBZGRyZXNzU2FuaXRpemVyIHBhc3MgaW4gY2xhbmcg
aXMKYXJjaC1pbmRlcGVuZGVudC4gTm90IHN1cmUgYWJvdXQgZ2NjLi4uIGl0IGxvb2tlZCBtb3N0
bHkKYXJjaC1pbmRlcGVuZGVudC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
