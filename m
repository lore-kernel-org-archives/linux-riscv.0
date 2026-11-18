Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C06360A2617
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 13:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fhU+yNUn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gTnE8e2V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=k1Bcl+p0ANhc5kLmLiw4OrrUBxfGucx2/u7yV68UTHA=; b=fhU+yNUnwxN5q53Q2wZ/X0e/79
	82BzseFHcJtkR327aXtgKELSk2EkgL/O5Rb8lQag1mzImtT0JwLDqdQdIftWcxwDU2dwYClBjubuH
	4l3cWYJ1dEzc75SoDqbYVE9TFdIMQ4sjJCkHq4nsWhrTbrDs7FlUPHLniW/Ly2y5e2gDb57TdvVQj
	urh4J5AgYgJbU3v7Y9parBz1NE8e3G9fWsWrvbVD9v0dqMAJ/JgCHZ4PKkJR4y4gP0dXkJfvogLYo
	+wygc9ayoxI70bawbXogGPm6ItjnjsEAJum8ZCvrC7SHfwzrRi7/cU7J+0G1gMrOtm9KuD54qDdqQ
	OnbscWsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTg13-00000008zl5-0kob;
	Wed, 18 Nov 2026 13:48:01 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTg11-00000008zir-06p9
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 13:48:00 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-48e0389d6f9so719471f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 05:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795009677; x=1795614477; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fp5kGNyd0eTmZJulttSFuV08XJjVgnvokjb06RGq2vw=;
        b=gTnE8e2V1yuXoQLCWzVgnTJOLhfQ8pYkQtmCaTvuLUs5eCZvEyv3lIFnVvsx3QT+J9
         ondCeFtWThBS0kbVdlBdyrXwKpz5nOGjC6WFQpLcqPh1I729wDbqkJGXdf9ryr3ntwSR
         l3XnFK9AChTxqRpXAQyqfFi2DbHW2y7rBMzke5MD/PPGYdyG6X3aT4udVQip5EYKguh6
         gcIZwtXajodEZUaGTHwW5T3AuRxesuT2pGTM4ue7o1KZg/T0wL58pyQO6VJgedqbxk0w
         2/qWr86E3ufdZB6nhofs+v/Ywx9s2/o6lzxqRZnvMK2L38ZfI40uUMy6iw75tt4AUndy
         RS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009677; x=1795614477;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fp5kGNyd0eTmZJulttSFuV08XJjVgnvokjb06RGq2vw=;
        b=SGDbY/1To376sbGavYaiwleSzG0AzjTGYE/5HEjB6So1f2oKxCNUkc/FdsqMpYoqbL
         d8eJMto2wDxZi9/gdfuIwY365ganoLP0pyBGq/aXFeMtOJ0moo4KVq4dCBStoi0HGqMr
         mKxga4nENFeilHBjAH+60YxqBFi/UruysYqnT+noOaKnsyjCFmrDC+N3mdKp7YGg3rjT
         f6sKbPDApYR4AeGgJGn9cFyFvO1zQlbPfIL9JRYfyUWNWv+66agKhMY8MtX+sX8r5reD
         bQxAr8ajxDw42bPGrxkJTmTZDgmfFgNW5nj2SFNrljDDJqxMQw6iTUoGNMSZj/zgCN82
         R08w==
X-Forwarded-Encrypted: i=1; AL+hErGqknAkK7V/b+5NpLvEhGFcIcOT9vN0SEFjW87MScwWmeYvYr3OZ43+yBo/jrbnltPmn1lpQUt6GH46bA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/lN1U4UcVsmplDt90VwbqkJzTp5Zi4flUGDgwnlmEEg5Bc9Erk
	AP2nSjOKZHqROfDgWv6lzc20zxjTiiWpXYAzfS+Y/q7rSo3Yz9CoHr+wQoMik0CbhW9Xn/b9oxm
	UwSbcwGMHukaP6/5EsA==
X-Received: from wrbay30.prod.google.com ([2002:a5d:6f1e:0:b0:49b:ed87:ac7b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e002:0:20b0:4a1:a2ed:bc1d with SMTP id ffacd0b85a97d-4a63b6fbe61mr4560158f8f.43.1795009676739;
 Wed, 18 Nov 2026 05:47:56 -0800 (PST)
Date: Wed, 18 Nov 2026 13:47:55 +0000
In-Reply-To: <20261013-clk-type-state-v6-5-a5e9977b3509@collabora.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com> <20261013-clk-type-state-v6-5-a5e9977b3509@collabora.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118134755.658603-1-aliceryhl@google.com>
Subject: Re: [PATCH v6 5/7] rust: clk: add devres-managed clks
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Boris Brezillon <boris.brezillon@collabora.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, Maurice Hieronymus <mhi@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_054759_077431_4A3E6310 
X-CRM114-Status: GOOD (  11.07  )
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

On Tue, Oct 13, 2026 at 02:07:44PM -0300, Daniel Almeida wrote:
> Many drivers only need a clock running for as long as the device is
> bound and never touch it afterwards. In C, devm_clk_get_enabled() and
> devm_clk_get_optional_enabled() cover this case.
>
> Add devm_enable(), devm_enable_optional() and
> devm_enable_optional_with_rate(), which wrap the C helpers. They return
> no handle, so the driver keeps nothing in its data and cannot change the
> state of the clock. The clock is disabled, unprepared and put when the
> device is unbound.
>
> This mirrors regulator::devm_enable() and devm_enable_optional().
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
