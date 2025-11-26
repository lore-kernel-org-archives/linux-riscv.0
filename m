Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB31D11183
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 16:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOM7V2jSuO5RL2rOYqXFyyjeZwTls6XnMBETUcIXrj8=; b=zPJzcH4bAlmVE3BUopG+2HauuE
	lWogtO9EL6M5PFJ0iMgrKzvO3MqJnGIAjjqLG893bZVc5t/OtkVgkC04wCxJFyyuzZMjWInXhL70K
	loEKDe/2+CK40vl7shq4XDzWYiiwmz9fW4qnel2waq4LskOfn1ZMBsPY+LF3fhzuB7SSZg3FMfgWr
	nrvKqRYBTs8BRAcQkLHeW5dwlfEMYVYja0rKqSE/l0fiNH3iilrM66K9Hq7GILF0llTuCOqSn+rKn
	bzGv7Yi7pahNWtVn3FAlbm2v3JPaP0voChlQ4GqJ/JCLU0+OcRl3otnu88wKvUhg8nS05Bym5dtET
	117/ldpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOICa-0000000FHQM-1o7H;
	Wed, 26 Nov 2025 16:17:08 +0000
Received: from m16.mail.126.com ([117.135.210.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOICX-0000000FHO8-08Cq;
	Wed, 26 Nov 2025 16:17:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=0wKcNy5FCGaqY9FV62oZYjgf+u3MGcY8a3yEAdQ09gg=;
	b=OS4HJrS2AI3Mq9+R1ebwCF7RSLe0YDcy9vKKM7EgPNueQa5eKfuFJcNqGQt/+a
	FPmV2XYlcxtPlEa7HwrepPyZX2FZvOXuDWKb/q6VEoKYSWiyBiMpQYO5wXPlJTLG
	3xYALoktHnRmfdQQwX4sg8mMV78vnwIW+DNg0tWNCdDEE=
Received: from nilq-virtual-machine.. (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3b++sJydpfQcMAA--.52027S2;
	Thu, 27 Nov 2025 00:15:42 +0800 (CST)
From: niliqiang <ni_liqiang@126.com>
To: tglx@linutronix.de
Subject: Re: [PATCH v16 6/9] irqchip: Add RISC-V advanced PLIC driver for direct-mode
Date: Thu, 27 Nov 2025 00:15:40 +0800
Message-Id: <20251126161540.6460-1-ni_liqiang@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87qztmgj32.ffs@tglx>
References: <87qztmgj32.ffs@tglx>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3b++sJydpfQcMAA--.52027S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUjeHqDUUUU
X-Originating-IP: [111.162.113.123]
X-CM-SenderInfo: xqlbzxxtld0wa6rslhhfrp/1tbirwES5WknGuiyWgAAsN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_081705_475936_F5BEF06D 
X-CRM114-Status: GOOD (  14.75  )
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
Cc: atishp@atishpatra.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, frowand.list@gmail.com, hu.yuye@zte.com.cn, guo.chang2@zte.com.cn, maz@kernel.org, liu.qingtao2@zte.com.cn, ni_liqiang@126.com, wu.jiabao@zte.com.cn, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, liu.wenhong35@zte.com.cn, paul.walmsley@sifive.com, dai.hualiang@zte.com.cn, deng.weixian@zte.com.cn, linux-arm-kernel@lists.infradead.org, apatel@ventanamicro.com, saravanak@google.com, ni.liqiang@zte.com.cn, linux-kernel@vger.kernel.org, bjorn@kernel.org, robh+dt@kernel.org, palmer@dabbelt.com, anup@brainfault.org
Content-Type: multipart/mixed; boundary="===============8845514396587370317=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8845514396587370317==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Hi, tglx

> > We've noticed that PCIe enumeration order tends to vary across system reboots (for example: first
> > boot showed PC08->PC06->PC10->PC07->PC11->PC09, while second boot showed
> > PC09->PC06->PC08->PC11->PC07->PC10), even though the ACPI firmware consistently reports the root
> > bridge sequence as PC06->PC07->PC08->PC09->PC10->PC11.
> 
> > In our testing, we found that adjusting the registration priority of the aplic driver seems to help
> > ensure the interrupt controller initializes before PCI enumeration, leading to more consistent
> > device ordering.

> The ACPI table does not provide a sequence, it provides a collection and
> it's nowhere written in stone that this collection has to be processed
> in order.
> If you want a sequence then put dependencies into the table and be done
> with it, no?

Thank you for your suggestions. 

Through our validation, We have observed that the current kernel appears to lack an effective
dependency resolution mechanism between ACPI PCIe host bridge devices.

The specific manifestation is as follows: when establishing dependencies between host bridges via
the _DEP method (for example, PC07 depends on PC06), only PC06 is enumerated successfully, while
PC07 is skipped. Our investigation reveals that the root cause lies in the current limitation where
ACPI PCIe devices have only a single opportunity to resolve dependencies—specifically within the
acpi_dev_clear_dependencies function inside the APLIC driver. PC06, having its dependency resolved
earlier by the APLIC driver, is asynchronously processed in the system_unbound_wq queue. At this
point, PC07 still depends on PC06, which has not yet completed enumeration. As a result, PC07 cannot
proceed and subsequently misses its enumeration opportunity.

To address this issue, we have introduced the following dependency resolution mechanism at the end
of the acpi_pci_root_add function in the kernel's PCIe enumeration path to achieve the desired
fixed-order enumeration:

#ifdef CONFIG_ACPI
if (!acpi_disabled)
acpi_dev_clear_dependencies(device);
#endif

We have observed that other drivers in the kernel also utilize acpi_dev_clear_dependencies to handle
device dependencies. We seek confirmation on whether this approach is reasonable and welcome
feedback regarding alternative effective solutions.

Best regards,
Liqiang



--===============8845514396587370317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8845514396587370317==--
