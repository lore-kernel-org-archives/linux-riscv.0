Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872FDCE79AD
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 08:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmjoSYgsJtPBQa/iHwxZupikJEEr+9fFeCo/x1wK75E=; b=aU36MFsuTZMl1v
	oGxGqmSx0wMbHnNkq4BtHjVKQP38I77M2dEMyJTxrObFb9kHcyJN/9T3dro0E4we6xpFo2lWlVOZF
	QlVkSBp+5XFQqVGJZGArpv/sUyNuZ0iSg1DmvYVxomIbtP/xmQC7jKQuL0T44ZC3pz0tYll3WZlZL
	fqoujCsLrfXvCPBUrDHCO6CWcLgZ4yHD2mmTYVWq9/kEZAYGC/MR8zFYZXHRfqpKxrWzpdyc6n9b2
	ZJPD4IL/aEZbAAOiL8XF6+a1DuNhLqxHsm+LH0Xe0/eA/kN7AaHUZdnANFS2Vc/PldfnojeFsDtDG
	y+VrSX3VkXuEWeUj4Y2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qisE7-002EDB-0V;
	Wed, 20 Sep 2023 08:06:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qisE4-002EC7-0U
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 08:06:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1AB2761A6D
	for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 08:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22D0C433C7
	for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 08:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695197182;
	bh=hbkRSwtqknfZzbBxtOQPm/Rkx/c9bq3LLK5/SR9tbg4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UFI69/KWJ6BKobIvz9DqGXMj3sdUyuQ8R3Dtg6ijZLv951uB1FesbKe3kK9COvunc
	 UEdR5b89j6jXnmPXyyCgOOzerrixaxviivzAmsz7aoEFXDdRKmb4zjooQDfkqbSOmk
	 JnusihP36lJK/DxE9tVyvMKDEjbUInEVT0H1FnNOYo4z3mYPPcCSJlO9sf4+JQz4yM
	 IHyvfmSr82SJ3nhWkXNshf5rOxwB5ziHZEugNm1qN8EUMgOkzRM/gz3PP0yfzYdxGb
	 80FD98LOUgSlUn3jebxmxJfEiok6+hLDLhMcmJpCHxzDkfCKOn1ljI4wV/DToPlAAk
	 yBtXPUjsUpCow==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9936b3d0286so870544066b.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 01:06:22 -0700 (PDT)
X-Gm-Message-State: AOJu0YxWGGHbMeiWZkFt9/AoYPaABKqI08pSgpBwu7YqPf9LjKhU0/Od
	OYh9YSjQz7wByKTZzrvff1k0hL9OMSwG38Za2VY=
X-Google-Smtp-Source: AGHT+IGe2iP6JINAEB+mczmvizOEP6stOTmfWVD0FmvCA21rimzKtCLaNP7bv9zznAo/CO7ULxgc7OLk0np/ulX7HU4=
X-Received: by 2002:a17:906:d3:b0:9ae:375f:bf00 with SMTP id
 19-20020a17090600d300b009ae375fbf00mr1490393eji.62.1695197181403; Wed, 20 Sep
 2023 01:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695189879.git.wangchen20@iscas.ac.cn> <835006e5c76ba1c53eed1b7806a08ddea3390bc5.1695189879.git.wangchen20@iscas.ac.cn>
In-Reply-To: <835006e5c76ba1c53eed1b7806a08ddea3390bc5.1695189879.git.wangchen20@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 20 Sep 2023 16:06:09 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRi-R_bDSzsPi+Kkf46iT8DGdX0wEUM5L5AHqA=NU9GJQ@mail.gmail.com>
Message-ID: <CAJF2gTRi-R_bDSzsPi+Kkf46iT8DGdX0wEUM5L5AHqA=NU9GJQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] riscv: defconfig: enable SOPHGO SoC
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, 
	devicetree@vger.kernel.org, emil.renner.berthing@canonical.com, 
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, 
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_010624_231345_C8450A87 
X-CRM114-Status: GOOD (  14.49  )
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

T24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgMjo0MeKAr1BNIENoZW4gV2FuZyA8dW5pY29ybnh3QGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBFbmFibGUgU09QSEdPIFNvQyBjb25maWcgaW4gZGVmY29uZmln
IHRvIGFsbG93IHRoZSBkZWZhdWx0Cj4gdXBzdHJlYW0ga2VybmVsIHRvIGJvb3Qgb24gTWlsay1W
IFBpb25lZXIgYm9hcmQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFdhbmcgPHdhbmdjaGVuMjBA
aXNjYXMuYWMuY24+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcgfCAxICsK
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9jb25maWdzL2RlZmNvbmZpZyBiL2FyY2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcKPiBp
bmRleCBhYjg2ZWMzYjllYWIuLmJmNzM3Y2ZhMWQyYyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2NvbmZpZ3MvZGVmY29uZmlnCj4gKysrIGIvYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZwo+
IEBAIC0zMiw2ICszMiw3IEBAIENPTkZJR19TT0NfU0lGSVZFPXkKPiAgQ09ORklHX1NPQ19TVEFS
RklWRT15Cj4gIENPTkZJR19BUkNIX1NVTlhJPXkKPiAgQ09ORklHX1NPQ19WSVJUPXkKPiArQ09O
RklHX0FSQ0hfU09QSEdPPXkKPiAgQ09ORklHX1NNUD15Cj4gIENPTkZJR19IT1RQTFVHX0NQVT15
Cj4gIENPTkZJR19QTT15Cj4gLS0KPiAyLjI1LjEKPgpMR1RNCgpSZXZpZXdlZC1ieTogR3VvIFJl
biA8Z3VvcmVuQGtlcm5lbC5vcmc+CgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
