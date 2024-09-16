Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26F2C3ABA2
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2024 15:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=knA0Pyg/qtRvx/0YbwBncC3YDZmSeT41BOYlFBSyXxM=; b=ArVoU9n5i2BJIR
	DgG4SJnbHINj3lY4iSbbZ/3go7VUB9oXdXD65CuD/SN/P5pyrdeSN1XTeqGl9VAIAguEgB5RdkEuD
	DM0mZlJn8oy825GG0/ZbEHUEMwkFt8khS3xs5pnAcUawIOJ9BLLn/YLqkYYXc5XLszabILJLXC/YL
	GpufwCrcLJqYecD2MuDlUGyL6F7x3oPbqPLWgFogH4CX9xohRbMefzjClS7TT7CNQXVxIyY+mt1Wa
	zFMZ3//RFoKlSCeWqs9aT4wRFVAARODh+yj2p+2/vIOnUCTmGZ8vzpzGugA/NreE5Ju2LvU6c3goK
	o8RECWQCbcWfGsZCSbjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqDHb-00000004I6Y-02jR;
	Mon, 16 Sep 2024 15:04:55 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqDHX-00000004I5k-3mqO
	for linux-riscv@lists.infradead.org;
	Mon, 16 Sep 2024 15:04:53 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5c42f406e29so2912462a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Sep 2024 08:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726499089; x=1727103889; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hdt/C3X2PP3Zg5PnoGqtBdwBBLQg7apsiImcH1HDjNw=;
        b=Dl6BN/RNcoPK0UQ9YhuNw8VB3ZJEng0hcr8X7gNk0Mc7zhXJdNo7/KVksXjJ3+C27H
         4OAuRwev0fvOfQJVuQLsIBFHUGwS0D6bLH+TVs5GmMhRG5A2gBF9SA5c7ghw5dXoCZH6
         KL9HHRkucWuplHf76hOafHkgb/vUPJS2BMQCi3yjcXavo2TG66uCSJCLp1Up1M0nk/pq
         imRQND2A/6VsiHCWkvSmV8XVPShNjqRe0eHY9izxf+xrW+R0sf3Ajz/7S+450urfAejk
         NBd6sQLUP2vnwLqiJmlBcBRMO5nN4x5pGXzRt+AG0M7LnK9hAwe16f48Su7Rp+IFN078
         oRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726499089; x=1727103889;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hdt/C3X2PP3Zg5PnoGqtBdwBBLQg7apsiImcH1HDjNw=;
        b=kT7GeqemleAE/c+YWmohPR7799h5Ru6U/GISb2W1NhQId2iYw9rDATo0hD7zCR4a9j
         VwwvHKqQmGN/aJ9L6zuejpOKMAUpglf9NDz6F3V9D4LJRaPPw2+xfEFhCK0YhQjjLbZ4
         48nY+v2PzX973MHmQOFKffbKRU2UXbf7RcyFXXcOu6KIRjlSW5JCA1TeuBHuOKQTDkE5
         yRO+vykPzt1EkHKvOdfYu3IViyzOqhMmLjomQQKfCH+S5MTe3+WLjtuXIhVAwo9b37bn
         5iIHPUyhDtcDkPaSgma5MjJGPZHE19cMEE9h0szQSTQHpwLtlGqI2z98uHaNzKOsG9VX
         58pg==
X-Forwarded-Encrypted: i=1; AJvYcCUrRubDBke3STyMcJ3q9prXy5Tl4G8vfTVg9AUkaXmX6swFMJb2YzDDnFAHIBo0tQhpJ6GcyUV6zqBWLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhkVqfjYfGdn174FMTxmqwsRmUs5ea9NGhZpUUEkuDiYF5Bj5U
	1MrvVgq7LtkuxGLiS6MvBvfKiqUJlcaNLDTwwpPIaZUaWl68hqYNEYn/sg7hX/FJS51cgFRJvz9
	jFpq0LlXQmDSWRDCU3k4U6F9KLegeDkyBx7c7QA==
X-Google-Smtp-Source: AGHT+IG953y/v5dl5p5Z3LL49kO5fYc2xRp4hHw8+JoAMYA8z1TeDNMF/zfkoylCATu6XMkcxeBAsRZUu5pz6qqEpaE=
X-Received: by 2002:a05:6402:2347:b0:5c4:23ad:89b4 with SMTP id
 4fb4d7f45d1cf-5c423ad89e8mr9452741a12.26.1726499088917; Mon, 16 Sep 2024
 08:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
In-Reply-To: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 16 Sep 2024 09:04:37 -0600
Message-ID: <CANLsYkzGiB+vkjHKkHYhZEK+MK-Uid0VxcqsBUJG0ZbmCQCeqg@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Add Microchip IPC mailbox and remoteproc support
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	peterlin@andestech.com, dminus@andestech.com, conor.dooley@microchip.com, 
	conor+dt@kernel.org, ycliang@andestech.com, jassisinghbrar@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_080451_963744_A26B2E77 
X-CRM114-Status: GOOD (  22.72  )
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

Hi Valentina,

On Thu, 12 Sept 2024 at 10:48, Valentina Fernandez
<valentina.fernandezalanis@microchip.com> wrote:
>
> Hello all,
>
> This series adds support for the Microchip Inter-Processor Communication
> (IPC) mailbox controller, as well as an IPC remoteproc platform driver.
>
> Microchip's family of RISC-V SoCs typically has one or more clusters
> that can be configured to run in Asymmetric Multi-Processing (AMP) mode.
>
> The Microchip IPC is used to send messages between processors using
> an interrupt signaling mechanism. The driver uses the RISC-V Supervisor
> Binary Interface (SBI) to communicate with software running in machine
> mode (M-mode) to access the IPC hardware block.
>
> Additional details on the Microchip vendor extension and the IPC
> function IDs described in the driver can be found in the following
> documentation:
>
> https://github.com/linux4microchip/microchip-sbi-ecall-extension
>
> The IPC remoteproc platform driver allows for starting and stopping
> firmware on the remote cluster(s) and facilitates RPMsg communication.
> The remoteproc attach/detach operations are also supported for use cases
> where the firmware is loaded by the Hart Software Services
> (zero-stage bootloader) before Linux boots.
>
> Error Recovery and Power Management features are not currently
> supported in the remoteproc platform driver.
>
> The PIC64GX MPU has a Mi-V IHC block, this will be added to the PIC64GX
> dts after the initial upstreaming:
>
> https://patchwork.kernel.org/project/linux-riscv/patch/20240725121609.13101-18-pierre-henry.moussay@microchip.com/
>
> Thanks,
> Valentina
>
> Valentina Fernandez (5):
>   riscv: asm: vendorid_list: Add Microchip Technology to the vendor list
>   dt-bindings: mailbox: add binding for Microchip IPC mailbox driver
>   mailbox: add Microchip IPC support
>   dt-bindings: remoteproc: add binding for Microchip IPC remoteproc
>   remoteproc: add support for Microchip IPC remoteproc platform driver
>
>  .../bindings/mailbox/microchip,sbi-ipc.yaml   | 115 ++++
>  .../remoteproc/microchip,ipc-remoteproc.yaml  |  84 +++
>  arch/riscv/include/asm/vendorid_list.h        |   1 +
>  drivers/mailbox/Kconfig                       |  12 +
>  drivers/mailbox/Makefile                      |   2 +
>  drivers/mailbox/mailbox-mchp-ipc-sbi.c        | 539 ++++++++++++++++++
>  drivers/remoteproc/Kconfig                    |  12 +
>  drivers/remoteproc/Makefile                   |   1 +
>  drivers/remoteproc/mchp_ipc_remoteproc.c      | 461 +++++++++++++++
>  include/linux/mailbox/mchp-ipc.h              |  23 +

I would advise splitting the two patchsets, i.e one for the mailbox
driver and another one for the remoteproc.  I would also start with
the mailbox and then go with the remoteproc.

Thanks,
Mathieu

>  10 files changed, 1250 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/microchip,ipc-remoteproc.yaml
>  create mode 100644 drivers/mailbox/mailbox-mchp-ipc-sbi.c
>  create mode 100644 drivers/remoteproc/mchp_ipc_remoteproc.c
>  create mode 100644 include/linux/mailbox/mchp-ipc.h
>
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
