Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B8ECD0429
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 00:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vejTTvNBLJlwL54EUJlwXX8fRr746Msn9meR4Ii2VJI=; b=PpNIwG9ZFh94wn
	LcSSKCQcmtDfq3zu17bdxU04rtBl+oqLi/qmHENoIC+iK465sS1xwdxWvkAkuJidTIPtECu1tjSIc
	/gWvRmJeNHDRT4eGbPUttOApKrrVbIn9jOIP4iCGkbpaXB0jIrHZfxnzCn6Z+kKhOk0iYUudyMVpr
	X2OuqP5sd+cQOlox16dbeuofBvFdZQ1k1eMFQyXEwzoDe92nKcmD92X7Flu42IDGy78WNhipdYsba
	Rpf966sCTvjottbLAC325RbN83chO8QmtcRauVVKtvTPh/066fCpe5HWA4CYfx1B4LHN8M/Y0wICy
	FLzJwGajUxFnxbqF/EXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvB1-0000000CGpY-3lRy;
	Tue, 06 Jan 2026 00:43:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcvB1-0000000CGpO-0pD1
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 00:43:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 347A36011E;
	Tue,  6 Jan 2026 00:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320CBC116D0;
	Tue,  6 Jan 2026 00:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767660237;
	bh=nUb1Uwj9eIZdtG1rBfAE/pZtILQHFp8wvMf5HI0DA+c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BXJfZYvIpVDvWHaaMgGrf5JSn0DS/SYqRYUfzvZ8ylht54LeDAEtT8G/WRpc7qqnV
	 bFb+gYxhLclsk2EU2bEGuc9hzcg/3PjFGdedQzKoYoTUmwkYNxxpDGLG2+CFfqOxVQ
	 ePlFYlucIbn/VQqoYys+R9Oq08vUdD6fDzYOQtqoGZ+UqQcaLUv+TOKBHm7eXyGIx2
	 NDCGfz97rhd8prJ2aIo5/y2DNr7/r0sKxsbhrp+YLth96OkGpihfj1/s1dZTGYI5Ev
	 wRDGHKF16A6CTLg44orhWNYhTqMuzNDXa4EodjdCNEqtX5WxLMNFez5jFCe3vaCHdo
	 8mm80dWkkpw9A==
Date: Mon, 5 Jan 2026 17:43:53 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Guodong Xu <guodong@riscstar.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Conor Dooley <conor.dooley@microchip.com>, 
    =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, 
    Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: cpufeature: Fix Zk bundled extension missing
 Zknh
In-Reply-To: <20251223-zk-missing-zknh-v1-1-b627c990ee1a@riscstar.com>
Message-ID: <225371b9-d653-f79f-4af7-26f0c1eaddf1@kernel.org>
References: <20251223-zk-missing-zknh-v1-1-b627c990ee1a@riscstar.com>
MIME-Version: 1.0
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

On Tue, 23 Dec 2025, Guodong Xu wrote:

> The Zk extension is a bundle consisting of Zkn, Zkr, and Zkt. The Zkn
> extension itself is a bundle consisting of Zbkb, Zbkc, Zbkx, Zknd, Zkne,
> and Zknh.
> 
> The current implementation of riscv_zk_bundled_exts manually listed
> the dependencies but missed RISCV_ISA_EXT_ZKNH.
> 
> Fix this by introducing a RISCV_ISA_EXT_ZKN macro that lists the Zkn
> components and using it in both riscv_zk_bundled_exts and
> riscv_zkn_bundled_exts.
> 
> This adds the missing Zknh extension to Zk and reduces code duplication.
> 
> Fixes: 0d8295ed975b ("riscv: add ISA extension parsing for scalar crypto")
> Link: https://patch.msgid.link/20231114141256.126749-4-cleger@rivosinc.com/
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Thanks, queued for v6.19-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
