Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC0FC369D7
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 17:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rMDNN+HWFtsHXStn36IzfPB/VsaYyV64pOFEB/MiBC4=; b=MF1EZbNmo/DQId
	/AhLjHQX9hyNJfe4vaH219oCjvOW8v6t8v7k6hjJRj5DM8vGRvB8oshAoDZabgnemDYvI22E1Zb0M
	zoMg/RQTBOltcfojdZbRNf+23nzFjVOjCy7/JTZUKkXRxbSK0ffykF3k1AUhFM/a4zfIEnvQoM2sP
	S4zVgnwYu3iSBmHpwqdYA6SjzUkzvHLG59u5vwzH6WZTPjx/4Of0io70i822za9FucKkKhb+XrjZz
	LwQ2P9ge0LxSknAW0yJyhw22izOAI2mFLnIhDnV30LlU71EY+4C0y9rcXupbt5lOVl8zZ3R7Ql1ia
	b3VVHQHdo+37u4rvDnYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e8j-0000000BNsj-1BmQ;
	Wed, 23 Apr 2025 17:44:05 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7d2M-0000000B980-1MkB
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 16:33:27 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so69685e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 23 Apr 2025 09:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745426004; x=1746030804; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aasRYpj7F05sOufZTkv6nipdyRlL5vXxtfAyn5Wy74g=;
        b=DtP+k4h8KGwODerfyPQbtjy5iOOyMciXOQhUfE2950ulZyL7PToHwgdNbTyppIROyB
         O1o0UMqPR9DNbvxRadkk7bRByDougUVdakwF3Dr1bswwus3PNy17IR2DI8ROJDyEUIIr
         38aeiTQoi0uM6ZVxDrGNi4W2F/FfYohzJdPjTZWueO6MKvBfQvUStonPeeZtEDRzx08p
         jbnf0s2JOePreS+n8zpR9h31Aivemuzxw8s44k6GsZztocxRRfTHiMtgdGUuJvfr+QUw
         y6MqYOJMhJIiU8e9YieyJpEErt9CMEDzoMGAIbYi1YoqjE9uBQ43eO7iH9K0b3jzASMQ
         PsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745426004; x=1746030804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aasRYpj7F05sOufZTkv6nipdyRlL5vXxtfAyn5Wy74g=;
        b=ci75BK+capQ2Bcx59Bvu6V5R3X5lZ5tgvp4Q+/Hpom5uVNU2QYqQY6khzLMvezofqh
         zH7XbGVzOM3/K7vtbBUS1ETLCpYfVR8Ty6oVGyaU/s0pjTA8OJzve6Dk5bfAHnYUkWeA
         TH5kXoCJOepXhblVhO9SJxxrZNKcBEDAsiceAbu49cpf09CZsAYdMfth9c+TUrYWk2CK
         PTsMqpWZn3Vs4Z0/0v3BE+Sj6f5PWRzoo9rDzQ7JIDSwMf39IciEu8p2mMj9OPIAW7qM
         ANja1Yqks1av3Fd1JwLSorRsnYlmQFBEjy1Xb3Yatfdc69ZiehxAIS/OYDydy/JkwYMr
         DORw==
X-Forwarded-Encrypted: i=1; AJvYcCX1YoMYi6KypB71TsJr4qRapUoJT3kDKanSaYWg4PKz9d+DovvF25J+V9cPjv6d1SPVyTlW9y1vkLyOOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqGr7dYkmgJ+8pjgs98xdd1Y/Ho2jnqIMXeWq7NPgvTW0RhdPh
	8l5IiRDXuGB06ckwrUIxYVcUl4iOC9qWOmzpyFqS4+u/sok+80F3
X-Gm-Gg: ASbGnctDS0zlzJsrJBQrjsjqyW5jUik4yW3ckR8/Km6+MlgRUVFlVg5jwt0LnnMHhyB
	CHvk6DNGsWOXFpDVrGEzcqxf93mkVDQew1jIVsG9qC3vUPq+YArXUH2WvxTWk3L5uUi7h+PIfFO
	y9uxOlPehl1r9scluIZ3PESw5YZA/cRXOIz/LTpg4SQwnHzHlFZ26VXf8ymMS7kgIm4DUKJKcMs
	kEWDwZW5y59s3DhxvZ0w+yIBMHhzBw49r+AkKUXfHhIeBdK1jyRmzvqdiypZ42kXGAbgzEXwCqe
	es3NdYhcHg26j3EPX6MR9kg3L+mVGfRszdB7
X-Google-Smtp-Source: AGHT+IHTxs5ApM4KX8y8JA6bgu6ME1GUQlOV5BttcxQMOG6MHXCWxullTHlG0OYtrJZj79e57BvGlA==
X-Received: by 2002:a05:600c:5008:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-4409a0403a1mr1854745e9.7.1745426004071;
        Wed, 23 Apr 2025 09:33:24 -0700 (PDT)
Received: from andrea ([151.76.46.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408d19ffe8sm27847985e9.3.2025.04.23.09.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 09:33:23 -0700 (PDT)
Date: Wed, 23 Apr 2025 18:33:19 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] riscv: Add Zicbop & prefetchw support
Message-ID: <aAkWT3AN8xDeASFf@andrea>
References: <20250421142441.395849-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250421142441.395849-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_093326_362210_8D6BFB66 
X-CRM114-Status: UNSURE (   6.58  )
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

> Alexandre Ghiti (2):
>   riscv: Introduce Zicbop instructions
>   riscv: Add support for Zicbop
> 
> Guo Ren (2):
>   riscv: Add ARCH_HAS_PREFETCH[W] support with Zicbop
>   riscv: xchg: Prefetch the destination word for sc.w

For this series,

Tested-by: Andrea Parri <parri.andrea@gmail.com>

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
