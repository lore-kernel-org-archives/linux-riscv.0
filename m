Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15026E7AD75
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 16:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mcfEVjRIdBYN1hj7THnN01P3ZM4YHc0RdR63sHKBjNU=; b=dbPmT77WvreCAf
	0r7AoJAUAVna/T8jfkq5Me86ib1EHU4aRs853ZZY2eGyzvOQiLljnwsq+bFCQRvWWpANPyjn/tad7
	k86371EELkU+H18dzYvleX6hk1ujaR1uZOkbOwmwJsIxYidIAcpp1XixEihQx+7AZKpsdgGIxsJiA
	VHOnMDtQCAw+JBlF75ZrdX4AXrTaL0pMCD11cm9alreiupr/25YsiTeGvCMG34q5bG8urvbvrfJUL
	amVMmUdhUtChAqpWwXwtkbmU01Adn5osLgdfbcGEN4i7oJeOw9aME45mH391cXjw0m/ehCcaznqGD
	8nxbTiFCM0vAx1iodWOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnhtE-00Evxt-1r;
	Tue, 03 Oct 2023 16:04:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnht9-00Evw3-2Q
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 16:04:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B1C33B81B2E;
	Tue,  3 Oct 2023 16:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C10DC433C7;
	Tue,  3 Oct 2023 16:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1696349085;
	bh=2On/qkTqbm10MdXL23I+Oxp4rttJLwBn1Qp7pFx8jrg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WLngFVkIoiK1RwDZP5NX97Ng0SWyqxQ6JOuNyMaFjIuTJtxK76q509aEHbhix01CI
	 3oUR2B/D+SknZN+HuqkGwrA5Wq65b+7CJSexdJBLwVb1U6nP/zMiz/shH7DOfCMdqh
	 2m+8aavUlOegf+fkrvbEtRaGpBAnTovivQbKivzo=
Date: Tue, 3 Oct 2023 09:04:43 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Andrew Jones <ajones@ventanamicro.com>, Qinglin
 Pan <panqinglin2020@iscas.ac.cn>, Ryan Roberts <ryan.roberts@arm.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH -fixes 0/2] Fix set_huge_pte_at()
Message-Id: <20231003090443.67a2e2692b68211e05b53248@linux-foundation.org>
In-Reply-To: <305b4dec-c99d-3cee-4563-8d7dcbae9384@ghiti.fr>
References: <20230928151846.8229-1-alexghiti@rivosinc.com>
	<305b4dec-c99d-3cee-4563-8d7dcbae9384@ghiti.fr>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_090447_962967_F503ADE9 
X-CRM114-Status: UNSURE (   9.43  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 3 Oct 2023 17:43:10 +0200 Alexandre Ghiti <alex@ghiti.fr> wrote:

> +cc Andrew: Would=A0 you mind taking this patchset in your tree for the =

> next rc? This patchset depends on a previous fix for arm64 that you =

> merged in rc4 which is not in the riscv -fixes branch yet.
> =

> I saw with Palmer and he should ack this shortly.

Well I grabbed them into mm.git's mm-hotfixes-unstable queue.  All
being well I'll move them into mm-hotfixes-stable within a week then
into Linus shortly after.

Unless something changes.  It's odd that the riscv tree(s) aren't set
up to merge fixes against -rc4?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
