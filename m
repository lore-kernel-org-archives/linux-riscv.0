Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2698410F9307
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 23:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OzmUJszCDfOt2HAUBKDuU6kSBjQLxLjBuI7tLd0adac=; b=PEywd1RI6ALuNy
	WQ1FgfkJBM+tWs8Mv6wRnFj1WvDEQUvMlipVTxVcdHK/j4Qs/bpHh09rPtjaFPkhr10y0C0qzcWX0
	b3Q06Xgk9P7ykx90kEL1q9APfDOhwifXt2CKNc5jrR3pMRSPixoraO6qM9wXf1p8wJSLeATTisdaq
	TRzaUWWeBHfr45sS8F19oLtwkha+B2/HehX4DsGWjpt6C/JdYGytoZMzmCxTzshZQjfnmw7gJULXt
	yhGByz1t+AVxVKmIwLzxZXeMI7qVO/pttJzwpta02QYtw749MuzGMPxzEBaTcqNZN4xMiPALPE3kW
	fYgCVFSz/jboXAf/Lz9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7igk-0000000DhOV-01HC;
	Tue, 31 Mar 2026 23:40:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7igi-0000000DhO3-3spa
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 23:40:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F3098600C4;
	Tue, 31 Mar 2026 23:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E87D1C19423;
	Tue, 31 Mar 2026 23:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775000399;
	bh=1MwI5eBREz7P/+6XkAa/044/SnfCZrJcQjExGg4Jf0w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Qk+lq73+jj6EU2YEdhL7npWBVeIE9CvtYQMLA39DjN6G8iFEHFNYuCq3wEshGd3it
	 FhtTSFowPyga8Nnhl0zchbfCnOVyYcKmOEs686ugnDDd8ZNyXvzAy8YCVZuNi2Eekb
	 u2mrLznLQj6XRBoizMsIN1w3Gobpf7D2ga6QS39EAHLnb5ggI8akj3HuPwJspRzwPM
	 +g3rO8yTLpkYu4A//y3jb0X9YCpYNaTqzFFuCHXygEvMndUJvilEvFHIwo8GEGC2M9
	 YpU2cQTs4g1ZyQUujqzuSfwQhTSEGMvbfBydeim0hZgRxG+hJ5f94MypfYFcGuyQmd
	 axFJtj0sQu7Yw==
Date: Tue, 31 Mar 2026 17:39:56 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Sunil V L <sunilvl@oss.qualcomm.com>
cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
    linux-acpi@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>, 
    Len Brown <lenb@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
    Andrew Jones <andrew.jones@oss.qualcomm.com>, 
    Anup Patel <anup.patel@oss.qualcomm.com>
Subject: Re: [PATCH] ACPI: RIMT: Add dependency between iommu and devices
In-Reply-To: <20260303061605.722949-1-sunilvl@oss.qualcomm.com>
Message-ID: <3c2783e0-f41b-3bee-71f2-60f2246ff63c@kernel.org>
References: <20260303061605.722949-1-sunilvl@oss.qualcomm.com>
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

On Tue, 3 Mar 2026, Sunil V L wrote:

> From: Sunil V L <sunilvl@oss.qualcomm.com>
> 
> EPROBE_DEFER ensures IOMMU devices are probed before the devices that
> depend on them. During shutdown, however, the IOMMU may be removed
> first, leading to issues. To avoid this, a device link is added
> which enforces the correct removal order.
> 
> Fixes: 8f7729552582 ("ACPI: RISC-V: Add support for RIMT")
> Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>

Thanks, queued for v7.0-rc.  Something that would be helpful in the 
future, by the way, is if you would describe the issues observed in 
greater detail. 


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
