Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA561CDB474
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 08:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=apwQnah/zXKxVUI8u8IkHDOudebhlP2Jabjot1enYXs=; b=LanBbSpbFuPSlr
	vnblayo9kxKs/Q03gRvbekHNdn38e10l68m3Ih9wZPfmeNQQXedsT+j/FHacmUq+Ge2G2Ju2Duw9A
	jhqkG5OtgYfuzPWFYcob939q5gyLZdRKLu9L0a2al6pbRikCldgB/enXBi+3zTdH8ifXzAIN1OeV6
	DELKtP/vMhN/EQMK7+vS9YVMydacvB+8mrbLmKuEtTTQMMBgQ58XQlHiTOuJiClK0kOKx99CtHLRt
	xiF7d3rGiSUd2lhpAWlMZhyv/aMUveivjQJMndtFYldpE9v2FfAi2LR0SkWG1jDmpS4X6gBAxSdso
	Fb8BiRu7tVKlwYiOevbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsfkl-00Bj6D-2A;
	Tue, 17 Oct 2023 08:48:39 +0000
Received: from mail-yw1-f169.google.com ([209.85.128.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsfkj-00Bj5P-0H
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 08:48:38 +0000
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5a7ac4c3666so66655427b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 01:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697532515; x=1698137315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wdO2B9/QvvZjPAQkmDCzsWoJIs0Ay3wdYhcrR1VVXg=;
        b=SnuLKY1EkDhYg2QPffK01miZ5Y2n5iHngiBkSdcUmfM1wjEg9qD6FlAu8jpMCt4IDg
         B4D9SM56xvX62emn0Hg67Lp05/Z/DlUjWABUWtfA9Q+z3wepQrVjcH2s+eDvhI79XrXl
         anViLrkyHsLtOeeYXUI5WIyTLFmtmu+0D34Q12r1ASRL3XebBA3ckm5lGgSth5TObxe/
         sIKa2yK2X4JWGopZIlGIzP620OUDnO3ji0pHrv348Ub2pHQyMXbL4v7fDQIdhg+329FP
         ved2jeTU6LlqBveYO9IfHJmVysAlP+Uw2MJ09Glj+Dr4xbVCzxxc7mCJwGNhBnlTr87m
         RgWQ==
X-Gm-Message-State: AOJu0YxvpdTHQ+IqkggOYc8b82HfWVejjqQ7IBY4I6p79UI+WOKKG3jO
	3IyDE9noFyEI7CJ0SnDih2alyP/W3Ilnog==
X-Google-Smtp-Source: AGHT+IEIW/H9B4xW71dJEkBrDgKGPQp6tnz44SUO61dYM66MLwKkmmOjHNsiNTmG5AK9cEiofUUzOA==
X-Received: by 2002:a05:690c:387:b0:59b:ec11:7734 with SMTP id bh7-20020a05690c038700b0059bec117734mr1619118ywb.39.1697532515018;
        Tue, 17 Oct 2023 01:48:35 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id w205-20020a817bd6000000b005a42740fcd4sm445556ywc.94.2023.10.17.01.48.33
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 01:48:34 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5a7ac4c3666so66655167b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 01:48:33 -0700 (PDT)
X-Received: by 2002:a05:690c:dc8:b0:5a8:5079:422 with SMTP id
 db8-20020a05690c0dc800b005a850790422mr2326403ywb.26.1697532513384; Tue, 17
 Oct 2023 01:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-13-hch@lst.de>
In-Reply-To: <20231016054755.915155-13-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Oct 2023 10:48:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUgM1FMKSJcq4QD9Gc=B8XF7_jWxhm634bTYQ9a6voVhA@mail.gmail.com>
Message-ID: <CAMuHMdUgM1FMKSJcq4QD9Gc=B8XF7_jWxhm634bTYQ9a6voVhA@mail.gmail.com>
Subject: Re: [PATCH 12/12] m68k: remove unused includes from dma.c
To: Christoph Hellwig <hch@lst.de>
Cc: Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Conor Dooley <conor@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Jim Quinlan <james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_014837_127849_B0BC5A3B 
X-CRM114-Status: GOOD (  15.09  )
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

T24gTW9uLCBPY3QgMTYsIDIwMjMgYXQgNzo0OOKAr0FNIENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPiB3cm90ZToKPiBkbWEuYyBkb2Vzbid0IG5lZWQgbW9zdCBvZiB0aGUgaGVhZGVycyBp
dCBpbmNsdWRlcy4gIEFsc28gdGhlcmUgaXMKPiBubyBwb2ludCBpbiB1bmRlZmluaW5nIHRoZSBE
RUJVRyBzeW1ib2wgZ2l2ZW4gdGhhdCBpdCBpc24ndCB1c2VkCj4gYW55d2hlcmUgaW4gdGhpcyBz
bWFsbCBmaWxlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3Qu
ZGU+CgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9y
Zz4KQWNrZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+CgpH
cntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2Vl
cnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBn
ZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2hu
aWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5n
IHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtl
IHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
