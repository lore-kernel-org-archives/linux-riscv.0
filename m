Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E7AC48BF8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 02:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=02KtWa4S+pwXxB5rZDP9efjhAUo6B5Yim7MaGsl4ae8=; b=0tqwsnkGqV8WEi7aK99doU3h/N
	CWX+rpYOeKcwaIaCGyxTJJbG31xC0+qiSRWcxlaU9BqjqyUfPPQo5Ia5ayEcGa27zCj/1GgMCygI3
	RMmfn1xm5QPSSimUdMsMql/gbJOqZ1GlFgIsR/B8HYha1u5qhnTTm5U3jIQYQnUJoXtHk4Di6qRLp
	qtSOtrNscJM/9Khe5vuHd6KVHkBkrADiPe+vZyGtzVsnrNi6ZcMHZUwx5LIhwnU7yvJhtogQbOi8S
	Pkd2aZ+OCznfrSN6Th+gWCb9HCvou/tpbI5R7RNdAjF3IqSaoqphIrjzco4mDJCTWp1kbpZ6SAYn1
	uG+hMtfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcFhr-0000000CqOR-3vB5;
	Tue, 20 Feb 2024 02:18:03 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcFhp-0000000CqNP-1Wqi
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 02:18:02 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3bb9d54575cso3494516b6e.2
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 18:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708395480; x=1709000280; darn=lists.infradead.org;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=hyy8ZTU+BTw5Zgz2454qzBwNJQ5zOkaDYTH0aZ4A4fg=;
        b=GzxsZXjTBbQJ9XzDnKE8cX2Ad6SH1MHG2sASIJL3Gl2Qy3hg2UVDC6530arWI1uvng
         Dd7M2aUmwkq6Un4rMiglx37pvsPKQNrg9Z6NptZR49ssLnvfykvT22RQctl3rZ1nRjiP
         Np48cP4Pxv9KYrDgHZIcWJJmyl6eE0/l0AjtzxMF3onHsIvGGMz9VcxLhsb0QG1kGb9E
         GqAaA82Yqz2u+dIjf1LjMG5Ig+D0ZV2tVfRJ5vP6PTQeM0V2mX/wjumFQotsh2Mg8P+e
         yVBguTPNTqD9ak5zJMY6Ea/Sf0kSKa/zlzOClLR4rMsYreQ2zuT+gHgyUISXf0IMJudO
         Oq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708395480; x=1709000280;
        h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyy8ZTU+BTw5Zgz2454qzBwNJQ5zOkaDYTH0aZ4A4fg=;
        b=cES2rCK8GsWRm0ObtTyeeJNDuxln/lTD2B/bPhn+tJylDAq6b5R6e42lqVY5eRwbw5
         egBSbbvMuoMHOVOBsg6CkrvbHdlQR+qlgcE4JvmU1ts3yn5UjL0T6qoLtJdDCYCCPLGI
         yTzIaDCx3LyqrYPfUBOqo7+aFYoGTibBxzBoxujdEGq5N++xqdErBuDo13maw/8Ox+Jx
         Wt2eRtQe8K6BD+ZK/4QTx7LgzQngeWJdGcyyNwDDF+2/c6zzI14CEm0FOV52qUYLBTU3
         C9gJ3WC6eyZHm3eAeiq4EwGPx8GCmEVkjqOT5LexrEWE8wI1OtM9Ud9RBmHqf7sGbsuK
         8bbw==
X-Forwarded-Encrypted: i=1; AJvYcCUxbWKlLzPbqftYnRoXtvue0hu5GEOwTEcVA0N0FNdeDEQqLlzKhTWYFIOpkFwS2VE2yHDfg7F3suu9iB6CStCRG2FuwNy3IJkJ4Rn/QWcN
X-Gm-Message-State: AOJu0YzOQ1Za+jKIbfw5oSv771UFBZOuhpBKSPOULgojwvJt/Tj1Pbl7
	kFauSgTl/FpeVV+tTmTThgfQWQSJDXRB5mCcWta2V5lNy6tbMNM3N6ytzkYDHg8=
X-Google-Smtp-Source: AGHT+IG+AWqQMKARywU7epk4MPVFD1c38rPYRk/u1nDYjlo0ottYYY2CyLviBufhz/tQt6Ao3jO2qw==
X-Received: by 2002:a05:6808:2b06:b0:3c0:4455:a2fa with SMTP id fe6-20020a0568082b0600b003c04455a2famr15407500oib.18.1708395479877;
        Mon, 19 Feb 2024 18:17:59 -0800 (PST)
Received: from localhost ([2804:14d:7e39:8470:a328:9cae:8aed:4821])
        by smtp.gmail.com with ESMTPSA id jw26-20020a056a00929a00b006e45e51ba11sm3274807pfb.145.2024.02.19.18.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 18:17:59 -0800 (PST)
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
 <20240203-arm64-gcs-v8-35-c9fec77673ef@kernel.org>
User-agent: mu4e 1.10.8; emacs 29.1
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton
 <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Suzuki K
 Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, Oleg
 Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees
 Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, "Rick P.
 Edgecombe" <rick.p.edgecombe@intel.com>, Deepak Gupta
 <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, Szabolcs Nagy
 <Szabolcs.Nagy@arm.com>, "H.J. Lu" <hjl.tools@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Florian Weimer <fweimer@redhat.com>, Christian
 Brauner <brauner@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 35/38] selftests/arm64: Add GCS signal tests
In-reply-to: <20240203-arm64-gcs-v8-35-c9fec77673ef@kernel.org>
Date: Mon, 19 Feb 2024 23:17:57 -0300
Message-ID: <87o7cb7uay.fsf@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_181801_435346_90DD6910 
X-CRM114-Status: GOOD (  10.39  )
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


Mark Brown <broonie@kernel.org> writes:

> Do some testing of the signal handling for GCS, checking that a GCS
> frame has the expected information in it and that the expected signals
> are delivered with invalid operations.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  tools/testing/selftests/arm64/signal/.gitignore    |  1 +
>  .../selftests/arm64/signal/test_signals_utils.h    | 10 +++
>  .../arm64/signal/testcases/gcs_exception_fault.c   | 62 +++++++++++++++
>  .../selftests/arm64/signal/testcases/gcs_frame.c   | 88 ++++++++++++++++++++++
>  .../arm64/signal/testcases/gcs_write_fault.c       | 67 ++++++++++++++++
>  5 files changed, 228 insertions(+)

Just FYI, in v7 I reported that gcs_write_fault was failing for me.
Now all tests in this patch are passing.

-- 
Thiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
