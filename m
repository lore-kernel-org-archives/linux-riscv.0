Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B840DC54E41
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 16:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/n5KLDCK/5wN2XpZMKRzCkwTMaAzdt3fdmfdOkJEU7Y=; b=DuWwUPdxnZWNwg
	P4WEUurFpizReD6W1KmiXqZ+dkru3ch4hfvVIzAL6+yD4fKqf21VN18sUqd1E3LUgc8HVI+0o+vLr
	DJYg1cMf2PzjzvoBGJB0l7C2Q5r2cefAe82KbIZE1vAkBAHNVujewJUJPyO+pMIUFMfvekFdiDGX/
	Ur2v1Cen5Qud5gqGuL33Z8ViZDsns+l+KZ+PVVSiugydNofAcR8xUENhzd6UbYG5EIWOB5Dm8kDzh
	16B0zQCHeiUGCsbMcmAmzQuFp/fTn/C56kK//WlI+UEo7obvDmPIRhE/ILTF5s/GhMZDkYWdxu3Sm
	BEg0TNyDgjaDWuHFEJVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhtuS-00000000woq-2i6s;
	Wed, 06 Mar 2024 16:14:24 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhtuN-00000000wn5-3CyI
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 16:14:21 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-512e4f4e463so8264816e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 08:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709741654; x=1710346454; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTnAQDpq/xXZDrrZFKVdG9h0DRt+PLoYidl8F6FoQRM=;
        b=ZZnRHJNmJnyUVLD0clXxj6Vvha5a0So5Iqd1aiEIbIGPjRbsKtR1YIvRqte8iGM7aT
         voMj1NedntW2WYPcInn5LT9yjF6m/JYtQVU3V1ZTRMgbjIDl/pYKOLXSOB/MtbBONR5a
         lzfsqt/+eBWqXcCgjNZRmGxNHo5eAhLa9hyUcmYnGsdIcE2ot14UhQVfoEOXqYg0AYY+
         m7ARo+Az3APdI7J4LrhbgEdhrvKxT+6rJtzXz6eVNdFOIThH1xYe/52D0X5HpiYTZh1u
         yN9RxHT6zHEowi+9TetxES0yDo4841NLQd6T0jbH9IbnHcY0o8EJOF1Eumi4dL1UwZvm
         1b1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709741654; x=1710346454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTnAQDpq/xXZDrrZFKVdG9h0DRt+PLoYidl8F6FoQRM=;
        b=VG4tJCz2cL/BiQPtMtYKHXfnQaM1eLRn9/ettdw5J7SL+tGFHcdI28zGInfO2sqjaE
         cnlyu7h5yJ9FL08xEq0IzCfRzsj2eI3Dl2ZDcIF/h3QQSgviPmLKdQ6VHsX6hwYGpSG9
         BQ9+FjFxUg/vTkgG9fkHFw56Mo19p13QNJp7LVaM93asUGCbbEeMfQqtn+SDZss3I8lI
         eFn9mK7uZSiQhC+PCnXBgbatE33J4agdp8D/Q0peB2K/ARJaoAgtLjFGTjAmkf7M58Tb
         StCEn2YSqPu9y0m7KIriO3JZlQvW2uroc6CBzIqoVrt/TBMgb2sLC8fT+RdhMoz2rcZ2
         oK1g==
X-Forwarded-Encrypted: i=1; AJvYcCXtVpPPu1wSoo8ELdEPGHnFPmKA/G06e6xTufCsfzVVjXZNu9dmHu9/8Y09VDx+rScYQ1OqmKWqFXW0tdmYx7/3Ga34g1aCJ8iGGcMcIoJh
X-Gm-Message-State: AOJu0YwVgLQJk9CP5fc6UclZGl4eHvcCfZCakCIaIVQR34T4VHWV8PWb
	jUiiy5eLAgCTHRFnpns8hiUosVjr5aZ5FPprYw7CSIc2FaHaJQ4Wmt7eRVqJ61DbYxT/x/Dj9p6
	soNn8Eh6UzqoqI0rT/H5kgHVLhwawCHK+sdaUzw==
X-Google-Smtp-Source: AGHT+IELUwkYn/nZDGmR9FqLyW9RWybu2772azYRtKpDnvK+Il12l2oNP+rIy5t2jdacBPwh32NxT8ptyeHUgLVAp1Y=
X-Received: by 2002:a05:6512:402a:b0:513:6f0c:e075 with SMTP id
 br42-20020a056512402a00b005136f0ce075mr694446lfb.24.1709741653768; Wed, 06
 Mar 2024 08:14:13 -0800 (PST)
MIME-Version: 1.0
References: <20240226040746.1396416-1-apatel@ventanamicro.com>
 <20240226040746.1396416-9-apatel@ventanamicro.com> <87y1avbboj.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87y1avbboj.fsf@all.your.base.are.belong.to.us>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 6 Mar 2024 21:44:01 +0530
Message-ID: <CAK9=C2Ud+CJzWfY0Lp97OMt9QvJBFX=hHJidn_90XY5cEB9LHw@mail.gmail.com>
Subject: Re: [PATCH v15 08/10] irqchip/riscv-aplic: Add support for MSI-mode
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_081419_943881_33B82B25 
X-CRM114-Status: GOOD (  15.26  )
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

T24gV2VkLCBNYXIgNiwgMjAyNCBhdCA5OjIy4oCvUE0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4g
d3JpdGVzOgo+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxp
Yy1tc2kuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtYXBsaWMtbXNpLmMKPiA+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmIyYTI1ZTAxMWJiMgo+ID4g
LS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1t
c2kuYwo+ID4gK3N0YXRpYyB2b2lkIGFwbGljX21zaV93cml0ZV9tc2coc3RydWN0IGlycV9kYXRh
ICpkLCBzdHJ1Y3QgbXNpX21zZyAqbXNnKQo+ID4gK3sKPiA+ICsgICAgIHVuc2lnbmVkIGludCBn
cm91cF9pbmRleCwgaGFydF9pbmRleCwgZ3Vlc3RfaW5kZXgsIHZhbDsKPiA+ICsgICAgIHN0cnVj
dCBhcGxpY19wcml2ICpwcml2ID0gaXJxX2RhdGFfZ2V0X2lycV9jaGlwX2RhdGEoZCk7Cj4gPiAr
ICAgICBzdHJ1Y3QgYXBsaWNfbXNpY2ZnICptYyA9ICZwcml2LT5tc2ljZmc7Cj4gPiArICAgICBw
aHlzX2FkZHJfdCB0cHBuLCB0YnBwbiwgbXNnX2FkZHI7Cj4gPiArICAgICB2b2lkIF9faW9tZW0g
KnRhcmdldDsKPiA+ICsKPiA+ICsgICAgIC8qIEZvciB6ZXJvZWQgTVNJLCBzaW1wbHkgd3JpdGUg
emVybyBpbnRvIHRoZSB0YXJnZXQgcmVnaXN0ZXIgKi8KPiA+ICsgICAgIGlmICghbXNnLT5hZGRy
ZXNzX2hpICYmICFtc2ctPmFkZHJlc3NfbG8gJiYgIW1zZy0+ZGF0YSkgewo+ID4gKyAgICAgICAg
ICAgICB0YXJnZXQgPSBwcml2LT5yZWdzICsgQVBMSUNfVEFSR0VUX0JBU0U7Cj4gPiArICAgICAg
ICAgICAgIHRhcmdldCArPSAoZC0+aHdpcnEgLSAxKSAqIHNpemVvZih1MzIpOwo+ID4gKyAgICAg
ICAgICAgICB3cml0ZWwoMCwgdGFyZ2V0KTsKPgo+IElzIHRoZSBmZW5jZSBuZWVkZWQgaGVyZSAo
d3JpdGVsX3JlbGF4ZWQoKSkuLi4KClRoZSBwY2lfd3JpdGVfbXNnX21zaXgoKSAoY2FsbGVkIHZp
YSBwY2lfbXNpX2RvbWFpbl93cml0ZV9tc2coKSkKdXNlcyB3cml0ZWwoKSBoZW5jZSB0YWtpbmcg
aW5zcGlyYXRpb24gZnJvbSB0aGF0IHdlIHVzZSB3cml0ZWwoKSBvdmVyIGhlcmUKYXMgd2VsbC4K
CklmIHRoYXQncyB3cm9uZyB0aGVuIHBjaV93cml0ZV9tc2dfbXNpeCgpIG11c3QgYmUgZml4ZWQg
YXMgd2VsbC4KCj4KPiA+ICsgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKyAgICAgfQo+ID4gKwo+
ID4gKyAgICAgLyogU2FuaXR5IGNoZWNrIG9uIG1lc3NhZ2UgZGF0YSAqLwo+ID4gKyAgICAgV0FS
Tl9PTihtc2ctPmRhdGEgPiBBUExJQ19UQVJHRVRfRUlJRF9NQVNLKTsKPiA+ICsKPiA+ICsgICAg
IC8qIENvbXB1dGUgdGFyZ2V0IE1TSSBhZGRyZXNzICovCj4gPiArICAgICBtc2dfYWRkciA9ICgo
KHU2NCltc2ctPmFkZHJlc3NfaGkpIDw8IDMyKSB8IG1zZy0+YWRkcmVzc19sbzsKPiA+ICsgICAg
IHRwcG4gPSBtc2dfYWRkciA+PiBBUExJQ194TVNJQ0ZHQUREUl9QUE5fU0hJRlQ7Cj4gPiArCj4g
PiArICAgICAvKiBDb21wdXRlIHRhcmdldCBIQVJUIEJhc2UgUFBOICovCj4gPiArICAgICB0YnBw
biA9IHRwcG47Cj4gPiArICAgICB0YnBwbiAmPSB+QVBMSUNfeE1TSUNGR0FERFJfUFBOX0hBUlQo
bWMtPmxoeHMpOwo+ID4gKyAgICAgdGJwcG4gJj0gfkFQTElDX3hNU0lDRkdBRERSX1BQTl9MSFgo
bWMtPmxoeHcsIG1jLT5saHhzKTsKPiA+ICsgICAgIHRicHBuICY9IH5BUExJQ194TVNJQ0ZHQURE
Ul9QUE5fSEhYKG1jLT5oaHh3LCBtYy0+aGh4cyk7Cj4gPiArICAgICBXQVJOX09OKHRicHBuICE9
IG1jLT5iYXNlX3Bwbik7Cj4gPiArCj4gPiArICAgICAvKiBDb21wdXRlIHRhcmdldCBncm91cCBh
bmQgaGFydCBpbmRleGVzICovCj4gPiArICAgICBncm91cF9pbmRleCA9ICh0cHBuID4+IEFQTElD
X3hNU0lDRkdBRERSX1BQTl9ISFhfU0hJRlQobWMtPmhoeHMpKSAmCj4gPiArICAgICAgICAgICAg
ICAgICAgQVBMSUNfeE1TSUNGR0FERFJfUFBOX0hIWF9NQVNLKG1jLT5oaHh3KTsKPiA+ICsgICAg
IGhhcnRfaW5kZXggPSAodHBwbiA+PiBBUExJQ194TVNJQ0ZHQUREUl9QUE5fTEhYX1NISUZUKG1j
LT5saHhzKSkgJgo+ID4gKyAgICAgICAgICAgICAgICAgIEFQTElDX3hNU0lDRkdBRERSX1BQTl9M
SFhfTUFTSyhtYy0+bGh4dyk7Cj4gPiArICAgICBoYXJ0X2luZGV4IHw9IChncm91cF9pbmRleCA8
PCBtYy0+bGh4dyk7Cj4gPiArICAgICBXQVJOX09OKGhhcnRfaW5kZXggPiBBUExJQ19UQVJHRVRf
SEFSVF9JRFhfTUFTSyk7Cj4gPiArCj4gPiArICAgICAvKiBDb21wdXRlIHRhcmdldCBndWVzdCBp
bmRleCAqLwo+ID4gKyAgICAgZ3Vlc3RfaW5kZXggPSB0cHBuICYgQVBMSUNfeE1TSUNGR0FERFJf
UFBOX0hBUlQobWMtPmxoeHMpOwo+ID4gKyAgICAgV0FSTl9PTihndWVzdF9pbmRleCA+IEFQTElD
X1RBUkdFVF9HVUVTVF9JRFhfTUFTSyk7Cj4gPiArCj4gPiArICAgICAvKiBVcGRhdGUgSVJRIFRB
UkdFVCByZWdpc3RlciAqLwo+ID4gKyAgICAgdGFyZ2V0ID0gcHJpdi0+cmVncyArIEFQTElDX1RB
UkdFVF9CQVNFOwo+ID4gKyAgICAgdGFyZ2V0ICs9IChkLT5od2lycSAtIDEpICogc2l6ZW9mKHUz
Mik7Cj4gPiArICAgICB2YWwgPSBGSUVMRF9QUkVQKEFQTElDX1RBUkdFVF9IQVJUX0lEWCwgaGFy
dF9pbmRleCk7Cj4gPiArICAgICB2YWwgfD0gRklFTERfUFJFUChBUExJQ19UQVJHRVRfR1VFU1Rf
SURYLCBndWVzdF9pbmRleCk7Cj4gPiArICAgICB2YWwgfD0gRklFTERfUFJFUChBUExJQ19UQVJH
RVRfRUlJRCwgbXNnLT5kYXRhKTsKPiA+ICsgICAgIHdyaXRlbCh2YWwsIHRhcmdldCk7Cj4KPiAu
Li5hbmQgaGVyZT8KClNhbWUgYXMgYWJvdmUuCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
