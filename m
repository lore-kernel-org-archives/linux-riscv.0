Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB2ED59F5F
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Dec 2025 02:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OrOUbx1dyeQlL2dzpP4EtNml6TBWsieRUkpb6c1U0kg=; b=tIRakpKn2g5kn1
	oMKzGykrwYUQvM+5V9IwXFMI6FgCIMXG2YrBBuoGGMZ/jtf0qX9F9e4l1YFuOyN8hoG8Bxn+ABnWY
	VcCp0Wo+rwtrTIk0GqvrSw4pEWgt2ApBZGbmC2W+0nQo0LR4QhKBQDYY8zqAyy+mLpXwGzDn9y4Oi
	5BBPII4b/H/zbmARINOAxUTkvcgcB489FbySI5LkXepJgwbKm/xHf4zz0lVpsgeS/J9T4/Xv3BpJG
	dGvZHzJlYNeyMRu1/qVsQEFhLn7T+DQj6Ge6brVw9q7feeHyoghFspPsiIjq3L/cUKzuj5rRQoG54
	OR666VyMlCx5ITWLYLvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFOw-00000001JD9-0MwP;
	Sat, 13 Dec 2025 02:30:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFOr-00000001JCp-49I6
	for linux-riscv@lists.infradead.org;
	Sat, 13 Dec 2025 02:30:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A9266014F;
	Sat, 13 Dec 2025 02:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A64AC4CEF1;
	Sat, 13 Dec 2025 02:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765593024;
	bh=eTbT3AU92DE1tjaPEckIZuyNYfDXAo1QlvRyHg2T6J4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=unDOBcpoZODCMa1jcrL2BhidX/SEb7Z5cPfwpYt7nIuz/9N7VPvKtctmylegSdGxL
	 WtfjFyvWCjhG7jdoz/fHQvGiO/iA9zMnBJyfcNAxRoOxA1zyuSKRT50Z4puGAE+xLk
	 KBPjFcJyypRUmPvoh83XEDr+8jRyJ/RMYv1zIl62Py7wHPvLPAuqdeYJS5WTH0fm4S
	 r49X4BlKmfvpvT05CbCHnuSE33RZ++GzkUfgANeBS31O9WqC3OZS271GBxKDCH4HNT
	 hxmUqa0N+AFdUeaPa0Xu/ms3xPcDe/IRaNGkteGZ7moECK1Dr2mpl1xO6qnl+YxPIu
	 /w1pZaJxqaOoA==
Date: Fri, 12 Dec 2025 18:30:18 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Charles Mirabile <cmirabil@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-riscv@lists.infradead.org, Jason@zx2c4.com, ardb@kernel.org,
	zhihang.shao.iscas@gmail.com, zhangchunyan@iscas.ac.cn
Subject: Re: [PATCH] crypto: riscv: add poly1305-core.S to .gitignore
Message-ID: <20251213023018.GB71695@sol>
References: <20251212184717.133701-1-cmirabil@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251212184717.133701-1-cmirabil@redhat.com>
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

On Fri, Dec 12, 2025 at 01:47:17PM -0500, Charles Mirabile wrote:
> poly1305-core.S is an auto-generated file, so it should be ignored.
> 
> Fixes: bef9c7559869 ("lib/crypto: riscv/poly1305: Import OpenSSL/CRYPTOGAMS implementation")
> Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
> ---
>  lib/crypto/riscv/.gitignore | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 lib/crypto/riscv/.gitignore
> 
> diff --git a/lib/crypto/riscv/.gitignore b/lib/crypto/riscv/.gitignore
> new file mode 100644
> index 000000000000..0d47d4f21c6d
> --- /dev/null
> +++ b/lib/crypto/riscv/.gitignore
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +poly1305-core.S
> -- 

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-fixes

I added:

    Cc: stable@vger.kernel.org

(Since 6.18 is affected)

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
