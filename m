Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BE2CA9EDE
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 10:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYu7iwrUbXUn013jB8n105BvGj2BCMX4fnTm9ntOZA8=; b=dGMZ9dBjJdaOAr
	NBpQSfvbtVDDqiCiPttAS7A8dLEz2Ab99BkATqndrkKI2Vn152IyeVlzYYPqhji4wSqZfJK9MHAnO
	L7YZ8zoY7KWGr8kpeb8KPtnUqYmQ287TXQTmVEMyw3lHWsVy0rUi+V1K1sCaPdkqlhEcsge8JOu2i
	gKqwhhWKbnYQgrtKpQS5imauIlO0nM14erFfPnjR0EKCxR9p1jTCMb1diSBpLukRi/tQuo4mxr3Ct
	C/ULTM2OsxjtO1GaLPIs1rH5r9sr3p1gLRmLFymwXDvG3+H317Lu+J44scmymUDvouVXyHD2hMr3j
	+J09f6veadwpi6ShNg1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDAQ-0000000ACwz-43Bu;
	Mon, 12 Oct 2026 10:22:02 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDAL-0000000ACpo-47c6
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 10:22:01 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so12866005e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 03:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791800516; x=1792405316; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TObjkOWJiuzdPxhggCcJOM5eP+x0qGNWVjeE3CGp4Ak=;
        b=QRGnYfTo+RPiSMqoBt/+3igqASJ7gG8ecENITmtKrQAwh8VXwYR1hSRDQO+yVhMiYh
         Rk6waPjvBpg3JGS/4+m7NKJ3ms9ylHXvYnJfZXq5VrskPZwFhFLqtpRen+gYPPCJVqwQ
         XZTOTTn6r/ezTk3Bo7JI6IWjAQGBItRLX3VCkmgqw6QLGDDjqBYArG7iu9/5oUrZjCD/
         IdJmEuBWEF0SBPqrUmvgtIr2zvE4/oQnsnVUb6eYb/OvowsaUG5Cfpu2lT/QgONWyMpV
         VTzJtKKzuD/Q8BlLVppQ8umAUsg2guxQyJk9pQIgHcJYrF+CTrIbEB7Nl3OKv/3k8HnX
         6i5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800516; x=1792405316;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TObjkOWJiuzdPxhggCcJOM5eP+x0qGNWVjeE3CGp4Ak=;
        b=mcmzBEBPP+9fnB1CZXEJgxvjw31DLQ8Q3zJZcVAM+0bIyaiyzxEyVua05iFUN6FUWS
         XV2FOq7Oe6tC7gOCt1yV1PFqnj2eyUpbKGY92hVYmPgck3s+zN20mAzPK6ccEcJuIdM4
         /h/xFx1K2n3YIyNKkB7zQ7YJXtMpDcAUbhujDd7xTYcXb6BgpJg/OUhSTRHEcHoi8kGb
         GZ2FBzCvRDIJpwnKaedHHzwFu3kQ3OzjJzBkWYTmrfFCm4uFFZS/EKi+mUeQxrEROg0L
         foPVRcnId08cskKJWHLs9Z7yxzA44RVtLTvAi/HYABN3u1VVfFnTwSc7H/vGyBMvbUCB
         iKRQ==
X-Forwarded-Encrypted: i=1; AKwUvByfb/d92vIgHAJiTKXUAlSFramdmc1fEd11pD7A74Paf8YU0cukLVAxkkHR0ndTXtIvaHs+jJ8lH5UqhA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJogFZYKmhhpTPXf2gFLr6M8rM1s7G/fGOlJD2qjE7J1nuPJ+tm
	VX9QgyI24Xw0p3swzzAbUlLoMTy8YSRXfg7oqsgC7N29SgD9zVaIbvNG0wvL89H01mA=
X-Gm-Gg: AYBFou2z7+c/5K3CaDw8ylIlWNhSpdaYxDc0nl3ZTv4O3pyDs6VF0eI3rUMLqQfsbnu
	iiYAW24PEJBIZyIv12TLOtJMCTsI3r/JnETez0AoSe2A86MOy82pgEZ50tXPvvYi5OH1t9P98Gs
	D2zEavtOefN2VgJx4pPhH+SNKdoSLBIE/eiOCBbkNwc996foH/fNPicMmCjMadJEk3mI2Pk0qIY
	kL/Gi1UhnmRuRJcvNDI5I7nKrjXBPAF2+sLiovF2o9LSIfKY+sQvmpIuNV7QEp+klY8cmWdMVCv
	isovv9CchK/YTJG7bnD6451oGXHGXBexoBklgoCo2dLUBe8OqFlcJlHCjoRzn8NG5k+2v18Wozh
	WoeOUb5Rgvgeq/k6GhRi1eyu5f8UsOWjSDm55uNLUVgVjM6sDUkLx83oGwXSohX3o64r3vdHy00
	uXD53lEMRr/uD//UQgFeQtdrXmh8WF4vpJ+nSr3mnPNqi2n++QA7LE8Mo4hr4ldcRSSmtnEBiZs
	LQFmbVzk+DPc5+Img==
X-Received: by 2002:a05:600c:8b04:b0:4a0:1e37:ae41 with SMTP id 5b1f17b1804b1-4a18e4d67edmr165061225e9.24.1791800516029;
        Mon, 12 Oct 2026 03:21:56 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abd57fsm18110592f8f.37.2026.10.12.03.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:21:55 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v6 03/15] reset: starfive: jh7110: Match auxiliary
 device names to jh71x0 clk driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261008123338.11081-4-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-4-changhuang.liang@starfivetech.com>
Date: Mon, 12 Oct 2026 12:21:47 +0200
Message-Id: <179180050741.66744.17520660789962324320.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=zFD2E/SM8xRGAjKxc/G95StFEui4tWc89ptGvsdyWy0=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlntuw307BpVwiqmXA7fLsjw7rJaS3+juyrmlwn6uW1/
 FnptmJvRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbiFMjwv+LMKi+tDwy7fm+/
 EMf+TJu3Nrzvr4D3bFPT+WnFWVMXrWP4zZ4+r0d/HZefj1FolGucvvxHbl2NjM7gLf+ezDHcUcr
 EDwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_032158_084048_A40D3A2A 
X-CRM114-Status: GOOD (  16.47  )
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

> The JH7110 reset driver binds to auxiliary devices created by the
> StarFive clock driver. As part of moving the reset controller registration
> helper into clk-starfive-jh71x0.c so that it can be shared by other
> StarFive SoCs, the auxiliary device names are now prefixed with
> "clk_starfive_jh71x0" instead of "clk_starfive_jh7110_sys".
> 
> Update the auxiliary_device_id table accordingly, otherwise the reset
> driver fails to probe.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/reset/starfive/reset-starfive-jh7110.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
> index 29a43f0f2ad6..c936e61156a2 100644
> --- a/drivers/reset/starfive/reset-starfive-jh7110.c
> +++ b/drivers/reset/starfive/reset-starfive-jh7110.c
> @@ -69,23 +69,23 @@ static int jh7110_reset_probe(struct auxiliary_device *adev,
>  
>  static const struct auxiliary_device_id jh7110_reset_ids[] = {
>  	{
> -		.name = "clk_starfive_jh7110_sys.rst-sys",
> +		.name = "clk_starfive_jh71x0.rst-sys",

Does this break bisect between the previous change and this one ?

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
