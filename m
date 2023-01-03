Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622E1C46467
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 16:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4g7CSzF/0mmA7sooNFiB1J+8zCYuXB3t7/k7oabt7H8=; b=rwGEh4ajymHmNX
	mbEFpXNxZQziQJvUynFm9R52jTSrcwrwmtiRJes6OlUuZS4/obX6yoV3UmypeHHWFsQdWsibDfZiR
	stZhIZTqn9HOUhhUt59cJIFQkyi8J75zGZehTfPh4l2MhOfudOI1dj/qEeR5/zYiaFg/Qwhcjq2TO
	G3u8Z8ZLVMDm+vualGHONuI5e0GDFluxsMG3Oy/4uzS+HOrK3fwkqcR7va+oqpnBU3vFXbIg7EpRu
	IlgHzEXnE6uU/tEjD8w43ei3lwKXU617CzFZcWylH/ktrgoCu67HGN4v78j6UjIVCzAY2lxHDHuRC
	2JuvTLZLCF258ul+pjnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCjhk-002i8y-2A; Tue, 03 Jan 2023 15:59:56 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCfzs-0017Sm-9O
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 12:02:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E44F0B80E81
	for <linux-riscv@lists.infradead.org>; Tue,  3 Jan 2023 12:02:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3266FC43396
	for <linux-riscv@lists.infradead.org>; Tue,  3 Jan 2023 12:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672747341;
	bh=u09dmYLA0SDPWsgNwZ9uhqIUCV6VVDIbZmE7qi9Ae2k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GXo+LdxTU093+n9amq3pGlFQHldCgP69AWWKrfXC/udm27V+iUqH+p8kQKYhfXQRF
	 q2S9aZM+FZF6fQmfQGteCk/6UEnFwH5Y85vGSjlz3Y5cNUvyuH+XCceenL7vVzpHt+
	 fH8AFL/2EIVpYycZZP2GAhyQvsQ1QNsX2QkquKBzqTW8cJsW2+dPYvZBiwE75OVhtH
	 R1y61aFDnRxkI/xeRZg1PKMz/TLY4yCwZyL6LGPUpSQiUl4Jg2TvB+zKFpIGz5jlw6
	 an+PB3xa6+VEtnj/eHtFTJVWKenx5sASGzfrNzcxIlYs3I+T5cFSuDuy+snoR1CFCj
	 Q03mOTZBlnZaw==
Received: by mail-ej1-f52.google.com with SMTP id x22so73012985ejs.11
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 04:02:21 -0800 (PST)
X-Gm-Message-State: AFqh2kp9GTfU5wMpySLkA9wG7HtUkoQeKZuD0N90kOL2kkixdtZkyf8O
	tM7HDLHYJ3hek54qeHnqss8Mk/DtxOwtvKPelLQ=
X-Google-Smtp-Source: AMrXdXsMBhSpsz7iv9ITErqmE108Ci0Q3c6egXKkT6WOdkwE62RHbex3+RfKS5QYoi/M8W/9aaXEAB6h2vf6HeQ6H2o=
X-Received: by 2002:a17:906:cc87:b0:7c4:ec55:59e with SMTP id
 oq7-20020a170906cc8700b007c4ec55059emr2584461ejb.611.1672747339331; Tue, 03
 Jan 2023 04:02:19 -0800 (PST)
MIME-Version: 1.0
References: <20230103062610.69704-1-uwu@icenowy.me>
In-Reply-To: <20230103062610.69704-1-uwu@icenowy.me>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 3 Jan 2023 20:02:07 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQkd_it0msNvUV_jBf8ei0N7-TVLO1LqwC3SQc=wipvgw@mail.gmail.com>
Message-ID: <CAJF2gTQkd_it0msNvUV_jBf8ei0N7-TVLO1LqwC3SQc=wipvgw@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] riscv: errata: fix T-Head dcache.cva encoding
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, 
	Nathan Chancellor <nathan@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_040224_772332_E19D8839 
X-CRM114-Status: GOOD (  18.05  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Tue, Jan 3, 2023 at 2:26 PM Icenowy Zheng <uwu@icenowy.me> wrote:
>
> The dcache.cva encoding shown in the comments are wrong, it's for
> dcache.cval1 (which is restricted to L1) instead.
>
> Fix this in the comment and in the hardcoded instruction.
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Tested-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> ---
> Included when resending:
> - Sergey's Tested-by tag.
>
>  arch/riscv/include/asm/errata_list.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 4180312d2a70..605800bd390e 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -102,7 +102,7 @@ asm volatile(ALTERNATIVE(                                           \
>   * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
>   *   0000001    01001      rs1       000      00000  0001011
>   * dcache.cva rs1 (clean, virtual address)
> - *   0000001    00100      rs1       000      00000  0001011
> + *   0000001    00101      rs1       000      00000  0001011
>   *
>   * dcache.cipa rs1 (clean then invalidate, physical address)
>   * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
> @@ -115,7 +115,7 @@ asm volatile(ALTERNATIVE(                                           \
>   *   0000000    11001     00000      000      00000  0001011
>   */
>  #define THEAD_inval_A0 ".long 0x0265000b"
> -#define THEAD_clean_A0 ".long 0x0245000b"
> +#define THEAD_clean_A0 ".long 0x0255000b"
>  #define THEAD_flush_A0 ".long 0x0275000b"
>  #define THEAD_SYNC_S   ".long 0x0190000b"
>
> --
> 2.38.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
