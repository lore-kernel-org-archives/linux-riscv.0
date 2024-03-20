Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F91ACD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 20:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mlLy+C0kqbpr8059D/qh6XEQW5w1vSjwv7sizta7iFE=; b=xIMZ2GXvyiDG0m
	/VRi/FJYdI23CrB9Zp+aoK7Z6evBK8umZh0KrvfyCTDl0An0xgnLCnJwi4OFn8kbn7Na2gfB1J4XG
	8CVe40kWyqliPJ+Urihgn+NEkRagQjVz80qnfih8YO9SF21lgQo1X0mZo2fRggDwMzfwSrhEDg8Tc
	d2rQS9UQ60xXV+KaZ9FjKuMdPOZa7WTmeMveD+cJtghyKlmzPfI6uEZlvoF5G7ILx5zNF6ibza0Oz
	Y+CaSaYKszBVifqX+ocQ+aHoSYixg3uDXhHxOI3waa4TJ8M0z1YdFlCJ2gnTMBJOe6rfVZMu5komj
	/h44ApJ8FyUY25BU0RuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2tf-00000000vwp-0oJa;
	Wed, 20 Mar 2024 20:50:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2tV-00000000vph-1ckL
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 20:50:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E68561126;
	Wed, 20 Mar 2024 20:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5DD8EC43143;
	Wed, 20 Mar 2024 20:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710967839;
	bh=x9hRnCs/W82hA20jbvKpA85eC7xzuNtacPnbZFWHB60=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dTGTYnPJPH05yZ4VXqcyl1PlIy9mVMiD2INE2pLDgJaHDGwF96rAY/5jOgPRWJm5Q
	 GHv/mSMJvvXOtp7qR/bU4JKGxZyr/nuXQjm7MrwCivr5XaXyZ00h7V0QKI4qeSLmHS
	 kEq6xnFwj9elxNEuC2Mc5BQfb24/YdBQ77Fct6I1MIOOfLV/CbNo/KNzz6DDhkbLUp
	 daws6tG2D4XQOXdYaYJr11UemCG1HhCEJIcbuIHtM5VnIFDFn3zZplirxyzpyYxeT7
	 q7+xvTaiyzqC87vWO812w5PD6DbBrvmcVIZuEO4evH7UUyIf1drcUrXrS7PP5BFqIr
	 8KqFwLCyInmVA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 56D4AD95060;
	Wed, 20 Mar 2024 20:50:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH V2] riscv: vector: Fix a typo of preempt_v
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171096783935.6804.17753775200299684808.git-patchwork-notify@kernel.org>
Date: Wed, 20 Mar 2024 20:50:39 +0000
References: <20240221100252.3990445-1-songshuaishuai@tinylab.org>
In-Reply-To: <20240221100252.3990445-1-songshuaishuai@tinylab.org>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, andy.chiu@sifive.com,
 ebiggers@google.com, vincent.chen@sifive.com, greentime.hu@sifive.com,
 linux-kernel@vger.kernel.org, andybnac@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_135041_592561_38005BCF 
X-CRM114-Status: UNSURE (   7.39  )
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

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 21 Feb 2024 18:02:52 +0800 you wrote:
> The term "preempt_v" represents the RISCV_PREEMPT_V field of riscv_v_flags
> and is used in lots of comments.
> 
> Here corrects the miss-spelling "prempt_v". And s/acheived/achieved/.
> 
> Reviewed-by: Andy Chiu <andybnac@gmail.com>
> Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
> 
> [...]

Here is the summary with links:
  - [V2] riscv: vector: Fix a typo of preempt_v
    https://git.kernel.org/riscv/c/700c2d9b1b17

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
