Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E33C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 04:18:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAE9360232
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 04:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAE9360232
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7e3cKQX8bmrSS7jHrDwKET3gb9vv7CTNWNrLAYTvco=; b=BlL8JIirX5Mu/A
	YaKVdJc1BAJtcF0o1sj8NHNLFdo5iQV+d2CAOX8H/MpyCZNrIr4QDq9MPBXwRwCh3jDj/zQSSaKJm
	5yJavGd2bzMtYrFIozdeYFnb0pwIovfJLUTGoK5WiAxAu19EJiV5gi0LDtzTtgTFKAE/HkISfIN/i
	cZF+XtQj9Ce0Dsjq5JjWKFzUvbAR6rBNTFtZy26X9HD83UMi2S67EzbPYFekabj0GjaVwa9RgiUog
	/UCbjnMu8FWKsi8W/2MsrXq1F3MhWUVxKlxHqZ0IzXogf0Noc6oFGduTlf+h0EBZ3sDMhuM21M1Ug
	YrpaDmSRqQh9wUcwnDtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1merQl-00FFS6-Ca; Mon, 25 Oct 2021 04:17:51 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1merQj-00FFRn-FF
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 04:17:50 +0000
Received: by mail-wr1-x433.google.com with SMTP id w15so6617327wra.3
 for <linux-riscv@lists.infradead.org>; Sun, 24 Oct 2021 21:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hmyJ+fxOvQKNEomi44KNz6W2UiehRKi6Y9dBpWtAWIM=;
 b=5mmlEeDRAHXnBXiGOM1olXR4Obsou6PuzN3/DjkySxTLtMrDreHK+SoKNV6Hc0+Zc8
 b6U+EtHoTOs5fykLFtvNtn6HrDTt/eqqOTK8NflNa5p+3GR40kc5qlGtRSUDHTpeYVg3
 2Vqgj1DZXnkFeDVK/utQSeiwf2YejSJeGgwWni/TAe9bZeTBysdw4CUEMZbqLRh39md0
 VlCPrHAssmnybfCmpvwzKQFI3OcfBWBPFSRnifB/65uX80gUQN6C11fwCB/3jmEsW0ho
 BtZTfR93p2GpxgeHtaRBb/jZPB5OM9WFXalZOySItkooS3fGRZtaLzwTCcEpHBUyKGXy
 e35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hmyJ+fxOvQKNEomi44KNz6W2UiehRKi6Y9dBpWtAWIM=;
 b=ZRqjrv4EHwGct3/7H9XwFLEzl8J86sXsp5HVl0kTwAsX3akgk1uRyazuLG6l2aW8hG
 29ZLU1pSfnkC/xqJiFRPsL0DNYwwFXcSowq3YP7H8LwHG+hI7EabuvM98olSJb3SzxR7
 lzpG+QUPEU9u1Tu6UjgWrQMt6hM3My6ecsxXuFXOXOiTET/ud/b8Ok8s9l8gxDsNU3ax
 yazmgPBmfvMb/2wai6yNUSpisUBAUO0oR58aAe9Gi2raWx2bK8bbBPIBvhd0Rco9CLzZ
 g485FkdcnQIRJT/6m0sWDh0cvBoSVTAk29zBdkDaLWldXX7aKdDZ5VKu3ou9jUpZxMPz
 GClg==
X-Gm-Message-State: AOAM533LUS2JJDYqbqwErI93QOna2kpb8PNnIh2OWKagBnXTojPgoG4m
 vPbl08awmuAQr2cjwU6MMmTCyG0ir9Nzp4N2rQqWoA==
X-Google-Smtp-Source: ABdhPJxzC3VVjMq24dLsSc1rgpBgZeTWA+LOx570smHg/XMHtuHNwIss71RE7o30ztqQ9+IIIU47U4I9wzzuA1WYgjc=
X-Received: by 2002:adf:fa12:: with SMTP id m18mr15619002wrr.306.1635135467273; 
 Sun, 24 Oct 2021 21:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211025040607.92786-1-wefu@redhat.com>
 <20211025040607.92786-2-wefu@redhat.com>
In-Reply-To: <20211025040607.92786-2-wefu@redhat.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 25 Oct 2021 09:47:34 +0530
Message-ID: <CAAhSdy1N-UQFnbFc7PSwf62y=gbvX7pK=vwUaG8m_KzdWx3AgQ@mail.gmail.com>
Subject: Re: [RESEND PATCH V3 1/2] dt-bindings: riscv: add mmu-supports-svpbmt
 for Svpbmt
To: Wei Fu <wefu@redhat.com>
Cc: Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, Guo Ren <guoren@kernel.org>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Christoph Hellwig <hch@lst.de>,
 liush <liush@allwinnertech.com>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, Aniket Ponkshe <aniket.ponkshe@canonical.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Gordan Markus <gordan.markus@canonical.com>, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, 
 Daniel Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 Xinhaoqu <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>, 
 Nick Kossifidis <mick@ics.forth.gr>, Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_211749_554016_ECE70817 
X-CRM114-Status: GOOD (  15.83  )
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

On Mon, Oct 25, 2021 at 9:36 AM <wefu@redhat.com> wrote:
>
> From: Wei Fu <wefu@redhat.com>
>
> Previous patch has added svpbmt in arch/riscv and changed the
> DT mmu-type. Update dt-bindings related property here.
>
> Signed-off-by: Wei Fu <wefu@redhat.com>
> Co-developed-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index e534f6a7cfa1..76f324d85e12 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -59,6 +59,11 @@ properties:
>        - riscv,sv48
>        - riscv,none
>
> +  mmu-supports-svpbmt:
> +    description:
> +      Describes the CPU's mmu-supports-svpbmt support
> +    $ref: '/schemas/types.yaml#/definitions/phandle'

There were various proposals from different folks in the previous
email threads.

I think most of us were converging on:
1) Don't modify "mmu-type" DT property for backward
compatibility
2) Add boolean DT property "riscv,svpmbt" under
"mmu" child DT node of each CPU DT node. Same will apply
to boolean DT property "riscv,svnapot" as well.

We also have bitmanip and vector broken down into smaller
extensions so grouping related extensions as separate DT node
under each CPU node will be more readable and easy to parse.

Regards,
Anup

> +
>    riscv,isa:
>      description:
>        Identifies the specific RISC-V instruction set architecture
> --
> 2.25.4
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
