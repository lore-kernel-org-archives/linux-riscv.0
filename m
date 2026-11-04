Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E53C60A6F78
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 20:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kdqZqg2F;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OGnhoUJZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=w2zr8KXzH2VeLDL9uAduexEpNQPkBH/XP3GCISH7e+w=; b=kdqZqg2FGO8Y7/jZ5ez3C2NODx
	OJvLS22hzsaN5aQMlw61yKno2D2qs0notualVgmDeqGHFFws8VnV7w4qrI9t1r/klDxX9dE9ursq3
	tH0uOTUAidxrYe5pEPoZDD1tr8tCAPiRETw5h4KwojNeOB+mCe3jCBQRDuPqqWmf36gVLTFUARBlu
	1qErp/TeATG4NuEaAW0UiINSXjZfRpHiBOUg/bOBntwKKaVht3iu4HMA+RsXIdSKcvljwMdEQ1TiS
	jXd+7dLjG1TPMFfhPjGGA5x/PoJtWACHPsu4tbfiPWc0EQzefqLt6zAcqVrJI/VbQYVNB+aCzYUiu
	E12+RqaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOi2Z-00000006xhO-1sy0;
	Wed, 04 Nov 2026 20:57:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOi2Y-00000006xgl-1jMi
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 20:57:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8927F60DA7;
	Wed,  4 Nov 2026 20:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4DDD1F000C1;
	Wed,  4 Nov 2026 20:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793825821;
	bh=6t79USymFAtqPRfgPfIK8J3kv1s3TiynLmIh2V+i210=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=OGnhoUJZKRG13vcRb7Kp60zCchju3MYAG7SykZ7dlpnfpSCoHWqoFCxXLCj3qfoVn
	 BsW4XPmh5M342b0QqvguIgcSLVRkPetVJzUi6yLZUsBuv+3nhCKBOe6LRL2S3BZbJF
	 8Uyt/GFQEHZ+aCGZZcv0IMitL+5xnr5ViFQi7wSo+7JdqqhaCBZ5q3SCga6l2guQSZ
	 KjAiQtNWczXvNir0gEbBERbdAHgTlYRt7xbpqu6zWVa81PHiqt+xzxynw7rndolaRb
	 eSeK6DoPb/kdvt73nuP4BJB67kmWjDA0kxwJG7o3PgBmhcgh3ix9z0amrlZdPV3Sv7
	 74CcJAax8w9XA==
Date: Wed, 4 Nov 2026 13:56:59 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <clement.leger@linux.dev>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] riscv: kgdb: Fix potential missing local_irq_restore()
 call
In-Reply-To: <20261102145812.36939-1-clement.leger@linux.dev>
Message-ID: <b7441b08-3c95-5a2f-bac2-e9b0cd5e2f7e@kernel.org>
References: <20261102145812.36939-1-clement.leger@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1524687159-1793825821=:104658"
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1524687159-1793825821=:104658
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Mon, 2 Nov 2026, Clément Léger wrote:

> If kgdb_handle_exception() returns an error, local irqs are not
> reenabled. Fix this by factoring out the kgdb exception handling to a
> function and call it between local_irq_save()/local_irq_restore() so
> that the error handling flow is simple.
> 
> Signed-off-by: Clément Léger <clement.leger@linux.dev>

Thanks, queued for v7.4-rc.


- Paul
--8323329-1524687159-1793825821=:104658
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1524687159-1793825821=:104658--

