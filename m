Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E31606A33C
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 16:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OP6b6tZA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Hjp+j+Er
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q5ZCJ9Pq2knj0FL/xIwLGFOoeoBzcV5vdjRFpq+Yu2E=; b=OP6b6tZAibXzBe4eZ8dmUK2vi/
	vEWZTvALlUkNOj5hR7hAm8WBM1uFqRlQ0nk5F176rcgO1xcw4KrzQM6/JQfvqhv+6G3NBQZv9IDKz
	tM9w0WbCzYT5uSn6So6Lt+JbYJINf6cFfCNNTfCLootYKBzWYvNtxrTrjgZhiKD2qtGp3xAqK6iw8
	rjqUvtiaMWd/kFlQ/Ze4FanxYLnwTovYFuAsN7MOpI2A5J3NNxwvGZixf4aH2YDmCi7Qo/BL2odcy
	VH9fXgEAA68cpvjmyhHCqaf6ykrUpnb0mCrmu0VxbznoAaEWblouFE3CrkdIUSamkPhuYzscxpv25
	KoS0paGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURo1-0000000Fahw-1Ukr;
	Fri, 20 Nov 2026 16:49:45 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURnD-0000000Faa5-420p
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 16:49:12 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso970440f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Nov 2026 08:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795193334; x=1795798134; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h6ErIQcXg/IQfSzNOukoWYAaLWArDLpy/6tOg0mzvho=;
        b=Hjp+j+Er4oEFOx377ZnirmM64vv6q4JkN5bZ+oYx1N7amY+qhV1VtayheRqN+gwnfw
         dSrkkXvhluO6YwPhSfyTuA1m9Juz0YAkacSjID183vwVCKSW8bPQidxtKtNyxakdFPP6
         uAM/M4/dfRAAaptZdj2EcBmXuEu58iI2tqtQr/VDPUHboew1jRttwWk6FS81EmW4+o0B
         gzgJqw8RRuJs4aBQuTvnY35RCDR5C1bsgBj2xAlvXQoUywvw3Zz6AWRXgo+SAxGCIS4G
         uSbKgd3jvWwPGc4czLmnXK679trbT7lTDDzxRXZ6jApXOuXCB/zf4cupbmrwyqSEWoAr
         dxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795193334; x=1795798134;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h6ErIQcXg/IQfSzNOukoWYAaLWArDLpy/6tOg0mzvho=;
        b=DRbIRi1rw1BRyEEHrMCU9akux/JTfkv1+M7303cLC17Gi4/lxkGApC3Y1nSYfTCSm1
         hXygEeIi/wmo21Nk4mFOA6/Z+7hW3+xXBpE7veBjb0pOwGCZ8ukqMOoFEu6UpA4cM4TJ
         1/9tw24t1/8o70/KIKmVB6zB5/9IZ5jtK4//oVGI3JOX0TTd0lIXwsIhFkzSGGcR6AFH
         W9Tnxo9HYaynLgckaeazcvu4KmQhy+5c6qRKs2JkzlFoDhfmDT/WpI++Mhz5ndmck8hh
         Ym+c8n/IFORPJvwz90BiL+L1M+cFBpiOXlLVA/leqcaEvplsfTPEMXX1dCuojxyHowYa
         77rg==
X-Forwarded-Encrypted: i=1; AL+hErFm3D0j4hEbJOpS2oinui/NrXsIUnYvGbNhHeeNLWxSfj0RpBdTPdt9Q4d559bAK9q8dfOILRUOZk59eA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/AZUHvGkl1miikZ7Upv2YfcHLTNZspAF0r7IHaPnFbghq0+L6E
	2r5WB99FjFFiWKt7TOf7WSvkKZOFToaT5SsSGXwlwZEif3QDP8RhzgeLai9YQiC2ngc=
X-Gm-Gg: AZFdTZeRkhc9jYSDiOVvZXoQKdwLHEw6rRxaOvJjN/A3yVxTG318LBns1VT53e0ZV9p
	LKEBcD6l5Qgu9scEOKSsQdtuIVzlG5Phf1KyxGkVPYHiv3zGk9ziqnyA5+r3MFYABFfMHdZt4Sq
	KOpLZxpspUMUA44hSttfvkaS+YUGtJng846fcFtA3578Skb+/8A8Mp+Hocq9GIOXpAe225RhMwl
	svYTYOztOSuqhrIXdBI0rdosxvF9HNBqELkbfE618eCjkwdroCN0xDlBbMSrmIKv/3IOx8XEQXB
	eKG0ruEVIruYo96orYzI+Tn1SKSP8+jwFRWL3NOML+/tbQRYPa2I1pirF0BUsCxFNOFWYQJWPFu
	LNeZISIgA344lbtrsQzR15nJMRabAVthNY8rTlLZu4K7ACQLbuDmQPRNqKhIr5nhmNVcpRdDlCH
	P+tBEpRwktVnwJFIyBmQ0YT2o5h1nQr9P3awX4XQBlj49zfHTAbxylG5eRF33ZDmKnROtKx3v9o
	F4dc1Q1sfzifMYrVEpOBJ7dJJ8Yw5xp0j42m9WWdpeOJN7nfRPduMlWGeNLc7eVZx3VJ9Y1AUqt
	6gU8vaGv0b3sG0pyXwWvfJrrGh9dEVGV126E/2Kmdr/aEqLR
X-Received: by 2002:a05:6000:2c0e:b0:48c:58d5:30fb with SMTP id ffacd0b85a97d-4abad5ac62emr8227901f8f.5.1795193333959;
        Fri, 20 Nov 2026 08:48:53 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm6034212f8f.34.2026.11.20.08.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:48:53 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v6 3/7] rust: clk: use the type-state pattern
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
 Alexandre Courbot <acourbot@nvidia.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Maurice Hieronymus <mhi@mailbox.org>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261013-clk-type-state-v6-3-a5e9977b3509@collabora.com>
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com>
 <20261013-clk-type-state-v6-3-a5e9977b3509@collabora.com>
Date: Fri, 20 Nov 2026 17:48:51 +0100
Message-Id: <179519333138.3795820.61438010297111723.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1734; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=vYLwHzMkZLjjbU0w6/Ec7PCJHgruiB342xDmGbUK7jQ=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNkMlV+EGpr8GpuXL66eHBu5Y3mWWeFV4a/G+0oUxUrer
 RUIcefpKGVhEONikBVTZKnhrhZ/J6n1ZdZ0ndswc1iZQIYwcHEKwETm3mJk+BtiEpjsotk54bty
 cAsHW8fEZPaiNRy3p1XOeRy6T/PLD0aGzfPKGdIZvNz7xBo2Ljp/6Q+/laCNSwnzT95L3nMcLF+
 wAwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_084900_704609_F9643F2D 
X-CRM114-Status: GOOD (  17.04  )
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

> The current Clk abstraction can still be improved on the following issues:
> 
> a) It only keeps track of a count to clk_get(), which means that users have
> to manually call disable() and unprepare(), or a variation of those, like
> disable_unprepare().
> 
> b) It allows repeated calls to prepare() or enable(), but it keeps no track
> of how often these were called, i.e., it's currently legal to write the
> following:
> 
> clk.prepare();
> clk.prepare();
> clk.enable();
> clk.enable();

This particular sequence is indeed allowed in C. I don't get why it should not
be ? (in general and/or in rust)

If you dis-allow this in rust, the 2 sides drift apart, don't they ?
I mean they start behaving differently. I suppose this is not something
desirable ?

> 
> And nothing gets undone on drop().
> 
> c) It does not let a user express the state of the clk through the
> type system. For example, there is currently no way to encode that a Clk is
> enabled via the type system alone.
> 
> Following the Regulator abstraction, switch this abstraction to use the
> type-state pattern instead. It solves both a) and b) by establishing a
> number of states and the valid ways to transition between them. It also
> automatically undoes any call to clk_get(), clk_prepare() and clk_enable()
> as applicable on drop(), so users do not have to do anything special
> before Clk goes out of scope.

So the point the is automatically clean-up (as in disable()) clock when they
go out of scope ? In C, the equivalent would be calling clk_put() with a non
NULL enable/prepare count. We do complain loudly when this happen. I don't
people should encouraged to not actively care for this.

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
