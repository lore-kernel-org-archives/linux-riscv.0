Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A46B6CCF9E9
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 12:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=T4jkM5oQB702JDFyQhCNEOU0D1wguOFO3CTqne8kb7w=; b=Ymnmjda3WxmgWsmvLxocyXIZdU
	Y7HResa9j3nieyUhYHG9d8tdnPBjgtoAbBUT6r9V5q0MOMObyPhKTQ1kvF0MdlXDWdzRgbUupK2li
	FbGgHICW5W/lH3mfNztXS82o6GfcMMm0xtrpHRH14Y6sfNiXsxPYUe75TaxseSDiEFPiORh+Yp5f5
	4xnFjY7u6UGVhQA/1SwVXCoxi9F8Cl+JmcK1Br7+tz2JDxqVVPb57Upcmeh/NJNh8iPu1400GT5th
	RVIEhdSteJIpc5aqWrIQFxAQhGWlis6x/nHomAshj2vgZjcrHZhXqQnnOGjPdwu4BAqiea19wLqtC
	siEjO0IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5a8-00000001DMU-0YjQ;
	Wed, 29 Oct 2025 12:47:16 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5a5-00000001DLf-2cPC
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 12:47:14 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-475de0566adso39319465e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 05:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761742031; x=1762346831; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xtXJvTcq7PSogsyLbiFNIiSa3aMDytmkSsBCAXBdzyM=;
        b=NeW5w5LnSM3tZ7SpFnGpDMxdGr+yL0d7ReyyLB+KTuu7FLWNLR3u8nHdJ4BlzoziGB
         UYEhAT4X5iX5jBTwwRnVzDjkZ7DcJSA/uD+OdTuUoUuBEn9ovFvKD4RELNuXWjaQXW8r
         hmiJQfCX4GqU+bGPfQb82ObEPfdH400O+ymMqWtf/Qj4xpVKgjzHc7hhEzKuefFNMjiD
         Pv8B8fk/rNxD3pU1cvwMdlkApkFWqRNhenGz6uQBhQsPYDGAXc5C06YF26dBcCtYlflA
         axVZv6c+Mh1kFfvHjB2t9h1LmnQeGW89JE8e13JB+AmyBBUPGPKgfATsl1rJlegX1KO8
         8otw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761742031; x=1762346831;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xtXJvTcq7PSogsyLbiFNIiSa3aMDytmkSsBCAXBdzyM=;
        b=dyBUkSdFe/8lqytY2SlzslMJnuum7a0hhKhvSKoBUzqHbhTJg4kJ+CQx2k3hJHCtnt
         CNeS2XacJ7GHlXfWUW3xtKvYkXSPTHHCuo/n9ElPcbk0wsVX59ZGsbnSYWs7hNYckFBT
         z382vpUurGYY9bJe2oI1ZBgXaAWwLTCHG6m/zxTCModUaWPB/pH7MTDWMs7IBteY3AdU
         W9f6h5AaC2YOGnceXktRZEmlMQNX2vkeaIkXg7Us+YAiyx/eLLbJ/9vBFlK3MrAINOl/
         I6R4qcRZH9nhRiy+o5WASRgoS3Vrd0ogmE43sCJDEOS7kLk78hCaEaVNmgenvx6WvcJN
         LruQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPPFEIkYmTP2RSnxW3l+6zAoPF6guiOM6yQz0SBaJA6EYNNjJ5wsLO1wrjiD+L5AobdiuxXDSVdgZceQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjT9oIZXilgxuOWqyczf62uNGNrWKoiGVNTdBWhalObcsgROfV
	NukmVqINbH3Gm0cQDbMsND0YxgRZH6nMNMdunriSNHgO/qONCEH54V0RZjou4+ZLFDMRWj8TokI
	sypzKWuZGjZ/pYC8gvw==
X-Google-Smtp-Source: AGHT+IEv3fbqpyMJagFo6xGiSAp4ZJfz/NOzhfXNsSPeWdIojUeQVslwvThMYOlDlFUMgf9NEYTALza+RhxNeRs=
X-Received: from wrrx8.prod.google.com ([2002:a5d:4448:0:b0:425:6e00:e053])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:25ca:b0:428:4004:8226 with SMTP id ffacd0b85a97d-429aefb2a9dmr1848797f8f.34.1761742030807;
 Wed, 29 Oct 2025 05:47:10 -0700 (PDT)
Date: Wed, 29 Oct 2025 12:47:09 +0000
In-Reply-To: <20251028-pwm_fixes-v1-1-25a532d31998@samsung.com>
Mime-Version: 1.0
References: <20251028-pwm_fixes-v1-0-25a532d31998@samsung.com>
 <CGME20251028122316eucas1p2733987cd4c1eb8f83d6572d542e76d2a@eucas1p2.samsung.com>
 <20251028-pwm_fixes-v1-1-25a532d31998@samsung.com>
Message-ID: <aQIMzXnUqjW_IVdb@google.com>
Subject: Re: [PATCH 1/4] rust: macros: Add support for 'imports_ns' to module!
From: Alice Ryhl <aliceryhl@google.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, "Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_054713_673053_B9502C55 
X-CRM114-Status: GOOD (  10.93  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 28, 2025 at 01:22:32PM +0100, Michal Wilczynski wrote:
> Kernel modules that use C symbols exported via `EXPORT_SYMBOL_NS` must
> declare this dependency for `modpost` verification. C modules achieve
> this by using the `MODULE_IMPORT_NS(NAMESPACE)` macro, which embeds an
> `import_ns=<NAMESPACE>` tag into the `.modinfo` section.
> 
> The Rust `module!` macro lacked the ability to generate these tags,
> resulting in build warnings for Rust drivers (like the PWM driver) that
> call namespaced C functions.
> 
> Modify the `module!` macro's internal parser (`ModuleInfo`) to accept a
> new optional field `imports_ns`, which takes an array of namespace
> strings.  Update the code generator (`ModInfoBuilder::emit`) loop to
> iterate over these strings and emit the corresponding
> `import_ns=<NAMESPACE>` tags into the `.modinfo` section using the
> existing `#[link_section]` mechanism.
> 
> This provides the necessary infrastructure for Rust modules to correctly
> declare their C namespace dependencies.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
