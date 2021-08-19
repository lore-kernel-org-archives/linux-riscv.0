Return-Path: <SRS0=mZrj=NK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC66C4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 03:11:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 614C460EBD
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 03:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 614C460EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vGW844FoOFbNLbUH+AGquPmqycnvMggO7wopyg7//EM=; b=NqNp/J53g6dnFl
	lcNh+yQ+BmqTqnZ4L7i94ecRdZgK92YrLLJdFATDm2avLPVhFCLjP+KoYsvx3FpsBJPbpd0jZDtr2
	KvQuCND+rV4ajmrYtr+1W9puSFhw4QlOLNfZzNNKgTSW1arfddctzbJIf5YkspZlGZYX++wz8C+J/
	AGF4zlbkt7bsEpdw9X47v291ZnvwZ4Jx+YyGTiRRraTg89kjOITKYpwetMyHAWi79O2anQnfdjLSY
	0vKiftN80IR4E6pi6Bk2w/b9XECulsJR0E2uENH3lRnPMA/T1Tcb69P4r3eofywXCM6aT4dXqyOwM
	yAhFgmEJ5W68C/DA1OaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGYS9-0079ZZ-0u; Thu, 19 Aug 2021 03:10:49 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGYS6-0079YG-U8
 for linux-riscv@lists.infradead.org; Thu, 19 Aug 2021 03:10:48 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id p4so9540120yba.3
 for <linux-riscv@lists.infradead.org>; Wed, 18 Aug 2021 20:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oPimCmfapHOlzWNF2PPhKvm04+9IOZnhcwkF9fEYFus=;
 b=XFPy4x2LjgGqBSSCHaaq0795IL9VWSfPQxX12vQ9hAPjHrkLmlkZhQTj8Y9pDsN+gg
 hPmt+wkZzj/lJ49kzCsVrTlLv5eVcyyiRZjH4SpMDays56FkWoQJFoRcljDIQmOlQh28
 sbWEGBRZePrhK7Gi1jT/nQVt//246rImKbAhtLgjgyJHQvRppJm9WFKxLxwp4m5ELEQe
 /zCLJSL83Bda1dn5a1vu/qOe7jnlJOtzelEI0fwaDIXgnaGaGOY2dFqBnMh/NwhIgPHf
 Ngwcm1DJU8MsKiDqHee96sHaWdwgknD4HmI3eSXEHcaMU/kAO3PcoTs4bgxHvXjvtSfE
 VFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oPimCmfapHOlzWNF2PPhKvm04+9IOZnhcwkF9fEYFus=;
 b=oF2HfeHUxAC/ND9Zx1+7AjJxu7PWVBAu1OfwTOnix7h+uzbANeyuPlKV6VdY3Lbelh
 3V/hf0+ExrRlSu+HrVWrNDtEEjQpHyXRB85qByhbVHu5DiDVnHYEh2fHhnr/KOghaPkz
 7QBrbvlReK30r6+BgQ/3LKUFhEdx+CLarxIJcBI3tDdePBexv402Yy7VnpD7jk0uJdXI
 +7HXqunV27zczNVlDewqu1vCWs8/jS6oEfGjpjTUHEpAxUhRp+eHqfFBr/mMU+wtVsUW
 2Yt0N4x9LVzLnVV5d5pfAut+oE1+uLZDO7a6jnZftyTFUJkXkAk8Qa+tc6IwtKK+sb8v
 KbmA==
X-Gm-Message-State: AOAM530S/J2B+gxYDEdhdFxmOHViFGhhphLS90mS+Fx9J+KyTcamXJsI
 e8UjjK/EfmIAxgbfocD5JejAaxcEjYkyQT8Nuis=
X-Google-Smtp-Source: ABdhPJxmgzMx9Yye/aziYhTeoHw2LnJ80f4jTojPyOeB6B4p5MmonChI49jjg+NoCs2o5oD9aLZie2nLVCxBma9jIis=
X-Received: by 2002:a25:e70c:: with SMTP id e12mr15959000ybh.220.1629342642961; 
 Wed, 18 Aug 2021 20:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210804123015.807929-1-bmeng.cn@gmail.com>
In-Reply-To: <20210804123015.807929-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 19 Aug 2021 11:10:31 +0800
Message-ID: <CAEUhbmXxGJMoS-qDncjx5uPqTz7h-aE+h=gLd==tpgLt=uy7Yg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] riscv: dts: microchip: Use 'local-mac-address' for
 emac1
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Conor Dooley <Conor.Dooley@microchip.com>, 
 Atish Patra <atish.patra@wdc.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Bin Meng <bin.meng@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_201047_017564_0A9E6FFA 
X-CRM114-Status: GOOD (  14.91  )
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

On Wed, Aug 4, 2021 at 8:30 PM Bin Meng <bmeng.cn@gmail.com> wrote:
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
> Reviewed-by: conor dooley <conor.dooley@microchip.com>
> ---
>
> (no changes since v1)
>
>  arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Ping?

It looks like these dts patches are still not applied...

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
