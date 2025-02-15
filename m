Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D46AC021A0
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Feb 2025 04:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Ssl5SjF0QSvbVfNUrGmspXKlfkb06Za9SP0XhuaN3g=; b=prOlEGbteBv4/5
	ih6kK1upzDI/8GLhzeWrc/Q4yThbMKNxZ+MNQ3bIP0j1JpizJ3Yoy7AzTEmy+0RaGje2Mby2fu0LF
	6QjADkIrukldwALCk0ZRZx3KwHs7LS21OtRfNMAyDjSVmnagofnux8zfWKQzw9QFkGwTIb3zjKGpz
	P4Mj8aaheLMXsYHBZMKgNsh58RJcagkgExoXgZRNwesC6CMkpndcmfsfvHdzj3OxnfUzDNUnfR+sC
	JdOIJZblrbdvAZwCAlwu/67MMjEIKBxZ1UmqZRiSm9GFqISRajJ0+gRfYqMcQkjxYP2KEVfCiBHEx
	/hTZRtQYvoqsOfE8o2KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj9Ow-0000000GxX0-3MPY;
	Sat, 15 Feb 2025 04:03:34 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj9Ou-0000000GxWV-2bmh
	for linux-riscv@lists.infradead.org;
	Sat, 15 Feb 2025 04:03:33 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-471d0d123d8so13176651cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Feb 2025 20:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739592208; x=1740197008; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kJ9/Akd4fSMQIMXpZijLUqRTB8clBSRR8MFzutJDF2A=;
        b=ZS063ABUr6Mwt74ymlOHqbY2qUGt0cs14KYuSHsY03NYfAribLqwirSCjucz/zxYjf
         HRu+HhRqwTk8BJhEZveghZo7cbL3CNg1e/iNkY5A2opAVKtdY4kfJEKfyc6+yA1hG/YT
         LrAJYGu/DdC/Kz9e+josxCrnwTKbz202VRpvfR7sUOb8Yp30GcVwN6GFegh+/1aSetar
         nssYjhjGbVZuqHRrSVNkwaanHI0uNZg8AJuHb4y2ZLVKVJQQ8xYnXelBd7bQ8mV+9iew
         +VwBSSdvA1sXkggAfqm/zi4dBOvpBKLeHdi0NLqtbKLN9xvobbFLUDjGo2mtxDCt+FF5
         zoow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739592208; x=1740197008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJ9/Akd4fSMQIMXpZijLUqRTB8clBSRR8MFzutJDF2A=;
        b=P45HLlhVYKQiAI08ZDAzuqrd/5gQ8qiXFVl/6VLTqVytLCGGTBLR1ox9UIHFoMaM8I
         ad+qoQxht/kvNnGXUIgUJnzAUVIYbRqWixCKrONQ0rl6J/imqsGyuu1tbh7bi7HTgRk9
         XwDUwVzgn7M8qUxdlOhScxe09s3PJrlYJb7O3enBYjMUmcN114Ct2zKC9v1zGEgRlcBq
         h4o//5v7wKDcpKyd9cACxvp4p1f3DPBp26LmxPfWZueg+LE0+T6mICpHTTALEfL+DfaY
         97umF2opKgUJ5GYPxyAuWLkGQSOQrrMcQcSPu6WRsgUY3+mO3lILdf1cy7uCyirBj17p
         Y6RA==
X-Forwarded-Encrypted: i=1; AJvYcCWorrhvOvsxKcwMR8EY1PTGiL0UhM+93mI1d/R+gc737tykZKhj9BIBBLb0qqXDMSqRVrsYTHoqUQYi+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBmxOqlSdIbjPp8Wdfp5vYPjNA7RWJ2+wittuhMFyY/0rajS0A
	TnCym/6HGgbtMFV584Nw1PDauCQc2fHcVp8iwz4Br7giy4bCD0r7
X-Gm-Gg: ASbGnctCZszDR7VyToz+EZXkysnvLpUkvTU0dvp1tA0gCHXOD30SDMonkElnOBO7X0f
	ClEneF9jN0+LOxxr0LSCNeMMgZ7IMCJokf+mY/vntWHmP9dQmW2A2XxeSlA69RMlXCB9/6mNd2y
	UPgqaHzSvTD7VLl1xb7KMuu1LzJSfmKFAunZo873d9wXJ0iVE6SBYrGTzR5dRhQ0jc1xrvGGuyo
	3hlJr7XvxVjFiQnhXabPT0CyGyOMSLd7zsbX1yGWjYomadqoYgtP/+rdhYp3K36th0=
X-Google-Smtp-Source: AGHT+IGpZkShfqGOR4DZumQ8cgtF5xa0Zz0ltfO+3rGOTSuLke11tRfF5yjZeQQJKrSty8477vuMUA==
X-Received: by 2002:a05:622a:1829:b0:471:cd38:d08f with SMTP id d75a77b69052e-471dbe70a3cmr29566671cf.33.1739592208124;
        Fri, 14 Feb 2025 20:03:28 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-471c2af3700sm24303601cf.64.2025.02.14.20.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 20:03:27 -0800 (PST)
Date: Sat, 15 Feb 2025 12:03:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicornxw@gmail.com>, u.kleine-koenig@baylibre.com, 
	aou@eecs.berkeley.edu, arnd@arndb.de, conor+dt@kernel.org, guoren@kernel.org, 
	inochiama@outlook.com, krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	robh@kernel.org, tglx@linutronix.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, chao.wei@sophgo.com, 
	xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com, samuel.holland@sifive.com, 
	christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH v3 2/3] irqchip: Add the Sophgo SG2042 MSI interrupt
 controller
Message-ID: <egxjuvebaznrtlzreie77p3gyykslagxqvwy6k3tje7a73ciqh@rikhellxp5ny>
References: <cover.1736921549.git.unicorn_wang@outlook.com>
 <b5c2f13aa94f68c3415a1292678e16db33f291cd.1736921549.git.unicorn_wang@outlook.com>
 <dh645pyvtylcxjcjjcdl7xttpp4qmtjouapifaql4lniab3qjo@lqmwytf5q35c>
 <MA0PR01MB5671D5D25616BABA0E7F60F4FEF92@MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA0PR01MB5671D5D25616BABA0E7F60F4FEF92@MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_200332_662167_CDA8F6D9 
X-CRM114-Status: UNSURE (   8.82  )
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

On Sat, Feb 15, 2025 at 11:36:18AM +0800, Chen Wang wrote:
> 
> On 2025/2/15 9:09, Inochi Amaoto wrote:
> > On Wed, Jan 15, 2025 at 02:33:45PM +0800, Chen Wang wrote:
> [......]
> > > +	middle_domain = irq_domain_create_hierarchy(plic_domain, 0, data->num_irqs,
> > > +						    fwnode,
> > > +						    &sg2042_msi_middle_domain_ops,
> > > +						    data);
> > Use irq_domain_create_hierarchy
> 
> What's the difference?
> 

I made a mistake, just ignore it. The original is OK.

Regard,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
