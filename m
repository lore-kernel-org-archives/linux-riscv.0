Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9577DC83F3F
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 07:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HFP3dSQTdR4kqiwwtPQe3JWsDV3Pp3wBBB2hr1cZmMw=; b=HrOGtCqzV3KkOq
	b8iC0Rcv8vIDtcaS4Thk6KhzFuENdJkoVG18iQOMBiCk+fSdOcORiwjt5U9nz8hoUkewD1lqkPR6t
	ZaCWlGltcmNOXGJ+Hk8ceX8JTMQhTkOnz1oE2MjCHQ00K7JyGmP6CeMrs31eBxC0iJCYBcqa9AOzb
	MrCx0uI0TpXBCj8lpRKoZb4tXqWxhME6ZfZ92e+cvX/pgkenZxTK1KoHySXkPxLkVCLtgGg7yPOKE
	meIhl66xK7xsKTnsQihkjK8T6ER3Wc0e0QOrLSnW6tonXIS6SGZNsAohGoQcG0xnnuL+BiQmxROG7
	fUaKqx/CwLoQvUTyw8pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qd41V-003TuT-00;
	Mon, 04 Sep 2023 07:29:25 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qd41T-003TtQ-00
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 07:29:24 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-52713d2c606so1432382a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Sep 2023 00:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693812560; x=1694417360; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jKhlI3usGbNsTVO7PIVpY6CjvMPzb/I9CgLAi4HhSko=;
        b=lRsu/vZLsmA3e96SSc7jGXGyYF3afV5KO8kxGA8KVH261yI0edNW47XGzEokBNtaaV
         kO9CQZBkR8fCESbOpx81+qtBsvrqQkwPRks/9VVfLu9N8uhB+TiuIfzpJRBP7ae7qRcM
         68M2bRPWzVuopXHRe+3mUmdtOEUdwZbd9IGdfj0jsTCjn/JEMK8g6h9Merd0t4u5vKT3
         Sl0XJ5Rk4hbk4OuxHbOMncdKSdlMLKGOn2cEN+o9yNM/tJ9vULlZ5We1+8PwxfZFLey1
         qlb+/pnNTitDAYfK8BKxOFDRXXEUnWAOIMlSUb8EiyC5DQuhY5lCXb3V5WyXk00khH91
         pulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693812560; x=1694417360;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jKhlI3usGbNsTVO7PIVpY6CjvMPzb/I9CgLAi4HhSko=;
        b=Fbbg0tFeK65g0SIJBDiEVbVyavIi+o9MYDwcu2jjm4CqjVTIZ/gdY4ZjmYtXMwTMXr
         NPfoPwbM9ajS5l4CKXcfZuw6a2fiCOTtjq1XnM5Jls16wOYWRz7TT/ic8hDHYvFTXBIr
         nPLXyKv1SR23vWdAdsDxNSO78VyyVRveWvluT67eZ+jC0gZsNqyUG1Qd0QcQ/2HgD8yy
         yoUJSkId9BgVjWElepjEw+dHqFkCnAcT8ESgx4x5GzhAuKylN4Ae4YU8UJ3CP+mGkc8c
         7T1zUvG4nrA2q0koSS3ZDOgMNWjJUCXUk6w09eg1J1uAFHg2602X3l0UIdRENG4pgDyJ
         l+5Q==
X-Gm-Message-State: AOJu0YzTp1j6GVoRrJ2HbT0DvoNbBi4xAQebj0beNVQ+8DUhZijv1iRM
	HL/5dhEPUqS6c529C3XmYiV/ng==
X-Google-Smtp-Source: AGHT+IFBjCYo1YPy4nz3cFsxiXZbYiH/IWUi7sSU7m3XJsicDTRb+fj5K5u9eAc3mkcfcfstepxAJg==
X-Received: by 2002:aa7:c685:0:b0:523:2e0e:5462 with SMTP id n5-20020aa7c685000000b005232e0e5462mr5727816edq.42.1693812559730;
        Mon, 04 Sep 2023 00:29:19 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id w25-20020aa7cb59000000b005222c6fb512sm5459282edt.1.2023.09.04.00.29.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 00:29:19 -0700 (PDT)
Message-ID: <0793a309-42bd-94d3-6002-8be6b2c13f6b@linaro.org>
Date: Mon, 4 Sep 2023 09:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC PATCH 1/3] dt-bindings: reset: Document th1520 reset control
Content-Language: en-US
To: Kwanghoon Son <k.son@samsung.com>, p.zabel@pengutronix.de,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jszhang@kernel.org, guoren@kernel.org, wefu@redhat.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 inki.dae@samsung.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20230904042559.2322997-1-k.son@samsung.com>
 <CGME20230904042603epcas1p11db03427cc5f434578d29dd51bc3ae85@epcas1p1.samsung.com>
 <20230904042559.2322997-2-k.son@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230904042559.2322997-2-k.son@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_002923_113772_823FA0C1 
X-CRM114-Status: GOOD (  14.51  )
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

On 04/09/2023 06:25, Kwanghoon Son wrote:
> Add documentation to describe th1520 reset driver

Bindings are for hardware, not drivers.

> 
> Signed-off-by: Kwanghoon Son <k.son@samsung.com>
> ---
>  .../bindings/reset/thead,th1520-reset.yaml    | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
> new file mode 100644
> index 000000000000..a56d77af464a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/thead,th1520-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-HEAD th1520 SoC Reset Controller
> +
> +maintainers:
> +  - Kwanghoon Son <k.son@samsung.com>
> +
> +properties:
> +  compatible:
> +    - items:

It does not look like you tested the bindings, at least after quick
look. Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

Drop '-'

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
