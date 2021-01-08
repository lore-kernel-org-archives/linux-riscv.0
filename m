Return-Path: <SRS0=xmGS=GL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBA7C433DB
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jan 2021 15:02:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F07223A00
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jan 2021 15:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F07223A00
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O++IKE5yYTFHwiYAgq5EByLx+cw25rXfm2vIvj2nzOs=; b=lE9CFoj9kyISyjf6jyBlvVill
	xwhBb4Cga324LNajz4ZDQGIyQlKfeN7MzcGg/qmuzeAvovVZaW6XLUjEWdYE3kLoNdeMaE8mKjquj
	o01fezozyn75fraEIxpycgmKPCKYotdNY65DhHXIFDkiJZpL7mm6jeyU7cDt5CG+pH+3z5AbLC61q
	nHaOQGR/9OyX70tfYOJvatugXrpnV8Le3+QDfRGJXNQUYF1lmYlYc8/DpO/64BHEYwVB1FBcQ1KEn
	1MaYd66gVAzOTaQvBYBurbvy0WS9VT9RdTodvUXLmPIfkYQxa0xomH8o07orntBVykYXTODiiWVX6
	qXaew1MIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxtHR-0005p2-B5; Fri, 08 Jan 2021 15:02:21 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxtHO-0005oQ-R1
 for linux-riscv@lists.infradead.org; Fri, 08 Jan 2021 15:02:20 +0000
X-Originating-IP: 90.118.94.207
Received: from [10.0.0.13] (lfbn-mar-1-763-207.w90-118.abo.wanadoo.fr
 [90.118.94.207])
 (Authenticated sender: michael.opdenacker@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 79CE21BF20C;
 Fri,  8 Jan 2021 15:02:13 +0000 (UTC)
Subject: Re: No device tree source for the QEMU Risc-V virt board?
To: Atish Patra <atishp@atishpatra.org>
References: <787d35c6-8933-ae5e-2e3a-a3de8c6f27ee@bootlin.com>
 <CAOnJCU+QsxmMakcMJTLc7pQSHbEV3tbQq6sRaacNwda-zqxv6A@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <ece65eb8-5bb8-5eba-690a-45b84ea2604a@bootlin.com>
Date: Fri, 8 Jan 2021 16:02:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOnJCU+QsxmMakcMJTLc7pQSHbEV3tbQq6sRaacNwda-zqxv6A@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_100218_996060_5DBB1DF4 
X-CRM114-Status: GOOD (  15.81  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Atish,

On 12/23/20 11:59 PM, Atish Patra wrote:
> You shouldn't have to do that. The DTB is copied a few times during the boot.
> In RISC-V, every boot loader stage passes the memory address of DTB in a1.
> Thus, Qemu loader will pass the DTB address in a1 to OpenSBI and
> OpenSBI passes that to U-Boot via a1.
> Before that, OpenSBI may copy the DTB depending on the firmware type
> (fw_jump or fw_dynamic).
> U-Boot relocates the DT the $fdtcontroladdr. You can verify the
> correct fdt by doing the following at U-Boot prompt.
>
> <AT U-Boot prompt>
> #fdt addr $fdtcontroladdr
> #fdt print


Good to know, many thanks. I didn't expect this. Indeed, I can dump the
DT from U-Boot using the above command.

>
> Depending on how you have configured U-Boot, it may again need to be
> copied to fdt_addr_r if that's the address
> you are using while using booti/bootm command so that Linux kernel
> gets the correct DTB address in a1.


Yes, I confirm that I manage to boot the kernel using $ftdcontroladdr.

I'll share the whole process again during my upcoming FOSDEM presentation.

Many thanks again. You helped a lot!

Cheers,

Michael.

-- 
Michael Opdenacker, CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
