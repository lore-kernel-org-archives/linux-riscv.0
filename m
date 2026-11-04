Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313D0606A31B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 03:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oUmpq76C;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Aj9KGie0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DxYfYcitRiimKfVQNNj+hGu5tDbveQiUsLr6irkV0H8=; b=oUmpq76Cp44o9RtLimh01/hcf1
	NMuz6CahVv0qRqy6ACKJYi5aDnCee+KHVfz+BjklCaN6yG6hTzes1zo1kz8Q52YmKt4ywUdzjSXuE
	fWhRNwMMs2aKmBw2zSy98t2c53uUPzqKbOet+vuIdpQU1MDZL1zA65nz1ywBhwuhJ/nRb3fnQjNFh
	zKWMhinqZC7Vb4SBe/tiWiFsBfBk2o81NbvY2PZ+JBl+i2D6vrNikDG/A18vq4SIJASlqVakyJdPY
	ePrx+SV4QnvpZ/4iJJ3CxlmHruH2t65hRcRh2RnEARVLrJK7bi7xsnJAIRN8XG6h93vJ2gdfJxjv3
	i2pXqXsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xORxh-00000004Gxn-0ULG;
	Wed, 04 Nov 2026 03:46:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xORxf-00000004Gxh-2YHt
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 03:46:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B606E601F6;
	Wed,  4 Nov 2026 03:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860E31F000C1;
	Wed,  4 Nov 2026 03:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793764014;
	bh=mOCeIGS1yHsYqooTSYjDH+MG9srGEf4Mjuse3gk9+84=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Aj9KGie0D+3rQdG1nvacy3HP3xO08I3IhemL5+Wo2jsI7mTdC2ycCtmkvxIKK0xpN
	 UqPG4SACR1cWiUVFXQUT1Yk2XB0/svaH88KxZGAICH05gHh8PAV1nCt63Vgz/puw19
	 T9uA101nVB6owIekcgBJCeeNBMKJx07zsOn+3L8uRyTkKicYLqitdmVb55eGGeg7WI
	 iVNpYJxjIIrVgWnMlMOdGMVEIlMzAWZrFFaQYYnFUu/+18/FDVEivlg6jY2Ken6zlf
	 YjHwY2goKRYR1U3skchAUyd35cZ8ie8XfgKcXgf7VjuOieFvzR6684NE9tL9kP9mJ8
	 zpyoxW7RQvPrg==
Date: Tue, 3 Nov 2026 20:46:49 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Andy Chiu <tchiu@tenstorrent.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Oleg Nesterov <oleg@redhat.com>, linux-riscv@lists.infradead.org, 
    andybnac@gmail.com, Sergey Matyukevich <geomatsi@gmail.com>, 
    gdb@sourceware.org, dfustini@oss.tenstorrent.com, greentime.hu@sifive.com, 
    Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
    daichengrong <daichengrong@iscas.ac.cn>, Deepak Gupta <debug@rivosinc.com>
Subject: Re: [PATCH v6 6/8] riscv: vector: adjust ptrace and signal behavior
 for INITIAL state
In-Reply-To: <20260918215154.2481482-7-tchiu@tenstorrent.com>
Message-ID: <d459a3ff-7834-7a8d-92d3-339572ee4012@kernel.org>
References: <20260918215154.2481482-1-tchiu@tenstorrent.com> <20260918215154.2481482-7-tchiu@tenstorrent.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andy,

On Fri, 18 Sep 2026, Andy Chiu wrote:

> The last patch introduced the INITIAL vector state to avoid saving and
> restoring vector registers across syscall boundaries. However, this
> optimization did not fully account for the ptrace and signal handling
> interfaces.
> 
> As a result, two issues emerged:
> 1. Ptrace reads at syscall stop could observe stale, non-nulled
>    registers.
> 2. Modifications to the ucontext through signal interface during a
>    syscall stop would be overwritten by the vector discaring macro.

If patch 5 introduces bugs that then need to be fixed by this patch 6, 
then either the two patches should be combined, or patch 5 needs to be 
rewritten so that it doesn't introduce bugs.  That way, bisectability is 
preserved without introducing unexpected regressions.  Care to take a look 
and figure out what the best approach is in this case?


thanks,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
