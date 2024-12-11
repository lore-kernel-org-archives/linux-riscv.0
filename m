Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E01E77182
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 23:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e+g/th2Se7zRnKJAM5dDtuJrTisoHd4tscWLQAMZ7cs=; b=gcxn/AOZnLOI9U
	6kcPk/wh1DFQhTXM99TDW04xdbk+VBHRq4Yx7cHU8ah9EHeBTR6SkUDNsnt2qAdAEJOMOMwBah+oO
	uYvBlsj6ocVEPHZq4DtqPDv/EycmrM2EgTCiP2vQDgE+pSV4J5oFpvj/yrb1+MhIHi5f6cyfOAaCi
	Xqa8holWos4HuxkCknPhSIzNgRTX0S4HEUNVtLA5v8qWHXv2jFtn/D7I4on93XXKGyv7M46SWfSdq
	u+q1GLGHdFj4P0eDkS7it8efUdVgswS0AuV8tgEEfOMjhMRU8QN4TEJ/JhbRBiV2W+hhHt9DN67p2
	WtayTcOXlHuNGgeh0S1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWOZ-0000000GWeZ-1bJZ;
	Wed, 11 Dec 2024 23:45:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVG3-0000000GKZS-1qJb
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:32:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C34BB5C67E2;
	Wed, 11 Dec 2024 22:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5076C4CED3;
	Wed, 11 Dec 2024 22:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956358;
	bh=Dtby0qiULUFzZD3soDB2ZMr1AJrfu0wubG7oLHi5HuA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GpKNGYUJHmYhkwBIdn+plUspHkFn0Zm8KfkjOjEsmfiPHLnb4H4Yb56CIsvTo6G3G
	 ro9RBbL5zJiakfLk7m7UodiGc2RsH0EnwN/ZPRQLgc17XoqXD+LtyuZthWWBgdEzn4
	 j3Or1LkCIf5Y1jeXRr5WHQ+ennorEs4Rvck1khiRUEO3Iv+46FlOpuMAUFg4rPOaus
	 bjVornFwVeBvkNGjhAVruAVtvygQ3KGbMrtbE5LbIgibGdUbhG5AXoAu3YYdYDMzxt
	 fBoOsk2KwL/VBSzheIgRwl4MtUE3yunXOfKzYmQ/fqdXslhdbhWk3b/CTFjJjXq0Fl
	 wz4UyZjCFfOBg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BD3380A965;
	Wed, 11 Dec 2024 22:32:56 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] docs/zh_CN: add the translation of kbuild/llvm.rst
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395637500.1729195.10613393812752938273.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:32:55 +0000
References: <20241023153235.1291567-1-dzm91@hust.edu.cn>
In-Reply-To: <20241023153235.1291567-1-dzm91@hust.edu.cn>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: linux-riscv@lists.infradead.org, si.yanteng@linux.dev, alexs@kernel.org,
 siyanteng@loongson.cn, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 hust-os-kernel-patches@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143239_536953_9B3A6F72 
X-CRM114-Status: UNSURE (   7.40  )
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
by Jonathan Corbet <corbet@lwn.net>:

On Wed, 23 Oct 2024 23:32:02 +0800 you wrote:
> Finish the translation of kbuild/llvm.rst and move llvm from TODO
> to the main body.
> 
> Update to commit 145082ebfcf0 ("Documentation/llvm: turn make command
> for ccache into code block")
> 
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> 
> [...]

Here is the summary with links:
  - docs/zh_CN: add the translation of kbuild/llvm.rst
    https://git.kernel.org/riscv/c/b934bc754265

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
