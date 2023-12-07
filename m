Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AB4C4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 15:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1D/hcc9KxKyojLzrn+GXpfmFZjV7saeDcT72Mc7Lfi8=; b=aWsFrub6o73/8R
	waagmTxZbmLVsdhx3ph1pRHdZyLe8FgLRewgJYiCEEdtkE8j4UVCW5JTiWOUQWNlsuu/YNa0+pGP7
	1oR+2CQLKXyujwFqqGDeASoPzEd8qjD0R9Xi9PScueG9Yb4ZW6UBVCbRPrkcXeoCnSf1BbnOCsU2v
	WQ504YxejC/H2Hu04KwXBMtlf/NW4jBMJwjEmbaGKREKKSB3TnufDjO1Fyp59+zgkVyF8+g+jn1eR
	BL7T4Np63rilgUbA0kKlg2W5ndD9RMPJJamVeSqc/heC8bbc02ONowN6RPYWNZVlQ7Rig2uA2iqaI
	cuzGGImf4ZtVMSZ8Zl7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGBB-00DANP-28;
	Thu, 07 Dec 2023 15:20:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGB9-00DAMc-2o
	for linux-riscv@bombadil.infradead.org;
	Thu, 07 Dec 2023 15:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bEqJTrLzrpZlx4UQbNSnJo80wAb9MCrHbHJNoXX8YAI=; b=c9lmEZe/e7mhxR+nShKwmmqR/z
	MvRpWnZRDtyai4iNoyGe+WEViAFRuf5J4xfGYZrTHm21bgcEOs3Kek42lsjsl5BvR/lMZYfa/XSbA
	By8lSmny2J6uB6NWNmMovgPueFAePr96I1Ww8P53O/D90RSyOVJOQYSAETG9DUO0zqXn+Jp2UM3zX
	bOsRmHQquCSXE1hSjvUdFsuqvha9QUC4VB+Yb/mXxl2neqZtdkrzCwBVaVIgrJ/p6WJc188Jcl6Cu
	M59MJfHi+eAmL3S1q1UYYzctdIYa6FSKBoVQy0YinVpy5closilMmLHCi+HSkly0whsnIEq+8Z/Xl
	VMjokiYA==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGB5-0061tt-2e
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 15:20:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6F5F1CE246A;
	Thu,  7 Dec 2023 15:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9C27C43395;
	Thu,  7 Dec 2023 15:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701962425;
	bh=dEiEnCH6cRPod+jMyaWGSwv7fjXWfQzs3JH12GvvQcc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iZ8lfI3oa91MZ711pJyHksIVSwWf7i1E7+4oWJ6toQ67AQdG+YRiaHDM8gQVw1HEx
	 FRLHr+ztG/VKGQEJQei+PqHxUk0CKwpTFl7o1tbLYFhwGjM14pAdkfhd2cjEhDB8sf
	 CGRFK1fPUtO+2ZMIelcmJHur34fmvmv2ubhfjmvtj/UDM8Q2OAsqxJ7VwXTP4LdaoZ
	 a7Px3uAHGgoNqLHMLdSPveq8TLRZsTfaX43wZ/L3Subolvr7/Lsof+EsPUyRHdQC+s
	 BvhgY3xfCZEX+vWaSiTrJOVhscbS8PJlwQcrfMVz45v0wCWeTB6QFWraVqU3dSQkLG
	 K5PijnOrDZ09g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CAEAAC4314C;
	Thu,  7 Dec 2023 15:20:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: fix misaligned access handling of C.SWSP and C.SDSP
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170196242582.12999.14639879842015285303.git-patchwork-notify@kernel.org>
Date: Thu, 07 Dec 2023 15:20:25 +0000
References: <20231103090223.702340-1-cleger@rivosinc.com>
In-Reply-To: <20231103090223.702340-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@ci.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_152040_196091_477DCA21 
X-CRM114-Status: UNSURE (   9.99  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri,  3 Nov 2023 10:02:23 +0100 you wrote:
> This is a backport of a fix that was done in OpenSBI: ec0559eb315b
> ("lib: sbi_misaligned_ldst: Fix handling of C.SWSP and C.SDSP").
> 
> Unlike C.LWSP/C.LDSP, these encodings can be used with the zero
> register, so checking that the rs2 field is non-zero is unnecessary.
> 
> Additionally, the previous check was incorrect since it was checking
> the immediate field of the instruction instead of the rs2 field.
> 
> [...]

Here is the summary with links:
  - riscv: fix misaligned access handling of C.SWSP and C.SDSP
    https://git.kernel.org/riscv/c/22e0eb04837a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
