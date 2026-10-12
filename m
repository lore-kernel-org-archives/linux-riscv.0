Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D0ACA9EBD
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 00:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SAR4zfo1CBmTnDNH2h9+wfw0uC0b5lObYUTaj9dn2E=; b=4BS6g/+j96FJNZ
	uCasvtI8TSgZ0UJEeZW9tw9PK7BECWidiWihghj+OlHOYt7ih8DyVKRElGW6QuMEGwY+yIbALPH/k
	16JSwjQ6bh1js+f/HtcVrMID26r89f4E597PWt7KkIwjwfUgSQTZj4YF/Q+6bb+T4FeNmWA53iBaB
	psLHc8OZdyB/Fhv/aZyNQHPrVtzSNeXWwlK+PYwgRbzATwdOgPdK+qDQpunBqrH9CHKuuw0rHv7Fs
	r7mb345pr7NCYUWWLK1GTa/om4Fs38DvmT7QZ1asEBlXShiTWYb7OBI+QEJ8NGo5iG641z8LKuDNo
	COliOsTXZV2XaMAxAxdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG3o2-00000009WKE-3cEp;
	Mon, 12 Oct 2026 00:22:18 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG3o0-00000009WJr-1ajc
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 00:22:17 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-4a691d29614so211378fac.2
        for <linux-riscv@lists.infradead.org>; Sun, 11 Oct 2026 17:22:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791764535; cv=none;
        d=google.com; s=arc-20260327;
        b=a2Pw0VJTuyzThIC4QQue/YKLszaq4PZm+0QZF9JmOoi0nm9/OWbbx/fWkudi4nn+Ft
         h0JhWSRPM72G2rRFLxXc26JMu39iLPTOWPVOzSGYDhVZV49gb/cDy/2jY9r3/TU4aB8K
         xyCe50JiSZYM14BdFj1RHPQiVwtLzrP980AYGK2DEE4eLRqIncDF+xk4gbX9xdN63jRD
         5WtK3TXB/d3yjjNWuCzqx9EY2EObDoRNbLTxo0JsDoX6RxrMOwgcXVhKuxucvEhs2WSc
         yQKmzk4QuEFvELWZKTWjhX0KHADSXZgEAIezBSMm53ehprzhMoRGsWJ8ejEOx63pQGdl
         Xueg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fk754Br0Atpw8UnVE6DvVZsNKb0d4aNb92220Jc8a90=;
        fh=rDnyLmueiTSLtU6TPGm+GFi/VH79HyHFfBdTts6lveM=;
        b=dRvLjKdgSSxu/pRxm8SlDDxrcyJ8sYWrUytUb9yJeZLRuYYuaAYz6DyGohPZpr2rBw
         52h3KcL31aIw6GNjfSOuXPJJixqbGbxIr1PN5ZsT4gGRmfhZ9rF9Fw7rpkTaVXPHG+wl
         ulF424eh+qZd65tCYFyIKj0vb36FvCuPZTgLvbSUyPT4i/1Ymy99J3RLT16h0ofXedl9
         2IuHfiW7Sy64SaMpY6+SYZsPsOgn0UUaLmaTUbNN9o9XSUXKotRZtgr3YSjh+UyHSKFs
         gvuyiVjSkf0+zdOtnLPe4z8+hwQCnJmpuYEGlM6UEyI2z6bR8hVh+BcEdI9jYNEiACOR
         rUHA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791764535; x=1792369335; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fk754Br0Atpw8UnVE6DvVZsNKb0d4aNb92220Jc8a90=;
        b=ZMSI+i1GApoB0aGqzB8TZCQgo2UhM9Hc7P5NRsvB1oC5zMN65hf2uOkM+yUiq3rfs7
         zfSNNBwLCKc7qzMvxdtY2D2tn9QugyzzSuzcSAFwmqE9umPGjry3AzGBTaqk7gMZFX4x
         A2IjnPBzdo22AYXrm1nQ8xFHLUhAeHiUekepNxm9taDPjby3D48JW4ml06hJKqqqOzrf
         lNoIvupRLd+VHcQtm7SybmGGbKSbck8h3o92IYhHyKmH4p0srVhMLiSn3Okd2E1AoMQu
         kdc+jf6Z2ivw2rKS4aftxCVpE2GVyT7p633Yxo07mfSCSIFFkiwSaOyGKx9ifxVzay1g
         lIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791764535; x=1792369335;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fk754Br0Atpw8UnVE6DvVZsNKb0d4aNb92220Jc8a90=;
        b=XFiHvOrGyo+ys451nPICfJGIFD9z32EzyBtNNcP2QKyekYeGil/tN2hF1gr/UH+h7R
         yidyc7evqh6ize1Sr/UUk3r6TMjTlutjpVDyATfir4aQLv94hJQVPgIU3je6TTi9n1Nk
         xeih02IBSzh05i+cNJQAN/umTIoq47Q2UDTNQkmUw/2k6VkPol6+aJjL+gbkMcLnVfir
         uHicI8uzXNYf2YxveYLlVVQMLCK/PqPg3OtpLceDOPYTNsRAAlxG1DbotHwU1OisSbjG
         8Z4Nt0JOXWUMzMB26bwD33TqlnY3CJD5DIuDivy1q8W4ne/b3HrFzbWFCwnUbAlByxbP
         k6Jg==
X-Forwarded-Encrypted: i=1; AKwUvBwU/rn/II9fGXZif5r2hlwoXKIR73S4JNtATQcGy1FhMyWGpWtJkQL1ExscNUk6n82pi6fnRYCesySMYA==@lists.infradead.org
X-Gm-Message-State: AFq9FYK+6Mbc1cvFAYB512/OH1V0SED8fjQ7AActI9uhKJzL8KK6jpBY
	aOkdnQcrPFX97LZZB36RbsSP/Uxph0qneJ4G/y9FRRvCbjg6FkRJyaw1TIEVyPYmUBZawo7hy62
	xyWhJpKK4VpHNSsPmu8SuN8rcDo7g5Lk=
X-Gm-Gg: AYBFou2WNA2ezbb4aT7Y8VuXw2HbbS+vNbbdBqtUz2vMRlx5E4bUx26Mey2Kd86MB3v
	Eyvhv/W0I93V3LWncmQI5uW+JaDwt0k7i6g1utq2+abSP3x42j2hMDsWgI0xWLKsiVy6q2MCvAU
	McbkgvZWay7pDtVo89uGfCpEALFxnb8GLVVI9oEGROtdDJ7njmbGwEPzxNt2Y5kXDAsXvRJ3Y8c
	fFg0AhaMae+Y2qJmAhrSjigcAySdm/CU7ecWKfKudXPX9x5arzDrlwkb/IjaV2Hnvzq14jh7Q9W
	wMm5FbKD5/WXhF4Z26/WyxTz3YNiGm7PE5vJFHAwqsh5itPcpqmio4M=
X-Received: by 2002:a05:6870:810d:b0:485:d1ab:793b with SMTP id
 586e51a60fabf-4a2a8865dfdmr6554627fac.28.1791764534961; Sun, 11 Oct 2026
 17:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260930150213.799245-1-anup.patel@oss.qualcomm.com> <20260930150213.799245-4-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260930150213.799245-4-anup.patel@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 19:22:03 -0500
X-Gm-Features: AclHuK9MkudB1B-eUbBN_UM98-qj6k_wTx4wpH_rFnm3lLlunJHjpC-2zIymSsM
Message-ID: <CABb+yY0gLY8VuY0pDKKm4EfS3wp3buLgF=waajaA7JD0UX-VwQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] mailbox: add direct synchronous send support
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Rahul Pathak <rahul@summations.net>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Himanshu Chauhan <hchauhan@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_172216_431012_AA802FF9 
X-CRM114-Status: GOOD (  11.84  )
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

T24gV2VkLCBTZXAgMzAsIDIwMjYgYXQgMTA6MDbigK9BTSBBbnVwIFBhdGVsIDxhbnVwLnBhdGVs
QG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogQW1pcnJlemEgWmFycmFiaSA8YW1p
cnJlemEuemFycmFiaUBvc3MucXVhbGNvbW0uY29tPgo+Cj4gU29tZSBtYWlsYm94IGNvbnRyb2xs
ZXJzIGNhbiBjb21wbGV0ZSBhIHRyYW5zYWN0aW9uIGVudGlyZWx5IHdpdGhpbgo+IHRoZSBjYWxs
aW5nIGNvbnRleHQsIHdpdGhvdXQgZ29pbmcgdGhyb3VnaCB0aGUgcXVldWVkIFRYIHN0YXRlCj4g
bWFjaGluZSBvciBhIFRYLWRvbmUgaW50ZXJydXB0LiBBZGQgYSBzeW5jaHJvbm91cyBzZW5kIHBh
dGggc28gdGhlaXIKPiBjbGllbnRzIGNhbiByZXF1ZXN0IG9uZSBhbmQgd2FpdCBmb3IgdGhlIHJl
c3VsdCBkaXJlY3RseS4KPgo+IENvbnRyb2xsZXJzIGFkdmVydGlzZSBzdXBwb3J0IHZpYSB0aGUg
bmV3IHNlbmRfZGF0YV9zeW5jKCkgb3AgYW5kCj4gY2xpZW50cyBvcHQgaW4gYnkgc2V0dGluZyB0
eF9zeW5jIHdoZW4gcmVxdWVzdGluZyB0aGUgY2hhbm5lbC4KPgo+IENoYW5uZWxzIGJvdW5kIHRo
aXMgd2F5IG11c3Qgbm90IGNhbGwgbWJveF9jaGFuX3R4ZG9uZSgpIG9yCj4gbWJveF9jbGllbnRf
dHhkb25lKCksIGFuZCBtYm94X3NlbmRfbWVzc2FnZSgpIGFuZCBtYm94X2ZsdXNoKCkgbm93Cj4g
cmVqZWN0IHRoZW0sIHNpbmNlIG9ubHkgbWJveF9zZW5kX21lc3NhZ2Vfc3luYygpIGlzIGEgdmFs
aWQKPiB0cmFuc21pdCBwYXRoLiBUaGUgY2xpZW50IHJlbWFpbnMgcmVzcG9uc2libGUgZm9yIHNl
cmlhbGl6aW5nIGNhbGxzCj4gdG8gbWJveF9zZW5kX21lc3NhZ2Vfc3luYygpIGFnYWluc3QgbWJv
eF9mcmVlX2NoYW5uZWwoKS4KPgpTZWVtcyBsaWtlIHlvdSB3YW50IHRvIHVzZSBtYm94X2NsaWVu
dC50eF9ibG9jay4KClJlZ2FyZHMsCkphc3NpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
