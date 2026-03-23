Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF425F4613F
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 23:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JPtRkT6blDGwLvUZoD13ibnd6NEl4hw3xivs0kS1ifw=; b=MvMPn0OLqYIe9v
	KHBXv8o1cOGiAIhO7aBQcBNWg2Jrl2Qyg1yrOwSnMm3CfB4Hlia1DnyrIDoJyZAj8mNiNxM/426Vn
	JmKb+ke19xWVII++VzoEsPR0hYFig2Mg5m1oYvebGiPplRiweP/oyg2l6+wowm+KcWRe1rWbzXfiB
	ldaISrXEb4pmTDR3r42KOdhuBtiM7SNMQlEugPnthP0XlfZaF3HcYrFIDifXclhR/pC6w1VX88aX1
	4hj5Txl1cBvhBjCDfYZFm2lUIcm9vuJxFk1S1MqNyMzS6c2lG9qZCetOBbjnZcg6zXBej1nv3OXes
	t47j9F3JknUOgli1JB2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4oug-000000009hw-3TzB;
	Mon, 23 Mar 2026 23:42:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4oue-000000009hT-2VsF
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 23:42:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 63F52434DA;
	Mon, 23 Mar 2026 23:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75356C4CEF7;
	Mon, 23 Mar 2026 23:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774309340;
	bh=yzWhvvMxR8mps9oOD9s/vZy+Nsq9qApxhLvdCQ+RdWI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cF3DM22O65v7PXMTZ/fbY8eBtsakaMF1in9C7pyS8oy+6Z9lLdmkObuZHviMpG404
	 aE/ZqVzyglraPefR6sEKUrMbQJA2YiKpPf2dd5VA2p63k/nFVA26vC5iiLv23EqhLi
	 h9iTAFVrPUhLiYvD00EH8EEJuq1RUItCOLYgYT8yTy0ueef93cwF8DSIXhvfdym6ly
	 SodT3gZWsB3Npdth5XzG13nAZBX+Q8FOjKZ3vqoiSXzGzcpr65HE9aDil5O1oHAZJB
	 mrekFtsuEoC/7vXJlkVfQKZZI4HJk7JqEPWQl9MwzBUdZq8nSZja8rtmPnkk6xxDPJ
	 OjiUXC6iR5QYQ==
Date: Mon, 23 Mar 2026 17:42:16 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: "rom.wang" <r4o5m6e8o@163.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Conor Dooley <conor.dooley@microchip.com>, 
    Ryan Roberts <ryan.roberts@arm.com>, Sean Chang <seanwascoding@gmail.com>, 
    Anshuman Khandual <anshuman.khandual@arm.com>, 
    Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Yufeng Wang <wangyufeng@kylinos.cn>
Subject: Re: [PATCH] riscv: acpi: update FADT revision check to 6.6
In-Reply-To: <20260305091433.83983-1-r4o5m6e8o@163.com>
Message-ID: <3de0f696-0710-fe99-9052-5dc643936aca@kernel.org>
References: <20260305091433.83983-1-r4o5m6e8o@163.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_164224_657001_527077B7 
X-CRM114-Status: UNSURE (   7.45  )
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

On Thu, 5 Mar 2026, rom.wang wrote:

> From: Yufeng Wang <wangyufeng@kylinos.cn>
> 
> ACPI 6.6 is required for RISC-V as it introduces RISC-V specific
> tables such as RHCT (RISC-V Hart Capabilities Table) and
> RIMT (RISC-V I/O Mapping Table).
> 
> Update the FADT revision check from 6.5 to 6.6 and remove
> the TODO comment since ACPI 6.6 has been officially released.
> 
> Signed-off-by: Yufeng Wang <wangyufeng@kylinos.cn>

Thanks, queued for v7.1.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
