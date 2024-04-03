Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2354ECD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 17:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gd2iMnZfNzFCm+BnQ1hWTMVsdcV+Ot9dRWe6dlYuBeo=; b=Amx8Iz8RRbnLM8
	Ulrr7stPmUpcMCHXn0NikE6L++7XlhX4d/mkexQp9Mn64Av2Jx27svYyNTZbkeY35ZoberVSmvdYJ
	RcB+3Lfqc4zy6Cj/EaBbKpTeeaAEQs+Dk7lQlZkgC8SGqdq8FJISuEn5938zpRauvrJ8sMrLd4W1s
	FkdfPot94o3mjo/yaVJgB7jY4lgohNwhP1tJO1QX/6ZUnWOo5aaU9iviT+CscrAFnBy9iGi727LXJ
	xtGQjtqrphSB8bTReZ7MnfYTKZICdwvt/aF0QQ/EtjxURClnySohdF6wbwf0S5UXKiaV7I2KKHKO3
	mW3sKpKd6tAcEDfNnGNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs4Ge-0000000H9QL-2sHu;
	Wed, 03 Apr 2024 17:19:20 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs4Gb-0000000H9OV-1PfC
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 17:19:18 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-369f3082524so100735ab.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 10:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1712164756; x=1712769556; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Z7t0uImy7n5WDw0eNkAk8ksvRGRviUSYCwUauyh+YE=;
        b=fXoJqjMfBzG2fxg5Bx2IyDvckJs3tHsTRLX9SIaL1+owCGtP/uubRJOMkB1eJKQsSa
         OGPCC8SU2Cb2DyX6W0yg9+/vV1t/3cPo3y44aP9uPBp+U649tNe/QG8cQequ885ezT3D
         M/qfLJ209kRCR7cOgitUxIO9aN+UkXhFqy3nGFg7uqjeNhVdXJJLOPoOnV0HlhomGMWv
         2TylBfVAy5CeFuhsPdy47VoKvjWCkf1d4KhyrBM77j2QtlwlUoMJZxv1F7DCnObz1S5E
         rjhXg0xDYMtUd/ZTpgKIRiU5pr/j+xyhwLITiMRaXQf8nJyt9AmnwWMM/xeai30MmJXI
         QDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712164756; x=1712769556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Z7t0uImy7n5WDw0eNkAk8ksvRGRviUSYCwUauyh+YE=;
        b=uWyeW1BqV6xxmxKNX9cJuRLwjBFn91peKoT7yrWbmbxFiMg1sY7yXSiISwlHBYjuun
         xKD5VX9wPKZeZsS4HK/XhiMOB5ZwmHqhTvxCPvqDE3lACMFuebpuM8YtmbZrdFUCuX2+
         nNlyR11UqISm538Cg9PbJhzFg2OcuRna+r1JXKpcs5wJGTfctjuHCBWOiSB9RqWDvHVr
         954CpRgwzn8X1hPxHSfuTDtdDgEbKsxuPHt79LjglKMS/9UWwF84HabWcvNciPEC3Va9
         9sYBch2ofISBt6D9CeHJbKMoQq4khsBraNnjbBnie6EWHlcIM//GSfOgX89ecqrdF1j3
         K/Ig==
X-Forwarded-Encrypted: i=1; AJvYcCU/uwB6sHv64RSwuQCKFCk6DXMfcrN055Iw4YyRou/lOpgVCDL+vVzoklIvU6HcV8y+66B0VKKuqxYZspiSTSRV8hnB7+kLAuivHBoz2wrN
X-Gm-Message-State: AOJu0YzCKynBPxDtGqksyN5/VxDyOOpFpwiQRwUGi2zO34yP29qYtvAn
	VAbuFSkxNBB0KQqmrCGcPRaTPRrKy3EODqNaQNm4LzzdTwSwZ1FsNVDAYfkRklGQxQpxwEnbv3U
	p8M/CcmKCBgmaM36bhI/5I6KsaXXj4txMsROOEQ==
X-Google-Smtp-Source: AGHT+IEqVdgnXbdDh9CbZVI24256r9T+FVR5QXVTF8fAn05s0ucQcU9MTtFkNFbC1NNm0uzSG/hflw+wi5+kai0kSMY=
X-Received: by 2002:a05:6e02:12eb:b0:368:96d2:7cdc with SMTP id
 l11-20020a056e0212eb00b0036896d27cdcmr440484iln.10.1712164756522; Wed, 03 Apr
 2024 10:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
 <20240222094006.1030709-2-apatel@ventanamicro.com> <CA+V-a8tGucbJ87hsMQDEgcor5BzDmB_WnRsEn6c9F_HzucWLXQ@mail.gmail.com>
 <CAK9=C2VgiRcQjBEPmZjdcMf221omKS8ntdcenSE7G__4xYcCUA@mail.gmail.com> <CA+V-a8ser=hDmst6+XSeOWaEoOd+iY3Ys6bYBWDa5UYPfT+Pug@mail.gmail.com>
In-Reply-To: <CA+V-a8ser=hDmst6+XSeOWaEoOd+iY3Ys6bYBWDa5UYPfT+Pug@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Apr 2024 22:49:04 +0530
Message-ID: <CAAhSdy32Lxp-8_wQdZ3oc0yKBqJzurrMr7i30XRA6WTyqTbqmA@mail.gmail.com>
Subject: Re: [PATCH v14 01/18] irqchip/sifive-plic: Convert PLIC driver into a
 platform driver
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_101917_408382_88DF7C32 
X-CRM114-Status: GOOD (  23.67  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Marc Zyngier <maz@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Saravana Kannan <saravanak@google.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBBcHIgMywgMjAyNCBhdCA5OjE54oCvUE0gTGFkLCBQcmFiaGFrYXIKPHByYWJoYWth
ci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgQXByIDMsIDIwMjQgYXQgMzox
N+KAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4g
PiBPbiBXZWQsIEFwciAzLCAyMDI0IGF0IDI6MDHigK9QTSBMYWQsIFByYWJoYWthcgo+ID4gPHBy
YWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgQW51cCwKPiA+
ID4KPiA+ID4gT24gVGh1LCBGZWIgMjIsIDIwMjQgYXQgOTo0MeKAr0FNIEFudXAgUGF0ZWwgPGFw
YXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IFRoZSBQTElDIGRy
aXZlciBkb2VzIG5vdCByZXF1aXJlIHZlcnkgZWFybHkgaW5pdGlhbGl6YXRpb24gc28gY29udmVy
dAo+ID4gPiA+IGl0IGludG8gYSBwbGF0Zm9ybSBkcml2ZXIuCj4gPiA+ID4KPiA+ID4gPiBBZnRl
ciBjb252ZXJzaW9uLCB0aGUgUExJQyBkcml2ZXIgaXMgcHJvYmVkIGFmdGVyIENQVXMgYXJlIGJy
b3VnaHQtdXAKPiA+ID4gPiBzbyBzZXR1cCBjcHVocCBzdGF0ZSBhZnRlciBjb250ZXh0IGhhbmRs
ZXIgb2YgYWxsIG9ubGluZSBDUFVzIGFyZQo+ID4gPiA+IGluaXRpYWxpemVkIG90aGVyd2lzZSBQ
TElDIGRyaXZlciBjcmFzaGVzIGZvciBwbGF0Zm9ybXMgd2l0aCBtdWx0aXBsZQo+ID4gPiA+IFBM
SUMgaW5zdGFuY2VzLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8
YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvaXJx
Y2hpcC9pcnEtc2lmaXZlLXBsaWMuYyB8IDEwMSArKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9u
cygtKQo+ID4gPiA+Cj4gPiA+IFRoaXMgcGF0Y2ggc2VlbXMgdG8gaGF2ZSBicm9rZW4gdGhpbmdz
IG9uIFJaL0ZpdmUgU29DLCBhZnRlciByZXZlcnRpbmcKPiA+ID4gdGhpcyBwYXRjaCBJIGdldCB0
byBib290IGl0IGJhY2sgYWdhaW4gb24gdjYuOS1yYzIuIExvb2tzIGxpa2UgdGhlcmUKPiA+ID4g
aXMgc29tZSBwcm9iZSBvcmRlciBpc3N1ZSBhZnRlciBzd2l0Y2hpbmcgdG8gcGxhdGZvcm0gZHJp
dmVyPwo+ID4KPiA+IFllcywgdGhpcyBpcyBtb3N0IGxpa2VseSByZWxhdGVkIHRvIHByb2JlIG9y
ZGVyaW5nIGJhc2VkIG9uIHlvdXIgRFQuCj4gPgo+ID4gQ2FuIHlvdSBzaGFyZSB0aGUgZmFpbGlu
ZyBib290IGxvZyBhbmQgRFQgPwo+Cj4gbm9uIHdvcmtpbmcgY2FzZSwgaHR0cHM6Ly9wYXN0ZS5k
ZWJpYW4ubmV0LzEzMTI5NDcvCj4gYWZ0ZXIgcmV2ZXJ0aW5nLCBodHRwczovL3Bhc3RlLmRlYmlh
bi5uZXQvMTMxMjk0OC8KPiAoYXR0YWNoZWQgaXMgdGhlIERUQikKCk9uZSBwb3RlbnRpYWwgcHJv
YmxlbSBpcyB0aGF0CmRyaXZlcnMvY2xvY2tzb3VyY2UvcmVuZXNhcy1vc3RtLmMgaXMgcHJvYmVk
IGVhcmx5CnVzaW5nIFRJTUVSX09GX0RFQ0xBUkUoKSBidXQgdGhlIHRpbWVyIGludGVycnVwdApp
cyBjb25uZWN0ZWQgdG8gUExJQyB3aGljaCBpcyBwcm9iZWQgbGF0ZSBoZW5jZSB0aGUKdGltZXIg
cHJvYmUgd2lsbCBmYWlsLgoKV2UgaGF2ZSB0d28gcG9zc2libGUgb3B0aW9uczoKMSkgRGlzYWJs
ZSBPU1RNIG5vZGVzCjIpIEltcHJvdmUgdGhlIE9TVE0gZHJpdmVyIHRvIHByb2JlIGxpa2UgYQog
ICAgcmVndWxhciBwbGF0Zm9ybSBkZXZpY2Ugb24gUklTQy1WCgpSZWdhcmRzLApBbnVwCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
