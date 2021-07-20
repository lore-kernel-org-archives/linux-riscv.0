Return-Path: <SRS0=Mekn=MM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECC2C07E95
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 14:32:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 880E660FE7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 14:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 880E660FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ul51FGngXpAayHkt3HsFXQ+w07+jIs5l586JFulc4RM=; b=xQSaDhX1Dp4Pzr
	2/0b/RwYHZynSomRuP6p+QhboGE0xnCYNvRCXtapYtK1Uml4a0V/Ku9vpFG0wbnNAcxHA9U1pAlAe
	j4Eflcvh5JOZKwEpaziUDNYW/P/+aHSYXiV0W2ZHJ+B4VO8w69qPdu31LGKmePdaau21gBAAd2zsp
	C1d6X7AYsDniJ+Q8J+YNVFnkhJwI8xufbTxr458kz0zJT07S9e1OQIK0Iw3o7oOKSa8IIIEFuE7WF
	NcKfRJYrVTpbEgsest07CX/6baqH876MUSFFyvyordpfXjark/ZOd+Ve+SV8LZn565wU+A96vCPOo
	vObuyt4mb0tLlHE7FWdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5qn0-00DDS1-JY; Tue, 20 Jul 2021 14:32:06 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5qmw-00DDPQ-GK
 for linux-riscv@lists.infradead.org; Tue, 20 Jul 2021 14:32:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=ywBAHAeaoSffA2ncpedf7BnbJBiu2F6A/J
 /zD5M2TjI=; b=x+nO61C3mcntpK62uBZzcvZXjqibvix8jDiqNYvcDcucSy0J26
 SV1pLLIqLhMUCQbdYqJo6tEt+YfsYUU5UPYzS0gR0k6pnXm1UtuiENnOOo+02un0
 i8Nk+78FxYr73JzUuyWzHbJwC34odIDH+qdNtNjB9f2oa7nbmHSLhVuJU=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygC3vXVS3vZgNr8EAA--.520S2; 
 Tue, 20 Jul 2021 22:31:46 +0800 (CST)
Date: Tue, 20 Jul 2021 22:25:50 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Vincent Chen <vincent.chen@sifive.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, Palmer Dabbelt
 <palmer@dabbelt.com>
Subject: Re: [RFC PATCH] riscv: Kconfig: do not select PCI_MSI if CONIFG_PCI
 is enabled
Message-ID: <20210720222550.61f4a127@xhacker>
In-Reply-To: <CABvJ_xg7piPyt_wy0dU97Vt1y5PN0Ets0fq09k05yZeoWdN7Hw@mail.gmail.com>
References: <1625800352-17846-1-git-send-email-vincent.chen@sifive.com>
 <CABvJ_xg7piPyt_wy0dU97Vt1y5PN0Ets0fq09k05yZeoWdN7Hw@mail.gmail.com>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygC3vXVS3vZgNr8EAA--.520S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZw48XFyUAw1fGr4kXr48Crg_yoW7JFyfpF
 45WF17Kr4ktrWxKwsF9r43ur1UZFn7Aa13Jrn5GryUCFyDuw1UXr1kKr4fAa4DWrn5Cr47
 tr1vgryFkw1UAaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
 s4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
 1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
 JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r
 W3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8
 JbIYCTnIWIevJa73UjIFyTuYvjxUgg_TUUUUU
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_073203_264449_E7156CE0 
X-CRM114-Status: GOOD (  40.92  )
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

On Tue, 20 Jul 2021 16:05:33 +0800
Vincent Chen <vincent.chen@sifive.com> wrote:

> Just a gentle ping.
> Does anyone have any comments on this RFC patch? If not, I will remove
> the "note" part from the git description and resend it as a formal
> patch. Thank you.
> 
> On Fri, Jul 9, 2021 at 11:12 AM Vincent Chen <vincent.chen@sifive.com> wrote:
> >
> > The CONFIG_PCI_MSI is used to allow device drivers to enable MSI. The MSI
> > enables a device to generate an interrupt using an inbound Memory Write
> > on its PCI bus instead of asserting a device IRQ pin. The whole mechanism
> > needs support from the PCI controller or generic interrupt controller and
> > the corresponding software driver.
> >
> > The RISC-V Kconfig file actively selects the PCI_MSI  if users enable
> > CONFIG_PCI. However, the RISC-V specification does not require every RISC-V
> > platform shall have MSI support. In other words, Kconfig enables CONFIG_PCI
> > to allow PCI devices to use MSI, but due to lack of MSI support, the kernel
> > may not have any function to deal with the MSI from PCI devices. When this
> > case happens, it leads to the following warning message displayed in
> > booting a v5.10~v5.12 kernel.
> >
> > ------------[ cut here ]------------
> > WARNING: CPU: 0 PID: 1 at include/linux/msi.h:219 __pci_enable_msix_range+0x4b6/0x50e
> > Modules linked in:
> > CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.10.34 #76
> > epc: ffffffe0004fa1e0 ra : ffffffe0004fa02e sp : ffffffe07fea7920
> >  gp : ffffffe0010e25c0 tp : ffffffe07fea8000 t0 : ffffffe0808c3180
> >  t1 : ffffffd000239000 t2 : 0000000000000400 s0 : ffffffe07fea79e0
> >  s1 : ffffffe080803000 a0 : 0000000000000000 a1 : ffffffe080803210
> >  a2 : ffffffe0808c30c0 a3 : 0000000000000101 a4 : ffffffe0808c30c0
> >  a5 : 0000000000000010 a6 : ffffffe0004dcf98 a7 : ffffffe07fe0f010
> >  s2 : 0000000000000002 s3 : 0000000000000014 s4 : 0000000000000000
> >  s5 : ffffffe080803210 s6 : 0000000000000000 s7 : ffffffe0808c3120
> >  s8 : ffffffe0808c30c0 s9 : 0000000000000000 s10: 0000000000000002
> >  s11: ffffffe0808030b0 t3 : 0000000000001000 t4 : 0000000000001000
> >  t5 : ffffffd040239000 t6 : ffffffe07ff8b2c0
> > status: 0000000000000120 badaddr: 0000000000000000 cause: 0000000000000003
> >
> > A simple reproduce way is to use defconfig to configure the 64-bit riscv
> > v5.10 ~ v5.12 kernel but disable CONFIG_PCIE_XILINX, and then booting this
> > kernel on the QEMU virt platform with virtio-mouse-pci.
> >
> > ARM's implementation may be a good sample for this case. Its Kconfig file
> > does not select CONFIG_PCI_MSI. Instead, It makes the selection of
> > CONFIG_PCI_MSI depends on the capability of the interrupt controller. This
> > way seems to be more straightforward. Therefore, this patch follows the
> > same way to remove the dependency between CONFIG_PCI and CONFIG_PCI_MSI
> > from Kconfig, which allows users to enable or disable CONFIG_PCI_MSI
> > according to the capabilities of the platform.
> >
> > (note) Why does this warning message only happen in the v5.10 to v5.12 kernel?
> > When the kernel wants to register the MSI ID of the first PCI device, if
> > the PCI device does not belong to any MSI domain and there is no valid
> > arch_setup_msi_irqs() defined by architecture or PCI controller, the
> > generic arch_setup_msi_irqs() will be called to display this warning
> > message. However, before v5.10, this flow is different. A valid and weak
> > arch_setup_msi_irqs() is defined in driver/pci/msi.c. The kernel can use
> > this arch_setup_msi_irqs() to set up the MSI. Therefore, it will not
> > encounter any problems even if the architecture and PCI controller does
> > not define it. After v5.13, the kernel uses the MSI domain to deal with
> > all the setup of MSI issues. Only some old PCI controller still uses
> > arch_setup_msi_irqs(). Through the hierarchy of the MSI domain, the kernel
> > can know the bus used by the PCI device has MSI support or not before
> > doing the MSI setup. In this condition, the kernel will return early before
> > calling the generic arch_setup_msi_irqs(), which will trigger the warning
> > message.
> >
> > Signed-off-by: Vincent Chen <vincent.chen@sifive.com>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> > ---
> >  arch/riscv/Kconfig | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 469a70bd8da6..563d550cb682 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -97,7 +97,6 @@ config RISCV
> >         select OF_EARLY_FLATTREE
> >         select OF_IRQ
> >         select PCI_DOMAINS_GENERIC if PCI
> > -       select PCI_MSI if PCI
> >         select RISCV_INTC
> >         select RISCV_TIMER if RISCV_SBI
> >         select SPARSE_IRQ
> > --
> > 2.7.4
> >  
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
