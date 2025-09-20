Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4D7CAC5A5
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 23:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IfaNM9dEw93PctprokfAm5W/mu0ny4oq073M13TxFMo=; b=PLTeFbsBrbxwAi
	FzExrCtthblLRW5ux9NA3C3hiyykTriJTMA7hkiM2ZZwedozD4ibdf2ggUy7UM8igENigfvvkWMUN
	Pe5HwdrpoF5XjBHDewflKUubhdKoxkLzw1t7t9E/ru553AByLPOEBdS9q9QPP89soBBydJ0SEA1v4
	3+dqx6ZIvFa2tb8sw6BvK7bNzFlxtZ5LI8YX8i+Nfp6ELrpcNEOM3WTkTQ2SwOs2wlhHP4aQHyR/i
	NyR4oFwn7Wc68DZEjAgAjam/UcLxbUeUgrZRzbOurqLwd1RMFefuoF/DYnc+n+Bd5rtoC4Ri1VQ/F
	23etWJhqg9gRlN1PwZug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v07BT-000000064ib-1RzL;
	Sat, 20 Sep 2025 23:40:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v07BR-000000064iS-24hq
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 23:40:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D17E60144;
	Sat, 20 Sep 2025 23:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB60C4CEEB;
	Sat, 20 Sep 2025 23:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758411599;
	bh=lfvyd0eukorymeOecy6sHOks87edoKZdQD+c2emmFSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SaukMz9Xoi0diaJjnjmHRiVBc537RfPRUW1pOODJmnUlIWzwGyFP6vFppIwF64T6y
	 a6zADKvBaY7vgMAJij3nZsG/usijLhtUmfBkXrvD3vqd/cQb9Fc6SINpMiS/nL8BXv
	 y7/Jdvevo4K7x9xJdlkZk7afWGfG09vyzxtuLPOz/zAQKLjb0Mdp9GyN0t606pLVxL
	 jw+wgWXeyMg3E1cbl2FPGlt2WtgticSI1O2EthcydwnGJSlt0ZxcZ8I6Xa91cRwbWy
	 +TbfbVOXiSBghYckrvx5De/EI5iL6hcNe6yPfMbTDjZCUa+CBT9IPUxpJ1e0RIldxv
	 u44ifDIGb8usg==
Date: Sat, 20 Sep 2025 16:39:53 -0700
From: Drew Fustini <fustini@kernel.org>
To: Han Gao <rabenda.cn@gmail.com>
Cc: devicetree@vger.kernel.org, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: dts: thead: add zfh for th1520
Message-ID: <aM87ScdxI-D2O6sP@gen8>
References: <cover.1758228055.git.rabenda.cn@gmail.com>
 <38abc793c2fcb9dd26c89bab10dd4450d91ced4c.1758228055.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <38abc793c2fcb9dd26c89bab10dd4450d91ced4c.1758228055.git.rabenda.cn@gmail.com>
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

On Fri, Sep 19, 2025 at 04:44:49AM +0800, Han Gao wrote:
> th1520 support Zfh ISA extension.
> It supports the same RISC-V extensions as SG2042.
> 
> commit cb074bed1186 ("riscv: dts: sophgo: add zfh for sg2042")
> 
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>

Reviewed-by: Drew Fustini <fustini@kernel.org>     

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
