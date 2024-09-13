Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C749FA3755
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 14:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YxoBlnhvQgmCgJP3re3AF12D2l6IunHZ1RXAEweuiu0=; b=xAEriwo/Zob4lF
	u3AIQfva2+Hc5e4QAXJFh2h2HWqBt2SJi5bOelv0yFHvT2L3OY2cx6NUvHQz3Q5RWCLnbNPXY/ven
	JEjHad/mMtHujye+0xK8YCwWGVR8LpEi38iaCG+C3XmobO2dEtPhtS8lZfCZv95rXx1BeaC4xUnWJ
	S937JxoJePEDUjjRvVF1F3a3JQMoi1n3Ge1RrvT7vuvyzUNpvwHu4A64FSgDpsdXjPJClr+HNE7dn
	S0ehJP8ZalL2RqMlUiYYp2/JJvnDF7nC19+UNH6XOyNCBl0cCDju+6jilivGZD2e4jwdP2YJDHhZt
	OMgy3TRxhlPLiPzwtL7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp7Xv-0000000GEoT-0aPp;
	Fri, 13 Sep 2024 14:45:15 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp7Xr-0000000GEnw-3znq
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 14:45:13 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2f74e468aa8so25379211fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Sep 2024 07:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726238710; x=1726843510; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hRlsoz0SQi6Y31kBnSS0wNEmQwFLdHQJn6urXpVey+s=;
        b=agyICbuRCARMgW0M4/ZLZh1MX/ESyoJO+CuE0v6rHHvUg5Oo6qNwt39yAvOfKg7QVn
         LxYxtOJ2vWy4rhKQc8bHhrHJyWQp0li113P/Bqi+E9gErbzq9mLO4+I5DtsZ4LYfLQj1
         EX2FbHnVNlPb2bJ6BNmjOLmnr/QJPqk1rUept69xIXj/U0ayRELfo/29dbmMQqbDEUF2
         KnKz+VDyCBtcpL0cYSqA6Az43rXmy8XTFsN6FSmWsbidmXRftOQYuEM1XsURZ1559QB4
         KTtylujKWCOfd61y0PDwU4+1eu45nhpyxn5X3aLX1n3aJDb0LUW9Iqlf1LSUwuQsFD8T
         OuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726238710; x=1726843510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hRlsoz0SQi6Y31kBnSS0wNEmQwFLdHQJn6urXpVey+s=;
        b=mmbiFr5F1MbQm3ulu9BFIjnUQzMETmJeL7ypRZtw3pfbHwFfZO/KpOthLceEc/UztS
         VA5c/gK6Le7cHcetSO6VApxcWmFMF6xjlVqlJWzjUi+x1V/N7RFv3e0cS0SCt2eVDj2K
         PopIMqY29+U9oeQMJkSXcLupNEFgKzKlWsPpDRAfvGqjIYEJnihbh3W64qJtzEaFIN/1
         SVPv+jt3tx6SXaz8Z6AOAEqdqtZJVxc5ayQtnzkjdAhQzIqr+38dEG8O+TUrAqCCjPNm
         nOcrP8F2ztYN+I+7QXC2t0eGvex2i/zm5h3gU/vq26EXugjuL8IUpZjRoodMoJKY2B0w
         /TwA==
X-Forwarded-Encrypted: i=1; AJvYcCWthNjwYLWOJKuvIV+fxbSvcmfgn2FZSGf/4/y/OEAQRJV1q0/l5UmBZH4zDDCw/PChT/o6d8MIYK+skg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjAejk7ghkTZDa6mOxEAvj3A7/r1wKVNoIhVosGWlhWNQ0Gaea
	z6ffOQygZ3SSNeqW7wA/PT7VjF+/yLwpr5q49Pmi/reZheEgyDv3bLwPIbfKRBrPPJA3r/bw62b
	2bHP3qj1ySECK2EwGk0RDWaurgd3gFwkbFWzlfg==
X-Google-Smtp-Source: AGHT+IHUFXrwlfPMaxEeDNt9yglyljvYbg/DLrmw5ptYs+I26fJbLl2Yz4iDT0/avZHjhVpNTTnBoHkg2kD6Gg/9LqI=
X-Received: by 2002:a2e:4c19:0:b0:2f6:d5e2:7889 with SMTP id
 38308e7fff4ca-2f787ddf348mr27934931fa.19.1726238709788; Fri, 13 Sep 2024
 07:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
In-Reply-To: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 13 Sep 2024 08:44:58 -0600
Message-ID: <CANLsYkwC0hW3YPmfxOCW+sQcNVVficvPX0+yhsTnKb70f_4taA@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Add Microchip IPC mailbox and remoteproc support
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	peterlin@andestech.com, dminus@andestech.com, conor.dooley@microchip.com, 
	conor+dt@kernel.org, ycliang@andestech.com, jassisinghbrar@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_074512_017852_2DADBF0F 
X-CRM114-Status: GOOD (  22.76  )
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
>  10 files changed, 1250 insertions(+)

It might be easier to split this patchset in two and proceed
incrementally, i.e upstream the mailbox driver first and then the
remoteproc part.

Regards,
Mathieu

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
