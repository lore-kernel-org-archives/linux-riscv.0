Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108CAC5475B
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 13:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iQwcGAEU4KJtUq/tFycpJEg9itDvIw1DXgUxTULeIGs=; b=mJCPO3gQnFkZTI079yPUvg2iC2
	CL+WfiKQMLnjwiUNfZRvORmDJeYSn4gJg6ppdWc5aRWP+9qSGSzaPuqKRuu9I00p9sGPxzCCGmXHM
	9neg5EldBUdoRxHlAVvbsuc95+8YK5BBcMC+JZ5D0/CGZlWPXUfwkLRPHDZAlNnqEmw9RXY2x6CP3
	gUajqouSNK1mpwCAkxZEniQpGm8qL8TwLlxWttCaZ9d7liM3n4aP4n5s8n6LVqUFaU5dUzMVdhP8f
	1EmbJlQFJsdiczDc9RdUUhGpj4lZYBGQqhPZoLDByvB4mcSSvfm7XVhZAXXLmD3BCzkz5nsyBcZo2
	mFx5GEsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbKPa-00000005hiN-19R0;
	Sat, 17 Feb 2024 13:07:22 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbKPX-00000005hhp-1j2N
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 13:07:20 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dcd703b721dso2482865276.1
        for <linux-riscv@lists.infradead.org>; Sat, 17 Feb 2024 05:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708175237; x=1708780037; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=I4YsTPy+u2ynTkan5HCdCkuqHXbKMObYftk+gGeCLW4=;
        b=0nY+UoDgt5FBLqsY5f5ETxofwTnOFZDAIsRBNyp7udRqDanECXN/VaKIJgxc9u2W3+
         UQVapEXiDKvhYOC/ZBrSJNNquHPAK/t/+GTlY52AKWOeZyxxxxOAcyIgaNXvSUhuDHpW
         PIrXnA0/3Wy8+TQQFNxd1G6s5AH0NMRL9ZE45ZfBRhS9AiztxTisIJEwQxgXKRXhEqSO
         53vunHpefIhGuXU/O3rGfFSCWoSTKvOJ28gbl3ogIUhfcKB1wWJmVzYFj+OLHRdqgGcJ
         vTZYGkK6Un0wK0FFwjY9fIum51u6yXJunj5FSdyMWUrhwkLRLtXkuJNOocaPjA4y7xCd
         DBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708175237; x=1708780037;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I4YsTPy+u2ynTkan5HCdCkuqHXbKMObYftk+gGeCLW4=;
        b=GrtaMglNjkJ06iM7qtxzb78fr2rrapCGnl53VQdV/4YeapbQPPbFE3xgt+j7yhluyK
         uW38UL1NSuOQNF/G/PdSzXHqsrrBiuJS8sbW01muE8hHbUkM64LKWyJwUPTzL/uYtkVd
         8mz0AUzldHTqz1Rj6J6IZyqgRxvPSsjy9jF1etfPLyPwzWBb75FEv5gPaN8caZFnOUta
         yyTw6PlqEVQnAOf6h5QfFvlCj2JS0GfiU8zul8i5d1Aszcpgu1lbw9vrXQHhOhvMNr1K
         H+A9YOo986wpCRGg7FLrnBGx8fqEgV9DWkhypoqMnnEtgurHqhCl+ZXXFCGojxx1vb82
         LP6g==
X-Forwarded-Encrypted: i=1; AJvYcCX8Rp2LztvNIxWtexa9vLpZ87y+BGMPF1cHM3uITC6vA0iMabNLKwaPnklCHXKUlR8uIk+4p1Bp8P4FAMldBF2gRK4URFKrQDNmE64EfDa6
X-Gm-Message-State: AOJu0Yz5Qj6xhTZzOclApykY7y4k/CDwAizdRvJu5ayEwOIANuFP3zhP
	OIp5EZ/DXssfJS+OnwguY92HG1wtjm5TLaW5TyXaBNEj6uyiOjFSVd2/g54eOeErc0c5UNf0Mel
	RdUicRTbVfxGvoAShdQ==
X-Google-Smtp-Source: AGHT+IFinfKlB1hBzhDd5KtWrCIi8q1+sm/jrGyiRLTf+ANaTQb8rMEdyaFHYvXpOZZpMtxV4FsQmNcsw0xYP+ng
X-Received: from ericchancf.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:4139])
 (user=ericchancf job=sendgmr) by 2002:a05:6902:728:b0:dcd:4286:4498 with SMTP
 id l8-20020a056902072800b00dcd42864498mr426726ybt.6.1708175237563; Sat, 17
 Feb 2024 05:07:17 -0800 (PST)
Date: Sat, 17 Feb 2024 13:07:10 +0000
In-Reply-To: <Zc/OGnjVKcCuKNA5@andrea>
Mime-Version: 1.0
References: <Zc/OGnjVKcCuKNA5@andrea>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240217130710.3566812-1-ericchancf@google.com>
Subject: Re: [PATCH v5 4/4] riscv/barrier: Resolve checkpatch.pl error
From: Eric Chan <ericchancf@google.com>
To: parri.andrea@gmail.com
Cc: aou@eecs.berkeley.edu, ericchancf@google.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_050719_477678_7163B887 
X-CRM114-Status: UNSURE (   5.15  )
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

Hi Andrea,

Thank you very much for patiently reviewing and pointing out areas for improvement.
I also appreciate your kindness.
This is actually my second time submitting an upstream patch,
and the first time submitting multiple patches.
There are still many shortcomings, even though I carefully read the documentation
and refer other submissions before submitting my changes.

Once again, thank you for reviewing and providing such friendly suggestions.

Sincerely,
  Eric Chan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
