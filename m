Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C379606A335
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 21:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=izFywXPK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EfCt/jkE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RPgRIED8x5lw1kgUpIF6dKvJQMgD7IQvR9ZizcVxUqI=; b=izFywXPKEOkes0Gc+9ZV6fupUl
	yPaVBsLbCg10vj0FMsn1AcqcmMJs6gLm3T65q1wVQhGqMTVc/TgLVVW7OV9lH+ZmD3QPN377pv9oa
	rKlmDvPE0FEA+YXj4ZCNpjizgrxgpeuQCZPs67FmIpOhoOLV28gR+vT9qC/I8sLYJ8s/Us0dznbsA
	Ywx6GxS04cfoy37tQ32L+oCraqOjKVnTenMYSMOUgulHLfWP1OdJ3xSY/qEdPp7pAV841decGtZPU
	z2C+Mu1J4yOWeR70RxmRUyQcK48na7Iwp5MwKrzRTQlDIh/XZ0jSnbQ4nF1/QoL1k7Zd7kxBAxuHe
	ONFOxWkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyND-0000000EVTL-3WVq;
	Fri, 13 Nov 2026 20:59:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyNB-0000000EVT5-0G7o
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 20:59:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9465A448B2;
	Fri, 13 Nov 2026 20:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F951F000C5;
	Fri, 13 Nov 2026 20:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794603588;
	bh=gVxBLZX6lQzckB6AIbX2pQJru5dIfjw9YVDcZIdu890=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EfCt/jkEInFzOANdOTJJt6IXsNytJX76wHVHRjNrF88Xjw3qp6MqJvxVq0PDoGQid
	 HqvdYMbEdN2obhqGDYDFJojlub4fnNPZJ9U6j8sGvuMtgJAcJYJFKs2Qz44cw4RLcI
	 o3RbslRdMuWZOtId3qgp6zZyQESV4Se91+5ZGEBshlKorXhB8sG6T+/l44w7rZME58
	 0e/97s29kipqBUVU+icJTEC19aN6eGp44UBq0S/kxYuXWjwxzXQZldSIhlPYj5G+y0
	 oV0hi0WdohvhJftm39HJNM/uH2AUVFNv4JQ/P5qHhRkj/03UVRKTtC7bn/zMsPkp2q
	 MRBAcCm7m0NGg==
Date: Fri, 13 Nov 2026 20:59:41 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Carlos =?utf-8?B?TMOzcGV6?= <clopez@suse.de>
Cc: kvm@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org, seanjc@google.com, 
	pbonzini@redhat.com, akpm@linux-foundation.org, david@kernel.org, peterx@redhat.com, 
	imbrenda@linux.ibm.com, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v3 0/9] KVM: don't zap secondary MMU on permission upgrade
Message-ID: <avd4MOhiTCw0I_e1@gremlin>
References: <20261112142039.907090-2-clopez@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261112142039.907090-2-clopez@suse.de>
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

Sorry but as I said to David I really question what you're doing with this
series on the mm side, and I wonder whether we should even consider it for
this cycle, frankly, given [0].

And, myself being the fool who is engaged in the Sisyphean task of
converting VMA flags everywhere, you can imagine my delight when I saw that
you (seemingly quite knowingly!) chose to abuse that API, writing code that
I'll personally have to rewrite later.

Don't do that please :)

Please also do not keep respinning based on sashiko feedback. FIRST get a
clear understanding of what maintainers want.

Sashiko is a bug finder, not a reviewer.

And see [1]:

"Wait for a minimum of one week before resubmitting or pinging reviewers -
possibly longer during busy times like merge windows."

Please only respin once a week at the minimum.

--
Cheers, Lorenzo

[0]: https://lore.kernel.org/linux-mm/a2f584f6-e382-4876-aa6d-d5a34de6ee59@kernel.org/
[1]:https://docs.kernel.org/process/submitting-patches.html#don-t-get-discouraged-or-impatient

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
