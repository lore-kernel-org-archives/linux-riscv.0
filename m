Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BF4CA0EE0
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 05:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4fKlvrtB03lnpuGvhHCBcMX/u6zAjsxPgg2w1aS8/o=; b=yD6p5oRnrfNh/B
	f7yA42JB3N39xCDjc9Iee4UjST4ay4sQgEihGMUjF6xtupOQqHEBvX736JakgxevgWitZf0zewmNO
	0BkFdM7hfqaQLARfm/tQK2Dk0M8E7NxWrw2Fcb5YWPEGhLlYy2RrvjJVNQnha2ckZKSkIpgSOHU5K
	NqLtEXCGQjcpV9RSb5ZzLSxZE3jhTryLZKzyoJ0gkhBsRIPxloF9QMJw4HTTpuAK8qrICk8/oqK+t
	5SBFYxp7u0m0r4mlJsgvKYyTpjO4LG76INEhyMvKc7NWy7j2QXIOVSNr9XlM602paijF0Mwht/ytN
	bK1/cnHDGTUKOu4repTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjudE-00000004sS2-0AEn;
	Fri, 30 Aug 2024 05:57:12 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjudC-00000004sR3-0GhH
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 05:57:11 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3df096e70f1so827228b6e.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 Aug 2024 22:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1724997429; x=1725602229; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bS4Vcno3eV2Qn/byTVlsNhExHrNUmtKjgh9WYM/zcU=;
        b=D4QIi5gfzDwHCMGwvte5OLJ1ujtnkfKCbJ+eM0vNacl1T+slHRQVAh7c3iJZ1kG5PU
         h0+DaN11wCsGiQJCDOPjq2XJxAF50fcfcmYE/0Ykg4GRQuqRPNY9B1rDk/maJelya318
         UCYvGj63aMhcMDD5A6GO233YJkMkn78hJA37iK9LOjTSYJ6v40+5uq4JCvCdfRldvPiJ
         Vv5VSKXS8wTAvMmfbt71g+scQhxOC2fonvMgd9s+BLwIJXU6/64PACeidZIB1pw/3izW
         byndMcgNuUMTWoJQpZWLQ86wczpDF33PVUFMP/yRIaYAb12zrTiubtcx2N2xOkD6Pg5k
         hUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724997429; x=1725602229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+bS4Vcno3eV2Qn/byTVlsNhExHrNUmtKjgh9WYM/zcU=;
        b=F+megj972obI6fcjsfl/lUlfjeZ2a/QbkJ3RXh0RCCXQF9r+znVp74/nRQ3kG+aiNB
         AJiJ4I2sgsKVWu5kBfW7M8kj7PKmfQTo/1miB9aTh7yPjBFj4MD9/46wdLipamXoNYEa
         xes4vwDt49ZnzPYGIagdN2+D7wOQzH/lsJ0bGaqh54bpTC9NlaTMAoV4QpZoy8J0tNEa
         NN2MfCOQUSv18BRjNmpHYHx83a8SjqiNkFDauXWKlcy1I17dzvd7TR+M+8G3BQDzAXjh
         T5+fW24jbENmMnmKCW+S9tHwOuGYWQ6MVc/5CA1X1jZHKD/lCYxfZgUoY0QHeJbooTJr
         R5oA==
X-Forwarded-Encrypted: i=1; AJvYcCUlvCOtjFHGFpDYtsITHchEA4uRRQY55EC0SjMou7YAPpUVEkmB+MZIlUGbpJ4Rd/NXqrg0wHlMNqRF1g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPHpETDS7CNUtr/96rrwgCQiUoOzPoeEzVsz90pBUxlUfIRgFK
	QM1jZgpeM5ST6+mqVD7caPRVCVMxGu2HVoJe385so+esORZscOtcwoR2dHq+WZaTlsak+v9euu+
	u70noKyb/4R4xWg3gcvwzB83UfPnnulle+qp/Ew==
X-Google-Smtp-Source: AGHT+IF+bvBOzP8WPuHP2wswdhxLCrRjaJRkPZE2kRmeOLYycfULGuDXQiQa0ow1QrMYQIBLSiVTZE6myPNKH1Jcjkc=
X-Received: by 2002:a05:6808:11cb:b0:3d6:5791:a378 with SMTP id
 5614622812f47-3df05e22510mr5366568b6e.17.1724997428847; Thu, 29 Aug 2024
 22:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240829033904.477200-1-nick.hu@sifive.com> <20240829033904.477200-3-nick.hu@sifive.com>
 <87o75ba1hx.ffs@tglx>
In-Reply-To: <87o75ba1hx.ffs@tglx>
From: Nick Hu <nick.hu@sifive.com>
Date: Fri, 30 Aug 2024 13:56:58 +0800
Message-ID: <CAKddAkBM6BW9BXYumiG8JzbTFRD1pgp=b0fcb=KBW6ysjPf8Qg@mail.gmail.com>
Subject: Re: [PATCH 2/2] time-riscv: Stop stimecmp when cpu hotplug
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_225710_120643_C0B5911B 
X-CRM114-Status: UNSURE (   8.90  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, zong.li@sifive.com, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Pavel Machek <pavel@ucw.cz>, Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgVGhvbWFzCgpPbiBUaHUsIEF1ZyAyOSwgMjAyNCBhdCA5OjQz4oCvUE0gVGhvbWFzIEdsZWl4
bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+IHdyb3RlOgo+Cj4gT24gVGh1LCBBdWcgMjkgMjAyNCBh
dCAxMTozOSwgTmljayBIdSB3cm90ZToKPgo+IGNsb2Nrc291cmNlL2RyaXZlcnMvdGltZXItcmlz
Y3Y6IGlzIHRoZSBwcm9wZXIgcHJlZml4Cj4KPiBUaGFua3MsCj4KPiAgICAgICAgIHRnbHgKPgpU
aGFua3MsIEknbGwgdXBkYXRlIGl0IGluIHRoZSBuZXh0IHZlcnNpb24KClJlZ2FyZHMsCk5pY2sK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
