Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC2FC36010
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 03:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dusbK4AM9mkf2rjgyHnQerBByZh8qqBhsKpGCMJ6Lk0=; b=JdKjlk7IGj9cTv
	4d9aKDA3xH0zw8yKfBiqo/bCCAhqVehgy9ZFcYCDqwqbztGJQpfgQ1HAsTBrU/g2nRdWy5Ete1xjL
	1pLukDDsk0MmlDsSJlHC2lEVh5DI3+2BfAeHd2U9InThuOYDMuDWrm9OKdEx3y3XkLINK09MACJnp
	NacF5JwfqmJ7Di6zhu0TES5h489PLpjDeVsc2lsk3yYWXeNPKV9uM9ggJhR3sZG244Zq9vjzxAgjW
	HGeWa5GNdT2TDgBGOr5ecKpQ/Rz8ixlhcGZTij3dyKGG5NlL8e4YlC1tXrnH0gCvo17XNoaSxVU6O
	wVXjxF9Ounwq3x8uAvdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdqp-0000000A4Ex-2HvN;
	Thu, 27 Mar 2025 03:24:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txdql-0000000A48X-0aql;
	Thu, 27 Mar 2025 03:24:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 66F875C6AD6;
	Thu, 27 Mar 2025 03:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21FE9C4CEDD;
	Thu, 27 Mar 2025 03:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045850;
	bh=hPKRazVrtA3SSh20Hc2+cwQp6Ty2W0f+p+nm17qHibw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bTuTnTgnOvh+MgtZTOeK2TIR88wiwvKKxbtcE3UfdlB5m4Fzbb3vVspvn8Oy61p+N
	 Ttyu3kBkgiyTUunl8K0rHpmag2mjgs6lRJn/+IraXunSF60i0U15/Nmz7+ze07ijIQ
	 9epftLsWuIlzVGjrNjUnSbSd744CsBbh/8lbfgLp5bZ4z3xftAkFXMPe6nPVdQdfDa
	 1YWkfMpbDJp2c9MTyQhEnkqMT25382QuWww2p+/hRhW10GqhIoyTs6RObnp53H0FnH
	 Qu0OQLD2WfGwPlltFVFPcvxLNgO/5V+hQGxZRFWnWNx2mhODouAr6QWNKhGBWvUvWu
	 aWSw+3QDpJsmA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE12380AAFD;
	Thu, 27 Mar 2025 03:24:47 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [GIT PULL] KVM/riscv fixes for 6.14 take #1
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174304588624.1549280.15557437967851536574.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:46 +0000
References: <CAAhSdy0Wo4hQ=gnhpJGU-khA4g-0VkfkMECDjnAsq4Fg6xfWjw@mail.gmail.com>
In-Reply-To: <CAAhSdy0Wo4hQ=gnhpJGU-khA4g-0VkfkMECDjnAsq4Fg6xfWjw@mail.gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org, pbonzini@redhat.com, palmer@dabbelt.com,
 palmer@rivosinc.com, atishp@atishpatra.org, atishp@rivosinc.com,
 ajones@ventanamicro.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_202411_252457_B93ADB4C 
X-CRM114-Status: UNSURE (   7.09  )
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

This pull request was applied to riscv/linux.git (for-next)
by Paolo Bonzini <pbonzini@redhat.com>:

On Fri, 21 Feb 2025 22:37:42 +0530 you wrote:
> Hi Paolo,
> 
> We have a bunch of SBI related fixes and one fix to remove
> a redundant vcpu kick for the 6.14 kernel.
> 
> Please pull.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] KVM/riscv fixes for 6.14 take #1
    https://git.kernel.org/riscv/c/e93d78e05abb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
