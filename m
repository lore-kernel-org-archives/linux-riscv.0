Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8026CC25B7B
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 17:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2disc3TE6yyTYiUS7EVEmIdk6GuEvMTxh18c+iBDAE8=; b=oHV0BVJ49AQTUS
	wMAJRQmQT48/h6W9Vzx7bnqpbloMtxUX3jJb5Vy8bEhyfHmrFOgerlA1bwi/KcUMS/8GYr5bs3yvH
	PGRLNb6035+IpNvn0xuzV0EWtoda6moDtx8P/jeFcj4mKjfKDFkhUjOAXnZx58n9HVOs6kyqIZcHL
	S9HzgIBeu0UZM24rBTF5G6vDtYYDncW4bEAQMrpCw1pkk/d7Jk8HrQZp11312vIuWSmQOfcLM5ySz
	TTk2SpA+RsS0iMfJwa6mbEoTWsKMla2VRfCumqrRhBqQPPH0vruHD8DdxFsdEXww9KK0cApc9mTIT
	548YbzkatGVtBr5XFebw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7IC7-00000002GTJ-1k4U;
	Wed, 15 May 2024 17:13:35 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7IC2-00000002GQB-3Enp
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 17:13:33 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2e1fa1f1d9bso124119781fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 May 2024 10:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1715793208; x=1716398008; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nG8JDEZluA+U+D68g8z0TeZdm/BEqT6rREHFgTIhPW4=;
        b=Ysqphdn0ubXgr1Y1szcMtZxlZlLFz1zUwgLdPpaUu87m3WfmQEe1ZMIU3HWtl7HSnN
         2uF7PAXypzuV3d8b9G3UsmovoSmyDCbTA5U6HQIMy0RVVlo91WZo5AgYwy4/tM/+wkeD
         wlOABEI8fswvl/ScByS0/I/a27Zflnw0BR+oT3TTVyzyYtuGQndO+Wl3KSObWZ3G30mt
         fkJXxO0X1SbPXzk1IjIZnnczhx1uYXCyGeCuonIM4fn1qEfCBdB4zqx4gjGMSh+PUCKU
         CiHwMVHP11KAirU7LQWnte8p8O24tvWe4Usj8XvPI32siAxc4aEVth5cqyHpmSiQbxYg
         Zvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715793208; x=1716398008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nG8JDEZluA+U+D68g8z0TeZdm/BEqT6rREHFgTIhPW4=;
        b=NdXtC05D+sEHyY8k6eAewR/6UeAbsecg9iXBTaanrR/l1PCMvhnU9D7d/7e3op4ey4
         xau5G2oc8skoDmGSY0Q5Q1ZMjeTzZDWF6O6uHLDxZ7Eq9PPzEofNJkuBbnPXwC/7y8tT
         7LjzdQTmgXflKu701ASh9C7o1ztQEp6smUdiWsxnHE6eB4/TitV8zwSwISptrhEWnXm7
         70ZJJizMpd5PSrSFh4WrMSAKCcnaf8XeztPUl0v01uFm6quGHDstS+yY3/W4TjuZ3FfM
         21FS8jLJhe6xWnzwhMuwjJlYKbgL+THEItkNdMS7gVZWNFiEzRX5VuhhzL7GRU1jOsoc
         FlDA==
X-Forwarded-Encrypted: i=1; AJvYcCUqkXzoQv/rSkMm6+TUlXDvKpe0/ka1lDku9kkZupoC3hvuoD2hpMbaCVyV7sGQga0XaZ7elNIq+kyEX9ngy7LL934YxeRKVm054RSkk+Il
X-Gm-Message-State: AOJu0YyuS7toMVMn1GTIAwgJigO3cr0feB6P3IdGl7myf3czwSeZk5S5
	5AQMDQ44clzEfVgrO3GpmNy9n3UHpieut3BzFbzge5QaJpkQlwc1FF+opPREOg+XNCzG6yew2+q
	3Q/zNUtGe2llUxQ/P1MYuYf7Hzfk1RVDRViYFtA==
X-Google-Smtp-Source: AGHT+IHfmskTbYDtGDQ4I7DObIPA2665F5KMdb6W8Wv/V4mAtLm81tAYf7jnYNcndFdsqSurRzjwAe2PkfScQpV143U=
X-Received: by 2002:a2e:7a0e:0:b0:2e2:466b:1a56 with SMTP id
 38308e7fff4ca-2e52039e2c3mr125315251fa.53.1715793207549; Wed, 15 May 2024
 10:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240515-zen-calculate-289cfb90cd65@spud> <mhng-10b71228-cf3e-42ca-9abf-5464b15093f1@palmer-ri-x1c9>
In-Reply-To: <mhng-10b71228-cf3e-42ca-9abf-5464b15093f1@palmer-ri-x1c9>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 15 May 2024 22:43:14 +0530
Message-ID: <CAK9=C2UkTD0hYymjow-yHHfBDh4CtRv-G2BPt=ncstLRmpYgyg@mail.gmail.com>
Subject: Re: riscv: irq-riscv-imsic-early.c:52:9: error: too many arguments to
 function 'riscv_ipi_set_virq_range'
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor@kernel.org>, naresh.kamboju@linaro.org, 
	linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, linux-riscv@lists.infradead.org, 
	tglx@linutronix.de, anders.roxell@linaro.org, dan.carpenter@linaro.org, 
	Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_101332_197019_BC7CCB3A 
X-CRM114-Status: GOOD (  20.20  )
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

T24gV2VkLCBNYXkgMTUsIDIwMjQgYXQgMTA6MzbigK9QTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QGRhYmJlbHQuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgMTUgTWF5IDIwMjQgMDc6MzY6MzMgUERU
ICgtMDcwMCksIENvbm9yIERvb2xleSB3cm90ZToKPiA+IFBhbG1lciwKPiA+IFRoaXMgaXMgdGhl
IGlzc3VlIEkgcG9pbnQgb3V0IHRvIHlvdSBvbiB0aGUgY2FsbCBlYXJsaWVyOgo+Cj4gWWEsIHRo
YW5rcywgSSBqdXN0IGhpdCBpdC4gIExvb2tzIGxpa2UgaXQncyBhIHNlbWFudGljIGNvbmZsaWN0
IGJldHdlZW4KPiAyMWE4ZjhhMGViMzUgKCJpcnFjaGlwOiBBZGQgUklTQy1WIGluY29taW5nIE1T
SSBjb250cm9sbGVyIGVhcmx5Cj4gZHJpdmVyIikgYW5kIGRjODkyZmI0NDMyMiAoInJpc2N2OiBV
c2UgSVBJcyBmb3IgcmVtb3RlIGNhY2hlL1RMQiBmbHVzaGVzCj4gYnkgZGVmYXVsdCIpLiAgSSB0
aGluayBhbGwgd2UgbmVlZCBpcwo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEt
cmlzY3YtaW1zaWMtZWFybHkuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtZWFy
bHkuYwo+IGluZGV4IDg4NjQxOGVjMDZjYi4uNGZiYjM3MDc0ZDI5IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtZWFybHkuYwo+ICsrKyBiL2RyaXZlcnMvaXJx
Y2hpcC9pcnEtcmlzY3YtaW1zaWMtZWFybHkuYwo+IEBAIC00OSw3ICs0OSw3IEBAIHN0YXRpYyBp
bnQgX19pbml0IGltc2ljX2lwaV9kb21haW5faW5pdCh2b2lkKQo+ICAgICAgICAgICAgICAgICBy
ZXR1cm4gdmlycSA8IDAgPyB2aXJxIDogLUVOT01FTTsKPgo+ICAgICAgICAgLyogU2V0IHZJUlEg
cmFuZ2UgKi8KPiAtICAgICAgIHJpc2N2X2lwaV9zZXRfdmlycV9yYW5nZSh2aXJxLCBJTVNJQ19O
Ul9JUEksIHRydWUpOwo+ICsgICAgICAgcmlzY3ZfaXBpX3NldF92aXJxX3JhbmdlKHZpcnEsIElN
U0lDX05SX0lQSSk7Cj4KPiAgICAgICAgIC8qIEFubm91bmNlIHRoYXQgSU1TSUMgaXMgcHJvdmlk
aW5nIElQSXMgKi8KPiAgICAgICAgIHByX2luZm8oIiVwZndQOiBwcm92aWRpbmcgSVBJcyB1c2lu
ZyBpbnRlcnJ1cHQgJWRcbiIsIGltc2ljLT5md25vZGUsIElNU0lDX0lQSV9JRCk7Cj4KPiBhcyBh
IGNvbmZsaWN0IHJlc29sdXRpb24sIHdoaWNoIElJVUMgc2hvdWxkIGhhcHBlbiB3aGVuIExpbnVz
IG1lcmdlcyBteQo+IG5leHQgUFIuICBTbyBJJ2xsIHRyeSBhbmQgcmVtZW1iZXIgdG8gY2FsbCB0
aGF0IG91dC4KClllcywgeW91ciBjb25mbGljdCByZXNvbHV0aW9uIGlzIGNvcnJlY3QuCgpUaGFu
a3MsCkFudXAKCj4KPiA+Cj4gPiBPbiBXZWQsIE1heSAxNSwgMjAyNCBhdCAwNDoxODo1OFBNICsw
MjAwLCBOYXJlc2ggS2FtYm9qdSB3cm90ZToKPiA+PiBUaGUgcmlzY3YgYnVpbGRzIGZhaWxlZCBv
biBMaW51eCBuZXh0LTIwMjQwNTE1IHRhZyBkdWUgdG8gZm9sbG93aW5nIGJ1aWxkCj4gPj4gd2Fy
bmluZ3MgLyBlcnJvcnMgd2l0aCBnY2MtMTMgYW5kIGNsYW5nIHRvb2xjaGFpbi4KPiA+Pgo+ID4+
IFJlcG9ydGVkLWJ5OiBMaW51eCBLZXJuZWwgRnVuY3Rpb25hbCBUZXN0aW5nIDxsa2Z0QGxpbmFy
by5vcmc+Cj4gPj4KPiA+PiBCdWlsZCBMb2c6Cj4gPj4gLS0tLS0KPiA+PiBkcml2ZXJzL2lycWNo
aXAvaXJxLXJpc2N2LWltc2ljLWVhcmx5LmM6IEluIGZ1bmN0aW9uICdpbXNpY19pcGlfZG9tYWlu
X2luaXQnOgo+ID4+IGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtZWFybHkuYzo1Mjo5
OiBlcnJvcjogdG9vIG1hbnkKPiA+PiBhcmd1bWVudHMgdG8gZnVuY3Rpb24gJ3Jpc2N2X2lwaV9z
ZXRfdmlycV9yYW5nZScKPiA+PiAgICA1MiB8ICAgICAgICAgcmlzY3ZfaXBpX3NldF92aXJxX3Jh
bmdlKHZpcnEsIElNU0lDX05SX0lQSSwgdHJ1ZSk7Cj4gPj4gICAgICAgfCAgICAgICAgIF5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fgo+ID4+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBpbmNsdWRlL2xp
bnV4L3NtcC5oOjExOSwKPiA+PiAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9s
b2NrZGVwLmg6MTQsCj4gPj4gICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgvc3Bp
bmxvY2suaDo2MywKPiA+PiAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9zY2hl
ZC5oOjIxNDIsCj4gPj4gICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgvcmF0ZWxp
bWl0Lmg6NiwKPiA+PiAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9kZXZfcHJp
bnRrLmg6MTYsCj4gPj4gICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgvZGV2aWNl
Lmg6MTUsCj4gPj4gICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgvbm9kZS5oOjE4
LAo+ID4+ICAgICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRlL2xpbnV4L2NwdS5oOjE3LAo+ID4+
ICAgICAgICAgICAgICAgICAgZnJvbSBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLWVh
cmx5LmM6ODoKPiA+PiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NtcC5oOjUyOjY6IG5vdGU6IGRl
Y2xhcmVkIGhlcmUKPiA+PiAgICA1MiB8IHZvaWQgcmlzY3ZfaXBpX3NldF92aXJxX3JhbmdlKGlu
dCB2aXJxLCBpbnQgbnIpOwo+ID4+ICAgICAgIHwgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn4KPiA+Pgo+ID4+IG1ldGFkYXRhOgo+ID4+ICAgZ2l0X2Rlc2NyaWJlOiBuZXh0LTIwMjQwNTE1
Cj4gPj4gICBnaXRfcmVwbzogaHR0cHM6Ly9naXRsYWIuY29tL0xpbmFyby9sa2Z0L21pcnJvcnMv
bmV4dC9saW51eC1uZXh0Cj4gPj4gICBnaXRfc2hhOiA4MmQ5MmE5YTFiOWVhMGVhNTJhZmYyN2Nk
ZGQwNTAwOWI0ZWRhZDQ5Cj4gPj4gICBnaXRfc2hvcnRfbG9nOiA4MmQ5MmE5YTFiOWUgKCJBZGQg
bGludXgtbmV4dCBzcGVjaWZpYyBmaWxlcyBmb3IgMjAyNDA1MTUiKQo+ID4+Cj4gPj4gTGlua3M6
Cj4gPj4gIC0gaHR0cHM6Ly9xYS1yZXBvcnRzLmxpbmFyby5vcmcvbGtmdC9saW51eC1uZXh0LW1h
c3Rlci9idWlsZC9uZXh0LTIwMjQwNTE1L3Rlc3RydW4vMjM4OTQyOTUvc3VpdGUvYnVpbGQvdGVz
dC9nY2MtMTMtbGtmdGNvbmZpZy9kZXRhaWxzLwo+ID4+ICAtIGh0dHBzOi8vc3RvcmFnZS50dXhz
dWl0ZS5jb20vcHVibGljL2xpbmFyby9sa2Z0L2J1aWxkcy8yZ1VpS2R4WDdxTTI3cml0TUpUNXBS
eVpoeWkvCj4gPj4gIC0gaHR0cHM6Ly9xYS1yZXBvcnRzLmxpbmFyby5vcmcvbGtmdC9saW51eC1u
ZXh0LW1hc3Rlci9idWlsZC9uZXh0LTIwMjQwNTE1L3Rlc3RydW4vMjM4OTQyOTUvc3VpdGUvYnVp
bGQvdGVzdC9nY2MtMTMtbGtmdGNvbmZpZy9oaXN0b3J5Lwo+ID4+Cj4gPj4gLS0KPiA+PiBMaW5h
cm8gTEtGVAo+ID4+IGh0dHBzOi8vbGtmdC5saW5hcm8ub3JnCj4gPj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
