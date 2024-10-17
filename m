Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82959D2F7D5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 05:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NOUaKeS6kV1qIjIj76QR0QpQFKXkaiT8JyUpzLzJLPY=; b=nWuEX4J3LNSRWc
	PjdLroRsbHWtblp989ueJz8lQWBkfVonfFZB9GP/FELM5ZqOi7nDQw8AitTEznMOULqBj1B14J5p1
	KcJtZ2RRpZ2TxvhYQAfCcmLsiQCMaCa3bAxQeUlx42T5iF1Q4yBNIceQTMuIRehS4zlrKqDbvpSzQ
	Tm0jbQ4ViVD3bm522LoT67DJI9iqpgPb5V92Pi8w/nxbt1ux8mtcEnQk62twPuQ0XHL9ycgBBJBZI
	2XJrvfICXr5dfz8i6mS58dHhzMVfCxHA3+w8aIURLvf+tn5RqBRGhX96YAJG5PnOahDa4xoOtSIgf
	gO8fKgvNE2DLx79NF1Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1JPI-0000000DoGJ-0nOg;
	Thu, 17 Oct 2024 05:50:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1JPE-0000000DoFh-422p
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 05:50:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F3793A434A8
	for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2024 05:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0AA4C4CECE
	for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2024 05:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729144239;
	bh=JgDkMC6FoSP2hVC7EEtLhLVF6K0lDCSNun1l9prB6GU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qjrMDMv6K21F8PZQRQ0Y9uMh8biN4Xtz7YCmtfPZqpO4n1FXL/HvFTOckwYrlzaEq
	 GVo6ra2yTvdMHvymxNIB72Bg2vubWik5dqhiMaH9n2at8Ap8wOWztvEtLDvP2k+BNW
	 EJp65bKkAbaqGeZoUf493wK7Ne7xLOlVvA0uqllsX+z1363mInlGNpqnRfCucEGAMH
	 PJ0NVf+orWPdpY0D3yZfzKI2NvvVMwrMVUeGfuTEgPxjOXi0UUfc2d/h5X42fagYPY
	 dXW7Ge9NyqOCrW7TFgFGmTFRyHxv0s0EmcxNiYhLmbyj8WhYsGQN1qT0YKb1ZEQ5KO
	 mc7uOSCqWJwcA==
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d58377339so507692f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 22:50:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6PS8I33B9dDRjoDwN8CDC5zTAPGULvHdYclyQAPWegKVSecwffbW93FxByv89ICB4Lrh5Obx6w5cRJw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0vlKQSEndg681jJAVTwQlmzDCOlnlJTtQC0KsXnDmOOSjKe4p
	WcL3npCnby/c3orD923u5h4G9lw62x5GhKRvCgG+WMvKAN0YxD9SR0qQ3siCCIjsjeonUhhOisY
	dUGdQEA+hdLfNynnrFd28Vr86KEU=
X-Google-Smtp-Source: AGHT+IH4bLUp2guSOMQGCAZrL1qd/E3kziiiLRFxl56U2a7Irdany/btpiZJz/ngAuGcQZeHHyKfhGn6rYH2Jqe02OE=
X-Received: by 2002:a05:6000:1faf:b0:374:c11c:c5ca with SMTP id
 ffacd0b85a97d-37d600d31e4mr19740821f8f.46.1729144238120; Wed, 16 Oct 2024
 22:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <20241016083625.136311-1-alexghiti@rivosinc.com> <20241016083625.136311-2-alexghiti@rivosinc.com>
In-Reply-To: <20241016083625.136311-2-alexghiti@rivosinc.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 17 Oct 2024 13:50:27 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRVfzfHeZ+pMBSbxQ3ovFiazJ7CDm-8ZcVHmKpaxZFdCw@mail.gmail.com>
Message-ID: <CAJF2gTRVfzfHeZ+pMBSbxQ3ovFiazJ7CDm-8ZcVHmKpaxZFdCw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: vdso: Prevent the compiler from inserting
 calls to memset()
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Vladimir Isaev <vladimir.isaev@syntacore.com>, 
	Roman Artemev <roman.artemev@syntacore.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_225041_084654_AE105FCE 
X-CRM114-Status: GOOD (  13.41  )
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

T24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgNDozN+KAr1BNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGUgY29tcGlsZXIgaXMgc21hcnQgZW5vdWdo
IHRvIGluc2VydCBhIGNhbGwgdG8gbWVtc2V0KCkgaW4KPiByaXNjdl92ZHNvX2dldF9jcHVzKCks
IHdoaWNoIGdlbmVyYXRlcyBhIGR5bmFtaWMgcmVsb2NhdGlvbi4KPgo+IFNvIHByZXZlbnQgdGhp
cyBieSB1c2luZyAtZm5vLWJ1aWx0aW4gb3B0aW9uLgo+Cj4gRml4ZXM6IGUyYzBjZGZiYTdmNiAo
IlJJU0MtVjogVXNlci1mYWNpbmcgQVBJIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+
IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4K
PiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZSB8IDEgKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC92ZHNvL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZQo+IGluZGV4
IDk2MGZlYjE1MjZjYS4uM2YxYzRiMmQwYjA2IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2Vy
bmVsL3Zkc28vTWFrZWZpbGUKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxl
Cj4gQEAgLTE4LDYgKzE4LDcgQEAgb2JqLXZkc28gPSAkKHBhdHN1YnN0ICUsICUubywgJCh2ZHNv
LXN5bXMpKSBub3RlLm8KPgo+ICBjY2ZsYWdzLXkgOj0gLWZuby1zdGFjay1wcm90ZWN0b3IKPiAg
Y2NmbGFncy15ICs9IC1ERElTQUJMRV9CUkFOQ0hfUFJPRklMSU5HCj4gK2NjZmxhZ3MteSArPSAt
Zm5vLWJ1aWx0aW4KTEdUTSEKUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3Jn
PgoKPgo+ICBpZm5lcSAoJChjLWdldHRpbWVvZmRheS15KSwpCj4gICAgQ0ZMQUdTX3ZnZXR0aW1l
b2ZkYXkubyArPSAtZlBJQyAtaW5jbHVkZSAkKGMtZ2V0dGltZW9mZGF5LXkpCj4gLS0KPiAyLjM5
LjIKPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
