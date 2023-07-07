Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08730EB64D9
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 09:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CaA4XwuxVYtmbrPEoz+wGUdW1bIEnAzQ5+dYqqBeLlI=; b=EsygtDLZQB5jTi
	1kkNKx66y3GrIso80F2jX3eMkUpLYF3bxpUqvWknU9fY7Mp70a60y3CyVTMbY/AoCCw51ULeVIfoj
	YZeDEQlhBLAW7rePxNBFBeqz8/gYTmkwSsMl7RhpQcbzBRPHCyKgJwmzprkCFC+QvUv5FVuR/527x
	g369OE5yQpmQ3+haRmH3jp86ZtnlM9Of1VFt9cmGSnNix98CjKk0EHgLfona2CU9bL6xOxcWKh3e8
	Xn5nB1Iwe4WvfhPVD9eC4QrPjopcSK/AOa8JANDJG5K5S8S3Km9I+pozIOGnuFdg0lNMPM1rlWdhH
	Y8+UmkoatCdfyxBGjh7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHhPZ-004537-0I;
	Fri, 07 Jul 2023 09:05:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHhPV-00452e-2h
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 09:05:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 020A761728
	for <linux-riscv@lists.infradead.org>; Fri,  7 Jul 2023 09:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A65C433C7
	for <linux-riscv@lists.infradead.org>; Fri,  7 Jul 2023 09:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688720751;
	bh=H0Yt/QPOuhegMlQh9ZqHcbAamA4k9i0Srfd9+tbm1G8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=W3+6rzO3gycmSMa5K3TChyvfuaC0n5xFNnj7DjdoU9ViG/22ZL+Yojxuas4bgKP6o
	 EPkcSm9//+O9jQHZdgvkwiBEag1ETGerQMB7WJCfzi/42ew5+bGtIepCE3F/a3xkD+
	 Fhptx1VxTbkuhn6LnydTeJ9pO6cZcwu8lqMj1EQDP+frOa2xZojMIG3hyXf9IQf9mH
	 dltH53R2Ne3DdtQa3tPlkCjDNPzIlKLbqI7P8AXTyQAmmRDXVurSmw6myBRn1YRSyV
	 +Ro4DLLY4uNM/Cxv6ZgH0hVKwTTr0Lba6LfAEHY1Aat8HjCZrFQaTB09uB0dVoJGhO
	 zJ5hwYEwQeJvw==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-993a37b79e2so203353566b.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Jul 2023 02:05:51 -0700 (PDT)
X-Gm-Message-State: ABy/qLafiKSnKr8Rd+eHgei/XTGaC9rfeelChZ+OCzeoz00MXtq6XwR8
	o0e6pWM2fEWMfLJGoP+zzaF6lIaNZ04x/32P0rw=
X-Google-Smtp-Source: APBJJlEuZouujhN2y56xMmNiKy4pjpvqYoqlZXspGPUXtBJ0MuTM6vGwzHWe40UkOunICEVcugS+h9ary17Ji1pDclo=
X-Received: by 2002:a17:906:224d:b0:982:84c9:96c4 with SMTP id
 13-20020a170906224d00b0098284c996c4mr3557280ejr.10.1688720749510; Fri, 07 Jul
 2023 02:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230702095735.860-1-cuiyunhui@bytedance.com> <20230703-71f67eb66a037f5c0fb825c6@orel>
 <CAEEQ3w=7tBHyG=CvuktPN5cvfpY6ayamnbry6eOYxMDrPN+oZg@mail.gmail.com>
 <CANBLGcwcvK55dZ1__wvWCtcw=XoKt=qki8g6C_QYo+TBqqJ=TA@mail.gmail.com>
 <50F3BD62-78F1-456E-A44A-0C7D9A2D4113@jrtc27.com> <87bkgql8rq.fsf@all.your.base.are.belong.to.us>
 <CAEEQ3wnaaMvJ3=7udvAjiP3q36nvqAwb8sh34f+nO8Ua_83yFw@mail.gmail.com>
 <87sfa1toap.fsf@all.your.base.are.belong.to.us> <CAP6exY+gTSxU95nDK14z-Y1suKeXPkLzZ_BZqr-vRVGO9qmcxg@mail.gmail.com>
In-Reply-To: <CAP6exY+gTSxU95nDK14z-Y1suKeXPkLzZ_BZqr-vRVGO9qmcxg@mail.gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Fri, 7 Jul 2023 11:05:37 +0200
X-Gmail-Original-Message-ID: <CAJ+HfNjgS0XHzG5G_cCsyO-TKRA4Q=KFkwxMZ2httiRGRyuc+w@mail.gmail.com>
Message-ID: <CAJ+HfNjgS0XHzG5G_cCsyO-TKRA4Q=KFkwxMZ2httiRGRyuc+w@mail.gmail.com>
Subject: Re: [External] [PATCH v2 1/3] riscv: obtain ACPI RSDP from FFI.
To: ron minnich <rminnich@gmail.com>
Cc: =?UTF-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>, 
	Jessica Clarke <jrtc27@jrtc27.com>, Emil Renner Berthing <emil.renner.berthing@gmail.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, jdelvare@suse.com, 
	yc.hung@mediatek.com, angelogioacchino.delregno@collabora.com, 
	allen-kh.cheng@mediatek.com, pierre-louis.bossart@linux.intel.com, 
	tinghan.shen@mediatek.com, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-acpi@vger.kernel.org, geshijian@bytedance.com, weidong.wd@bytedance.com, 
	graf@amazon.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_020553_975227_E76214C8 
X-CRM114-Status: GOOD (  11.51  )
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

Um9uLAoKT24gVGh1LCA2IEp1bCAyMDIzIGF0IDE4OjM3LCByb24gbWlubmljaCA8cm1pbm5pY2hA
Z21haWwuY29tPiB3cm90ZToKCj4gSSdtIHRyeWluZyBoYXJkIG5vdCB0byBnZXQgc3Vja2VkIGlu
dG8gdGhpcyBhcmd1bWVudCwgYnV0IGl0IGlzLCBhdAo+IGxlYXN0LCBpbXBvbGl0ZSwgdG8gYWNj
dXNlIHVzIG9mIGVuZ2FnaW5nIGluIGhhbmQtd2F2ZXJ5LiBUaGVyZSdzCj4gcHJvYmFibHkgbW9y
ZSBVRUZJIGV4cGVydGlzZSBpbiBjb3JlYm9vdCBhbmQgb3JlYm9vdCB0aGFuIG1vc3QKPiBwbGFj
ZXMsIGFuZCB0aGF0J3MgcHJlY2lzZWx5IHdoeSB3ZSB3YW50IGEgbm9uLVVFRkkKPiBvcHRpb24u
IEZhbWlsaWFyaXR5IHdpdGggVUVGSSBkaWQgbm90IGJyZWVkIHJlc3BlY3QuCgpJZiBteSByZXBs
eSB3YXMgaW50ZXJwcmV0ZWQgYXMgcnVkZSwgcGxlYXNlIGFjY2VwdCBteSBhcG9sb2dpZXMuIFRo
YXQKd2FzIG5vdCBteSBpbnRlbnRpb24uCgo+IFNvIGNhbiB3ZSBnZXQgYmFjayB0byB0aGUgYnVz
aW5lc3MgYXQgaGFuZD8gYnl0ZWRhbmNlIG1heSBiZSB0aGUKPiBjb21wYW55IHByb3Bvc2luZyB0
aGlzIGNoYW5nZSwgYnV0IHRoZXkgYXJlIGNlcnRhaW5seSBub3QgdGhlIG9ubHkKPiBjb21wYW55
IGludGVyZXN0ZWQgaW4gc2VlaW5nIGl0IGhhcHBlbi4gQSBwcm9qZWN0IEknbSBpbnZvbHZlZCBp
bgo+IG5lZWRzIHRoaXMgd29yayB0byBnbyB0aHJvdWdoLgoKSSBub3RlZCB0aGF0IHRoZSBkaXNj
dXNzaW9uIGNvbnRpbnVlZCBmcm9tIEFyZCdzIHJlcGx5ICh3aGljaCwgbm8Kc3VycHJpc2UsIHJl
c29uYXRlcyB3aXRoIG15IHdvcmxkdmlldyA6LSkpOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1yaXNjdi9DQU1qMWtYRlpyZW4wUTE5RGltd1FhRVRDTHo2NEQ0YlpRQzVCMk49aTNTQVdI
eWdrVFFAbWFpbC5nbWFpbC5jb20vCkxldCdzIGNvbnRpbnVlIHRoZXJlLgoKCkJqw7ZybgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
