Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B6FC678D4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 12:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yx3dCzuzgHlPU6b2ajOVFJB7GteoJa7FkhOaBe0/s6c=; b=Waye+nzWak+UC9
	2I7G5RjGDk+/EUq1v266zf7xaM0l9Fv2vW2hjsI5gTY6HdlQPM0qkOrqgmQcuCu9D/rUlvSc6i9r4
	hM570zvc/8VrzpBxHTwufY14zNUtpxobLlYmT03j4u41Aeh6+wZ5bIhTFCNrdHVyZGou0kLRLhU8w
	itVpEU3BKQBmu5lbTS/8VkYRSgANoGxj/GMncBQo9hSZK8G1grCsKT+f6HtQvmgcWOEME/5+F4aWw
	P62kOZkQ0QfvN3sbidZlX5HnTZamIA3Fez3wiQeCklqs/hvzHGhVz9X85+WSD8T4niPyU6KjUR5ou
	4ikx12Gl0/Q28NzpCBJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZWnb-000B4c-5N; Tue, 07 Mar 2023 12:52:11 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZWnX-000B34-Tf
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 12:52:09 +0000
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4FDB13F22C
	for <linux-riscv@lists.infradead.org>; Tue,  7 Mar 2023 12:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1678193526;
	bh=nmWr6ekGjQZxJ+Q7zdHZXafHGNlXxBrbViGkz8bn1+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=HW4d0JXq8/NOQpK+uYGqtLow9FuTQ0hec+KBDX0jbd3ron+mwaz/ZZ/kt1UEqF5+L
	 BvwY+XN/SH3QEBLn4rvul478UcfBrM6S27xWZHk81tvGUqVEMU7rLpy9LfaoXXnlzO
	 KzcAVjGv3mwRx2l11+ogLbjQReZN9GnYBHHAaFgxImTO1fseHRAqYg0zHPnmMrUIUc
	 PutfpxWF/RtYVZcm0zuq+R/mwRrkhJAbiyWdB3EBcsfouvHd/6CWk9QXlyjuBA2UwK
	 4tuxjD10LsKQTVoyIwkySdOV/l3vvQVggsW9nW6br6HO9c+3xkaOFq7dWSnlaEpwyd
	 8kPpErUXrWQ5g==
Received: by mail-qk1-f199.google.com with SMTP id d4-20020a05620a166400b00742859d0d4fso7327382qko.15
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 04:52:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678193525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nmWr6ekGjQZxJ+Q7zdHZXafHGNlXxBrbViGkz8bn1+c=;
        b=sVrXY4YBEcJ2lTtrbJT5DwecXlmII6seM364TAKyvbv13v36aHPCsi6uNYlRzjDjx/
         EhF+5h/agys3wsKk2zJq9hK8lX+C3gVFSpVOIYevmYZ4GKDKG9/w+yxYiK2tWJTWHsy9
         sdafngR7FycklaQP1FJnzxYMHrUxeLw/L9b85gtRhMeekwQcGEVcNAG+oUYQTfc6f9+B
         Y/HU7Bncf8WmxvRCqMqVEWVqqlQqfW+j8CtKrQZIcnRduJYdNBLyWP0J2lWQ1Q6Uk8R0
         4nI7gy+5lVwBbuVPogvyraK+CcRrFmbz5wCpwX9wz+SLhT+3SnWpAstm/RT1Ig5/V5Kj
         Mijw==
X-Gm-Message-State: AO0yUKUZGbIW924wE6Fh13BI4/xVv+uB8Kxg9iJvDRTfHrejH2sTVXI1
	8Rdu/WAfMG7NTzOdIpEL7uQ/NkfDUxFj1BUtkFaNruyQcEtPi2tcu8ceMmRG+1Y2a1q9CDAJUWy
	kah+0LFsVYCzbL5wckILsZ0Z9Tmk4nNgzJn3K9O55v8uvd5vXX+5vq3tpAtJ+5Q==
X-Received: by 2002:ad4:4e28:0:b0:56e:b446:34f1 with SMTP id dm8-20020ad44e28000000b0056eb44634f1mr4079228qvb.5.1678193525414;
        Tue, 07 Mar 2023 04:52:05 -0800 (PST)
X-Google-Smtp-Source: AK7set8EvyNc/L3E70dvuWathZFkQOqKVEkT1IIx0wT1ixr8AJw2s+ppYU5aOJDsokfzAi4ghyW4HUFDQpSET1IIO54=
X-Received: by 2002:ad4:4e28:0:b0:56e:b446:34f1 with SMTP id
 dm8-20020ad44e28000000b0056eb44634f1mr4079223qvb.5.1678193525129; Tue, 07 Mar
 2023 04:52:05 -0800 (PST)
MIME-Version: 1.0
References: <20230307024646.10216-1-william.qiu@starfivetech.com> <20230307024646.10216-3-william.qiu@starfivetech.com>
In-Reply-To: <20230307024646.10216-3-william.qiu@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Tue, 7 Mar 2023 13:51:49 +0100
Message-ID: <CAJM55Z_mzzAW52RMC6cfgiKNLicF9ip74csbsrbikE3tN+taaw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] mmc: starfive: Add initialization of prev_err
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_045208_249973_59DCE374 
X-CRM114-Status: GOOD (  18.21  )
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

On Tue, 7 Mar 2023 at 03:49, William Qiu <william.qiu@starfivetech.com> wrote:
> Add a incremental updates to fix a bug that prev_err is uninitialized.
>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Reported-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  drivers/mmc/host/dw_mmc-starfive.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/dw_mmc-starfive.c b/drivers/mmc/host/dw_mmc-starfive.c
> index 40f5969b07a6..dab1508bf83c 100644
> --- a/drivers/mmc/host/dw_mmc-starfive.c
> +++ b/drivers/mmc/host/dw_mmc-starfive.c
> @@ -51,7 +51,7 @@ static int dw_mci_starfive_execute_tuning(struct dw_mci_slot *slot,
>         struct dw_mci *host = slot->host;
>         struct starfive_priv *priv = host->priv;
>         int rise_point = -1, fall_point = -1;
> -       int err, prev_err;
> +       int err, prev_err = 0;
>         int i;
>         bool found = 0;
>         u32 regval;
> --
> 2.34.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
