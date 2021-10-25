Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5276C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 06:09:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B99260FDC
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 06:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B99260FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iD/bMpgSROZ6WLHLJOJq9MQu09MfzsgKxEihOtlBuFY=; b=ohxKe3LevaiFS8
	arDexIkYWWPiPFZIyOTmqEuFS74KB4W/+bnVpvdico+QVJ+b4MwHzxwh9mojxAMqQDBgW1Wbd3VlW
	7bvm5uffsUs+rcixfula3x/xUtqha8k51VZgTFJ6qU2Z/TR4pzF40cZWVaWDMQK+Wjk2WsswvcJC8
	y5ndPP462QopgES0PdnbKeAaC03iKVQhUGPOfNDZ92e4J5uKNlBSwYWrXVaiElgxnytCVi9tRFSHP
	YwIfjC8QsaDryJ/8F9/PUu5oVgdsbUwyoOu3Tt+bHwis4LALX92M/G7egJ0MyZojNVsikrmWcOTTU
	oCyazNPTaH6sLgIcXhsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1metAx-00FMpg-7n; Mon, 25 Oct 2021 06:09:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1metAv-00FMoz-CB
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 06:09:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07B8E6023D
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 06:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635142177;
 bh=ZPPzxfjbR+mfJDK5TtOWY4ucM9+GEi+ARIcc/M7V0uw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CA9hWpwJ9evo/+/SyELNZ22li+1nKzKg3HT0NGESddtnbPcEnB72MkSsGlYD5xvyQ
 flDmiHJ6hOWK0tK4/cPWSwW3MYhLSfvlaMYon3U1CCBKlUkQmzvX4P/pvkyjytciLM
 SpRwSuMHHOtAZgVGMYHICZP78uzNzP7qFlF2+3lAdGbUV4r4WSBC2lxu+rPRzvkgFq
 UI9nDxRrX1h8T5jzzEYKMw0pMI0gk6wzk9aKYNgkMK8uLhAYPFO4RAOGGnXbB/+nM0
 Emyy+kK8VmFYBaJeunyFaKgRQY5YmrErOubkAnrmf+UMlpMzF9ufpyV3eini2WIlrw
 mOAr+jffjYMiQ==
Received: by mail-ua1-f54.google.com with SMTP id x3so591043uar.13
 for <linux-riscv@lists.infradead.org>; Sun, 24 Oct 2021 23:09:36 -0700 (PDT)
X-Gm-Message-State: AOAM5339z4lUhBN4NlbuswMolfjBDTVES6Z0k4cVjc9Mqda2w0PpWoUI
 QzSLVBJb5hZWqIXBySJFokt9DkpRmq/3d9IrXI4=
X-Google-Smtp-Source: ABdhPJxK0iXo2bm0rsM4SbUtDFJlB+Z2ri93um5z6gjaYl4w+hpAQeIaaSZ2BpRAyrb0jhGiAodHX5oWzTUoWMNdTOI=
X-Received: by 2002:a67:ca1c:: with SMTP id z28mr12857215vsk.11.1635142171258; 
 Sun, 24 Oct 2021 23:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211025040607.92786-1-wefu@redhat.com>
 <20211025040607.92786-2-wefu@redhat.com>
In-Reply-To: <20211025040607.92786-2-wefu@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 25 Oct 2021 14:09:20 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRn2USuN+jdVjC-8Ug2hXZWCbzVues5_B8-P1wM9KvYhA@mail.gmail.com>
Message-ID: <CAJF2gTRn2USuN+jdVjC-8Ug2hXZWCbzVues5_B8-P1wM9KvYhA@mail.gmail.com>
Subject: Re: [RESEND PATCH V3 1/2] dt-bindings: riscv: add mmu-supports-svpbmt
 for Svpbmt
To: Wei Fu <wefu@redhat.com>
Cc: Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Christoph Hellwig <hch@lst.de>,
 liush <liush@allwinnertech.com>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, Aniket Ponkshe <aniket.ponkshe@canonical.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Gordan Markus <gordan.markus@canonical.com>, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, 
 Daniel Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 "Xinhaoqu (Freddie)" <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>, 
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_230937_477105_1ADD5436 
X-CRM114-Status: GOOD (  16.23  )
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

On Mon, Oct 25, 2021 at 12:06 PM <wefu@redhat.com> wrote:
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
We need a "type: boolean" here.

ref: Documentation/devicetree/bindings/serial/8250.yaml
  used-by-rtas:
    type: boolean
    description: |
      Set to indicate that the port is in use by the OpenFirmware RTAS and
      should not be registered.

> +    description:
> +      Describes the CPU's mmu-supports-svpbmt support
> +    $ref: '/schemas/types.yaml#/definitions/phandle'
> +

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
