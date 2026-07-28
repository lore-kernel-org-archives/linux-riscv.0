Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D3CC53219
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 15:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rrR1b3kAm0PABrCHaWHhfc1GyfG6uYKutwOdvisUBOE=; b=i6EhIHB6cMjUIo
	Du1wTLKvwY9mMyOQOIk3vLMXDZMKzOlWI6N9fySLTXP8yHQa6WANpMNSujd9OpiAthr13trO3XLZ3
	ywe+d/WbDk5Ncx1AO/2A9gMco6FCab3sk9kv05Iz/9XM0qkoUeSPX30LHhlG+q3m1bV7ohkwKXYAY
	1KWc/TdyrGbnP+LYt01MYLVpmNBbJ1IxAtZ0APIjhJKadUrZZKaxztTSZ4m3JHVsPiuuK4g6AXvVv
	kPCynSKnuHr3r/wOOP9Ds8bGzK9xqg88iAakVOHsP/sZNzGYhBa3xhPUUFfRPHK8pEMWk/zkc8rX+
	zt2a/qEY9hMdTeCGWqhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokBZ-00000005kLa-0r2o;
	Tue, 28 Jul 2026 15:57:41 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokBW-00000005kJ9-2p67
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 15:57:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so4585e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jul 2026 08:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785254256; cv=none;
        d=google.com; s=arc-20260327;
        b=dOz9Z9m3DTOJ1lSipmHbSC5Ej2nWyRNbvWkc9oJ2A429dV3U8ml6tjDC2pnKuf8smn
         88xvP3jQC5XLDJunW1fbXyp7x8Lu8RSKUKohV8efpFLTrzKm2z6AbK2wlJ9+FN+4MLXf
         3t7kTB5HKfPYh0ctTmvsAdCkGkeqw+iXsRpj1yV5PQpX+kLXaqoY+DYTmyGnJXJSX2fK
         PwApn4Rc3s3zaXlo6BARgePLQYyHozg2XxEWYo5FNx1YZA8YAPQojuxtrrITdLE+IJUa
         mZ6/g5TkEXirTK1vZpOmDZIe6d7aYXaIqVMgxHCRfV/4vetWkMdsRkNM25lE6l1fGbC/
         3Xtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lf9wr8xON851k87cAfYBV+mb2qc9bEeXow5dSdf9Cb8=;
        fh=GKzyXUFJFvTmSIQtHZgWxeDkKFq0CZiwzBJjzft9Ovk=;
        b=T/rKxC0FJBZQbN+pNvBiK64qBzVGXsM4GmqCtvVUGdVBX7yN7Cj3/ZAKAK3X9a4R4N
         vjp4AyvhNkJD31RLce42BL1GQAwn0oA0Q5iLn0kBSA0zplIvmQOSR+qJAD7QJdmtCgaY
         NbOuW04dftj03gGo0nTOJXLVHUlq4GGyW3G8wusfrUK8nvERoZR8Ib7KqXHh9iyJT/WC
         vZtKfGW+zeeXcrglvI0jzBFxBhvvDt6qPfO3mU0FeufnXozMUsZVKD/jrCKFAGWqZ9MF
         KCrGOK82yT5ZdQ1JaS726X8hpHvHRKN6eX4VceLX78v4qnYs9EAG8mU9FFydqynlimM8
         OQ2A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785254256; x=1785859056; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lf9wr8xON851k87cAfYBV+mb2qc9bEeXow5dSdf9Cb8=;
        b=bJHg9uSFeBBNYr0JFfhseLXVGazF3kMftkIQ5gsdCukduwePvi7GLcJuTF14gE4ZzH
         5uqfIIONzIUIO2VTTxwpUP/5R8/WEL80kks0Sy1wb2ryGyqJ1WIdosfAQZm0BTTfxv2O
         Uy6OB05s/aSJIa3Q2+6tygcMRhsaiJc3JvqxkIUmqT9aSUglnd8QJRZE5a5aKCc5B9CE
         1myTR8a/BhqGkeXR4wsgX7NgN59JLgAb1qP1Z27bHm6BaxWoHtpENA/2X0C421WcZv6B
         833mOpjyUO9Mk+dRKdnSdU7Keah11d7K4AzJO4gr2VgHUsq+ywL3+LhBX0ObKfEKxci3
         urIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785254256; x=1785859056;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lf9wr8xON851k87cAfYBV+mb2qc9bEeXow5dSdf9Cb8=;
        b=MTJU0Fw7oBaAhqNkyP+FDVdKalzVM8q0qq6ZwYrs8S6vSLnbgh4fgleS0KYTS0XkRS
         ybFYSIdFyKOR4BQ7bQEP5/sGEJo7Ly7DZFPRB9arTck94Y5I8gKas3p5aAQdOkO9oC3B
         OBQrSETHq86ethbOCxsFFMxfSBdlT6ak8pr3s4PFdS1tpFEWeqoVN7dcL4sz3vWi3+kN
         dmrvQNUbot0cEnKJcz0E5z+Ap9pjJ2+wAC4vLfAQFn1ZTfNrL7t/6utLbOq1T6wcQd3u
         8Hedm53TS0fhPwlt5VZBxz+mPlMf8PsHRmxHZR4WxSqlJeoNKOUNVKr/vwy2GZ52uwzZ
         0D/w==
X-Forwarded-Encrypted: i=1; AHgh+Rpj3fIPU80OVvsMOvPKz+v97IWkbpIMarwWiwyoV31k7n3FsE/GJQJvK7PKI1C+unkW/vzMLZB/u+0EMA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh+yvx8sRzA3+Lm9cGY0yYGvVX8LQm+y68k8se+rSTiOfRF9xf
	W/GqwXFcu7ZVrkMEqnbnBv4QMOLg5Fxzv2ol0ssLbq7D9LDKRkzjWPQruudh7dYf8dlJuaLyfmh
	bk1mfEEI8ZYiiLAOr+asszPOc7uJcfUTimxlVsvaEXQ==
X-Gm-Gg: AR+sD12N0j/t570+j2jfayy6vo2zg5Ccf1wZjjAN6tCdj/s60u1vg+8jRTkBvLQ6mXP
	EDF7+oc/U2b7uTDyJMyLHO3x/F9uYSiK7hY1cOTkCcPI9eUO5R7rv4PCZSswvK0uE6IvcgI+lxe
	tIu5cO3+cJqRWsbEYUunmZVyZ4OWx8DNABPlPbMvc2cpn6MuXK28DeQlbCo1+PfBvqv2MhIdudH
	Gd1v1h1E+gDdLelmfBm0TSbG1oQ3HCKo+xOzAD7HqA0NZ21oOYbggDXGgk1C26+2q98IDWTYKY5
	F4bHL/TwchrfqjcvLUp18haopvWEFik06RttKUuM1nVydYvUnCZTSrclvjlW02O2mj4nJDFquRC
	4egUp
X-Received: by 2002:a05:600c:348c:b0:495:4fd4:f7b6 with SMTP id
 5b1f17b1804b1-496c659f7e1mr36007685e9.37.1785254255988; Tue, 28 Jul 2026
 08:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260728141938.95845-1-yang.yicong@picoheart.com>
In-Reply-To: <20260728141938.95845-1-yang.yicong@picoheart.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 28 Jul 2026 21:27:24 +0530
X-Gm-Features: AUfX_myWbuJ1vCxTHkL5qUQMNMMORYmpwxFlrJVlhYBqJ0prODKRN7X_pkzowJU
Message-ID: <CAAhSdy0a30XuKJGsRHf4p3BkO0vbJLWij9xp-CPKd7Rj2hjyCw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Use try_cmpxchg for IMSIC MRIF RMW
To: Yicong Yang <yang.yicong@picoheart.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, geshijian@picoheart.com, 
	shenyang.young@picoheart.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_085738_728193_DCDCED4E 
X-CRM114-Status: GOOD (  17.80  )
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

T24gVHVlLCBKdWwgMjgsIDIwMjYgYXQgNzo0OeKAr1BNIFlpY29uZyBZYW5nIDx5YW5nLnlpY29u
Z0BwaWNvaGVhcnQuY29tPiB3cm90ZToKPgo+IEN1cnJlbnRseSB0aGUgUk1XIGZvciBJTVNJQyBN
UklGIGlzIGltcGxlbWVudGVkIHdpdGgKPiB3b3JkIExSU0MgbG9vcC4gVGhpcyB3aWxsIG9ubHkg
Y292ZXIgdGhlIGxvd2VyIDMyYml0Cj4gb24gYSA2NGJpdCBzeXN0ZW0uIEluc3RlYWQgb2YgZ3Vh
cmQgdGhlIGltcGxlbWVudGF0aW9uCj4gd2l0aCBDT05GSUdfNjRCSVQgaGVyZSwgdXNlIHRyeV9j
bXB4Y2hnKCkgd3JhcHBlcgo+IHdoaWNoIGhhcyBhbHJlYWR5IHRha2UgY2FyZSB0aGlzIHRvIGZp
eCB0aGlzIGlzc3VlLgo+IEl0IGNhbiBhbHNvIHVzZSBBTU8gaW5zdHJ1Y3Rpb25zIG9uIHN1cHBv
cnRlZCBzeXN0ZW0uCj4KPiBGaXhlczogZGI4YjdlOTdkNjEzICgiUklTQy1WOiBLVk06IEFkZCBp
bi1rZXJuZWwgdmlydHVhbGl6YXRpb24gb2YgQUlBIElNU0lDIikKPiBTaWduZWQtb2ZmLWJ5OiBZ
aWNvbmcgWWFuZyA8eWFuZy55aWNvbmdAcGljb2hlYXJ0LmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNj
di9rdm0vYWlhX2ltc2ljLmMgfCAxNSArKysrKystLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2t2bS9haWFfaW1zaWMuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gaW5kZXgg
ZDM4ZjVkZTA4MzRjLi5jOTIyYzAzNzM0NGMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0v
YWlhX2ltc2ljLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+IEBAIC0yMjAs
MTUgKzIyMCwxMiBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBpbXNpY19tcmlmX2F0b21pY19ybXco
c3RydWN0IGltc2ljX21yaWYgKm1yaWYsCj4gIHsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgb2xk
X3ZhbCA9IDAsIHRtcCA9IDA7Cj4KPiAtICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9fICgKPiAt
ICAgICAgICAgICAgICAgIjA6ICAgICBsci53LmFxICAgJTEsICUwXG4iCj4gLSAgICAgICAgICAg
ICAgICIgICAgICAgYW5kICAgICAgICUyLCAlMSwgJTNcbiIKPiAtICAgICAgICAgICAgICAgIiAg
ICAgICBvciAgICAgICAgJTIsICUyLCAlNFxuIgo+IC0gICAgICAgICAgICAgICAiICAgICAgIHNj
LncucmwgICAlMiwgJTIsICUwXG4iCj4gLSAgICAgICAgICAgICAgICIgICAgICAgYm5leiAgICAg
ICUyLCAwYiIKPiAtICAgICAgICAgICAgICAgOiAiK0EiICgqcHRyKSwgIityIiAob2xkX3ZhbCks
ICIrciIgKHRtcCkKPiAtICAgICAgICAgICAgICAgOiAiciIgKH53cl9tYXNrKSwgInIiIChuZXdf
dmFsICYgd3JfbWFzaykKPiAtICAgICAgICAgICAgICAgOiAibWVtb3J5Iik7Cj4gKyAgICAgICBu
ZXdfdmFsICY9IHdyX21hc2s7Cj4gKwo+ICsgICAgICAgb2xkX3ZhbCA9IFJFQURfT05DRSgqcHRy
KTsKPiArICAgICAgIGRvIHsKPiArICAgICAgICAgICAgICAgdG1wID0gKG9sZF92YWwgJiB+d3Jf
bWFzaykgfCBuZXdfdmFsOwo+ICsgICAgICAgfSB3aGlsZSAoIXRyeV9jbXB4Y2hnKHB0ciwgJm9s
ZF92YWwsIHRtcCkpOwoKVGhpcyBwYXRjaCBpcyBhbHJlYWR5IGJyb2tlbiBiZWNhdXNlICJvbGRf
dmFsID0gUkVBRF9PTkNFKCpwdHIpOyIKbXVzdCBiZSBkb25lIGluc2lkZSB0aGUgZG8geyAuLi4g
fSB3aGlsZSAoLi4uKQoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
