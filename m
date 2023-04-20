Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D57AC77B72
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 17:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dr2rQqGbZbTzReSSLq1rBmy1iq8AZtLUe2Z4qbERKis=; b=LpTD2RSEAlzef0
	GtqEc5UWP4Nst3IFHCdEFnAo//A6Ndh9dPDNjfn+akR34N/bHoHL/LTEYdAyzt+nlZ+3hA44lvPpM
	hvBerjC1UUUlUxmc/eM60XtgbJuXdOBnsl1i60aTlOfHqUiWInMNyrtY6HzeJw+9GSdNgufRw8ELY
	dGga05h1N512A38rvucmYE4gEMUgyJCMurZT69wuDVwpk74FjXZ9VXrLuitZXtKHF584w6+6N88HS
	+tpeVnlUAPzvugY/v8DoKC/7eVa5xreoIrQnq31LwdpWWvHa8eymBon1yqKzk0SdJbjJLraIiDf1o
	u2atK+RDAPzqNwCCliJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppYGh-008f9f-0p;
	Thu, 20 Apr 2023 17:40:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppYGe-008f8S-2z
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 17:40:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9563C64731;
	Thu, 20 Apr 2023 17:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F125BC433EF;
	Thu, 20 Apr 2023 17:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682012422;
	bh=xx+vnuJ8fbBXHjt5KUhqykE72X3YbB4D+HrbBLN/fp0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=swcqEAzzNfF4PbGtLC+Y1g8NIPrhqMOJudKRPHs5s2Csb72NKfNl3YFeGxGY/Zjug
	 mgDaBG1UiPHXP5gDhO5hZyyePMOqFVTrVQVAZtyXaaTobM+RSFX9sZMGuEAZzBK3/v
	 1jzJz7qSpleZTattS492X+EGgmP5uB7+UQs0GORMgqN2ZnP9tvicgu0W49TS9ELd5P
	 2SVRXYj2Ocu9C0rFm5WXUA+bzPprIweNTq5un4A4W8wRDrlJ7n41p+gmAmClYNyHiN
	 lPlV+xhImalzbHl1zYFi22w5s33BGoaaTU+sICbNfEDgu6SSxslrYCsLHK3zP0tG6F
	 msYaLIlP1PKhg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D2810E270E2;
	Thu, 20 Apr 2023 17:40:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v9 0/6] Introduce 64b relocatable kernel
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <168201242185.9373.5416270250289201005.git-patchwork-notify@kernel.org>
Date: Thu, 20 Apr 2023 17:40:21 +0000
References: <20230329045329.64565-1-alexghiti@rivosinc.com>
In-Reply-To: <20230329045329.64565-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, ndesaulniers@google.com,
 bjorn@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_104025_010376_CEC63B7B 
X-CRM114-Status: GOOD (  12.61  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 29 Mar 2023 06:53:23 +0200 you wrote:
> After multiple attempts, this patchset is now based on the fact that the
> 64b kernel mapping was moved outside the linear mapping.
> 
> The first patch allows to build relocatable kernels but is not selected
> by default. That patch is a requirement for KASLR.
> The second and third patches take advantage of an already existing powerpc
> script that checks relocations at compile-time, and uses it for riscv.
> 
> [...]

Here is the summary with links:
  - [v9,1/6] riscv: Prepare EFI header for relocatable kernels
    https://git.kernel.org/riscv/c/55de1e4ad43b
  - [v9,2/6] riscv: Move .rela.dyn outside of init to avoid empty relocations
    https://git.kernel.org/riscv/c/69a90d2fe107
  - [v9,3/6] riscv: Introduce CONFIG_RELOCATABLE
    https://git.kernel.org/riscv/c/39b33072941f
  - [v9,4/6] powerpc: Move script to check relocations at compile time in scripts/
    https://git.kernel.org/riscv/c/47981b5cc687
  - [v9,5/6] riscv: Check relocations at compile time
    https://git.kernel.org/riscv/c/c2dea0bc5339
  - [v9,6/6] riscv: Use --emit-relocs in order to move .rela.dyn in init
    https://git.kernel.org/riscv/c/559d1e45a16d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
