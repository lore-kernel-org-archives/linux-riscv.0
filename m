Return-Path: <SRS0=OTun=AM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D89C433DF
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 11:34:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB28F20760
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 11:34:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dAQCy975";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="rIey3YW6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB28F20760
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5Fz3O7Gm6v09l3YkkQXzTvl33ACZNlLph/VXpG7AGoI=; b=dAQCy975xodt97jKHfAx/1wAE
	qruwTy6e0NFfoMnMtEebk2mBWj3F44IlejhcPwGHhxkOXAyB2mWDjZ4yCxWuCd1lhpJiV3dQ8mOos
	iJcBw/5IJoPoLaPsmJ4GRwVfIY+SzQgQhYVQ4ZHaLcmK3FtQ8IDA6dD89PxazsfFuDBaRSEccwYuT
	0MioUP0GiudfSXNQQ8sWaxHaTdvXg0dlwpIXREPP7PA574H/mVW8lrDhXwqTAjF2jJx9IFokaFxTE
	n278/239whn1rlTmQtsm/BIuUm43fQ/2yskv5H/jvIgfB3l8wMKDyVWjvR2xYyQWWkNPQ9vdwJ9NP
	ZaHIXpemw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqb0U-000586-Lc; Wed, 01 Jul 2020 11:34:26 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqb0S-00057U-CI
 for linux-riscv@lists.infradead.org; Wed, 01 Jul 2020 11:34:25 +0000
Received: by mail-qk1-x741.google.com with SMTP id 80so21774790qko.7
 for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2020 04:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EEqvqmVCB1WUa95+E8sIn4DuyDJk8yL+DtualOl4BbQ=;
 b=rIey3YW6XK7yTbmS9vDkY/zi/MS7XcR0zVflsItuW+oBX4CheEwY9OC4pxyRNINihu
 q69Phq9MVcagyyNNSqJWVMFBI4oO1/SANNd2/5Veog+5vlCh/UGr8uPqEZEh22qFEWMI
 mQQoxlIAoYEx1MV4R709QE0vxFbsG/ZzzXDkjh8VOS5c4HlBx/PGRgqU07UXoMsfGGtX
 WOpT34lqWtPE1PW+vRNo0bFKVk0/3OFCrJ+YS2m7RqtLahauQ/JFNERKC6yX9XPLfmop
 emejC0QbyazWDgOhKYcRfBO+mmGdABTZn5H82OIPhH/0Be4aZ0JuCLvnTw8vimOyqcqx
 ki/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EEqvqmVCB1WUa95+E8sIn4DuyDJk8yL+DtualOl4BbQ=;
 b=HwImMa8sEU+jb6TJFzPjim0tqYfsUBgOTidcv4NyN9KUhUT1jZuji1o5Et++0pEw4C
 V43eeCtglTFh+kMwASP0dUNGYtuLrxcHxQcpTMelBU4/Uic40HmvMiUeF4lZr+Pusy+J
 +PKucRi+S0pyd2wwfswhvgrSeARiN/CVJf9e0KK5nw881S3KL5WdSGcj0+n1aOOVLh3/
 nFBBVhIsvMuZJEJgpYHBcdHGfEZ3SHDm/VZqfQ5LF9cRAECvyBD8zRiV6Rx6DXCglnJh
 HlABN8uJT4czx68vQcET+fnlvMpzr7gYUReFduvS5Igh545fs/HVLqQVgtJIl1fM7GPf
 RUHw==
X-Gm-Message-State: AOAM530eWghPbPGQnJPYlL/9PTGQmGxut0MmhJdEC4D/RK4mKsqFFeLh
 a7zsj2dKM4PDRdA76OMyhCHRsbaBz2cO9IblczrrKQ==
X-Google-Smtp-Source: ABdhPJw1Uj2yn3+xHGvPwEqzMlSmQI5QMb7rm8Y/W2XIRjdCBOlJ6Se6r2tdRGLI9nONcdT5Orxvdbf9wZa3tvUeVw4=
X-Received: by 2002:a37:4f0e:: with SMTP id d14mr25381156qkb.8.1593603262148; 
 Wed, 01 Jul 2020 04:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <CACT4Y+a3A6DEvUjCsk_jKz9nZ=5iAzXTyG4WDPkug6u7BVrceQ@mail.gmail.com>
 <mvmtuysn227.fsf@suse.de>
 <CACT4Y+Y8=0m+Xku_+kQYuiiABgFUDzHBEqUK_FNGs8=f9NGZng@mail.gmail.com>
 <CAJ+HfNgzyOfr7gXeg+weLf64HHOWmm2Wug5Oc1OrOJN9ZcR5bQ@mail.gmail.com>
 <CAJ+HfNjOtCvNZpLGoRaxJn7nfx+hW=cwoyveiu-pwhTjp3-avg@mail.gmail.com>
In-Reply-To: <CAJ+HfNjOtCvNZpLGoRaxJn7nfx+hW=cwoyveiu-pwhTjp3-avg@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 1 Jul 2020 13:34:09 +0200
Message-ID: <CACT4Y+Y5EZCkHndnH0dVZ5rQg3+5FYV1TiHL8RFnUuJ82qygXg@mail.gmail.com>
Subject: Re: syzkaller on risc-v
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_073424_446855_79250805 
X-CRM114-Status: GOOD (  20.55  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>,
 Atish Patra <atish.patra@wdc.com>, syzkaller <syzkaller@googlegroups.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Tobias Klauser <tklauser@distanz.ch>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdWwgMSwgMjAyMCBhdCAxMjo0MyBQTSBCasO2cm4gVMO2cGVsIDxiam9ybi50b3Bl
bEBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+IE9uIEp1biAzMCAyMDIwLCBEbWl0cnkgVnl1a292
IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gPiBLQVNBTiB3b3VsZCBiZSBhIHByZXJlcXVpc2l0ZSBm
b3IgdGVzdGluZyByaXNjLXYgb24gc3l6Ym90Lgo+ID4gPiA+Cj4gPiA+ID4gWW91IG5lZWQgdG8g
aW1wbGVtZW50IHRoZSBHQ0Mgc3VwcG9ydCBmaXJzdC4KPiA+ID4KPiA+ID4gSW50ZXJlc3Rpbmcu
IEJqw7ZybiBjbGFpbWVkIEtBU0FOIHdvcmtzIGFscmVhZHkuICBBbmQgdGhlcmUgaXM6Cj4gPiA+
Cj4gPiA+IGNvbW1pdCA4YWQ4YjcyNzIxZDBmMDdmYTAyZGJlNzFmOTAxNzQzZjljNzFjOGU2Cj4g
PiA+IEF1dGhvcjogTmljayBIdQo+ID4gPiBEYXRlOiAgIE1vbiBKYW4gNiAxMDozODozMiAyMDIw
IC0wODAwCj4gPiA+ICAgICByaXNjdjogQWRkIEtBU0FOIHN1cHBvcnQKPiA+ID4KPiA+ID4gSXMg
dGhlcmUgYW55IGtub3duIGlzc3VlIHdpdGggZ2NjPwo+ID4gPiBEaWQgYW55b25lIHRyeSBjbGFu
Zz8gQWRkcmVzc1Nhbml0aXplciBwYXNzIGluIGNsYW5nIGlzCj4gPiA+IGFyY2gtaW5kZXBlbmRl
bnQuIE5vdCBzdXJlIGFib3V0IGdjYy4uLiBpdCBsb29rZWQgbW9zdGx5Cj4gPiA+IGFyY2gtaW5k
ZXBlbmRlbnQuCj4gPgo+ID4gV2VpcmQuIERpZCBhIHF1aWNrIGJpc2VjdCAoanVzdCAiZG9lcyBp
dCBib290IHdpdGggS0FTQU4gb3Igbm90Igo+ID4gdGVzdCksIGFuZCB0aGlzIGZlbGwgb3V0Ogo+
ID4KPiA+IC0tCj4gPiBlZmNhMTM5ODkyNTBjM2VkZWJhZjhmY2FhOGNhN2M5NjY3MzljNjVhIGlz
IHRoZSBmaXJzdCBiYWQgY29tbWl0Cj4gPiBjb21taXQgZWZjYTEzOTg5MjUwYzNlZGViYWY4ZmNh
YThjYTdjOTY2NzM5YzY1YQo+ID4gQXV0aG9yOiBBdGlzaCBQYXRyYSA8YXRpc2gucGF0cmFAd2Rj
LmNvbT4KPiA+IERhdGU6ICAgVHVlIE1hciAxNyAxODoxMTozNyAyMDIwIC0wNzAwCj4gPgo+ID4g
ICAgIFJJU0MtVjogSW50cm9kdWNlIGEgbmV3IGNvbmZpZyBmb3IgU0JJIHYwLjEKPiA+Cj4gPiAg
ICAgV2Ugbm93IGhhdmUgU0JJIHYwLjIgd2hpY2ggaXMgbW9yZSBzY2FsYWJsZSBhbmQgZXh0ZW5k
YWJsZSB0byBoYW5kbGUKPiA+ICAgICBmdXR1cmUgbmVlZHMgZm9yIFJJU0MtViBzdXBlcnZpc29y
IGludGVyZmFjZXMuCj4gPgo+ID4gICAgIEludHJvZHVjZSBhIG5ldyBjb25maWcgYW5kIG1vdmUg
YWxsIFNCSSB2MC4xIGNvZGUgdW5kZXIgdGhhdCBjb25maWcuCj4gPiAgICAgVGhpcyBhbGxvd3Mg
dG8gaW1wbGVtZW50IHRoZSBuZXcgcmVwbGFjZW1lbnQgU0JJIGV4dGVuc2lvbnMgY2xlYW5seQo+
ID4gICAgIGFuZCByZW1vdmUgdjAuMSBleHRlbnNpb25zIGVhc2lseSBpbiBmdXR1cmUuIEN1cnJl
bnRseSwgdGhlIGNvbmZpZwo+ID4gICAgIGlzIGVuYWJsZWQgYnkgZGVmYXVsdC4gT25jZSBhbGwg
TS1tb2RlIHNvZnR3YXJlLCB3aXRoIHYwLjEsIGlzIG5vCj4gPiAgICAgbG9uZ2VyIGluIHVzZSwg
dGhpcyBjb25maWcgb3B0aW9uIGFuZCBhbGwgcmVsZXZhbnQgY29kZSBjYW4gYmUgZWFzaWx5Cj4g
PiAgICAgcmVtb3ZlZC4KPiA+Cj4gPiAgICAgU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0
aXNoLnBhdHJhQHdkYy5jb20+Cj4gPiAgICAgUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBA
YnJhaW5mYXVsdC5vcmc+Cj4gPiAgICAgU2lnbmVkLW9mZi1ieTogUGFsbWVyIERhYmJlbHQgPHBh
bG1lcmRhYmJlbHRAZ29vZ2xlLmNvbT4KPiA+Cj4gPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAg
ICAgICB8ICAgNyArKysKPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwgICAyICsK
PiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyAgICAgIHwgMTMyICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDExOCBpbnNl
cnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKPiA+IC0tCj4gPgo+ID4gSSdsbCBkaWcgYSBiaXQg
bW9yZS4KCldlIG1heSBuZWVkIG1vcmUgS0FTQU5fU0FOSVRJWkUgOj0gbiBpbiBzb21lIE1ha2Vm
aWxlcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
