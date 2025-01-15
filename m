Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D66E77188
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 01:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7wX70g7QuKnfC4eY5083qYdRPEbSG7sv/npf3b3U2DI=; b=Me9m+t8weD0BUI
	gBJkTZKgcoRdjBOy6mF7l5QX4xbB9cByUJgoWjT+ius4jUwhDZAxyEYfZWFT5L8aNH0YuEct44BDz
	VjkxVCiA0srhZyCHNI0DNo78WCVnpOM9iak8aAJg/xy7a7wGO/br/sEEE7WUl8+rcOK1fmyt0j26y
	3xsxMZq4NHURMtgUhTfZUFMjpRlB2EIz318Yhd3cDCusTVsVM43O5mUCMXzsP4MMqnlAFWFB1NfxP
	iDjXaZc2QeNwXvP5fJ60GPfNtHR4PQ4pquNDXOlihmaahB9gSOyxKmIiFFswngsLXvH47kfVi3DOx
	LKEvQ3vUQTOBzbL7HiPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXrnh-0000000AG4P-0qDw;
	Wed, 15 Jan 2025 01:02:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqqv-0000000AA8o-3WVv
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 00:01:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3E331A41DF6;
	Tue, 14 Jan 2025 23:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1727C4CEDD;
	Wed, 15 Jan 2025 00:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736899304;
	bh=R5zLWF7CbOxpfboysM0ptUUtByEdQJcyaoamCb44Zic=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AlM6PkkFCtHnMVVMSXFes10U94llQpl5jo1qnvjauWoEc/xd/Gi3pJJ8dpzMyOJkB
	 wTLYlybnW3hO+v9f8sIEOuaoRJoZRdh/cYVePR1YICKJyPGWCXopf8y9Wg0hVvIUhz
	 T7uvmjDQ9KQUkvyzZlJ2Q415HpZpyHJnmojbzHdTS3Hh/zvpUMoD1fIhbAKdQ4L2zd
	 q3qooO+8XJE9gowk3hWuMbzU99ZBXgqgW1ThEWyoHG+mmLa+XRPzi7kSYm7cNzZrD+
	 gj78gZrv2RsUo2wD/AUyFn/6p/hrrPsXf77+qZak86YY9DIlYAMVF7Tr4HUEnxBgin
	 MNvHxfndnkYew==
Date: Tue, 14 Jan 2025 16:01:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Milan Djokic <milandjokic1995@gmail.com>
Subject: Re: [PATCH] riscv: Add initial Xen guest support for RISC-V
In-Reply-To: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com>
Message-ID: <alpine.DEB.2.22.394.2501141554170.2684657@ubuntu-linux-20-04-desktop>
References: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_160145_950378_7E75D816 
X-CRM114-Status: GOOD (  14.88  )
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
Cc: jgross@suse.com, aou@eecs.berkeley.edu, Milan.Djokic@rt-rk.com, rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org, oleksii.kurochko@gmail.com, oleksandr_tyshchenko@epam.com, iommu@lists.linux.dev, sstabellini@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, Slavisa.Petrovic@rt-rk.com, takakura@valinux.co.jp
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

+Oleksii

On Tue, 14 Jan 2025, Milan Djokic wrote:
> From: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
> 
> This patch introduces initial support for running RISC-V as a Xen guest.
> It provides the necessary infrastructure and stubs for Xen-specific
> operations. Key changes include:
> 
> - Modifications to the RISC-V kernel to integrate Xen-specific hypercalls
>   and interfaces, with function implementations stubbed for future work.
> - Introduction of Xen-specific headers for RISC-V, including event
>   handling, hypervisor interaction, and page management. Functions are
>   defined but not yet implemented.
> - Stub implementations for memory management, grant tables, and context
>   switching in the Xen environment, allowing further development and
>   integration.
> 
> Signed-off-by: Milan Djokic <Milan.Djokic@rt-rk.com>
> Signed-off-by: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>

Hi Milan, Slavisa,

Thank you very much for your contribution! Which Xen tree are you using
for development? I am asking because RISC-V support in Xen is still in
the process of being upstreamed, and [1] is the tree that consolidates
all patches currently on the to-be-upstreamed list.  

While the specific Xen tree you are using is not particularly important
at this stage, and using [1] is not a requirement, I am asking because
it is essential to align on the hypervisor ABI, especially regarding any
details that have not yet been upstreamed. Specifically, is there
anything in this patch series that relies on features not yet upstream
in Xen?  

[1] https://gitlab.com/xen-project/people/olkur/xen/-/tree/latest?ref_type=heads

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
