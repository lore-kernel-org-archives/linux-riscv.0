Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A8CC3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 09:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tTKjzEG3/MqtMrw7Bm4v7CRBd9qr8b1hUDe7+DqiZY4=; b=FbbNG1RTE+5tpz
	LyFcHbJpXJW5H+DZ4Xk+KChjydBjLfPbr7bPrxczebViIxGPz2TKILCJwPyEVzcFMfEVQoNiai+x5
	qOjRAGCOn8vHhKqnM0r2BmOeYMsrUcExxSiGBrGrQH8sW7uhN9rBasIkPjPtIVOx3/PHexbW5IpZ2
	i+9z9LbromFdXVurHRp3Zjm8+FiPHvaeJv9GP43FX2XDqhYE+erHfJ2e9W//RtZQlJ0JkAZHPC8fx
	XNdxE0Gw7irZ4NcMmcsJM3O58HPQ10nYfRfmwvOWfFpbV0Gs9HLPv4deqWnsml+b6W2zNkIqIC3Os
	TqHBUWt3RhP0B3JNimQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCdBJ-000OBR-JT; Tue, 03 Jan 2023 09:02:01 +0000
Received: from mail-qt1-f170.google.com ([209.85.160.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCd4i-000NHH-Ht
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 08:55:15 +0000
Received: by mail-qt1-f170.google.com with SMTP id z12so24094570qtv.5
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 00:55:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=poZkD94G6LXE4+Lm/TBono3GS6hWH1AHLJnWJtULzYM=;
        b=Y7+HQYIlo4nfJJI+zFVc8iKEzkBkSH8RnRVeGyafQ0WTkWS2XZ7Sr8HsmLXPXKzyDy
         e61R5I2XfXH1Pk25IGWP/fWQr0Rlv5hfZ1Dzl2lwWZIy3L3ByGgkAnthSOPtTiPa2Twl
         WLd2wTH2V7MBkGCvv02GH8yKMuC3V+9EWbQHiWtIu6bsFoSlM0EPre1OKTrgCXxLC2Nn
         P4v5mkvPDdEVY3ebif0skSwygSFNMBnAovjWJP2AXVXH8R4NesfOmYh+R4/T0g5jGMsi
         GRzzOkKFSR+GjvBwwsU8yhvgVZVBRudmw+5bcPOkGsMN35raRWIIn/LfXSNrg1kHUWem
         Lplw==
X-Gm-Message-State: AFqh2koxV65eKHuNYiKVHWVUEoUaB/Zj/WmrOPbEC9yHfzFaqxYrPE6C
	jU39MB8FR3QlnSJ+QfUimgCaH17GB1PBUA==
X-Google-Smtp-Source: AMrXdXs/RynaN2RsH5X60DtNHhB83rJMtGchPNhuDZYb/P9Jg+efSD7invdDdTEgEmdNnUMI7RhBIA==
X-Received: by 2002:ac8:534c:0:b0:3a9:8183:6a04 with SMTP id d12-20020ac8534c000000b003a981836a04mr70492760qto.54.1672736109616;
        Tue, 03 Jan 2023 00:55:09 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id bp13-20020a05620a458d00b006fefa5f7fc9sm21684785qkb.134.2023.01.03.00.55.08
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 00:55:08 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id 203so32335786yby.10
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 00:55:08 -0800 (PST)
X-Received: by 2002:a25:aae1:0:b0:6fc:1c96:c9fe with SMTP id
 t88-20020a25aae1000000b006fc1c96c9femr5618399ybi.36.1672736107872; Tue, 03
 Jan 2023 00:55:07 -0800 (PST)
MIME-Version: 1.0
References: <20221228161915.13194-1-samuel@sholland.org> <20221228161915.13194-3-samuel@sholland.org>
In-Reply-To: <20221228161915.13194-3-samuel@sholland.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Jan 2023 09:54:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXx3MZBHdeD3HrTx0740CF48+7j70NvFmVsJBOePJbbXQ@mail.gmail.com>
Message-ID: <CAMuHMdXx3MZBHdeD3HrTx0740CF48+7j70NvFmVsJBOePJbbXQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] riscv: sbi: Share the code for unsupported extension warnings
To: Samuel Holland <samuel@sholland.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, Kai-Heng Feng <kai.heng.feng@canonical.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Petr Mladek <pmladek@suse.com>, 
	YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, tangmeng <tangmeng@uniontech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_005512_650294_B9A389F4 
X-CRM114-Status: GOOD (  16.26  )
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

On Wed, Dec 28, 2022 at 5:19 PM Samuel Holland <samuel@sholland.org> wrote:
> This reduces the code size by sharing most of the code and the format
> string across all affected extensions.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
