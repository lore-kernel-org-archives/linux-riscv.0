Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB64AC47074
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 07:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GnZOTznrceNjXXCskFXJi4JKB1pGhGaplbknJGMOlnU=; b=C8qt4wRh+RIoNa
	CrxVVA5ahTtopZwiCOCCIaNHzvDU4X7/F515NVnC/jEFkWDbY73MbvWaN1VhRRMzVrez3OXCCRswi
	rRXpKtk5TDeDIFuJrBaILTdUvEWhwoB5TUiYJOynEwrff8rRRt26Q8YObeGGKegpmKMI5th8Z5Abq
	Uh0cNV+kxs8cmq80vvgvYrUJFtnP3JAzfpnq0/9SH9eXbmDI06dmVWpSGE/59J87VnRBS6pkJnfC3
	XKlgDVkZSNm8n0CZ5/NqTIobssPjDe5HOabKdJEVArgBGg83H1bAnnzKDqifw3xPhgTSAFX8DrvY7
	VlvM8WdamDbrJsBiKUwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r39t6-0005RR-35;
	Wed, 15 Nov 2023 07:00:36 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r39t4-0005Ql-2b
	for linux-riscv@lists.infradead.org;
	Wed, 15 Nov 2023 07:00:36 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6b44befac59so442890b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 23:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700031631; x=1700636431; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBd2cbY+fwIsvYalDj9N2umWHVZP1YU3heVkt+n/fBg=;
        b=PG8ZqftTWlot8Gb/9Klsm7J+hI2bSzt9QvV0afeIkhQQDJJu/YXs/pQuuYAei/Q/Th
         OWCBjotS/wXmO21kZmXjZ8mBypLhdVaJr94dqzz0yTZabDAhXGvcpCTMbRYTqNK2i74o
         rnVVT5wFtiJ3aHe7cZe822/C6wTvUgoLpGHfst0h16fh34jjQA6QrnNH17yW5CHtUKrj
         9VUp79NKqZYwhXzclb4vM2o0pgnFwyIV+eDq5Tv74mV6A/qbdWr3zs7AfiVHUIFNm5yy
         x8W1EWaa8txe3w8h+ch1Wh12yrHN/WP6sxdzVwSefPBofeLK8hnw7bzTsemQHrHw6C/2
         NORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700031631; x=1700636431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IBd2cbY+fwIsvYalDj9N2umWHVZP1YU3heVkt+n/fBg=;
        b=KKzv2iEzXPSCttq2OPl7+VjtyKasPVsMoxxZdAEbY6iVtKb306GftSBgz+T/LgJIIO
         79mEtLpSq1qx1oY5yJ83N+B734+n8zrcqPd3fGZLsK/QK6c0y6bFDuXwgZMsAjJ/fwN2
         EHz0uBO6ZncD4YG0FCX/FJ/w/j7jukmZYTf3+IF+2+Amv96hbZ8Wfmc2DAh1our5yahe
         ztRaHBTq+wDuWAAA+4HxAAdvpG2hSZJNJyEgiQbKqIY9YTDTl0olARhnXvBZo4PUiwYX
         4Q9hdImOongPTgodPIJ3PqkDi1qzAXWoqZYdLVFvHZ5QUvS4wVjGRvKmsvym99+DSAL8
         FX8g==
X-Gm-Message-State: AOJu0YyPeK3mttgFsswGs5R3H6dY8GK8OjvdeqYOQqbp4Nm7Kh/p/LQI
	UcjivN2tB71SHJvSVDxIT1kHamsUc0NLPatcSOSVzQ==
X-Google-Smtp-Source: AGHT+IE8l94VPqR/L8cfktvkb9oSVY8ofXtchF4ZtmbhPwGleXc0uta/b/x+FF875m9JQ19/o074ejNR5fVWi/A/R24=
X-Received: by 2002:a17:90b:1b47:b0:280:280c:efe3 with SMTP id
 nv7-20020a17090b1b4700b00280280cefe3mr6609635pjb.14.1700031630913; Tue, 14
 Nov 2023 23:00:30 -0800 (PST)
MIME-Version: 1.0
References: <20231115061811.10041-1-joshua.yeong@starfivetech.com>
In-Reply-To: <20231115061811.10041-1-joshua.yeong@starfivetech.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 15 Nov 2023 12:30:18 +0530
Message-ID: <CAK9=C2VXxNjKOq1XqQ9t6iVELdj2fFi85K77xNCOfdf3WRdy8w@mail.gmail.com>
Subject: Re: [PATCH 1/1] clocksource/timer-risc: Add riscv_clock_shutdown callback
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, leyfoon.tan@starfivetech.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_230034_872723_B915DA47 
X-CRM114-Status: GOOD (  15.10  )
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

T24gV2VkLCBOb3YgMTUsIDIwMjMgYXQgMTE6NDnigK9BTSBKb3NodWEgWWVvbmcKPGpvc2h1YS55
ZW9uZ0BzdGFyZml2ZXRlY2guY29tPiB3cm90ZToKPgo+IEFkZCBjbG9ja3NvdXJjZSBkZXRhY2gv
c2h1dGRvd24gY2FsbGJhY2sgdG8gZGlzYWJsZSBSSVNDLVYgdGltZXIgaW50ZXJydXB0IHdoZW4K
PiBzd2l0Y2hpbmcgb3V0IHJpc2N2IHRpbWVyIGFzIGNsb2NrIHNvdXJjZQo+Cj4gU2lnbmVkLW9m
Zi1ieTogSm9zaHVhIFllb25nIDxqb3NodWEueWVvbmdAc3RhcmZpdmV0ZWNoLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIHwgNyArKysrKysrCj4gIDEgZmls
ZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsb2Nr
c291cmNlL3RpbWVyLXJpc2N2LmMgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMK
PiBpbmRleCBkYTMwNzFiMzg3ZWIuLjU4OGEwNTQ1OWI2YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMKPiArKysgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3Rp
bWVyLXJpc2N2LmMKPiBAQCAtNTAsMTIgKzUwLDE5IEBAIHN0YXRpYyBpbnQgcmlzY3ZfY2xvY2tf
bmV4dF9ldmVudCh1bnNpZ25lZCBsb25nIGRlbHRhLAo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0K
Pgo+ICtzdGF0aWMgaW50IHJpc2N2X2Nsb2NrX3NodXRkb3duKHN0cnVjdCBjbG9ja19ldmVudF9k
ZXZpY2UgKmV2dCkKPiArewo+ICsgICAgICAgc2JpX3NldF90aW1lcigtMSk7CgpVc2UgcmlzY3Zf
Y2xvY2tfZXZlbnRfc3RvcCgpIGhlcmUuCgo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiArCj4g
IHN0YXRpYyB1bnNpZ25lZCBpbnQgcmlzY3ZfY2xvY2tfZXZlbnRfaXJxOwo+ICBzdGF0aWMgREVG
SU5FX1BFUl9DUFUoc3RydWN0IGNsb2NrX2V2ZW50X2RldmljZSwgcmlzY3ZfY2xvY2tfZXZlbnQp
ID0gewo+ICAgICAgICAgLm5hbWUgICAgICAgICAgICAgICAgICAgPSAicmlzY3ZfdGltZXJfY2xv
Y2tldmVudCIsCj4gICAgICAgICAuZmVhdHVyZXMgICAgICAgICAgICAgICA9IENMT0NLX0VWVF9G
RUFUX09ORVNIT1QsCj4gICAgICAgICAucmF0aW5nICAgICAgICAgICAgICAgICA9IDEwMCwKPiAg
ICAgICAgIC5zZXRfbmV4dF9ldmVudCAgICAgICAgID0gcmlzY3ZfY2xvY2tfbmV4dF9ldmVudCwK
PiArICAgICAgIC5zZXRfc3RhdGVfc2h1dGRvd24gICAgID0gcmlzY3ZfY2xvY2tfc2h1dGRvd24s
Cj4gIH07Cj4KPiAgLyoKPiAtLQo+IDIuMjUuMQo+CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
