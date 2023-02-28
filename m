Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E946CC64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 15:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x4X8y/MLNNlIq3qjOmVgE6Mkx4Sd8BIaOr8zv4X4DMs=; b=hUKGy8FAfhHzzS
	wbwGym+LUH3EQxb21KyakR3A1B3WOmRXTgjeFUvXPOVo0+A067HKbodTiZIgyfAy+kr8FO3jmiv9i
	ZkDDqfGulIVsqf2J2nnXuQelbxHS7yS/C+W7bDWuDgGaAyBbsY1v1lu4tOR0zCGLrNVhNIUpy+Qea
	DE8SyaCRIf19lSgNgLHluQghWD4gZLvGQQJ3KlZKSQwvX7GQswnFHzOoaBC/0dZOEdimysFz490tv
	btrP7ly9wwMbZQ7MDANuy7HE1Ghge6+vIX5BWaNRvce43rP/QrbJYzSHnr/SY5YbswAJgSO/ZJzzh
	xbNKczPw675stH0wQEFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX1Sv-00DaDW-Im; Tue, 28 Feb 2023 15:00:29 +0000
Received: from mail-qt1-f171.google.com ([209.85.160.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX0Ks-00DKNW-2J
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 13:48:07 +0000
Received: by mail-qt1-f171.google.com with SMTP id l13so10437409qtv.3
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 05:48:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByVxdS/basDlCycjFYWHfawf1ZvBXNewjczRvauznmY=;
        b=RA2Kb/hggGj29iyvko8LLJTaijXTvhSQKzTKKJZq5Xd5knUxuDb2qgTl68oTKj7wHY
         hbKrHZ4W7jTKyM9z+tqhzqMw+jCVAw5ZNzNyOKDrTFGR068d9BlBnyrq6utudNGUih4r
         RN2iq6FMdmPG47YH7uUoZg/4N8ofdUuzCMlGjta8wiQcZLgvQf9DWN8kzlNPpE4v+OR9
         uBy6wVV7iRDiAiasu5j5FBREZW3DcYlkuuQX2lPXT50YZ/sACQ7yHecuQfTWCoTv+y/B
         Kx9sixQMZUOkRgxOTH1Ak5leBL7LEK6WsxzRqYhUGv/BN0PUWYEm28ZiB2WSOcb0Bf0p
         NamA==
X-Gm-Message-State: AO0yUKVA4PUpSfYGwRlhVgLKaUj7H+Zh15Z1/VjiDEp6o/SNUDot9ze3
	NKUZD1sUoRbG3OGECD3frSmdXur3npyH6Q==
X-Google-Smtp-Source: AK7set+C4Xfud1cFgvRFZ8qKpp6GorfnDlHqRqUoXZnqsUS8S2rnijG3zowDEy2d3IgWtPnTAVBxfw==
X-Received: by 2002:a05:622a:4d3:b0:3b8:2e36:9d24 with SMTP id q19-20020a05622a04d300b003b82e369d24mr4977242qtx.50.1677592082729;
        Tue, 28 Feb 2023 05:48:02 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id o9-20020ac841c9000000b003b6382f66b1sm6436807qtm.29.2023.02.28.05.48.02
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 05:48:02 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-536c02eea4dso274124557b3.4
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 05:48:02 -0800 (PST)
X-Received: by 2002:a81:ac10:0:b0:533:99bb:c296 with SMTP id
 k16-20020a81ac10000000b0053399bbc296mr1648198ywh.5.1677592081988; Tue, 28 Feb
 2023 05:48:01 -0800 (PST)
MIME-Version: 1.0
References: <20230228130215.289081-1-nick.alcock@oracle.com>
In-Reply-To: <20230228130215.289081-1-nick.alcock@oracle.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Feb 2023 14:47:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUo3BkELZzhr0yVF7eU53_h757m1QWN8fQeLWKe5fCZDA@mail.gmail.com>
Message-ID: <CAMuHMdUo3BkELZzhr0yVF7eU53_h757m1QWN8fQeLWKe5fCZDA@mail.gmail.com>
Subject: Re: [PATCH 00/20] MODULE_LICENSE removals, fifth tranche
To: Nick Alcock <nick.alcock@oracle.com>
Cc: mcgrof@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-trace-devel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_054806_123523_3353E6CB 
X-CRM114-Status: GOOD (  16.42  )
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

Hi Nick,

On Tue, Feb 28, 2023 at 2:05 PM Nick Alcock <nick.alcock@oracle.com> wrote:
> This series, based on current modules-next, is part of a treewide cleanup
> suggested by Luis Chamberlain, to remove the LICENSE_MODULE usage from
> files/objects that are not tristate.  Due to recent changes to kbuild, these
> uses are now problematic.  See the commit logs for more details.

Does this mean you expect us to queue them for v6.3?
Thanks!

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
