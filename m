Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF671C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 23 May 2022 23:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTTzEOH0INoVGQBTCABkFpyadBPKrbOrcv9wbGdb6l4=; b=ZQxGjNMYkh0Srj
	ILFw72i9cOP81tMcQVHCXApK6I09vEN8kcMBMT++tm/X8uILBMD9T15/y5cEYQb0F2LDm8FZxPWXz
	i8fszBudzPR0/P1Z+ZUSOgkLs2EYkU7pwb3jxzn+BPlIeIRoFLfFgGVWoy2cHEjNAVZeHKcvZK5uP
	/AjUXaEH3Z742wz5qXxeaX6Xfuo1EUxgbL9+1WeiKKkxnYc2Yg7ksECqSm9hFhyp30X53rsQquzCF
	s/R9W0cAnV6peyOSKanVeAIiTTgKoZqcdEoPeM83nkhW8vSoFpTpLF9oBR7wf5+Qt/fIQn1qto1qf
	hAxOKP5MKmIuyY46YmBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntH2c-0061uz-4M; Mon, 23 May 2022 23:00:46 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntH2Y-0061uI-Ly; Mon, 23 May 2022 23:00:44 +0000
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-f17f1acffeso20279942fac.4; 
 Mon, 23 May 2022 16:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/hOaZULQrF9LX4munHpY3wVXOQ9nYFe0ZRAvQXZ3vbE=;
 b=nGUkzijZu5ZFwvP8H84AwlAD1vdzdwA1fp5JhNnOjdcRC+ZxUoP+QYS9XM6GLQeWyk
 phuU243eWaA6M+lCDpQB8vQdh7UdO47A0ZJYAgW4Um8l1Je80E/ADeEln0UO4XBU06uk
 on8Kx0QGQnjxiqYAC4W9JuuCImAujkCxhohJ9HwGnvDEXHmXOp51TTJpBA0kMEvDsd2n
 XjWGc1x9K9Uo2HMgqryiDUOsGi2dZjT+EyH+RDMx5s3Jhl2IKdM5ql4zNVw3Tn+xZBSM
 iAI+2SAS0zaoEjNKFKND7vIAfWufy9XiIMFFVGaGrZQ9xEsjaYicgVQ/L7iaon8uSMaO
 GZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=/hOaZULQrF9LX4munHpY3wVXOQ9nYFe0ZRAvQXZ3vbE=;
 b=iAv467tXyycaDHY3AKEHUU7lygKwqUOVNpPpOnmLOr2Q58dsBYQ47FxTF0C/GGfp5A
 qEpjI2B1R0Cb8L0mICpcI3LBQdlhrDfvE3EABzlNRMRkc7CdCaGJz9UwgBHtf2xnxCKC
 atgzM9a8Sa48TgdkPJ/nTXIq6R9ufWzVBUPMLKcPUPJhHMKsnqHGa6vMDP3f02riA2ET
 pu6fEaRXezJ+gMBPTROgLJlzuRHILmrFWhrVHLe/yzLKbnTnnKabXQjXg8wA5Ob0n89b
 xI9kV0lHWt4sHTaQYKtPFRvaaMj4BcsMXjwC/FOs38X+MdXw72p3hGIEDSJITk0wnmAp
 7snw==
X-Gm-Message-State: AOAM530PwCFMeEeKFv0NcFB8rBggvNmD5KuzEjEYF+XpYQVhpk5+kGFE
 9mM92+R+f/8lhCAMM+lBKM4=
X-Google-Smtp-Source: ABdhPJwFYvmU9t0f1/cxvvqr52oJVOx3ly87DqZ/EmOOoCe4wzWaAPc48YIP+GgJ2Vc9YQqj1/y/lw==
X-Received: by 2002:a05:6870:15cc:b0:ee:456f:c1e5 with SMTP id
 k12-20020a05687015cc00b000ee456fc1e5mr788661oad.46.1653346841457; 
 Mon, 23 May 2022 16:00:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a056871054500b000e686d1386asm4315531oal.4.2022.05.23.16.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 16:00:40 -0700 (PDT)
Date: Mon, 23 May 2022 16:00:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-csky@vger.kernel.org, linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V9 20/20] riscv: compat: Add COMPAT Kbuild skeletal support
Message-ID: <20220523230039.GA238308@roeck-us.net>
References: <20220322144003.2357128-1-guoren@kernel.org>
 <CAJF2gTSCcYif4DEpvrJ6d02no3CU_viyE+OkhhjCV3VsGmcT5Q@mail.gmail.com>
 <0ecdb673-b9a8-40af-7dee-2ba7fe739e5f@roeck-us.net>
 <44686961.fMDQidcC6G@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44686961.fMDQidcC6G@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_160042_780600_5B82F4D7 
X-CRM114-Status: GOOD (  25.40  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, May 24, 2022 at 12:40:06AM +0200, Heiko St=FCbner wrote:
> Hi Guenter,
> =

> Am Montag, 23. Mai 2022, 18:18:47 CEST schrieb Guenter Roeck:
> > On 5/23/22 08:18, Guo Ren wrote:
> > > I tested Palmer's branch, it's okay:
> > > 8810d7feee5a (HEAD -> for-next, palmer/for-next) riscv: Don't output a
> > > bogus mmu-type on a no MMU kernel
> > > =

> > > I also tested linux-next, it's okay:
> > > =

> > > rv64_rootfs:
> > > # uname -a
> > > Linux buildroot 5.18.0-next-20220523 #7 SMP Mon May 23 11:15:17 EDT
> > > 2022 riscv64 GNU/Linux
> > > #
> > =

> > That is is ok with one setup doesn't mean it is ok with
> > all setups. It is not ok with my root file system (from
> > https://github.com/groeck/linux-build-test/tree/master/rootfs/riscv64),
> > with qemu v6.2.
> =

> That is very true that it shouldn't fail on any existing (qemu-)platform,
> but as I remember also testing Guo's series on both riscv32 and riscv64
> qemu platforms in the past, I guess it would be really helpful to get more
> information about the failing platform you're experiencing so that we can
> find the source of the issue.
> =

> As it looks like you both tested the same kernel source, I guess the only
> differences could be in the qemu-version, kernel config and rootfs.
> Is your rootfs something you can share or that can be rebuilt easily?
> =

I provided a link to my root file system above. The link points to two
root file systems, for initrd (cpio archive) and for ext2.
I also mentioned above that I used qemu v6.2. And below I said

> My root file system uses musl.

I attached the buildroot configuration below. The buildroot version,
if I remember correctly, was 2021.02.

Kernel configuration is basically defconfig. However, I do see one
detail that is possibly special in my configuration.

    # The latest kernel assumes SBI version 0.3, but that doesn't match qemu
    # at least up to version 6.2 and results in hangup/crashes during reboot
    # with sifive_u emulations.
    enable_config "${defconfig}" CONFIG_RISCV_SBI_V01

Hope that helps,

Guenter

---
BR2_riscv=3Dy
BR2_TOOLCHAIN_BUILDROOT_MUSL=3Dy
BR2_KERNEL_HEADERS_4_19=3Dy
BR2_BINUTILS_VERSION_2_32_X=3Dy
BR2_TARGET_RUN_TESTSCRIPT=3Dy
BR2_SHUTDOWN_COMMAND_POWEROFF=3Dy
BR2_SYSTEM_DHCP=3D"eth0"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=3Dy
BR2_PACKAGE_STRACE=3Dy
BR2_PACKAGE_I2C_TOOLS=3Dy
BR2_PACKAGE_PCIUTILS=3Dy
BR2_PACKAGE_DTC=3Dy
BR2_PACKAGE_DTC_PROGRAMS=3Dy
BR2_PACKAGE_IPROUTE2=3Dy
BR2_TARGET_ROOTFS_BTRFS=3Dy
BR2_TARGET_ROOTFS_CPIO=3Dy
BR2_TARGET_ROOTFS_CPIO_GZIP=3Dy
BR2_TARGET_ROOTFS_EXT2=3Dy
BR2_TARGET_ROOTFS_EXT2_SIZE=3D"16M"
BR2_TARGET_ROOTFS_EXT2_GZIP=3Dy
BR2_TARGET_ROOTFS_ISO_GZIP=3Dy
BR2_TARGET_ROOTFS_SQUASHFS=3Dy
# BR2_TARGET_ROOTFS_TAR is not set


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
