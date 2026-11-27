Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661F5606A31C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 15:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ck+jcQBb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HXDXf5v7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rh5r46sPB8a36QPOG/8ebqJNQJPeHuO9wR0Ze5lAZ/o=; b=Ck+jcQBbibjLaY0iKaMznJi2ge
	5XlgjdLbLDyfsjnAbCauaDyk6QWINGrRqx4ACUcvbb8bdCwQMkSwPK2D1Qx/QfH/lmI9PfEy2RSof
	9i4r2XHjWlfH8Jma+1RfdHlxtcMg42gtUWCnXheoASAepOAvIgDXVtA0+x30i/X2AZo10m3FKdD7X
	8PZ4lnt4i6irQglKA8yMGSIQ0ZO5pu8W0l2rTrjRilqXb4w/Jbokn0Y88Gm8Prx95V5N+sB21NkTQ
	oa/6uaHOG4WueO7rHK93NQ8GUZwr7mEcS4VTWbvE61TZrupJK9wtHz046XqdLSmM+q6EtMbtjL2xe
	bD87sFCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxi5-0000000GjOP-3EhF;
	Fri, 27 Nov 2026 15:18:01 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxht-0000000GjMC-47qB
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 15:17:57 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c506a231b88so1095605666b.3
        for <linux-riscv@lists.infradead.org>; Fri, 27 Nov 2026 07:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795792668; x=1796397468; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d9py8oPfvfLRmuFbfYsLe+2KtIS5cNH01MMiHS00tcM=;
        b=HXDXf5v74wehsExuiQQA1RQ0VvGR6CnmeKLeqMJY12JPQxJ1wd8AKWZj87C48/oX6D
         KTCmzVRj+/DscrX9CRb527AHtGC1lSkAPOlugy86hZ0hCjop405xd1b3Td59xcRkb59H
         sq/4RzfAZFD5GosTlsvkKiEi2AoY4omSMp1dixgrE15p8F3A+d2mY9Vs8/xFi0jM/iST
         2+kePZXGs7HMuatPHkyDqpKJtua/1iZgT1WU6J7RgZ6u1q2Km9BXK0h7oT8ubgRNrRzP
         akpac4m+m8NsqWQ/fBTJjDT8ieru+RygX+Vrst0txT4JA3ty4IxPhtUFr+VWiKtzMcbz
         ivQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795792668; x=1796397468;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d9py8oPfvfLRmuFbfYsLe+2KtIS5cNH01MMiHS00tcM=;
        b=TEpcPzWDaE/QH4TeOd9n4Zgq5eziNl+CPGH7BQR3l1RGzCGn1t73G68zv2IhcZEYfg
         pJfy+qBcwr8US+XuXXnWMBLuTi6Ji/+gfr9eIbF8r7yxK/i1VIRQXvjfR1JQK4NJ6XJ0
         xWYoYMjCapazMH2B0Ndg9w6+VZKCghNcHXuOMpopvKgzWLoOZrlLFUt66R5V3v4/Y0ru
         JNKxdFYx0H+aPE7liWzqSavhvrwlO7mUdH0YfcfmQjKeEcak2KZaMzH93dxQezewwPzq
         nDZy3rdvQG1nuzsY5zVpyWVK5zrwrIhvHFtsz2m0Q1R7CcIorQy2gzcd0AKN/6/Mohur
         iWzw==
X-Forwarded-Encrypted: i=1; AL+hErEJNBQaGTZf8yK8K0U0xv2PSznhT3CCtgHC1dU8EAE+48psBfoL6w9ta2y6C6r+7mcFTE0eMd9M/qdPRg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8hLxtNyhafI5kA51eyXptFPS2zOkwZHAzcWnEzHmXI7OeFhbRt
	l6WlCWpKPYB8tSX0zEFnVx0z3UHA2NxCKX4CCE439BLVknO7AVZTqbZMQ+XgvMb7jNs=
X-Gm-Gg: AZFdTZdl0zI0uWyMnmpo1+T48gItJJ/QKFey+OqI4WHlnM+NhERkVk2crHFQhh/lhJt
	PObeksZ8YH1M/B7wtx7aSWwV/1jyPBRqTpmw9x8apGw4yQod3v84L62Usd7pNenBHExhAZWZWcx
	h9BCZJ2CBpxtzNCpa27FrIgmf4Uuno2qLDgUmc+0WMHFkczDW6wgVAcTWaXU5zCFBUEaV2/5xel
	E2DuDMiCEdKaDFidCE6vzuETq0EwFSGWrltkIAvN/x4nFS3dk7tVRISJ4zA4hHH2/MDT56gpaux
	xsH+dIq8pMzhClqPQCNaXbWknCfZAsYM0eB5RCUBCWTdElfGHbL2q60nha5F3mg4DF3+1TovrVH
	oxRUAfeJSH6EnHkTBXN2ShfnXXVBt9/wDaSxtd20WhuRxg7AFZlweFiA9v61SdTAmC3neqtjeAI
	QhDSbVan7/9j+8vSKog8xBHmJGtH/kUhOSMYTAC722LWywy6YmNJ0st+5rpdmhqCZh4fqg5BjVk
	Ke7C62Fq3tD9z1lkYWIXvLkE2k1USOtPJOuJD/qLzWAn6OLn1p7WTrY4AQR8OsFbCEvkg6KnIqS
	Kvk9nRMBWKE1sQv/LrJbkvN6sW90gxvRJkjrLpe4r95COSHK
X-Received: by 2002:a17:907:6eaa:b0:c46:d837:b358 with SMTP id a640c23a62f3a-c513a4355afmr2170185666b.3.1795792668210;
        Fri, 27 Nov 2026 07:17:48 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513a8678cdsm859922066b.0.2026.11.27.07.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:17:47 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 3/6] clk: starfive: jh71x0: Add generic CRG probe
 helper
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261123112053.20400-4-changhuang.liang@starfivetech.com>
References: <20261123112053.20400-1-changhuang.liang@starfivetech.com>
 <20261123112053.20400-4-changhuang.liang@starfivetech.com>
Date: Fri, 27 Nov 2026 16:17:40 +0100
Message-Id: <179579266081.2809466.3640091940793174076.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Auzs4ujqrLqv73w/LdDQcDLJr4HOPar7zURfN6DCgsE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmc8yXzf/RN2tJSERXL7DKNlb0oVm2pprj+/tmXGLan5
 F97vIe5o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABO5tpPhf7jYzTTPhobs9dU5
 Es+ad+yIzL/j1BRxOay13sIn8031PEaGOQnv+/Ii/HRy/gl69Tkl+l6+qnVm5ZTQLNX4pS9NPjL
 wAAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_071750_042579_B37EB1A0 
X-CRM114-Status: GOOD (  10.86  )
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

> The StarFive JHB100 SoC has several clock and reset generators (CRGs)
> which share the same probe flow: map the registers, register all the
> clocks described by a table, add the clock provider and register the
> auxiliary reset device.
> 
> Add jh71x0_crg_probe() together with struct jh71x0_crg_domain_info so
> that each CRG driver only needs to provide its clock table and reset
> auxiliary device name. The reset auxiliary device is registered with
> jh71x0_reset_controller_register().
> 
> The clock table is made of struct jh71x0_crg_clk_data entries, where
> each parent is described by a struct jh71x0_parent_data: either the
> name of an external clock or the index of another clock of the CRG.
> This way the external clocks need no index of their own, and the number
> of clocks a CRG can provide is not limited by the width of a parent
> index. The existing JH71X0_GATE(), JH71X0__DIV(), ... macros can be
> used to fill the table.
> 
> The JH7100 and JH7110 drivers keep their own probe functions and the
> index based struct jh71x0_clk_data for now.

I trust you'll follow up on this.

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
