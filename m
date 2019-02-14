Return-Path: <SRS0=J1nd=QV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C227C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 08:12:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D2202229F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 08:12:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e9Akiz19"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D2202229F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GhkL722Ds083FG8j+4APxBs/+5+GCfi7G3NJj/egMIM=; b=e9Akiz19r2O5T5
	NI67VscK6UWxxTDHA3cpxMg3EMr/HPIfOjnkWm07pKOOvCi3pTbhPP32pzLN1iwTE4fxAv33mL6iQ
	UN6QQeLwAYzRRZQqeD579PSD8Wk+dfMK3Dz+oVq0dU/dEoxVjy+ms70aLhIVL/RLr2bvWWnh4IuBK
	O1FMvwqPPJIbYuEkQGYhtImpCQYhERZR8QtR+lMqw2PmzhxUK20b4qT1PZB5NM7nHFwAWH5ahubDx
	J9VXXHZXDXe/wg4bBKVUje+hWUQLjeEhmSdZj+cMJeW2wbHkUr0e5Lot8OFdtcvXTp0YLKRH4YkyH
	hTiVAuriwDvr35ijhMTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guC85-00031J-Uq; Thu, 14 Feb 2019 08:12:21 +0000
Received: from mail-ua1-f68.google.com ([209.85.222.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guC83-00030Z-Pv
 for linux-riscv@lists.infradead.org; Thu, 14 Feb 2019 08:12:21 +0000
Received: by mail-ua1-f68.google.com with SMTP id j8so1715912uae.13
 for <linux-riscv@lists.infradead.org>; Thu, 14 Feb 2019 00:12:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gyhVZT2cvH02qo+0nGpWrG/zXh7SGwoDkx6XeIiXPzo=;
 b=FeLHI6dx8SOYbXlOmCb3iLtvAmR9Cye6OmWdbqsBJ6DZlOAo0tRAwh2C5l6ymRadV7
 rAVY7BnHF1JFWeCNKmSAjDVBhEaMlJpVpgO+ux2dbf6aZ6fvfJjsCkjRJgEaj5cY3tbL
 KFiX71X5WCkMpz9v2RdnpQezFMzymKPH/KVbH7JGhRkCLdABXZ10Nzjzlpm1xG7/pQGE
 FF+ZSlwqNw94HZien2K4sJq5lxlZqdZxhx3LA1UW4tu9g3RTusM2QrmMoP2OJ/ZZBhVP
 JQssn1YNItu04fvDaf1s8jQV3GHKBXsofuszZOQUFWoacvCrGwaf0z5bErWhpTq1L4wZ
 7P+w==
X-Gm-Message-State: AHQUAubjyOQZT7KS53mTK9WA17CLaJA+FvUHAu1gvVMud+AapPQQi4VT
 8PVR/S9o+7RMy/TD+2ISiFTqvbiys0psdLNn0BI=
X-Google-Smtp-Source: AHgI3IZarNBxgZqVSOHbG6fu5WSACF5VlsCI/qxhQmwcEzw1zAysB+AexGAtBhb6oMJQSg01PbRqjo2LsHbPzEA6iy4=
X-Received: by 2002:ab0:210e:: with SMTP id d14mr1341942ual.20.1550131938902; 
 Thu, 14 Feb 2019 00:12:18 -0800 (PST)
MIME-Version: 1.0
References: <20190213174005.28785-1-hch@lst.de>
 <20190213174005.28785-10-hch@lst.de>
In-Reply-To: <20190213174005.28785-10-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Feb 2019 09:12:07 +0100
Message-ID: <CAMuHMdUX=dq49b08UUxkLCn+HikUBOEs29314fYbwregfrSEqg@mail.gmail.com>
Subject: Re: [PATCH 09/11] lib: consolidate the GENERIC_CSUM symbol
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_001219_840027_D19726DB 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-xtensa@linux-xtensa.org, linux-s390 <linux-s390@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-riscv@lists.infradead.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 14, 2019 at 3:25 AM Christoph Hellwig <hch@lst.de> wrote:
> Add one definition to lib/Kconfig and let the architectures
> select if it supported.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

>  arch/m68k/Kconfig       | 3 ---

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
