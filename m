Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44497D3C525
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 16:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QtUCk4khFQCqawnWWT71bSGH2SUxRfveVKae4khVjww=; b=MOYQf31rO+cSoD
	Aeited8hPj73YRjqPTSfckJMAjmIu516eyCXimZNwa0sq4xL063dv2canczA2vaYHyzW0NcfUN1eG
	54ili8At3YAoT716S29aGuKCnj1EmUrYbQlQV6DC7N2Z+ChGrGv3L7epMgE6CvQC8pkgQDJnXiBs7
	CMYbcMDzqlxg6RA3BC4ANjvu5H38cA+hNwkxmwxpAnkaCfK47tw0n4MqdiZAN9wI1zOxDbcjM0IoB
	/iju2SRHDe/xzkelDl3Go4PSy/HYat7PU4eXgFGddWO0QgqwMbpq2UD5ADEtWaQO4ekM+cdzN6JqD
	s/4AqKDIBWu/l9n2xurA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Tdk-0000000FZ7U-1b6z;
	Thu, 17 Oct 2024 16:46:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1TZU-0000000FXlx-2S2A
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 16:41:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A4CA95C54A9;
	Thu, 17 Oct 2024 16:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 628C0C4CEC3;
	Thu, 17 Oct 2024 16:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729183315;
	bh=3moAy6pGdrYcuXCFA6DkXzq8Ur1/VkoJTyq+PfZTM+Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GxqlAnPvdpgkVessPZYIH9pPdVgDfH3Fri34yuY47/Du7mykvt730erdO2mEWEAI+
	 H1KoHI6ZNwGiqXACrZlbMKgRds661XVdLa4f/cjahoyk6L7W4miPEzYe2fmYz9cO0O
	 ANb5RrmeVYlIDBs1qeMrkjEFqI56EvgT6eg/N9C8PWHi71PzMG8wHCKoaylpQDBWgC
	 B453uzaPTRUCACGF3kqywJ9JK98a1jNwhidnksKVdryeFPUWTi4l3hOKQQnnSHEKFJ
	 BFSEe3g9XShdFBytQdhpE8XJ3Xhe0an6bgViRgwwIxP+uQFalzqFtj0AQYjIcVfQH7
	 MF7I976xK80OQ==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Jamie Gibbons <jamie.gibbons@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] firmware: microchip: auto-update: fix poll_complete() to not report spurious timeout errors
Date: Thu, 17 Oct 2024 17:41:49 +0100
Message-ID: <20241017-reappear-stage-d7ba628da0c5@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241016-slouching-excess-d7a62fc926a1@spud>
References: <20241016-slouching-excess-d7a62fc926a1@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=772; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=t1fwqCU13x4cIAUxKtKLZibb9obfPjm98PUvZvpnv4g=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOmCdn6vZq0+eDfVLGbeQYmeV0Ypkrs+rmn7b3ggODDh6 ErVo1pvO0pZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjART3FGhm9lNi8/Xk64OiuS g91kqdr6xKKcB7K3Wz60LeZS/CbqzMrwP9JDqNe7Rq7nQrWEvVjVl3Ov1jaeX76BXWP6nk1rXtg U8QIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_094156_689478_9F342091 
X-CRM114-Status: UNSURE (   8.04  )
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

On Wed, 16 Oct 2024 17:35:06 +0100, Conor Dooley wrote:
> fw_upload's poll_complete() is really intended for use with
> asynchronous write() implementations - or at least those where the
> write() loop may terminate without the kernel yet being aware of whether
> or not the firmware upload has succeeded. For auto-update, write() is
> only ever called once and will only return when uploading has completed,
> be that by passing or failing. The core fw_upload code only calls
> poll_complete() after the final call to write() has returned.
> 
> [...]

Applied to riscv-soc-fixes, thanks!

[1/1] firmware: microchip: auto-update: fix poll_complete() to not report spurious timeout errors
      https://git.kernel.org/conor/c/83beece5aff7

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
