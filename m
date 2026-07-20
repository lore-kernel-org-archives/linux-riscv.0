Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BEAC44521
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 07:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nAcjE4FtHMjUe/U+2g191tvkj7uShF/91Ylprouzyzo=; b=AyNsHK7rL97Oag
	sY65DJct/tndsQ/ekVFhPEv5YYIfLanas+d7HhO0AkaOk5c8pA27DzVh1DNg1o1YrR4+WtmyTydz2
	pHPi1OvrrrTPjaQvgg9b7qAeGucd3lZTos4UHhLysFLwENaBoXz/fXu0WKvTU6aoEalr5nWtpbjfV
	tY4jingUFGlTwRtvVacOoJGjV5d48jhDp6D4ZGAd220miRdYV7b9ost31Ps7dZKWBInk2f32xEL+a
	Quypb3n2kHxj66gaZBVEtYF7G7E9FQ5laNboIwgWrnYuJONAG9nmmLern7OvzzBHx+jOz9zBn83e3
	isZHkM8F/hWWrMIZj0iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKp-000000063Om-0npY;
	Mon, 20 Jul 2026 07:22:43 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKJ-000000063Bv-1yQ0
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 07:22:13 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso9845784a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 00:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532130; x=1785136930; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T1rQiWC4b1Qi8oqfTxdLB8xh9GtA5nvI8VX0/xhDq6k=;
        b=UrXozMEfNKb6ZjwNmSjgiI/ybxojEpM+aF9basO3HL1jG03ugfZWzXx5cKiBb4pHhy
         hgQ/Ga4whY0Wg5fFN95ttjABGz+67ifyBSYa9HQZgh4yW0nE0KTnqIv2ymZ1rzCM04Xa
         dbjdZipxvDZdgANkMAk/ytmxAVdLh+l5NYztqHJjmhjxc1Geg3YJqmFTAPIkqrm0YYBD
         iarkO9paUL4tArr68V6z5xnOrvQ8+FBYTI+fmdq35IiyE80E4yM4AO75IEqs49w2sTUc
         4l30c1AxByUNlhMg/NygeQ+2Mge3gMUf7JhYf8WdIRJWyspHz2ESPCEg5j7KVaGzxOLB
         XmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532130; x=1785136930;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1rQiWC4b1Qi8oqfTxdLB8xh9GtA5nvI8VX0/xhDq6k=;
        b=n24MJulzxF/pwhHO3myqHlsqNyljbxN5hGL4ymqvTRGkMZI0zzAGOZpxQ9L9u12qeC
         qRn8k5SrWXodi2Q7eiRBG/ygnpa2oUIEOVlTEw+9n2z5Pi8J8rs+Zdsmi4kBA0ZAhmzh
         ArAL7R15W/wq4QVUQehHCsu9TAUsJaoxNie209HsVLvnYNmzBr8rp2UX63ExOsWW8Dxg
         n66W/lzT7StRXBwPGRSOvQUdoOjo5+Kx8Khy4Sqel2qCuRvyOw2v7F3pGZcRp1wgT+RK
         yytuaAJvdMqIw6b6G/51cmlhOWncxQSrL8iHpWLlBMysGjByCOy+qFlErJZUUlaRRqjN
         hPOQ==
X-Forwarded-Encrypted: i=1; AHgh+RrW4ZvFu7N9hjy8fB62viTiv9gWYoOeNkAJys3G2km0dc1geRCjEqYKpPCPbNMzGAGrY4kPJViAZfKMjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtxkXzIuu8c4G/WKgE5dOL3MsLzvqnPmeXg/cA5396rGVrz9Lm
	WY5Y1egetbYOKmJARMfti040hFzWkGtTNjz2XyA9gj8wBL9G8ZHp0j01
X-Gm-Gg: AfdE7cnQkI2Q5teVh8mvt7dYTZ/zRLiojSAO/FDnx5RvbUKtdP8iln7gklY9UaGKVYq
	fpcv1FIcilzcLGRU8+Dojc+TiqMNUUthXRqaYhWR6IYWtsMIZ+2TCgckKwZbzSraV6RjPEoP9A2
	5V11Kgucv6AfxOlw/7lt0eJdnV7YMqzabqMEjsXKs6nqU6sqo4u7djlTNz2+jt73bOH2vbYXSGN
	tu+eAo2VQZQsp/7OvZMn+1t7p/4x6nHZgWuMMvxSNc7VgeNsRt74bsgY4p6RfWC+0BilTVIMjLG
	eWKmKBDpIUyFbA+9ST1Q6DXUOazc6NlaPi8PzDqCob69S/qBDhUzNYeX+2bhTfLRAoUkT/9+OS1
	B3ImbuFMyhb6UlWv7CjaPb+0j4YfQWiTJfskk7RA5tN4waj69eV9r1hmnDeTvuYOLBhaSiOWR2U
	090qYdn5OwxgQ9KZ7XDGZn/r90gy0YAuffGWcGA1Q=
X-Received: by 2002:a17:90b:2691:b0:387:df8f:1408 with SMTP id 98e67ed59e1d1-38e4b5ad2a9mr14741701a91.41.1784532130478;
        Mon, 20 Jul 2026 00:22:10 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:09 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v8 03/22] RISC-V: Add Sxcsrind ISA extension definition
 and parsing
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
In-Reply-To: <20260701-counter_delegation-v8-3-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-3-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211934.543975.9634665501136926362.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=387;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=DaF1WA85q36ajkUp2wWjzs8vEjfcfgQEKe7dAK+cruo=;
 b=RXEmXx3bUlqTR60e37EoLeCgujoBbcJb1A9/syNgqmenEp+jMQ5zhL3lYU2n1ecg3AztUmOp0
 223x7CuCQiDBG4mckQKZidh3U7VcQ7UofEjiHekyrNNXCwnACr4Cm4W
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002211_524329_E61BE807 
X-CRM114-Status: UNSURE (   7.93  )
X-CRM114-Notice: Please train this message.
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

On Wed, 01 Jul 2026 01:46:51 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> The S[m|s]csrind extension extends the indirect CSR access mechanism
> defined in Smaia/Ssaia extensions.
> 
> This patch just enables the definition and parsing.

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
