Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE666606A320
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2026 17:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3KzXmtOH;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=A1oEpCFf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sd6G92he5rAcV97VmGjXJ+12AyuUrDCTN7frBzyJxGw=; b=3KzXmtOHIB+/Ba
	L5uFe2wDqRr92PjIXQUbefl/5lMzz4nKjEE4QvvW0ljsGE9DFDHes4OVUs/cw7E1SiavEcscCNmq+
	bhKZ84qVI9babg5xlChayle5EyU8ynQTYm8/NZ5Tt0qrcRVlZxjvIdj5tRvOe/yf+cSinosNaVdyz
	nltDGZv84uYDAB3xkSnlSxqKP7M6CqJyZHDHdCR7FABIOtfwFbGl8C5s3Syi7/RpgjBO4GoPhzDjx
	vAHirAyx9vXKsPITO38lrpQkihMVJIHLZbZwu9RYUZjtIqSJVRijUk9PbgNexhxBbjdKkfuTZgHOR
	pE7DSltdVmNVBvrve6ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIqyD-000000084J1-2n8Q;
	Mon, 19 Oct 2026 17:16:21 +0000
Received: from out-215.mta0.migadu.com ([2001:41d0:1004:224b::d7] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIqyA-000000084Hz-1suQ
	for linux-riscv@lists.infradead.org;
	Mon, 19 Oct 2026 17:16:20 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Ht0YeVNr87GBjD/XD3J4ka9N9ZFBQ94E02FEAUKrXMQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792430171; v=1; x=1793034971;
 b=A1oEpCFfgn7hY8SlFJYdcXt93AMGLNPWFV8GWG+ZlKxM7ik9DPXqhPKqZVZcHyy62OPoWRJS
 3Bzu7/+WNZSXmcOG1e0/5m+jZ6/1/FbsFujaduXfb0RTbYmXaDsBDmoMRLMuiWJ7va3EPg8IDdx
 3kbwcTeZC2SYBAaqOkRofq4k=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6fce2d4bfa616019;
	Mon, 19 Oct 2026 17:16:10 +0000
X-Mizu-Trace-ID: 6fce2d4bfa616019
X-Migadu-Flow: FLOW_OUT
Date: Mon, 19 Oct 2026 19:16:06 +0200
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: KVM: Convert IMSIC vsfile_lock to a raw
 spinlock
Message-ID: <atZPqGKEip_sW3fr@orel>
References: <20261019134709.2610129-1-andrew.jones@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261019134709.2610129-1-andrew.jones@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_101618_634594_8A68E4B0 
X-CRM114-Status: GOOD (  10.73  )
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 03:47:09PM +0200, Andrew Jones wrote:
> kvm_riscv_vcpu_aia_imsic_put() runs from the scheduler preemption
> notifier with the raw runqueue lock held, so it must not take
> vsfile_lock, an rwlock_t, which sleeps on PREEMPT_RT. All vsfile_lock
> critical sections are short, so a raw spinlock is fine.
> 
> Fixes: 4cec89db80ba ("RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC virtualization")
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
> v2:
>  - Convert vsfile_lock to raw_spinlock_t instead of adding a separate
>    hgei_lock [Anup]

Hi Anup,

Sashiko found an ABBA deadlock with this v2[1]. Making vsfile_lock
exclusive serializes kvm_riscv_vcpu_aia_imsic_put(), which runs under
rq->__lock, against the SW-file inject paths, which kick the vCPU
(pi_lock/rq->__lock) while holding vsfile_lock. Lockdep confirms it with
an EMUL mode guest, and the host then hangs (I should have tested with
EMUL before...). v1 doesn't have the problem, since its hgei_lock never
has anything that wakes tasks nested under it. I tested v1 in both EMUL
mode and hwaccel mode [again] with lockdep and it's good.

Should we take v1 instead?

[1] https://sashiko.dev/#/patchset/20261019134709.2610129-1-andrew.jones@linux.dev?part=1

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
