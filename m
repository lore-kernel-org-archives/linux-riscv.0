Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D833EE14C3
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 18:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0TBFf0ygEDp7udGU9mZ+DuZWOqRV/GeW6AKd7IzWPWw=; b=CMtwOhIAD/qAnd
	Qmd76SzNqGABLbIwxUrZub7TctdTb6DBmioQEZMsmt3ckd/SCoNksY1+YLJM66JFZHzaCQHCGYYAY
	ySktE0wEtrd7tl+zHxjjDKs0UM3mymymgeY6WPBZwP8LSZp1ikIAO02Kr272y6xRWAhWAmnSoTOej
	6MT0ljetVtTJ25Od9oHA+KqcMqg9ATrRhZKQ0vCbwGA8VZejC4LSdXf/pbnLtWTNHLhUi484MYdJv
	s/21zNuy9DoNpzHVCGlm+UWywIafvYbQcHjIxHXwwPk259W5vcWYPAvoJ5enwogHUzMQGGYxBRngf
	KdPi165RDJpL/VnPW7Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdxcY-00Ak6J-1z;
	Wed, 06 Sep 2023 18:51:22 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdxcT-00Ak4k-3B
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 18:51:20 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bf6ea270b2so1094445ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Sep 2023 11:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694026275; x=1694631075; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gQpveLuX0FUvjuwD4dGyYyZDS0eYrWbcLN2fWSij0iA=;
        b=VR5FFA8Kqv/KG/8YJhaWk3RGH/zPY/74gsO9T3nQC+NK4rGFQ1HVzNa0QcRUhEpi33
         DzUG7p7jqV+hcRfy2jR0x3F2/qvUFym3kP8eRGUmpDURkGSNsmhvly6knRPq80bJu9cr
         17kWqu0JqokbYnCC1vVxD4HoOxAWSbWBCubV8J1ymwYm9bbSwMu25WE47KJkv0VwOyu3
         0/oLqBqkeYjM3qc9cndNFGxXOLYZdkAOClFpY+iH5TYU94yXnZeKTsxy7Bqt3jZMEQ1p
         Rq8KLZBwZJuefpz5VGTPf+bqLrPy6lhFatObdkOcbTYxTizFqavfinLl86LyRJES54vn
         SMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694026275; x=1694631075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQpveLuX0FUvjuwD4dGyYyZDS0eYrWbcLN2fWSij0iA=;
        b=UXw6wZ+vOAqS2xwRSLHIhzRFrvYJ1FzNrXuTEnWU+zKnJpPi4hU5meRZb74ruGlN0+
         60vQURSE5398LOZE3s3hpK62zzPsoz3u/6E2RqB3jbBMvO0gJJO/gVZ4Dw/JyAAV/eCL
         xrtAMMOZBYJESR8Euqg4q9Dzm7Lynx/ythh/s5yuQA7twYqHtWAgqEh5bofvcW3uKtLS
         usdjUhMwFTDZ2peTLVmUz9WInhkiBKgN2s36EVm7EdU7UR1ldWJQNDcGzus1xbvrGX+Q
         RxjSmYJYy5PgXtyz9iiaM44kAn1w8ztblmYnZbVPYAyAEU616D8boS1t5snKQnJCLUle
         5XYA==
X-Gm-Message-State: AOJu0YyuT6XnRqZNIkE/V1LxgaFP+FSUiZFT/A0RLBpFnqzTE65Kyxn5
	H+uFADPurAsb7LT22CzgkSqdJQ==
X-Google-Smtp-Source: AGHT+IHUCKPBvm+y4ZSnJx6E4oEoYCsWpR9RPBg93vTI0YIyf1mDbs5Z8RbtKmorODld7KsvQCj4Fg==
X-Received: by 2002:a17:902:dad2:b0:1c3:5f05:922a with SMTP id q18-20020a170902dad200b001c35f05922amr2910308plx.60.1694026274955;
        Wed, 06 Sep 2023 11:51:14 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id g14-20020a1709029f8e00b001befac3b3cbsm11407084plq.290.2023.09.06.11.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 11:51:14 -0700 (PDT)
Date: Wed, 6 Sep 2023 11:51:05 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, jrtc27@jrtc27.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	bpf@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, peterz@infradead.org, jpoimboe@kernel.org,
	jbaron@akamai.com, rostedt@goodmis.org,
	Ard Biesheuvel <ardb@kernel.org>, anup@brainfault.org,
	atishp@atishpatra.org, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, martin.lau@linux.dev, song@kernel.org,
	yhs@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org,
	sdf@google.com, haoluo@google.com, jolsa@kernel.org,
	bjorn@kernel.org, luke.r.nels@gmail.com, xi.wang@gmail.com,
	namcaov@gmail.com
Subject: Re: [PATCH 00/10] RISC-V: Refactor instructions
Message-ID: <ZPjKGd7VstwIKDV5@ghost>
References: <ZN5OJO/xOWUjLK2w@ghost>
 <mhng-7d609dde-ad47-42ed-a47b-6206e719020a@palmer-ri-x1c9a>
 <20230818-63347af7195b7385c146778d@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230818-63347af7195b7385c146778d@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_115118_243749_3738537D 
X-CRM114-Status: GOOD (  20.97  )
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

On Fri, Aug 18, 2023 at 09:30:32AM +0200, Andrew Jones wrote:
> On Thu, Aug 17, 2023 at 10:52:22AM -0700, Palmer Dabbelt wrote:
> > On Thu, 17 Aug 2023 09:43:16 PDT (-0700), Charlie Jenkins wrote:
> ...
> > > It seems to me that it will be significantly more challenging to use
> > > riscv-opcodes than it would for people to just hand create the macros
> > > that they need.
> > 
> > Ya, riscv-opcodes is pretty custy.  We stopped using it elsewhere ages ago.
> 
> Ah, pity I didn't know the history of it or I wouldn't have suggested it,
> wasting Charlie's time (sorry, Charlie!). So everywhere that needs
> encodings are manually scraping them from the PDFs? Or maybe we can write
> our own parser which converts adoc/wavedrom files[1] to Linux C?
> 
> [1] https://github.com/riscv/riscv-isa-manual/tree/main/src/images/wavedrom

The problem with the wavedrom files is that there are no standard for
how each instruction is identified. The title of of the adoc gives some
insight and there is generally a funct3 or specific opcode that is
associated with the instruction but it would be kind of messy to write a
script to parse that. I think manually constructing the instructions is
fine. When somebody wants to add a new instruction they probably will
not need to add very many at a time, so it should be only a couple of
lines that they will be able to test.

> 
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
