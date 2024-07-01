Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E12C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 13:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tYyKUx6GUSHMvHfCHxSk01PeviN94Khpl/WT+EH3Qeo=; b=qWoo84qHIuiCgN
	qBqzYlnWWKP4HoIOa6L34G6ZIe6rjDwedgbnQAY6orccShMH3OJ5qSAG7cS5TYsy16HoPMvMV3Vbs
	WqcNcoGm6XPFSU6usCA2XInhwebUckHlR5bGL70XVkzpkQCMClD+wjplBjpHSkmJDDN+vABY1T1hr
	bZ2u4IWnNNNf3WA3uekXH8Oufy6mkx5loVDNH0yw5Yx4oDyPT4eZShPAOR7lk4apxn62XgCaoWCyA
	c+imH919sRL5Es9uynlTBOkcaGWZsne+DaarDYtuAhSGHxKjxAYGUqO24Su6uVyFVRu0yNdAG1iml
	fZeZDGazqwiTFgLc8vwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGfY-00000003NmW-2eBE;
	Mon, 01 Jul 2024 13:02:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGf1-00000003NT6-0GN1;
	Mon, 01 Jul 2024 13:01:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F1A5A612B1;
	Mon,  1 Jul 2024 13:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B61DFC116B1;
	Mon,  1 Jul 2024 13:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719838893;
	bh=mzcB+fYp3o9NJjTjsfH7uSf97jiaMjiCzdHrbPN4x/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sX4NA97c5+M3LFDkuGDmaVnn/H9lqdywQTGi+jxtly5k1AKfc5AdVHcAPDo+4ctLK
	 Yo31K7dSkmvLiKRA+jxdP0vmelQs2BzJm5Om54DuXw5S665Xop1Suz19U/xaui/sxx
	 /69EGjx8QiSxvyBUkFCafe/RV4ew1fGgVW3CI7Qy1uWSERd6c4/Kp8sM8fPfP8IvXV
	 7L0A1hcoerKhduog+LaCtUpLMV6f9YRybnBvrK0AlwLMvD80qee5VyvAdsc8n9UY5Y
	 cQsutZuPE+rGLLEPgfhltbn6nMO8wUtwwU4OzhFhMmLlu+1ih/2FHHNSqG+/J0dJtC
	 TLfebFRb2V83g==
Date: Mon, 1 Jul 2024 14:01:27 +0100
From: Will Deacon <will@kernel.org>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, garthlei@pku.edu.cn
Subject: Re: [PATCH v4 0/3] Assorted fixes in RISC-V PMU driver
Message-ID: <20240701130127.GA2250@willie-the-truck>
References: <20240628-misc_perf_fixes-v4-0-e01cfddcf035@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240628-misc_perf_fixes-v4-0-e01cfddcf035@rivosinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_060135_217636_906DDE82 
X-CRM114-Status: GOOD (  11.65  )
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

On Fri, Jun 28, 2024 at 12:51:40AM -0700, Atish Patra wrote:
> This series contains 3 fixes out of which the first one is a new fix
> for invalid event data reported in lkml[2]. The last two are v3 of Samuel's
> patch[1]. I added the RB/TB/Fixes tag and moved 1 unrelated change
> to its own patch. I also changed an error message in kvm vcpu_pmu from
> pr_err to pr_debug to avoid redundant failure error messages generated
> due to the boot time quering of events implemented in the patch[1]

I'm assuming this series will go via the riscv arch tree, but please
shout if that's not the case.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
