Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A8CC636CD
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 03:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G+C6Kc1CYreu7I/asd0XqqXelIpKvldgZWnIl41gdhQ=; b=MJh/v78VjCuZVI
	+vmnJL0Ykk4kh5rN1IubdStTJKFbjmTu/nx5tMyOW7RBu5CUzcbeK+7RtUaHk6Wv/KOL6D83LBXpx
	oUj5wSuQkSspu7h3tQ9TiuAWF4egrjMDAkdh4vAdXh9WXcYDlWbW0oW6RWMIdEJKi7He12jBLgBMq
	WKiTMMTAQOAj6QuZzK/5VbhdAW1fxXl6ScJI222ctgAnDNMRctUkUrBafG0Fd27yaCjqdWgVvfUka
	+PjyDLoO5wOQfjel8GstIQlPAbKCzhOVC8c86gvBLyK6cFBDWRroph6uQ1FgxJUr29VenljpjFFeu
	n3rDqH33OjoJEh+ITtRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOrtn-007FF5-MA; Mon, 06 Feb 2023 03:10:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOrtk-007FEg-B9
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 03:10:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 24F1F60C13
	for <linux-riscv@lists.infradead.org>; Mon,  6 Feb 2023 03:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16328C433A8
	for <linux-riscv@lists.infradead.org>; Mon,  6 Feb 2023 03:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675653026;
	bh=nqhet8AEH/ERw6EgCSei5hYnW8DmeRHxsYNumUSvwbY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Djrdlt17tFAs5kmQ+hq2mmen6079HT9RIn+DVBPGhaKD2U4E9s+l8LnlkBCnWPMnf
	 VMQ4nyV5WLWGr6S2SdjOvyJhNFb0hdBYeyZxEjqAteA70KsleXKjcU2GgyVaS83+7q
	 PiaixkvbVNpcEbIeQ1luetuniK0Ji5D4gZYfMeZeRponPvL5eM5Zsm6zOWrVyQNvcf
	 utaYB0C8DWpbnE0yalhhOtDSExEzvWHQTQ1QXFs6GR40Qo+vDx7SBAojCZi30aaZdn
	 wkstLxVYLQ/0xACODjamM9e8fjLIZhDGrKzkEf0QFMiKiZ/5JvI2XArlwK3XwT35We
	 NTe5ddkcOuYfA==
Received: by mail-ej1-f48.google.com with SMTP id mc11so30425231ejb.10
        for <linux-riscv@lists.infradead.org>; Sun, 05 Feb 2023 19:10:26 -0800 (PST)
X-Gm-Message-State: AO0yUKVLwneHh+XFLnPMZOcCvtPfKbYoD+CjFY8t59kHObDGVAqbqzNj
	oYfyhuJxBY6G4n3PDoPPE1oJJCkx9lNDLzN71XY=
X-Google-Smtp-Source: AK7set/MwuNHj3cEDBq/n80X1OTFxhSGWKa4ldcgofmG5jw+SyQf1PSEiXQXk+siHZwTVsRqsSrlncJkMA1Ypzks4JM=
X-Received: by 2002:a17:906:8419:b0:884:c19c:7c6 with SMTP id
 n25-20020a170906841900b00884c19c07c6mr4723974ejx.120.1675653024117; Sun, 05
 Feb 2023 19:10:24 -0800 (PST)
MIME-Version: 1.0
References: <20230201064608.3486136-1-guoren@kernel.org> <87tu05pvur.fsf@all.your.base.are.belong.to.us>
 <CAJF2gTSj12E9+peMF0rNY_psGDyEG5BbMY6V-s4dK0FpkCC9Yw@mail.gmail.com>
 <87cz6s75ze.fsf@all.your.base.are.belong.to.us> <5C373F4A-983E-4ACA-AAB0-54E629D5F501@jrtc27.com>
 <878rhgrv6a.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <878rhgrv6a.fsf@all.your.base.are.belong.to.us>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 6 Feb 2023 11:10:12 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTuva2HmoJymP1atfKxudS67XY8pygukgEH98D=o3dwUw@mail.gmail.com>
Message-ID: <CAJF2gTTuva2HmoJymP1atfKxudS67XY8pygukgEH98D=o3dwUw@mail.gmail.com>
Subject: Re: [PATCH] riscv: kprobe: Fixup misaligned load text
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, liaochang1@huawei.com, 
	linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Guo Ren <guoren@linux.alibaba.com>, 
	Bjorn Topel <bjorn.topel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230205_191028_462219_AF66424C 
X-CRM114-Status: GOOD (  10.07  )
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

T24gVGh1LCBGZWIgMiwgMjAyMyBhdCAxMDozNiBQTSBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdAanJ0YzI3LmNvbT4gd3Jp
dGVzOgo+Cj4gPj4gKyAgICBwLT5vcGNvZGUgPSAqaW5zbisrOwo+ID4+ICsgICAgaWYgKEdFVF9J
TlNOX0xFTkdUSChwLT5vcGNvZGUpID09IDQpCj4gPj4gKyAgICAgICAgICAgIHAtPm9wY29kZSB8
PSAqaW5zbiA8PCAxNjsKPiA+Cj4gPiAqaW5zbiBnZXRzIHByb21vdGVkIHRvIGludCBub3QgdW5z
aWduZWQgc28gdGhpcyBpcyBVQiBpZiBiaXQgMTUgaXMgc2V0Lgo+Cj4gVWdoLiBHb29kIGNhdGNo
ISBJIGd1ZXNzIHdlIGNhbid0IGdldCByaWQgb2YgKnRoYXQqIGV4cGxpY2l0IGNhc3QgdG8KPiBr
cHJvYmVfb3Bjb2RlX3QgaGVyZS4uLgpIaSBCam9ybiAmIEplc3NpY2EsClRoeCBmb3IgcmV2aWV3
aW5nLgoKVGhlIG5ldyB2ZXJzaW9uIGNhbWUgb3V0OgpodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1yaXNjdi8yMDIzMDIwNDA2MzUzMS43NDAyMjAtMS1ndW9yZW5Aa2VybmVsLm9yZy8KCgoK
CgotLQpCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
