Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D530D606A681
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 07:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c1nAsCyS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VF1k79s2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PVebmXdBbAOHvKnTcHnG1BpblLYI/el/wJBlvTQ5Z/w=; b=c1nAsCyS9S5IDsdlDWmtQEope/
	UWZQdED3nGtuq53HLfGCHCi5Cj5CUtAeRwZjvvfz5kOi+HQK+tuNDf67QLEfTV3znjKcprbhMZRa6
	cJQQEndsc+1WM9r1LW3GBAEoeebRg/c70QMu+VY6l2QjgR2CtWbiZAKjedRadIJ5kjTLHERgkjkNV
	8xXxV4LNaK30yls8hHkwSExdLO5aL3/YMuOO+Bv19ku1OPaDdbnGW9cx0SzA4g46UvOx7q176ddqj
	mure9a/UyiWp27HDIKjGhlh1k6PjYYlRxj6un2fy0dka2EcWKZxhDjSidF/NVZsbB3q/bqigmt+l2
	YOSyv8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW74F-00000008mU7-1kjX;
	Wed, 25 Nov 2026 07:05:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW74C-00000008mTP-3Qy9;
	Wed, 25 Nov 2026 07:05:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 304B643DBE;
	Wed, 25 Nov 2026 07:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 219D11F000D4;
	Wed, 25 Nov 2026 07:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795590319;
	bh=MgT1YyHFc5vAkk1nIM2L3NOs9FPcWgxQDn2k/WL0F3g=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=VF1k79s2oMcJZqu3w4TXb/uZpIRltc5cnLADLHBenWr+OnopFLWbdN+8kjXweuQYz
	 DWBKkg5nRx45BboGpgdEObUcidSHfiZ8sz1EJ1LSzy0jVCufvuOCcAJJ7n7IYVD1av
	 +5Xr4jvCS8Bpq/raHsQXmjWQS6H66iGwYAulPoW+St3+8ny5XmHLeduziLVwu3itlK
	 ZO8qGWXG5/T08anrWxZjnSyhfzu4u/fK8YD7N6CYgTarzd9BdnnXHBPjVvpLKHuymL
	 y+Pne5ooVBEPIMOJSPWD46aAjgNJixJInOu6cVb6VwAqAbPKZsIYwMY9T3mldFKIRv
	 97W/1WHzA6kOw==
Content-Type: multipart/mixed; boundary="===============7632220386014004542=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <88fec51b898796fa41775d55085d7fa38e2214a80c86b14e0fb90088e192ef83@mail.kernel.org>
In-Reply-To: <20261125061523.1540234-3-irogers@google.com>
References: <20261125061523.1540234-3-irogers@google.com>
Subject: Re: [RFC PATCH v2 02/30] unwind: Add KUnit tests for Minimal DWARF CFI interpreter
From: bot+bpf-ci@kernel.org
To: irogers@google.com,linux-kernel@vger.kernel.org,linux-trace-kernel@vger.kernel.org,linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org,rostedt@goodmis.org,peterz@infradead.org,mingo@redhat.com,tglx@kernel.org,bp@alien8.de,dave.hansen@linux.intel.com,x86@kernel.org,catalin.marinas@arm.com,will@kernel.org,mark.rutland@arm.com,linux-arm-kernel@lists.infradead.org,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr,linux-riscv@lists.infradead.org,acme@kernel.org,namhyung@kernel.org,linux-perf-users@vger.kernel.org,mhiramat@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,bpf@vger.kernel.org,nathan@kernel.org,llvm@lists.linux.dev,nsc@kernel.org,linux-kbuild@vger.kernel.org,ojeda@kernel.org,rust-for-linux@vger.kernel.org,ardb@kernel.org,linux-efi@vger.kernel.org,maz@kernel.org,oupton@kernel.org,kvmarm@lists.linux.dev,shuah@kernel.org,linux-kselftest@vger.kernel.org,indu.bhagat@oracle.com,jremus@linux.ibm.com,wnliu@google.com,dylanbhatch@google.com,irogers@google.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yongho
 ng.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Wed, 25 Nov 2026 07:05:15 +0000 (UTC)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7632220386014004542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> unwind: Add KUnit tests for Minimal DWARF CFI interpreter

TL;DR: Nit only, in the KUnit tests: the same blob-derived arguments are
repeated in about 26 dwarf_cfi_eval_fde_kmem() calls; a small eval_blob()
helper could make them easier to scan.

> diff --git a/kernel/unwind/dwarf_cfi_kunit.c b/kernel/unwind/dwarf_cfi_kunit.c
> new file mode 100644
> --- /dev/null
> +++ b/kernel/unwind/dwarf_cfi_kunit.c

[ ... ]

> +static void test_cfi_drap_realigned_frame(struct kunit *test)
> +{

[ ... ]

> +	build_test_eh_blob(&blob, "zR", 0x04, 0x2800, 0x40, insns, sizeof(insns));
> +
> +	/* Transient prologue at 0x2806: DWARF_CFI_BASE_REG (r10) */
> +	KUNIT_ASSERT_EQ(test, 0,
> +			dwarf_cfi_eval_fde_kmem(blob.buf + blob.fde_off, blob.buf,
> +						blob.buf + blob.total_len, 0x2806,
> +						&test_x86_64_arch, &row));

this isn't a bug, but would a small helper such as eval_blob(&blob, pc,
arch, &row) make these tests easier to scan?

The same three blob-derived arguments (blob.buf + blob.fde_off, blob.buf,
blob.buf + blob.total_len) are spelled out in every
dwarf_cfi_eval_fde_kmem() call, across test_cfi_drap_realigned_frame(),
test_cfi_sigreturn_frame() and test_cfi_arm64_pac_and_riscv_leaf(), and
about 26 times in the file.  Only the PC and the arch descriptor vary
between the calls.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/45561209846
--===============7632220386014004542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7632220386014004542==--

