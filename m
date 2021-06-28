Return-Path: <SRS0=Z71o=LW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C57C48BC2
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jun 2021 03:22:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E4FA61C35
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jun 2021 03:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E4FA61C35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=37gO/r5lavVmKZAkPc9igMY9Wvi+BW+zVmCv4A8njKE=; b=CZBhVgsBYs9ezQ
	eAswrt2hL8Pl1QPfeJAuG6UTqJpXtt75UPS9PfyrmrjolENovIAwMqq6TpxIkPkBFm215wq66bivf
	DNE7X4OsRoK+M2pVHgRoyFQl4fmpRZhEx9etIH/rkghF5mdv1+0IgChQcGML80tLjQV0wAgyxO1PB
	8cjr0CzQSL792cvc63wuxOLnCvruQ8pgjXojilgttm7zgIDiFbRuDYNP9j4XUfyXVCFINldsmcZOB
	ayz34MijyINz+YqcSQKSQBUshKYGYK+ofUUN6mr44rh6Afik2dJxY9c8cByTjqxH2lDQpvIv/4Zug
	5SPq8zeF50lLVTQQlxsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxhqK-006c8N-JF; Mon, 28 Jun 2021 03:21:52 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxhqH-006c7h-Mu
 for linux-riscv@lists.infradead.org; Mon, 28 Jun 2021 03:21:51 +0000
Received: by mail-yb1-xb29.google.com with SMTP id s129so16106845ybf.3
 for <linux-riscv@lists.infradead.org>; Sun, 27 Jun 2021 20:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+oBDwfkoqQBZF8b/GVv8gJiTknHVSmHA0o8eDbQJ7qw=;
 b=beed0lhxIcJCRaaH5GRHcpVOJJi5P+mDN8/+bYP6RjuDgQHW8kmvd/GOuAv8K/62kj
 akoNVx+UnWBiuetQAhVxfJzSaTKp/e4Rr3iCWwGMPN8G5qvBdYdilCGVsVzsduJjZwjY
 rBuZdu+HqPBmqepHyfbtmcInWYgQyhrDEmGxAeUmDe06eFcExTSGm4goewxhpGz8S1eb
 Zeuz4oFoFRJQOHLiJQn8Gmbi2L+VfuFIV1+qG7kJ7SS+id1EVbysa1rNtog5jGySbDYW
 Gf2ojeNMuYqLn05rYzt69QJp+FerbJ/7bU7/jT+qqB5LujHEswLniAyKzheXKAM7bRXf
 94SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+oBDwfkoqQBZF8b/GVv8gJiTknHVSmHA0o8eDbQJ7qw=;
 b=BVnKIRBerulVWn+RrKnhpPAkhuUHPskGLs47Zjp8hV6LZGdysZZ4KFr0hMCD3zL3Ub
 0sPlHd3VzV3/folKQhSedxv2EucD+jx2stuVTexP8wRbNyMkGUMvc1FxhLNunQ0VrdpW
 zkDpW21BS5BEpo0r4AoFLdaVDajiIt+5wvpMbf5OYD4eqH1AOz0AV4ciw+Ogp4NdjMl0
 NKXkAO/xTMLY/QKgJIqw/s6VRteCYm9VHXyev5K5Xmrbs5ZgXqUpjIjjH3BREUcWkCXd
 lGgQhDrlar6QjpcG+pIN1dROk1IAakecqIDdQ7gQh7GXW7Hy+45nhoxy03Myd4PwcRik
 Zm/w==
X-Gm-Message-State: AOAM530gX5DU2tvtsAeG5MfFw+xxz1iFcJUGNhBEqotlXtxdkJE1qLcr
 Sx1nRKpYXyjTUkZNPlAKHIVRYWGA+5EK8jItck4=
X-Google-Smtp-Source: ABdhPJzwr3WGDedoWAjPw98+br/6i6KSq1AYI6Tz6NPl4p41ofTvwK1WH1T6PuFjIYkkH5nXUh5uTyDLQ7aKnHC7G5A=
X-Received: by 2002:a25:2c01:: with SMTP id s1mr6424780ybs.387.1624850508742; 
 Sun, 27 Jun 2021 20:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210627135117.28641-1-bmeng.cn@gmail.com>
 <11706f7e-a53a-5640-d713-bc4562db71fa@huawei.com>
 <CAEUhbmV=h3nZ8Aa94_uyjrZ_NGe+9-xAorUMubSPJXu3y60PeQ@mail.gmail.com>
 <aa1f027c-bbc7-92f8-80a6-fe290cd1cdf8@huawei.com>
In-Reply-To: <aa1f027c-bbc7-92f8-80a6-fe290cd1cdf8@huawei.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 28 Jun 2021 11:21:37 +0800
Message-ID: <CAEUhbmXeqAsLxm+oCHRPHMZq2mQXPD6fJOFerwp_BRv1kCc7ow@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix 32-bit RISC-V boot failure
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 Atish Patra <atish.patra@wdc.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, stable <stable@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_202149_793417_ED79950A 
X-CRM114-Status: GOOD (  15.52  )
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

T24gTW9uLCBKdW4gMjgsIDIwMjEgYXQgMTA6MjggQU0gS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcu
d2FuZ0BodWF3ZWkuY29tPiB3cm90ZToKPgo+Cj4gT24gMjAyMS82LzI4IDk6MTUsIEJpbiBNZW5n
IHdyb3RlOgo+ID4gT24gTW9uLCBKdW4gMjgsIDIwMjEgYXQgODo1MyBBTSBLZWZlbmcgV2FuZyA8
d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20+IHdyb3RlOgo+ID4+IEhp77yMIHNvcnJ5IGZvciB0
aGUgbWlzdGFrZe+8jHRoZSBidWcgaXMgZml4ZWQgYnkKPiA+Pgo+ID4+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjEwNjAyMDg1NTE3LjEyNzQ4MS0yLXdhbmdrZWZlbmcu
d2FuZ0BodWF3ZWkuY29tLwo+ID4gV2hhdCBhcmUgd2Ugb24gdGhlIHBhdGNoIHlvdSBtZW50aW9u
ZWQ/Cj4gPgo+ID4gSSBkb24ndCBzZWUgaXQgYXBwbGllZCBpbiB0aGUgbGludXgvbWFzdGVyLgo+
ID4KPiA+IEFsc28gdGhlcmUgc2hvdWxkIGJlIGEgIkZpeGVzIiB0YWcgYW5kIHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmcgY2MnZWQKPiA+IGJlY2F1c2UgMzItYml0IGlzIGJyb2tlbiBzaW5jZSB2NS4x
Mi4KPgo+IGh0dHBzOi8va2VybmVsLmdvb2dsZXNvdXJjZS5jb20vcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L3Jpc2N2L2xpbnV4LysvYzk4MTFlMzc5YjIxMWM2N2JhMjlmYjA5ZDZmNjQ0ZGQ0NGNm
Y2ZmMgo+Cj4gaXQncyBvbiBQYWxtZXInIHJpc2N2LW5leHQuCgpOb3Qgc3VyZSByaXNjdi1uZXh0
IGlzIGZvciB3aGljaCByZWxlYXNlPyBUaGlzIGlzIGEgcmVncmVzc2lvbiBhbmQKc2hvdWxkIGJl
IG9uIDUuMTMuCgo+Cj4gSGkgUGFsbWVyLCBzaG91bGQgSSByZXNlbmQgb3IgY291bGQgeW91IGhl
bHAgbWUgdG8gYWRkIHRoZSBmaXhlcyB0YWc/CgpSZWdhcmRzLApCaW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
