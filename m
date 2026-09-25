Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7154EC9830E
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 23:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BXfNUgZ+gr1x9S05TBZhsUBnlThL/Lav9xPoPVep7h4=; b=e276ywCCmCpsbw
	IsrFU2DrXC7yZ+T20zkvahUgbZtily0O0Kvk3sJjofht2Ja37MyIzVVGk8gfk5VdS8vem78ZYJGBK
	YaEVTupXLqsOK6iVkmsk3pi3Glb0Zo+3escdQAfo+wO6dSAoqsspQLAymO3i9SlOcVrNi9etXhUwR
	IYdrEh6En+KcmBqxhnXlV9HuXp0OMmjbUcB3XAuo6ORqJV25jDrk3WqCXn7pRmHR1KOFcSrz0yWSv
	vdi9JzOHCM6hxiNW1K20cbegjH/Q+vlzmr1gkZfa/ryUf0IVo0wWG84WEWs55nDMK8377w4o4BPqh
	9wjdR4vF4TypwTz31J1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAFcr-0000000EhRj-0a9o;
	Fri, 25 Sep 2026 23:46:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAFcp-0000000EhRH-0rsW
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 23:46:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 45C0D60136;
	Fri, 25 Sep 2026 23:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428AB1F000FF;
	Fri, 25 Sep 2026 23:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790380002;
	bh=vxMcCs7n6HTqPEhkYEmyi+rSro0fFNKi9/FAkeoxwwE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=a+Nvr7Xfh88c3BgaGQ8/YQVhpV4/pJK73Nw5qE0yy1TQTw9cbGb0LQaHgZ2TWL3oq
	 MSzPcT4cTel//AJ/OT4cTTUyR/Zobf9vTwmj41ge3JxVwlTlB+A6HeqhlLscwsTu03
	 LRyTzf1B64cNlrekNoYGEmVx2tPp6EwkpFpCvHt3y5VoT5cKUa+H2p8u5UyMgNXTP3
	 RNfp8mQLTRLs+ItsowUdFfG1ouPr2H/0++icaduDL+5+QvlfInOljEV8+mMIYcSUzA
	 WoTBnXigHZZ5I5Xs29sqzamF/Tuuzq/6i+zZx//hkWEOEKru4qehmru/hNQYEseftX
	 Ku7MXBCc0DcGQ==
Date: Fri, 25 Sep 2026 17:46:38 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: sun.wenhan@zte.com.cn
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    liu.qingtao2@zte.com.cn, lv.yating@zte.com.cn, guo.chang2@zte.com.cn, 
    deng.weixian@zte.com.cn, hu.yuye@zte.com.cn
Subject: =?ISO-8859-15?Q?Re=3A_=A0=5BPATCH=5D_riscv=3A_align_pcie_bus_?=
 =?ISO-8859-15?Q?assign_logic_with_ARM64?=
In-Reply-To: <202609220934.68M9Y2eC015972@mse-db.zte.com.cn>
Message-ID: <c8bd7448-e9f3-72fc-9c91-db0c2525a3a1@kernel.org>
References: <202609220934.68M9Y2eC015972@mse-db.zte.com.cn>
MIME-Version: 1.0
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

Hi

On Tue, 22 Sep 2026, sun.wenhan@zte.com.cn wrote:

> RISC-V currently relies on the asm-generic default of
> pcibios_assign_all_busses() returning 1, so the kernel always
> re-assigns all PCI bus numbers and ignores the bus numbers already
> set up by the firmware. This has two downsides:
> 
> 1. As UEFI 2.8 has brought mature firmware support to RISC-V servers,
> the OS can trust and inherit the PCI bus enumeration done by the
> BIOS, skipping a redundant re-enumeration at boot and improving
> the boot time.
> 
> 2. The unconditional re-assignment causes bus numbering conflicts
> during PCI rescan. When a root port that is not the last one in
> the hierarchy is removed and the bus is rescanned, the kernel
> fails with:
> 
> pci_bus 0000:01: busn_res: can not insert [bus 01-ff] under
> [bus 00-ff] (conflicts with (null) [bus 02])
> 
> as reported for the same generic code in commit bd8cbe66c01d
> ("PCI: Make PCI bus renumbering configurable to avoid rescan
> conflicts").
> 
> Define pcibios_assign_all_busses() the same way as ARM64,
> so that RISC-V also preserves the bus numbers assigned by the
> firmware by default instead of always re-assigning them. This keeps
> RISC-V consistent with the other major architectures.
> 
> Signed-off-by: sun wenhan <sun.wenhan@zte.com.cn>

This patch doesn't apply -- see 
https://gist.github.com/linux-riscv-bot/4f238956cd137e576af24c32c44d3437
-- and the commit ID mentioned in the patch description doesn't appear to 
exist in mainline.  Can you please fix these issues and resend?

thanks,


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
