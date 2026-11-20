Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7889606A320
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 16:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=joOsWLNT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FeiIej9D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lzZhRINhmInqA/RO4MRTna+XNV0DEHu95GpwbklX9ok=; b=joOsWLNThtM/Li2hK4NVRWAmei
	pv3GIDi34ZhSE98t5jIS3mHmh+SmPuBKqZWwnk7eDQDNeBfQoJEVx3eOzFoSyFs5n7aLViWsBeZvN
	InjbSli794j7REKVg5oxYPsjbIRxUEwFmAqgQ88STwVA2PlKIQmXD4Y96J/A5yMpWlw+nz8I8Iw32
	rxxSPXL1cL+g97dUjogqdPEyjQiZRm+8Nej6nVI7fpyXrgmTw2i4FQXbfpPiHrASuAAG6eXb1ekgI
	HLOTn38qZQYnu54t3cxogof/K+n4nuK1/J8x332KtzommLYv0P5whFXh5g9ZePzN9ooyd8T5aoYqu
	vFIj96gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURnB-0000000FaZw-44f6;
	Fri, 20 Nov 2026 16:48:54 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURmz-0000000FaYz-35oE
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 16:48:50 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so4739525e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Nov 2026 08:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795193320; x=1795798120; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bfyjauXkdda14TZQkJmia5dShZ8rR0trlEvtPbJzkjU=;
        b=FeiIej9DehGotQo9p/5/s+b2JNJrgi8bJ+ThwKZiXDZMZx2Up1Prg4fiUQgBklSLqm
         UyuqPRNuxTfzcYoPLp9CTd2O6M6+JNXaan+5UkAnsmaVPxUBPYVe8nH9BGQirr5i5udu
         xQ1/gRgoXhA6/Rvzi/quUEbt33zKFxFyEfdxGFrYamIfpE5frcBfz7NL2OkHHKqO0gCC
         6tjPFHOvDHlasdS7WJwFnX5gLzAr/+R4FWevkOQuKQX8qWNq4+VbIRJspF7641gJr8Nw
         Ual0YqOSZRHt711Ce5Aom7BA47E8c51oVmLEQAXAt+95I0JTRfkT7wRu5cAVCtDhYHg3
         dfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795193320; x=1795798120;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfyjauXkdda14TZQkJmia5dShZ8rR0trlEvtPbJzkjU=;
        b=HQ2FeJjBXoD5AfoBOjEOnFUui8spXp5csrp3C8PN89UjbNkzaWTBWwOlQ5/asbm2q6
         JUyZ624JutXf52e4RU/Uv7EMhpW/GKihmG1jgcclr2HE2PNl1awlrIS+MthH6fSWQsIf
         Z2usqQS7JShNwl75DHU5z2QnJR5cj6h17gr1y2o+kJxunw+twaGzfdMNPPTD0XddCbFe
         4sUlzdpbzvDQ41F6iK65Eo163WMydpTindQmzXOYAKPy3DQkSfnig7vWRhJlvuxBqGHR
         u3JzJDQSgSn+r17XvAhn9ILBxULAjTRWVb86sOGjnC7cDuBfj5fcrc+r8ZXDtWJYTwkh
         Na2Q==
X-Forwarded-Encrypted: i=1; AL+hErG7kIpFuvDknNC85uxULkdNTHs2B2vWupb5yH6+v959kKi13jUhg6e5n3ol8TthuEWim4B8AfPfJPsCTw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9J90cr6L/bT+Ol7NPa8e6DOxFotZrpBHHWUgXmwU2YPvCorEh0
	xCi6r9zlP3o90UYN/b3F1lHeFzEt9olrhfqyWg9v8X3ce6GxvZVJbvL0BWfxff5GaG8=
X-Gm-Gg: AYBFou3tIcD73bC1fyqeQPMpdTGameKcsXwF7L3lu3h2S16dqJWlDHJqX2t+8Qu8HHZ
	Yfwd+IrH2ojPeD3CPPrR0ZZTCP1TilNGi4Y2YankeaLDB9XZtoIqLBIuDTKX5p1G1nWx1Ehd0DQ
	9+zcc1d4HAl71CSOaAjUXVDlW6CiRC032W3zc4Q4g/BfS6vcG+2TVUwAqeNGI15MeIOZcbNvf1D
	pQooQKz2PTkKJjN5gkY0bWdJ+EUjCVmchx0B9wLlbIlkEsAgOUrzAmdhtKr5MT6/09W7zhPHsPq
	X/UrlXMqeT9O0iEyu6QYOQcqWTfHXbHB2rRV3n+Vlz3aPzI/uARKFPhZADWxusGki0u/97ekl1x
	Ew0ncO7TQNVsDV4vkCsawM93nerpyYHlRzBkoeV7vNYd654Txec84P9uBavzfteH4Eym/E+pTD/
	vwA/RpBUImQos6qGRKwcOWb612yOhqSl3C5Mr1xWGnj22B+Ig6TipUyXlfmQXJmq2AidJVyoRCL
	UOo+Kds3txyf2r3ypAFTNtanci3GJol+h5Nrup8BpLbHDTdjOmqTlt4Wp+Oi4SiEbPboX/IEkDb
	k19ZDPfhg8V2Y9wMg7WVwksU+lean8KBvCrHAJRQ7K1XzLd+
X-Received: by 2002:a05:600c:848d:b0:4bb:6b6b:fbaa with SMTP id 5b1f17b1804b1-4bb8880fd0amr81601005e9.16.1795193319985;
        Fri, 20 Nov 2026 08:48:39 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm102415595e9.15.2026.11.20.08.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:48:39 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v6 0/7] Clk improvements
From: Jerome Brunet <jbrunet@baylibre.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 linux-pm <linux-pm@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-pwm <linux-pwm@vger.kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, 
 rust-for-linux <rust-for-linux@vger.kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Maurice Hieronymus <mhi@mailbox.org>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <1a1cb87df11.2c57f9fa237371.844135553238709982@collabora.com>
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com>
 <1a1cb87df11.2c57f9fa237371.844135553238709982@collabora.com>
Date: Fri, 20 Nov 2026 17:48:38 +0100
Message-Id: <179519331840.3795820.8047048832159165355.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2089; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=4z3/sdMgR1NP7DfsDZx0tYiu2dW9UOhvaq59u1rg0JU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkMlc+2Ksh+kZXIPh/3rDDW4Kn27hqR6Y15t/Vndc9nY
 JL6uuFhRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACYSOYfhf77/s+M/3jXtP6oy
 5+cRhk+hnv9r4q4aztv7e7Xt8cINxx8zMkx3PJygYGn8ecrZdJeblhwduyRv7OkO5akz19EKybu
 wlhsA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_084841_899960_6CC7F180 
X-CRM114-Status: GOOD (  21.60  )
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-11 13:54:01-03:00, Daniel Almeida wrote:
> Hi all,
> 
>  > This series contains a few improvements that simplify clock handling for
>  > drivers.
>  > 
>  > Patch 1 converts clk.rs to the kernel-vertical style for imports.
>  > 
>  > Patch 2 replaces OptionalClk with Clk::get_optional(). There is no struct
>  > optional_clk in C, and Clk already allows a NULL pointer.
>  > 
>  > Patch 3 implements the same typestate pattern that has been used
>  > successfully for Regulators. This is needed because otherwise drivers
>  > will be responsible for unpreparing and disabling clocks themselves and
>  > ultimately handling the reference counts on their own. This is
>  > undesirable. The patch automatically encodes this information using the
>  > type system so that no misuse can occur.
>  > 
>  > Patch 4 adds guards that prepare and/or enable a clock for the lifetime
>  > of the guard without consuming the Clk, so that a driver can keep a
>  > long-lived Clk<Prepared> and enable it for scoped sections.
>  > 
>  > Patch 5 makes things more convenient by offering devres-managed APIs. This
>  > lets drivers set clock parameters once and forget about lifetime
>  > management.
>  > 
>  > Patch 6 adds ExclusiveClk<T>, which holds rate exclusivity over a Clk<T>
>  > in any state until it is dropped.
>  > 
>  > Patch 7 uses it in pwm-th1520 to lock the clock rate for the lifetime of
>  > the driver data.

Hi there,

I was wondering how the rust folks expect these changes to be handled since they
touch the rust/ dir. Should the clock changes go through the clock tree or the
rust one ? it is fine with me either way.

I've added small comments on patch 3, with my understanding of what of what you
are trying to do. Please take them with a grain of salt. While I'm eager to help
rust grow in the kernel, I'm definetely very new to it. It is very likely I got
things wrong.

If there are pain points regarding clocks with Rust, please feel free to
reach me or Brian. We are happy to help if we can.

Cheers

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
