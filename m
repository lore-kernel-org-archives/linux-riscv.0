Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72E3C46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 18:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qmUreSkXqjdfRjgYdHazWLFf2F36u+uYMSFidqxJ0LE=; b=4dU94+Z/usxa+M
	qBzDBDBRfftaMcbOh2kwK5Q+N4ULsoNpyrMQk6rrws2Z3jLEPCQvPRqP4K23PbP3TrhpAqY6t6f2J
	tG1VRGsEdqO2P8cZ6UsmVXp+4Lq3nYonTu39xgDUluUUfkRAcbjejCEu55kjHpmU1rsE+LABH+Slx
	yl6tgjJYByXMC0coYz9uJPY0bLsQvoWTMS3FuW7Oj4olj3eeh623q6gj8myIWulWuQ3klNs6JwKM0
	D4g5Ldr5ppPJ3LVlAROBCx/UrMbQUwDpnDcPKq8qj8EHYbE8ZsuyHSactHkDMqKahEXFQb5ekME+j
	FZa0h8TrdTABGWGwmXYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSiEe-004k4p-0v;
	Wed, 24 Jan 2024 18:44:28 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSiEb-004k43-29
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 18:44:26 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a3150c9568bso45104666b.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 10:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706121863; x=1706726663; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZKG+8C20f7hivz53jJBSHChuZfiFBOGPLHSUtSSkGc=;
        b=Oz3WGE/AOCv5EzRhykLFJQfKjlcZ5pgkxXVK/IGqVtPhKjf/HqC1oOOD0JZcglLwdi
         3V+aKkZOg/9WGC2qEQBPPOx4+K17kDE+B+jbMGGZ/k8czLNzzGeU8JhSKHS14bLn8JIy
         3R51RssqcfvGOaM+a5WyKiiZLkFUsquDlUY6yTq0Kp64koJ8w5BGiuhzjd//LTHyBoZh
         Q1tAe/M3ugLBcPUOPudON9ZvckqCS4HQUb8CVmr3QXJLyjTqneP7VeYT1IrctOwTpTtr
         uYef4PPAxrYD6Jbmop9++lfYPOWU9GbyukWM2tKKAp4GW0KtLmvflPGYbK0LwvJXxFlb
         3kAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706121863; x=1706726663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZKG+8C20f7hivz53jJBSHChuZfiFBOGPLHSUtSSkGc=;
        b=Grp5I5xkALUmCIDUDPox7Y058XuQLjMyxvM/Wp1xEH7Gv6sFkAC+ecRLJng/0OC71Q
         zENoU80zIdhrlZeP6SA8aJHt1O0Sy/hGCmEX8vglKPK9FeGDyBkuhrP1ICIPtg30Ylzk
         IP2b0YorHAWSl57xUblOg69itqz9I4c2UgXnWLgEqNJt2kq6GdpcHNrZ5az4X9YKrKdN
         YDlM0srRKif9T41ud+LDcyLGj+SqG8BhWnE7A5+SifRYBOQR436C5R2Rr+cpPos3tU2+
         GTKD7/xTDBVM0G/b7qrRTOV1VJzedESrzxp2G+AEpTozn1bHcCN1bz+b3lQSifSKmpcW
         SEEQ==
X-Gm-Message-State: AOJu0YwWFD4Ju/3uHBsIe0UaPqo9V6fDzLCl15c7e7sdek5nlpJ2vE0D
	1os2TJJ+NWiD1FKeXeEUQ6QqOS2sQeKpvN09mSs1LsOyyrq225CH
X-Google-Smtp-Source: AGHT+IEIWgR+2ylkPSWyye/s+x95/46mpCMI5+6fb9Wr5V2XtmpeW8QsUJFkC7/0P9SsQVxcUlIiCA==
X-Received: by 2002:a17:907:d402:b0:a2f:c8f5:f706 with SMTP id vi2-20020a170907d40200b00a2fc8f5f706mr983785ejc.232.1706121863206;
        Wed, 24 Jan 2024 10:44:23 -0800 (PST)
Received: from andrea ([31.189.8.91])
        by smtp.gmail.com with ESMTPSA id qo4-20020a170907874400b00a2689e28445sm151657ejc.106.2024.01.24.10.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 10:44:22 -0800 (PST)
Date: Wed, 24 Jan 2024 19:44:20 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	paulmck@kernel.org, corbet@lwn.net, mmaas@google.com,
	hboehm@google.com, striker@us.ibm.com, charlie@rivosinc.com,
	rehn@rivosinc.com, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] membarrier: riscv: Provide core serializing
 command
Message-ID: <ZbFahHxi5laA6CbI@andrea>
References: <20240110145533.60234-1-parri.andrea@gmail.com>
 <20240110145533.60234-5-parri.andrea@gmail.com>
 <aabea058-0088-41bb-822a-402669f348bb@efficios.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aabea058-0088-41bb-822a-402669f348bb@efficios.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_104425_700098_9F3B47F1 
X-CRM114-Status: UNSURE (   9.27  )
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

> > +# riscv uses xRET as return from interrupt and to return to user-space.
> > +#
> > +# Given that xRET is not core serializing, we rely on FENCE.I for providing
> > +# core serialization:
> > +#
> > +#  - by calling sync_core_before_usermode() on return from interrupt (cf.
> > +#    ipi_sync_core()),
> > +#
> > +#  - via switch_mm() and sync_core_before_usermode() (respectively, for
> > +#    uthread->uthread and kthread->uthread transitions) to go back to
> > +#    user-space.
> 
> I don't quite get the meaning of the sentence above. There seems to be a
> missing marker before "to go back".

Let's see.  Without the round brackets, the last part becomes:

  - via switch_mm() and sync_core_before_usermode() to go back to
    user-space.

This is indeed what I meant to say.  What am I missing?

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
