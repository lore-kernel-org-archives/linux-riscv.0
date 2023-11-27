Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EFEC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 02:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bptAfu/gCDiFgFNadUs/POEhDeAM4LHHZAqMG8QniNg=; b=rqus6p+zUMumLW
	pP5wOuQrSvRImTh5RS8hIvKTZCBp8raIuWqWp2aXiiLiSeraHk0+swTkMabfTOoVnLluL9MPXbv/Z
	WvIQF4ETve+0zBJWXHSsh0InpPvqd8ewEZkMq7ac8Qlbfv75gYczt/US90BU7EavXAhmXjrOsHXbD
	d2R8YsGdfOn8vA5kmvwQEm5wgfMmKp8lPd2otJ5takeoZ+23L6RNyecxBgDV/nBNCTpuLr/9jY0vr
	0UJCE9xZ//TDkymFZl/CU60mKVnpf9VRGruCNVMWL5QNxAjGf8gq60FSChWwc55OvlZRyy3Coj+Sz
	q10BmsQAUEcpfvYHPRqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7RjG-000y8E-2i;
	Mon, 27 Nov 2023 02:52:10 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7RjD-000y58-1j
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 02:52:09 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-58a42c3cbb8so2236876eaf.3
        for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 18:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1701053526; x=1701658326; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qI9CcSDLLstHRyj21IWoZ+bA+1wKLNybWTEpCFykIso=;
        b=W5JkpYnsk7P9XShlbzK3V3U6iuoV4/WDq4opt0L/KnKE5xSHplSO44gr43K3ScSpMa
         P1VIpEP4M7ZwK6K7Lv7ZalpvCz+kqSTWVVSBPZW4UzzBLjZwhphfM1TMB8VvCWtMAdQx
         11GwTK/AWQVKI+FZNl/v4BXgKY2zVVXPbTXwDDQRLbLrTbf/2wcgiAAXNs3gmFskN1nd
         iWQgyAwiV94VcmiCoFAFrOwYssSnnZayRTvsyWSuhYasn2fxY+x1+xhYYjVHKc497XmX
         4BkWrcyWealw5mp+sEsa+Jy4i0gzcEATr6Jgo2Tkgi8lYDZvPClAx6TuAO7a5Shi6jhX
         stKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701053526; x=1701658326;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qI9CcSDLLstHRyj21IWoZ+bA+1wKLNybWTEpCFykIso=;
        b=nTB/wXvJx/2rhScIkGdfR+S0ryk3/yVRixcp+lDf44UqDX9MnhBFqkeZdnMkPl1MCw
         HSkUk513vSp++UVfM3OjCEOg06XOprRorxJO/mL49nrfaXl4pyePlzBkWT0OiSckd1aR
         cuV1r07mauFYilLDskX2G4t3vtgufTNSpNQL+MQgvOV8FDlTsJv7M6WCusob6fV+4eot
         gQqtaOIQEOTYy0hLYuafFJvVrqWXM4tbXolbwPlycGLz00BsooBkODPdmzAZQDqAbvyC
         qr2jleJJ/hftFRZjWBqpiMjy5ctZoJombD0x8hbljsamqwN1ozRY5MoND1DwQQ0avSg3
         25vg==
X-Gm-Message-State: AOJu0YwMKJBgEhXmTBYTUuTSCAk6X+SxwbpEZRvZp8NUUQ6kPC9OBjAk
	YB9kCLEj1l9zCWqTPv0MZSxI/g==
X-Google-Smtp-Source: AGHT+IEUMWOQwI01s5hv1fkkX+qTkj8fVqbeaE2jyE5V20loSNf/HwB1dt15pdwtT8kBz5cVsoeurg==
X-Received: by 2002:a05:6870:9a90:b0:1fa:82:3d6b with SMTP id hp16-20020a0568709a9000b001fa00823d6bmr12180340oab.9.1701053525800;
        Sun, 26 Nov 2023 18:52:05 -0800 (PST)
Received: from ?IPv6:2402:7500:4ce:95c7:2856:b238:775:b338? ([2402:7500:4ce:95c7:2856:b238:775:b338])
        by smtp.gmail.com with ESMTPSA id c13-20020a631c4d000000b0058988954686sm6632076pgm.90.2023.11.26.18.52.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Nov 2023 18:52:05 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH 06/12] RISC-V: crypto: add accelerated AES-CBC/CTR/ECB/XTS
 implementations
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231122011422.GF2172@sol.localdomain>
Date: Mon, 27 Nov 2023 10:52:00 +0800
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 palmer@dabbelt.com,
 Albert Ou <aou@eecs.berkeley.edu>,
 herbert@gondor.apana.org.au,
 davem@davemloft.net,
 andy.chiu@sifive.com,
 greentime.hu@sifive.com,
 conor.dooley@microchip.com,
 guoren@kernel.org,
 bjorn@rivosinc.com,
 heiko@sntech.de,
 ardb@kernel.org,
 phoebe.chen@sifive.com,
 hongrong.hsu@sifive.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Message-Id: <08090C1A-E8D9-4C87-995B-8A7A195CE1AF@sifive.com>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-7-jerry.shih@sifive.com>
 <20231102051639.GF1498@sol.localdomain>
 <20231122011422.GF2172@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_185207_580834_90BCFCAD 
X-CRM114-Status: GOOD (  10.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Nov 22, 2023, at 09:14, Eric Biggers <ebiggers@kernel.org> wrote:
> On Wed, Nov 01, 2023 at 10:16:39PM -0700, Eric Biggers wrote:
>>> +	  Architecture: riscv64 using:
>>> +	  - Zvbb vector extension (XTS)
>>> +	  - Zvkb vector crypto extension (CTR/XTS)
>>> +	  - Zvkg vector crypto extension (XTS)
>>> +	  - Zvkned vector crypto extension
>> 
>> Maybe list Zvkned first since it's the most important one in this context.
> 
> BTW, I'd like to extend this request to the implementation names
> (.cra_driver_name) and the names of the files as well.  I.e., instead of:
> 
>    aes-riscv64-zvkned
>    aes-riscv64-zvkb-zvkned
>    aes-riscv64-zvbb-zvkg-zvkned
>    sha256-riscv64-zvkb-zvknha_or_zvknhb
>    sha512-riscv64-zvkb-zvknhb
> 
> ... we'd have:
> 
>    aes-riscv64-zvkned
>    aes-riscv64-zvkned-zvkb
>    aes-riscv64-zvkned-zvbb-zvkg
>    sha256-riscv64-zvknha_or_zvknhb-zvkb
>    sha512-riscv64-zvknhb-zvkb
> 
> and similarly for the cra_driver_name fields.
> 
> I think that's much more logical.  Do you agree?
> 
> - Eric

Fixed.

We have the names like:
aes-riscv64-zvkned
aes-riscv64-zvkned-zvkb
aes-riscv64-zvkned-zvbb-zvkg
sha256-riscv64-zvknha_or_zvknhb-zvkb
sha512-riscv64-zvknhb-zvkb

-Jerry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
