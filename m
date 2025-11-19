Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BC9CF31B8
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 12:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPdCTpkPr7oJCcwY9j14xVymgYPtJp8p4MPe9g0bLQw=; b=FMg8Qd5ErSItFI
	vehQPnzRkwJeelw+sxgpTytAJnVI1i2WLZ4ipsIhdotBGSa9DeH5GhA1ZXJ5A1EocGgnFq950HG6F
	lDrV8N5tmwD6L6rYZF7/cx+l4kuWa0JossCs6rKn/8E+LtqJ30oDFYEhdus1nCFweldH5xdo35cCE
	fZgPw0oD/lqs1hjZWCAxjcp8wFoGZfmzvCGtjU7SH3C7tsqqoNohrGkiWg0l30DHutTnBRvCQ4jSk
	3v9jYDqiqMxwqfWAWkVrXoDX+q/549wEar5LIovCVmeALzbIXFLZnNDNXiSvSYlxjoSa/KNvezVyD
	VVoOgRPYVGgmr6SfolyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhKn-00000003A79-337L;
	Wed, 19 Nov 2025 12:30:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhKm-00000003A6B-0R5T;
	Wed, 19 Nov 2025 12:30:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0755A602D1;
	Wed, 19 Nov 2025 12:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6CDDC19425;
	Wed, 19 Nov 2025 12:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763555450;
	bh=mMRAx6ZJOONKImYBrNRIu3H4Zn/hB85+rterq9QpQ8g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XO44VA4MS43Ut+JjCb+Yu+HPzJBJetzrAmCyurSY2nYyRtbDLu7XLmHmpE+OC8POg
	 uqI5cGg7pJMRyqkTX+R+ZVKYi4Sp4jlsGVYj2j+nPOeqlINtjBUO0BrLVxJWvmRtts
	 uILMmJOT6Zz7Jn16LRTYn6a1xnoHgUz5H4m8pGTIffrENWw9jM4BPewgA8kJt9UR01
	 Zoa+dhVcTsnVcKVfmQvXGmLAjkRY7OGdHHDv77CvCHz4lqtdDIibJ7TF3e9iG6RC2q
	 za+T3vfASWLdS3yEBjjQj8CH8PTd3KN0ZXR6CzqJe75rGohr9CGHAREnNoARrWdxvU
	 ZfnaPV+YV1Wow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34233380AA40;
	Wed, 19 Nov 2025 12:30:16 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 00/10] riscv: Add Zalasr ISA extension support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176355541475.758643.7685467502830246491.git-patchwork-notify@kernel.org>
Date: Wed, 19 Nov 2025 12:30:14 +0000
References: <20251020042056.30283-1-luxu.kernel@bytedance.com>
In-Reply-To: <20251020042056.30283-1-luxu.kernel@bytedance.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, will@kernel.org,
 peterz@infradead.org, boqun.feng@gmail.com, mark.rutland@arm.com,
 anup@brainfault.org, atish.patra@linux.dev, pbonzini@redhat.com,
 shuah@kernel.org, parri.andrea@gmail.com, ajones@ventanamicro.com,
 brs@rivosinc.com, guoren@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, apw@canonical.com, joe@perches.com,
 lukas.bulwahn@gmail.com
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
by Paul Walmsley <pjw@kernel.org>:

On Mon, 20 Oct 2025 12:20:46 +0800 you wrote:
> This patch adds support for the Zalasr ISA extension, which supplies the
> real load acquire/store release instructions.
> 
> The specification can be found here:
> https://github.com/riscv/riscv-zalasr/blob/main/chapter2.adoc
> 
> This patch seires has been tested with ltp on Qemu with Brensan's zalasr
> support patch[1].
> 
> [...]

Here is the summary with links:
  - [v4,01/10] riscv: Add ISA extension parsing for Zalasr
    https://git.kernel.org/riscv/c/0597b9c8627e
  - [v4,02/10] dt-bindings: riscv: Add Zalasr ISA extension description
    https://git.kernel.org/riscv/c/6e2a0ff70abe
  - [v4,03/10] riscv: hwprobe: Export Zalasr extension
    https://git.kernel.org/riscv/c/d5e20628a882
  - [v4,04/10] riscv: Introduce Zalasr instructions
    https://git.kernel.org/riscv/c/c4139ea6717c
  - [v4,05/10] riscv: Apply Zalasr to smp_load_acquire/smp_store_release
    (no matching commit)
  - [v4,06/10] riscv: Apply acquire/release semantics to arch_xchg/arch_cmpxchg operations
    (no matching commit)
  - [v4,07/10] riscv: Apply acquire/release semantics to arch_atomic operations
    (no matching commit)
  - [v4,08/10] riscv: Remove arch specific __atomic_acquire/release_fence
    (no matching commit)
  - [v4,09/10] RISC-V: KVM: Allow Zalasr extensions for Guest/VM
    (no matching commit)
  - [v4,10/10] RISC-V: KVM: selftests: Add Zalasr extensions to get-reg-list test
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
