Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CEEC3ABC3
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 04:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C+8s2EtadcdXQBX3biae2SzYlUOxrwPBc6EMf/iPdSE=; b=mFqgbxEzAHuCME
	0FL7fBqGhuAT29F+riHmye7lbIX1KmCVE4UwWHG0tOYDbbjOkR55H0ovy9pL2oUo0MTQP3hvJgLCF
	qLAzrww2GgUarO9Kim3xTXnJ55fIUWvMUrMXDaa2D+ubVRGX4fsGatTGCcyi7wmsE+BMk3AQkL8hf
	8Ilfx6GVoriBeFTVgOGkWeZjxxGXlD530mbhyOmVA94b1k7H+XEShPq3+18dYAhiH3G7uCDp/zMy8
	9fzZMrbmBfHoZMpLPbL53N4eS4zGACaS+h8D5wf8djYES6lhFk1CMVpSka9+fhmcP6clh4zIIBVQl
	ypSayazeBq6bvAU07S+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEhYi-0000000BKnS-3wah;
	Tue, 13 May 2025 04:48:05 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEhYg-0000000BKm9-2DCy
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 04:48:03 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6f0c30a1cb6so39445636d6.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 21:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747111681; x=1747716481; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KR7eKLJbwnrfCRgfL+syprkvAujQisMfVa8RFU773iE=;
        b=TxkxDPRR6eZPZKMU2+DbK5MFE8sqUBrwpv0vAoYzcMbK/0TymiAg/oXDElnG1iel0w
         DuZNJh203+vP9STZMy3d/tA2ae4DTvxQY1fqosaSNof6XL3dns2bU5TjTyDEftpGKidD
         joBkQy1AKgoEXq9xyb9YIK1XL0aorT+VWT4Sukh4+SkLBOI3DsX2OUKSmgJauVUwFqdI
         MWhYQOGB/YeuDg16U430cn8HMtaPXS85lWyGWhlE5YIWlVopol+Kp1CCfOONH9Am7djU
         04M85dGMTL+AIlBIoejet7DVlMZp9HIs3hqzAQ8Yn22zbAq4dZtQzThMyFWDegTnf0GK
         EK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747111681; x=1747716481;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KR7eKLJbwnrfCRgfL+syprkvAujQisMfVa8RFU773iE=;
        b=Bi2c8qH1egR7uN1M2DlPHDyPiaY9Uv4I52cV8DV5GGWNScn31fPp0UP2dOmJlgBZ+9
         sx+8m3f49rAVAS+QpH9GueRM2c8G8e21GA/8BDw9BVwpYKWthSNJWVAZxTNxUldzJWtG
         ky3IleQmiBbPHOqpo2FBqd+ulX6kn44ndYUrk/C2qSO66D59M+LGPSZuWAvGHeXQgnok
         cYmI2JEtHFhH+gcS5OHc/rQYXcB+nTxoPQaULOnlqhdcsta9GLDzlkHtCIrvLkWRsOfJ
         h+Po3Haiz5LAAOo6RFfnVUQhzcro5wPrQxpgjSNvLXv2faN5m5xG5KbmL+6aKfR9iz5g
         hYhg==
X-Forwarded-Encrypted: i=1; AJvYcCXVEkA5bnA0J3xAy4KosQBAA2iKuIyCVc2dBzjTwk98lB8eKFRf0WxECCH38+9pjSKWEYtiGjEZZR3ZTw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKebhQR7bQIJIsRJN2dKr4l7BFUlF3gdEVAbUISrQkS3+QkMEo
	aOhZ547HUQA77EHwHjrnrOQXgXuws8Xcaq3dGM+RkESoihjngYdR
X-Gm-Gg: ASbGncujImP7LFrMSPI+TjryfJOduBMthtp4wjGtpBDfm7vtjHHrPyRX5s8mc+K8Lmh
	vxhUWoQiCKO+xu0xb8qH1NVQpJqg0YzNI/5pj+ddK7NeA6oWuab6idplJOWPBD73OuMzhw6vLkZ
	NJNl/6uGcTRDgCVMci934xrLJ/Nw0wn1Q6iE6JMTiPXsViK7L2/QVRkGo37X47BAD3z9IHL2NW1
	XofS2p/s8SfeJ2TwoqEwUM0lK1SCl+mkB+rqDcZCm9zB9dOKmzM6F3G5pqdgN61wNSjmaIW7OpM
	lsqb4IKTLkP8HMHJ4PSp0B+vqReGfq6f49Btjg==
X-Google-Smtp-Source: AGHT+IGMMVWi5sUhGfqR5ppR5sw1BwP28UqLP+NhcalHnZR1zGlpwyPrB1d1heId/WN2/hYqgwmEjA==
X-Received: by 2002:ad4:5d63:0:b0:6f6:e411:a050 with SMTP id 6a1803df08f44-6f6e47f6168mr249312916d6.26.1747111681132;
        Mon, 12 May 2025 21:48:01 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f6e3a47306sm62394856d6.89.2025.05.12.21.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 21:48:00 -0700 (PDT)
Date: Tue, 13 May 2025 12:47:30 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, Han Gao <rabenda.cn@gmail.com>, 
	devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Add xtheadvector to the sg2042
 devicetree
Message-ID: <iydi574treznfdvaibi7obxtyozs4b2sfiddpvckaovpgcpj6g@nyctqbjizxsc>
References: <cover.1746828006.git.rabenda.cn@gmail.com>
 <af839bc200637e4eae1cb327c95ac98c82bccd52.1746828006.git.rabenda.cn@gmail.com>
 <MA0P287MB22624E52A6647B43D53DCD2CFE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA0P287MB22624E52A6647B43D53DCD2CFE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_214802_563500_4D24D270 
X-CRM114-Status: GOOD (  12.16  )
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

T24gVHVlLCBNYXkgMTMsIDIwMjUgYXQgMDk6MTk6MDdBTSArMDgwMCwgQ2hlbiBXYW5nIHdyb3Rl
Ogo+IEhp77yMSGFuLAo+IAo+IEkgdGVzdGVkIHdpdGggdGhpcyBwYXRjaCBhbmQgdGhlIG1hY2hp
bmUgY2FuIGJvb3R1cC4gQnV0IEkgZmluZCB3aGVuIEkgcnVuCj4gImNhdCAvc3lzL2RldmljZXMv
c3lzdGVtL2NwdS9jcHU2My9vZl9ub2RlL3RoZWFkLHZsZW5iIiwgaXQgcHJpbnQgbm90aGluZywK
PiB0aG91Z2ggSSBleHBlY3QgdG8gc2VlIDEyOC4KPiAKPiBEbyB5b3Uga25vdyB3aHk/Cj4gCgpN
YXliZSB0aGlzIGlzIGEgaGV4IG51bWJlcj8gRG8geW91IHRyeSBoZXhkdW1wPwoKUmVnYXJkcywK
SW5vY2hpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
