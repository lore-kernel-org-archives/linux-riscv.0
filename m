Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B4EC00528
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 20:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CuBcZcjnn8scpnEBpNz4u0sWYsACLa5An59g3Gniw3c=; b=Kdmso/NQXdoKWd
	h7g1qJ8kLYUFEGU2ly5vgnDhyYYS+KtgzSRvbAg6crl3B9ebe4cCPsTgCEAk7fBJ2QqPg2r1k3226
	+qd6jzdbgeSvP+Left/0x8A4Oo9xTg2eP0UZqjgmnuBI4RxS3egTJbHkMakk858QhO45stMY581KP
	rgA8Iw3AKn29lzbVWd1hDR8AhSeZdgdY9Jwl0HeHwakO5mpmLP5LVt8D9O5IR12pbBnf8Il3MK1ns
	FXqmOSSx2O1l3IBLDdTEQy2vj4R5g7MTobTPEQVjRHHVdi31nrhlCviJ6Be4UzecZumKtey2ns1P1
	A4jdKYi4392GGsNu9IaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQZck-00HIfb-0u;
	Mon, 31 Jul 2023 20:36:14 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQZce-00HIcU-1O
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 20:36:12 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-407db3e9669so19791cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 13:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690835765; x=1691440565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WbRt22akgzv4PmYRoTv7Z60VgxgxYtdGWVmvWN3QQU=;
        b=S48GXM2S/zOssa/4HGYWA/fi14zXxpeMV2F4C7CVir22G8F1rsCFPMpbbATKKTGtDB
         64U04V9zqc3NX/KcDqqznzevwdH+LBQzjjWkXhUJhWjREYzmjnwgZfC3FYc5IrYNUBlm
         LY/EUvpLCfaeKdgtW8bCez7DItwI3/PYoIvy7INGK7YD0YSomsBbivsNBTVfKNu4nBdo
         xivL5QLBIY+NVve5Wz1jLiXbHQ5tlLXN7oYO0s/LfS46XwncPU8xO8zWDxBIMO3Easl+
         guS7RQ3/hKev8L86c/bpFnn92PLQF1TIWg60T0w21WW/l5BAv1hI0kYaSnXEA5R3MsmC
         +C9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690835765; x=1691440565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WbRt22akgzv4PmYRoTv7Z60VgxgxYtdGWVmvWN3QQU=;
        b=fdw1E5iNxpTROEgokwcQBq5G4WgKvmqtwIEmAYQpn+N/8EGYk31L/UAxobItP0+DlD
         hVLtYR03ZlID4XN0Ta33QeprGhZT5ooREOeVaZ90wNyK8oNZ2wOGX6P1acRhV8qU4WoT
         8YznurrOb74I90uBSMd2Dd6I1t97ydTC+Ze3K8n4YGAulIK0VEn5PEDgZSd2Dzy78dQP
         PBcUFVJXnDq9U1cVNfmJd/ixnNw85rqtTMasVMM0iJWeilGvAg4/FyItt8Mx0cGuIE2O
         k0xD3hii8ycchjHNwQFhgo8SlPkq23HV0ftIoS7Td1yNiDzquq+gJ/2n6BoJf+e/dTZs
         kmXw==
X-Gm-Message-State: ABy/qLY6ZryFswoUX0k5wQdqPc+e8cqa3du3nzPw2r3/r8G8OmjU/pdc
	CoEkGxqkDqXNvMOfbj5m7qY5LhK4lvnD+C408jq0ww==
X-Google-Smtp-Source: APBJJlEmoOsErptso+JLUNi7GHGxX5qEgT6biVyV0lbNK73KMKgCiYEb0JJeNHAmZZOJJPW+PoidP5ENk119vh3duf0=
X-Received: by 2002:ac8:7f02:0:b0:407:4aa8:c5ba with SMTP id
 f2-20020ac87f02000000b004074aa8c5bamr366494qtk.14.1690835765004; Mon, 31 Jul
 2023 13:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230729004144.1054885-1-seanjc@google.com>
In-Reply-To: <20230729004144.1054885-1-seanjc@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Mon, 31 Jul 2023 14:35:29 -0600
Message-ID: <CAOUHufaK1zibYzOxUGWgYatLnts+fOG6X8fBAwtGA_S6cdDxMw@mail.gmail.com>
Subject: Re: [PATCH] KVM: Wrap kvm_{gfn,hva}_range.pte in a per-action union
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_133608_469827_2534214F 
X-CRM114-Status: GOOD (  10.00  )
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

T24gRnJpLCBKdWwgMjgsIDIwMjMgYXQgNjo0MeKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IFdyYXAga3ZtX3tnZm4saHZhfV9yYW5nZS5wdGUg
aW4gYSB1bmlvbiBzbyB0aGF0IGZ1dHVyZSBub3RpZmllciBldmVudHMgY2FuCj4gcGFzcyBldmVu
dCBzcGVjaWZpYyBpbmZvcm1hdGlvbiB1cCBhbmQgZG93biB0aGUgc3RhY2sgd2l0aG91dCBuZWVk
aW5nIHRvCj4gY29uc3RhbnRseSBleHBhbmQgYW5kIGNodXJuIHRoZSBBUElzLiAgTG9ja2xlc3Mg
YWdpbmcgb2YgU1BURXMgd2lsbCBwYXNzCj4gYXJvdW5kIGEgYml0bWFwLCBhbmQgc3VwcG9ydCBm
b3IgbWVtb3J5IGF0dHJpYnV0ZXMgd2lsbCBwYXNzIGFyb3VuZCB0aGUKPiBuZXcgYXR0cmlidXRl
cyBmb3IgdGhlIHJhbmdlLgo+Cj4gQWRkIGEgIktWTV9OT19BUkciIHBsYWNlaG9sZGVyIHRvIHNp
bXBsaWZ5IGhhbmRsaW5nIGV2ZW50cyB3aXRob3V0IGFuCj4gYXJndW1lbnQgKGNyZWF0aW5nIGEg
ZHVtbXkgdW5pb24gdmFyaWFibGUgaXMgbWlkbHkgYW5ub3lpbmcpLgo+Cj4gT3Bwb3J0dW5zdGlj
YWxseSBkcm9wIGV4cGxpY2l0IHplcm8taW5pdGlhbGl6YXRpb24gb2YgdGhlICJwdGUiIGZpZWxk
LCBhcwo+IG9taXR0aW5nIHRoZSBmaWVsZCAobm93IGEgdW5pb24pIGhhcyB0aGUgc2FtZSBlZmZl
Y3QuCj4KPiBDYzogWXUgWmhhbyA8eXV6aGFvQGdvb2dsZS5jb20+Cj4gTGluazogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsL0NBT1VIdWZhZ2tkMkprM19IclZvRkZwdFJYTT1oWDJDVjhmK00t
ZGthLWhKVTRiUDhrd0BtYWlsLmdtYWlsLmNvbQo+IFNpZ25lZC1vZmYtYnk6IFNlYW4gQ2hyaXN0
b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgoKQWNrZWQtYnk6IFl1IFpoYW8gPHl1emhhb0Bn
b29nbGUuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
