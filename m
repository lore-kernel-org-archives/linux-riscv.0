Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED1CEE49A5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 07:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9IIpps2Zzn4795lLXiYAx3txBGe/y7XONt3OKgIKAwE=; b=kE9Kh4FbzCZvKI
	UAGZFPPE1XmB3wU/SGgCOTYTohuTDqkz9fpA38E5Vcq1g3w47KtMqhFKlSNg6jqOHq5ir8EUmrRR7
	xWZqgqKmtC8eFsAUmz+szOtZir+mZkr1EhqMLn+6/8UwIxa/0bcm+hUlnQdqtw17iue53zuWEZ47L
	mTvGsyfX8J1zpRroIqeEVnH9I9MXk7GcbeOrZeZsjpnP7PLlpytEl2Mo+IMAneiC7I2K5lFRAyie+
	5grUeezqarffLz2XW7LJs90PoNsL3DtIQ8vwh/5tOUqdha+K/qqM5Jcxw94Z5jCSW/jnlEmRbPAwp
	/i3XGigm3Lme/dXslZgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXzhE-00DOr6-0m;
	Mon, 21 Aug 2023 07:51:32 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXzhA-00DOqP-2c
	for linux-riscv@lists.infradead.org;
	Mon, 21 Aug 2023 07:51:30 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-58dfe2d5b9aso41725327b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 21 Aug 2023 00:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1692604286; x=1693209086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IkOyMzrPXM2VgxHUc80scGsw2r/NO7mjPQDx+GPN74=;
        b=dmDahYpzHs8mZ4mluw4fY4YqFdveuqRbJAHQ/01cpHcArnHwT9aj+1N+zVh0Il7KlK
         v91zbtufrlxETSqxHueRYILxcaRcUW4ymO37hpdd5sSQweayETXouNgBrM8PIFpd7rgg
         W7SgodZHm9Q//rEIvIkge7Ixl6/OuBa9y8NygWyWJJb1dju6fFxW/yRi8ojA0+Xf5o/U
         xeIUQZbL3D1nEQ8YEUTLaFcMjhH6TdW5PVnOtME8EDeKLdsoGvmW6z2aAmGdsRUSNxAl
         KSaOZESe56qpSc1DiE/4YGZFqlLzU/445giiYxBOb5xLVLOzT7SaKVIiLymIxebCBVbz
         B2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692604286; x=1693209086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IkOyMzrPXM2VgxHUc80scGsw2r/NO7mjPQDx+GPN74=;
        b=gTc9gK4U8YexWnkZluye3RTwZFHciz82Fax6AWMINNCr0Dv9FLYzp5KSpjoAcUzoDI
         aJyueUqrfOxHwS4HEAR6oPouKxd8UH00/WIFIbK/+X1Sefz1721mK1QlaZgyU7NVub90
         f0KyVucCo/7lNzSJ2Y/5ccSmAvy4RITzsS8NsR70yaPCvwnaTQE+1+gWqnFXRn8bY+ia
         d+JsH0LMGgvQFtJG0mAdIqtObjpfoiPO2RctYtDNa+mtJWFn5YjOKCVrP0cFWspfvmSz
         Im4qjM6+7tza1aHL9qPLuSXUAHASUPozY7rcXNqdFEcEmlXujL7OJceAxxqFQIcoWkE0
         +c1Q==
X-Gm-Message-State: AOJu0YxiLq7IJ0u9ZJC0TJjdsrZNJQiDSTI6EO16Ze/n+aeNEzkq8D0b
	F1TNReBCFPmesBd6zfv/GFEVo/U3qVf3a8+QVJmL/Q==
X-Google-Smtp-Source: AGHT+IGsgfF/yqt3FJ2nXR1RxTsBuGTHFXhYYZYrd0vKqQuzmc6jZpHnNy5kwuoHkMasCmlduCzk9ohT+0c6ovX2VOY=
X-Received: by 2002:a0d:e897:0:b0:589:f9c3:8b2e with SMTP id
 r145-20020a0de897000000b00589f9c38b2emr4566061ywe.20.1692604286040; Mon, 21
 Aug 2023 00:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230615072302.25638-1-nylon.chen@sifive.com> <20230615-unvisited-deceit-9beab8ce987a@wendy>
 <CAHh=Yk_=oZJ6eY3jJzLavub5rGsvY=MKv4tGXeiqkz+rgJHwDQ@mail.gmail.com>
 <20230615-luxurious-rewire-84ff9d639fea@wendy> <20230615084310.GA780@hsinchu15>
 <mvmo7lh2ip6.fsf@suse.de> <20230615094732.GA8710@hsinchu15>
In-Reply-To: <20230615094732.GA8710@hsinchu15>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Mon, 21 Aug 2023 15:51:14 +0800
Message-ID: <CAHh=Yk8upMOdhma4EDZj_TsA2rf8=MQVrP2sidhmwBh3G-ix-Q@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Support 32_PCREL relocation type in kernel module
To: Andreas Schwab <schwab@suse.de>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, jszhang@kernel.org, ajones@ventanamicro.com, 
	aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	greentime.hu@sifive.com, zong.li@sifive.com, nylon7717@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_005128_897270_41FFFCEE 
X-CRM114-Status: GOOD (  17.04  )
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

SGkgQW5kcmVhcywKCkN1cnJlbnRseSwgZHVlIHRvIHRoZSBsYWNrIG9mIHN1cHBvcnQgZm9yIHRo
ZSB1bndpbmQgdGFibGUgaW4gUklTQy1WLAp3ZSBoYXZlIGRpc2FibGVkIGl0LgoKSWYgUklTQy1W
IHdlcmUgdG8gc3VwcG9ydCB0aGUgdW53aW5kIHRhYmxlIGluIHRoZSBmdXR1cmUsIHdvdWxkIHdl
Cm5lZWQgdG8gcmUtZW5hYmxlIGl0PyBXb3VsZCB0aGlzIHJlcXVpcmUgaW1wbGVtZW50aW5nIHJl
bGF0ZWQKY2hhbmdlcyhtb2R1bGUgcmVsb2NhdGlvbiB0eXBlIGhhbmRsZXIpIGF0IHRoYXQgdGlt
ZT8KCk55bG9uIENoZW4gPG55bG9uLmNoZW5Ac2lmaXZlLmNvbT4g5pa8IDIwMjPlubQ25pyIMTXm
l6Ug6YCx5ZubIOS4i+WNiDU6NDflr6vpgZPvvJoKCgpOeWxvbiBDaGVuIDxueWxvbi5jaGVuQHNp
Zml2ZS5jb20+IOaWvCAyMDIz5bm0NuaciDE15pelIOmAseWbmyDkuIvljYg1OjQ35a+r6YGT77ya
Cj4KPiBPbiBUaHUsIEp1biAxNSwgMjAyMyBhdCAxMToxMTo0OUFNICswMjAwLCBBbmRyZWFzIFNj
aHdhYiB3cm90ZToKPiA+IE9uIEp1biAxNSAyMDIzLCBOeWxvbiBDaGVuIHdyb3RlOgo+ID4KPiBI
aSBBbmRyZWFzLAo+ID4gPiBCZWNhdXNlIExMVk0gY3VycmVudGx5IGhhcyBpdCBlbmFibGVkIGJ5
IGRlZmF1bHQoaHR0cHM6Ly9yZXZpZXdzLmxsdm0ub3JnL0QxNDUxNjQpLCBpdCB3aWxsIGdlbmVy
YXRlIHRoaXMKPiA+ID4gcmVsb2NhdGlvbiB0eXBlLgo+ID4gPgo+ID4gPj5Gcm9tIHdoYXQgSSBr
bm93LCBHQ0Mgd2lsbCBhbHNvIGVuYWJsZSBpdCBpbiB0aGUgZnV0dXJlLgo+ID4KPiA+IFRoYXQn
cyB3aHkgdGhlIGtlcm5lbCBleHBsaWNpdGx5IGRpc2FibGVzIGl0Lgo+IE9rLCB0aGFua3MgZm9y
IHlvdXIgZmVlZGJhY2ssIGFmdGVyIEkgY3Jvc3MtdGVzdGVkLCB0aGVyZSBpcyBpbmRlZWQgbm8g
cmVsZXZhbnQgcmVsb2NhdGlvbiB0eXBlIGdlbmVyYXRlZC4KPgo+IElmIHRoaXMgZXJyb3Igbm8g
bG9uZ2VyIG9jY3Vycy4KPgo+IEkgYW0gb3BlbiB0byB0aGUgaWRlYSBvZiBhZGRpbmcgdGhpcyBw
YXRjaCB0byB0aGUgdXBzdHJlYW0gYW5kIHdvdWxkIGxpa2UgdG8gaGVhciB5b3VyIHRob3VnaHRz
IG9uIHdoZXRoZXIgaXQgaXMgc3RpbGwgbmVjZXNzYXJ5Lgo+ID4KPiA+IC0tCj4gPiBBbmRyZWFz
IFNjaHdhYiwgU1VTRSBMYWJzLCBzY2h3YWJAc3VzZS5kZQo+ID4gR1BHIEtleSBmaW5nZXJwcmlu
dCA9IDAxOTYgQkFEOCAxQ0U5IDE5NzAgRjRCRSAgMTc0OCBFNEQ0IDg4RTMgMEVFQSBCOUQ3Cj4g
PiAiQW5kIG5vdyBmb3Igc29tZXRoaW5nIGNvbXBsZXRlbHkgZGlmZmVyZW50LiIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
