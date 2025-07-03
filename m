Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18EBC77B7C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 04:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qqoe0hZ0PfFRjapt0Q4mlDQUquLHiFaf/lgPP5SAa8E=; b=s/EcKZ+D+nnHVf
	Ndj8amZCfiIUOzA+Knj5UEcPcfoSDdguhYbwUyRQdltoxV3GhQDBNZEtNglLRWR9Ruyr1sy/GpRRo
	GJP/sNTFYz3KJNAEQdQvaTWuoRbkMaTYb1U2hf/X4KVkj2jRH3+bUzR8aNOEvX5uoW0FtVh/fcUAx
	bNk40y/MEfspPgp/Zem/CJCCq4Hs0lTVfUmY84KkWylGTGCQ/ceX4JIqFhBzbNqXEd8rD8hp297h3
	jMxaD81xqynIJqEy38pGCFcI8Yzif5Lydv9S2E/p+o2c9KIt48aUyV99JhFiTmBUyqIn+hzF+v1Z3
	fiBdiTMjxcIOnB0+783w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXBx0-0000000AEZC-27hf;
	Thu, 03 Jul 2025 04:53:34 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXBwx-0000000AEYq-45ih
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 04:53:33 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-553d52cb80dso530606e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 21:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751518410; x=1752123210; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmF/L2p456HUIg3Za546hwp7qXIBOPPq9FbhG7GL4TQ=;
        b=IA2IYU08SVnE+nhN3fyievIpgU1TZFaaJ0M82SE4PURbMrX4f2dfS+W1D4M3exEYQd
         BofvFHoSkWEZuvPVTPLZXzK3saeGXeKmq1y8iKo1xRbP5JOLn+QGfOfAZG8p2f/xgIlp
         xG47oOdsivctURbGuTkEGQdog69r3JNofNwZHJTTcH14ElVWDRCFqHsA0y6/pyyZm4xe
         1r3C5Q796yO1RyCYOvbhhArSsjKSKMdUWZd1ICwfbwF6tf4OTR6HK+Fv7mhpAcP/qGnk
         QDnPmVmbfVeoOv4idxZIDRhhL7rAzMujtVSwDNIfHIjHuvnUkU7YlZfcCshJ0FD0yOIa
         AqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751518410; x=1752123210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmF/L2p456HUIg3Za546hwp7qXIBOPPq9FbhG7GL4TQ=;
        b=tC836Li59X6t+2KuUxqra0wLBfrKhsCFlK+g/4xNPVDhUHbhKf7pYf9NjIy8P9Wnu8
         Up7zwPYgGu1iEW9JbnTFitNHI0UcnfKWWHWhfLVkRu5KGiKuWcWSYYmAYj4IyS/0RTTE
         SvnmUiWqO+7Oecr1q4l9T/XU3BtY2/2gs/igcEmT0Ofjg09ZRgEI+/gIigUd5gN905tg
         TsPqGHiQOohtlvpW3aBki6jSYlVCx/0qKGX5KrOj4HFGAL9HpIoYq7zheFK1Ff5qBbiR
         MJhFWLLwBExjBjYCdGOW/4yqZE5cHt9iai5EDkXFDmcM6+AAOOCPsyaBd0Dyj5J+091L
         EUwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6DPYqu8PQOAD37fgxtLL1pnyJWs2z6l7Hfvoff3zBIubTidM0VlQqZnZjYZxS6aw44KDLK0LYkeGIfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzgZwYi568uw9Y1ZFZtKowZ8yaJRSm6fNXy/ETmGR6WbWT7sUz
	rh/hRgJcf4Z45pu2LArcDkHwYFZWuvksm5JC5S5IWWjbn1kt/5A/p/zXyNC2AYYsxZ0oGXup6jt
	UFJFD0ntuJowJ9fv7y6qd6w6H0TVQaFvgBwbeC6XIeQ==
X-Gm-Gg: ASbGnct8B9jzoSlX1OhJeMN9I0L7DyqeV/dzrKlj9Ps5zj/+9TTWW5fwqeu9FZQy9Om
	g0fJ1FxROBUaVctd35w1OK0dK9hhmiIxBWjgtPuscAUrpraO4AnnxR7qZH//S/6EZ7RWo5OH0Gs
	8cmgUW22Uu7qQq7N/iaeuYr/5oYFwHA4qgmrpoX9P+Lw==
X-Google-Smtp-Source: AGHT+IH/FAKIrHEJXlazC1GS3IsFDF3FjC0xwLD+IqePmVprhBzw8tGnbUmbJUSRqi3/nuuao8O1tFo5dI9mh6VSnHw=
X-Received: by 2002:a05:6512:6d3:b0:553:a294:3f8 with SMTP id
 2adb3069b0e04-55630a338dbmr347344e87.14.1751518409988; Wed, 02 Jul 2025
 21:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250702122434.1514328-1-apatel@ventanamicro.com> <871pqyl6fy.ffs@tglx>
In-Reply-To: <871pqyl6fy.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 3 Jul 2025 10:23:18 +0530
X-Gm-Features: Ac12FXyimyMGUONnu70iMw5omrnfnHHY2WEGOczm3HdWl9rgEIRzg39H08J6TOA
Message-ID: <CAK9=C2VvbwDuJh-Xi865d7ipjBO781hF+yQL7pPEef4wbkijBA@mail.gmail.com>
Subject: Re: [PATCH v3] irqchip/riscv-imsic: Add kernel parameter to disable IPIs
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_215332_015173_4FEBF020 
X-CRM114-Status: GOOD (  11.15  )
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

T24gVGh1LCBKdWwgMywgMjAyNSBhdCAxOjE44oCvQU0gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxp
bnV0cm9uaXguZGU+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMDIgMjAyNSBhdCAxNzo1NCwgQW51
cCBQYXRlbCB3cm90ZToKPiA+ICAjaW5jbHVkZSA8bGludXgvY3B1Lmg+Cj4gPiAgI2luY2x1ZGUg
PGxpbnV4L2V4cG9ydC5oPgo+Cj4gICAgICAgICAgICAgXl5eIE5laXRoZXIgaW4gdGlwL2lycS9k
cml2ZXJzIG5vciBpbiBMaW51cyB0cmVlIC4uLgo+Cj4gcGF0Y2hpbmcgZmlsZSBkcml2ZXJzL2ly
cWNoaXAvaXJxLXJpc2N2LWltc2ljLWVhcmx5LmMKPiBIdW5rICMxIEZBSUxFRCBhdCA5LgoKSSBh
Y2NpZGVudGFsbHkgYmFzZWQgdGhpcyBwYXRjaCB1cG9uIG15IE1QWFkgUlBNSSBwYXRjaGVzLgpM
ZXQgbWUgcmUtYmFzZSB0aGlzIG9uIExpbnV4LTYuMTYtcmM0IGluIHRoZSBuZXh0IHJldmlzaW9u
LgoKPgo+ID4gICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4KPiA+ICsjaW5jbHVkZSA8bGlu
dXgvaW5pdC5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9pby5oPgo+ID4gICNpbmNsdWRlIDxsaW51
eC9pcnEuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvaXJxY2hpcC5oPgo+ID4gQEAgLTIyLDYgKzIz
LDE0IEBACj4gPiAgI2luY2x1ZGUgImlycS1yaXNjdi1pbXNpYy1zdGF0ZS5oIgo+ID4KPiA+ICBz
dGF0aWMgaW50IGltc2ljX3BhcmVudF9pcnE7Cj4gPiArYm9vbCBpbXNpY19ub2lwaTsKPgo+IF9f
cm9fYWZ0ZXJfaW5pdD8gTm8/CgpZZXMsIHRoaXMgc2hvdWxkIGJlIF9fcm9fYWZ0ZXJfaW5pdC4K
SSB3aWxsIHVwZGF0ZSBpbiB0aGUgbmV4dCByZXZpc2lvbi4KClJlZ2FyZHMsCkFudXAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
