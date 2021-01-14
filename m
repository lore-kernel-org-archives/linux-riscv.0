Return-Path: <SRS0=X6bA=GR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1400C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 21:29:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 702EC23977
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 21:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 702EC23977
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WSEBb8m5VhEVMjVqsIt32tV+G17OnX9hSrKdrJaXM9E=; b=PPEgOHnsFwPGPjQyCVGVQgWrC
	ukqbfiOcQ1j061K/LAwtIrICiyzE2DcgBU2w7zQLRYA3eSb5u+LibJnkzZQButmsyndtGEyNIRkQf
	ldfjHh9TRiqZQc7myVxucpjBKrW0Dtp/tMxpHvC730nLkpUlBNquB6zvoNju4K0NxHIH13ANHC/OX
	jIlDgdOiuQmNSAZmBxuQ6V4dOMl/iz9rPb1/qWhwUxvnUUdMVOgYl/zJactxbFkOIC/+azYDfPll4
	9pRYKw4xM7oSrxTJ/w+50chqO7GAdCQ51ZKvu33BSiBvrrcB2pn5sm76Ifz17ikiAT2l0OlMIEvMq
	KyefQN2hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0ABf-0006Yc-5X; Thu, 14 Jan 2021 21:29:47 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0ABc-0006Y1-JF
 for linux-riscv@lists.infradead.org; Thu, 14 Jan 2021 21:29:45 +0000
Received: by mail-io1-xd36.google.com with SMTP id n4so14120684iow.12
 for <linux-riscv@lists.infradead.org>; Thu, 14 Jan 2021 13:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WtJvScMRoROdYxkyZoSvtwvRn1nW65J+gVM6ejOGgj8=;
 b=nFR2G9O8x+1aljnh/oy83Uy6YnsDT6PMY/B1DsPcMww2t+vyaVQSfFXlt6zbbj77ug
 jQsdQzf0gNBkFUbcpkmUftqWUMsKvj9o0enz4CN4gA1mt2Vo40iv/ksHWdZZh2LdV30E
 TkhBrSrUEmz/dfWOmIz0SXtTH6/SwhTm/LkQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WtJvScMRoROdYxkyZoSvtwvRn1nW65J+gVM6ejOGgj8=;
 b=I1Vc/CainqBONzIv+v5vQnlik8ZC9C44SDFzxbjLiVGs4Sf6fiYiQve8eEh8PynwfQ
 vro+HaALdzd61h2bgenvfRd3O7s4DZBuJIori+WMwd0Dit9Vv8IrmMSZ0t+DzXOiZAwn
 97tj8QMaemRZqzKFStZWtxGLl9HwvAJE5/yKBfUFShn+EvBCN2/jQN1u1kI+AwsU1SOR
 Ghl7xT7x6guQLiVfkBq7kijsRIh49rEbLX+jPCGhu1om0q6+mKQd2pwFo/jLShF27PE5
 YMulurMgSmw5pIe6fiGsorNZCTrahySAoMbBW1RnYmu2WiPjC9pqA8sqb9AD5kyTUiKG
 aKNg==
X-Gm-Message-State: AOAM532a/Kter80PAaxQJPxhYb1AbXKnGaUThROuBucIMBPFOOmMdlH4
 oD7V09eHMxZhj6Eq1DaW/XcjXQkVcPElh9CMI9z4VVUJuM83
X-Google-Smtp-Source: ABdhPJzS1quBPMDdHMSO8t4gQqR1hvUj8S3VJh8l1kGd26XJRqOF7krRm71rEKxLM7Esfz01lmrd1u1olDynmyGnpw0=
X-Received: by 2002:a92:90e:: with SMTP id y14mr8183078ilg.219.1610659781191; 
 Thu, 14 Jan 2021 13:29:41 -0800 (PST)
MIME-Version: 1.0
References: <mvmk0ssu8yi.fsf@suse.de>
 <CAOnJCU+JmDaU1f3hAbyjR4__TVHJbjnZZ8th25i5Q-et_UxXeg@mail.gmail.com>
 <87im8154r2.fsf@igel.home>
 <CAOnJCUJg+-4RTz=6JQDU_c90W1KpNkvNN=riLfHmtwtpHAh0yw@mail.gmail.com>
 <87czy726w9.fsf@igel.home>
In-Reply-To: <87czy726w9.fsf@igel.home>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 14 Jan 2021 13:29:30 -0800
Message-ID: <CAOnJCUJKn=TcbiVQyjGt_k+O=RG0q-poxxYxUOEWeqbNBzWBLA@mail.gmail.com>
Subject: Re: EFI booting crashes
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_162944_670169_C4B29528 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 14, 2021 at 1:40 AM Andreas Schwab <schwab@suse.de> wrote:
>
> On Jan 13 2021, Atish Patra wrote:
>
> > efi_var_buf is at 0x200b2338
>
> That's its GOT entry, not the variable itself.
>

Yes. efi_var_buf is a global pointer so it's location is in GOT.

> Andreas.
>
> --
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> "And now for something completely different."



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
