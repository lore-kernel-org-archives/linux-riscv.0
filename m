Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A32DFF8864
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y0/tYds9wyn6t7vJZXF+W8ZwQoSmTFArZpgQ5zcB9N4=; b=jz4TZ2SoG0GeMG
	K7EgTFeOfQxECOqnCR/GnSgrLngQnQVDVKnQ74kbyfn4Z+6WkINJtnqqS2Gn+9aOUWEVPA3pWLXNx
	5EMDCxBomS8wko8a62XNPlpWrHSsG5CaU0fc2A5hkIh5bxNqXHmNvUpZpi4toitj7BgBsqeHTBZMs
	Gsd3RmB+1wju4kl1qs1i40nh0Cvsx5k8pcA508e44f1/lCwHquFUrZn6RpYIo5GIduplnzHk5I70h
	qX3b5lRK+TPEX7iKuUYApjlLzR93mUpB4sLgzjwverG2FrW7ir9k+Yvd7B9LuqqSBJRVBTBZB2FN7
	MQuPNlhvirYyfhPsZYwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII4X-00000004Yh7-2Uaa;
	Thu, 30 Apr 2026 03:28:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII38-00000004XCS-1d3Z
	for linux-riscv@bombadil.infradead.org;
	Thu, 30 Apr 2026 03:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3+uiHpV/LAtYNMbYmq/ynP4vXLZvhi8EpsBGglddmyk=; b=eckyab5Q2JBsZfl6bmtXLxD8QF
	FoBhrBNVj4JFe1bvEopUaURoQICXkxQx7VfNn5HSZvhThO9SX/oqp8WlE2kU3zxHkqP12oHJYvyV7
	4aDM/C4l81id7jOticsvtC+0SwQWkmKWV0IQmFnZdrFweKUsADCVfHDL+I+6OqMSMb5cZiGNwWAJS
	5cJ3mQQLFcTNrYYs62aVZPKTTk2ajCdlL/R4IP+M+Sr3/fEWydpcYi2mAM7QRXJETTgED7VPjjFPY
	PnuNtIzRMrfbsCTU46H/PdiMITdU9qodSqEYiH+zsC6s9eqcFgTGVPM6FQlnySmHw3IuoxO1c3jmE
	pMx5S/yw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2p-00000006Xih-05lj
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:26:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 041EB44581;
	Thu, 30 Apr 2026 03:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA9CEC4AF11;
	Thu, 30 Apr 2026 03:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519588;
	bh=t/IhH9m/iV8mWPsnbwCfk+wQ8phUXP0iVCLm62nekgM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KpF3Vgb8vClh3eVGUOLiEjg5YMhw6Q62COWRP36faO3hhCtc6NL+f/PKVtFHprcLv
	 +cy86/Sqm+qovVDQKy0RxIUS4hmrvsJlf1Hwn9KqImRWfoBXpfJRNc9m3EcesmTi7r
	 oAIn3Rg87L/NP0ystyKJ2D18TfuHJ1Jc9La/42Kmkh05HlLK68BmZAAnBivRVHSFNH
	 JWcL4kYgvkiaBjvZCC7u3eBvwNfsbdiF7UPxJ+QBwz1mTSMR9/TuVHrJUmHW0TkPdZ
	 gAIwDMShph//h237cohxTI0tz5h+67//4L7R2sp3pIO5GZcx8bo7z8hqud0yp6dL1b
	 68f67mE865+SQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FCE53809A07;
	Thu, 30 Apr 2026 03:25:45 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] iommu/riscv: Stop polling when CQCSR reports an error
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751954379.2274119.3865098518773080299.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:43 +0000
References: <20260227112640.20197-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260227112640.20197-1-fangyu.yu@linux.alibaba.com>
To: yu fangyu <fangyu.yu@linux.alibaba.com>
Cc: linux-riscv@lists.infradead.org, tjeznach@rivosinc.com, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, andrew.jones@oss.qualcomm.com,
 baolu.lu@linux.intel.com, zong.li@sifive.com, guoren@kernel.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_042637_893041_0ACB9578 
X-CRM114-Status: UNSURE (   8.01  )
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

Hello:

This patch was applied to riscv/linux.git (fixes)
by Joerg Roedel <joerg.roedel@amd.com>:

On Fri, 27 Feb 2026 19:26:40 +0800 you wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> The cmdq wait loop busy-polls the consumer index until it advances
> or the software timeout expires. If the IOMMU has already signaled
> a command queue failure in CQCSR, continuing to poll for progress is
> pointless.
> 
> [...]

Here is the summary with links:
  - iommu/riscv: Stop polling when CQCSR reports an error
    https://git.kernel.org/riscv/c/b2e5684558ed

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
