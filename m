Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FDBCCD194
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 09:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r5WQwvTDm94RGm2kWM72eAfk7IxxnKURMb50MlO003g=; b=XshF76Uu9s5e9/
	iyzgNNju4D+gehV8tXlJZz+Xm4O3Nfj8I5LZ6Mht1mAzm+yGLnc81Ym6hnL61Yo5aUZebktJ1L8+K
	YPY4X6mthBE7yUzT6g2QOgsm/laXUpPVTHVQ/H1jpCWHXpOQ/tBEiMS8FprWJiLZNCnxLlpkoRFES
	hhDuFqmLrvjDz3q4oYhXxVOpMy9UkFYRS7McUS+PkBwyyRBJEn9dIZ8VXgf3/U5bWRxQ1sz+B/zoR
	dpZrKAxmuVOpfSSQWi35MhIqoWooRk42RLljuYoVwnKqIVoBy3p6xH60mOZqTa0xuCvwSDodWwSqK
	olmcv6OUBBuyEXoNjVCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Kli-00000004IyH-3Hia;
	Thu, 16 Oct 2025 09:59:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Klh-00000004IxO-3RpN
	for linux-riscv@bombadil.infradead.org;
	Thu, 16 Oct 2025 09:59:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vu9z05PojAySjuSCHEJIz8974laOBmhnnWHve0OaPVc=; b=Ja4LacidMVYDd74QAf83Ze1Elz
	KtoY9qgYcmQ8kBeq5wEIfc12UEy2z0coxQCmeQ7RSby+ThkgEanSmFWE7jwh5xhvl805YTtJ4UvVP
	y/HT5UqeXHSeV3MIxdHxoczw0x30jOEjDP1pfSUEbM49hEdtfdaJX1hh6c6fq3wEeAX2HNYTnpT16
	yK5TVbBqDBGoJuthKqCRtaOKEZuFvdq9MtWuQrt6BgpHIhopihe8dYjY0df2q5L1xnAx/HkIsh/no
	YJKEhjuQZ6K7Ufd1moxl+wVnWXpRbE4N7KReoGUkkHqarLc/dLzNwlN9fHou6p37M7bs6U8aLTuEO
	T2zJ6BVA==;
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KlQ-00000006eUK-1nds
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 09:59:32 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-58afb2f42e3so646113e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 02:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760608753; x=1761213553; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vu9z05PojAySjuSCHEJIz8974laOBmhnnWHve0OaPVc=;
        b=1a3sKee77CDzSsUtjME4tqCoUxkFzCGKlVvJDpoyLfp9A1Z5/8K7wJv87LRBVPcXrp
         RSkWIMc19HrXjAmTYdBSWZsfBYhElrUow2TRserQvwzKoawF0lGxWEHZMV1fO78DoxRP
         QQLKNpPLh0op0JhwkVzkibOoNYprM2GyitvnVNvW/9yXq9T+ayY4l6ZFBNNbazZ2Q1fO
         AcX13j+MtM54DApJzaaaypserixZiNC/ZxjaWvk2HkQm8qEBeHgvpgrmVZunWaBeT87I
         lsRXkEjtNqZYiqPyp53C3pWbsopsjC0iSHT62adI+Ot0JrdGZaQ+ETiGvooxvB3RmKKX
         6ECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760608753; x=1761213553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vu9z05PojAySjuSCHEJIz8974laOBmhnnWHve0OaPVc=;
        b=Jb4K/76BpmAQXTVj24SQ1VbkET3QJq+7xR5nEbKTbwFhCkPAM+46+uwBEM7HEtmYO1
         ElDq0c6TV+mGE7bRaV5jyCD9Bqfy2UjwGh5RF/wlMqno17/KKmM4oPGTODOIdxN+NBJa
         PuB4BXKmxTfdDzkFH5SHbfgYvqcOK0Xe7bv7u27VMs5NuUPTF8DPrvgdMvND0r58eJ0w
         3LAyjMJdUv6bCto6aDsQECsWEqI0crvY4CTSCr2Y9oPff4C78Y+Qo1+Ad7weGTSCbwj7
         ONx0bsrfWnjjs0xilVYJ9bpyiTw/1sB+9JK9XJrrcleH3oiCks+U80r9cCpVDCOj94VO
         OfXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtAgIUdWxm1Xr1J7XfCWaVBtnM4YITmarniVgSjCC/PSy5CTA6Q3OZ0DwLRhrJUext7Lz1JzaBp4LC9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRC+iMbpLfGrNGIQOQ2VzyAjS0ptVYEtayua2ikFYJCZHfMaSu
	5DWEOpp+TUTlDQBs2NdYWJ9dIjFhmOgt7u0MIvKjWRklyNUb/LlOMBmcIAqP0xhrqcmpcu6uQot
	OdZKT2iHuQHhIx7cXB+ofbKcXE7FRFpcCsxIspso3zw==
X-Gm-Gg: ASbGncuYVUYTT5lbT650lWvsCE+0WMaafsFAuKuaJGxU4HyYgIbGku64piSfbqZn4Ci
	0uUypTifeq6mf5etC5j3BYb0WN8x49VgBahAs5Oq0PKLPAsmQvXSQX+zfJCm35Fhm6/ZNcjMjIj
	Y0YLCxpnQBWGcFb41fiNGrGiEDSnQVStCaSnFInTTrCRuln6BUaTPW/ensZKRYDGugz142d2tRd
	ehSxoVgxNbt3hwvNEta2uSYASgyZLWpbq1vc7i93HmlBq4Z8EFbmvDgDh0Nzsu436kDDhAlgclq
	g9Q+u7lomK1w/awi
X-Google-Smtp-Source: AGHT+IE44Pe/lNFjVwo5dvfl5OexZywAB5coMkbyKb7gQx6NnwL7+kNNAtUDNiJeEwtWT2LMbH90I1pPilstPuxVwAU=
X-Received: by 2002:a05:6512:1095:b0:58b:75:8fbc with SMTP id
 2adb3069b0e04-5906dd8ef00mr9529664e87.50.1760608752524; Thu, 16 Oct 2025
 02:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20251016003631.3912523-1-samuel.holland@sifive.com>
In-Reply-To: <20251016003631.3912523-1-samuel.holland@sifive.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 16 Oct 2025 11:59:00 +0200
X-Gm-Features: AS18NWAtcYEK6c9DgJvJzyhAb88b9a1Ukmn-vsoKJrJZwtHDLluVjdni2Gu7gpw
Message-ID: <CAMRc=MdUrm8fNRHcpAgNubJ+AM=iyThMe0hLLRd1vni8xbf2=Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: sifive: Support module autoloading
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <pjw@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_105929_583266_050F337F 
X-CRM114-Status: GOOD (  16.93  )
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

T24gVGh1LCBPY3QgMTYsIDIwMjUgYXQgMjozNuKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEFkZCBNT0RVTEVfREVWSUNFX1RBQkxFKCkg
c28gdGhlIGRyaXZlciBtb2R1bGUgY2FuIGJlIGxvYWRlZAo+IGF1dG9tYXRpY2FsbHkgYmFzZWQg
b24gYSBjb21wYXRpYmxlIHN0cmluZyBhbGlhcy4KPgo+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBI
b2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgo+IC0tLQo+Cj4gIGRyaXZlcnMvZ3Bp
by9ncGlvLXNpZml2ZS5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bpby9ncGlvLXNpZml2ZS5jIGIvZHJpdmVycy9ncGlv
L2dwaW8tc2lmaXZlLmMKPiBpbmRleCA5NGVmMmVmYmQxNGYuLmU5YTk5MmNkNGI5YyAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby1zaWZpdmUuYwo+ICsrKyBiL2RyaXZlcnMvZ3Bpby9n
cGlvLXNpZml2ZS5jCj4gQEAgLTI2MCw2ICsyNjAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9m
X2RldmljZV9pZCBzaWZpdmVfZ3Bpb19tYXRjaFtdID0gewo+ICAgICAgICAgeyAuY29tcGF0aWJs
ZSA9ICJzaWZpdmUsZnU1NDAtYzAwMC1ncGlvIiB9LAo+ICAgICAgICAgeyB9LAo+ICB9Owo+ICtN
T0RVTEVfREVWSUNFX1RBQkxFKG9mLCBzaWZpdmVfZ3Bpb19tYXRjaCk7Cj4KPiAgc3RhdGljIHN0
cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc2lmaXZlX2dwaW9fZHJpdmVyID0gewo+ICAgICAgICAgLnBy
b2JlICAgICAgICAgID0gc2lmaXZlX2dwaW9fcHJvYmUsCj4gLS0KPiAyLjQ3LjIKCkl0IGxvb2tz
IGxpa2UgaXQgc2hvdWxkIGhhdmUgYmVlbiBwYXJ0IG9mIGNvbW1pdCA2YjRjNzZkZWQzNTggKCJn
cGlvOgpzaWZpdmU6IEFsbG93IGJ1aWxkaW5nIHRoZSBkcml2ZXIgYXMgYSBtb2R1bGUiKSBpbiB0
aGUgZmlyc3QgcGxhY2UuIElmCnRoYXQncyB0aGUgY2FzZSwgd291bGQgeW91IG1pbmQgcmVzZW5k
aW5nIHdpdGggYSBGaXhlczogYW5kIENjOiBzdGFibGUKdGFncz8KCkJhcnQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
