Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F2BC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 09:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+TuJX6Ng9HXg/jnFobgEJEGOmEfDB7XtwGfBkb31tck=; b=UdRDFJ8SCd4IHw
	hJyCd9s/1vNLQN0IK9K1iCQU7DmPdzbcVaKV71WanfZp7r2ECrlOU+ZElbffjX3XpJcvhkMgNvWjb
	cSS+1wfQ5bLbGQpv6prJSx49TQVUukK7S8RgC+VBOaiyNYTLKxN+CA+phn7qJvfsx9TZ9cMWd0YTP
	iDVpWHF/Y8r8TfjOT0eIBmLpUha50vDPPlbDCNcqQditOXYc9w35aPs6JoRGaTy3e6S4abd5W0fFA
	t5iyCyJxjeEhrHFh+4Motlr/llmp4ntj/pmCSJXTVU7Wx0C/RDqo/hmkwbIkdfXv3TneoCAOq3XPp
	zb8hnrkOVY2HCysr9PuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neZ5O-000GgM-Bs; Wed, 13 Apr 2022 09:14:50 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neZ5L-000Gf8-Ou
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 09:14:49 +0000
Received: by mail-wr1-x431.google.com with SMTP id p18so844930wru.5
 for <linux-riscv@lists.infradead.org>; Wed, 13 Apr 2022 02:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K3wssubFNSH7PhBBCoCTd/2JMEvbfGH2Qx2/SYbOnME=;
 b=nz8vYJU3FhQmjoV7Y8KclGI8GnSjXDec3FDL3g1rX5pofcO/KvkzzyTHQDXGDHYnph
 Ua0QxEZmhNmjNprfDUWQwcy6537deH/arJYaGceRm6jBXL92DcMmVflhOdGCuDDTSBT4
 M2SxpThCS3VmQFUbGJFOvqawKqsT4GBPVDeEQUmX1JZUypCcDKCMCNcB4Ho+3d5fViD1
 s6tbqC8oGDFAROfHZsDTZc+bvH4CFVJuyMm0MDz6X1zq7cG05qExNJtkZn/sHiS9JBjh
 cDZIrYdDzoxJP+8Dj6TxBKIMznMRrYAs1ValFnfuuRJo+BT+bMU38p2DZSQj+4RlJKyh
 IUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K3wssubFNSH7PhBBCoCTd/2JMEvbfGH2Qx2/SYbOnME=;
 b=jgWBeT/tbWOaeDpBVrQRn0AhqJakyhpCyTfeUyzXLcL/HyF02rfNpJ5ZUF28EvErEf
 +w/crmx9PqNrcIv+/xv9dfL7w15yse7TTJYdgnt/Xqz1tsfo//1JH9uSpGhOMeQhGcsM
 iRl5E71prnxggbuFrLzHNMAD7rs4760gsvyG3hNjlsgPrK7RBTSZLa0vdCFthStDQOAF
 gmUJO5RNJ65wYjpMMQkLd+rXMhxZpnSUv97TuTFizKPrpazQIOnNnGgBfUB3d6oEZkjt
 PA+uoouspiZaqTWfi+ZJBnnckF4VHnZhuKkzioLmyHQu31UUvnEWrybsSA5frR2vKZnh
 FfOw==
X-Gm-Message-State: AOAM531yDy1dT2pUIoNd8xMMRF5jXF8vx0it4Kp4+f/FrVwr4otyyrn6
 DzdS5IJfxnB739wtelP73nDLzkAs2F7EqBnGdZy9Jw==
X-Google-Smtp-Source: ABdhPJwa1Z41m1QvtVzrKDmKI/ngC+L9la6nwqhud5QEuhIRlRUZ8acL6wKbDnw3aTqQ55EF4dZSO1sKMY26X6t52tc=
X-Received: by 2002:adf:e84a:0:b0:207:a697:462c with SMTP id
 d10-20020adfe84a000000b00207a697462cmr11108107wrn.312.1649841286170; Wed, 13
 Apr 2022 02:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220413030307.133807-1-heiko@sntech.de>
 <20220413030307.133807-11-heiko@sntech.de>
In-Reply-To: <20220413030307.133807-11-heiko@sntech.de>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Wed, 13 Apr 2022 11:14:34 +0200
Message-ID: <CAAeLtUDtv+Xh_A1G_cyWEGayrAhY3vQ6WaE09NjJL+vmJc6GLw@mail.gmail.com>
Subject: Re: [PATCH v9 10/12] riscv: remove FIXMAP_PAGE_IO and fall back to
 its default value
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 wefu@redhat.com, liush@allwinnertech.com, guoren@kernel.org, 
 atishp@atishpatra.org, anup@brainfault.org, drew@beagleboard.org, hch@lst.de, 
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech, gfavor@ventanamicro.com, 
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com, 
 mick@ics.forth.gr, allen.baum@esperantotech.com, jscheid@ventanamicro.com, 
 rtrauben@gmail.com, samuel@sholland.org, cmuellner@linux.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_021447_849886_260A080B 
X-CRM114-Status: UNSURE (   8.05  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 13 Apr 2022 at 05:05, Heiko Stuebner <heiko@sntech.de> wrote:
>
> If not defined in the arch, FIXMAP_PAGE_IO defaults to PAGE_KERNEL_IO,
> which we defined when adding the svpbmt implementation.
>
> So drop the FIXMAP_PAGE_IO riscv define.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
