Return-Path: <SRS0=CnAn=LI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF35FC2B9F4
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 13:34:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7187261153
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 13:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7187261153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/hvIYY7b7YGgXdoOQ6/kBxmy4+HLaEtAIEmpOteaKgs=; b=d7Dbb6MkN6x07p
	Ey4GupQt9/u0qzauyo9xidJvG9aqt4psDXod1v+2KhXR5gg0svexc+zCZQ0i+XwBGr5NXXP1Fe+2C
	hp4DaqA6QgY/WGWhHcKpHFlXkCAJptbRIgbdFjeCK/C0fcpH63XDZWBEDj8r5GPEeH/SwoaGQ8Ggi
	ZLSxWZkaNV1CFAcnVzvH4CPWHHIs0UntLv5Omyhs5qJxsXGrlnYTv+5ERB691F87gCCZRVLazmVjY
	XiZU6jMuDO7Z2fR6fv6L0RIFlT8DmjkJIM92KwDgwdsel/UzkOJnr8rHG80NBh7+rZRov0WM9g+tH
	+ic6BPvUFA7G0w/ZEEhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsmjJ-00EHzp-Rn; Mon, 14 Jun 2021 13:34:17 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsmjH-00EHy9-1K
 for linux-riscv@lists.infradead.org; Mon, 14 Jun 2021 13:34:16 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id b9so15452865ybg.10
 for <linux-riscv@lists.infradead.org>; Mon, 14 Jun 2021 06:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UV8GgpkywRc80yJBzURQ2ueKO8QT60yu6MzWe3gxGQo=;
 b=vGSYmNGxl+C6HflqoOw75ZmW8RORicMDf6Gv5FRyH0JQcQxcSF6FeEs4GXB/X4nFj0
 tdErD9xB5ZVPHofLxe8zi0zzKV0PQ8Uxh9cyHgOY6NzM68jE9AXXvZnwkRZ8xujvABBL
 Dx2S7oupGxUYNv5/8uv25WK0rClLeEuA3jVG6omBXhZLq32aFXsfcgNXisKP2iDnrlv/
 UOwsOf+GEFdNPdTgR5y5oaPi4b/wRvP4bSXyZ65ZyQsv/iRBHbb4AqzWeZW3/pw0wMte
 rvlU4JSYBBHsI56P5ckPoUjJM/r9dYZpoxuI3n1z05E6Vc2bEZVmGsCzreRzAmaJyTjC
 yhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UV8GgpkywRc80yJBzURQ2ueKO8QT60yu6MzWe3gxGQo=;
 b=hNhNmCAt+fEKoKNSVnix+XHyhvvUcL4QKCs3WR2QKzGQggS8wYQtJt6o/UgNtEVUUz
 uOVahGnqN8ueJqpQz6+SXK44QzfbC0m/nbeIVq3IsVu6KvB3EGhL6FcXAhxTpJV8JjHb
 c3uLwya2cKhZgybyNTHue4YQuELwZq7Mc+tNJ5jYN+U5h7B30PSv5mt17+u4u8+Lvj2t
 1nWXskolA82SncItYiNhXna1Uwm19Lq2tEzhXjoZ9+HzEw0MG/x2MifQdqwhy+nqGlae
 P8P0/hokSWWqgblRG3EN02+rYcxokYShaSU6kkFGrNaYi4i3K3zsgFZ0EyoehK7ro5F0
 G6kQ==
X-Gm-Message-State: AOAM5324bTK03yMe1ge3FmERmXmv97/yEiTgNMhZXNT8wtQX8S01LC15
 YU0DzuhUdu8zjH0ApniIBy9jgKZXDqlcjS21DSY=
X-Google-Smtp-Source: ABdhPJylNzdCIx5gB/SSt4ArZfgpf4B7gA665R73OuUCObZaJ0ySbNIP6vT5VHAYvJxqu39giVxqRUr7yMRZ7qZ7ypw=
X-Received: by 2002:a25:cf8f:: with SMTP id
 f137mr23334946ybg.314.1623677653776; 
 Mon, 14 Jun 2021 06:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210612160422.330705-1-anup.patel@wdc.com>
 <20210612160422.330705-7-anup.patel@wdc.com>
In-Reply-To: <20210612160422.330705-7-anup.patel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 14 Jun 2021 21:34:01 +0800
Message-ID: <CAEUhbmXJW6BKPY81hsTHJc=yHkuY+1_fQYhRPT5AanzFJh7rcw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 06/10] RISC-V: Select ACLINT SWI driver for virt
 machine
To: Anup Patel <anup.patel@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_063415_116751_6198CF31 
X-CRM114-Status: UNSURE (   9.93  )
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

On Sun, Jun 13, 2021 at 12:08 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> The QEMU virt machine has provision to emulate ACLINT SWI device
> for supervisor-mode so let's select corresponding driver from
> SOC_VIRT kconfig option.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/Kconfig.socs | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
