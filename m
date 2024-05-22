Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42969C25B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 23:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3gwPGeyyyvPquRshBJAnoblriAKzBRRd1wcXjkGRV+8=; b=xR6rVALS7aaeWA
	+1Cmb6H0LmbJ2cEG6Ux9YRRVWs5tDKsu7Jiv+Z3NhkgXiuFoSlycKkdU5RAWIdvHEEHR78FiWsLab
	SxjBSJBWkHPxbzmSK67tLU7uN6ICGQVY+gsM/r7jVuqpJFkGRgctcqbmm75xGgXZ5pPKNm5HuaRdJ
	r7Ev5RkGZf76iZXsdPNaxXcUXp0tT7+iqPu9wEnY8M3dbNYsFE62CBq1rjqW6jK7cT7oCRVEEjdD/
	FbW39xWU3FkEi12UGAZXEQ7RSOSvUPlCwDuHyzZyvENlXg4gah8x85x1nipngLfdZkFFSr5ybhh7U
	T1PWxmAg3uc9/xgFlC7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vS1-00000004Rg9-0pka;
	Wed, 22 May 2024 23:32:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9vRa-00000004RRo-2GSl;
	Wed, 22 May 2024 23:32:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A89D62BF6;
	Wed, 22 May 2024 23:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD809C4AF15;
	Wed, 22 May 2024 23:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716420743;
	bh=sFivK456BiubdJX56tlNdVWZafvyAwixp16zhXxqH70=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MvxrjXYyWgudMCjnBPVn9CXPVvpZNtaSUZ1gyq7PTmVmsLPKSp4NYpwhcGJcgtsps
	 ZQigp0aoMd337dNepQtlG7ONduRS6voeXw8G++uWdKEk6y7kzjYZuq96XJ7/yQN19U
	 IqJrWt8Rxg0xye2QS6uRQncojNKYhA9QElzTRMJox85W4T2sCbklby0gjCZU9wjUxM
	 bIKgDpuY3lMTzfOOvE5ZE3aYgr4zJsDNOJcBlqDMfSjVhfax54WnjBVe7xoJmcD286
	 HTXTNilxLy9lspwts50EVF1udoz+PVsPXjAxFdPOlmfSbHjPLqMQ0/3xuRViW2cwUe
	 cVQfWD+cD2/eg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AF297C43618;
	Wed, 22 May 2024 23:32:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] KVM: selftest: Define _GNU_SOURCE for all selftests code
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171642074371.9409.16238055569874422523.git-patchwork-notify@kernel.org>
Date: Wed, 22 May 2024 23:32:23 +0000
References: <20240423190308.2883084-1-seanjc@google.com>
In-Reply-To: <20240423190308.2883084-1-seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: linux-riscv@lists.infradead.org, pbonzini@redhat.com, maz@kernel.org,
 oliver.upton@linux.dev, anup@brainfault.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, borntraeger@linux.ibm.com,
 frankja@linux.ibm.com, imbrenda@linux.ibm.com, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 usama.anjum@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_163226_737560_913AFE95 
X-CRM114-Status: UNSURE (   7.31  )
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
by Sean Christopherson <seanjc@google.com>:

On Tue, 23 Apr 2024 12:03:08 -0700 you wrote:
> Define _GNU_SOURCE is the base CFLAGS instead of relying on selftests to
> manually #define _GNU_SOURCE, which is repetitive and error prone.  E.g.
> kselftest_harness.h requires _GNU_SOURCE for asprintf(), but if a selftest
> includes kvm_test_harness.h after stdio.h, the include guards result in
> the effective version of stdio.h consumed by kvm_test_harness.h not
> defining asprintf():
> 
> [...]

Here is the summary with links:
  - KVM: selftest: Define _GNU_SOURCE for all selftests code
    https://git.kernel.org/riscv/c/730cfa45b5f4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
