Return-Path: <SRS0=4kw6=UD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB28C282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2019 14:37:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7172D2473C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2019 14:37:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hkv0dDOD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zwz6SgMY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7172D2473C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UE/9aT3iRxqhuZabxz+ebmiBdOadsCDFAtRun6wru8s=; b=Hkv0dDODcROTOI
	lJXPtfk74gwQb4SnxdvxGSPin6Nf2H6T5tMu5SLm707gf2OAtmbU+tqoBw7QdSIbPMYywrP27srjM
	DLGyFO1PVCTE+g+qzmR+2nFSkUJt5lABD9jfby+IqEF0cPZhJAaPlrL8MDpPRRA2wRj0oUnxlQou+
	It/84RFEkBvDfMRbnNNhrMARxkrQtOMTTgg1fmlN9nkmfoI3BC6lQXCgfDg2iYDDIGNbwqczZl5nl
	+eBIyTgkkJ/sQfPwuQ2sHdvtNvI/MzYYDwbmzJyLRx4hcptffpojEHJ95BBD7n72b5lZSmdENiBkR
	mKakzmIWq0Ulu6OecIww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYAYs-0001WX-S1; Tue, 04 Jun 2019 14:37:14 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYAYp-0001Rn-Mi
 for linux-riscv@lists.infradead.org; Tue, 04 Jun 2019 14:37:13 +0000
Received: by mail-wm1-x342.google.com with SMTP id u16so308060wmc.5
 for <linux-riscv@lists.infradead.org>; Tue, 04 Jun 2019 07:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=4BkP7vL18hh/Y2SYGfaK20f4ZMauMq57h6342TGfhGs=;
 b=zwz6SgMY3ch+xUVaDLBu8CesXxZYj8excN9ZvfYtO9uZjTtjKhvtwDPZ1Nu9AC1ttH
 nuHWUq+Xf8/Y66jY55H3hHAfYr118Omduae13KxQxUid/39xMjcymjuGI5BdstieMDhw
 SjFgxmqYNp+19t2UYhwSYl70IRKuqajNiu3fJ3GeR02OvaOw1LKwDD889i+aWsUfT5wT
 E5Col1tPqrpUpbOz7ILdjxhdMWGcjuz9kjPqCcIjcuP5AHXmaTFLBLzj1SWlfHa/f2bG
 2WtInzVZJ+H5jzA6gBai6HCAjAeMtP8VWcXRwqPWcSQhJCg+jbkoxwEECL+cYkhiVnum
 Endw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=4BkP7vL18hh/Y2SYGfaK20f4ZMauMq57h6342TGfhGs=;
 b=luu1odWIpOhAF1XP4HmULAnQGOp93mLVXHFX63PGkj62hNvcX50tMypNVaim1cXxbv
 KP5jhJjjf+MJODgb3zSpVYB9mgnu2akZu7CSn8uypDNhrxwKtJ4PsVXG0QhCNztEewn2
 58l9GV80nL5Ut3QEQ7IkK4UBBSIGcBVayeUBrXuF68YHEe4eEXCD++mBJebOskbgdgq7
 7P00leXmspqUggf4nBLbLuvQOJgsDIxUWS05c5oszYlZdOh35m9EM83RsdS/KyVyIT68
 EVXjAS4YxF9zSIaXuTKRf38W01Z/cyIhYZ3oAD2hT96V092kLz393twqZDM9mZi/JD3M
 Ey6g==
X-Gm-Message-State: APjAAAVx2nHIF9znhKM4T5OabIdSb3TwAwh9YUXh8Uo4abZpV+GKeiUB
 3t9/ER+dvIS0eGV50U0Kb5bfrQ==
X-Google-Smtp-Source: APXvYqxGadUkWTjW4QvcK05BF6VgFxTONXlpWUID2n0UK6pxnIxdvT5GzX5nOsiVPLz/AMK5qgbF8A==
X-Received: by 2002:a7b:c94a:: with SMTP id i10mr15828555wml.97.1559659029834; 
 Tue, 04 Jun 2019 07:37:09 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x129sm14348068wmg.44.2019.06.04.07.37.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 07:37:09 -0700 (PDT)
From: Loys Ollivier <lollivier@baylibre.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/5] arch: riscv: add support for building DTB files
 from DT source data
In-Reply-To: <20190602080500.31700-2-paul.walmsley@sifive.com>
References: <20190602080500.31700-1-paul.walmsley@sifive.com>
 <20190602080500.31700-2-paul.walmsley@sifive.com>
Date: Tue, 04 Jun 2019 16:37:07 +0200
Message-ID: <86v9xlh0x8.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190604_073711_969117_BCBF363F 
X-CRM114-Status: GOOD (  11.14  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Paul Walmsley <paul@pwsan.com>, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun 02 Jun 2019 at 01:04, Paul Walmsley <paul.walmsley@sifive.com> wrote:

> Similar to ARM64, add support for building DTB files from DT source
> data for RISC-V boards.
>
> This patch starts with the infrastructure needed for SiFive boards.
> Boards from other vendors would add support here in a similar form.
>
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> ---
>  arch/riscv/boot/dts/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/Makefile
>
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> new file mode 100644
> index 000000000000..dcc3ada78455
> --- /dev/null
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +subdir-y += sifive

Always build it ?
Any particular reason to drop ARCH_SIFIVE ?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
