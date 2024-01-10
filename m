Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B4BC4707B
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 19:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uDyfPj5meKnhE7gOoJr2s+r0i4mIjALduDN7iPHiYJQ=; b=oDLfXGHP+ckSRU
	e1fxsAikrz2bss8lKHxjIMliZ810eJoJrAp4sxQmbe8wKGbiwFVP+EWmVb57AcO45PRShx6XJ37Ye
	8VyADZj2N8uohBdoaNEKwsohNRVvtDCRfxYWQwmuHgajPA278o2JVOqAuha0yKXpao8keHNaiZiz+
	+Jm4kzA9jI34cIBjSTzO4Z0WCZ+lglX4OgMJ2ICg1owVKymsRo5twUWxNxtF+LJUPo6VMT9leyHP7
	im18tESfpQZNbnw7T4g745+PLNtQQz0djfU8xgIkQE1HKrn9nAuQTCNnT7Xae763x89ZR3CYe647o
	4j6o9zuoMWYgqIIvU2xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNdtl-00Dawi-2q;
	Wed, 10 Jan 2024 19:05:57 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNdti-00Dauh-0D
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 19:05:55 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a27cd5850d6so483319966b.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jan 2024 11:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704913550; x=1705518350; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XZpsZsIRN+bzHamFqhhdXU99QlmdJsaeUiZLcX/1HHw=;
        b=XxneEdetF5sRnlMH3XyQcN+WUPXXGm9WV8xz8TaeRuFJbMyvPOeR/JKkNpPnLa7vDQ
         IbN4+WzsT0IgZ0+2SVt6Yg7+j6Y+X2AMhGxhnNeooyBdgeB/NfhD+ZXgI84mSXEzK+69
         RR1InbYFbSCNGzLYb1uWlHnb85uOYjkRymt91xSQw8xEgPpbi23JVoWvkczMbX8o9xfL
         kdRv4fRH3gV9+FpU9CMX3yprauc3trNzumCZGgS88S/kMVZjtVXiqkQVHLz5TFYWc0Mm
         plm1GXq2BB6eOUKtlLmE1fXTV17Pnf3AxP5FZo4m4bTOqYRxRyA2zRJONopvqBpkz07e
         niFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704913550; x=1705518350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZpsZsIRN+bzHamFqhhdXU99QlmdJsaeUiZLcX/1HHw=;
        b=vAp16x5K7X/SQA2wbvsF36ntuTo+VNaEuRTK0Xz+6KrVMu8lQSXLLjR7r2nS09s/mt
         BRsiETTaKRCOmK8z0az74wOTG+RP0Id7y76URFRA0LnsW/qdM7zJExiqJv7ENow5SKNz
         /5lpSwzuPHFJMxj0arnS7UDLLxiBaKH2OmPfvqJdqLVEMlJQO1Qzl5lX1J0tNI++8Y2U
         i2YUdb8oW36eil3L3L4HcPz2jt4Jcm5f+QqLX994p1BgunU62lSNH6Uwl0bGAETxpoYB
         MgcaOIBvu5c3MY51KCXC6nSGXRManuGdTWdu8i3AhBh0JjeCBiDr0hqw/RFQtZu3HFDm
         Ui9g==
X-Gm-Message-State: AOJu0YyJZW0rn5j4yx1SzYCF+iQ84XqNeHk+KzP6Plgxnw8W+HRvqTvX
	WOsAPWQ+DbvM/kncVt/Qnbk=
X-Google-Smtp-Source: AGHT+IGIJTfwmJqtwq2wBgoYLHTva5azTT7ETKZwtCsbHP8vya/7GCSPS1LSo6tEkI1WcsBOstlQMg==
X-Received: by 2002:a17:906:250e:b0:a29:445f:a1 with SMTP id i14-20020a170906250e00b00a29445f00a1mr817039ejb.140.1704913550038;
        Wed, 10 Jan 2024 11:05:50 -0800 (PST)
Received: from andrea ([31.189.29.12])
        by smtp.gmail.com with ESMTPSA id ko1-20020a170907986100b00a2714f1ba8asm2334847ejc.160.2024.01.10.11.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 11:05:49 -0800 (PST)
Date: Wed, 10 Jan 2024 20:05:44 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	mathieu.desnoyers@efficios.com, paulmck@kernel.org, corbet@lwn.net,
	mmaas@google.com, hboehm@google.com, striker@us.ibm.com,
	charlie@rivosinc.com, rehn@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] membarrier: Create
 Documentation/scheduler/membarrier.rst
Message-ID: <ZZ7qiIDFDEMEfNiS@andrea>
References: <20240110145533.60234-1-parri.andrea@gmail.com>
 <20240110145533.60234-3-parri.andrea@gmail.com>
 <63046420-264a-4e7c-b45c-17f0486ba4d9@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <63046420-264a-4e7c-b45c-17f0486ba4d9@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_110554_103798_F09E8266 
X-CRM114-Status: GOOD (  10.45  )
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

Hi Randy,

> > +MEMBARRIER_CMD_{PRIVATE,GLOBAL}_EXPEDITED - Architecture requirements
> > +=====================================================================
> > +
> > +Memory barriers before updating rq->curr
> > +----------------------------------------
> > +
> > +The command requires each architecture to have a full memory barrier after
> > +coming from user-space, before updating rq->curr.  This barrier is implied
> > +by the sequence rq_lock(); smp_mb__after_spinlock() in __schedule().  The
> > +barrier matches a full barrier in the proximity of the membarrier system
> > +call exit, cf. membarrier_{private,global}_expedited().
> > +
> 
> What does "The command" refer to above and below, please?

The term was meant to refer to any of MEMBARRIER_CMD_PRIVATE_EXPEDITED and
MEMBARRIER_CMD_GLOBAL_EXPEDITED (from the section title); FWIW, this seems
to align with the terminology adopted in MEMBARRIER(2) for example.

Mmh, unless I get a better idea, I'll expand those occurrences to:

  "The commands MEMBARRIER_CMD_PRIVATE_EXPEDITED and MEMBARRIER_CMD_GLOBAL_EXPEDIDED
   require [...]"

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
