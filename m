Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF17C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 22:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EjM/yarCd7Xs+lTKzZjxLJOi/Ne+JgdPP7yzAGfZzPA=; b=iCRHufyp83nFip
	QYoWGIkTAPTNuthCIUhmd6sX34iKKRrlPs8d7I0E5El/GL8jqtxaCay8yESXnMfCXpbdp9ou17uXY
	Zda8GltByEtX/JNRNOIMl4V88UdDWiZm9gBfUmocYgCwOb53VcCPwPK0kZlPWwF9W1QTs5uXkxICg
	pVuT8I083i2GyoHpKwGZBX3+etW9cq9zkMG8m2p08dM+VICuasHgxm8mNn05aHABT4PDPmv0CLy+o
	5QxpwsKfYNNx59PtK+VU4IJfbukapEDOnnTEPKtlXM+B/10giPK/I2UB8B0SWsW3l4poYIzC2z2ON
	0XJQL+IXZJltdKihLS+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osWfT-008giR-8o; Tue, 08 Nov 2022 22:02:03 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osWfR-008ghi-A4
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 22:02:02 +0000
Received: by mail-ed1-x52d.google.com with SMTP id a5so24545111edb.11
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 14:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QrehMHGbF0ud3SfuTCD05+3RISeggbmWJ8iearVbVYs=;
        b=gsrbJ5nHm3fr1A7b1jq+aI4WEzTrPGiLQ0qrouoPTpPbEOFcicw0Js1ylm/R/PcaND
         +vR2OAmqZbUmTFydJxEecJBQ5Z04IR5hk3WrP+cV0f4ZF0tMEivWfOJRf/acYcWuDnLZ
         /vrDkGxNmQZJRqrFZKHTIT6mnZWmm1IevpJphkJcqWZSEYvrFcTFyqzZxq6hpIi6mZ9/
         Hz9K1MdUjQRAhAtIbloOfOiN7NLuVl68wUYNTLvmI3JwurSyfktMm4yKd43cZ5PEc6dx
         zKxfBOKOOwqL+7hYDakxsrBjtOh4xxiycPwGusgeiJ037y64SA1Mt69xzJiYLVoyHCeW
         WuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QrehMHGbF0ud3SfuTCD05+3RISeggbmWJ8iearVbVYs=;
        b=UmDNRRk2AJk79yz6FIZjgW1FY+JopgSSSULT4VlYscl1SBa1MwpkWlM3HUkPBuMrJb
         8cr7CtVteXNdf8e4XnIjrKY62hu3dsX8n5SAjHyLqaMQed5yKiONVEIHfsiEXM1NrMa8
         kMzkL3rCEkjOzlc1yp1hgIgcx58SuNURVznFUnsrEgD/tk2iAhwzLwV6VmZcXyENlXGW
         5sCTHAiMZ6Jp0QDYVTI3lKqZYigknQ4Y5MKJh3A7A/zdOTnH+t4DlTA/HrNB+2Q/LjHS
         utA6kR0tyCRLEFmrgde+CozIM+IzVtCdHB0FWLqYY0eox0jVHpCaSrSMCtlyaHNkyNFl
         rSjg==
X-Gm-Message-State: ACrzQf1AI4sw8mYAEkcCzBORGuiJglXWz3DZyzHwndRfU4HqL2M/8SYy
	vqtraF/mxb0Os5rfsFrj9HXsC537dNIuPLueyJY=
X-Google-Smtp-Source: AMsMyM7q0YSthBd2yKawk4JYycYpO8FYQE3LgFvSLFT7wnepQgGjaSd/yLU9h6nUFm26UeaXQBzhAMuTAja+pZtiIQ0=
X-Received: by 2002:aa7:c389:0:b0:463:5926:7254 with SMTP id
 k9-20020aa7c389000000b0046359267254mr50251078edq.255.1667944913295; Tue, 08
 Nov 2022 14:01:53 -0800 (PST)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221028165921.94487-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUKVxO24Qgyx37tbs5+m0Us0VF3eTZCC2KV=AC8z2JneQ@mail.gmail.com>
 <CA+V-a8t5Qah3MNm2m__xnmgK-52=HC9QBPPudnB+1j4-FYJ_NA@mail.gmail.com>
 <CAMuHMdWTJf24XR+KR8yVJOnfpgs-PkUf9b8B=PX9Dd4mfawD5Q@mail.gmail.com>
 <CA+V-a8vCGDHL1SUTEnD-WvoUGKSVL=xzDeQxy77=1vFJdk+fYg@mail.gmail.com> <CAMuHMdU=K0o6KHVPUdfEu0tkH8kDMBg-WaRFcYS7r=azWEnfTQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU=K0o6KHVPUdfEu0tkH8kDMBg-WaRFcYS7r=azWEnfTQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 8 Nov 2022 22:01:27 +0000
Message-ID: <CA+V-a8s6Amvb35wRE7pbwXHxwzk8znT8OWsbA9DRpX76E8Uh+w@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] riscv: configs: defconfig: Enable Renesas RZ/Five SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_140201_368811_A2DEBECC 
X-CRM114-Status: GOOD (  30.33  )
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

Hi Geert,

On Tue, Nov 8, 2022 at 7:20 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Nov 8, 2022 at 6:23 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Tue, Nov 8, 2022 at 4:12 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Tue, Nov 8, 2022 at 5:07 PM Lad, Prabhakar
> > > <prabhakar.csengg@gmail.com> wrote:
> > > > On Tue, Nov 8, 2022 at 3:52 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Fri, Oct 28, 2022 at 6:59 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > >
> > > > > > Enable Renesas RZ/Five SoC config in defconfig. It allows the default
> > > > > > upstream kernel to boot on RZ/Five SMARC EVK board.
> > > > > >
> > > > > > Alongside enable SERIAL_SH_SCI config so that the serial driver used by
> > > > > > RZ/Five SoC is built-in.
> > > > > >
> > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > ---
> > > > > > v4 -> v5
> > > > > > * No change
> > > > > >
> > > > > > v3 -> v4
> > > > > > * Explicitly enabled ARCH_R9A07G043 config (note I have restored the RB
> > > > > >   tags with this change)
> > > > > > * Used riscv instead of RISC-V in subject line
> > > > >
> > > > > Thanks for the update!
> > > > >
> > > > > > --- a/arch/riscv/configs/defconfig
> > > > > > +++ b/arch/riscv/configs/defconfig
> > > > > > @@ -29,6 +29,8 @@ CONFIG_SOC_MICROCHIP_POLARFIRE=y
> > > > > >  CONFIG_SOC_SIFIVE=y
> > > > > >  CONFIG_SOC_STARFIVE=y
> > > > > >  CONFIG_SOC_VIRT=y
> > > > > > +CONFIG_ARCH_RENESAS=y
> > > > > > +CONFIG_ARCH_R9A07G043=y
> > > > >
> > > > > You forgot to refresh after moving ARCH_RENESAS in v5 of "riscv:
> > > > > Kconfig.socs: Add ARCH_RENESAS kconfig option", and after relying on
> > > > > ARCH_R9A07G043 in drivers/soc/renesas/Kconfig.
> > > > >
> > > > Sorry I missed your point here, could you please elaborate.
> > >
> > > I mean that the options have moved, so you should update
> > > your patch like this:
> > >
> > Ouch got that.
> >
> > >     --- a/arch/riscv/configs/defconfig
> > >     +++ b/arch/riscv/configs/defconfig
> > >     @@ -26,11 +26,10 @@ CONFIG_EXPERT=y
> > >      # CONFIG_SYSFS_SYSCALL is not set
> > >      CONFIG_PROFILING=y
> > >      CONFIG_SOC_MICROCHIP_POLARFIRE=y
> > >     +CONFIG_ARCH_RENESAS=y
> > >      CONFIG_SOC_SIFIVE=y
> > >      CONFIG_SOC_STARFIVE=y
> > >      CONFIG_SOC_VIRT=y
> > >     -CONFIG_ARCH_RENESAS=y
> > >     -CONFIG_ARCH_R9A07G043=y
> > >      CONFIG_SMP=y
> > >      CONFIG_HOTPLUG_CPU=y
> > >      CONFIG_PM=y
> > >     @@ -163,6 +159,7 @@ CONFIG_MAILBOX=y
> > >      CONFIG_RPMSG_CHAR=y
> > >      CONFIG_RPMSG_CTRL=y
> > >      CONFIG_RPMSG_VIRTIO=y
> > >     +CONFIG_ARCH_R9A07G043=y
> > >      CONFIG_EXT4_FS=y
> > >      CONFIG_EXT4_FS_POSIX_ACL=y
> > >      CONFIG_EXT4_FS_SECURITY=y
> > >
> > > > > >  CONFIG_SMP=y
> > > > > >  CONFIG_HOTPLUG_CPU=y
> > > > > >  CONFIG_PM=y
> > > > >
> > > > > PM and GPIOLIB are auto-selected by ARCH_R9A07G043 (through ARCH_RZG2L)
> > > > > resp. SOC_RENESAS, so they can be dropped.  But it's better to do this
> > > > > after the release of v6.2-rc1, when all pieces have fallen together.
> > > > >
> > > > Are you suggesting dropping it from defconfig?
> > >
> > > Yes, but not right now, as that would make it depend on my
> > > renesas-drivers-for-v6.2 branch to keep them enabled.
> > >
^^^
> > I was wondering if that's required by other platforms though.
> > CONFIG_PM was added for VIRT machine and GPIOLIB for HiFive.
>
> Does that matter? They would still get it, as long as they use the
> defconfig.
>
Confused, didnt you say about dropping it from defconfig...

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
