Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A90AC388F7
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 09:20:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78D4C22226
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 09:20:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0ivMKN0q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="dmhGEkLY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78D4C22226
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DI3sMb5tddQwjr0EQK6gGYtj0vbkhF+2iM3/5kDts3s=; b=0ivMKN0qfcPj3hdESvOWQxmfO
	6xgUcl56nz/7L2psZuSQOazVxetL4i//z2JAWwiTGotIO+14QuyHo+etjbNu6VSNdg9DZZR9c72m7
	PsxEXXLJmg/z1dH55LeG8V573IOX6KtqKTazUAG5sQbccvMkkT0zebedxpWH2+MKMfeI/I95UIGxm
	MkKgWVQISH+BqicPJyWZoPf9s7qynQx+6gG9TR8n5z6cmV/Ng7AkB50IlCb0zXn+v7FZQ3S2Q4IGY
	Ivznz6daG0FhlHWvyv3S5tKHN1Iud6/bLHs5MXs0y4xbMy6HGZkbHCZtrafo8xkRkBjdkLr2yGpeP
	31mldq5eg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdVG0-0000XI-BS; Fri, 13 Nov 2020 09:20:36 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdVFw-0000WB-IR
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 09:20:33 +0000
Received: by mail-qk1-x744.google.com with SMTP id d9so8202075qke.8
 for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2020 01:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LXvYg6KNLp5gr8xxXMEAyZN7n6FqtW194Mb8UjTkQ5o=;
 b=dmhGEkLYm12kWsa+j3THIcb6nTO863pK4iFMmQSh29zlbblAvhiLKHytbhwQVwgHEe
 WM9Vwvd9uaC+PU1DuKThGpMCrGUFIhlGPCbLuInTKqK2YYM1MO1yAXeQgLKAkbMLvz00
 7KQLofCJbhM26PUPtDJOEKWY2J+WyEB4cqABYQB22y9wZ72aYAkyxhmzJvu0RuQF2HhP
 dJJ0+vezSC1OJq40r48vBLIc+uTclSO0CygbQwgUh7tEatL1+I324D5F26onubcXm3c8
 +qLa9V5tKNbe5AkNgeqdaWm/aQis2qjyhFWB/Qu9UUY0OlF9eU8FZm6hRsa7amlm2b7L
 hoVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LXvYg6KNLp5gr8xxXMEAyZN7n6FqtW194Mb8UjTkQ5o=;
 b=c3dct6m9Xz6xgeNLU84DfkzotigVHFv6Vux2+/aQth0g9za+nkiaWhtcOO47DSpJYi
 IAC9kaBZqH8NKV5iCvMnxb5wcp3hJ3/4Yc4Qb/kxAJvfd1/7x0xhUYR4GrKnAZ+BblPF
 mKnvW8u4kwfS3Xn5fSpjUDPFUjnhP3pGBKtcRqujpu3/wUy40PPKF797wYMTXfOPeSDl
 P6CMIbZ3fuzLb9h0jT5Cp+RXWbgTkOD8RmfRSCx5XoXkVYILalWlqe4ii/pGF3d4AsYM
 7VvMtYkYHp+RD+tqa3F3DXVWfbBwVWjD8OQRjqOI6J0eR4G4vER/X4XHtzg0xgYB8Am0
 o0bA==
X-Gm-Message-State: AOAM5320oKYNTH0l2HrMkMuqh37vbOxgAd3hP8jehzJascLQt+uOVGbV
 GPMryAnm5pP5gE3F7906ouf27oQc+fDcSFv9fS78Rg==
X-Google-Smtp-Source: ABdhPJwZ4dsscYAKNQlVWp/zM33raHvqS9lPXE2+3m3/w6rueUuevapKLyCoYjUidC4vPUh9JE1qVgGIYzDS44mbpxY=
X-Received: by 2002:a37:6805:: with SMTP id d5mr1108660qkc.66.1605259230630;
 Fri, 13 Nov 2020 01:20:30 -0800 (PST)
MIME-Version: 1.0
References: <20201113023355.43406-1-greentime.hu@sifive.com>
 <CAMpxmJVZ8OHnGrkC_5TZdZUg004p1=90KqOxpOTgi4036BGWfQ@mail.gmail.com>
In-Reply-To: <CAMpxmJVZ8OHnGrkC_5TZdZUg004p1=90KqOxpOTgi4036BGWfQ@mail.gmail.com>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Fri, 13 Nov 2020 17:20:18 +0800
Message-ID: <CAHCEeh+zU4_i9eQuZ0nsxd7H5wkCQbsOr28cp-i54Tpf_RbYNw@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: sifive: To get gpio irq offset from device tree
 data
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_042032_897471_634909CA 
X-CRM114-Status: GOOD (  11.20  )
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
Cc: Linus Walleij <linus.walleij@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Yash Shah <yash.shah@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4g5pa8IDIwMjDl
ubQxMeaciDEz5pelIOmAseS6lCDkuIvljYg1OjAw5a+r6YGT77yaCj4KPiBPbiBGcmksIE5vdiAx
MywgMjAyMCBhdCAzOjM0IEFNIEdyZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+
IHdyb3RlOgo+ID4KPiA+IFdlIGNhbiBnZXQgaHdpcnEgbnVtYmVyIG9mIHRoZSBncGlvIGJ5IGl0
cyBpcnFfZGF0YS0+aHdpcnEgc28gdGhhdCB3ZSBkb24ndAo+ID4gbmVlZCB0byBhZGQgbW9yZSBt
YWNyb3MgZm9yIGRpZmZlcmVudCBwbGF0Zm9ybXMuIFRoaXMgcGF0Y2ggaXMgdGVzdGVkIGluCj4g
PiBTaUZpdmUgVW5sZWFzaGVkIGJvYXJkIGFuZCBTaUZpdmUgVW5tYXRjaGVkIGJvYXJkLgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IEdyZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+
Cj4gPiAtLS0KPgo+IFBsZWFzZSBsaXN0IHRoZSBjaGFuZ2VzIGJldHdlZW4gdmVyc2lvbnMgb2Yg
cGF0Y2hlcy4gV2hhdCBoYXMgY2hhbmdlZCBzaW5jZSB2Mj8KCmNoYW5nZXMgaW4gdjM6CiAgQWRk
IDIgbmV3bGluZXMKY2hhbmdlcyBpbiB2MjoKICBVc2UgaXJxZF90b19od2lycSgpIGluc3RlYWQg
b2YgZC0+aHdpcnEgYW5kIHBsYXRmb3JtX2dldF9pcnEoKQppbnN0ZWFkIG9mICBpcnFfb2ZfcGFy
c2VfYW5kX21hcCgpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
