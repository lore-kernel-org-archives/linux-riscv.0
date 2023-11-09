Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C38C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 02:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:
	Date:In-Reply-To:From:Subject:Mime-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQOErD7TFDhE3A4irIa2IRVH1fWImJQJ2kwVB9lhyMA=; b=hc05XJLOo3eZOd
	DlqrR8jSpARdRc8SFuFZ1F356H6TuyDfHCcbvtRyI5xMCb6VRkUvsuhVRtdEAuNBPdt7NMzgF5NW6
	zUsVShomnT6gRjCOdf3jc/wXykYQ+s5PYzVYqIeDF3fhLJL9lpEh/VOy3e5ShHFDn8QYTjXqMsid+
	OJ3icHl63V6wkxt+aL/xfMZ3K9Sjg0etTdoPYKNXUlbXEI1RnqrZaCmOMWX1kdtoggL0j/DCkbdy8
	oAGBiIgc3NZAjp22KZLKTZCCtHJJFyko9C6sH/cLD7xUV/lcQ0MNcRIHFV+zuhD/3jc3VVTYkNXhg
	gw95adaBL6TrH+tpcTMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0vFr-0059Lm-0G;
	Thu, 09 Nov 2023 02:58:51 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0vFo-0059L5-33
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 02:58:50 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1cc1ee2d8dfso3228285ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 Nov 2023 18:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1699498727; x=1700103527; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DppDE93uNSB4OmZjw8tLCue7p/imeYMCzu6NlobepZ8=;
        b=TQPM2GAj32FrHFQaf30MORjBnUTmsTB7ce2TV8QGr2DoLemNhQNI4EUBwOuj8bjnnZ
         yHSuVFQRFMzA/UiOco54lfQk1NoberotlaTTe6Hvgo+QqQLJgPZ3iUMWA1cepdrfvWew
         WuBdlpgz+RXrE+8CdLxe75+8mcIJrevBPxa/LrgWRYDO+o7tVU41xMCDYGsz1pMfMA6k
         DZef1ElOsXQ94nG/M9r8tJ3Sxz2Ha5TivdLBwyaDt7Xn2JXWH2P8/sGjgZlvjn+Do2qW
         hgONMlqdPRpmAEokDLn4FdWWWRxR8hpS1U/6RYS7IVteeF76BGSYAc58JD+kVfoKqgb8
         kh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699498727; x=1700103527;
        h=to:references:message-id:content-transfer-encoding:reply-to:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DppDE93uNSB4OmZjw8tLCue7p/imeYMCzu6NlobepZ8=;
        b=nTDiW+5+HMvOvIiqjw7yyeOpshM6di+u9khphk14hz00WGCGvAcmX+sLaxVQppEOt+
         zARxoEsUUgt6ECvQvsAnV5lRtpfYUQbR55twCgDGfPUrAoZRg7N9y/U09dPByO5FCLIq
         77Lq53W7VFHa4BZ8C7PuJMy71tcaMKCVCky//wr+PRHN0nsk3n0Fc4+f+8sc2Z49HBtQ
         4FvCQLsDGwYKq+RnoISe9KrVyhWDbVVoM9XxcR0/mMw/Nha+O6Qtt9h7Zv09TZWX4wtI
         4bBgoBVDfZ1/sqxwuRA/Ku0RtbYu9Vmr+863YZAiM1NHouDgDotZ46FyR98cWjGcMtaz
         TQxA==
X-Gm-Message-State: AOJu0Yzp+TKO9PeVApiD5CTbWcIlpe45ObC1cgCOHJyo9sDZsIozMYZa
	w6t8AGRBPeydsWuDvF+p/lnvEw==
X-Google-Smtp-Source: AGHT+IHn09W1cRZDEkkvIH3Oo47/42K6T4xkwgAHBTl4aY/xkO5ybUHzFNH6lbK8MUVDkJ0h6qQGkQ==
X-Received: by 2002:a17:903:2341:b0:1c9:e508:ad54 with SMTP id c1-20020a170903234100b001c9e508ad54mr4317917plh.13.1699498726815;
        Wed, 08 Nov 2023 18:58:46 -0800 (PST)
Received: from ?IPv6:2402:7500:4ce:aeef:31cf:49a7:c:20d4? ([2402:7500:4ce:aeef:31cf:49a7:c:20d4])
        by smtp.gmail.com with ESMTPSA id g4-20020a170902740400b001c465bedaccsm2383368pll.83.2023.11.08.18.58.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Nov 2023 18:58:46 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [PATCH v3 06/20] riscv: add ISA extension parsing for vector
 crypto
From: Jerry Shih <jerry.shih@sifive.com>
In-Reply-To: <20231107105556.517187-7-cleger@rivosinc.com>
Date: Thu, 9 Nov 2023 10:58:41 +0800
Cc: linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>,
 Evan Green <evan@rivosinc.com>,
 Conor Dooley <conor@kernel.org>,
 Samuel Ortiz <sameo@rivosinc.com>
Message-Id: <5EF129A2-195B-4207-A2F6-DBA1FBB9F65D@sifive.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
 <20231107105556.517187-7-cleger@rivosinc.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
X-Mailer: Apple Mail (2.3445.9.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_185848_984825_EB2D9A9B 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
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
Reply-To: 20231107105556.517187-7-cleger@rivosinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTm92IDcsIDIwMjMsIGF0IDE4OjU1LCBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2lu
Yy5jb20+IHdyb3RlOgo+ICtzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X3p2a25oYl9l
eHRzW10gPSB7Cj4gKwlSSVNDVl9JU0FfRVhUX1pWS05IQQo+ICt9Owo+ICsKCj4gKwlfX1JJU0NW
X0lTQV9FWFRfU1VQRVJTRVQoenZrbmhiLCBSSVNDVl9JU0FfRVhUX1pWS05IQiwgcmlzY3ZfenZr
bmhiX2V4dHMpLAo+ICsJX19SSVNDVl9JU0FfRVhUX0JVTkRMRSh6dmtzLCByaXNjdl96dmtzX2J1
bmRsZWRfZXh0cyksCgpUaGUgWnZrbmhhIGFuZCBadmtuaGIgYXJlIGV4Y2x1c2l2ZS4gSXQncyBu
b3QgdGhlIHN1cGVyc2V0IHJlbGF0aW9uc2hpcC4KClBsZWFzZSBjaGVjazoKaHR0cHM6Ly9naXRo
dWIuY29tL3Jpc2N2L3Jpc2N2LWNyeXB0by9pc3N1ZXMvMzY0I2lzc3VlY29tbWVudC0xNzI2Nzgy
MDk2CgotSmVycnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
