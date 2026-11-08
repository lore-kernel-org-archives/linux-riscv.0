Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EBE606A330
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N4+TnKzh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NjXUB23F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RV4uCaiFEhbWD52DKRccjZXXzcblmFcD5eh4lpXkk9c=; b=N4+TnKzhI+95JKo8fQQC48irhu
	mokhrKul37yNOlxcncs4Mbyofi4+LR0RuNgM6iePhU2oM91TbPuwHUizVYu8fFO/mi8DaNHulNAGi
	ssz2NMuoZ86pPz4pgBH6Ap07irwrF+IGdZK2nMzRxhasVpVTOFQJ8ELoOxvFwv4DoNBKUXwwFdX3v
	bT47/rvMxniO2DNPvP+Wn4N0vlMRqj060Jmrfgk/wZ+bqaC6ekTQD0E2mXQMdsfwspgiNVfu5iu75
	cXt8Ie2v8QnwH/CooFP5OHiTDakEc3G3Agrj0wnyc6R+dAxB4nE+FsNNkKeeOVynED2sXdpRqY8ef
	N3zgh1Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0tR-0000000G2RN-0nbw;
	Sun, 08 Nov 2026 11:17:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0tQ-0000000G2Qq-0DxF;
	Sun, 08 Nov 2026 11:17:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 70A56407F1;
	Sun,  8 Nov 2026 11:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 141BB1F008A6;
	Sun,  8 Nov 2026 11:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794136619;
	bh=18sr8SyzOZMx8xWY4iklgq0foK8c2ImoU5MT3WMNKwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NjXUB23FMioSLJAxJrR1OG2vEEyBmNcETTcQBhxP86pvaRAPQDlQDACTFYDEOBfsJ
	 11lBYuNqO0IOkffu33mynJ/20vIUM0KoS156ybm1OCXxUIyBygpaUshG9fObmvaWE/
	 wyJNv1Mps2MREvOQ1QmOLIux7m+ArsojvdXmRKJnNdYHlw4K//V+Fj5lxboeHhvgjM
	 zS9SVK7FyN5UhOatl2m4+UXL/SB+vlhzFwy8x0/0rceaAje+z3fjL0pdGYWIFRBpZC
	 jGDyUr1gkDM0g7LYgkHi0GhRNUg5vboazwgz7BnATIjKfYdop0i/A8Y8SrTd9wtAqf
	 JO8PYjAJ+8QUg==
Date: Sun, 8 Nov 2026 13:16:51 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr,
	pasha.tatashin@soleen.com, pratyush@kernel.org, graf@amazon.com,
	shuah@kernel.org, guoren@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH v3 4/4] selftests: liveupdate: Add riscv support
Message-ID: <avBaI9bFdoOnZzGp@kernel.org>
References: <20261106071459.2003-1-cp0613@linux.alibaba.com>
 <20261106071459.2003-5-cp0613@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261106071459.2003-5-cp0613@linux.alibaba.com>
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 03:14:59PM +0800, Chen Pei wrote:
> Teach the live update vmtest runners about riscv64, so the LUO tests can
> be run on this architecture.
> 
> LIVEUPDATE depends only on KEXEC_HANDOVER, enabled for riscv64 by the
> previous commit, so nothing in the tests stood in the way.
> 
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

>  tools/testing/selftests/liveupdate/config.riscv64 | 3 +++
>  tools/testing/selftests/liveupdate/run-vmtests.sh | 2 +-
>  tools/testing/selftests/liveupdate/vmtest.sh      | 8 +++++++-
>  3 files changed, 11 insertions(+), 2 deletions(-)
>  create mode 100644 tools/testing/selftests/liveupdate/config.riscv64

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
