Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06685606A32E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 20:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zps4HO9U;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F2pk+jG4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pbLesEsPBoEdvRMccC3pWUTw1388oZT+I+8hZc1+9ng=; b=zps4HO9UoMsfJombII+vU2sUJS
	UACz/TP3rsIb/kND4EvfU5a+Rj3p1AHvZPGAiYCe0xo4gb3b5oBP9cqoYSFMXGNH5BvnvMAvvuryC
	IeTKiHGoOxwkJxoJej8V48iw/q9vlTd1bqsLCpXmjt13D6EVeU1YOIppGpBBG3JP4Et6yqVMH6Xu2
	/D1ALvhz6yZzfm8QeQMvzFBIRMx+K/uDDNRmXQ1+KNbWr3A9H2eRxlzGMnO5lf9kl+dqeXv2U8XK7
	D9NgPqigT4ZjHtw/TCaQ5Dx8AEW/Oe6bKg/hWJZ9hSrXn4z2EmoUZhcdnifrO3Ig6RjuIT5X6/z7V
	inVZ2H0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxxB-0000000EQPJ-0EOf;
	Fri, 13 Nov 2026 20:32:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxx8-0000000EQOQ-2Fa2
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 20:32:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A56B062389;
	Fri, 13 Nov 2026 20:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6156C1F000C4;
	Fri, 13 Nov 2026 20:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794601973;
	bh=7kGyvkK08X7x1lT2uCcH0FMHoas2jrbCjIylRbFLUhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F2pk+jG4qUvodejQG38Pf9aLunFm0mGPRbuZwJxDgkyHq7jOf+NJX1i/vtDIatCPf
	 Cw2NBFZtuONe4xwLRjLZQQviA5lPwdhtGZgKNvrguufJykmq95BoxszydeILAPgPWB
	 vNYGqGq/D5E7LWSO7AagLb34uHE8769m3fs97xzHZdS4tb5IGuw3M1rwA86XR+4fYP
	 NwnwwvzQ8Je8HFhReph9Hnq5uE+AvFEGZUEhJZEdJyfr8Qsjv9d1/ZC0SGtQqk5A2f
	 p5qcpnnvksMjDPjc48+mt9oxd18LnMfhIY366tkaJk/nfQW8WEw1Ut6/id++D3wz6D
	 fQqI4bWU6FDPA==
Date: Fri, 13 Nov 2026 20:32:46 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Carlos =?utf-8?B?TMOzcGV6?= <clopez@suse.de>, kvm@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-riscv@lists.infradead.org, seanjc@google.com, pbonzini@redhat.com, 
	akpm@linux-foundation.org, peterx@redhat.com, imbrenda@linux.ibm.com, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v3 0/9] KVM: don't zap secondary MMU on permission upgrade
Message-ID: <avdzWA5nrPLoIztq@gremlin>
References: <20261112142039.907090-2-clopez@suse.de>
 <2ff19317-8da9-4014-be04-27fc218b8eea@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ff19317-8da9-4014-be04-27fc218b8eea@kernel.org>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 08:00:02PM +0100, David Hildenbrand (Arm) wrote:
> On 11/12/26 15:20, Carlos L=F3pez wrote:
> We generally don't add performance improvements without clear motivation =
and
> data to back it up.
>
> MM is currently busy with more important stuff, so best to keep your chan=
ges to
> a bare minimum.

I'm sorry after what I've seen from this series I'm pretty convinced it'd n=
eed a
whole bunch of revisions, and we just don't have time for this kind of thing
this cycle.

This is v3 and I already want to NAK it...

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
