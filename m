Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36048EE49A0
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Aug 2023 02:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+9eaVhZZLgA1mtjq0K0EP7Eb5TxmuFwIRP1ASbQfd1A=; b=r6bc+lwzF/pl5n
	gVUmDtm9NT8TSW1xKbUXlVOygFCQlnXAidaUX+onrObHiTS0Zb4OMTcTN2fuk1L62wQl5IDnIceSB
	hFWcsyJArKlYoJnLNSUpH+TW52WjG/EhetTGsx70wiqtPlSMQx9Y01oZdCiPM2G4jS71pgFbCho2V
	AZlJb5pvmwzt+KOrsfFJq2qCBsm+JNZWBOSAP5RD09AlwcoE5SDXgGc//BNU0vIq65iC+63vtFEFq
	PsGqddwyBCDkNxstBLs0QNB/9l+20PC28z6FDXw7bbl1A4hp1BkStgHI10yS7Y+Fm+u8DpVtXeMW1
	NsOB+dyhxuwxYC7pvSDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXBtV-00AIh6-1s;
	Sat, 19 Aug 2023 02:40:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXBtU-00AIgh-3B
	for linux-riscv@bombadil.infradead.org;
	Sat, 19 Aug 2023 02:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ahWNVVAL1WDPLQKuaH9XQhxbTRRpDmMNlOJHPrVobvc=; b=XYn4NaoOC7HTFr3+50H2EtNOzl
	I1VQUm4Ci8nlKJYY4Is4xwQ47IxraYNMeJyLiudiYlv999s3WPEPtemNWW3vHnX5OaDaywyVRgOKm
	fy4wqf8xX7OXR+DF0OgbfS49idaXsT60Xn81yioXwRRfQxUkUZGlznkcDaoDGevY7X2dzMFNORxTi
	qPNkkBQBEeFUz36QIpMTkIgagmn7x39TJJKo2qbTF26Lf2UM6xX2wG6KUfaA++jpTxUysWk5teqFk
	ZbXhxm9Sza2v0sILJRFh8g2i8Y7r8Tr3U6lCfis/rOgjcSBLnBK4flmSdO4IKBh+MJ9gV0E4UoOeQ
	MvU/OECw==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXBtL-00FyAf-29
	for linux-riscv@lists.infradead.org;
	Sat, 19 Aug 2023 02:40:48 +0000
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8DxRvGdK+Bkcw0aAA--.53452S3;
	Sat, 19 Aug 2023 10:40:29 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax8uScK+BksBReAA--.33767S3;
	Sat, 19 Aug 2023 10:40:29 +0800 (CST)
Message-ID: <ed87b8de-9fb6-fbee-2c6d-cebf712ccda5@loongson.cn>
Date: Sat, 19 Aug 2023 10:40:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4] PCI/VGA: Make the vga_is_firmware_default() less
 arch-dependent
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, loongson-kernel@lists.loongnix.cn,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230817220853.GA328159@bhelgaas>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230817220853.GA328159@bhelgaas>
X-CM-TRANSID: AQAAf8Ax8uScK+BksBReAA--.33767S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7tr48uw4xGw17Zr43Xry3WrX_yoW8CF48pr
	4YganrGF4kG3Z7A3sxAws5XF45uayvyFZ8Gry5Ar18ur45Gr1aqrnrKrZ0gwnrCrnxt3WS
	krn8Kr4IkFyDZagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU92b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AK
	xVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVF
	xhVjvjDU0xZFpf9x07jYSoJUUUUU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230819_034044_890031_BDBC6C85 
X-CRM114-Status: GOOD (  12.43  )
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


On 2023/8/18 06:08, Bjorn Helgaas wrote:
> I guess the point here is that:
>
>    - 03:00.0 BAR 0 is [mem 0xe0050000000-0xe005fffffff]
>
>    - screen_info says the framebuffer is
>      [mem 0xe0050000000-0xe005fffffff] (or part of it)
>
>    - Therefore, we want 03:00.0 to be the default VGA
>
>    - PCI core reassigns 03:00.0 BAR 0 to
>      [mem 0xe0030000000-0xe003fffffff]
>
>    - PCI core assigns a 00:06.1 BAR to contain
>      [mem 0xe0050000000-0xe005fffffff]
>
>    - vga_is_firmware_default() incorrectly decides 00:06.1 should be
>      the default VGA because it has a BAR that contains the screen_info
>      address range
>
> Is that right?

Yes, The 00:06.1 is loongson integrated display controller, integrated in LS7A1000 North bridge.


On loongarch, before apply apply any patch, VGAARB always select 00:06.1 as the default boot device.
because it is enumerated first. It is always the first VGA compatible device found on our system.
Because its PCI domain, bus, function number is smallest. And it own IO and MEM, so the 00:06.1 will
always be selected as the default boot device. Even you plug a discrete GPU on the mother board.


Therefore we need help the vga_is_firmware_default() to overriding previous.
On a multiple GPU co-exist case (on loongson platform), if no "overriding previous" being printed.
then there something wrong. On normal case, we need the discrete GPU overriding the integrated one.
Because the discrete GPU is more powerful than the platform integrated.

But what we want is let the VGAARB determine the primary GPU by referencing the firmware.

If firmware put the firmware framebuffer in the VRAM of the integrated display card(00:06.1).
then the integrated display card should be the primary GPU.

If firmware put the firmware framebuffer in the VRAM of the discrete display card,
then the discrete display card should be the primary GPU.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
