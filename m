Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77350E77197
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 18:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gch78HRWe7C73edhM4GK0wD/jELQ9d/NKaS1M/YEUU4=; b=jMSBAtcPgEPWXv
	utKeTJcRlP3xz42GpfwR9sYdY1FURjJLyNYGpNHKHq4SeeAtOfwuwcEyxesG/R5TRlWgevhA/n1p6
	AoR2CZo8HrlAL3x7XhkFM77PEOR0I6Mu1J4i4YP48VEqegDQXnA2IQuqCQ+3XeZBnkgAaQxhOaI/N
	hwEn0/T5vlEWjku5XvrCcGA8Z+POVX2yj+uGQSPS3cdX8UJFSZ9STnRZKo63lRbzxzGX3QOF2DE1G
	WLl1dod5TdV2pItVxVA3dbjb8kLMD/JZouDU2T1wfwfoXB4CJcQaXJ8qhTXLdHYJzz6h/KkbS5Py/
	IxAlV4Kz0D+udYWfgp1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwwD-0000000CwLp-39jm;
	Thu, 09 Jan 2025 18:07:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwuz-0000000Cw4v-1JNV;
	Thu, 09 Jan 2025 18:06:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8FA88A4253A;
	Thu,  9 Jan 2025 18:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA89AC4CED2;
	Thu,  9 Jan 2025 18:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736445963;
	bh=rp9xKD+8m1msQ0xxbCs9oZzFyU1GURrqUZhq3NbpvyQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hXJVC9TEna9TWYKbS9F02aIUvOHalq4E7m1+cvMk0ArDdbnyNkOQeESQ7Ur7QTEYq
	 oV3fJnNHiU6ugTU9/tuOjHdJ9qaR831jsML8BcJ2B2+uzRQfA4kpmr3AmZ+XqRvw70
	 BTN8HX8ggLtR2WOIhN2X2Ipa4OKa5qs1wwTNGfy1p+9su4jHqsiWIAwGFmgaxU7Nfw
	 H9Abn1fQ/2SPP2QU6lVw0EYHITfjtwSWp9wIQJbaVZRVNv4TDYE1jWwRNuescPEqI8
	 vYK392uOFALwuMqP1HoC1bERclFcBuYV7fmAeGJqkaXECHPwUoHQw9LVho0fFgK9tk
	 fJ+fXn+JQWXLQ==
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-84ceaf2667aso76226639f.3;
        Thu, 09 Jan 2025 10:06:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUh3/TaDryMy96Ctb0nKux1KhLBkgpyNliwkqrQ2kA9Pgl1s3JeAAv0VuucTjWXB1Sz23u2Ub++1M9m5xC9r2uUmA==@lists.infradead.org, AJvYcCVbcE+PIo0iD7rKr/89BzN0IFDiOkHim47pDBLxVcB6UwJ5C4TxIvL0Od7vQGRQIIwQKeQ3J60GDpp0yvg=@lists.infradead.org, AJvYcCXu6yyt99u8V/gpDWSzYkNddSjLWXfCYKPGdBKQ6mZjpw3QbVv9oQQafEa4D9lDDQCK/BD+Mw==@lists.infradead.org
X-Gm-Message-State: AOJu0YykZZGg4hITuEN3+ZPZq8oo2LeOrwEEU4R7jTNaPMhRDzc9zo4c
	gi6Kn+0yU1X7MQInQuq02VxUlkgMQlYtwIldlVOaE+wBZVs7QV1tBp71j5mMfNmWX1DlP69yqZL
	UpDXrJbL3PS7E/S6gBo+gXBOGTo0=
X-Google-Smtp-Source: AGHT+IHw82IqZn0L3vIWI2GRAE2/Fu1vkOzFuTOkK3ccul7HxPp7E2ac95iMCNTUN8mztI4YyZ2Kf9FZUsicSlonzfg=
X-Received: by 2002:a05:6e02:3048:b0:3a7:6a98:3fdf with SMTP id
 e9e14a558f8ab-3ce3a9da817mr60484875ab.14.1736445963152; Thu, 09 Jan 2025
 10:06:03 -0800 (PST)
MIME-Version: 1.0
References: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
In-Reply-To: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 9 Jan 2025 10:05:51 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5zpA28gkBQYMMuYCUbnDzdeq4pHsd0Mx=PBnDPiHKqHw@mail.gmail.com>
X-Gm-Features: AbW1kvZZD8oqcdTZ9DXv7tEUC7bpyqeBsuw6nnhXboAE2kNg_1eTiibnv93HXj8
Message-ID: <CAPhsuW5zpA28gkBQYMMuYCUbnDzdeq4pHsd0Mx=PBnDPiHKqHw@mail.gmail.com>
Subject: Re: [PATCH] treewide: const qualify ctl_tables where applicable
To: Joel Granados <joel.granados@kernel.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev, 
	codalist@coda.cs.cmu.edu, linux-mm@kvack.org, linux-nfs@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, fsverity@lists.linux.dev, 
	linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org, 
	kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com, 
	linux-security-module@vger.kernel.org, keyrings@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_100605_476314_89F4B2FD 
X-CRM114-Status: UNSURE (   5.09  )
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

T24gVGh1LCBKYW4gOSwgMjAyNSBhdCA1OjE24oCvQU0gSm9lbCBHcmFuYWRvcyA8am9lbC5ncmFu
YWRvc0BrZXJuZWwub3JnPiB3cm90ZToKPgpbLi4uXQo+ICBkcml2ZXJzL2Jhc2UvZmlybXdhcmVf
bG9hZGVyL2ZhbGxiYWNrX3RhYmxlLmMgfCAyICstCj4gIGRyaXZlcnMvY2Ryb20vY2Ryb20uYyAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9jaGFyL2hwZXQuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL2NoYXIvaXBtaS9pcG1pX3Bv
d2Vyb2ZmLmMgICAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvY2hhci9yYW5kb20uYyAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9w
ZXJmLmMgICAgICAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfb2JzZXJ2
YXRpb24uYyAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvaHYvaHZfY29tbW9uLmMgICAgICAg
ICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvaXdjbS5j
ICAgICAgICAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL2luZmluaWJhbmQvY29yZS91Y21hLmMg
ICAgICAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvbWFjaW50b3NoL21hY19oaWQuYyAgICAg
ICAgICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9tZC9tZC5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMiArLQoKRm9yIG1kIGJpdHM6CgpSZXZpZXdlZC1ieTogU29uZyBMaXUg
PHNvbmdAa2VybmVsLm9yZz4KClRoYW5rcywKU29uZwoKWy4uLl0KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
