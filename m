Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D9BCCA462
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 07:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXLvL2alB1QWT/EApunZMY/LrIpIF/Q/Y4SL7XVQ1CE=; b=QOFPm7oWVP5unv
	FooIeRmwesCijS7mgMGsEMarRf1Ph4JMLZBDu3n6t+TXb8NG8eow3gM/ynpfhgCNLL+EbTB5bX1xX
	AESOOE8vu0X8XOaTvKJttmzxBJMZSediEetU2zxUgLatWEETuPXzszV8UP6NLz/29TOB0En+Ivg5e
	yzc4GV7zY21Flqdkj9VeQk11bCSoFH9jSttMavCBwsCdqfTkWRT8X/sGCHLFfmZaNyYuzu4lSGbty
	9EmLSsTa9E7UREHHmNy1onCq2bsTxRWa35XRJhAq78QlB1MdB+Rf3YoQxde0JrI1HegL3xQr10fDB
	U/2yV8Q0uBV6msol5kbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHby5-00000002BUE-4AFd;
	Fri, 16 Oct 2026 07:03:06 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHby2-00000002BTc-1lfU
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 07:03:03 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-3514b90bb89so5205076eec.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2026 00:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792134181; x=1792738981; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o7ECuynPFMnAXoH7UnU3pPhhBlQI55oWE7ikBWj/6QM=;
        b=iw77WfRvZPqf1kXGTUSUvPSycSNXGVB/RofpMS6Jg0fyi5EemFRmJNXp8KcEis5KU7
         idR47wUzTK4TQgoPU8t+iKTfqmG5vJ3bJYXVLZ1+e+BgKGCkxZ3YsBstTOcF1ck9Kqfj
         Oi8/HZ/ALaORRelgmbf4/IHmTLTeWkW0Kj6VTg285fTmSIaPn8R6HuBms8ziUvpywUiE
         z4u5w/cH8NYYRWSggraSTjfxwCk8wxlXNhmuG9T3kyzZlAPYQYkP8if/229g08xT2GV5
         W2XmoJ2UcCXWFGVqu4AZn76DwdvMQ4ji+oVqR0I7rsT1S7UAGDZloOzKGu8pAMa73guu
         NZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792134181; x=1792738981;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7ECuynPFMnAXoH7UnU3pPhhBlQI55oWE7ikBWj/6QM=;
        b=OacU7oQvIjGBgrGNRkzTRydbbQl6IIGZW9G3Lf/dlqCk9wUM21cjwwtkWcZ0kT2V1j
         piWiDAJ6wnHtV4fbxn72uv8Sno88B4B0cF25e1r41ZgD7b/ULyXZ77FlFvMo0IPHvpWq
         DpTgeE0YG1Uedq4SeaxlFy9KN7QgSdILIo5szDJIUlB/H7Xxo5sYb46/yHjAx0Wp+JY1
         5nHRDKbgaPIKYLuYcc/8oFnoYJy+HMlwz5UzWBBH+zFPaHiNu2sCPodk0OOhMbGDjY7q
         FxQ50Xy3bpYZ7LX6jHSdZT+rgGFNxsXTUT4AcRT/c+98ozgBIqdDDobSJCUoEXTwlAmZ
         Luyg==
X-Forwarded-Encrypted: i=1; AKwUvBxnjicafCHg3hjB/irFpdJtqj3IERe81hC/h5OfRqkc3euv5lhh8a2u2LJ2E3pHdvXkaiuBQzxo4/dGxg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ6Gf4MXTpj1OSPTCXwR+r+0FYxbfjhXTUSmj+Ax0einw8xBThR
	rsdc8+Z3C79e4CcqJuHYrxTfd2o96wd7d0AawVMT2Q8iS5dWkDscgWWj
X-Gm-Gg: AYBFou2g165WSu5uOnefcsNQMfG8R7KeNRWnaDTig+zFkqX0wY0XJgQ7kvmfNdrtsf/
	EkVIGxQ121pk+6uGajKFrcEZTfLtJBtE88g/OnQxQDCSBQntkLcK5WsDS3HThs3PjdONWyXO103
	yWkqQlxVb1ShF0MkgyLFa8fnR+KUCJYKlFHgbLpkG7IH+nyRTkms4/FlqBK+44zWAk7EGOX3SwB
	CHMIxy+1jTCVE/IPjHi5O+pXva0+9IZtZ6G3uVwVMW3MWbboDcWxEogDBdp0pitC1QkzZVvds0I
	1g8fPXNzADEcLrJRKXoOjtzo0XDkmNXWk5eoUBd+W+nudUxWZixXbBxZR7C4//HW2dL91KUYBkI
	R8wptNDYUsuGq3I8ixL7xTrCP8tYBrfJX4L9Ra3Fh1m9889ZdnCWeHsfvo3PrZr9cO4M+jUl9lu
	L5sV6mOxa6lVmErzwkNUww/ObcLMz2xlXoBY73uzbCz0vomcFTRF7fokfpLOMq+tsnGrJjmpLM7
	tAKkFHJDqkqQ0xDOoayyiHqoowLekLEmOeKUDex8T3rkPOhRjJxUfwfPg==
X-Received: by 2002:a05:693c:88c6:20b0:359:89b9:5e09 with SMTP id 5a478bee46e88-35989b98cabmr23303257eec.36.1792134181207;
        Fri, 16 Oct 2026 00:03:01 -0700 (PDT)
Received: from [192.168.10.146] ([67.174.242.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm4668641eec.6.2026.10.16.00.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:03:00 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] riscv: misaligned: Fix
 fast_unaligned_access_speed_key init
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <2468816ceb433394099a00d7822f819745276b49.1780002199.git.namcao@linutronix.de>
References: <cover.1780002199.git.namcao@linutronix.de>
 <2468816ceb433394099a00d7822f819745276b49.1780002199.git.namcao@linutronix.de>
Date: Fri, 16 Oct 2026 00:02:57 -0700
Message-Id: <179213417712.1857356.6461669805362228910.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792134179; l=720;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=zP2obJz3HeuvKGl2nJSDhnLPQDTHZAQgKwICzUxtlAs=;
 b=Ehu4kuCdgJFTDnwERgVz09MpBc6sKrQuQi3WzVTfXZZRn6gnjof0JjrrjR+uShX+6uuJl/sO5
 ugIzBb5hB1oA+c4cIgQyyzCQhT53SKZWgE1VtMGQLDtqBiV87YAIU1H
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_000302_474866_2C123DA1 
X-CRM114-Status: UNSURE (   9.41  )
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

> When booting with unaligned_scalar_speed=fast,
> fast_unaligned_access_speed_key is initialized incorrectly.
> 
> The key is currently derived from the fast_misaligned_access cpumask, but
> that mask is only populated when the unaligned access speed probe runs.
> Specifying unaligned_scalar_speed=fast skips the probe entirely, leaving
> the mask uninitialized.
> 
> The information tracked by fast_misaligned_access is already available in
> the misaligned_access_speed per-CPU variable. Use that to initialize
> fast_unaligned_access_speed_key instead and remove the redundant cpumask.

Thanks for the fix. Looks good but needs to be rebased (apologies for
the delay on the review).

-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
