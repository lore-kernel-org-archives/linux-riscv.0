Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B8B606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 04:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ioNYM+/A;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=J7AAqDSe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zFjkow3pfAxkL7GSswYz7dcWLYvlQtofY/zhRvnKqCQ=; b=ioNYM+/A/kWBt85A6/VpdQE0pH
	qG1S5BZOzyGwvu7dn5DgfWNRKtTq8Ri3hZO5fxivWfolx7eT1MOlia0+ssLAuvVwfRPMct4sesh32
	BDfaLAHa/UmC2SEgKPQklY5UhOhMuV3szJCh6pO62eV/pNeTHl3VmFwG7UM5sqC8DqYSuKrW/lrny
	4ZYOF2CBJDr9Mi9vNmC83WsZvVpBhglCKHthhQ0X3dH/G13aBQn58svKTIfSe+PXSGKeFSrp5fzPB
	+hi10iJVlzUHTqeCaCsFqKJY1i4NYjlbePBSuuo8RmmUVMDMoKm9qSKUjVOHe7iYFJe9wTbz+9mYu
	TorvOsxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRTt-0000000C5jP-30By;
	Thu, 26 Nov 2026 04:53:13 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRTq-0000000C5iQ-39yd
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 04:53:12 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-55c7445cf85so1381041cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 20:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795668788; cv=none;
        d=google.com; s=arc-20260327;
        b=qIVjOQxWCb0HO4yY4ZvYKAbLbeKRDzPIfG4BTzAl6aD4ajjLREpjUE5qXE6HV7nqge
         4AtOilE0BUN8bkC6zvm4/WyFeV7FiXeV/pqpSocHQYbRJTomqBTX32hTtnqkNWeS9FWO
         xwl2C4VwZOQ5LM9zX3uG9/aztf6HZWR/h3A+GZkAblvHmFmWbK4H8kL9ZdPpMO9Nskuz
         UtD5G/gWVMgB630RXkKzHd1B3SpmLTCRsU4dNeti45HQ25REbPwQcSI3HDBHYAAB7d4U
         7dtWVs4DWahzTQVEUYmfeLXS+W1hL9X2qUkkLhYGQh48WcKC/r/EXTnUgmh/sSCtUVrD
         iPLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
        fh=CZmdHAok4c7zekjU4URcEvbg39O7gO0r4y2+d6OV8H0=;
        b=NwIVLtYNjlCFB9hL24ycNgFBCIq8FnhvMjAL18uPKKHQz2eIgv+wKSp1BQPzTFr5fk
         5+05GhsU1RVitP74NfupFcSrEzTm8hF6eEqIHK7nSLqLe/UaFEfL7Nj80Y6b27AWfWA9
         V7jXjFKUep5h4F7QdBSGeBcGmJ0yHc+dnBk9R9jPAgnxdjuG8QP7embox2vAh7mKn4by
         DHOtU5SvU6DDLr/yGVuzhvEmYz7Jm9vu+MXmF//BGMnvubJyMZM19Mb8fPkBy+PLjT6O
         O6EI/EiZmsbLZ5sivuXhnTsGUTxfLG4F3qK+Ez/w1SFxO23/qFpMFf32ZIhXhzcN00/9
         La4A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795668788; x=1796273588; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
        b=J7AAqDSeiFVjciwwmzJ6RWnxqsbMRXSYpEC95wyLWDBA1FDvWHJnoL58MQv2OgfcFn
         4AnTXcxeypIfw2kwYc4Cqo7GZIi9tJx5YUy3py4sGN3I+5ZIJdPwpRZsKaK6TQ7qc8g7
         mYX17fG3TSGUSwvavxoUTLFYH7FXp05j+OPObZ++xB8XrJcuae75QGYR7gCrljmymccn
         V7qkfSkA2IS6g4HMh1C5d7OyaqD9+dmV+ZDDS3yXXDwsXGWqNm6ILih+TVcpxdTi8xkt
         J6zoSNGrHl7MwBbLazMDt6K4zAlFTSXeIARtFZgTu91okWpK8PTnhVISPZR1bkYqd6q5
         SOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795668788; x=1796273588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
        b=hcYCe5w+0K5tdhQ6+tArtHxjo747Wvygl7hfgZLDh25uT5fIKt1l+qgjE87oOg2I7T
         0a71tedm8QrWfo/sXgiySD5mpQkf/dPkzFJRyyOpLNzOcUiFvzf5maOzhPPZnfBX1p+l
         ujzFFSR4DBHfd0KUfvjVJrxv1cQcI5u1w6NfPWhuBraXfj/XK1RpuFxZ6PedS4R/CQgz
         Ancp+gRYtQBTL7rRps9Kl20DERDqNtroT7cCBiNgk6z62D4pDtNTn9zLlwP5o+1FbwQv
         RXtvRucqzc3rdFvtbuLlHCxo6KqoLbOOouRflOjzRtVznQEEuW6npgrx/8d/wzAq3FHc
         aSCA==
X-Forwarded-Encrypted: i=1; AL+hErHjjvbGU4ev5iIMlGXyMsOdLMlWYTJZ2yC8jKwcLraKMSc7Yugu2C3Qv4lPjq2bRWX139OOScNsvkRuSQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8khH7BfYZCoq5rXBlwUOWvwQpuEmhjjIlJZyVM+dDCsuNQVqEK
	y3ysvBIkWa0M4ctEuo2ksPP1HwwYUZybUA3ix4wFU7D1LukvGzuP+Y7sNpw4D3P0g5DiXPP7u3Q
	UB+gOxHr6Z/FtvbHczFOmolvxfqM7QniTjkkPq9Id
X-Gm-Gg: AZFdTZeMix3DWa1R4WXRv8qdWByS2J5yxlLrrmUEr0XLV/he4XE6jX4wQEl5bOJBVSB
	vdLpPmp5C9DetHF+vLborWA3f4X3lZkj1PvlNFwRR7i/O92ZzITTZFxYeMpN3XJ9g+3BDbkx9Tt
	/uMe0kBZ6vLDg5f11+y6OqFzR5bJTIRvvSHTi3EGuXS2NodZWR37FmhonBWrWlz8lYSKNNCfw4P
	EAeIP1QxPP1rL3PqwmG9ksUvyt2gBAZzfcfF5z33K9w4BX4hOpoNPNq76XPM3nazvYUfN+BWBxt
	D7xC7Ngp40Ws/+/vVyiP89AHCQ8MimOwFbdSO9fgvuTYwdDco0Hu0Y3qkcyQaVUFO/kyx74FtKi
	C9oghD8OQrg1dYFqvCN7oGgvsTAX4wy0IT9jumEm77YkYCkHH3pGCFzkd1g==
X-Received: by 2002:a05:622a:1e86:b0:536:3ee4:81cd with SMTP id
 d75a77b69052e-55d88127bafmr101738501cf.4.1795668787640; Wed, 25 Nov 2026
 20:53:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com> <DN4FM3TBOJ9T.2QOOL77P5HETO@garyguo.net>
 <20261125132225.00254c37@gandalf.local.home>
In-Reply-To: <20261125132225.00254c37@gandalf.local.home>
From: Ian Rogers <irogers@google.com>
Date: Wed, 25 Nov 2026 20:52:56 -0800
X-Gm-Features: Aa3M54pMQmXw5Cgtc0EakW9NOiIZs8STgUuBigJfJMSZlzejGTE6XZMetCnzc-8
Message-ID: <CAP-5=fWkUW787c4dGx9rccucqD67dfRgwBB_SoCxFnfZXtXP-w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/30] unwind: Minimal DWARF CFI unwinding for user
 and kernel space
To: Steven Rostedt <rostedt@goodmis.org>, Gary Guo <gary@garyguo.net>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, jpoimboe@kernel.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_205310_834844_A59CDC6D 
X-CRM114-Status: GOOD (  12.13  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,T_PDS_OTHER_BAD_TLD autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMjUsIDIwMjYgYXQgMTA6MjLigK9BTSBTdGV2ZW4gUm9zdGVkdCA8cm9zdGVk
dEBnb29kbWlzLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIDI1IE5vdiAyMDI2IDE2OjI4OjAyICsw
MDAwCj4gIkdhcnkgR3VvIiA8Z2FyeUBnYXJ5Z3VvLm5ldD4gd3JvdGU6Cj4KPiA+IEEgcXVpY2sg
cXVlc3Rpb246IGhvdyBkbyB5b3UgcGxhbiB0byBnZXQgdGhpcyB3b3JraW5nIG9uIDMyLWJpdCBB
Uk0gd2hpY2ggaGFzCj4gPiBpdHMgb3duIEVIQUJJPwo+Cj4gRG8gd2UgY2FyZT8gSXNuJ3QgQVJN
IDMyIG1vc3RseSBkZXByZWNhdGVkIGF0IHRoaXMgbW9tZW50PyBPciBhdCBsZWFzdCBub3QKPiBh
ZGRpbmcgbmV3IGZlYXR1cmVzLgoKVGhlcmUgaGFzIGJlZW4gcmVjZW50IHdvcmsgb24gYm90aCBN
SVBTIGFuZCBBbHBoYSBmb3IgcGVyZiBldmVudHMsIHNvCnN1cHBvcnRpbmcgQVJNMzIgRUhBQkkg
ZG9lc24ndCBzZWVtIHVucmVhc29uYWJsZS4gRGV2aWNlcyBsaWtlIHRoZQpSYXNwYmVycnkgUGkg
WmVybyBXL1dILCB3aGljaCB1c2UgYSAzMi1iaXQgQ1BVIGFyZSBlbmQtb2YtbGlmZSBpbiAyMDMw
CihhY2NvcmRpbmcgdG8gaHR0cHM6Ly9lbmRvZmxpZmUuZGF0ZS9yYXNwYmVycnktcGkgKS4gSXQg
aXMKb3V0LW9mLXNjb3BlIGhlcmUsIGJ1dCBleHRlbmRpbmcgdGhlIGtlcm5lbCBhbmQgdmVyaWZp
Y2F0aW9uCmluZnJhc3RydWN0dXJlIHNob3VsZG4ndCBiZSBoYXJkLgoKVGhhbmtzLApJYW4KCj4g
LS0gU3RldmUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
