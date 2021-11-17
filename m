Return-Path: <SRS0=ZoRk=QE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DDEC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Nov 2021 08:49:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB1AD60EBD
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Nov 2021 08:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB1AD60EBD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jlubvwUoXMyJpZH5hu4OjGcOOwab3Ad9lA12QWdetyE=; b=IOPJSQCh287HWb
	CkcegTrfhBHFoFwuLFlTmpxJ7twTRJoohtP1c2dY0qVQxOARral119vykFCpODUzAuT+a2z4PpI0a
	wltrbAx9oH/HiTYPAVabls7Woc0k0rujRavHDhPt4+gP7Ufaqu95VfEmhnGOuR6ZTxZyrNe4a8xqh
	KoMP/D1ElEtCAVCJumxq3PPqbMQTOnCFc06d6+FzEp3ACZe4lbOZqFYrvQ02dnNEg/lnLW7Zs9WWe
	bNSP45l7FILUMPwntKZZZ6Mw+sAriBu8jB9/hVHAipXICMOth0mnKs3JNYzye7UBvbZYGUoj+0oiz
	1s7wu4/UJg0HRp+gTlLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnGdO-0040k6-84; Wed, 17 Nov 2021 08:49:38 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnGdL-0040ih-OV
 for linux-riscv@lists.infradead.org; Wed, 17 Nov 2021 08:49:36 +0000
Received: by mail-wr1-x436.google.com with SMTP id d24so3204723wra.0
 for <linux-riscv@lists.infradead.org>; Wed, 17 Nov 2021 00:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B7IPC7bC9AT8/D6fv37MaKPiWkigtWHGnCaDAdR23ks=;
 b=hr4Fk8sFDF5tNoJTaSITi0W06sn1vv3dLU2DPO5fkfTKyBCQmGQMCPwnEJLd447s4D
 /u2JAf8Wh5O2yyhZP75ZiMcjXIZN5AUnPGNYv12RZwVWLvdzsrBmoG8HFaTpHblvz3Cd
 GkxydX4K4zTJepGsnr721QACfbOk7bZv4XRSAq6Y/Agsz+B9YLIC/+hrhgGzhDleh44m
 SMJ9OrjL+buwd5wjKSYBaTs6+wR/fYsmq5AK5UkDCRdiCaKK++SiYZtl+Sp6NG8zruad
 UMhR+Ps9znscTWYK9qSV7l5DZuZWYxc8M+fcQJWDQwFbIKvYjTZzGVXGYHWqi3oSH0eb
 lTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B7IPC7bC9AT8/D6fv37MaKPiWkigtWHGnCaDAdR23ks=;
 b=qLtWM376bvDeJRU0oUhjMKANflTNE1J4iNq02Ks6ynIaOquoEcNTGn72mY1IJPRwpT
 K6g/6fomewJuOAJL40RiDzWGHf8+iLtV84yg5TMcEgL9UvW/PY5IZv9koVpAhDcX+Ad4
 6+7nlNTvlEHHVsiV09ZLeZaHzdPWledLMTVJx5dfOmXUkEt0EBpmmIq6gEzL6wDvn6ZK
 u2If0b7w66M8W7Vx32JehSkFQh9YMZh/krLpJczEiYFCTFB78q7Ysf5kVI9sRYEJyTE0
 cJMMNiAVfXGEtNFFewn+Xorm96XTb0Fb4ttDvPnQk7xyUSH791NoM7N3+FijcAMjUClP
 EdaA==
X-Gm-Message-State: AOAM533GCpWf3Ct7/0PoPMJ7MRCBrTvDdiMAQDMnLyEpzo8zw5C2SAex
 nNDQR+6xAksy+qE/JFzTyBWjNHGYpAtpixV8q/DpbSOaJG3+On4t
X-Google-Smtp-Source: ABdhPJyULSq3RsjoXSpZlMHvAUGqp8FyT72f4rtpMXvyJSvuccvxb9bbZU1AiHFvqU7V9KJiog1NXIx2vH1S+mg6+HU=
X-Received: by 2002:a5d:628f:: with SMTP id k15mr18297636wru.363.1637138971386; 
 Wed, 17 Nov 2021 00:49:31 -0800 (PST)
MIME-Version: 1.0
References: <20211117084705.687762-1-anup.patel@wdc.com>
In-Reply-To: <20211117084705.687762-1-anup.patel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 17 Nov 2021 14:19:19 +0530
Message-ID: <CAAhSdy0z=QGDVnnfsg2hYANv-=8ooCWrnRtjut88exioAvcZYA@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Enable KVM in RV64 and RV32 defconfigs as a
 module
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Anup Patel <anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_004935_808690_01030B98 
X-CRM114-Status: GOOD (  13.68  )
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

Hi Palmer,

On Wed, Nov 17, 2021 at 2:17 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> Let's enable KVM RISC-V in RV64 and RV32 defconfigs as module
> so that it always built along with the default kernel image.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
> Changes since v1:
>  - Rebased on Linux-5.16-rc1
>  - Removed unwanted stuff from defconfig PATCH1
>  - Dropped PATCH2 and PATCH3 since these are already merged via KVM tree

Like you suggested, I have removed unwanted stuff from
defconfig PATCH.

Can you consider this patch for Linux-5.16-rcX ?

Regards,
Anup

> ---
>  arch/riscv/configs/defconfig      | 2 ++
>  arch/riscv/configs/rv32_defconfig | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index c252fd5706d2..ef473e2f503b 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -19,6 +19,8 @@ CONFIG_SOC_VIRT=y
>  CONFIG_SOC_MICROCHIP_POLARFIRE=y
>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
> +CONFIG_VIRTUALIZATION=y
> +CONFIG_KVM=m
>  CONFIG_JUMP_LABEL=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 434ef5b64599..6e9f12ff968a 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -19,6 +19,8 @@ CONFIG_SOC_VIRT=y
>  CONFIG_ARCH_RV32I=y
>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
> +CONFIG_VIRTUALIZATION=y
> +CONFIG_KVM=m
>  CONFIG_JUMP_LABEL=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
