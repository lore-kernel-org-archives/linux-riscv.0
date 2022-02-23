Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D1FC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 09:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mW8fuA0EKk/kUlErrEam5IITXdiGtT1E4QphPv85NEg=; b=LsOxacHvtXEVLB
	s6QXirF10Mu4AA1As32wqJuyXY5hVxPn8t86Bd5wL1ptQ9zTidVxLbciMjSF80xkG4SePgP8THbi4
	99D9LSK1tyvWSn2E6r9ltE4a0WhtcYEUAtWjNJ9JBzDnGfp/DelW/NaXyzZzguZ7ZMGqGn4WoZTBi
	BPEI8jQGsq7xp+F/ER4T7VwL304jiua2vPsNDxAotSgTgE6+lHYT5sSLWRn9AnQkZxMB6UTRHgDXj
	ebelY6QK1vKh8V8jWo47B8/YVjrN8yDHj97QqHzTzOwt93QMSwpsBCYsdqMUgW8rDmPBxAset7Yju
	s3csygy5GMe8xsR4sx2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMne6-00DQms-MQ; Wed, 23 Feb 2022 09:09:14 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMne3-00DQlM-A9
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 09:09:12 +0000
Received: by mail-wr1-x42a.google.com with SMTP id v21so3157784wrv.5
 for <linux-riscv@lists.infradead.org>; Wed, 23 Feb 2022 01:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=uhQ2XTHzgwwh3IfSpyyiABP4apEdC3n0uRKIA365nw8=;
 b=yX7IDc6xgr2DIKYR1fbQdrsvoUEjEPM1JMICqwirtbbhG6Kkujf20LxovE/4LyHp86
 WRTevNNne+t4clDGmaDCAoCdMUC/M3I8wEtIhi1huBATspu/YvOfPPGXKES+9IlrA65w
 EXoVM6ESTjP9rO5vMWBYxQCFnWTAruvdxZNUDQFmuPR8eRcRdAQK2GehMRaXRZvx8lHL
 X7scUpwu7mdXWM8MWFPjsjQB5ji6ERhWdJFnQOMjEa0/CW6aB/A8Z+0X/UK+apIoPao5
 sfMnODhvNAUrgOqsX08SWAqSFTPhm3wk6PxcYF5Xl9lSSE2zpYYEzi6qZd0hSRnIBSjm
 6oaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uhQ2XTHzgwwh3IfSpyyiABP4apEdC3n0uRKIA365nw8=;
 b=wFxUPTRHbsxFlFEvPIBJzUxuh8Fs3SQDyJXajp22iN5ecOh5kMq2cBdngrESB8HAsS
 362TUARPoGU2xG05gQwYnPY/ytH315XNBq/EhjuVdqGhj+y7BIiw7dnFlDaszk94Q4wS
 k9d8WsStLypxve/C7IuKxounCwIJbA8Gjho4nhr+vFFAHc9DjSGnvxN0uN951BIi5l1M
 vqOFd51jghQXiRZG1hbWOJA60uZbdWyW37dxyoSq9AmJoEurW8aC7yGA5Dwzo97kPQ0l
 YQgq37XypBdSezfuLC1O2xwOw8w2PmPA11ewZ8zIO5mLuMeEYujAp0uxKTUqPpC7WXdH
 AvBQ==
X-Gm-Message-State: AOAM530XTJBNFOMrlSj5OeeGihR9hepS3/IwidyNP0KKxm1aFtwUfk3G
 vJ6V3OIqy22bySVNzRKohKoLg+xr0WxFqw==
X-Google-Smtp-Source: ABdhPJz4aTObHNoB5pQsllecyuXgnwlJz4HBUpJXFkjadBwKL0W5K/YET+9QFNOJiVbsLvUssTBxUA==
X-Received: by 2002:a5d:4b4c:0:b0:1dc:f34a:548 with SMTP id
 w12-20020a5d4b4c000000b001dcf34a0548mr22346654wrs.554.1645607349429; 
 Wed, 23 Feb 2022 01:09:09 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 x2-20020a7bc762000000b00380fd1ba4ebsm526819wmk.9.2022.02.23.01.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 01:09:08 -0800 (PST)
Date: Wed, 23 Feb 2022 09:09:06 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 conor.dooley@microchip.com, linus.walleij@linaro.org, brgl@bgdev.pl,
 robh+dt@kernel.org, jassisinghbrar@gmail.com,
 thierry.reding@gmail.com, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, geert@linux-m68k.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org,
 lewis.hanly@microchip.com, daire.mcnamara@microchip.com,
 ivan.griffin@microchip.com, atishp@rivosinc.com,
 Rob Herring <robh@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v7 05/11] dt-bindings: pwm: add microchip corepwm binding
Message-ID: <YhX5suBeOgHKqcVa@google.com>
References: <20220214135840.168236-1-conor.dooley@microchip.com>
 <20220214135840.168236-6-conor.dooley@microchip.com>
 <20220223062018.nbgidqxgh2soz625@pengutronix.de>
 <65edc257-82ec-e100-7a44-5c510aba51ce@canonical.com>
 <20220223082018.degrftmxpk5uc6xn@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220223082018.degrftmxpk5uc6xn@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_010911_384477_4FF222B6 
X-CRM114-Status: GOOD (  20.57  )
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

T24gV2VkLCAyMyBGZWIgMjAyMiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cgo+IE9uIFdlZCwg
RmViIDIzLCAyMDIyIGF0IDA4OjEyOjQ5QU0gKzAxMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3Jv
dGU6Cj4gPiBPbiAyMy8wMi8yMDIyIDA3OjIwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiA+
ID4gT24gTW9uLCBGZWIgMTQsIDIwMjIgYXQgMDE6NTg6MzVQTSArMDAwMCwgY29ub3IuZG9vbGV5
QG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4gPiA+PiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPgo+ID4gPj4KPiA+ID4+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5n
cyBmb3IgdGhlIE1pY3JvY2hpcCBmcGdhIGZhYnJpYyBiYXNlZCAiY29yZSIgUFdNCj4gPiA+PiBj
b250cm9sbGVyLgo+ID4gPj4KPiA+ID4+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPgo+ID4gPj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4KPiA+ID4+IEFja2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QHJpdm9zaW5jLmNvbT4KPiA+ID4gCj4gPiA+IEkgbGlrZSBpdDoKPiA+ID4gCj4gPiA+IEFja2Vk
LWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+
ID4gPiAKPiA+ID4gbml0cGljazogUHV0IHlvdXIgUy1vLWIgbGFzdCBpbiB0aGUgY29tbWl0IGxv
Zy4gKFRoaXMgZG9lc24ndCBqdXN0aWZ5IGEKPiA+ID4gcmVzZW5kIElNSE8pCj4gPiAKPiA+IEl0
IHNob3VsZCBiZSB0aGUgb3Bwb3NpdGUgLSB0aGUgZmlyc3QuIEZpcnN0IGF1dGhvciBzaWducyB0
aGUgcGF0Y2gsCj4gPiB0aGVuIGNvbWVzIHJldmlldyBhbmQgZmluYWxseSBhbiBhY2suIFB1dHRp
bmcgU29CIGF0IHRoZW4gc3VnZ2VzdHMgdGhhdAo+ID4gdGFncyB3ZXJlIGFjY3VtdWxhdGVkIGJl
Zm9yZSBzZW5kaW5nIHBhdGNoLCBvdXQgb2YgbWFpbGluZyBsaXN0Lgo+IAo+IHdlbGwsIG9yIGlu
IGFuIGVhcmxpZXIgcmV2aXNpb24gb2YgdGhpcyBwYXRjaCBhcyBpcyB0aGUgY2FzZSBoZXJlLiBP
bmUKPiBvZiB0aGUgaWRlYXMgb2YgUy1vLWIgaXMgdGhhdCB0aGUgb3JkZXIgc2hvd3MgdGhlIGZs
b3cgb2YgdGhlIHBhdGNoCj4gc3RhdGVzIGFuZCBpZiB0aGlzIHBhdGNoIGVuZHMgaW4gZ2l0IHdp
dGg6Cj4gCj4gCVJlZmVycmVkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IAlT
aW5nZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+
IAlCYWNrZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IAlTaW5n
ZWQtb2ZmLWJ5OiBQZXRlciBNYWludGFpbmVyIDxwbUBleGFtcGxlLmNvbT4KPiAKPiBJJ2QgZXhw
ZWN0IHRoYXQgQmFja2VkLWJ5IHdhcyBhZGRlZCBieSBQZXRlciwgbm90IENvbm9yLgo+IChNb2Rp
ZmllZCB0aGUgdGFncyBvbiBwdXJwb3NlIHRvIG5vdCBpbnRlcmZlcmUgd2l0aCBiNCdzIHRhZyBw
aWNrdXAsIEkKPiBndWVzcyB5b3UgaHVtYW5zIHN0aWxsIGdldCB0aGUgcG9pbnQuKQoKSSB0ZW5k
IHRvIGxpa2UgKi1ieSB0YWdzIHRvIGFwcGVhciBjaHJvbm9sb2dpY2FsbHkuCgogIFN1Z2dlc3Rl
ZCAgICAgICAgICAgICAgKHN1Z2dlc3RlZC1ieSkKICBBdXRob3JlZCAgICAgICAgICAgICAgIChz
aWduZWQtb2ZmLWJ5KQogIENvLUF1dGhvcmVkICAgICAgICAgICAgKHNpZ25lZC1vZmYtYnkvY28t
ZGV2ZWxvcGVkLWJ5KQogIFJldmlld2VkL0Fja2VkL1Rlc3RlZCAgKHJldmlld2VkLWJ5L2Fja2Vk
LWJ5L3Rlc3RlZC1ieSkKICBDb21taXR0ZWQgICAgICAgICAgICAgIChzaWduZWQtb2ZmLWJ5KQoK
LS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpQcmluY2lwYWwgVGVjaG5pY2FsIExlYWQgLSBEZXZl
bG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFy
bSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
