Return-Path: <SRS0=s16l=43=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51AABC18E5B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2020 12:42:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 225AB24691
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2020 12:42:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RfrEpX5m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TO+BX/Pc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 225AB24691
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X6+AR1Sm0huTiOmTHUHeBU28UDpRzfwyHTrCE/9H+0k=; b=RfrEpX5mIwRy0eRO0Q/vurSQp
	OVwEWfKa6GudrF0cIqFq9CdgVEgCsqExlhRP0mo5z9VHLgOBahZbzfstlTRkRBWSuqJDSzcPIKo/v
	kT4efm9XTYCRnXNGttMMXF0cspHYoSbixyu1UK1HgWQI4i22QM0gMJCnyfTk/AphbuY1Ey9gLF2FF
	Qyu5I3XXmwr0fZNDV66DyJqhIVvaPvpCeXeLuUNvKkVjIMS2geSHTqHo7AfPqj4iPuL0Tc0lOfEOi
	O77aA6F9Lkq4DEXZ2EUTSb2gGEV32NVssSPOSU8DuHitzZNREwjDTWxXgqDa/SsthyXMhvV5kv1+w
	oiQvNIfig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBeDg-0008RC-Ro; Tue, 10 Mar 2020 12:42:48 +0000
Received: from mail-yw1-xc44.google.com ([2607:f8b0:4864:20::c44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBeDe-0008PN-4c
 for linux-riscv@lists.infradead.org; Tue, 10 Mar 2020 12:42:47 +0000
Received: by mail-yw1-xc44.google.com with SMTP id p124so13444993ywc.8
 for <linux-riscv@lists.infradead.org>; Tue, 10 Mar 2020 05:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X6+AR1Sm0huTiOmTHUHeBU28UDpRzfwyHTrCE/9H+0k=;
 b=TO+BX/Pc83sjyH/1clGRsJ3evPMnbZNEMBak/+efgmCETo89CvQ/ilyaBphkZIjtCB
 S75kPK6p+VkNIviTIMy1jqmoDgb59I+I0/3bYBkXP/jR8Ifu0C9AyiD6TaNVMJ7PM5Mx
 gnV91kUlK593CUGAymHMd2eSkryNRhaAHD2F5iOc7VBqwDmA7mYAQKD1eU8mP6CgAk9I
 tPW899+q2Lzhs97UGdAyHuyZzR3UHWTc/espqU0/UnURqJpPrV7NS66ipaKCIp9wCwQn
 gN1BE8OK7vCi9Pv796lbWKjELx75rWPJRX0gKTmKtPeKC5lHLmHS6cBLjuqv7OUAMdVP
 ZaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X6+AR1Sm0huTiOmTHUHeBU28UDpRzfwyHTrCE/9H+0k=;
 b=Ur3Ng0t5hQkvAhqCwpJOaBAei8821/1zyIB1OfIchIdHRpse8H15dfvbESx6dsy+wB
 RQMal47FfIaQVB1jxg+EBdZeWFFNyj0MGzXifQERn2Cx06EN/UG4qHnVPuOq0ZD6kJoQ
 TCqOzhRCyt2p744wqWeXw8MGDiDxEZY9w1Xoou7XuTCaE5MGQilM2t2hZWfyiOKSB/iE
 Jk7OPnRqywsLFmSN/NF7cw22MBV6H5lPHxnmVP5r7p5bOpU4tvLhxbtgj63MCwQyzB5N
 KsNPonS2BpF71VjkNyjDk1NC0QnHN8CyPxQGhaZQmyPE7A6HXYsvJXvBUK6FJXTE+ucR
 q6Wg==
X-Gm-Message-State: ANhLgQ3v8TKqrAeHklzrfXzgxB2WMByLX4B3BK+KPSWM8g3kmSx7NU1Y
 Onhbk+7l8YXLQURSbXgu/jNZm0fL7TlxlHGUSUU=
X-Google-Smtp-Source: ADFU+vv54Eb1eXMbNSVCbnLsO+PdRq5jfWrkb5E+TbuBdAGiawFXL5MWgwS36A0l/5qWvvMzujWM1RWYpl1dS4Q/Toc=
X-Received: by 2002:a25:614b:: with SMTP id v72mr21345190ybb.154.1583844165317; 
 Tue, 10 Mar 2020 05:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200310115925.126174-1-anup.patel@wdc.com>
In-Reply-To: <20200310115925.126174-1-anup.patel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 10 Mar 2020 20:42:35 +0800
Message-ID: <CAEUhbmVqrgVF+FFsaO47nOBOZUWzA-LfAfubACNg8yJcx152gw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Only select essential drivers for SOC_VIRT config
To: Anup Patel <anup.patel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_054246_208115_720D2208 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 10, 2020 at 8:00 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The kconfig select causes build failues for SOC_VIRT config becaus
> we are selecting lot of VIRTIO drivers without selecting all required
> dependencies.
>

Isn't this a sign of some VIRTIO Kconfig options are not correctly
expressing dependencies?

> Better approach is to only select essential drivers from SOC_VIRT
> config option and enable required VIRTIO drivers using defconfigs.
>
> Fixes: 759bdc168181 ("RISC-V: Add kconfig option for QEMU virt machine")
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/Kconfig.socs           | 14 --------------
>  arch/riscv/configs/defconfig      | 16 +++++++++++++++-
>  arch/riscv/configs/rv32_defconfig | 16 +++++++++++++++-
>  3 files changed, 30 insertions(+), 16 deletions(-)
>

Regards,
Bin

