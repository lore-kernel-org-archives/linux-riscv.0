Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DD3F54AC6
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 14:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cYnjnK8vPNzKQ+JqvE54vlxyugFm+THgd4xRS3ngkH4=; b=bQY45fppRmPhLd
	puELA8zEmPjvVY8yMct92+mYZjB25wrVsU+1ikUYNLOUZuQ0m5ZjPlu1IGJhQuY0iqRoiT2mfN6w2
	S8CbQp+Xu6/H5QpikDk8xkmFUmhKpYmaJvjLZiUNp0qQLPull+V7Yvezmv4Amokae7AU5EjVrSDQw
	86a4ao7cMBcHkdFRHwpu5V+6PCjgrlJjmDzJLIv04a9frwyLL/rG91qiNiSN8yUsIQ/sVl9Ju4kXa
	ByCEwAp7jiYQG1liNK/yccfMVw9anBMLSPafdv80M5k2Q5AYa2zrEZ1aFF5K36o8sytnuS7beLQBk
	wfXQRZW1WPFM70AOS7FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52yv-00000001gAQ-0Cnm;
	Tue, 24 Mar 2026 14:43:45 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52ys-00000001g96-2pB9
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 14:43:43 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5a1307438ddso4272395e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Mar 2026 07:43:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774363420; cv=none;
        d=google.com; s=arc-20240605;
        b=jliurJcbBUqhyVtr5TeTAYsgMvl1Csks1NMqyMLg98I2IM9lv6pjf7i4IfdNWJbW6y
         SmR7SDTY3WVWFsisyUECEOrs+MMfbYdx2F1Alodxjz5vVwUMyqjuBBFX8KCYOaosKBBK
         4z7pUWb/AUtCqBt2YTZm06wdZU8EXzBCJ7xoIUce43d/Amwh44bRqT2Fq+7H36c3gES2
         X0VXRFZgKTi6UX5f82AZzH6fk4DxL3FfMm0H/IPuc4Rbt/WoFKGiMaPRkRzLJHmENx+9
         hPURoMQ4Y2buAc7mNfzka2ZbnTUPq5hNf4SfBPTmOIRcnyYzx2/eQc3fxJ+0t0dx0Yk8
         1rzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hIVOW7GvJ1rBpno57ze6hheubFB8F0UsfVHddRNTrz0=;
        fh=uMgmmqKQKgOhw/EU3tNThMQHuscgxg/lu9HxzjxQpA0=;
        b=K1FTFlVPgQRL7BTihAFfPm7NsHnZDFqotxaE0uspyvqlV2QSIvEEfqG8qUkaCZMWk0
         aYh6zEf179VS+CHQM9tFeJ9UaDpLfO606hDrm5dInGDrf6TtYWikySgWG4VckOW5RvVk
         64XOSCNbFXcykaSOUmJEIqqra+3lgrsG+qbUM1cJVlD0qdQBXRFm0BbvvEKxg3rIV/u5
         zmwxQ5oz6Bb+U7XgW+CaUi8hipkzPG/S6EnmwhAMkkG5KI2x2dGLDJ3EyIuLuHYxyc3w
         X6sTnz7BXcyk2wMNNggYT1GC3vjosxGySxDzL/MqLCjoiV2fYUQuKY24Dg1Nwg9KrU0x
         OTPw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774363420; x=1774968220; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hIVOW7GvJ1rBpno57ze6hheubFB8F0UsfVHddRNTrz0=;
        b=IGweu88WMJRVgjukkxmZkcxd+fqmlHLkLZ1qLOxcXboVKTpbBD8kE/m7otV58YtUyj
         UEqPIcbMPE5gHk2AId6NER7r05lwNWUaoyB46yjz+BzDV6/DzK7SmHnj8lAtkCB6cAar
         RK5QxRRcJ6MPro2nsAee1tS/6n2Tj/dEQUjxw+RnKHIv97KDW8xopmhcJRvJiMH0oWIx
         0KbkZGOXw4IP3A8YLuyVWYEWfA8SCcIQIhRSycAcb6Nyxq9pYLDKn+0MoDJS4bTon+wQ
         nZS/OTzrmDpVI16bz/hPt6D1u32yyvggLHThqAO/3hhv39K9C0HyWv1rrUN5VJMwpr1p
         P7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774363420; x=1774968220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIVOW7GvJ1rBpno57ze6hheubFB8F0UsfVHddRNTrz0=;
        b=GGiVSvwGRGnsvfqmDCVQ0p1SncDjIv/rvhF5bwEP2QjJVZMbWr9XZn36DvsoyBO14V
         UHKc0JMWK7Z+KDuemZ2rkr6UssM9lK5X0jIVhix7nGPRtiKgER8Z2ZQCJOTQej2/jsZQ
         IMN00Fbr+FbF/j2NV5F9pZUQ7PEOJWCDZW+XVzY25LpRLrh5fkjJOsUwEoR8AOnrlL6Y
         GsCP9MDJnZBV6FhJ8lXATV1dy72AlhSpgYN8IQnhJ3LWVQ+qCOPvrE1ksNoP25Fj2v7+
         env4SaeyMFfOKPGBLLwIRHzBiwAxa89jwa8eWjWi2WIHwK9iqLQVDdlEEDisBHFK+gvn
         JCHA==
X-Forwarded-Encrypted: i=1; AJvYcCVftw/PG0p/Zk9dlbx+azmN8eyvSTLy9pM5aKrRHwfztuxu/gQbc6RlWoaTatEtIi5YYYK56rI1tqrgkA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4U623mGhSV79I77fNckOgNxpQWDRHQuJNxWQs1+GKYm+01oN2
	jMRUsmOFOLDxlUdD5jFzJ38VLR3KXAEmWteMWWrOgcE5XKPtFUKS6SLZt+PA8jdB+Zbms+5/73N
	K6ITPIRbyFp4nRdx5MTXT4n5hecsCbQofbADXrr1Xkw==
X-Gm-Gg: ATEYQzzKKliVqsqUvE4hvZz7AaHrS8HSG8sRvkdQsgf0Es0jU0e64pkd9Lxn5k6Y7nn
	xFPXKzphDUoLGMsoJjm8cDSDGaLrYufpu1xy1lEtVIn16foYpgVyj2L+LTASlgRoBkBTkSVrSuk
	itOukJsx9fgf9a3EV8HzNzWdjYqOmH5toNK8nHehSg0AgVlA8IWwcJYhiFRyQ6CW/ltuSRSESQA
	xCLnF8Um7MDDhJrQHyOgrA+BRFQPsopRUIzTDS6KpqFWtxhq4w61LIq0I4ExzqP3LbnoQ7sBmum
	MKkX3UDzVm50jhL+pMU=
X-Received: by 2002:a05:6512:3d19:b0:5a1:ea0:afa8 with SMTP id
 2adb3069b0e04-5a285b5dbf3mr5614955e87.40.1774363419882; Tue, 24 Mar 2026
 07:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com> <20260323-orangepi-sd-card-uhs-v4-2-567c9775fd0e@gmail.com>
In-Reply-To: <20260323-orangepi-sd-card-uhs-v4-2-567c9775fd0e@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 24 Mar 2026 15:43:03 +0100
X-Gm-Features: AQROBzCfUpt1ZwyBkuHwcMICLYcYLjpRhE9JmTUslsPEwhDJl3mjCswU4lxnLwg
Message-ID: <CAPDyKFqirdKWZmxO15B6MvH75zsQgiwM-6Ux0PiCuxZsfNBUfA@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] mmc: sdhci-of-k1: add regulator and pinctrl
 voltage switching support
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, 
	Trevor Gamblin <tgamblin@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_074342_740328_90AEFA63 
X-CRM114-Status: GOOD (  11.91  )
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

On Mon, 23 Mar 2026 at 11:19, Iker Pedrosa <ikerpedrosam@gmail.com> wrote:
>
> Add voltage switching infrastructure for UHS-I modes by integrating both
> regulator framework (for supply voltage control) and pinctrl state
> switching (for pin drive strength optimization).
>
> - Add regulator supply parsing and voltage switching callback
> - Add optional pinctrl state switching between "default" (3.3V) and
>   "state_uhs" (1.8V) configurations
> - Enable coordinated voltage and pin configuration changes for UHS modes
>
> This provides complete voltage switching support while maintaining
> backward compatibility when pinctrl states are not defined.

Adding pinctrl support like this should require an update to the DT binding.

Please fold in a patch that precedes the $subject patch and ensure the
DT maintainers are cced on it.

>
> Tested-by: Anand Moon <linux.amoon@gmail.com>
> Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>  drivers/mmc/host/sdhci-of-k1.c | 72 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
>

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
