Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DE1D3B7E2
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Dec 2025 23:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KbgA4ivIA2pYvRTgky77JIDAoczKqDPnOX5FsGcRBIc=; b=yEaBKS0NO5hFgn
	DwumjxbpTwXZb1s5BFX0Lcidk+El5UwwWP15UTqn4bfTgrOO9/WXPKGbKCq54K5EomQKLLOzlEjm2
	1IrlXNarXRw+8PFB1HuyRRAeeNwy/YVBsohzHw2iYCpfcfn+HDwPz0tOJSF6+Y8l11ARKz7ePb/KQ
	Wvsapi7+EKTsWK8jpADw07XsmLObjzIZzWraVrKZhwZinns/mzE/ttrZw6zp5B8524Rt3ou48UrQL
	SS8zbuXPtoCe+HD2aGL5wO5Vwv54b7ZWMEFXX3P2tYxmrnSKNxYvPoNPZ/nZis6BeJbD16BB/2EqQ
	X7NcFzmeeIxDh+RU2sUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSkLz-0000000DcCY-2tkA;
	Mon, 08 Dec 2025 23:09:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSkLy-0000000DcCS-46m5
	for linux-riscv@lists.infradead.org;
	Mon, 08 Dec 2025 23:09:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1625F60133;
	Mon,  8 Dec 2025 23:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C05AC4CEF1;
	Mon,  8 Dec 2025 23:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765235353;
	bh=akhtEbJUiRojKJtbftuWFnBF21f5LJGNssVKktpsdgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PquNqk8stkQH3T6tYxNjnUGKCwEWKuga1Zdbz1UStzQZYMR9qhhn8PCafJNcMFXW1
	 OQVMlLkM/tzEPo5X+2IVJpcgNzIGCGQraCHumowp795cNudgPFdI/r/sGGqUwWVW0G
	 KicMoKbigreyVm/RIqMB6IpZZz3h6U0JMGamWDsk7B8ynHwjRy6NwykC/NUlAAfovX
	 jkwIMzdwFN61JqkSJ3xpYee8KdBkBr6KG/tfjps6OAxiVqVrpav9eMfGy2jY7h1+x2
	 aidY4AZbU8BUgnKvA8vJF4e274Ekab7Gz3LcMQrm/OKG/hjDcrYhyFYkMBRGCAQjTq
	 CnX3RgziD8t8A==
Date: Mon, 8 Dec 2025 15:09:11 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Jerry Shih <jerry.shih@sifive.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] lib/crypto: riscv/chacha: Avoid s0/fp register
Message-ID: <20251208230911.GA1853@quark>
References: <20251202-riscv-chacha_zvkb-fp-v2-1-7bd00098c9dc@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251202-riscv-chacha_zvkb-fp-v2-1-7bd00098c9dc@iscas.ac.cn>
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

On Tue, Dec 02, 2025 at 01:25:07PM +0800, Vivian Wang wrote:
> In chacha_zvkb, avoid using the s0 register, which is the frame pointer,
> by reallocating KEY0 to t5. This makes stack traces available if e.g. a
> crash happens in chacha_zvkb.
> 
> No frame pointer maintenence is otherwise required since this is a leaf
> function.
> 
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
> Changes in v2:
> - Remove frame pointer maintenance, and simply avoid touching s0. Since
>   this is a leaf function, this also allows unwinding to work.
> - Link to v1: https://lore.kernel.org/r/20251130-riscv-chacha_zvkb-fp-v1-1-68ef7a6d477a@iscas.ac.cn
> ---
> 

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-fixes

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
