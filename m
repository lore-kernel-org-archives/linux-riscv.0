Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A55EC27C40
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 19:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fh77sdSxANW1ljEcfMbTg2pzrYanuXCiPri/W6OZFtY=; b=o+T+pXuCMIcQjZ
	P80i1PG2O0g7NXfdk+n3hCYar4Vxhzqh4hqvuK5q/GcWyKt7l4CI0ETsN+DSgrS6KzEKlRzQ++cNX
	fh6NnU7rWWbrlJrvtxonYDTfpv4QuUObe5tjW56aOUw6BwciWy3wVqHQ9cRalz+Lv62/umOj8Ymhj
	DmVOryH0mu5QhTnRcKuwwYUc6XAq+D30iPln7Q6OcsxqLtVOXuYvx3M43WEIIYa4HsU2RKe6HnxzG
	hZi35D6OKZ9MLWRr7uGESLR8gWw6vWkl7o63J157XXfAj5uq4OqVKReOgS5CH4/3ePUqzfnF3Z20Z
	d2S+2oZ6l8VTKVBqeRRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYtiR-001QpW-1w;
	Wed, 23 Aug 2023 19:40:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYtiN-001Qoi-1g
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 19:40:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A998E660E1;
	Wed, 23 Aug 2023 19:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA082C433CA;
	Wed, 23 Aug 2023 19:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692819623;
	bh=Wc+m8jD8YQL/zh4vGtlUJOEpUi3JDPeItPHhM51LMuA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aO7hDe3UEpjRtY4soHYHSy+jIrrjWF82P6dOSh9YEk6RnN12oexk6F3H3S7hFxsUM
	 gGvJBJ/76ZxQEv4gM7SaoZ/p5KPF4jBxvQcyCJ4Pf+HecqJuHZMgg8ievj3NbyFQYR
	 lV7sjav4b8ihsa9i+LfS5T7m8lK7nBNFMgV19B+Bw6VDXNZGzO20Jzyq+mK8WDgVPC
	 m/2bCyQywE3UB5Ghfadjti+j3h46RjUTENBN+hMRvSMuar3XaUf2EDs1/YGP7AAjFi
	 8DzzG8pPCBZ6E8gnm+4uYDq5mFiDkBlb+/oYI0AEm7Ny46RU8NFam6gMQhJlKysSnG
	 l4pvxHmCw0Aww==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AEDBCE4EAF6;
	Wed, 23 Aug 2023 19:40:23 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [v1, 0/3] riscv: fix ptrace and export VLENB
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <169281962371.18988.17683864280326589373.git-patchwork-notify@kernel.org>
Date: Wed, 23 Aug 2023 19:40:23 +0000
References: <20230816155450.26200-1-andy.chiu@sifive.com>
In-Reply-To: <20230816155450.26200-1-andy.chiu@sifive.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org,
 conor.dooley@microchip.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_124027_628572_2E02FF69 
X-CRM114-Status: GOOD (  10.52  )
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
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 16 Aug 2023 15:54:47 +0000 you wrote:
> We add a vlenb field in Vector context and save it with the
> riscv_vstate_save() macro. It should not cause performance regression as
> VLENB is a design-time constant and is frequently used by hardware.
> Also, adding this field into the __sc_riscv_v_state may benifit us on a
> future compatibility issue becuse a hardware may have writable VLENB.
> 
> Adding and saving VLENB have an immediate benifit as it gives ptrace a
> better view of the Vector extension and makes it possible to reconstruct
> Vector register files from the dump without doing an additional csr read.
> 
> [...]

Here is the summary with links:
  - [v1,1/3] RISC-V: Remove ptrace support for vectors
    https://git.kernel.org/riscv/c/e3f9324b231a
  - [v1,2/3] RISC-V: vector: export VLENB csr in __sc_riscv_v_state
    https://git.kernel.org/riscv/c/c35f3aa34509
  - [v1,3/3] RISC-V: Add ptrace support for vectors
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
