Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112D9C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 14:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FDf4c7LLJUy55McjyNs9vfkwOLRTgCyG7czgTPzuNOA=; b=CLX2DL9vMM5vWq
	NHQuB8M+6tjU6yPbIuqmGfWFf/Zf2zMoUucRHojA6o9EePJZkCUonhrbXt4/nYQDc6SXZBXCGql10
	msilmnA3SKAk6gLA/2m9M9ZPTPcaaM/RvP2MHsXxhELP1Z3XtcK7X4AeApLby2Lut+8Rv2YgXdSwq
	SFLpryUFIJLYDJ7ONiD9tWH0YPq4wY5CDpjT6c0Ucg+XMwsaU7aKuQGXL0abBAL16fCVsmvNvQVbM
	/d91l+VTBvjpG22E4QFJrG/5T8vQvQts7YL1aF0IWziLZJxIQIkDpzepIitpAgr/2g5TzQv5lCBf4
	y1S0Pw7kH2cZMbcrbEGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSPc-00DeRh-06;
	Wed, 15 Mar 2023 14:47:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSPY-00DeQc-2X
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 14:47:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3BD2261B69;
	Wed, 15 Mar 2023 14:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89254C433EF;
	Wed, 15 Mar 2023 14:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678891647;
	bh=lefKxRIeaGhuG7GUHWIQ/1o0mLMrDt/fqv6cpg9LV/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CRLDEUN/X2boEfYR46FSDwWfs8JqxYFPBma7wmQfoBCbxKO51hK2eXUmhCte9JvnC
	 D04X9yWNgzc2HoQQLkZpNHOF6Wp6rUnjo0q38dh2CKtUFhflp1LOGZnzPaNcnW89Uc
	 Nsrsmmmo3Vq6Mo4UDge4yzz15FqRugcn+jpa5xpFhYTpGkSJkK68b/Rezl2E6MEJUY
	 86M8XkJnuK3HuLL28uRBB0mLQ08KMRu6EYEQVC2GxNAEZbw9t/52kcpQjn2hz93HeD
	 y1ISIYV9lYGWIXSwawWH0MskB764MhtkklqZNuHAH0PrTsdQFWC9oH1LwAGHqTIe7h
	 UshstWDmuKhyw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	dare.mcnamara@microchip.com
Subject: Re: [PATCH] riscv: dts: microchip: fix the mpfs' mailbox regs
Date: Wed, 15 Mar 2023 14:47:23 +0000
Message-Id: <167889162484.100936.7931674547067067350.b4-ty@microchip.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307211053.1777066-1-conor@kernel.org>
References: <20230307211053.1777066-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=567; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=vRIZJFUXhglgCIy45QMD/9OfFH8Sr2pjdz1s85mqUZw=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmCt6pOJigUxt1KOft4L+eLbwvjJDXaf/Q4rdw2IztSu bTgem58RykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACYycyojQ5e0+7nJ/XUh06S/ +osuT+0WvupvEVs/q/7hBFb2PbfF+Bj+x2vJa03LXnNDNCv88vO1YQbNIkICRcWJjwJrm7QP8Jj xAwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_074728_888680_DDE9540E 
X-CRM114-Status: UNSURE (   8.00  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Tue, 07 Mar 2023 21:10:54 +0000, Conor Dooley wrote:
> The mailbox on PolarFire SoC should really have three reg properties,
> not two. Without splitting into three sections, the system controller's
> QSPI cannot be accessed as it sits inside the current first range. The
> driver & binding have been adapted to account for both two & three
> ranges, so fix the dts too.
> 
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/1] riscv: dts: microchip: fix the mpfs' mailbox regs
      https://git.kernel.org/conor/c/e77da13b8e36

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
