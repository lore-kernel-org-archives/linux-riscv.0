Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97F2C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Feb 2022 16:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7a5P9ak6lxs8zQM5+GtiOafIlbR92kBA9pimwHyKWnc=; b=EoyEZanCNhK7rI
	RNIou5Piv/jk++poFflFcfUPiPDpvJhtrutZlEg3tKjmvscIS141kWNZoNNxNuor7TxFkkCWcGdwj
	KLyCDbc/2AaUTZ1e8uPAGKcVRDQIzaBSF0hztStKjIAYwQWyHrivtQKwGrbAtPgDYmQfwsngF6W5M
	A1ZgLgXlgosOvIhtVOCWvnVrMXaSPwX60u3KwTjAuIogp/22I4X9ZS1tvdpMoWwoRzH69YtJKu+/z
	S1QWNrA4dCDiWrofZVwC4PP+kSsyiPLlrNuRUWlDgXIjVGpqUcE6LDZrV6r4MEM95Kl9lIzHqkSAC
	EuxMElbgG3Q3qakIqCUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHTB4-00Eojz-41; Tue, 08 Feb 2022 16:17:14 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHTAp-00EoYx-0p
 for linux-riscv@lists.infradead.org; Tue, 08 Feb 2022 16:17:01 +0000
Received: by mail-wr1-x430.google.com with SMTP id s18so31712950wrv.7
 for <linux-riscv@lists.infradead.org>; Tue, 08 Feb 2022 08:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aKXJwL4hvq55/LFdYG92ZXL3tNxjw52aAP4axBxnMOQ=;
 b=jj8IPRcCM4Er1aZyxSbz/MktKNiNx4Ny95ct6Z3tzw/KbWyYm9ZT6Zh5krVFlJUEtI
 NbWV6pKno0oTqEDgKAKVt+6zFPT2Gnahw3yTSYY5E1ajSkyC6B9il91yo15CRMnV/OhF
 7lXiKHbkXnK1OiOs5BYMUJfpoxXLHH5ykYwut+UlABSMRghx1RNx4PZ362ab5srOIHkx
 Y0DRDFr8IEzsfIgZE1ebyhdZGQe3fSWekS3qdunmI6unFlWZsYd1k3bicTp98Ft6VFWx
 mTZVwvQm1ZCb6ksXAarSL1cXCsAREAGAVgXgujO5aIXd/46AQwWS41D/F3MjMz53Sqps
 e+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aKXJwL4hvq55/LFdYG92ZXL3tNxjw52aAP4axBxnMOQ=;
 b=dVr8b7W0VKozegyZI08fTNX9Cb7ZLcxoarMCSZn4lm4ZNqCCj0mWxkE5RsTU4WARhY
 r3S6kF44UDFagID1bFpm/kz9yrOjV0VXfk0DSPCaFvB36Cikepf8yB/du602v5nx+3jS
 7y2Dzx4PtSfjz8CNJa5EK9nRzXqb/Q3aHxw8A8a+RcY3W7oc6y0npTiHut/3c4n6ptYJ
 JpJZ5vcErvkXXcEFWnWHYvaTB4BNE89LM9Cx8uCG0kkhglHOIG/K5lG+tmuufcCGr6SY
 rU7uyPTkIkB3+AamgJrlm/2Eu+VtnZW1mh7+jWDRS1CZP9KlMfB0I/2Ej5gRbBAyt20n
 jxeg==
X-Gm-Message-State: AOAM531AZDMT0NcjmF7Qqk2wgwdGXBugey4VxBQGFZ3CWmy/xY5cbCxW
 PcTnm0eXAvpkZ0VJqIXVJVJldViCggB+0sElQ2i3rg==
X-Google-Smtp-Source: ABdhPJxiIS9ZYI9gg0KVV2cfDvDLybSCPDmYGnzAe0Vc6ckA/KBv4MAS15wMskZNFjULgZghwbhmeosZthvL68ecAS8=
X-Received: by 2002:a5d:588d:: with SMTP id n13mr4175738wrf.690.1644337013676; 
 Tue, 08 Feb 2022 08:16:53 -0800 (PST)
MIME-Version: 1.0
References: <20220126114452.692512-1-apatel@ventanamicro.com>
 <20220126114452.692512-9-apatel@ventanamicro.com>
 <CAJF2gTQsSn1KBgX2bg2LiSUbCmbGD3oF5KcmK5gq2Dd49BWDBQ@mail.gmail.com>
 <CAAhSdy3Dkv6ga0ZMp5rMFa8nV9EDHgOMBwuJ4z4-w52T8EaUag@mail.gmail.com>
 <CAJF2gTSLmBcgUUE3VGsEq0JCWV74Yy-pkduS66rk=VPVwxk59g@mail.gmail.com>
 <CAK9=C2WqczG=tH1u9zcLt7Em+fPD1ZZwtDhf1yHJ70-o-HL8OQ@mail.gmail.com>
 <CAJF2gTSeH6w2Cfr5QEJTJ4ho_B4q3Eo2Xi+R_2yt+7CZCa+WBg@mail.gmail.com>
In-Reply-To: <CAJF2gTSeH6w2Cfr5QEJTJ4ho_B4q3Eo2Xi+R_2yt+7CZCa+WBg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 8 Feb 2022 21:46:39 +0530
Message-ID: <CAAhSdy3uaDz2tSgREqOX6s-e_Aqx5yJQRQ1-PCMxJ729V42kHg@mail.gmail.com>
Subject: Re: [PATCH v10 8/8] RISC-V: Enable RISC-V SBI CPU Idle driver for
 QEMU virt machine
To: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, 
 Sandeep Tripathy <milun.tripathy@gmail.com>,
 Atish Patra <atishp@atishpatra.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Liush <liush@allwinnertech.com>, 
 devicetree <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_081659_164016_10948938 
X-CRM114-Status: GOOD (  22.78  )
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

On Tue, Feb 8, 2022 at 8:22 PM Guo Ren <guoren@kernel.org> wrote:
>
> On Tue, Feb 8, 2022 at 9:25 PM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > On Tue, Feb 8, 2022 at 3:47 PM Guo Ren <guoren@kernel.org> wrote:
> > >
> > > On Tue, Feb 8, 2022 at 4:54 PM Anup Patel <anup@brainfault.org> wrote:
> > > >
> > > > On Tue, Feb 8, 2022 at 12:16 PM Guo Ren <guoren@kernel.org> wrote:
> > > > >
> > > > > Another question:
> > > > >
> > > > > Have you put "idle-states {" in qemu's DTS? or how do you test your patches?
> > > >
> > > > I usually do the following:
> > > > 1) Dump QEMU virt machine DTB
> > > > 2) Convert QEMU virt machine DTB into DTS
> > > > 3) Add "idle-states" in QEMU virt machine DTS
> > > > 4) Create QEMU virt machine DTB with "idle-states"
> > > > 5) Use the new QEMU virt machine DTB for testing this series.
> > > >
> > > > Here's one of the DTS files which I used for testing on QEMU virt machine:
> > > >
> > > > /dts-v1/;
> > > >
> > > > / {
> > > >     #address-cells = <0x02>;
> > > >     #size-cells = <0x02>;
> > > >     compatible = "riscv-virtio";
> > > >     model = "riscv-virtio,qemu";
> > > >
> > > >     chosen {
> > > >         linux,initrd-end = <0x8855d200>;
> > > >         linux,initrd-start = <0x88200000>;
> > > >         bootargs = "root=/dev/ram rw console=ttyS0 earlycon";
> > > >         stdout-path = "/soc/uart@10000000";
> > > >     };
> > > >
> > > >     memory@80000000 {
> > > >         device_type = "memory";
> > > >         reg = <0x00 0x80000000 0x00 0x10000000>;
> > > >     };
> > > >
> > > >     cpus {
> > > >         #address-cells = <0x01>;
> > > >         #size-cells = <0x00>;
> > > >         timebase-frequency = <0x989680>;
> > > >
> > > >         cpu@0 {
> > > >             phandle = <0x07>;
> > > >             device_type = "cpu";
> > > >             reg = <0x00>;
> > > >             status = "okay";
> > > >             compatible = "riscv";
> > > >             riscv,isa = "rv64imafdcsu";
> > > >             mmu-type = "riscv,sv48";
> > > >             cpu-idle-states = <&CPU_NONRET_DEF>;
> > > >
> > > >             interrupt-controller {
> > > >                 #interrupt-cells = <0x01>;
> > > >                 interrupt-controller;
> > > >                 compatible = "riscv,cpu-intc";
> > > >                 phandle = <0x08>;
> > > >             };
> > > >         };
> > > >
> > > >         cpu@1 {
> > > >             phandle = <0x05>;
> > > >             device_type = "cpu";
> > > >             reg = <0x01>;
> > > >             status = "okay";
> > > >             compatible = "riscv";
> > > >             riscv,isa = "rv64imafdcsu";
> > > >             mmu-type = "riscv,sv48";
> > > >             cpu-idle-states = <&CPU_RET_DEF>;
> > > >
> > > >             interrupt-controller {
> > > >                 #interrupt-cells = <0x01>;
> > > >                 interrupt-controller;
> > > >                 compatible = "riscv,cpu-intc";
> > > >                 phandle = <0x06>;
> > > >             };
> > > >         };
> > > >
> > > >         cpu@2 {
> > > >             phandle = <0x03>;
> > > >             device_type = "cpu";
> > > >             reg = <0x02>;
> > > >             status = "okay";
> > > >             compatible = "riscv";
> > > >             riscv,isa = "rv64imafdcsu";
> > > >             mmu-type = "riscv,sv48";
> > > >             cpu-idle-states = <&CPU_NONRET_DEF>;
> > > >
> > > >             interrupt-controller {
> > > >                 #interrupt-cells = <0x01>;
> > > >                 interrupt-controller;
> > > >                 compatible = "riscv,cpu-intc";
> > > >                 phandle = <0x04>;
> > > >             };
> > > >         };
> > > >
> > > >         cpu@3 {
> > > >             phandle = <0x01>;
> > > >             device_type = "cpu";
> > > >             reg = <0x03>;
> > > >             status = "okay";
> > > >             compatible = "riscv";
> > > >             riscv,isa = "rv64imafdcsu";
> > > >             mmu-type = "riscv,sv48";
> > > >             cpu-idle-states = <&CPU_RET_DEF>;
> > > >
> > > >             interrupt-controller {
> > > >                 #interrupt-cells = <0x01>;
> > > >                 interrupt-controller;
> > > >                 compatible = "riscv,cpu-intc";
> > > >                 phandle = <0x02>;
> > > >             };
> > > >         };
> > > >
> > > >         cpu-map {
> > > >
> > > >             cluster0 {
> > > >
> > > >                 core0 {
> > > >                     cpu = <0x07>;
> > > >                 };
> > > >
> > > >                 core1 {
> > > >                     cpu = <0x05>;
> > > >                 };
> > > >
> > > >                 core2 {
> > > >                     cpu = <0x03>;
> > > >                 };
> > > >
> > > >                 core3 {
> > > >                     cpu = <0x01>;
> > > >                 };
> > > >             };
> > > >         };
> > > >
> > > >         idle-states {
> > > >             CPU_RET_DEF: cpu-retentive-default {
> > > >                 compatible = "riscv,idle-state";
> > > >                 riscv,sbi-suspend-param = <0x00000000>;
> > > >                 entry-latency-us = <10>;
> > > >                 exit-latency-us = <10>;
> > > >                 min-residency-us = <100>;
> > > >             };
> > > >
> > > >             CPU_NONRET_DEF: cpu-nonretentive-default {
> > > >                 compatible = "riscv,idle-state";
> > > >                 riscv,sbi-suspend-param = <0x80000000>;
> > > >                 entry-latency-us = <100>;
> > > >                 exit-latency-us = <100>;
> > > >                 min-residency-us = <1000>;
> > > >             };
> > > >         };
> > > >     };
> > > >
> > > >     soc {
> > > >         #address-cells = <0x02>;
> > > >         #size-cells = <0x02>;
> > > >         compatible = "simple-bus";
> > > >         ranges;
> > > >
> > > >         flash@20000000 {
> > > >             bank-width = <0x04>;
> > > >             reg = <0x00 0x20000000 0x00 0x2000000 0x00 0x22000000 0x00
> > > > 0x2000000>;
> > > >             compatible = "cfi-flash";
> > > >         };
> > > >
> > > >         rtc@101000 {
> > > >             interrupts = <0x0b>;
> > > >             interrupt-parent = <0x09>;
> > > >             reg = <0x00 0x101000 0x00 0x1000>;
> > > >             compatible = "google,goldfish-rtc";
> > > >         };
> > > >
> > > >         uart@10000000 {
> > > >             interrupts = <0x0a>;
> > > >             interrupt-parent = <0x09>;
> > > >             clock-frequency = <0x384000>;
> > > >             reg = <0x00 0x10000000 0x00 0x100>;
> > > >             compatible = "ns16550a";
> > > >         };
> > > >
> > > >         poweroff {
> > > >             value = <0x5555>;
> > > >             offset = <0x00>;
> > > >             regmap = <0x0a>;
> > > >             compatible = "syscon-poweroff";
> > > >         };
> > > >
> > > >         reboot {
> > > >             value = <0x7777>;
> > > >             offset = <0x00>;
> > > >             regmap = <0x0a>;
> > > >             compatible = "syscon-reboot";
> > > >         };
> > > >
> > > >         test@100000 {
> > > >             phandle = <0x0a>;
> > > >             reg = <0x00 0x100000 0x00 0x1000>;
> > > >             compatible = "sifive,test1\0sifive,test0\0syscon";
> > > >         };
> > > >
> > > >         pci@30000000 {
> > > >             interrupt-map-mask = <0x1800 0x00 0x00 0x07>;
> > > >             interrupt-map = <0x00 0x00 0x00 0x01 0x09 0x20 0x00 0x00
> > > > 0x00 0x02 0x09 0x21 0x00 0x00 0x00 0x03 0x09 0x22 0x00 0x00 0x00 0x04
> > > > 0x09 0x23 0x800 0x00 0x00 0x01 0x09 0x21 0x800 0x00 0x00 0x02 0x09
> > > > 0x22 0x800 0x00 0x00 0x03 0x09 0x23 0x800 0x00 0x00 0x04 0x09 0x20
> > > > 0x1000 0x00 0x00 0x01 0x09 0x22 0x1000 0x00 0x00 0x02 0x09 0x23 0x1000
> > > > 0x00 0x00 0x03 0x09 0x20 0x1000 0x00 0x00 0x04 0x09 0x21 0x1800 0x00
> > > > 0x00 0x01 0x09 0x23 0x1800 0x00 0x00 0x02 0x09 0x20 0x1800 0x00 0x00
> > > > 0x03 0x09 0x21 0x1800 0x00 0x00 0x04 0x09 0x22>;
> > > >             ranges = <0x1000000 0x00 0x00 0x00 0x3000000 0x00 0x10000
> > > > 0x2000000 0x00 0x40000000 0x00 0x40000000 0x00 0x40000000>;
> > > >             reg = <0x00 0x30000000 0x00 0x10000000>;
> > > >             dma-coherent;
> > > >             bus-range = <0x00 0xff>;
> > > >             linux,pci-domain = <0x00>;
> > > >             device_type = "pci";
> > > >             compatible = "pci-host-ecam-generic";
> > > >             #size-cells = <0x02>;
> > > >             #interrupt-cells = <0x01>;
> > > >             #address-cells = <0x03>;
> > > >         };
> > > >
> > > >         virtio_mmio@10008000 {
> > > >             interrupts = <0x08>;
> > > >             interrupt-parent = <0x09>;
> > > >             reg = <0x00 0x10008000 0x00 0x1000>;
> > > >             compatible = "virtio,mmio";
> > > >         };
> > > >
> > > >         virtio_mmio@10007000 {
> > > >             interrupts = <0x07>;
> > > >             interrupt-parent = <0x09>;
> > > >             reg = <0x00 0x10007000 0x00 0x1000>;
> > > >             compatible = "virtio,mmio";
> > > >         };
> > > >
> > > >         virtio_mmio@10006000 {
> > > >             interrupts = <0x06>;
> > > >             interrupt-parent = <0x09>;
> > > >             reg = <0x00 0x10006000 0x00 0x1000>;
> > > >             compatible = "virtio,mmio";
> > > >         };
> > > >
> > > >         virtio_mmio@10005000 {
> > > >             interrupts = <0x05>;
> > > >             interrupt-parent = <0x09>;
> > > >             reg = <0x00 0x10005000 0x00 0x1000>;
> > > >             compatible = "virtio,mmio";
> > > >         };
> > > >
> > > >         virtio_mmio@10004000 {
> > > >             interrupts = <0x04>;
> > > >             interrupt-parent = <0x09>;
> > > >             reg = <0x00 0x10004000 0x00 0x1000>;
> > > >             compatible = "virtio,mmio";
> > > >         };
> > > >
> > > >         virtio_mmio@10003000 {
> > > >             interrupts = <0x03>;
> > > >             interrupt-parent = <0x09>;
> > > >             reg = <0x00 0x10003000 0x00 0x1000>;
> > > >             compatible = "virtio,mmio";
> > > >         };
> > > >
> > > >         virtio_mmio@10002000 {
> > > >             interrupts = <0x02>;
> > > >             interrupt-parent = <0x09>;
> > > >             reg = <0x00 0x10002000 0x00 0x1000>;
> > > >             compatible = "virtio,mmio";
> > > >         };
> > > >
> > > >         virtio_mmio@10001000 {
> > > >             interrupts = <0x01>;
> > > >             interrupt-parent = <0x09>;
> > > >             reg = <0x00 0x10001000 0x00 0x1000>;
> > > >             compatible = "virtio,mmio";
> > > >         };
> > > >
> > > >         plic@c000000 {
> > > >             phandle = <0x09>;
> > > >             riscv,ndev = <0x35>;
> > > >             reg = <0x00 0xc000000 0x00 0x210000>;
> > > >             interrupts-extended = <0x08 0x0b 0x08 0x09 0x06 0x0b 0x06
> > > > 0x09 0x04 0x0b 0x04 0x09 0x02 0x0b 0x02 0x09>;
> > > >             interrupt-controller;
> > > >             compatible = "riscv,plic0";
> > > >             #interrupt-cells = <0x01>;
> > > >             #address-cells = <0x00>;
> > > >         };
> > > >
> > > >         clint@2000000 {
> > > >             interrupts-extended = <0x08 0x03 0x08 0x07 0x06 0x03 0x06
> > > > 0x07 0x04 0x03 0x04 0x07 0x02 0x03 0x02 0x07>;
> > > >             reg = <0x00 0x2000000 0x00 0x10000>;
> > > >             compatible = "riscv,clint0";
> > > >         };
> > > >     };
> > > > };
> > >
> > > Thx Anup, but it still couldn't work for testing suspend.
> > >
> > > # echo mem > /sys/power/state
> > > sh: write error: Function not implemented
> > >
> > > Why there is no ARCH_SUSPEND_POSSIBLE in the patch series?
> >
> > You are referring to system-level suspend to RAM support whereas
> > this series adds CPU idle power management support.
> Right.
>
> >
> > Adding system-level suspend to RAM will be a separate series
> > and it will re-use the non-retentive suspend infrastructure added
> > by this series.
> Do you have the plan for the feature of SUSPEND? I think you've done
> the core part by this series.

We need to first define System SUSPEND in the SBI specification and
only after that we can plan support for OpenSBI and Linux.

Regards,
Anup

>
> In the end, thx for the work :)
>
> >
> > Regards,
> > Anup
> >
> > >
> > > ref arm64's:
> > > commit 166936bace056dfc11452d794209f39a5e9b0fb4
> > > Author: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > > Date:   Thu Nov 7 18:37:14 2013 +0000
> > >
> > >     arm64: kernel: add PM build infrastructure
> > >
> > >     This patch adds the required makefile and kconfig entries to enable PM
> > >     for arm64 systems.
> > >
> > >     The kernel relies on the cpu_{suspend}/{resume} infrastructure to
> > >     properly save the context for a CPU and put it to sleep, hence this
> > >     patch adds the config option required to enable cpu_{suspend}/{resume}
> > >     API.
> > >
> > >     In order to rely on the CPU PM implementation for saving and restoring
> > >     of CPU subsystems like GIC and PMU, the arch Kconfig must be also
> > >     augmented to select the CONFIG_CPU_PM option when SUSPEND or CPU_IDLE
> > >     kernel implementations are selected.
> > >
> > > >
> > > > Regards,
> > > > Anup
> > >
> > >
> > >
> > > --
> > > Best Regards
> > >  Guo Ren
> > >
> > > ML: https://lore.kernel.org/linux-csky/
>
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
