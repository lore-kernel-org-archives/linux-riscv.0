Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9A3606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 23:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YfXPdczQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=URCK50pF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=6PaQjY/NBVby9Sme+Wy0KXTwoagmTH2jdQ0M9DxD/W0=; b=YfXPdczQEV/6vKZjvXq+Z7q50o
	yyrKMjYsnpDQ+KLOodFzZjsmXijH1Y6Rp2aQLa0xAJr4uuJ5oS8LHinxiRXPwtPoYAUIYQjaPGZox
	2vFQ4x9jVzIL7mV/Ef38ntM3RiNth4aEzogAqqMCrDLhYUQqhgYX95QjWz9u4l3sGujpt9Ugn+UZw
	tCS+h3uDGY7bn1mjyMoBNZVkeCD1R3gNi3v7cKvdRCVFB2iSo0ByMYitfvdGA3QiDadTMSnudfRm5
	2gg2RaeUlwPQ1JnPwakx9oMbI0KRcHjce3aBVP2KipNuHTDfjsAqhwXEURhIcgEE1xmA26ruyjeNc
	PQzYVB5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTp0I-0000000ATVG-3eeg;
	Wed, 18 Nov 2026 23:23:52 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTp0F-0000000ATUX-1WwL
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 23:23:48 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a4654add56so12131665e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 15:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795044225; x=1795649025; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aE/1e9kDFCI5UrrvURSWVQtRLJVIirbU018865i3928=;
        b=URCK50pFpLZwLXPjeZGZi3kDLtrJvO6jGZsrr5lMAcMV1lFTQ4yKDnU89zaWA7MUgP
         DQchDmk+dOIfTZBtKZ/kwI9GHhfScsG3q2vAUkXprUKi87f3mf8DZ6qOswsmqpv91FrL
         cMo1YxoyZrAv3cm41KZz7m0NnCWbVMKuByuHhEDfMIfKKSk8Ow/dCJ3oPq3ifOT6cvdR
         i1z6Saj6E4crbAj1dJWDxgcOQhi7ohcawlNPlsHSIoJkUbrjf/tJ18uyizbrOd7fiVs8
         RGW0J+Mm/OqUAQePwhDmFxoIibKAk2BqPRTnLXrOzXmMsEowE+M0AKITvzNyeUQJbtp/
         /d9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795044225; x=1795649025;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aE/1e9kDFCI5UrrvURSWVQtRLJVIirbU018865i3928=;
        b=OkI5Cc4J0jjOcnrlgm1P50YRdLiRVluA/6nG9OV/YqXyXC0rpN/uLvRTQf8bulISyP
         eQMOWvIhUIJ3/B1IgpATFpnnrYDo9lsANYHT8wx4hC11ujMS6xIW3YwZVujxTCvRMcrO
         hlxQuS06Q4JYV7X/g6G9nt7f6PCA3PVoS8HCiVLoILPixN58xoE6ispKpGExYKkSCfPv
         VAk9EjUdGs1atFc1JJTKE+nBk1vIwkZ1DMPiAkuiD4OT1eOHSqCM1m3ALD4YVx2sSeYG
         4RqZM/ZFjYdgdCUl2SSZRvbyluqeLaH/VsYq0ckmrFTKq29Q1tbg5xGWMPkWFD1vJa9H
         tRBw==
X-Forwarded-Encrypted: i=1; AL+hErH3/bIOMkhdx+nsES8CKrP4NXcdwPZY/iE0QuSGDdQExbFPrAN8QgzoUrWA4K8ElU/pbuEMZTl4k6Hzyg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+uOefJ4Nz8kvgu2pDnHsMwgL+pKzLsSLbsL9CX1bp9zP8SlOhA
	TNyWfRytJQUL13yii0UFaKfCDc1u3WLH0im6KQb8RVryOl7KM90psM19j+glGj5DIpa0a874/xa
	UjX914Etn5RK+17AlKA==
X-Received: from wmbid15.prod.google.com ([2002:a05:600c:a18f:b0:4a2:966:8982])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:b99:b0:4ba:6d8:dfad with SMTP id 5b1f17b1804b1-4bb7da1aa22mr80985015e9.14.1795044224485;
 Wed, 18 Nov 2026 15:23:44 -0800 (PST)
Date: Wed, 18 Nov 2026 23:23:43 +0000
In-Reply-To: <20261118224826.2491684-2-tomo@flapping.org>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118224826.2491684-1-tomo@flapping.org> <20261118224826.2491684-2-tomo@flapping.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118232343.1511291-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 1/2] rust: math: add div64_u64() and div64_u64_round_up()
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: Alice Ryhl <aliceryhl@google.com>, fustini@kernel.org, guoren@kernel.org, 
	ojeda@kernel.org, ukleinek@kernel.org, wefu@redhat.com, a.hindborg@kernel.org, 
	acourbot@nvidia.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	chenhan0017.work@gmail.com, dakr@kernel.org, daniel.almeida@collabora.com, 
	gary@garyguo.net, linux-riscv@lists.infradead.org, lossin@kernel.org, 
	m.wilczynski@samsung.com, tamird@kernel.org, tmgross@umich.edu, 
	work@onurozkan.dev, linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_152347_439148_D0A49AF1 
X-CRM114-Status: GOOD (  12.18  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 07:48:25AM +0900, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> On 32-bit architectures, dividing a u64 by a u64 with the `/` operator
> makes the compiler emit a call to a compiler runtime function, such as
> __aeabi_uldivmod() on arm. The kernel does not provide these functions,
> so the build fails when Rust code that is also built for 32-bit
> architectures uses `/` on u64.
>
> C code uses the helpers in include/linux/math64.h instead. Add a math
> module with Rust versions of two of them:
>
> - div64_u64(), the same as div64_u64() in C.
> - div64_u64_round_up(), the same as DIV64_U64_ROUND_UP() in C.
>
> On 64-bit architectures, both use `/`. On 32-bit architectures,
> div64_u64() calls the C function. Both panic if the divisor is zero,
> as `/` does.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
