Return-Path: <SRS0=Il0f=OB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC96C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 07:11:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3277F61209
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 07:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3277F61209
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=AD4HGoLSWcoQ3wabo6N6iAtCfTDRzkAAGInTDD/KX6A=; b=z0OlbPZqXVkl+RxMUvBvFcL/uq
	ZJ/qGQDAXh4pRzw9+x3qCjHTPp6qwJalTNNi+yZi4ry2aAISVngBP4cqlFQeuErf6a6YXofgjKtbW
	Zc6tsHFHh4cLRy8jSnl6YHY+PLCK7ExHE1Tx6Dkwgi4DYmt+h9h1W4FmBPUv8MkEVljncj5cmHehv
	vbNLc++zy1SF4UbXQa6ZkDi9VVYKWyQvsC4fDEG5HCsz/FMhvNZpdJlcADrENE/Il27XIgLMiXHd7
	z7VYtqThKmfj0QzI85zvb6FcYpEsIt945zfS2GHHuP4CHPazh/X9loR2fa1/SIPU7Wktin3C88suY
	dSYsAjAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOx9t-00EQDp-W5; Sat, 11 Sep 2021 07:10:42 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOx9r-00EQDQ-Fz
 for linux-riscv@lists.infradead.org; Sat, 11 Sep 2021 07:10:40 +0000
Received: by mail-qk1-x72f.google.com with SMTP id t4so4650935qkb.9
 for <linux-riscv@lists.infradead.org>; Sat, 11 Sep 2021 00:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=TLUu2TW17WePa2uT7aMSXI4fMfRRRl6A0I6wwN4rBLA=;
 b=yhx60stAL79tINsIZNq9HvW3r8zJl+z+dpiQaAYzrplcIYXLVNToDqax1pkRnoMVLt
 BZzG0bqy77XPfXRAb7jMFiKPUdAtFQsXWi7V/0eqZzHuadZs02j1N5oOlYysMT/S52lb
 N9I61ZzHH945yLGD0wlrEHCx+kncV3JNWy6VXnrD5L3K0vnpOQXW5mJc+82i0/z6k/lS
 4DqAYCx92MA+W+yVo75EKUiu4dCd/K4GSMUOeZ6pbPYQxiUYDN8QypEQ1gXGXwMRc5hk
 YCf2vVsxMw9Kis8tB2QiplXHEokVImQ7Pf+P7A2nIE6THBsfTkKKRwQHBlXQN/gHpu2R
 3W5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=TLUu2TW17WePa2uT7aMSXI4fMfRRRl6A0I6wwN4rBLA=;
 b=UgoCKVXfQVEab/aXcwJrpq9kcrPZbnhaftY9ureWLUBJXq9G3ufJCqaN/qc9Z1Vxo5
 bjKNwkmf2xv2hoJA//gw+5Cp+f2cVGX3qL6Kp+qdyX2PXMIJ/RAGfafCbs96+yQ5+v2I
 Q4dxZ0MMyS4MRK2vBjgrzgKbfCKf/V0inl+9nGdWCF11aUPBfReJ+rlcGUtogcl5HXDT
 mjzbVA+MrROs8ZqN2OTffCwz3uqSFO/bpwlUSllZGMh1LhqvtmCEu9wruezwLtCtAn/G
 o3nq4ab3ngfBwrkFempiha0V5ZhzN1Kscrcvlo+If78o/U3VPAzf7yeTmVAG+YsT0Feq
 TgDg==
X-Gm-Message-State: AOAM531fSa+y5D6fNrLCd4kb2xcEA/zLLz8OV1q+h3n+beUGe5UbuFH8
 T3leWu/nPPjYSyKbSKrQoiNvcQ==
X-Google-Smtp-Source: ABdhPJwfIJDzi6ZwZlGwHW0B+569UQ/uXsNddAkoflOOoDFHk/10nZFVm1aGp63owpHyXX26vlh8Ig==
X-Received: by 2002:a05:620a:21dc:: with SMTP id
 h28mr1006816qka.198.1631344237711; 
 Sat, 11 Sep 2021 00:10:37 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w11sm711653qkp.49.2021.09.11.00.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 00:10:37 -0700 (PDT)
Date: Sat, 11 Sep 2021 00:10:37 -0700 (PDT)
X-Google-Original-Date: Sat, 11 Sep 2021 00:09:03 PDT (-0700)
Subject: Re: [PATCH v2 0/2] riscv: improve __ex_table section handling
In-Reply-To: <20210826220952.77a68a9e@xhacker>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn
Message-ID: <mhng-a8170a93-117d-4496-b3ff-eb003540d54a@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210911_001039_621230_817E3F45 
X-CRM114-Status: GOOD (  11.54  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 26 Aug 2021 07:09:52 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> Enable BUILDTIME_TABLE_SORT to sort the exception table at build time
> then move exception table to RO_DATA segment.
>
> Since v1:
>   - Only enable BUILDTIME_TABLE_SORT for MMU. Thank Palmer for catching
>     tinyconfig case.
>
> Jisheng Zhang (2):
>   riscv: Enable BUILDTIME_TABLE_SORT
>   riscv: Move EXCEPTION_TABLE to RO_DATA segment
>
>  arch/riscv/Kconfig                  | 1 +
>  arch/riscv/kernel/vmlinux-xip.lds.S | 1 -
>  arch/riscv/kernel/vmlinux.lds.S     | 4 ++--
>  scripts/sorttable.c                 | 1 +
>  4 files changed, 4 insertions(+), 3 deletions(-)

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
