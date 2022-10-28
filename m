Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C7BECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 00:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8LiKw1wm6u+eDDXv8FDjMRw+95ZsGpCQlaIstbXfn8o=; b=iUs++LGOnHI8ui
	RPT95aVW1/WQtuuNt8TwI3xKxVj5jDlMpckNlok4rPg9LBczDI9J0QbDHD5LKWDG5YlDv8i72zxuw
	tTJDDTSGYeO7KBKPtdSNWVKknOIdbC56y2+fgHxiQ5Yj9OW4fNbPAUHY6atUP7+7np/RcaLIt9xbR
	r8uar4RAXippsZLICf9f/8qmQG4GryrJYQe2pTRVU43hUMSvBJahnZNSLfrAAc7bXbazUbsXR6lDW
	Xmk3Gu8+0WOI+uAYQs16cnshz6cLPmgKZQrf2pBVvY+gdtl7ggR/bFeJl6nkxgAurimbBA7hzW3Cr
	8MOb/eufAgX79uIBoKcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooDGn-00FILw-9e; Fri, 28 Oct 2022 00:30:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooDGk-00FILb-7F
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 00:30:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BA0D660C24;
	Fri, 28 Oct 2022 00:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D56AC43470;
	Fri, 28 Oct 2022 00:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666917041;
	bh=1cgQsn8Dl8oXXAx8gvKuL8W/RjgtqyJAH9sgnpZyd8Y=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=AzadYNM69bZgFK5FQbyUM3syPXPVbs+PDGuRBl8e/w7FuXXt7a5R37YusxtHWZBb/
	 r7jrETa6edX5JkceiAvS9MkzI3q7Ga/0Q/Jt2MLvYdOtjjkfozqftAd78QlTKQ0Bu8
	 tSTgPy/UX5XNhskAR5OtuWoroldW3Zd8Bpup1pGTCKtpSTiKeu13HId2RAVL0YUlaA
	 t97L5UvVKFv/3h7X2BuENXopk1uM32aBnbfgys8667lOutidYRYRMRJp80qJSkripQ
	 jhenbmDEqIv6LjX7DPaNYb67wxDT9l+x0sIjhmp+tArSD5E8cBDX6MVuL91hcIjotU
	 QjD+zm3r+JQ5g==
Date: Fri, 28 Oct 2022 01:30:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel@sholland.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 apatel@ventanamicro.com
CC: daniel.lezcano@linaro.org, tglx@linutronix.de, aou@eecs.berkeley.edu,
 atishp@atishpatra.org, dmitriy@oss-tech.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_clocksource/drivers/riscv=3A?= =?US-ASCII?Q?_Events_are_stopped_during_CPU_suspend?=
User-Agent: K-9 Mail for Android
In-Reply-To: <40abce35-b8de-cd5c-f544-fcf344e7057c@sholland.org>
References: <mhng-298aa3f7-7054-4695-bcb6-89be226a786b@palmer-ri-x1c9a> <40abce35-b8de-cd5c-f544-fcf344e7057c@sholland.org>
Message-ID: <6354C70F-86C7-430D-AF0A-3483B772B02C@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_173042_316255_16B204F1 
X-CRM114-Status: UNSURE (   8.78  )
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



On 28 October 2022 00:41:45 IST, Samuel Holland <samuel@sholland.org> wrote:
>
>I still don't see why you consider this patch to have broken anything.
>Can anyone explain why getting an RCU stall is better than not getting one?

Taking that to the extreme, why even have RCU stall detection at all? It's not a case of with the patch the system works fine and without it there are stalls. With the patch, the system completely locks up during boot and never makes progress. I think I've done a bad job of getting across that the system just dies during boot.

(Apologies for formatting, mobile...)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
