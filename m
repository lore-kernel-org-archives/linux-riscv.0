Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAC8C47DAF
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 21:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eMNGkOBRwX4j5tVT6I2EHNPBhR2sdAmnyQC8cAn9jKc=; b=lbitzPE7/RGrmn
	YZ6fTnoCun0QFZ2dJBpPejW1DkQgx8Luh9u0bYAYqSjf9vXqE7XkMugc4hcfIyVjGz8bmRHibbMLh
	E/BZWDVtps1SPTqu1ui+M6o5pHBl+hcHGc7PpRZW0AqGQsrv+7Es0VuWGgwASXcV0a224c4VqwzZJ
	xG8uajgO2uemOO871ZxhNxTY9nO4uLysceJ/V/nvpUF7LFwar+5I3cqtrj8J5c2abBKyZyEWg7zD3
	XwGdfIHEJU3EmM2Mnv/pZgpiTpdlFlDhH4kCAfE11K/BTjJNSsshOnaeaa+/vzlR0nGkIwX5UbTlZ
	pYh5dSwh8pZlK9vYMdAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbO-008ONi-2a;
	Sat, 20 Jan 2024 21:10:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRIbH-008OEe-3D;
	Sat, 20 Jan 2024 21:10:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 83CD9B80944;
	Sat, 20 Jan 2024 21:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3417AC43330;
	Sat, 20 Jan 2024 21:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705784998;
	bh=Mh4+2rjEl/tfirk6ZrJJo/+D3Z21pmSdnoQgsLi3+Hc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gBabWffUhXIzoKs5sudLgHP01fwVoOZ8G8XJppwrSIIqTXd2XYdNBCXywvJDVmaR0
	 VQwuvGapishRyDTmmjTM7bUqzXJpyjK1h9SC1IaTrGptzQuCxjz7cLGSVqLdkBWQRC
	 u+x7wG5sj4K1RWc1aYbazrFCRwmJWgCgVz0cT4BIYB4v4S9b6GrU/rO9S/reHa6wof
	 N4QLgOaSg5v+YyptWT1v0cTgFIuK8vPMo5HUtXA80XG+dGvgSS6WLvRIwqNAUwD8ZI
	 dyzIoechWjSaFhyqfCz2xhvbCtFX2PGS9rCj03lLMuj84C855CJQHmfdu7ymB7dMmg
	 9WOYs+ahTvD2Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 23795D8C970;
	Sat, 20 Jan 2024 21:09:58 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] resource: add walk_system_ram_res_rev()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <170578499814.24348.4213715182572913470.git-patchwork-notify@kernel.org>
Date: Sat, 20 Jan 2024 21:09:58 +0000
References: <ZVTA6z/06cLnWKUz@MiWiFi-R3L-srv>
In-Reply-To: <ZVTA6z/06cLnWKUz@MiWiFi-R3L-srv>
To: Baoquan He <bhe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kexec@lists.infradead.org, x86@kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 akpm@linux-foundation.org, ebiederm@xmission.com, takahiro.akashi@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_131000_207617_455A03CC 
X-CRM114-Status: UNSURE (   8.82  )
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
by Andrew Morton <akpm@linux-foundation.org>:

On Wed, 15 Nov 2023 21:00:27 +0800 you wrote:
> This function, being a variant of walk_system_ram_res() introduced in
> commit 8c86e70acead ("resource: provide new functions to walk through
> resources"), walks through a list of all the resources of System RAM
> in reversed order, i.e., from higher to lower.
> 
> It will be used in kexec_file code to load kernel, initrd etc when
> preparing kexec reboot.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] resource: add walk_system_ram_res_rev()
    https://git.kernel.org/riscv/c/7acf164b259d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
