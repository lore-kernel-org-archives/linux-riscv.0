Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41208C3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 09:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Q0HyxO9y3sKGfGSTAczU3OJziNhkykMPLwg3PVysKk=; b=P25+qSwD5TWgQL
	BksgEH5AhJPdsWeUDb6gpGvKD4ZQvEGR598iqXiSicfW4izVN6bc9KCY27uwlfb/FB/yfx0f1bsQL
	XntmTdlpBFPexDLOpbFXH+YMZci1dwTLsn8FC4+FsyZXudxKtJF+Q24Y7w2CtFt/KR+BSYyXEM6Gg
	gExlXdDghyeK167NpuywJBzMVP8rMdY2eiUPdyO+JyIEpZyjEFJu3hJDm0eJ0F3adY9zofzpEW5Wh
	Dl6dRq62CKOlb71SKgQvaTCymfSFzmGpIdZfFHt6qOKe8PrchAt3Z60X2Oei70ODosXLsDeLu6PyG
	uSgPUUKQcBBxTp4Pa+6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYj13-0000000EU5c-2CBb;
	Tue, 30 Jul 2024 09:19:33 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYj0J-0000000ETrM-0XJx
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 09:18:48 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5af6a1afa7bso4170779a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jul 2024 02:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722331125; x=1722935925; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jctJvtv+1IaigDF/1bjmDqE3F2Ur/iKYxs0PGsWgibI=;
        b=IJJM2iAmeNd9g8X5Ba3mhJnWj0s6n6bdt1bPW+8+g2KNkjZa8RwPm6CF537Hv3sL1J
         FQBSmJotcQ9hTr0SPqJ3TjnqiDQttwe0BVIzifEdx/0zL35tUzfn9MPWgNCSjmNvpffj
         9lI7ES6zO1UTQg0X5pQ+SVYhEWLhGV93i8oacx8BpdQE8PBtVBbbeLnGFN2BRxDWbnKt
         wYdnPPjO5IrwqOCU7gIV90hRWCl36d8cOhuWH8pMF+7kDO/tGQIa/zGQ36nJ5DJ/Nb16
         Jti9zJ2InlUbkxcKOztEU08Pv+WcgSQphqnOro26abrdZydEqpPKjDqSaKvc1KolxD2o
         aGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722331125; x=1722935925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jctJvtv+1IaigDF/1bjmDqE3F2Ur/iKYxs0PGsWgibI=;
        b=eGMWZa+ibow2hddy2A1hrD1R2N5v3PPqoarsTJoJLw1ZadeWSlBnhAnK5rM5nQqABS
         4FRqmzF/IIGAtCz2GYNTIgv3lI+5iPV2QUKbwlQHAFvpgoiV7B6hERD4/wam4uxSHTmz
         Pl9UEWeIN+oey4aDKqWw2bQBYu2r179xOBMixMfR4Nmiw5FFONUzRBS+wFRqxFdnx833
         jI0IsQSiYXfe+JfVs+TNgK5ZmT4HaJyqVJDYhJ4NbBodvK2+wZiRz8U/ivzwlHfGv+Ur
         6dFH0oLOgLRGmCkiqg2QEtV06iOMIUi4MxK6ziYw7GQzHfCr+FyIyxkkqxGR5EX0wZT2
         abAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVkEWmX7nabAc5VEs5K7dveKk9pwIjX5BKu8Is3s414NSGVHN0+Q+8PHAPhShN7s4gaXfk04hXfE5i6KBuxKt6LB/6NaL1aB8MPFmVYnwT
X-Gm-Message-State: AOJu0Ywwh9g2X55Va1SIkSJ9bFR08et1XM7uDFjI/56rmLiJMhoo7w+x
	YjEAbPENXj3xILLTghUILB7Nr0xFm5ba52LKW3hklC31q6uTyYjGTbELr/OM
X-Google-Smtp-Source: AGHT+IFZf1pqfFnaNvhVBcURD1HU8uxwWAd/zV+FPQ+Eo1Fl1XkihsI1ZDPmE3muZ7BSaujFltAOng==
X-Received: by 2002:a50:cd05:0:b0:5a2:efe4:262d with SMTP id 4fb4d7f45d1cf-5b020bbddbemr5384188a12.21.1722331124360;
        Tue, 30 Jul 2024 02:18:44 -0700 (PDT)
Received: from andrea ([151.76.3.213])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5af959990c9sm5495745a12.47.2024.07.30.02.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 02:18:43 -0700 (PDT)
Date: Tue, 30 Jul 2024 11:18:40 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/2] tools: Add barrier implementations for riscv
Message-ID: <Zqiv8EEKYr5lnlHl@andrea>
References: <20240729-optimize_ring_buffer_read_riscv-v1-0-6bbc0f2434ee@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240729-optimize_ring_buffer_read_riscv-v1-0-6bbc0f2434ee@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_021847_185521_0FD8DA6C 
X-CRM114-Status: UNSURE (   9.29  )
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

On Mon, Jul 29, 2024 at 01:50:34PM -0700, Charlie Jenkins wrote:
> Add support for riscv specific barrier implementations to the tools
> tree, so that fence instructions can be emitted for synchronization.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
> Charlie Jenkins (2):
>       tools: Add riscv barrier implementation
>       tools: Optimize ring buffer for riscv

LGTM.  For the series,

Reviewed-by: Andrea Parri <parri.andrea@gmail.com>

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
