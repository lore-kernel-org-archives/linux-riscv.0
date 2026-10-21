Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14681606A31A
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 11:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wr2rCBP6;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=peV2frh8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zv1Y4e1jGjrVZfkirUL7wsSHDB1rVpoMvujPNRNpZAE=; b=wr2rCBP6rIjwSj
	c/u9o+uERqjBKxH6FulxDUEpK9IhaadFuDq5TlTEZU1Yxj7qCt/b9RvVRlzPvvcwZdX71A5BrMBby
	BJck4qZcONl2Dqm1tWlHiKEkQaRszgz5shiucEZCSXohvVV9ZAKywyfH5KVLZhPq0jkxb02wNNyAP
	o+VUs78HJgX+1Kq6G6gRJeTdLojANLHwN3ujV+dCJS1oMjx7Dx61C/bmAOt3awwQefYTyeXESfiOl
	MHVM4i977s5gfBxJxwwYr0IDkuZTUGyivhN6aw+163zumK1tZ5F68mY0A4o0nIgNeb0HGIMmElIOu
	WBpXYQpy91QMI5lJXi/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUWo-0000000BiuR-2rZA;
	Wed, 21 Oct 2026 11:30:42 +0000
Received: from out-37.mta0.migadu.com ([2001:41d0:1004:224b::25] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJUWm-0000000Bita-0F7W
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 11:30:41 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ajoLYE5AD2heyAC44s3QWW8/SJdTozUgA/AhWcBRkvo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792582235; v=1; x=1793187035;
 b=peV2frh87rolLVSFnvECmmtCIKSTBix8AHi94IGRwH2+Zplz/8TmlcfbFbtgWK++PPc/FcIX
 LF4vX1JfVq8eQAPn3Km9B4spHNUfS/5G43hyqiZ3M2xqyrStXmaDXJ780crtyJQOZLG9IS6I3x8
 kHbmK8qsFXefL7HyACclAzCE=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 591aea82344d2dfa;
	Wed, 21 Oct 2026 11:30:20 +0000
X-Mizu-Trace-ID: 591aea82344d2dfa
X-Migadu-Flow: FLOW_OUT
From: Jinyu Tang <jinyu.tang@linux.dev>
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: Jinyu Tang <jinyu.tang@linux.dev>,
	anup@brainfault.org,
	atish.patra@linux.dev,
	tjytimi@163.com,
	inochiama@gmail.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@linux.dev,
	pbonzini@redhat.com,
	seanjc@google.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: riscv: Set Accessed bit in dirty-log write fault fast path
Date: Wed, 21 Oct 2026 19:30:10 +0800
Message-ID: <20261021113010.2476783-1-jinyu.tang@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016101458.221648-1-suunj1331@gmail.com>
References: <20261016101458.221648-1-suunj1331@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_043040_238484_61C87D84 
X-CRM114-Status: UNSURE (   7.14  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 16, 2026 at 07:14:58PM +0900, SeungJu Cheon wrote:
> @@ -591,14 +591,15 @@ static bool kvm_riscv_mmu_dirty_log_write_fault_fast(struct kvm *kvm,
>  			dirty_marked = true;
>  		}
>  
> -		if ((pte_val(old_pte) & (_PAGE_WRITE | _PAGE_DIRTY)) ==
> -		    (_PAGE_WRITE | _PAGE_DIRTY)) {
> +		if ((pte_val(old_pte) &
> +		     (_PAGE_WRITE | _PAGE_DIRTY | _PAGE_ACCESSED)) ==
> +		    (_PAGE_WRITE | _PAGE_DIRTY | _PAGE_ACCESSED)) {
>  			new_pte = old_pte;
>  			ret = true;
>  			break;
>  		}
>  
> -		new_pte = pte_mkdirty(pte_mkwrite_novma(old_pte));
> +		new_pte = pte_mkyoung(pte_mkdirty(pte_mkwrite_novma(old_pte)));

I tested this on QEMU 10.2.1 with Svade enabled and Svadu disabled.
With dirty logging enabled, the test clears A through page-idle tracking,
write-protects the page with KVM_GET_DIRTY_LOG, and resumes the guest
write. The unpatched kernel times out after 10 seconds, while the same
test completes with this patch applied.

Reviewed-by: Jinyu Tang <jinyu.tang@linux.dev>

Thanks,
Jinyu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
