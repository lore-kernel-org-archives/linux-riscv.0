Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8123C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 15:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kyKG11WYzhfLVBWsvFeon+EpDrS34Zre9HrTeEnibg0=; b=XiG6zH4zjaQKWu
	VvvI68fWtkruBWlhljy6XS1Evt2/a7Lqf6ubxsXDrzpeTMJr3fbgLe3PrpWhN5pNrQ+uq0ko7PxfR
	PdOVogumSGHEgu/AS6mSdHxZDrjc2qG9sdxl4FI0TUA8kYtRYq+MUxc/y5oZTOnJ34G+niGiFPGvO
	p9tJZd8yJtD7XTifV2adGXQPAugsOafpYEu9m9Vq8Q1xCG1ZeqyAkDPZMmHnd6oScvwHPEfEiWX2J
	CxzxGh16c5ina4DVrlt8xFbyDnMfg3QrcgNzvIl5KU3gxITAKTDpAtLp4VF8/ndpuM1mwG+iVnlCn
	7kq0bWBmoL9K4rSXZh0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOi9g-00DBZx-Lt; Mon, 28 Feb 2022 15:41:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOi9c-00DBYd-Gw
 for linux-riscv@lists.infradead.org; Mon, 28 Feb 2022 15:41:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EB72AB80E5D
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 15:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99322C340F1
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 15:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646062897;
 bh=kUHj0dIOXGHqtRWBFs95OAMPTNPiain1rxD1sCE0X+o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RPL8O27wy227IH6hDihlMeTKAdbi9LQDnLtlsiiouWp4R1IzvBA8ofH2xN7GASBr9
 IttqVHeMJMNAncDEmvWOiWGLhYi0Lb3g77NPL1xxvEdmfT/kwBSMayvVYzRnlTF7Qr
 +V8WFqryXaLG797SYz0zkSm+ND1hQgo2Goswh5KNVLr9d325z8wCUmMxvkxnF1CmIk
 JMjCdqwAudTgRYBh02xfXRa+8wcG3TgLLsNdmjkzm/P8TMa8TXU6hneRUiL5ux/TwR
 VVvvRysT4HBDbCaCyUHh3cFjjFr8D3bVprN275xSp8FTVT352BkWuKTSQZmH1MQ/fu
 qvHfr8aeyJbiw==
Received: by mail-wm1-f51.google.com with SMTP id
 k29-20020a05600c1c9d00b003817fdc0f00so1045962wms.4
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 07:41:37 -0800 (PST)
X-Gm-Message-State: AOAM533zU4g/tUMu+iCrK36BxXs4K58lvMWaGTALmAVDzhXB0BevDJg/
 Ab4FhnuipYQNM5K9pT3lJG5vjFHSS9nHPBm3b0k=
X-Google-Smtp-Source: ABdhPJxISiZ41KAtSIiPPfznP2BMAZANGGomoQBB+i3Aqrew6fpEKZrCd96CMlxa7yjxEx4ZivbdLNGkQjrtoXzO9Ak=
X-Received: by 2002:a05:600c:4f8e:b0:381:6de4:fccc with SMTP id
 n14-20020a05600c4f8e00b003816de4fcccmr3161768wmq.82.1646062895799; Mon, 28
 Feb 2022 07:41:35 -0800 (PST)
MIME-Version: 1.0
References: <20220228152658.3367506-1-arnd@kernel.org>
 <b8eb2e55-b5a8-4a39-86cb-93cadbd67922@conchuod.ie>
In-Reply-To: <b8eb2e55-b5a8-4a39-86cb-93cadbd67922@conchuod.ie>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 28 Feb 2022 16:41:19 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1NWuoHVWXVZUGJxSg=D0d3umrMzWqZ75devfOwO-JhuQ@mail.gmail.com>
Message-ID: <CAK8P3a1NWuoHVWXVZUGJxSg=D0d3umrMzWqZ75devfOwO-JhuQ@mail.gmail.com>
Subject: Re: [PATCH] SoC: polarfire: fix build warning
To: Conor Dooley <mail@conchuod.ie>
Cc: Lewis Hanly <lewis.hanly@microchip.com>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Arnd Bergmann <arnd@arndb.de>, 
 kernel test robot <lkp@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_074141_157384_A5D61DE8 
X-CRM114-Status: GOOD (  16.57  )
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

On Mon, Feb 28, 2022 at 4:35 PM Conor Dooley <mail@conchuod.ie> wrote:
>
> I had sent a fix for the build warning on saturday morning - but I guess
> you missed it.
>
> Thanks for fixing it anyway :)

Thank you for your quick reply. I had indeed missed that fix. You did the
right thing here by sending it to Nicolas, but he hasn't had a chance to forward
it to soc@kernel.org yet, so it was not visible in patchwork.

As it turns out, your patch is correct and mine was wrong anyway, so I
have now replaced my patch with yours.

Nicolas, I hope that doesn't cause you extra work. If you have picked it
up into your tree, you can drop it again from there.

          Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
