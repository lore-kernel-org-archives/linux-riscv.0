Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E4F606A31F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 15:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tcDkFIz7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=NXmOMTxO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cOJC/XTR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=i4FNptVlzz/3UJA4zdEkVdfM2eG7gxPmtNShXAQN0VE=; b=tcDkFIz7NgACWqpskpybO8EKez
	Skt1o159KqXKi1FJez1iAN2tV7Aa0MWuCeuVs2BHh3AYVLwVIDq/VyttsL7L3w2pjULrAxRGUY4LE
	rFsCeGAuQcALiQzMopF0oLI/stWV4r4b7Mlyliwf20QTDFbwbNXDe5u9KhZpw8hhO1eWotEbBHY5S
	LPOpf7wZ+hlYHsbcAL4AWJzrW/VHRJ3MRTC6SUU9sxszabhssuQQhYP+SaoSxCGMYOoul+hnHzAoT
	ppXY+SFq0EtSCAMIs38gAHqHFZWQzTm0vHW5DOrj8JweXUwWXx5VVQkrPsVkTcXvhZz8jZ4Xr9p3V
	itrRMWYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxqv-0000000GmFg-1NVz;
	Fri, 27 Nov 2026 15:27:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxqr-0000000GmEU-2IaO
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Nov 2026 15:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Wctjo3j5xh+nTDA29yMIw47VYYGkIaceGn1gzPZ4u50=; b=NXmOMTxOGrTJAQOhiK8cVD4KkL
	O1YdraIkeWGd3IIA0qE0g/6Kk0nN+4ntex619/+iqHZI9hhjZW2/6tFxk5iiY/erW69R+fNYSgIsn
	9J1rtu6UFLKi4elL5pOQa8amOiyvYXp1kuiNcThkECsh3Ws6IbKoKnGCHtnF/3ZfEaG1LNxm5DcAQ
	WmDWlAQ1xwGKvOaNlk9gE10xzEsAsYEPV9GrMiYNs8tXRoXIyJmd2I//WIXoWmPQlOa7Q5o2mCtu8
	XZzIM8L6P4qrweCZ/FbFtpm24vjjlqiAEpqgWNVPQNtgzGlRYkgODHIk6jxrcYDuHSWEqUfzvgXZy
	obLx27Aw==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxqo-00000007thv-33MR
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 15:27:04 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4bb606491faso43668715e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 27 Nov 2026 07:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795793220; x=1796398020; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wctjo3j5xh+nTDA29yMIw47VYYGkIaceGn1gzPZ4u50=;
        b=cOJC/XTRDqO0nm9qCWqXvX42HdYUpyB0ehNUnlfCta7vPChEwEhLvFJqmM3mKZOPMT
         Ok6xjr7DnLgK1ALj4g3mRiaLQYjVA47MvS6y0mZnyUlxWH3qkkpNfGKOPImUlySRjM7H
         hFUmeYE31PAJL7Skb/bJuZJtho3Wy6MZchsaOlbWgL6zyrmKln3E8Z1Y7OCPI6cjMeRk
         IPM49DQHqId8nuRoxvkHIsRBcMSBcavZJcylmELYVWYb9CoAUntsvKmEAfrRKG2mupRQ
         U1uOqCdNKuPi3A1K24kUIC8+tHAVax2IeDzQ4lieZledwrwlKavX01t5gBdVqgh2NUji
         b5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793220; x=1796398020;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wctjo3j5xh+nTDA29yMIw47VYYGkIaceGn1gzPZ4u50=;
        b=qLNWkm8iq0jcr+bwPJKIUF2e50qJu8dTALZ4/g6KLjAfOIsXp0eqG7QY/L0UO3YnYT
         geX/Eg/oPNzVVBzhkgXomhSYQwcEsQEl6TdBrB2ZZ7HQ5l97pL0NdAlmX+soi6TIBgpA
         KLoB6sr9iX5Ccwgqu7Ccr/4mfS/LzKJJmCG/BO7loxNCt9bjD+Tu64WsclCoMXvR5ZTd
         ngrQ89iIkUqzNkhKwOMjRqoox3npa4D/l6uW1ZkldSkJR5d+mxhlCk5m2uMYac7ry3n9
         7Dkk7ImCco8kCMjERjKgSMC75SqJTJibOm4Ehwc67NJJe/Asqa9kTf+aoE2NFEOXLH3p
         dhqA==
X-Forwarded-Encrypted: i=1; AL+hErEIhpsgoSXLIasFgTVhqENLzLHgNAvIubDrtmJAW+BZUU9dJCCD93RjTWp26n3wD8LkKLiCI9wOkeG4jg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8Mr2VKCX8BoCTO2NgsIF7SNuXSt6IQ4mmQRsVPokhzlbSnOQbj
	uKdD2iZ1L0uuIJ7nZc2waShaK/fwi9molNCaRWLL37rxKlh7mi+WfrC2BdNCSQ/3ZFE=
X-Gm-Gg: AZFdTZc5fuccfms6GAL/iuzA6W6yIQIgLnbsIO8xcPTxulOhE76HvOIeeWPFtkSd9CB
	m1V2Btc9Hj5oC/l9w3uRJG+eHYlHrNGGnGyOTsxA4KA4lZdeIg2uAxvhGvkP2YFF1SKpTrkYA3B
	YPxyprjNlq9tBnZY+006ePzXHqzGzTMHnm6aaFVTpThOwsQtO7Il2Tq1GM90baJgB46ut5yRxtN
	WBQm65JWAEx4VlB4NaVb2CXEZy7RTUHo5vCUe7mTb4uKpFhhz7kzCo2F6ApTRIZ5xiNwvHrg52F
	inNAVbzGswg6EHPgNnBz6vcTmHQvjqN3vH96y2XV8NUC9Dv5jjHeRPZosd7AXdIzHNifdNxmp/z
	N9Bs2tLtlNEBwZLKZMWh9LrUWsCQP9h7pWJJbXxvsE3qliRcvz9ftlJUzmMhvQ4fHcwud4YMJ6N
	1WdhABVJXIEsaSEx/n8E5/b5+AWimtAXtTenx4hZcKfT8eNfpU4iWdn6MrFeKFLKCpg3dxstY18
	7z1tQ6p57RKtcJPH9uBGYxEinDkgNDJCbRIXP+3Eu3vu5Q8NYFw8JOP3fwuIgMnaZ00OZB0vVGk
	+lLiifbekTdMka+dNTBxj15TDuhg2ZtNuQ==
X-Received: by 2002:a05:600c:638f:b0:4bb:6752:8400 with SMTP id 5b1f17b1804b1-4bb8881a2bbmr466455455e9.17.1795793220422;
        Fri, 27 Nov 2026 07:27:00 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm638871535e9.9.2026.11.27.07.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:26:59 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261123112053.20400-1-changhuang.liang@starfivetech.com>
References: <20261123112053.20400-1-changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v3 0/6] Add System-0 CRG for JHB100 SoC
Message-Id: <179579320502.2809466.14495045547675312839.b4-ty@b4>
Date: Fri, 27 Nov 2026 16:26:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=831; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=KeTHYnFw/STnF4LfJvFYzXH+5eeixkax9yQCIss38Ls=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcC519mZ7s3PhhjdU1Ta9iDvb9EsnX9J9MS7zT9yyI+
 4TT7Z7DHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZhIiAIjw8IVoqazU+8J5G9Y
 JieY8cJhmswq+5Nv1gu6McxPsV7F5MrIsLR9Q60Jz/nd+2Sm/a0K+P+s4/ASfdE5PDVN718s29b
 GyAUA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_152702_679717_258BAF86 
X-CRM114-Status: UNSURE (   5.13  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Applied to clk/linux.git (clk-starfive), thanks!

[1/6] clk: starfive: jh7110-sys: Fix memory leak in reset controller register
      https://git.kernel.org/clk/linux/c/42af5dd8aa0f
[2/6] clk: starfive: jh71x0: Move reset controller registration to jh71x0 common code
      https://git.kernel.org/clk/linux/c/fee5538fec1b
[3/6] clk: starfive: jh71x0: Add generic CRG probe helper
      https://git.kernel.org/clk/linux/c/32d9081dad72
[4/6] clk: starfive: Add JHB100 System-0 clock generator driver
      https://git.kernel.org/clk/linux/c/682283b20e90
[5/6] reset: starfive: jh71x0: Support discontiguous reset IDs
      https://git.kernel.org/clk/linux/c/b93db125dbf0
[6/6] reset: starfive: Add StarFive JHB100 System-0 reset driver
      https://git.kernel.org/clk/linux/c/d856a10191b8

Best regards,
--
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
