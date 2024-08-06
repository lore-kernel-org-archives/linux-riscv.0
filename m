Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94B6C52D70
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 20:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3uvIN18BiXI9TS7UAQFhvPt+x7Rx5J5ORaMtMUV+vE=; b=CmwWwwYnYZ9X+X
	O3DcJCYgik4XRjtSZsfZ8z/+X1nGvcWa/HyJku8CfShKxFwvW44ugQuytjRwFoxmSUrR0bsqEa/XV
	k5Y1e0FeM4k9yNdtj6wsgJcy36qOI9tG2hsrx/V+PGL7GL174dhq/CCn39wQiYevYq4Y+aOc3DS94
	NhC5mLvVKhnCBzdWFVthVhL0f32bQYRtMa16og2/lv/Ct3/WN9WhFdyZ5+c7sZYRRq9wqMoobl9kM
	Dj0/daxxHi6Z9qi3LwksRa1tU6yatoqcXaK2JcmiGZvuteEhDSzTzyAhzpP/Podk2asK76O21Ycwr
	FHkR0S/AYSC2eA9Jseag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbQo1-00000002oPu-3LGx;
	Tue, 06 Aug 2024 20:29:17 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbQne-00000002oAl-2Dmt;
	Tue, 06 Aug 2024 20:28:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6E49DCE0AB6;
	Tue,  6 Aug 2024 20:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5786C32786;
	Tue,  6 Aug 2024 20:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722976131;
	bh=Sl557BAwaHzbY08oPXeLgFTmCXhqWVHszOkVgq68tQo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MsZlLR7x/bg2NSn7c5K3+ZkAPMwNFrMK0IiALaass3WIKWSfKdXCVQcJ4ZpyO4OIj
	 eMfoKBrz3vj/fxW4Yeg/52DifwIOXvft708AmsgNNUJk96SntwPkyns9e5GslpGhcM
	 KpBnCeKNrTx7oTOzwVBZyEEkfxEu+rdOPlKx2walqhsXLpv31p/XiLdOAOuGyhW0uK
	 2Q5Lp58Nepz6rSGjDBXrNCXlCfnJBRp5Cl2k/Ez0cr7VBMb+f7XQMcX3SNelUGew4r
	 Ds5hoRFBvZZUJbPUqGJos9F+o8Uq7w8Rmzs0U+zqN+HN8jh6ynEL3V5YeZIzQK/gsp
	 AgMCbL5AT0jqA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AEF7239EF95A;
	Tue,  6 Aug 2024 20:28:51 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v8 0/5] Add Svade and Svadu Extensions Support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172297613024.1692635.16557321392270733874.git-patchwork-notify@kernel.org>
Date: Tue, 06 Aug 2024 20:28:50 +0000
References: <20240726084931.28924-1-yongxuan.wang@sifive.com>
In-Reply-To: <20240726084931.28924-1-yongxuan.wang@sifive.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, greentime.hu@sifive.com,
 vincent.chen@sifive.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_132854_802194_6DF919FF 
X-CRM114-Status: GOOD (  11.84  )
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

On Fri, 26 Jul 2024 16:49:25 +0800 you wrote:
> Svade and Svadu extensions represent two schemes for managing the PTE A/D
> bit. When the PTE A/D bits need to be set, Svade extension intdicates that
> a related page fault will be raised. In contrast, the Svadu extension
> supports hardware updating of PTE A/D bits. This series enables Svade and
> Svadu extensions for both host and guest OS.
> 
> Regrading the mailing thread[1], we have 4 possible combinations of
> these extensions in the device tree, the default hardware behavior for
> these possibilities are:
> 1) Neither Svade nor Svadu present in DT => It is technically
>    unknown whether the platform uses Svade or Svadu. Supervisor
>    software should be prepared to handle either hardware updating
>    of the PTE A/D bits or page faults when they need updated.
> 2) Only Svade present in DT => Supervisor must assume Svade to be
>    always enabled.
> 3) Only Svadu present in DT => Supervisor must assume Svadu to be
>    always enabled.
> 4) Both Svade and Svadu present in DT => Supervisor must assume
>    Svadu turned-off at boot time. To use Svadu, supervisor must
>    explicitly enable it using the SBI FWFT extension.
> 
> [...]

Here is the summary with links:
  - [v8,1/5] RISC-V: Add Svade and Svadu Extensions Support
    (no matching commit)
  - [v8,2/5] dt-bindings: riscv: Add Svade and Svadu Entries
    (no matching commit)
  - [v8,3/5] RISC-V: KVM: Add Svade and Svadu Extensions Support for Guest/VM
    (no matching commit)
  - [v8,4/5] KVM: riscv: selftests: Fix compile error
    https://git.kernel.org/riscv/c/dd4a799bcc13
  - [v8,5/5] KVM: riscv: selftests: Add Svade and Svadu Extension to get-reg-list test
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
