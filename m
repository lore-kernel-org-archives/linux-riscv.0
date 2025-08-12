Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5D4CA0EE0
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 16:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tq5uZrLqQWbFlaWsH2NXNVK7Dg3iW9wkIBsa8p++j98=; b=NGX0yYE0GfOgiU
	YqK/aUTpTRADrz/LpLkdQuduwXAU0HLTTi0Dl/4Y1nE434DK1ZQgMSo+Yk2aX1VeH68BifEbvZxv+
	7O3Rq1K9Wlp36TxbBz0JoMvqgciin2B7g7xEx2S3DZMZTz3ewRxRzCu9Q8g2wE6C+qUrTJ3fbN0D2
	y4K1EuadcOVLVtaTuRdleMF85eD0Q7C09a3gaFVurzA1hmmnfDZWouLlXKK/YEfecRxTHTl+fZJAV
	GF9pFhtiKupnwwinm4EGE/ZXnFNf41c5EIs8qcqA+8Ysvhj1axJjAa6tlQ0X5W39F33EVUrowa8T6
	jOWIX2TEe/sAueQOg9vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrtf-0000000BQ3x-2ajR;
	Tue, 12 Aug 2025 16:30:47 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloka-0000000AsLl-0Fje
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 13:09:13 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3b788fdcc2dso389785f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 06:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755004150; x=1755608950; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAomTme2JM325tkXeqcrCAovhqZxr09aQ6wqQb8gykQ=;
        b=LlCvLaXBV7TAYbpOc1M41g1PS059OiBIuknU9VYCgkEws+UEjkJXmrSk449g8uCZkU
         ase+PJkHYb97MgiQZ+1nupmOjrsLpTB4BIlTyaNGFZTutuC/vnBEk1xEkJ97z5wH9fo+
         BY5whyVEhTGVUL2MJ6j+Y7dlMCmlIiUvT0N9jwAUxikN4PZd+DO6zEtTzC2fQ5X0Yi5Q
         dsboDMMRSsgoTZGKLxV6du00aLV1uK58H0GqrfKhSKvMMGefz4b5iezIUnoTgWNw3sjc
         cGfR8Lh2msxHEmJUOEaqZnMV28fdNm3K/qFzzieljdy/4dQgX4xS0qPNLjj7k19Nd52y
         yMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755004150; x=1755608950;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MAomTme2JM325tkXeqcrCAovhqZxr09aQ6wqQb8gykQ=;
        b=D7b3vs7vgVVzWqTW9ovo5crMnO7uvt5w4v4Co20pasbukQnf290WGYDNu9DpJsQ+jz
         ktXynJrZZ5ofWaYak1Nal5vKlB+7GRPmuFZlkQOPDzYfHCPh4Hu8lGG9rpEz+setBcOx
         rNFKSJo2djOTI5s5GeGNOnzd5wlrtFR4X/UeBWQdsH6IQEg1LrPM4HJymC0ImGXa8gd4
         RQp/pw98nCDIOsm8AnvZzqY4pFwgM6Gb1Bk0IAZd26extG7huINKZV/FTlMrQy79FWFA
         wH9ti5LSKGTH20G8C9oXYbuC02NDObfx9cXny3c1Za36JewdAvGLJ+1mB5GYddr1HnSn
         KIAA==
X-Forwarded-Encrypted: i=1; AJvYcCXioORXfqEvki8j0oG4sqLKoaONnpALdj4I0y1i2GtcjMQTUJiQB1okNmvmu5Pj2jgvD5d0eK6mPSb2Sg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqX4Fb5yEu/kFkAU6XSzBCVbyMYkgsKEQ871ZY44ObeuM9KJ9H
	ZOdO50KNomtKrumw8Q17FpoYpegfaTS0EsO+xQGKv8m2Z74sgVKkrxtE+o5oJlqcqRFvQRjcDEm
	cw7pY
X-Gm-Gg: ASbGnctDj+8tTEbshgU0S0Wd/tYqtCiND0XGN4zBOfzvI09qJZF9C84NWzBg3D1MVEr
	SYkFm5mxy0mTrxZucylgOZNl2tYqR7g5fdJg+HYVBsyxK1WnmkByYU/njCkHXFsnRGec+yzTwbI
	2g3SfnSxh3LXLgozD3GkdFpHMOyjkDE6JV/ukfvU9SN28yrJQPANBARRH46PAlfLKumcLGBA0Ed
	AEh3Eqct3+NK3L8pb3T+E+lgLtdmyu/Qe/X7rnyuHzu8oQyBuQ9enC3IWsLWmJzrOHq7GnhwlTK
	j7roAn14cYEpLKTp7O7wPi04F5kTF/mrBKHLOkEltNe1s27zU2Iu0k03PTATIB2b6ADCYRbHfeJ
	LC8WA3cQsd4t6ANpYZeB1n1PpAaSNMQ==
X-Google-Smtp-Source: AGHT+IFCL0S2fG+7EvsWvlnJgkjJOc9wFOS6dc1oCWSwvbA7urqknr0ZeJjmy9NTqLN0RG30vSqL/A==
X-Received: by 2002:a05:6000:1785:b0:3b7:948a:137b with SMTP id ffacd0b85a97d-3b9147c2a32mr526638f8f.11.1755004150288;
        Tue, 12 Aug 2025 06:09:10 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:8113:2b11:8f42:672f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c338c7dsm44458535f8f.0.2025.08.12.06.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 06:09:09 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 12 Aug 2025 15:09:09 +0200
Message-Id: <DC0H1RZKZ3QR.82P8JXIL5NBJ@ventanamicro.com>
Subject: Re: [PATCH 0/2] riscv, bpf: fix reads of thread_info.cpu
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Song Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>,
 "John Fastabend" <john.fastabend@gmail.com>, "KP Singh"
 <kpsingh@kernel.org>, "Stanislav Fomichev" <sdf@fomichev.me>, "Hao Luo"
 <haoluo@google.com>, "Jiri Olsa" <jolsa@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, "Pu Lehui"
 <pulehui@huawei.com>, "Puranjay Mohan" <puranjay@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Kumar Kartikeya
 Dwivedi" <memxor@gmail.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
To: "Alexandre Ghiti" <alex@ghiti.fr>, <bpf@vger.kernel.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250812090256.757273-2-rkrcmar@ventanamicro.com>
 <1fdaa939-d26c-454a-a722-7d0a590557b7@ghiti.fr>
In-Reply-To: <1fdaa939-d26c-454a-a722-7d0a590557b7@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_060912_097358_642CA056 
X-CRM114-Status: UNSURE (   5.76  )
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

2025-08-12T13:37:16+02:00, Alexandre Ghiti <alex@ghiti.fr>:
> @Radim: This is the third similar bug, did you check all assembly code 
> (and bpf) to make sure we don't have anymore left or should I?

I looked at load/store instructions, including bpf, and focussed on
patterns where we access non-xlen sized data through an offset.

(Nothing else popped up, but I mostly used grep and cscope as I don't
 know of any semantic tool, so my confidence levels are low.)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
