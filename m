Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D29C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 15:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sde5dlo8FqIgYdeNFOVpRzkDak/A7TYQ4F++Wlec7v8=; b=1eEX8PDT/UxbLl
	ItlXJsBs8JYWj7ESX2qobPPdoaTQOpLl67CCPUNqh43LVKfWjPXegLgYVoyFxCiUxv4NLHIBSDKOB
	S8sSeozOgfjFLR4qNGqquHRIB+AYkh7SFwGfFJTuQOG8O5MNOKmjWPxAynpmsyvYf5qMAPhOsIVkn
	9IhVB61vrKOvi4lqrJ0Q6vQfWd/+aKlPl7RmDlxE12BsYZ4bgwxfY3OWTJQhPYk8hMzqColHYCgSG
	L3oyje2bY0X0h85xZlGW2uICKCOW05C18IqDfKbCPPcTl5B8jUc3CaSqlyhab9WMnvsUP3p9IyjE1
	lFxBrvCBee9sAVLSZm4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0kDZ-004A3c-24;
	Wed, 08 Nov 2023 15:11:45 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0kDW-004A2I-1c
	for linux-riscv@lists.infradead.org;
	Wed, 08 Nov 2023 15:11:44 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-507a3af69d8so2205152e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Nov 2023 07:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699456300; x=1700061100; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UUxKSl5xvPnPZc8xesOknmD+ele1gvP9a4k80mJzrYs=;
        b=C+13qItk2zkjtc14hilpgD2c29HDwCYO+g0V7n21U65wfkIQ0YDpBv7D7Spea+jXbs
         D10qxOZA2QZW6WS4ybSlnVoyAwvsaVRdP0sngMgi8lI01rqwfAiqUgL0zay1m6godTgZ
         ZrbqH8E0jycHo+ghquZwjCi0w9jToxfwYqn0BtzYldSo65u6wp1dYZQAZC7ciu+JMtcY
         YOlEkg7vac+8DACIx74mbRkS7k4G2LOiIi6f5RQIFV3N/wdeVi0PPpuTrvx9SSN5heud
         hBMfX8Q1V4/hCJg/26ZErtgL5h+hk3aPwpMsPRcYP1juDOSassaz341N79NjQKGLpOdZ
         K+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699456300; x=1700061100;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UUxKSl5xvPnPZc8xesOknmD+ele1gvP9a4k80mJzrYs=;
        b=LZbseT4CZkhTqrQVLVrAJ2iFHcngoz4hpnMElCyS6nEYrWjLdgBGUtU/YfI3bpnRi+
         KHbWKzrxxGu3HeDgeYKOiX6YIUGh1tNmXU4njj+yTuiRCUvbjTff3KrhRXOs0Ql7Wjea
         /FxKp5cbyqJak1b872wXyd77ZFj6x8hOtJstlE5wUldCJjWY2fPRa0ZyCALRZTd/LrDy
         IW9QdFwiHyOBAsrirGcarcqHu07xrFB6+L6VvPpivw0wRvJ0i2hRLqHIIkGH3FU5XbsD
         6UY8HF8PT/4x9mpKmkw5O+EQByv6hKlTqG/i+4siXEeo3cvGKtE3CB2V67CtXhXZTij+
         qybw==
X-Gm-Message-State: AOJu0YyzehsmVO1H0apioXf9mn1jcrF+cK7UJfxs8Xy3frRKQ8Q06CAM
	TYfn5UyfWTnFA0g0P2h2AP1YEQ==
X-Google-Smtp-Source: AGHT+IGgd3SIwzRo05crHQZcZdIwfB08YjDuFbDQxrEcjaJXxfyUwP7xDu63tVHI4IbBCdiWq8CvpQ==
X-Received: by 2002:a19:ad45:0:b0:509:3806:b86 with SMTP id s5-20020a19ad45000000b0050938060b86mr1403227lfd.3.1699456300131;
        Wed, 08 Nov 2023 07:11:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:22d4:745b:9658:6dd? ([2a01:e0a:999:a3a0:22d4:745b:9658:6dd])
        by smtp.gmail.com with ESMTPSA id m13-20020adffa0d000000b003143867d2ebsm5159107wrr.63.2023.11.08.07.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 07:11:39 -0800 (PST)
Message-ID: <c5766c6b-5a85-48ab-89c5-9bc43aeb20bd@rivosinc.com>
Date: Wed, 8 Nov 2023 16:11:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/20] dt-bindings: riscv: add scalar crypto ISA
 extensions description
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>,
 Samuel Ortiz <sameo@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
 <20231107105556.517187-6-cleger@rivosinc.com>
 <20231108-grower-handwash-63526d449e9c@spud>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20231108-grower-handwash-63526d449e9c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_071142_768109_2E259199 
X-CRM114-Status: GOOD (  11.22  )
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

CgpPbiAwOC8xMS8yMDIzIDE1OjU3LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gWW8sCj4gCj4gT24g
VHVlLCBOb3YgMDcsIDIwMjMgYXQgMTE6NTU6NDFBTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdy
b3RlOgo+PiArICAgICAgICAtIGNvbnN0OiB6a3IKPj4gKyAgICAgICAgICBkZXNjcmlwdGlvbjoK
Pj4gKyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBaa3IgZW50cm9weSBzb3VyY2UgZXh0ZW5zaW9u
IGFzIHJhdGlmaWVkIGluIHZlcnNpb24KPj4gKyAgICAgICAgICAgIDEuMCBvZiBSSVNDLVYgQ3J5
cHRvZ3JhcGh5IEV4dGVuc2lvbnMgVm9sdW1lIEkgc3BlY2lmaWNhdGlvbi4KPiAKPiBTbyB0aGUg
dG9waWMgb2YgdGhlIHNlZWQgQ1NSIGNhbWUgdXAgb24gdGhlIFUtQm9vdCBNTCBpbiB0aGUgbGFz
dCBmZXcKPiBkYXlzOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3UtYm9vdC8yMDIzMTEwNzIx
MjQzMS5HUDY2MDFAYmlsbC10aGUtY2F0Cj4gSSB0aGluayB3ZSBuZWVkIHRvIGRvY3VtZW50IHRo
YXQgaGF2aW5nIHprciBpbiByaXNjdixpc2EtZXh0ZW5zaW9ucwo+IG1lYW5zIHRoYXQgdGhlIENT
UiBpcyBhY2Nlc3NpYmxlIGF0IHRoZSBwcml2aWxlZ2UgbGV2ZWwgdG8gd2hpY2ggdGhhdAo+IGRl
dmljZXRyZWUgaGFzIGJlZW4gcHJvdmlkZWQuCgpIaSBDb25vciwKCkluZGVlZCwgc2VlbXMgbGlr
ZSBhIGdvb2QgaWRlYS4KClRoYW5rcywKCkNsw6ltZW50CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
