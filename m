Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A60CC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 03:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d87r1FHxH610svdGKedFB1dzGW9afTQr1bowt2wrKMI=; b=mHfHCJFAJ578Dp
	+9qswdzHZ1eZXuFyIq3XHeWW/9vpHwVtom4hOyvZdzpOgo1RREdEJkF0n6/XXt85axBSCoxvDKpxx
	ZuiPHC1TXsG/hMFDtgUNghgr5r4VDHkublzfFzuBHqUa9oZb+CSv+o0SXStklhOVGzzM/Mk/nszUc
	qE5dA2Tcn/GepiOWqVf4k8NtiEzBOJgiUXm3q9xwJbcQ+a6cJXbiq7cw00OAsoXgfAzN+hC9hK7FJ
	6B+ocD9NPJZt2aJzB+o/QCxjVgvG0jO97iFjc8HbiyAozfynT4XsjSitX74fWpTcGe0m5S3dDN7bM
	fDUoalKatGBsOqUcHEsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTwuD-002tac-K4; Mon, 20 Feb 2023 03:31:57 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTwuA-002tZv-UV
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 03:31:56 +0000
Received: by mail-vk1-xa34.google.com with SMTP id g17so422520vkl.8
        for <linux-riscv@lists.infradead.org>; Sun, 19 Feb 2023 19:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1zm8xJuaotm6vpzvHnpvokhYNz8wvFB8VkvBsqrPPrE=;
        b=XfOq/srI+PG5S3tIsdmDRgmwdsMQ+ZClbAz7T6USak/qOBTNy7W1gC6UP7/w29oxbE
         6iiGXn4GNQ6AtD83L4a1y1z3FFyz7AE1WrJmvJZ44qFUUH6e0dIfI9Mh6ljJivgskrUw
         /3sbkjEgoBSFRMK6t9WxS/xPOYYQVCkJj/MsN7NmcnRNRdrGC5vm1Rrd2hAknDdecrcJ
         zIMq4BCx6AretQvyByKBd/2v2LvxKeJnIoHsv7B5gckjF3nwcOwqrEc3lcNasxKFqpM7
         sDf7a++9fBZx/tpgPhwkKtWrYh+Tauk/SM5Z8Ue+RvsXoxwyu59CYJxwSq1ohAwLXkZM
         tAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1zm8xJuaotm6vpzvHnpvokhYNz8wvFB8VkvBsqrPPrE=;
        b=2+H2cdFTDiMiAPH6WHDVyD9bzRmLGbbcqCh3nnvdtYUz6ZNQSCKf1idMBoa2anf7Vi
         OUPAY7Ia+WL/5DmaTRYXwKp+tq7m5nJkSkzNOqy6CKiE80EuQ2gs+1LrKTRJ4LfY9geh
         s0M0N907Mt3Ru3Aozjv+frWcANoRuDDA2dzCItPuq596PF9PllrStyh4M4QMQunNsHI4
         jCmDu5BkuJoiX9+qrNhDDxkGxEHxNxoQZXM5njNepEfAWfdUXyOMbJPcteOOetMcMchs
         5InPOvbwCMhM9el6ZrazxJKfTKrpIhLr9te5IiepR3+BP83KFPdHf8pLHGDyy9E58183
         DWFQ==
X-Gm-Message-State: AO0yUKWCmDCrlnUev1OZRK+Pz7hbnXPzb80VHNH4PsfwKjrqYiM3BNrx
	MBYzKs3qDZ/yqUM+tjAiYKez3ldWbjIULGOD3Jn0ew==
X-Google-Smtp-Source: AK7set+D/gfVObR9SAgy5ZREo1wjRmgPl77pMBQmiXiEGzPyPFqKzCXsWSuVmTTX+jGxzmk5yK7IUvlUFUAsXEB6Jsk=
X-Received: by 2002:a1f:a682:0:b0:3d5:9b32:7ba4 with SMTP id
 p124-20020a1fa682000000b003d59b327ba4mr90534vke.15.1676863912532; Sun, 19 Feb
 2023 19:31:52 -0800 (PST)
MIME-Version: 1.0
References: <20230103141409.772298-1-apatel@ventanamicro.com>
 <20230103141409.772298-5-apatel@ventanamicro.com> <81b03d13-a1d6-91ee-9867-48e960f0549d@dram.page>
In-Reply-To: <81b03d13-a1d6-91ee-9867-48e960f0549d@dram.page>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 20 Feb 2023 09:01:40 +0530
Message-ID: <CAK9=C2WOBKt9FNVNtkVsUMGeMxB7awBgbi_WN+TwiUx4OwTBoQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] dt-bindings: interrupt-controller: Add RISC-V
 incoming MSI controller
To: Vivian Wang <uwu@dram.page>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_193155_008372_4F4A9E22 
X-CRM114-Status: GOOD (  22.49  )
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

On Sun, Feb 19, 2023 at 4:48 PM Vivian Wang <uwu@dram.page> wrote:
>
> On 1/3/23 22:14, Anup Patel wrote:
> > We add DT bindings document for the RISC-V incoming MSI controller
> > (IMSIC) defined by the RISC-V advanced interrupt architecture (AIA)
> > specification.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  .../interrupt-controller/riscv,imsics.yaml    | 168 ++++++++++++++++++
> >  1 file changed, 168 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
> > new file mode 100644
> > index 000000000000..b9db03b6e95f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
> > <snip>
> > +
> > +  interrupts-extended:
> > +    minItems: 1
> > +    maxItems: 16384
> > +    description:
> > +      This property represents the set of CPUs (or HARTs) for which given
> > +      device tree node describes the IMSIC interrupt files. Each node pointed
> > +      to should be a riscv,cpu-intc node, which has a riscv node (i.e. RISC-V
> > +      HART) as parent.
> > +
>
> This property doesn't seem to describe guest external interrupts. Should
> we add a reference to e.g. <&cpuN_intc 12> to indicate that IMSIC can
> send a 'Supervisor guest external interrupt'? Or just an idea, maybe we
> can add an additional interrupt controller to the CPU nodes to handle
> SGEI: (Various properties omitted)
>
> cpu0: cpu@N {
>         compatible = "riscv";
>
>         cpu0_intc: interrupt-controller {
>                 compatible = "riscv,cpu-intc";
>
>                 cpu0_gei: interrupt-controller {
>                         /* intc for hart-local hgeie/hgeip */
>                         compatible = "riscv,..."; /* Something here */
>                         interrupt-parent = <&cpu0_intc>;
>                         interrupts = <12>; /* SGEI */
>                         interrupt-controller;
>                         #interrupt-cells = <1>;
>                 }
>         }
> }
>
> interrupt-controller@... {
>         compatible = "riscv,imsics";
>         interrupts-extended = <&cpu0_intc 11>, <&cpu0_gei 1>, <&cpu0_gei 2> /* ... */;
> }
>
> I feel that this would be more appropriate, since the guest external
> interrupts are defined in the privileged architecture specification and
> are not specific to AIA. Though please do suggest more appropriate ways
> to formulate it.

This is unnecessary because GEILEN can be detected by init time
writes to hgeie CSR. Please look at KVM RISC-V AIA implementation
for more details. We only need "riscv,guest-index-bits" DT property
for address space holes.

In fact, we have tested these DT bindings with a variety of NUMA
configurations containing different numbers of IMISC guest files
per-HART.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
