Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAABC54791
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 15:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RnufNYu+z7gMUEYwWeCftT9tJIS4ABLzvNtKQiz1juU=; b=PaNu12CYrsSNu8
	isgGTNO21iowZcSx7YZps05wl9LF809mMdLQGnisRvwzj+3GlfMvGXci5Yh+57u/xhsHcUUw+uSnr
	rVDETEoKVdiLvj3ZxFxuikB+yApWhJ7kLo+ze6BoQfzcjqItRwMP3TnMQc9uXNPPZFUNYl2DGxoPR
	lMtZeJyBeTqO2YNa8Q0LoigXCrwLjN9lPvs0LfiJ6nRlWFoAeDicNOUX8C7KfecFCFzG76mn4DmOj
	Jm2NqNhmVrMPmifa0W4xkz2jwx6zGC/DROXDf8sP/I1o60+EMeF353U4NM4vV9qgkUAIY7m/SCQDs
	8JLTRwfJy63djn6n2F2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkQY2-0000000Abkz-0z2l;
	Wed, 13 Mar 2024 15:29:42 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkQXz-0000000Abjr-00Eu
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 15:29:41 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-413eede316cso912825e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Mar 2024 08:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710343777; x=1710948577; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tvt8Qtm+W+Qck4IJaiB7iim8R4TtzqabulZr702KWPU=;
        b=ubCgmjgQnjhXHDKl1zvZo90aPxzo5WNOZofbvlqNcIGCBB4GxSlAEJdszhMarTz+GR
         4dzTJ+37vGivJWUFRHnrIYQArRf5M8hjedEePaKliRSO6VAUUOCmxLBYIUb7Cdawg4ku
         D4/1Db+u5aoEPX3LuQQGF6PErDZGNMn4O55BtRdvENPQpLuVen8g8mtq4jNXcld8k4xg
         M6oMHJDDBUbwTq9Rqj79U01XJtYni52etov6oEAi46c+hZoz63HEU4re57xlI1VrohDU
         1Lm+OyI2KmiWQNf17DbXChurU+VJeF7/5C44OSlpaWE1abb+Rb3Ego1ft+k05gls5bLh
         nXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710343777; x=1710948577;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tvt8Qtm+W+Qck4IJaiB7iim8R4TtzqabulZr702KWPU=;
        b=FHnZiSjIfJqip37wBDztD5zUxiwwOGxIW/6nrgr1rD6t55mCen+ev/fj+DS4H2bXV7
         lv8bYxglIUd5/n3vmpUvYGsZU0BOdmomtzs3caHoK5uyWhBX67OQNASDgDVrnKbJWKzV
         uWbUXWNHO2GHM3B8ozGYoKhEcEpNm4bS1xcsZYeIHc47C3ScEYI+1rLHcGtUcHgcS2MD
         o/vuaY1x+BFw57+zpqdqULTfWGtRKXvHxy39c63uLUkvqaUZL+Z+ic1goj7N/jyGdlg5
         wUzokUDVz5VAr9J8LZTk1gbDufJU+uGqfrHvLbN4nZxqXDGoqtcuMBD3K9iZ/O7z1Yw5
         m+RA==
X-Forwarded-Encrypted: i=1; AJvYcCU51+RyDzg8mDqLMmX3jB/SDZM/T36h0CnbUElGgiI8dnLXRPvGA29QThuwowXjHfxrTte1TOZn1BMEriGtwIY3Ch/RrAYWZYV6mmhVOe33
X-Gm-Message-State: AOJu0YzPhGWktWpb2lks0fbSPR0SvMThKlF90zRbGd0KdfFYcWUCZxGt
	f8My/3txlf2tPjDxsYHRRC4PcRPbQmO913rSU8jbjDHL3b+S/Xu2L8MHuZKSC5w=
X-Google-Smtp-Source: AGHT+IEEiVfKvNxscpnVHMHh0ahECnASeCS3XrSK48Rwfx2u07RKlZ51HTb0HbzQXu+wFEvnKf6Q5Q==
X-Received: by 2002:adf:f242:0:b0:33e:7564:ceb with SMTP id b2-20020adff242000000b0033e75640cebmr2133308wrp.52.1710343777378;
        Wed, 13 Mar 2024 08:29:37 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id z2-20020a5d6402000000b0033dedd63382sm11866029wru.101.2024.03.13.08.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 08:29:37 -0700 (PDT)
Message-ID: <d68fd8a7-8889-472e-86db-b62855eebfba@linaro.org>
Date: Wed, 13 Mar 2024 16:29:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/timer-sun4i: Partially convert to a
 platform driver
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Anup Patel <apatel@ventanamicro.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240312192519.1602493-1-samuel.holland@sifive.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240312192519.1602493-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_082939_218500_0E3DE2D0 
X-CRM114-Status: GOOD (  11.12  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTIvMDMvMjAyNCAyMDoyNSwgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4gQ29tbWl0IDhlYzk5
YjAzMzE0NyAoImlycWNoaXAvc2lmaXZlLXBsaWM6IENvbnZlcnQgUExJQyBkcml2ZXIgaW50byBh
Cj4gcGxhdGZvcm0gZHJpdmVyIikgYnJva2UgdGhlIE1NSU8gdGltZXIgb24gdGhlIEFsbHdpbm5l
ciBEMSBTb0MgYmVjYXVzZQo+IHRoZSBJUlEgZG9tYWluIGlzIG5vIGxvbmdlciBhdmFpbGFibGUg
d2hlbiB0aW1lcl9wcm9iZSgpIGlzIGNhbGxlZDoKPiAKPiAgICBbICAgIDAuMDAwMDAwXSBpcnE6
IG5vIGlycSBkb21haW4gZm91bmQgZm9yIGludGVycnVwdC1jb250cm9sbGVyQDEwMDAwMDAwICEK
PiAgICBbICAgIDAuMDAwMDAwXSBGYWlsZWQgdG8gbWFwIGludGVycnVwdCBmb3IgL3NvYy90aW1l
ckAyMDUwMDAwCj4gICAgWyAgICAwLjAwMDAwMF0gRmFpbGVkIHRvIGluaXRpYWxpemUgJy9zb2Mv
dGltZXJAMjA1MDAwMCc6IC0yMgo+IAo+IEZpeCB0aGlzIGJ5IHdyYXBwaW5nIHRoZSB0aW1lciBp
bml0aWFsaXphdGlvbiBpbiBhIHBsYXRmb3JtIGRyaXZlci4KPiBidWlsdGluX3BsYXRmb3JtX2Ry
aXZlcl9wcm9iZSgpIG11c3QgYmUgdXNlZCBiZWNhdXNlIHRoZSBkcml2ZXIgdXNlcwo+IHRpbWVy
X29mX2luaXQoKSwgd2hpY2ggaXMgbWFya2VkIGFzIF9faW5pdC4gT25seSBjb252ZXJ0IHRoZSBz
dW44aQo+IHZhcmlhbnRzIG9mIHRoZSBoYXJkd2FyZSwgYmVjYXVzZSBzb21lIG9sZGVyIFNvQ3Mg
c3RpbGwgbmVlZCB0aGUgdGltZXIKPiBwcm9iZWQgZWFybHkgZm9yIHNjaGVkX2Nsb2NrKCkuCj4g
Cj4gRml4ZXM6IDhlYzk5YjAzMzE0NyAoImlycWNoaXAvc2lmaXZlLXBsaWM6IENvbnZlcnQgUExJ
QyBkcml2ZXIgaW50byBhIHBsYXRmb3JtIGRyaXZlciIpCj4gU2lnbmVkLW9mZi1ieTogU2FtdWVs
IEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+CgpXaHkgRVBST0JFX0RFRkVSIGlu
IHRoZXJtYWwtb2YgY2FuIG5vdCBmaXggdGhlIGlzc3VlPwoKSSBtZWFuIGNhbid0IHdlIGNoZWNr
IGlmIG9mX2lycV9nZXRfYnluYW1lKCkgcmV0dXJucyBFUFJPQkVfREVGRVIgYW5kIAp0aGVuIHJl
dHVybiB0aGlzIHZhbHVlPwoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3Jn
IOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8
aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8v
dHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9y
Zy9saW5hcm8tYmxvZy8+IEJsb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
