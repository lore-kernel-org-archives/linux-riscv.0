Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19474C02198
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 04:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s8+QTgeRgiQY2/wXkhyUtvMzNpr9nwal0rhz7zb0bbU=; b=qCY/VmgobqKPTl
	yoQpDFbiIsurW/0WBN46T59lXlESqHx10kRNsmXxKJmYl25ZnAZ8sJFByOcpkASKFn4bS5u3P80pB
	gmEZaNkA4LlP+nhY8IPX3jIK8Eb5n7di4CDOgdPd6aFQLAnqIuDme52x2L3mT3W321a4ptO19bqXd
	h+K6L4QzG03O8wiPwEG4jAQuLe1nxxXNnibt+FtsOkcd6xDxQfXTl5H2BSItePb9nxa59QN+2er2E
	BMs9N2lsggx7WzAfZiDquSKW2gBypmPzVm3JgubyMYrZSt7Tjy6zNhKQcATpmhsrtbZb8TwfBUwqE
	doQB/J+K8uX9UdbjLapw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thLmP-0000000GChe-1nQh;
	Mon, 10 Feb 2025 04:52:21 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thLmN-0000000GCgw-0eZk
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 04:52:20 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4719141e711so5328231cf.0
        for <linux-riscv@lists.infradead.org>; Sun, 09 Feb 2025 20:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739163138; x=1739767938; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RiX9FGbiSBtVUgBAqlqkuFPAJPEJWzTeuqFOWrFzL2M=;
        b=U1me254ktpLubPmKX8N3b1Ca6NnkrzCObVunzFt4VT5QJIA0UbSjawLVejfElD5xj+
         H/znyUp5MAW8QSi25kFJjEUklAG8wtvMdUIru9PtMvqo6M+FaafC3KxNvgnWOQwG2xVB
         4P20HYrulYLn0zu2921pqbknARAxmZen99s5z6qgauUPaHRYg70PxzIMtCEYaYenJG5l
         XDXy1tiMt8JqUst+FxFZi08Db2O7EI1IAUKBWVEJISDEzwuvhkuKv22/P+lHsVWllWsa
         eAWLCGDnqqH71O+uPdMo/WMlyCTq+FBa/aQYynPw+wSVqSy1O9szsNJxJsY2bkdcZzge
         YrRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739163138; x=1739767938;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RiX9FGbiSBtVUgBAqlqkuFPAJPEJWzTeuqFOWrFzL2M=;
        b=EP3SUSrrfAk5alSCjVC1w1pLsjjtr2P1n6/Unj61/prr4p1WQkvREfmA6QwV3sravB
         WFOuQkMVGMKf6KVqbpptE3q4dCBSBhHMRWImL+YTeH/DkceBaVmT3jiyYjbqDzSALamc
         1Z2S9O6BihVyHzTv01Fx/iQi2BoQzXVOJpQ/yaY7BT8uIqXldihH+IJcjngDKPw4jrIc
         hfaBliHuu6hYIwDs81AW+7F9Knx5FW0V6Tey3OpKZxpfnHBNhdZ1JfeZfKaAV22ItjiH
         7TDnDiVHs1CiiGUcd222rwVJBROQ1FmiSwAaF6hhfZyShoq4nCwbbI13+vG83FMUdpNt
         d0EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLG0sv71P3omitBa2L92wOVrBTPi2+L/gCme8BD79kKsZuLw0cidC0/WII6oLxw35ryGIvPmCAekk53g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxaOlizMs2pX0CRwh2jvHzhpPELq4GMPLrDmgPfhn7mftLOzrBg
	A/IEqts2st5bBp0jYDS2bwOtmHMQy1IYeWczGOkJzlQVaAKPZFQ6
X-Gm-Gg: ASbGncsSw6fNXfBfG2h9Axt524kx8tXcvjb/Apy5hXoXbbtwYnEWHEu/hN6EBLRGXbE
	+gGXgJJMUEUkqgZqfSvmVDPLib2f2U8p7Lxt4pohSLgXKvFqlYmZWhDwUDTETI3x4OtmnC0/Je5
	u8QJJT6D4TXKtZseD3PhaHpks0/6N8uIn4pIhy2otPT7mBYC8VYRym89y/75/fhPPmec9DlOB46
	xb+ATz1XtX+1j1m5+km+q1a/yc7rgNe7E4xfAsM5nCBL4kUfC28RJsLy1lyZ5HZoP4=
X-Google-Smtp-Source: AGHT+IHiHK4lyWxpC007WY+qisNULgHfYOv4hfuiPKXWv7wRvUVNR7FRNquK7LrfkgMkKjA459x8+A==
X-Received: by 2002:a05:622a:4c16:b0:471:9016:71fd with SMTP id d75a77b69052e-47190167412mr51313761cf.42.1739163137913;
        Sun, 09 Feb 2025 20:52:17 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e443254399sm37333106d6.49.2025.02.09.20.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 20:52:17 -0800 (PST)
Date: Mon, 10 Feb 2025 12:52:11 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Jisheng Zhang <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 4/4] riscv: dts: sophgo: add reset configuration for
 Sophgo CV1800 series SoC
Message-ID: <jpyrhgzqr7rfo3thsd5hxpgzhyjmvvsku3muflhknkt4rueb35@ngfpbj5zq3p7>
References: <20250209122936.2338821-1-inochiama@gmail.com>
 <20250209122936.2338821-5-inochiama@gmail.com>
 <BMXPR01MB24405F6AD115D27D42EDB2ADFEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BMXPR01MB24405F6AD115D27D42EDB2ADFEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_205219_196470_0ED4E08E 
X-CRM114-Status: GOOD (  11.61  )
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

T24gTW9uLCBGZWIgMTAsIDIwMjUgYXQgMDk6MDc6NDJBTSArMDgwMCwgQ2hlbiBXYW5nIHdyb3Rl
Ogo+IEkgZm91bmQgdGhhdCB0aGUgdGl0bGVzIG9mIHRoZSBwYXRjaGVzIGluIHRoaXMgcGF0Y2hz
ZXQgYXJlIHNvbWUgdXNpbmcKPiBjdjE4eHgsIHNvbWUgdXNpbmcgY3YxODAwYiwgYW5kIHNvbWUg
dXNpbmcgY3YxODAwLiBQbGVhc2UgdW5pZnkgdGhlbS4gQWxsCj4gaW7igJxjdjE4eHjigJ0/Cj4g
Cj4gT24gMjAyNS8yLzkgMjA6MjksIElub2NoaSBBbWFvdG8gd3JvdGU6Cj4gPiBBZGQgYWxyZWFk
eSBrbm93biByZXNldCBjb25maWd1cmF0aW9uIGZvciBleGlzdGVkIGRldmljZS4KPiAKPiBQbGVh
c2UgY2hhbmdlIHRoaXMgZGVzY3JpcHRpb24gdG8gIkFkZCBrbm93biByZXNldCBjb25maWd1cmF0
aW9ucyBmb3IKPiBleGlzdGluZyBkZXZpY2VzLiIKPiAKPiBSZWdhcmRzLAo+IAo+IENoZW4KPiAK
ClRoYW5rcywgSSB3aWxsIGZpeCBpdC4KClJlZ2FyZHMsCklub2NoaQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
