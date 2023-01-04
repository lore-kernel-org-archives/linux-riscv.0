Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E93C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 15:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0EV7otlxHBnJsUgqIHmoQiwYpOeYKFvD8EQCVOKlbfk=; b=pLEgZBrD89PCLO
	838DfeK4+s3Xy/S7Bud9dAoI3TnKW2zno4cjBhjp1cSeK63R75rgEOVtxTHjiDgEAOeblUp467BBs
	ESoYkSuwQyVHrPbq6qhFZ4mvuZCgE+8/SdZ/XT/63MM+YNBX/rhf8nw6pNpDz5NsTh/LziUYS0/HQ
	Gnuuc/oo6VbooIT6ZG6D9O6R6uh0HRnV8A5MeXZgT3x8P+Cgyh3Mtbu0qMXiGtLVTsqCKnpNLF6xC
	urRJiGzFNVGQzsr4ZDKYLUmuVTpw0dmS4XgQJVDNLlW+HWmXc2FmPP+gELAdgzEuQa0Sjz7/8znTZ
	aKK/XKR59PMwIYQlvSBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5RB-009zNF-7D; Wed, 04 Jan 2023 15:12:17 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD3PV-009Bty-GS
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 13:02:27 +0000
Received: by mail-wm1-x329.google.com with SMTP id ay2-20020a05600c1e0200b003d22e3e796dso26381959wmb.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jan 2023 05:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZKBkOxPQDQxFRbDRNc5obTwTZfsl0xxWawxlciZ/+D0=;
        b=sjq09NCzb36uWSFZVxgDEgzX6qmQDQv73cCt+lyUZ/ebz+BN43wCZZIrUEs0tWg05t
         SxYvHWfxLukshsZAAU0tbRZESqaxipQfiwUfYnpSNtR6Li4N+zqZQRiMFCk5fwCe1zKu
         HYCMC78u1t6Di6Fm7cZ2WNuZc+8qqNuXWwckuGa84VtfmFqmU4ZpnBT+D5qwpofBPSOy
         41cURwMuoOzJe1/nDlERY1fNOTzN1E43tG9KHY3dt3QdoHmQPtfych1bbXEQ3+W672Le
         YPE+szE1cIkVz2QquLhvpvyetpn1NJlDJ/u3kzM8DpCYvlcRjJ44nb8vCbSspkCJ2M2L
         1R+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKBkOxPQDQxFRbDRNc5obTwTZfsl0xxWawxlciZ/+D0=;
        b=XsZLXzvr8i/eYYpSXhUZfFS/mpQ6BbL1YjfTTfvOLaKuu3pnQC8cd30W5FopH6cPcd
         2PO01+sOQ5zkv67HVtop/p42+HXMFzloh1MSVkv063gNtNRGFWDdIuocsnUJXvpRSHN4
         lNeopGBbISCqijXjWs5RZSbO9rzqHgt7wmzOMMq77S03jqw3QBfZUe05jA1WPf5+vIc+
         10ftULrhFc/cQmXPWU9A57BG3SA4XBfnaOWoouXlS/l9Im/DxL0oWIpU7rSzqtw5nMkL
         vbJZXarKyQ9e7hFv2QSSi0s1ohSThDd54KhtYUm2Qi0yzLxaO45Sfftq6ydu5taGkfjJ
         8CaQ==
X-Gm-Message-State: AFqh2koflau03MWmhLgvGTy+4+txlWzyMMnf2K4j2FdMDAU2EPWDKvWG
	vRYkkoGWNSSqVTxHe4iuPIK0qg==
X-Google-Smtp-Source: AMrXdXvP/TQdzrayFXpnotepvxBxHXarJG35uQ6VQhJFhVgYy/brfPMVX4b3MQfbe7eGTIA0YWwUaQ==
X-Received: by 2002:a05:600c:214a:b0:3cf:6910:51d4 with SMTP id v10-20020a05600c214a00b003cf691051d4mr33280628wml.29.1672837339958;
        Wed, 04 Jan 2023 05:02:19 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id q16-20020a05600c46d000b003d1f3e9df3csm55968811wmo.7.2023.01.04.05.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 05:02:19 -0800 (PST)
Message-ID: <9a98300c-e845-60d6-bdf1-12010eae2075@linaro.org>
Date: Wed, 4 Jan 2023 14:02:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 0/3] Improve CLOCK_EVT_FEAT_C3STOP feature setting
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Atish Patra <atishp@atishpatra.org>, Samuel Holland <samuel@sholland.org>,
 Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230103141102.772228-1-apatel@ventanamicro.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230103141102.772228-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_050225_637147_8F26CDCB 
X-CRM114-Status: GOOD (  16.89  )
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

CkhpIEFudXAsCgpzaGFsbCBJIHBpY2sgdGhlIGVudGlyZSBzZXJpZXMgb3IganVzdCB0aGUgYmlu
ZGluZ3MgYW5kIHRoZSBkcml2ZXIgY2hhbmdlcyA/CgoKT24gMDMvMDEvMjAyMyAxNToxMCwgQW51
cCBQYXRlbCB3cm90ZToKPiBUaGlzIHNlcmllcyBpbXByb3ZlcyB0aGUgUklTQy1WIHRpbWVyIGRy
aXZlciB0byBzZXQgQ0xPQ0tfRVZUX0ZFQVRfQzNTVE9QCj4gZmVhdHVyZSBiYXNlZCBvbiBSSVND
LVYgcGxhdGZvcm0gY2FwYWJpbGl0aWVzLgo+IAo+IFRoZXNlIHBhdGNoZXMgY2FuIGFsc28gYmUg
Zm91bmQgaW4gcmlzY3ZfdGltZXJfZHRfaW1wX3Y2IGJyYW5jaCBhdDoKPiBodHRwczovL2dpdGh1
Yi5jb20vYXZwYXRlbC9saW51eC5naXQKPiAKPiBDaGFuZ2VzIHNpbmNlIHY1Ogo+ICAgLSBSZWJh
c2VkIG9uIExpbnV4LTYuMi1yYzIKPiAKPiBDaGFuZ2VzIHNpbmNlIHY0Ogo+ICAgLSBVcGRhdGUg
Y29tbWl0IHRleHQgb2YgUEFUQ0gxIGJhc2VkIG9uIFNhbXVlbCdzIGNvbW1lbnRzCj4gICAtIFJl
bmFtZWQgRFQgcHJvcGVydHkgInJpc2N2LHRpbWVyLWNhbi13YWtlLWNwdSIgdG8KPiAgICAgInJp
c2N2LHRpbWVyLWNhbm5vdC13YWtlLWNwdSIgaW4gUEFUQ0gyIGFuZCBQQVRDSDMKPiAgIC0gVXBk
YXRlZCBkZXNjcmlwdGlvbiBvZiBEVCBwcm9wZXJ0eSAicmlzY3YsdGltZXItY2Fubm90LXdha2Ut
Y3B1Igo+ICAgICBpbiBQQVRDSDIKPiAKPiBDaGFuZ2VzIHNpbmNlIHYzOgo+ICAgLSBSZWJhc2Vk
IG9uIExpbnV4LTYuMS1yYzcKPiAgIC0gUmVwbGFjZWQgUEFUQ0gxIHdpdGggYSBwYXRjaCB0byBp
bml0aWFsaXplIGJyb2FkY2FzdCB0aW1lcgo+IAo+IENoYW5nZXMgc2luY2UgdjI6Cj4gICAtIElu
Y2x1ZGUgQ29ub3IncyByZXZlcnQgcGF0Y2ggYXMgdGhlIGZpcnN0IHBhdGNoIGFuZCByZWJhc2Vk
IG90aGVyIHBhdGNoZXMKPiAgIC0gVXBkYXRlIFBBVENIMiB0byBkb2N1bWVudCBiaW5kaW5ncyBm
b3Igc2VwYXJhdGUgUklTQy1WIHRpbWVyIERUIG5vZGUKPiAgIC0gVXBkYXRlIFBBVENIMyBiYXNl
ZCBvbiBSSVNDLVYgdGltZXIgRFQgbm9kZSBiaW5kaW5ncwo+IAo+IENoYW5nZXMgc2luY2UgdjE6
Cj4gICAtIFJlYmFzZWQgb24gTGludXgtNS4xOS1yYzgKPiAgIC0gUmVuYW1lZCAicmlzY3YsYWx3
YXlzLW9uIiBEVCBwcm9wZXJ0eSB0byAicmlzY3YsdGltZXItY2FuLXdha2UtY3B1Igo+IAo+IEFu
dXAgUGF0ZWwgKDIpOgo+ICAgIGR0LWJpbmRpbmdzOiB0aW1lcjogQWRkIGJpbmRpbmdzIGZvciB0
aGUgUklTQy1WIHRpbWVyIGRldmljZQo+ICAgIGNsb2Nrc291cmNlOiB0aW1lci1yaXNjdjogU2V0
IENMT0NLX0VWVF9GRUFUX0MzU1RPUCBiYXNlZCBvbiBEVAo+IAo+IENvbm9yIERvb2xleSAoMSk6
Cj4gICAgUklTQy1WOiB0aW1lOiBpbml0aWFsaXplIGhydGltZXIgYmFzZWQgYnJvYWRjYXN0IGNs
b2NrIGV2ZW50IGRldmljZQo+IAo+ICAgLi4uL2JpbmRpbmdzL3RpbWVyL3Jpc2N2LHRpbWVyLnlh
bWwgICAgICAgICAgIHwgNTIgKysrKysrKysrKysrKysrKysrKwo+ICAgYXJjaC9yaXNjdi9rZXJu
ZWwvdGltZS5jICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKysKPiAgIGRyaXZlcnMvY2xvY2tz
b3VyY2UvdGltZXItcmlzY3YuYyAgICAgICAgICAgICB8IDEwICsrKysKPiAgIDMgZmlsZXMgY2hh
bmdlZCwgNjUgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9yaXNjdix0aW1lci55YW1sCj4gCgotLSAKPGh0
dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJl
IGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9w
YWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+
IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
