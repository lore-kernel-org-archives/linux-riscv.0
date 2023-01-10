Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2101FC46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 08:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DAc7ED1HWleDH9KZJ/AH1poqeV4P5373tEJ3VGSINfw=; b=tD6OETB6FyMp6Q
	4VZxuxHMCxUzH3f4xAG04zDlL5IP3TLr93EbjH9ttr7qSdFl8H6LOHuTob7MnLl5Fv6d2y6N4rZk3
	SUTjbTa4S42iHgacnBe98JcGe41m2x1NfF4aA8fzomgjKJA56bK+6vmWXSzfWK475Ry8fAnBdTK6P
	zY39Guz4XL6M2mpt1w4Syh/Wlal/tCayrymABrSLpILygQs132D/yyyc8SRqogQSgxKLqF3g0kQks
	qf7fe6c0Z/HjQoCAj8Gmqrncx6vfARr45TGi7EjTtUi/iRQqJMCMTDJfpbCyGHC9wHt6PsySbmzBd
	px4AycwWSZtCmN/iH3QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFA3T-005oyC-Jo; Tue, 10 Jan 2023 08:32:23 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFA3R-005owu-S4
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 08:32:23 +0000
Received: by mail-wr1-x42d.google.com with SMTP id bk16so10875454wrb.11
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 00:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zgBO6+9PGIY7gG3EwbYAW3dCBxJ4oWi8pqGXEjwv8w4=;
        b=fRY2blI7y1/KRiC37HSHNJYMIzBk5K6t9QpoOiGA3wX8gniUs1y4/hAL5g5UZxY1+o
         T0by85aswqqqZW8QJGoG+se1CSU0WTjy5QwRjkYh2VWfTgi9LqIS9d9SySQaX0C6wgwU
         I4p7e7jPzoSWz5h8hQnkW9sRG4zjTOnLxf+CgqmPG31wZ472qBHlrDgOlcSKnSAoOqZx
         YESwr0plD4VqnbPvP8F80CiJbvuMF2Yo5ap13OkZHmk1Dj2cSIISN93CZir6zxxRL1/N
         DJsYpJW43gGc5LI+udIlPgww0k5swFjNhpZr67tmLbzuz3ohOJ1H8vaT/Zb/3BIEdwjU
         OVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgBO6+9PGIY7gG3EwbYAW3dCBxJ4oWi8pqGXEjwv8w4=;
        b=SBOflU4bGunBQ1L0YZ0i70E+xp71g3F65M9pjNAG+9PVdEV3PJ5BMoTIla4dNC3wyI
         Kglitk8kjAP1F2la9c05vouR1090SPlOvoOwpoj1O7lPtPLv7k9eS56IRJO7Q3YK27tG
         rMc3KWhGuil7d2VNuBpf64TY+PhHy/FD5GlsxkzOHz4w57mcES/d85Q5hm5PyhHtWNbL
         y+Wqgj6cxvxxbIXgGH4MnbHDWlgwexeCQ9OKobT7d0xE0LBPOv8FpXSqVCORG0m6zL6G
         IHEdWdBb3+mOVC9CstU+OLESlbBpj/ExrRt/VO792vp8YmyIBOHWOWGmGp1JLEMRl5zo
         Au1g==
X-Gm-Message-State: AFqh2kox2vln/oyMno33GbbO+0mj+RFbS8BEr0IrIIXGdwh9hVuaLePg
	MOgWcQ4wmRX5WXEVBylEuuu8qruve7VJy8yo
X-Google-Smtp-Source: AMrXdXv8EDtq5SMrjEXtQZiVtkTcawhtiPoNQ3TiMLAStMzqBdbG4Cq06NTdalB61e8ucMsn1aGzxg==
X-Received: by 2002:a5d:6f07:0:b0:296:a81e:3bb5 with SMTP id ay7-20020a5d6f07000000b00296a81e3bb5mr25121283wrb.30.1673339537021;
        Tue, 10 Jan 2023 00:32:17 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id s1-20020a5d4ec1000000b002882600e8a0sm10608246wrv.12.2023.01.10.00.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 00:32:16 -0800 (PST)
Date: Tue, 10 Jan 2023 09:32:15 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, conor@kernel.org,
	philipp.tomsich@vrull.eu, jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 1/5] RISC-V: move some stray __RISCV_INSN_FUNCS
 definitions from kprobes
Message-ID: <20230110083215.tvfjjelddywna4lx@orel>
References: <20230109181755.2383085-1-heiko@sntech.de>
 <20230109181755.2383085-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230109181755.2383085-2-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_003221_927393_3BE61D90 
X-CRM114-Status: GOOD (  13.82  )
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

On Mon, Jan 09, 2023 at 07:17:51PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> The __RISCV_INSN_FUNCS originally declared riscv_insn_is_* functions inside
> the kprobes implementation. This got moved into a central header in
> commit ec5f90877516 ("RISC-V: Move riscv_insn_is_* macros into a common header").
> 
> Though it looks like I overlooked two of them, so fix that. FENCE itself is
> an instruction defined directly by its own opcode, while the created
> riscv_isn_is_system function covers all instructions defined under the SYSTEM
> opcode.
> 
> Fixes: ec5f90877516 ("RISC-V: Move riscv_insn_is_* macros into a common header")
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/insn.h            | 10 ++++++++++
>  arch/riscv/kernel/probes/simulate-insn.h |  3 ---
>  2 files changed, 10 insertions(+), 3 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
