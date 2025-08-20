Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313D4CA0EE4
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 18:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=naIjdpQ1gJvGkXsciZ1PaP7H2xRhSzPyySyYF/DJ9z4=; b=P+iTfGwjCvY7Db
	0T4l5zF4o2E0LQBQbxtprJSkLyRHdAPzB2LhT+8hSFRTcfN29QVbQrwOim3iku28AkHCF4DpUsUeP
	S/KJhupMmDNGXdjlwU7rZoj1zWIoRCmjLp5v/TKOjh1OLmJlvqvh8MpLOJRuYJrR4mhxhriyybpoC
	hor3iquATUD+R1jyQ3wH1SOMvuQYbQVppNSXU4TJVZ5lZ5612cXUOXyCrHlw8e8HdK0AjEJ5qUeHF
	cxc571btOjEe3rZW+VrHlhvfB2qWjRlVgM6NOhsjOc9eBLrTKtLDDvTFuDUJ0l4lhacxQsozzpSQZ
	891StNRvEpeYpjpUeSKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoo0Q-0000000Ej7X-2tWL;
	Wed, 20 Aug 2025 18:57:54 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokxr-0000000EIEB-2xHO
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 15:43:04 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-244581c3b43so59261715ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Aug 2025 08:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755704583; x=1756309383; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/HYcUpkMkv94h2XbvkcDPME37XSxTyvkygwYUU+N7Xk=;
        b=k4EJnqESA7hGGyAp7/UdP/JLylh+o6pRw/9nIffvXGU/rzapXYqFwZ44Hy8OEhuHuE
         TSjuX47BrBntizilwp0lHgTjWu9YlcaP8ZKQgAHnv7DGSwSqoA3O0h35Rbx2bIEG6ewT
         cObSfiRAyrnV6EB4iG+yM94q2GxN1nZ78P+Er9tlSt1bnUwfS3RaZl8Vrc8J0L1K68pS
         hREVeeVHChKcnkkQuJ+kR3SJXtYNyYyMoVzYMj4NMo9BzEiT+WKDuv9TqGPnfB59ixwp
         wF0BmiDD7A5UfdNsG9I1Sa00umIX0fBLL4dV2D21ug+YCuoNz6XlMK7Oz8MafNJMtbTT
         U5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755704583; x=1756309383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/HYcUpkMkv94h2XbvkcDPME37XSxTyvkygwYUU+N7Xk=;
        b=BE70HOzUAAsNXFW7eBtMkJJcV6EqArRGZyVZszApX9CFbsZ2Pp5ZCR9S1e3xijRgTO
         HnlECaQwBEfRir0zONJTN4gC3wIAYDHUCrsyvkQy1DmqvIXAM84SPDuAIePSuP8RSBEA
         /Tra8I7nThx8wiE3FwBnKBmlYAqdJpLeGmw7kWGjOAitFNJ4vZalL1n7DJdliljh/9Wb
         Kx/k4Ryc8846PWv0kw5PqNFjhmDEjGQQgAAex0q/0Z2TmXdgBIkv1/JtE7CgPvWasKtz
         ue5I7dq2J6y0g17SSwk+zx58CBVmmJdpl5N+RDQYqcZV3XiPS6L6KI4r5el8pNsCZJcT
         6A4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVL+HcnLyAkmWzK/ZjXgAPZjV3oeQ/gMEUJ5+4t0Q0GnC0vDbv2kLJBemPgls4lV5+3XkG4rspkp30DPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSOoEM3U99r/frKEAA/lWG+xdMN3Z7epoYOFieFIEHfS+v2aEu
	if2FFsbwBoUsIQamzhpGQ0twSiNZFgys243L5Wf46YTnBufQLxNtOG6m
X-Gm-Gg: ASbGncv42EVJm7z8W7SslbDhzlBDMR3rc3m/7WO5V6krZ4/3z1kaLnA73XvspQ0emEG
	UuDgkLyEjYdguIWSJIAM6dqN2qXg9mGsrg9SQnKAUDY4D4Hz7/+yMb5dgIgYceJjgoyIA1dGT1i
	QDhdzlS8Dmv9zzj8HKqGUchoS0gQD0iha5cgksrVzjxHcRPZZLU4m5nXUmmktuXieW+I3yqVeWN
	9tWSd8gUBVpsSk6nshmJkuRA1phSgPkTjngSELi9Q+ABA+Xer8TPFn33HpDpeJCGnP9yKXLhgwr
	4eh2S+4QN9dRv0ETWvkssJDDprneAePePoxhQ7D7gnuUcXcKtGHTOwcc9OzFrk+CtRdo8joncpb
	Izn3HAPC+p5Cxwj+i9ybnfQ==
X-Google-Smtp-Source: AGHT+IH6gZ26DxE2JLewlQcM21xboqntWHSUL7OzhgIsIqZtImyMgE5DwLxxAppSG+MW2AGNfYQzcQ==
X-Received: by 2002:a17:903:1b07:b0:235:eb8d:7fff with SMTP id d9443c01a7336-245ef225a57mr41050265ad.28.1755704582780;
        Wed, 20 Aug 2025 08:43:02 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4c75c9sm29939385ad.87.2025.08.20.08.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:43:02 -0700 (PDT)
Date: Wed, 20 Aug 2025 11:43:00 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Vivian Wang <uwu@dram.page>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?QXlkxLFu?= Mercan <aydin@mercan.dev>
Subject: Re: [PATCH 1/6] riscv: Introduce use_alternative_{likely,unlikely}
Message-ID: <aKXtBJ5Aqqmvdc1B@yury>
References: <20250820-riscv-altn-helper-wip-v1-0-c3c626c1f7e6@iscas.ac.cn>
 <20250820-riscv-altn-helper-wip-v1-1-c3c626c1f7e6@iscas.ac.cn>
 <aKXiH1eqGliLNb8u@yury>
 <544577b2-6810-4bef-b588-e1c662d5be13@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <544577b2-6810-4bef-b588-e1c662d5be13@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_084303_742085_9E706ADF 
X-CRM114-Status: GOOD (  19.53  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> > This 'unlikely' version is just an negation of 'likely' one, and it
> > looks like an attempt to save on one negation. On the other hand, the
> > function is __always_inline, which means that compiler should normally
> > take care of it. Can you prove with objdump that it really works as
> > intended? I mean that =

> >
> >         if (use_alternative_unlikely())
> >                 do_something();
> >
> > generates a better code than =

> >         =

> >         if (!use_alternative_likely())
> >                 do_something();
> =

> use_alternative_likely() and=A0use_alternative_unlikely() are not
> negations of each other and in fact should be functionally equivalent. I
> also briefly explained the difference in the comment, but the difference
> is which case is nop i.e. fallthrough, and which case requires a jump
> instruction. The likely case should get a "nop", and the unlikely case
> should get a "j %l[...]". This choice does work as intended [1].
> =

> I don't think it is possible to give both options to the compiler, so at
> least for now AIUI users have to pick one.
> =

> The same applies to __riscv_has_extension_{likely,unlikely}.
> =

> Vivian "dramforever" Wang
> =

> [1]: https://godbolt.org/z/v8zTEhzTx

I realize that likely and unlikely versions generate different code,
I'm just not convinced that

1. it works in real kernel as intended, not only in the godbold; and
2. has any measurable impact.

That's why I asked you to share objdump and possibly perf tests.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
