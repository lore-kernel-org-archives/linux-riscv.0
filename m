Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5628CC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 12:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7yjnZ3A/3PR1pS5hNatO4ioos0exFuFCOu7RtxrcPc=; b=iDpNkXZ8YB9CJY
	+MMvc/OmWBXY314hH1W1W6zuZ8Mjpuo/kpJO4MrruzjpgM5PO5B0vBzJoT2DoydeRyk8i+TlK8Vcb
	LK14B7+wm+Tf08PEr+OUI6G+zGtz9ty7eE+5KxX/0mfvesB46MmSyEt/ERTyYnvIQpkHVRSM24S78
	MgybwY6hWz+w0P4VgDu172ueqJXyaXuI6GhsveXjyDcc6nSHVO/VWE6tvn7Gc+58KSRmA0nkp2A/r
	ynHoR0zx/j1H6WUxOMEMFL4qjPS/jgh6q8Fu7SYpI6Y7zl2hMHQboJ/yqNCZWUx+Wp7IKAMmzBxcH
	GvSYQ6b4l3Alrp8i4BWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyYBa-00GWRJ-ET; Fri, 25 Nov 2022 12:52:06 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyYBY-00GWPw-5n
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 12:52:05 +0000
Received: by mail-ed1-x536.google.com with SMTP id m19so5036227edj.8
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 04:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nZM9q1K+42FsNfeDNYm/8tjXP/Kt4Gm+q17CqPvn1IU=;
        b=iVPArmm57/IEQXdp7tdJZqPU7TQN8yhQGrEQzHv6hpqKQFxi9oBS6DGdo0LwIZ7F9Q
         lBgR9+lpqH5ZuSr4N0zd5uHFNGmFw2vtBtHtTdN0738CicJC2xbL7nJbV+2KTZwXyKHj
         R6h9D5bEbWTPND1Vzli1NKP9AXXDYVl9V7+n7YhUmGKFzmxA2gvpKIqQhNZMRLKg+VE0
         YjGzMgreZ9YHmrKiLikM5zz8NUmvMl3MBdS2NGi+/RyCfM77WeeYhbIdSXx7MqryNb/S
         6PSdA52/ndBpH/TsG2taHYhax0n+0AepsOxg6VaZXkqkMlC0pU6b4aeDQJvotuCakawf
         qnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZM9q1K+42FsNfeDNYm/8tjXP/Kt4Gm+q17CqPvn1IU=;
        b=NTa3qTbfhuBV/IMObclcvdKr+KQj8TukUHi16cxqW3Ssh6QgjhhNWVVj2gi3w/pFjA
         tewISzhehPMVQWjSN2zShDcF7xqGa+yBjftVmvzm1liDGa9V6ZVYiuwvi7KHeA21FeAZ
         9RGxbDACHCV7kIfpFC4HvwK5+3k15lY3TK1vuSSANCPeTJdNyKwqJ5KZTbApL5y6jmqO
         EoDrArnfqHidEJsninHNIamfTd4KgNvYXpKAi+qKSZwrjeD0pBvBfF9J/TX+4Tgh11Wh
         HNGnOcU8B2v80z/3u/r1oTHHm9Dg0wZ/5fAEg2p9QGB4BJFntYd3aKsRjzC9i+Y4vhCk
         EGUg==
X-Gm-Message-State: ANoB5pkA47FwBzDkDndGG3f3cWI0u2br+vIEtoXgE8UDqsEyMWDtUdAr
	GaBKwk0+yliATpeYYXS39PmGd/aqBcZ0RGHCPnU=
X-Google-Smtp-Source: AA0mqf5Lq4Pu7NoN/UM+TblOtprU1WDL5qvhXP3lh39E7rVRPYg6ZUFacZ1Y6gAGHGpxHM9DVnp+shoUQbO+jemouyI=
X-Received: by 2002:a05:6402:1f87:b0:468:7df:c38c with SMTP id
 c7-20020a0564021f8700b0046807dfc38cmr34475964edc.150.1669380721124; Fri, 25
 Nov 2022 04:52:01 -0800 (PST)
MIME-Version: 1.0
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <70d1bfde-f57f-1741-08d3-23e362793595@linaro.org> <CA+V-a8s2awLp=YvbhA1Ohe500Oh1easLUcG9V4_FWov7Pf2i6g@mail.gmail.com>
 <9b0f8312-2caa-b9f3-edf3-1b720532f559@linaro.org> <Y4C0Jn1hl81ZCxOt@wendy>
In-Reply-To: <Y4C0Jn1hl81ZCxOt@wendy>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 25 Nov 2022 12:51:34 +0000
Message-ID: <CA+V-a8u_R9X10AQ2dV9ieDGx7OJPhLRW3ENAoRP2fqVQTVodPw@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] dt-bindings: cache: r9a07g043f-l2-cache: Add DT
 binding documentation for L2 cache controller
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Nathan Chancellor <nathan@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_045204_259505_A9EBE3A0 
X-CRM114-Status: GOOD (  25.61  )
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

Hi Conor,

On Fri, Nov 25, 2022 at 12:25 PM Conor Dooley
<conor.dooley@microchip.com> wrote:
>
> On Fri, Nov 25, 2022 at 01:12:18PM +0100, Krzysztof Kozlowski wrote:
> > On 25/11/2022 11:34, Lad, Prabhakar wrote:
> > >>> +/* Device, Non-bufferable */
> > >>> +#define AX45MP_PMACFG_MTYP_DEV_NON_BUF                       (0 << 2)
> > >>> +/* Device, bufferable */
> > >>> +#define AX45MP_PMACFG_MTYP_DEV_BUF                   (1 << 2)
> > >>> +/* Memory, Non-cacheable, Non-bufferable */
> > >>> +#define AX45MP_PMACFG_MTYP_MEM_NON_CACHE_NON_BUF     (2 << 2)
> > >>> +/* Memory, Non-cacheable, Bufferable */
> > >>> +#define AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF         (3 << 2)
> > >>
> > >> What are all these? They don't look like flags, because 3 = 1 | 2...
> > >> they don't look like constants, because we do not use shifts in
> > >> constants. Are these some register values? I also do not see the header
> > >> being used in the code, so why having a bindings header if it is not
> > >> used (DTS is not usage...)?
> > >>
> > > These are register bit values for the MTYP[5:2] field. The DTS example
> > > in the binding doc (above) uses these macros. I haven't included the
> > > DTS/I patches with this patchset yet do think I should?
> >
> > Then why storing it as bindings? Bindings headers describe the interface
> > implemented by drivers and used by DTS, but this is not implemented by
> > drivers.
>
> IIUC, some of these properties are non-discoverable attributes of the
> cache controller. I see two things that could be done here that are
> "better" than #defining bits:
> - add an RZ/Five specific compatible and use match data to set the
>   attributes which is only possible if the pma-regions are set on a
>   per SoC basis
> - make pma-regions into a child node, in which andestech,non-cacheable
>   andestech,non-bufferable etc are properties of the child node
>
For now the only way to get DMA working without IOCP is to have
AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF. But for future purposes I have
introduced the other available flags.

So maybe for now we could just have this flag
andestech,mem-non-cacheable-bufferable in the binding doc.

    cache-controller@2010000 {
        reg = <0x13400000 0x100000>;
        compatible = "andestech,ax45mp-cache", "cache";
        interrupts = <508 IRQ_TYPE_LEVEL_HIGH>;
        cache-line-size = <64>;
        cache-level = <2>;
        cache-sets = <1024>;
        cache-size = <262144>;
        cache-unified;
        andestech,pma-region@0x58000000 {
            reg = <0x58000000 0x08000000>;
            andestech,mem-non-cacheable-bufferable;
        };
        andestech,pma-region@0xdeadbeef {
            reg = <0xdeadbeef 0x08000000>;
            andestech,mem-non-cacheable-bufferable;
        };
        ....
    };

Did I chime in this time?

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
