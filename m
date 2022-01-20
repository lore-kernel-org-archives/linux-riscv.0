Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E6EC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 15:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GJ3kddQhzcmSw7F09OmEA7BTxnpOXh7N9/VPPswclJ0=; b=aU2k9y+d9C+A6+
	sk5PwVTYVkEb6Aol92B0RdFk+UKzQhBYth49Sev8yOzwerYeTJXly+g42J2CTD3moEZdk+idryyXi
	Q6CBQJHkMGpB51WFsARK6JaInHrzagRc4Mm7f8p+eqAm+y6ceKn9zKp1moXL/aqnZoors015IpAIt
	J+xxivnUO5ZDLNNBdwWiF6snznKyF7nyIP9DZzDlKaBdkkMoGd6bai8t5suPfI7MYf9JxNTRhTboJ
	QClmANi+a9aphyReNE1M11T71QxsLQRb9ug/Brvfydw6qkv+iPmDCjHApBp6K7sJuyWLZ7erl2OxV
	mn/Nd2EfzpKbFPf9gZVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAZUy-00CBkh-EB; Thu, 20 Jan 2022 15:37:16 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAZUv-00CBiw-KP
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 15:37:15 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 23so18872566ybf.7
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 07:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=benBYMoxl2IjLGX3aLWpdBFmHNqoAhtj/Izde371FoY=;
 b=rGryBx3vren0FD6AusA1Z+oP0Tpy1Yv7hYzLnhMNzuXAN7gebacnfe5EbYerti6xcN
 GieILVBlmUdl93RlOazApxh6v6WlvnyEViBXaG2HwYjzS1bKFS3RRuucmGFKL6GQhSiu
 94GqfAlUFI7XS5NC7SGxGVpma78wezjs4dVdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=benBYMoxl2IjLGX3aLWpdBFmHNqoAhtj/Izde371FoY=;
 b=49yt3NVeeUN7+AG240nYf7YeOKcKVMAA4GOcyJQSVBKuU+bV8Cj0CvjGVc1KpVw2lv
 vfxGLKRZYCefEHgo8Tf4v8L/jg7Lk86ZkyTCxQqz86IYg9iQD2kwNi0O7GW8T7dx4i50
 s6wt5+wmGFCD2+5Eb+uHGU5DNXl3SLfINWiLFAE16c6bgxHbEaQuDTZRMarvDrXbszQU
 L4r1empkglQo246J44ZoVh03n9f18fZDHeoC9m51pR7LMcjvWYNL01EIyUFfKj2ntufJ
 8yn9bKkWRacYCW2OXbwp/P6Au21sxjPszHRz3NR54QQzMoAM8qzBxUEjYLIvo224paa9
 KSyA==
X-Gm-Message-State: AOAM5311aLPm5T2J+9hFTiGcFi8wXlBqyVjhmBJU328Ai2aT6ncC31BY
 7TUjyFHqjoZoMc+JZDFLHfEkL/UEKKhj4bpSSsbPYg==
X-Google-Smtp-Source: ABdhPJx2HqNHCErP0SUwdj2Z1T8Vj/J/PMhk2VH+lfME52ufBieeE0xLdK6sxbq8ha/DtDdJx1U69QLbOKV1hW1csVw=
X-Received: by 2002:a25:4b84:: with SMTP id
 y126mr44574295yba.487.1642693031719; 
 Thu, 20 Jan 2022 07:37:11 -0800 (PST)
MIME-Version: 1.0
References: <20220120152828.4089364-1-gatecat@ds0.me>
In-Reply-To: <20220120152828.4089364-1-gatecat@ds0.me>
From: Vitaly Wool <vitaly.wool@konsulko.com>
Date: Thu, 20 Jan 2022 16:37:00 +0100
Message-ID: <CAM4kBBJqHVX_Q2C0VO7qKNZywRiWbHK9t0G076ov6u+_gwO2=A@mail.gmail.com>
Subject: Re:
To: Myrtle Shah <gatecat@ds0.me>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_073713_694805_00FADACB 
X-CRM114-Status: GOOD (  12.51  )
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

Hey,

On Thu, Jan 20, 2022 at 4:30 PM Myrtle Shah <gatecat@ds0.me> wrote:
>
> These are some initial patches to bugs I found attempting to
> get a XIP kernel working on hardware:
>  - 32-bit VexRiscv processor
>  - kernel in SPI flash, at 0x00200000
>  - 16MB of RAM at 0x10000000
>  - MMU enabled
>
> I still have some more debugging to do, but these at least
> get the kernel as far as initialising the MMU, and I would
> appreciate feedback if anyone else is working on RISC-V XIP.

I'll try to support you as much as I can, unfortunately I don't have
any 32-bit RISC-V around so I was rather thinking of extending the
RISC-V XIP support to 64-bit non-MMU targets.
For now just please keep in mind that there might be some inherent
assumptions that a target is 64 bit.

Best regards,
Vitaly

>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
