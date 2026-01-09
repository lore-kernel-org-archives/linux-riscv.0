Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4136D1A605
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 12:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0hQIUUyzpKHjxgzdFam7MPuULa4NKDUwDAX/bJBeiC4=; b=1axAhDm1c3sWrd
	ctyoyyKNJY7bM+H8tWVLIBk/RGZWamlpjtzkKf88Df3kGICimUTyakVzrnX/YlSE5tYoevQBvPDuz
	VvDL3u9LGTYu7S9MS5/+EnE2IKQyG4d1sYzSIqC5E51E+8KTycK2k6NYQFngghGUMM+ypOPt91JY0
	+OkU06s0BPbtOvwq6KSpiT6XUaGbgpeYytKmdENMawcJBjUjny7UbbcOpXddpvQZCugWbzqFTSvvz
	khxhZmwMfNaxCoH49hrteehvufEmYH1uHXjmHKuOQviWNTv5v1S6y7EW/39qYhV/ZCFDFFyQh1C9d
	4lzCEVBdadmYPLFcu8kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veBTo-00000002IiA-0MTf;
	Fri, 09 Jan 2026 12:20:36 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veBTk-00000002Ihn-2oJ7
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 12:20:34 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-644715aad1aso3646624d50.0
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 04:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767961231; x=1768566031; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukh2GBiqrpSOrFovoNwBAt/J/QmgBGkcNbLsTOHoYIQ=;
        b=cJbBxLMdgqW81p5qKMRfb8xBN320y7y4NuyCwwFMA/AdAqZ/2rv8h79CnN8oARp6cz
         5MfkumFXtWchLi8Twy7pt8GZxnhdw7EMuICzc5FlQtLLpccMDFQTMg6pnOkxYglJmvGK
         K6nJx4JySzbebeHIrv1weWP5PXXyqhfDHuC6Em00HLZA3C9QAlY3XA887xRwRaZEVoN+
         ZcIyX5MetqTpQgdl1Btdmv8zRe17ci2BgbYnEln6htlOzbcGudazYN9x/3CxffwOpFtX
         mClNxrbIC6j+ZnWsMngSHqXlHcfu47/ch5rb0brTJnMGZosJu0vwMLIMZCTMrpiO/5WG
         l4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767961231; x=1768566031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ukh2GBiqrpSOrFovoNwBAt/J/QmgBGkcNbLsTOHoYIQ=;
        b=gc8DVFxzKAZFohCcqTX8gnsIafm+kYvbb0Jasj33awLT1HeFTIlo66NlfF8969EF+h
         pOTZdDyeBqCEuot3xTKbn2u9ag5qNXPZQWfhxEXvbWq1m31uoof5hOuikr2MygCLooNn
         c6qza6GcEHPr1LLrPFO+QvssBFGABvMoKvbCO2eHI1C1697qPMnKriJdM66XEbza3hh2
         Dc6R0y3xNsfGfXU7vvJt3kcHysAW4HsLZEg85UPnC+jSR9SsAh5sDQC7DyeHMg/Y4V0+
         Uu4MNTozTE+1xcJZ7NRlT8WdX1j/eEypGRuOL3cLbIhMc/Srno62ABLcEs9zqzDoE49+
         2tPA==
X-Forwarded-Encrypted: i=1; AJvYcCV0xbhsQG/SxpvrXimyL3AiYU33YY4O4vRRSo2hYzbcfrJGDL9ui1jf8u1HFRvRTnDssX+JWkGQlSgjJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWj8T5CtBjRknQ5juSkrT/5cNGU+hvKzaFLdOapzqLWGVfr4bS
	U/gK51ewSdqs3fBgHXqpCX5aQP/Q6AZBX4QT7mklK+hjtphlu9aCf3SwBf2dZ5JopIhkM4bPoke
	dTAhQgUh4OLPvPOTI9489GPT7yQ1Dw4JFN6I3bCRmvQ==
X-Gm-Gg: AY/fxX7wgFfCz2qCksP50lHskc186IJFhX2pkQSqsZPkNkslewjGJK6XVES8ch5Gh3L
	RfS+f6qmBffcGTGm0bEPyfnJdBGk/FqdcRwPqIVZV3xfQQ4Pr36sGgFLFBCzWOpC1wG79lEVPMl
	9i+Jle2sDNDYFs0Fyy4dc4FLB52xXlKF4regTVEIPlsc7ByNkVXCjwXJkOnEZ3I9msTfPXn/5d8
	E2Bu+Af6JQoobmBdcxX3MimHbu57BO9qITRgYoB2UNDIrkivT+m6PlnbHhJQQrvmMVcPI/+dUi/
	3sT291JqXQONB34TsHuTQpdMamdDRHMZPlY0Sg2tcy8=
X-Google-Smtp-Source: AGHT+IEhMWcvDM1SrRQXH+l+w0IiP0cunz8wXS9r5P4Z+auaz2lvzOyrhy9URS2jkNUL58e6LoB0ZIxYLGgtVQF/jg4=
X-Received: by 2002:a05:690e:4008:b0:645:527b:bc25 with SMTP id
 956f58d0204a3-6470d316484mr11391255d50.43.1767961231358; Fri, 09 Jan 2026
 04:20:31 -0800 (PST)
MIME-Version: 1.0
References: <20260102-02-k3-pinctrl-v3-0-30aa104e2847@gentoo.org> <20260102-02-k3-pinctrl-v3-2-30aa104e2847@gentoo.org>
In-Reply-To: <20260102-02-k3-pinctrl-v3-2-30aa104e2847@gentoo.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 9 Jan 2026 20:20:19 +0800
X-Gm-Features: AQt7F2pX-qHrvIy9ewuvaqm_6fzKWfdXRjphTDvJYELxE1h4Qxa4FZfMO-nJbgI
Message-ID: <CAH1PCMaXW4469pFRGC+HcixO7PGLQpKKJ_Z5VEhHUMdd3DNWTg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: pinctrl: spacemit: add K3 SoC support
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_042032_997854_95E92C21 
X-CRM114-Status: GOOD (  13.64  )
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

SGksIFlpeHVuCgpPbiBGcmksIEphbiAyLCAyMDI2IGF0IDM6MDTigK9QTSBZaXh1biBMYW4gPGRs
YW5AZ2VudG9vLm9yZz4gd3JvdGU6Cj4KPiBBZGQgbmV3IGNvbXBhdGlibGUgc3RyaW5nIGZvciBT
cGFjZW1pVCBLMyBTb0MsIHRoZSBwaW5jdHJsIElQIHNoYXJlcwo+IGFsbW9zdCBzYW1lIGxvZ2lj
IHdpdGggcHJldmlvdXMgSzEgZ2VuZXJhdGlvbiwgYnV0IGhhcyBkaWZmZXJlbnQgcmVnaXN0ZXIK
PiBvZmZzZXQgYW5kIHBpbiBjb25maWd1cmF0aW9uLCBmb3IgZXhhbXBsZSB0aGUgZHJpdmUgc3Ry
ZW5ndGggYW5kCj4gc2NobWl0dGVyIHRyaWdnZXIgc2V0dGluZ3MgaGFzIGJlZW4gY2hhbmdlZC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFlpeHVuIExhbiA8ZGxhbkBnZW50b28ub3JnPgo+IC0tLQo+ICAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3NwYWNlbWl0LGsxLXBpbmN0cmwueWFtbCAg
ICAgICB8IDEwICsrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9waW5jdHJsL3NwYWNlbWl0LGsxLXBpbmN0cmwueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3NwYWNlbWl0LGsxLXBpbmN0cmwueWFtbAo+IGlu
ZGV4IDYwOWQ3ZGI5NzgyMi4uOWE3NmNmZmNiYWVlIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3NwYWNlbWl0LGsxLXBpbmN0cmwueWFtbAo+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3NwYWNlbWl0
LGsxLXBpbmN0cmwueWFtbAo+IEBAIC0xMSw3ICsxMSw5IEBAIG1haW50YWluZXJzOgo+Cj4gIHBy
b3BlcnRpZXM6Cj4gICAgY29tcGF0aWJsZToKPiAtICAgIGNvbnN0OiBzcGFjZW1pdCxrMS1waW5j
dHJsCj4gKyAgICBlbnVtOgo+ICsgICAgICAtIHNwYWNlbWl0LGsxLXBpbmN0cmwKPiArICAgICAg
LSBzcGFjZW1pdCxrMy1waW5jdHJsCj4KPiAgICByZWc6Cj4gICAgICBpdGVtczoKPiBAQCAtODEs
NiArODMsMTIgQEAgcGF0dGVyblByb3BlcnRpZXM6Cj4gICAgICAgICAgICAgICAgLSBlbnVtOiBb
IDcsIDEwLCAxMywgMTYsIDE5LCAyMywgMjYsIDI5IF0KPiAgICAgICAgICAgICAgICAgIGRlc2Ny
aXB0aW9uOiBGb3IgSzEgU29DLCAzLjNWIHZvbHRhZ2Ugb3V0cHV0Cj4KPiArICAgICAgICAgICAg
ICAtIGVudW06IFsgMiwgNCwgNiwgNywgOSwgMTEsIDEzLCAxNCwgMjEsIDIzLCAyNSwgMjYsIDI4
LCAzMCwgMzEsIDMzIF0KPiArICAgICAgICAgICAgICAgIGRlc2NyaXB0aW9uOiBGb3IgSzMgU29D
LCAxLjhWIHZvbHRhZ2Ugb3V0cHV0Cj4gKwo+ICsgICAgICAgICAgICAgIC0gZW51bTogWyAzLCA1
LCA3LCA5LCAxMSwgMTMsIDE1LCAxNywgMjUsIDI3LCAyOSwgMzEsIDMzLCAzNSwgMzcsIDM4IF0K
PiArICAgICAgICAgICAgICAgIGRlc2NyaXB0aW9uOiBGb3IgSzMgU29DLCAxLjhWIHZvbHRhZ2Ug
b3V0cHV0CgpTaG91bGQgb25lIG9mIHRoZXNlIGJlIDMuM1Y/IEJvdGggZGVzY3JpcHRpb25zIGN1
cnJlbnRseSBzcGVjaWZ5IDEuOFYuCgpCZXN0IHJlZ2FyZHMsCkd1b2RvbmcgWHUKCj4gKwo+ICAg
ICAgICAgICAgaW5wdXQtc2NobWl0dDoKPiAgICAgICAgICAgICAgZGVzY3JpcHRpb246IHwKPiAg
ICAgICAgICAgICAgICB0eXBpY2FsIHRocmVzaG9sZCBmb3Igc2NobWl0dCB0cmlnZ2VyLgo+Cj4g
LS0KPiAyLjUyLjAKPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
