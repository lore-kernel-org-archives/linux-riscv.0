Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9D9CCD1A5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 10:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E2wvNmQE/jN/agpOVRe+e1wQah7XMLxUOQNXpwVL614=; b=D4GnMsDgGu44My
	2XfFPBF0fjYEemjI83+0qtffSarF88DSzraj9fCPcKdRm2rd5dAeKX+Qx2tKCaGewtX8sR0oWWZyS
	kdjnWFEp0SkcgnZTAXxRUplWVl5kj3Bte3ib/rrCPqCR0gRm/kfIZR/RgPSzHdbFe2P7JE24slmcU
	QJsfj0wGPuoCHI4eBZ8AO4aSkOPJaEHq4zvJjfIHr7zHGlfdMCsqcxuaR6hTU6aGIIQyr3MHdVGCX
	w2VH2MNxwDub5bWIVThszuSvofsF8EBVvgdXbfztDQQkBbWAxdANqhtGminxtdcVCXOQSjji3MMsz
	AmCHa4x3rqdpSgSzPjJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9Ln-0000000GZzm-3UAX;
	Tue, 21 Oct 2025 10:12:19 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9Ll-0000000GZye-0y4X
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 10:12:18 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4710653ac03so2176445e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 03:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761041535; x=1761646335; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lS7BlA3ltA1K+OuXFELUMAx/9ayEMieaqVJ6yEPITIo=;
        b=UxUwgRYY8RivW8/thDa/Em+hBQ5CuAHM413k/ZkyEGBSGlL/5Qy2LCh10aEHi0bIzm
         NagFVGPr1NcOQN1IGUcPH60uMtIouF/LxU6egghOP5FP35jNCQ2BCg7IdF5zmrQNsEQ8
         gaHtIx9Lq8PzQ/i1yPA54xycXL6gB2EhGvl/QmgAZWNh19JBEf73GB1S4Xz8qogfNLOz
         Pe7IFpSlj1upfXNIqqacP5NQbcnidfQOijeod3pd/H7Jc0eS3HT1N+YWk2HIRFrKNpAO
         I7DvdBHYYjXI8LsSiiNprpLIT3/zUTSAEst/DiNQvQvlp6joz3EXscsAA7r9LEjFFyFH
         4Z2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761041535; x=1761646335;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lS7BlA3ltA1K+OuXFELUMAx/9ayEMieaqVJ6yEPITIo=;
        b=ATCc42hDK7BqoKRAaU1SeNFvk80QYHltCTawySN+RxsIGNJktFTm3X3ac0/Qtf1HA/
         hukUlm5EmTBQMWcB6gXvmBCDG7S/E6oCg8gqzTUAXtK27fe3/vv02vfuKIZJZijOxwAL
         RaY9qaWCXpxK/35Jm/GBjfRP0Dxb3WppDxT3GnQBs9qPIDxXV8XXQ5s0Qt4if8ItbUY7
         UrDnn8s9GxYJ+2cmNcff/Qyzf+Rk30UuhNvuO06VY+PudtPOJpQcxAPn3q5z+KPq+Frg
         sqfNqNF0aTKQfr8m2JgLQSBcvdxjuv2UsQKwFvkQhxSu5yizChiP4nFBBE+TWzGPKUVF
         KqyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx11LjXzMUBi+RpDTCte/WjCAiyivvah1VvwYcdNV6wV8MUj4+U0Ne2L9lwYjASWnS2ZdwOh0hG++L1A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2L4AiNff8DVt68LSRpzEXhrJff2D4yWERcFq4D9tAE4VnOfQd
	omvu9LV0SoOI30tbMOq3keKIPrAvdxZ2thQ0KOaWr5GROtA/U87PlV/hRlsKlvuSUz7l1dJhNbh
	l1nWs
X-Gm-Gg: ASbGncu89EB4uIoJq3PGiA8aWSE3M9yl2W6M51SwTp9oVhpx7i1+2fzFqeimAflgOym
	YJsjvg2npWNbAeAhGm5gQ046WdMmlNF9utK5ybiPNODel0ExmrgWlzskEGAupCSotz109ljep+R
	B44TC5yU7i7cMMrz/8qDUGUVZqyJoNN+gsamDHXFWhrMjqnUrnzUobIW7C+rzIc6Xt2ip084HUq
	36J+wjipiw29LgFvtCmtoEVroLYo/GK3Bvt9I6mYk+F+HzXxEhGN8XAwYyUegTKKkwAX8HWgCUH
	hAMe0nWOln8FXF94DRF9x282/k8LjzSSaLfaT2LG7Hr5HvxcQ36lvHVP9N5XhTdME+4Ll2bqbHM
	w1A9DLRk2f8SeRzI7owOOefJATVHCWl7XU/AGN7k4ajQ1c4MGzYyHdq0hwL5BAfJItSn1xJb2/E
	8=
X-Google-Smtp-Source: AGHT+IGMp04zmiOU/hD8LCGYBTUQQCGASEAZAsC4+kzM41lFqGtljB8ajxnMiIjuotYviMNMQl6Bbg==
X-Received: by 2002:a05:600c:6308:b0:45d:da49:c47d with SMTP id 5b1f17b1804b1-474941ec4b9mr10454745e9.0.1761041535023;
        Tue, 21 Oct 2025 03:12:15 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::bfbb])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4715257d90bsm189405475e9.2.2025.10.21.03.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 03:12:14 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 21 Oct 2025 12:10:47 +0200
Message-Id: <DDNX3CCBLWXK.3KMVX9AKL162N@ventanamicro.com>
Subject: Re: [PATCH v2] RISC-V: KVM: flush VS-stage TLB after VCPU migration
 to prevent stale entries
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <tim609@andestech.com>, <ben717@andestech.com>, <az70021@gmail.com>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Hui Min Mina Chou" <minachou@andestech.com>, <anup@brainfault.org>,
 <atish.patra@linux.dev>, <pjw@kernel.org>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20251021083105.4029305-1-minachou@andestech.com>
In-Reply-To: <20251021083105.4029305-1-minachou@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_031217_313064_47738541 
X-CRM114-Status: UNSURE (   9.48  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

MjAyNS0xMC0yMVQxNjozMTowNSswODowMCwgSHVpIE1pbiBNaW5hIENob3UgPG1pbmFjaG91QGFu
ZGVzdGVjaC5jb20+Ogo+IEZyb206IEh1aSBNaW4gTWluYSBDaG91IDxtaW5hY2hvdUBhbmRlc3Rl
Y2guY29tPgo+Cj4gSWYgbXVsdGlwbGUgVkNQVXMgb2YgdGhlIHNhbWUgR3Vlc3QvVk0gcnVuIG9u
IHRoZSBzYW1lIEhvc3QgQ1BVLAo+IGhmZW5jZS52dm1hIG9ubHkgZmx1c2hlcyB0aGF0IEhvc3Qg
Q1BV4oCZcyBWUy1zdGFnZSBUTEIuIE90aGVyIEhvc3QgQ1BVcwo+IG1heSByZXRhaW4gc3RhbGUg
VlMtc3RhZ2UgZW50cmllcy4gV2hlbiBhIFZDUFUgbGF0ZXIgbWlncmF0ZXMgdG8gYQo+IGRpZmZl
cmVudCBIb3N0IENQVSwgaXQgY2FuIGhpdCB0aGVzZSBzdGFsZSBHVkEgdG8gR1BBIG1hcHBpbmdz
LCBjYXVzaW5nCj4gdW5leHBlY3RlZCBmYXVsdHMgaW4gdGhlIEd1ZXN0Lgo+Cj4gVG8gZml4IHRo
aXMsIGt2bV9yaXNjdl9nc3RhZ2Vfdm1pZF9zYW5pdGl6ZSgpIGlzIGV4dGVuZGVkIHRvIGZsdXNo
IGJvdGgKPiBHLXN0YWdlIGFuZCBWUy1zdGFnZSBUTEJzIHdoZW5ldmVyIGEgVkNQVSBtaWdyYXRl
cyB0byBhIGRpZmZlcmVudCBIb3N0IENQVS4KPiBUaGlzIGVuc3VyZXMgdGhhdCBubyBzdGFsZSBW
Uy1zdGFnZSBtYXBwaW5ncyByZW1haW4gYWZ0ZXIgVkNQVSBtaWdyYXRpb24uCj4KPiBGaXhlczog
OTJlNDUwNTA3ZDU2ICgiUklTQy1WOiBLVk06IENsZWFudXAgc3RhbGUgVExCIGVudHJpZXMgd2hl
biBob3N0IENQVSBjaGFuZ2VzIikKPiBTaWduZWQtb2ZmLWJ5OiBIdWkgTWluIE1pbmEgQ2hvdSA8
bWluYWNob3VAYW5kZXN0ZWNoLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBCZW4gWm9uZy1Zb3UgWGll
IDxiZW43MTdAYW5kZXN0ZWNoLmNvbT4KPiAtLS0KClRoZSB2dm1hIGZsdXNoIGlzIG5vdCBuZWNl
c3Nhcnkgb24gaW1wbGVtZW50YXRpb24gdGhhdCBoYXZlIGEgc2luZ2xlIFRMQgpmb3IgdGhlIGNv
bWJpbmVkIG1hcHBpbmcsIGJ1dCB0aGVyZSBpcyBubyBnb29kIHdheSBvZiBkZXRlY3RpbmcgdGhh
dCwKClJldmlld2VkLWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
