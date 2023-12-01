Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8722C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 10:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mNG5pPKJSuQbf7CktvqsxsHlG5CdNfVCdX0THaPOyq8=; b=D2H6GpcExWQvTi
	19LTRSHg0s0WbBWDe7gvop/eZJcw2DDbjIqgzh7qzF0foSPz8m02zuM1aTtn9dDR/SmQDarRdwrD1
	LmHo03N9S38ZRSVDyA+u4sNTbbQMuecIYvTrKzoBzwODPcjQgrhPI8TTG2T1Wrlj7jIbj5FEb9G1R
	H81uwjinZUCDpR0YH7nzz9x6uYyDtDgwa2WSRzUHfsCTm7MskLjEIECOKMyktErZ6xseMy/SANlnl
	GBlWu3KOw2YtEblWCVGcfGZiZa6zJgstEEXiIkQhLE4k1weeb0r5wHu9+4vZ+XfENm2YyWLfgCdBp
	oit+3HTKWPVQg6KQj/Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r911F-00DFLr-12;
	Fri, 01 Dec 2023 10:45:13 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r911C-00DFJu-1e;
	Fri, 01 Dec 2023 10:45:11 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1701427507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qEECtfSCuNJnYbbSSxaa7Yhx563AZhnbYIPY9oqxOFE=;
	b=T3NEQtyO3UjVNcOPdRfDLPqBbceTA/S3RG5pLrN/U1R54Q2+LC7E1qyZMq6Qdr2Lwq04Q7
	o3RbMWPKuiDtnTWhcOihAwr10MgQL4MPJzwPuXjSE8T6gp+VGjfk6u/Ymyla3VOKfAsmmc
	Ccc1ZPp7aRV0WvqXtoVD6atSILRTlOYC+gmZcP1quvkiE5ooEnP1dGy3CQhMQmnhHkyoNi
	fjrSBFLZgwtCeutL0TuwQN8B6ZHMA2t6ITEqL89vyADio0MnrI5DVfPUnv3HUa3tTRDL7e
	+EhhGYzs843vvIZov1ZEMz4EArysm5xib9rklBXUl6z6IburTOa1nE4pPpkQBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1701427507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qEECtfSCuNJnYbbSSxaa7Yhx563AZhnbYIPY9oqxOFE=;
	b=5ivKSLWokv5u4EWLeFetTD8/zTFsnE28leOpFAM1uIFAuW0E1rMX60gedKhj/gj0RQebhI
	nzpCyFo1nVj5NNDA==
To: Russell King <rmk+kernel@armlinux.org.uk>, linux-pm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 kvmarm@lists.linux.dev, x86@kernel.org, linux-csky@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>, Jean-Philippe Brucker
 <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com, James
 Morse <james.morse@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>
Subject: Re: [PATCH 01/21] arch_topology: Make
 register_cpu_capacity_sysctl() tolerant to late CPUs
In-Reply-To: <E1r5R2g-00CsyV-Ss@rmk-PC.armlinux.org.uk>
References: <ZVyz/Ve5pPu8AWoA@shell.armlinux.org.uk>
 <E1r5R2g-00CsyV-Ss@rmk-PC.armlinux.org.uk>
Date: Fri, 01 Dec 2023 11:45:06 +0100
Message-ID: <87v89ixkul.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_024510_692468_ED54E71E 
X-CRM114-Status: UNSURE (   7.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 21 2023 at 13:43, Russell King wrote:
> ---
> If the offline CPUs thing is a problem for the tools that consume
> this value, we'd need to move cpu_capacity to be part of cpu.c's
> common_cpu_attr_groups. However, attempts to discuss this just end
> up in a black hole, so this is a non-starter. Thus, if this needs
> to be done, it can be done as a separate patch.

Offline CPUs have 0 capacity by definition....

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
