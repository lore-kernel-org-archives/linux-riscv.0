Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B10C87FDA
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Aug 2025 21:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d+8wdPaZounlHKOp3i7YFQTpfRN8TUnilUMV5RD9M6g=; b=c2TA+YQifJ1cWn
	MHvR80QxCTvzKFM/YyO7GiaYOrgFJIDD03Sp+kF1+9QIhC7ysBejSnQYatx1YeZgOBnPKu51yzIVd
	cosIq7nUSuA17OGq6OblPxXvyZMnh28S7/iDdB/PxkizqKQH4EXfJd3Q+WjRqpK9B/EN4VYuQmZ6P
	7qGrOBuZzn9aDpsU411OmPJ3HVYW6BxtpasxP9xyQ/pgs68l0zfCcQj9CXkuunKfUaT8JFvbLjer6
	vAK8xK/Con6x8pFJSXST7FPzo9Y79gxb0K3Crer4qAn8Y7iBMuCKRev2yp+37Lqd9sK5bwgpCZ2pk
	lpCQKi1nz/pZOJrBIWFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDNR-000000060KR-01Ib;
	Sun, 10 Aug 2025 21:14:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDKo-00000005zWC-45Qo;
	Sun, 10 Aug 2025 21:12:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EBFFCA568C7;
	Sun, 10 Aug 2025 21:12:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FBDDC4CEF9;
	Sun, 10 Aug 2025 21:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754860325;
	bh=SVf33tSFtUiZDgX+LrTamKLmL2FlBV4IaY9JDQKAi/I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eytNvycDFo0d67cAAYPzayW0cuXtbv6CCYMFcz31wwKSUGEg4vcLRaWUbtXUBY77o
	 KRbxDnPxCuluOskwQYE7SCi0VL8PxJcfp+HG6rthf67NM7k9v6O6F21qrLTZdxoyjK
	 Q3x6nYrWbG06R83g8S0m9CjDT4VKE8Qkd5KcoBKDlehN/4gn13lBbnPF2BF+vsdQFS
	 Dx3OiByWhkUeit4cxohz4pAAYxFK2iT73XjIfLEJtW39ndG2Yq/OnYtCycIixA8u6k
	 E5vV4pQhiGkhGYBvZ6mR6c+K12gZo/MmkxucoZ0jDD+s6358tbxGkByhEHChMgR735
	 Xcksopc6bHZpQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DD839D0C2B;
	Sun, 10 Aug 2025 21:12:19 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v8 00/14] riscv: add SBI FWFT misaligned exception
 delegation
 support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175486033798.1221929.4288222571177001101.git-patchwork-notify@kernel.org>
Date: Sun, 10 Aug 2025 21:12:17 +0000
References: <20250523101932.1594077-1-cleger@rivosinc.com>
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
To: =?utf-8?b?Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 shuah@kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
 samuel.holland@sifive.com, ajones@ventanamicro.com, debug@rivosinc.com,
 charlie@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_141207_143239_F62F65DA 
X-CRM114-Status: UNSURE (   9.31  )
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

This series was applied to riscv/linux.git (fixes)
by Anup Patel <anup@brainfault.org>:

On Fri, 23 May 2025 12:19:17 +0200 you wrote:
> The SBI Firmware Feature extension allows the S-mode to request some
> specific features (either hardware or software) to be enabled. This
> series uses this extension to request misaligned access exception
> delegation to S-mode in order to let the kernel handle it. It also adds
> support for the KVM FWFT SBI extension based on the misaligned access
> handling infrastructure.
> 
> [...]

Here is the summary with links:
  - [v8,01/14] riscv: sbi: add Firmware Feature (FWFT) SBI extensions definitions
    (no matching commit)
  - [v8,02/14] riscv: sbi: remove useless parenthesis
    (no matching commit)
  - [v8,03/14] riscv: sbi: add new SBI error mappings
    (no matching commit)
  - [v8,04/14] riscv: sbi: add FWFT extension interface
    (no matching commit)
  - [v8,05/14] riscv: sbi: add SBI FWFT extension calls
    (no matching commit)
  - [v8,06/14] riscv: misaligned: request misaligned exception from SBI
    (no matching commit)
  - [v8,07/14] riscv: misaligned: use on_each_cpu() for scalar misaligned access probing
    (no matching commit)
  - [v8,08/14] riscv: misaligned: declare misaligned_access_speed under CONFIG_RISCV_MISALIGNED
    (no matching commit)
  - [v8,09/14] riscv: misaligned: move emulated access uniformity check in a function
    (no matching commit)
  - [v8,10/14] riscv: misaligned: add a function to check misalign trap delegability
    (no matching commit)
  - [v8,11/14] RISC-V: KVM: add SBI extension init()/deinit() functions
    https://git.kernel.org/riscv/c/cf648c400fd2
  - [v8,12/14] RISC-V: KVM: add SBI extension reset callback
    (no matching commit)
  - [v8,13/14] RISC-V: KVM: add support for FWFT SBI extension
    (no matching commit)
  - [v8,14/14] RISC-V: KVM: add support for SBI_FWFT_MISALIGNED_DELEG
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
