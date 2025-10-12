Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CF2CCD187
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Oct 2025 15:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/r1qQkU/Uem7Eb5pX0ntnldysz6shh/BDk8sSpJ5PnE=; b=E88yfKWV51oP7F
	AYiM2SNWpFu7aglf+tMM+xM4pNVzs1HVm3YftAfohBN0hqO5H3n015kFW57IaEr/SWM2I4llefxJG
	UMVKLFGJ2PN4W9HFMTENWEVztfvP7OKdkQjWuxEFQwvwK5EjH6hcl6hTD9z1IE8W6GmQiueQNry5s
	i6Tf3JXALYCfCmtKlYxn2QW+MR5PYpYY19kPt6gj4y5sy7eIhLiVn8dPTCdj7uUnp04BTnhHpooN0
	sH0fEc2OaCp7f8gOCzDfPWq3mtQ4ByeCr/MpG/lxhSWbypoPQLLhwu2C8WKI2wViSX/eU0NPc4E9A
	tmdQHdcvKhEjZaXE5BMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7yM5-0000000BVjL-0bpu;
	Sun, 12 Oct 2025 15:51:29 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7yM2-0000000BViw-2zog
	for linux-riscv@lists.infradead.org;
	Sun, 12 Oct 2025 15:51:28 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-579d7104c37so4230274e87.3
        for <linux-riscv@lists.infradead.org>; Sun, 12 Oct 2025 08:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760284284; x=1760889084; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/t12InzFvAri1mWk/q7HQ1pr3AqTtuxv6ASYMC0LIYA=;
        b=ikYKW32DiY0futZo18gHMdAptGN+rKkn7tSAFR3rwoiTnJGsSsTOh82X8/cPtaugok
         M2Sjgc17XbPUiLMXg9dAKP8uJGqjZLlwGGhy101tW9SWCbDftmVoYXIZ2DRcXLuaMYNv
         ec7rysmaRWbeIr17s6qfvGzeRcsktaypztV1OxtYLlOwBHq8C4Wi+xPojekYkYqFvNnh
         mhgrBkFiTq0ylD0jPqhuIc+tu9wjwBxXDbAB0fGJwl+nGxoVoJyCYyYvDkATA8b9auos
         JATEAtvKLgp+awKiLCqvuxVpvMPdVz9/Ss195pV6fbCopVUmeOqtjZVaSp7GJOOoh70c
         egHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760284284; x=1760889084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/t12InzFvAri1mWk/q7HQ1pr3AqTtuxv6ASYMC0LIYA=;
        b=GFF48qKrCXM/y2ZiYMpAYqb5EyEcWcp0PszQI0tQoc1rNvdqEu+TVyKD7ezjAU9RYv
         SJLgGkaBIA0jyJ5ITCivfdywzfXewid5GbzFJSJzIRwzcSYKY/JvSfF8pxxEAJnW5Ang
         PKlUEKoyaYPfPvx6TEc9AAC0zdRMv+XDFGOcYeLfcOWPsYzQTs4UdRwPgV8+kWMSpLsO
         98O3gCt/Y9lXP0Pe+3AK6ylSwenzjWkXhaDVjhSM6h+0KaHQW8dKG3vwNrXfPn1x6KIP
         jhU+HB9Hb322XyVytI5VV3BG9PKnq9FiPEq7nmavsWjH/VkH8DWC1/gB43ebn8E3617m
         lRUg==
X-Forwarded-Encrypted: i=1; AJvYcCXg2Z3rj4ffAD/9RLyNmW5J2hg6hMCMHCuMZNdbBaRibD2ftwnwImruJ+u7N5PSBdVLrn31YprWSk552A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwduLWu5mOgTmNQK3O14TjVftB8pq6cLdDD0sewRhHLY+8n+u78
	vHnkqZUkZ358ni1u2F2+Hbk0md7DPw3VIokBiDKRjpOH2tACVaZ2heSp6+yQiVKqpFdIh+R0Rjz
	yQYT234xOwTSdhMb52xbAFFu4uhbrVU+QJA4mye7pMQ==
X-Gm-Gg: ASbGncsdRRMvoz+31mhn1oWFJ9sH7T1+odEaC6M9WWWS4ggq859ldsu8baO+/pkj5zj
	OyNvi4eynpt7OPORg/TgqwsE6r915XMxbcaseisBPT4RZVtrrYIOSHrRa67a+h5iW5+mXlk76/7
	w3PnqJzhcfFECcWWAhc5291nho4yonWuYpuOueU3tN4kom6S8L7B0u4t8BtEI3RPX0oXfr1WZMQ
	emK2WPipDTulLEM76rSKspolbesCaZ8kdJqrw==
X-Google-Smtp-Source: AGHT+IHibYYuMSAztSRYVgUsb7X+Eeohn+xQDvNzScwzoKe55a/3OjktCD8Y4WeUbjtoNTbPEq8EMqctoNpd55hvnds=
X-Received: by 2002:a05:6512:1110:b0:590:656c:d114 with SMTP id
 2adb3069b0e04-5906dae5d1bmr5127553e87.46.1760284284098; Sun, 12 Oct 2025
 08:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20251011155746.1558731-1-guoren@kernel.org>
In-Reply-To: <20251011155746.1558731-1-guoren@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 12 Oct 2025 21:21:11 +0530
X-Gm-Features: AS18NWAU0Fdjt2JtdTXJfp-1L5hMarIkG0mDEynGAB1I_qGvGN2Q6vemT_nxpO4
Message-ID: <CAK9=C2UrYg+sHsDqkmz7f7KnaREU7hXF4rbON002cnAti_pDXg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add pgprot_dmacoherent definition
To: guoren@kernel.org
Cc: samuel.holland@sifive.com, david@redhat.com, yongxuan.wang@sifive.com, 
	cuiyunhui@bytedance.com, luxu.kernel@bytedance.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, palmer@dabbelt.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_085126_774193_8F0B7E4B 
X-CRM114-Status: GOOD (  18.09  )
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

T24gU2F0LCBPY3QgMTEsIDIwMjUgYXQgOToyOOKAr1BNIDxndW9yZW5Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4KPiBGcm9tOiAiR3VvIFJlbiAoQWxpYmFiYSBEQU1PIEFjYWRlbXkpIiA8Z3VvcmVuQGtl
cm5lbC5vcmc+Cj4KPiBSSVNDLVYgU3ZwYm10IFN0YW5kYXJkIEV4dGVuc2lvbiBmb3IgUGFnZS1C
YXNlZCBNZW1vcnkgVHlwZXMKPiBkZWZpbmVzIHRocmVlIG1vZGVzOgo+Cj4gIE1vZGUgfCBWYWx1
ZSB8IFJlcXVlc3RlZCBNZW1vcnkgQXR0cmlidXRlcwo+ICBQTUEgIHwgICAwICAgfCBOb25lCj4g
IE5DICAgfCAgIDEgICB8IE5vbi1jYWNoZWFibGUsIGlkZW1wb3RlbnQsIHdlYWtseS1vcmRlcmVk
IChSVldNTyksCj4gICAgICAgfCAgICAgICB8IG1haW4gbWVtb3J5Cj4gIElPICAgfCAgIDIgICB8
IE5vbi1jYWNoZWFibGUsIG5vbi1pZGVtcG90ZW50LCBzdHJvbmdseS1vcmRlcmVkCj4gICAgICAg
fCAgICAgICB8IChJL08gb3JkZXJpbmcpLCBJL08KPgo+IFRoZSBwZ3Byb3RfZG1hY29oZXJlbnQg
ZGVmYXVsdCB1c2VzIHRoZSBJTyBtZW1vcnkgYXR0cmlidXRlIGlmIHRoZXJlCj4gaXMgbm8gYXNt
IGRlZmluaXRpb24sIGJ1dCBJTyBpcyBub3QgZm9yIG1haW4gbWVtb3J5IGFjY29yZGluZyB0bwo+
IFN2cGJtdCBydWxlcy4KPgo+IFRoaXMgY29tbWl0IGNvcnJlY3RzIHBncHJvdF9kbWFjb2hlcmVu
dCB3aXRoIHRoZSBOQyBtZW1vcnkgYXR0cmlidXRlLAo+IHdoaWNoIHNhdGlzZmllcyBwZXJmb3Jt
YW5jZSBpbXByb3ZlbWVudCBhbmQgcHJldmVudHMgdXNpbmcgdGhlIElPCj4gYXR0cmlidXRlIHRv
IGFjY2VzcyBtYWluIG1lbW9yeS4KPgo+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gKEFsaWJhYmEg
REFNTyBBY2FkZW15KSA8Z3VvcmVuQGtlcm5lbC5vcmc+CgpJIGhhZCBzZW50IHRoZSBzYW1lIHBh
dGNoIG9uIEF1ZyAyMCBhbmQgeW91IGhhZCBwcm92aWRlZApUZXN0ZWQtYnkgdG8gdGhhdCBwYXRj
aC4KCklmIHlvdSBoYWQgY29uY2VybnMgd2l0aCBteSBwYXRjaCB0aGVuIHlvdSBjb3VsZCBoYXZl
IHByb3ZpZGVkCmNvbW1lbnRzIGJ1dCB5b3UgY2hvb3NlIHRvIGhpamFjayBpdCBhbmQgY2hhbmdl
IGF1dGhvcnNoaXAuCgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3BndGFibGUuaCB8IDkgKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gaW5kZXggMjllOTk0YTlhZmI2Li4y
YTg0NDc5ZGU4MWIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxl
LmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+IEBAIC02NTQsNiAr
NjU0LDE1IEBAIHN0YXRpYyBpbmxpbmUgcGdwcm90X3QgcGdwcm90X3dyaXRlY29tYmluZShwZ3By
b3RfdCBfcHJvdCkKPiAgICAgICAgIHJldHVybiBfX3BncHJvdChwcm90KTsKPiAgfQo+Cj4gKy8q
Cj4gKyAqIERNQSBhbGxvY2F0aW9ucyBmb3Igbm9uLWNvaGVyZW50IGRldmljZXMgdXNlIHdoYXQg
dGhlIFJJU0MtViBhcmNoaXRlY3R1cmUKPiArICogY2FsbCAiTm9uLUNhY2hlYWJsZSIgbWVtb3J5
IGF0dHJpYnV0ZSwgd2hpY2ggcGVybWl0cyBpZGVtcG90ZW50LCB3ZWFrbHktb3JkZXJlZAo+ICsg
KiAoUlZXTU8pLCBtYWluIG1lbW9yeS4gVGhpcyBpcyBkaWZmZXJlbnQgZnJvbSAiSS9PIiBtZW1v
cnkgYXR0cmlidXRlIHdoaWNoIGlzCj4gKyAqIGludGVuZGVkIGZvciBNTUlPIGFjY2VzcyB3aXRo
IE5vbi1jYWNoZWFibGUsIG5vbi1pZGVtcG90ZW50LCBzdHJvbmdseS1vcmRlcmVkCj4gKyAqIChJ
L08gb3JkZXJpbmcpLCBJL08gYXR0cmlidXRlcy4KPiArICovCj4gKyNkZWZpbmUgcGdwcm90X2Rt
YWNvaGVyZW50IHBncHJvdF93cml0ZWNvbWJpbmUKPiArCj4gIC8qCj4gICAqIEJvdGggU3ZhZGUg
YW5kIFN2YWR1IGNvbnRyb2wgdGhlIGhhcmR3YXJlIGJlaGF2aW9yIHdoZW4gdGhlIFBURSBBL0Qg
Yml0cyBuZWVkIHRvIGJlIHNldC4gQnkKPiAgICogZGVmYXVsdCB0aGUgTS1tb2RlIGZpcm13YXJl
IGVuYWJsZXMgdGhlIGhhcmR3YXJlIHVwZGF0aW5nIHNjaGVtZSB3aGVuIG9ubHkgU3ZhZHUgaXMg
cHJlc2VudCBpbgo+IC0tCj4gMi40MC4xCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
