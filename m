Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C48EE4996
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 06:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V3WimGRI7fL3v/KJMd8RiMs5w+9RLmfGMLJtpIBNnPw=; b=Gi5+UwE4oqWMWo
	hT63DrD4OrGwm9kMLYn1o2NhLXlSJQerN2s16418GMPiIxVzGTbfn9M5IIczJdUqeU0OHxUjQSbyx
	sXwFe1n1TcRcap8FW5A02pS0uJvICvp4eyB/q0ZdXJIFXf8gt84F9Nb65gCNaXEDZ5UECKgT/7Esg
	YnTx+eWMJ/5Pb75Xyw0wWeqsb0o0aMx2oWSj5AEtJgwU9dvn56eMLoCZVMgMCMBNlaSA5qn/mWZ9n
	eSmk/nTqQZW/NZ2sssMsMhbnSgMXBbSeP2zQ+eQBU+bRNNOy1rq1qoBl7YvpmFIcaSsMUfbMqiClr
	x1/C3/vrk+Ord0NTkr0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXyi3-00DIGE-1R;
	Mon, 21 Aug 2023 06:48:19 +0000
Received: from mail.loongson.cn ([114.242.206.163])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXyi0-00DIEC-0H
	for linux-riscv@lists.infradead.org;
	Mon, 21 Aug 2023 06:48:17 +0000
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8Cx2eqnCONk74IaAA--.49216S3;
	Mon, 21 Aug 2023 14:48:07 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx_yONCONkWUxfAA--.60821S3;
	Mon, 21 Aug 2023 14:48:07 +0800 (CST)
Message-ID: <520723e3-ca6e-a55d-cbd0-132b2991c9bc@loongson.cn>
Date: Mon, 21 Aug 2023 14:47:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4] PCI/VGA: Make the vga_is_firmware_default() less
 arch-dependent
From: suijingfeng <suijingfeng@loongson.cn>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, loongson-kernel@lists.loongnix.cn,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230817220853.GA328159@bhelgaas>
 <fb242a7e-b1ee-7be0-cbc4-be710e246279@loongson.cn>
Content-Language: en-US
In-Reply-To: <fb242a7e-b1ee-7be0-cbc4-be710e246279@loongson.cn>
X-CM-TRANSID: AQAAf8Dx_yONCONkWUxfAA--.60821S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E
	87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
	AS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s02
	6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF
	0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvE
	c7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7I
	U8zwZ7UUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230820_234816_472775_1887266F 
X-CRM114-Status: UNSURE (   5.60  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,


On 2023/8/18 18:20, suijingfeng wrote:
>
> 1) The "weird" logic completely overrides whatever decision VGAARB 
> ever made.
>
> It seems to say that the decision ever made by VGAARB is useless.
> Well, I think VGAARB shouldn't endure this; VGAARB has to be small. 


VGAARB have to be smart!

The "weird logic" here refer to the weird pci_fixup_vgadev() function.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
