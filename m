Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37338C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Dec 2021 08:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29PwfQXXex7i9abYBPKzSVPR880wgpL42ZmDhyBHKHQ=; b=jdx5741UG7L/Yw
	luMBGwcY4zn4SFk+TbJEvxXtKH8Bi0c/NDQMmxIc392SNW00yAzUNTOy+0QEcO2ku287wHr3oCJYL
	eEcTk0XL2FzIDtLlGeSvUTmzdujARte/1GRlqd747WPiN5MXR6LPaMdarWBY275MR4pSVxk0OQUXf
	VpnIMl9/ebxeekG+ymVqprRmvGM+pjYfbDNj8q5NOLsaz4o2PuOqNHW02DUd1MZ/BnHGWhHhuW/5g
	zhaKgotmras5pn5Mea+/33uvhUnlB5bjAYD4LlhflQ4LvMo9zMlDeWIhJRZAscdkh+SvZDpV9OAhU
	ajnc3TWkxnX2F8tyY8SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muVeB-007Rxu-Li; Tue, 07 Dec 2021 08:16:23 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muVe4-007Ru6-O2
 for linux-riscv@lists.infradead.org; Tue, 07 Dec 2021 08:16:18 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso1104356wms.2
 for <linux-riscv@lists.infradead.org>; Tue, 07 Dec 2021 00:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wV05YmqytZZ4i77GlP1Brthyva63mRUa2qE0+W2OXv4=;
 b=cC1Hbczjdh2dzt9ciK2qiKC3ZkYz1fGNc8p1h3oLUa2PWAkb2rVdSC0aavqJ+hIEzx
 pcvAhgPMbMkSHKM2in+pdz8ejZ2PqF/iimPZYtPQuW4YbhrLGril86javjmtKtUImtuH
 ZbQ9sVHkJZyetxai1yhoAKKC9qIRnccfGo4bqqCYFOUoJ0nMsc4ZaNR4ohPMMBMLYeq7
 5uSC9mLsvmQineh9UG21iURMUPJPQuwv8iGgoi/PBa323WyfEWbcdE7FWPdyC/L6aDau
 PXbmlej1r2JWIDKbmZZVVFWUIEidbsWHPyibno6dYOAKDAvZ/QWNTpn80CUMKZO2uJqe
 Q38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wV05YmqytZZ4i77GlP1Brthyva63mRUa2qE0+W2OXv4=;
 b=e6itUmw7UtfxYIDbTLwXH7d0dJytVlCDWlVRHQdUTXQK75cNB8h2+Ca5UYnCWRaFw+
 ayZeWGgDzaI025uRyc6OFFsL49NOASwtuq09ehOq8BsbTvzMshGafWBKVFilDhCCWoBc
 uiWzbp1mIhlxgaDz5ShM7YrY4vO/AVS81sma2mjIZwkSCqSVz673DT258BiDpvubtFvH
 P6mHjtF7Wg9pP0vnPN53Pvy2/sxlYLmtxxTj7wYEP3sGwjs2Zrl074qrpW4IFG/nYOl5
 Pkbxd1mLlrFpd9sHrjGDix3FDLSrc9DX9HQMpkQRXer3eU6makceKWgIvOdORwtcW4py
 B/Vg==
X-Gm-Message-State: AOAM531qafHVL2U9wRN3mIFYVLy5OojQEKMJDVcZ1eWLWW2wEx1iTgxn
 5+E8QVOy5EMXrzzFo2EKwaGPDpOADsQJGiuYizDYlQ==
X-Google-Smtp-Source: ABdhPJy/5bX081hEllcHF+ciiU1wOWxT4YMmlv0lSO4Mp0uNC6xawLDFYKeG14mC3/pJJ+ZqaKc0D9h7/Cwk8IFQCsM=
X-Received: by 2002:a7b:c7cd:: with SMTP id z13mr5087144wmk.59.1638864974238; 
 Tue, 07 Dec 2021 00:16:14 -0800 (PST)
MIME-Version: 1.0
References: <20211207080843.21222-1-arnaud.pouliquen@foss.st.com>
 <20211207080843.21222-6-arnaud.pouliquen@foss.st.com>
In-Reply-To: <20211207080843.21222-6-arnaud.pouliquen@foss.st.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 7 Dec 2021 13:46:03 +0530
Message-ID: <CAAhSdy3GDArfbQgusdDg-mi1bdTfDhFMaF4qa5-KFv1regwJ-Q@mail.gmail.com>
Subject: Re: [PATCH v8 05/13] RISC-V: configs: Configs that had RPMSG_CHAR now
 get RPMSG_CTRL
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, 
 julien.massot@iot.bzh, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_001616_867312_BFC2B451 
X-CRM114-Status: GOOD (  13.52  )
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

On Tue, Dec 7, 2021 at 1:39 PM Arnaud Pouliquen
<arnaud.pouliquen@foss.st.com> wrote:
>
> In the patch "rpmsg: Move the rpmsg control device from rpmsg_char
> to rpmsg_ctrl", we split the rpmsg_char driver in two.
> By default give everyone who had the old driver enabled the rpmsg_ctrl
> driver too.
>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> cc: linux-riscv@lists.infradead.org

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/configs/defconfig      | 1 +
>  arch/riscv/configs/rv32_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index c252fd5706d2..c0439d3ffb8c 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -97,6 +97,7 @@ CONFIG_VIRTIO_BALLOON=y
>  CONFIG_VIRTIO_INPUT=y
>  CONFIG_VIRTIO_MMIO=y
>  CONFIG_RPMSG_CHAR=y
> +CONFIG_RPMSG_CTRL=y
>  CONFIG_RPMSG_VIRTIO=y
>  CONFIG_EXT4_FS=y
>  CONFIG_EXT4_FS_POSIX_ACL=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 434ef5b64599..99eabad7ca0f 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -89,6 +89,7 @@ CONFIG_VIRTIO_BALLOON=y
>  CONFIG_VIRTIO_INPUT=y
>  CONFIG_VIRTIO_MMIO=y
>  CONFIG_RPMSG_CHAR=y
> +CONFIG_RPMSG_CTRL=y
>  CONFIG_RPMSG_VIRTIO=y
>  CONFIG_EXT4_FS=y
>  CONFIG_EXT4_FS_POSIX_ACL=y
> --
> 2.17.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
