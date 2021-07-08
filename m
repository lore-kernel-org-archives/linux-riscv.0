Return-Path: <SRS0=GvX2=MA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4898DC07E96
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jul 2021 13:41:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1529C613C1
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jul 2021 13:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1529C613C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khD7IwAJKMpfPCa78Lijid+tAGJnki/zCsgt80cHDeo=; b=Od8LhKyfRdgrG7
	kIsyChW+bGUPbq+7Byoj0Tx1DxJtAG9XAV8+BDFJitKIkjYI3pQgL+8tg2jQlE4rnM2tSPCQzryFP
	k0YJ3JvudmyuBdiLBeVxJWwmIxx9gpaOeCxEz6ldTQzz7w1uIZgNHU3sOSidYZwXweOtCmXk/yI5t
	eFbQuhlLyNuzMdYQqafopCImyX65ZfCtG82hWIWQbaWgcIVT3WXi4V9hUS8vOdge4TxfDUK4h+7B/
	oPqZJJUJ0eagDs/vIDsTC6PcSTSqfI6X3MooLz3H/GVHAEodgHB72EVZipmVX9B70gcE2c0zjrJp3
	LNnhb3XnIdNH1RVhoXqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1UGm-00H7N0-LN; Thu, 08 Jul 2021 13:40:48 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1UGk-00H7M2-0Q
 for linux-riscv@lists.infradead.org; Thu, 08 Jul 2021 13:40:47 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id v189so517224ybg.3
 for <linux-riscv@lists.infradead.org>; Thu, 08 Jul 2021 06:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HhbJLZfgKwOET9rHWiznBr4jI2d+iOS8kqNDZ68pA/k=;
 b=IHUhf7vNXrqyxlz7frFamh0/KtgVgGVk6JLPTgXUjKdbJ+3kvLyu2XKuJonLPRi26S
 XbYPe7ClKlQHHkvzrNzmamLTdcOveHUsh9SyC8YY0WGLEwrIA2ADdSruXws1aYKcQlXG
 Num9DMBxupBXMRkkryAQb7J2vEE85nfRT/Ae690TBR+fEmvUgUxonImjpjWM5FT4IYrP
 k79M7a3BSXP1c4ceScDY/GNqKoWzkJLDssrUBSQdDJoS1IMRn5GkCuc417TNIKFwdsIe
 nP3rZ/nyzNfuqu14enRNM1s23jZHHp2kqZWw0Ylm0yTGcBYBpoo7EAxM+pzxNZmKf9WR
 Lfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HhbJLZfgKwOET9rHWiznBr4jI2d+iOS8kqNDZ68pA/k=;
 b=WnHmWS87Lg4xpA+fS/TqaTojTuK1wfUP1pEtWpKw+ciC114we8BmK/8tIacy7e5jtO
 3tu0vuvVP+8xU+APKsj76mAf+dLqvw14x3saL0g3EXZvHGx8HsLMkAu+hu5M8+GF1JV8
 jXeaSI5Eka8Zj/JhX7e/GR+f/PdVsuDVyJJpVkq6/0T4NhyewB0puZnSA45Z1J7MdDN+
 levICsvLphi+xWvQNArgnoq0+NAufnKgRzdXALfX5R9u27wYXPBKvzuLPFEiq+o/XLjc
 Mz3N73I8fY33HP26QzRV3cmEmTocfwRlOTbtBdpYLkPQjrCQwAI8rbloQztmCt+v5kal
 7wpg==
X-Gm-Message-State: AOAM532IBSIta5jFrlEw0WSuou0jhUwJR6XA2CbFrkaR4uZAtVRbO8iI
 4+8SOYL0S35P8hk7dJEdHOsyFLAwZ0JatJDM0Bs=
X-Google-Smtp-Source: ABdhPJzT7N5eVaaIUx2T5VzlnlE3hXtBWO7bZWZ1fPFhOUgcfv2PA/+AwsRJz5IrOPVqfVvxzcBEXSnNtCpYx2zNt50=
X-Received: by 2002:a25:b701:: with SMTP id t1mr36858908ybj.517.1625751644825; 
 Thu, 08 Jul 2021 06:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210702014319.1265766-1-bmeng.cn@gmail.com>
In-Reply-To: <20210702014319.1265766-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 8 Jul 2021 21:40:33 +0800
Message-ID: <CAEUhbmW2p22t=bFHJeNee2WpHEA6-smUzg6ffgqrfWcXx=iqfA@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: microchip: Use 'local-mac-address' for
 emac1
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Lewis Hanly <lewis.hanly@microchip.com>, 
 Atish Patra <atish.patra@wdc.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Cc: Bin Meng <bin.meng@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_064046_122093_236505E5 
X-CRM114-Status: GOOD (  13.37  )
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

On Fri, Jul 2, 2021 at 9:42 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Per the DT spec, 'local-mac-address' is used to specify MAC address
> that was assigned to the network device, while 'mac-address' is used
> to specify the MAC address that was last used by the boot program,
> and shall be used only if the value differs from 'local-mac-address'
> property value.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Ping?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
