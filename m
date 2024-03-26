Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98141C54E67
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 22:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/vTFfEOdFjDAjqndupwHFn3pS2UkjFL662LgfvsuKUA=; b=p1jK3trfDY1EAv
	yggs/Lyv9EPvA+kI4tcefmNbL1EBP8Y35zKjDn30WmVzsGc/mwpclRrSvYcmhbN9P/9G6eDJPUUhU
	viyBRwI2uy1WzWJUBFp7aGJm9Z5MsmbZYs6uSvIS8T89Wh1D3OpFAe/d9e9NhP4aFHXHdwXpmgt6b
	H71Xsi2So5At8Ny6SdFOcwUKBVYVFQmqDqaEGAw+K9hAi++kElJa9+dxr3XZCMxnoihKTSgcVAsaN
	fuLLbcZx0/1SrwpwAtDDqzGgK9wbW9P3T/An03ASt2pbmdSsV8nC2MeuIHtCLhj0nITOSL0otccP9
	Fp9y+DgF5SUvmdXpGvuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpFJ9-00000006ghP-2gvr;
	Tue, 26 Mar 2024 22:30:15 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpFJ6-00000006gfo-3mDF
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 22:30:14 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-341cf77b86bso1754386f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 15:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711492210; x=1712097010; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=79Q4JSiG520z9H9GgKa1sOqwXXSclwi98WKQxVVkT0M=;
        b=bmGhQrSW0dMHRHCgOyjknwZASakaZidrXtRvaOeew6e9JF5/0FE3UfvE7l9y3tAsLh
         nKqkgJS/t+6hbbhYyAdKuo9C2ka82jdcxVIHBOPXHb40VoEpf58gXFXlYxW+job9Rt6r
         uv3IkIujTuNUTq6DMcdEGa7SXArzkZ2pGGQc+qVqUdi0W9sfgyACHWusXUP6ByLyT4XR
         +wCbkmYg6scX8bmB88b4JoW0Y4gr2wNK0F574y1K76ypFV9kV8wid3DLdXnbLbMX+Sd5
         tBy+ZF/BAZeHPgIemjxrCe/LmJ+pDVObmiXRjzH66HpulD1PHcNpJ7AEBnIBREk8gKc2
         51Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711492210; x=1712097010;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=79Q4JSiG520z9H9GgKa1sOqwXXSclwi98WKQxVVkT0M=;
        b=H3rOHEtJgkfQuQEvg/ZimdLIJJW88ZE9c41/m6qva5C4F2g8SakA++t7FYcT7DLJlP
         yj0zbJCQVLdo8K76hOwr0pL5VZP2Uicnkyo3VYwteVHYwhgSFWDm04cNRl4YoWr8zLWq
         +lL0LH/L1ytsBIXoDTJyaYxW5ZwaXSxeYjbp8/xtnpbQUYKsJvb7NyosCxHAcUbIP9oY
         p5SJBIKEuVSRXn4rQUF23HvaATFRqZv+0gtkatvpeODt3Fm+rHhraPcxziv5Yf1ws14c
         kzIpnfel19rMMEr+mM5hRIz3K95/KOAivhC6s9D3ShwKp6Tk8MQDwe/PIVRevoeoz3Rs
         ydxA==
X-Forwarded-Encrypted: i=1; AJvYcCUbJUwmkF09ldVFswiAyj1mnD5kf+podBG7BnpX6RH86ePxU9aQfuBkvBbsWlP7/3Pq5gwbYspCkfzkg3qD0Daf4puwKrHjmP12V5bORLOJ
X-Gm-Message-State: AOJu0Yy9uUSAba7RHK22azUyt7Y/qp/O6pqzLR9Nx+n6au0KkBWUOPJl
	gGY9FK9zEDfauEe9FQXhInBOZ8oXnob23/h+XMqP/5wGbtDfcjY0
X-Google-Smtp-Source: AGHT+IH0zSgzCJUjVH92vO/QU4aWl7q+QMkDuJzT8hNDUaeajUA4XPo0MJSogLhPYHSfb6174eXpOg==
X-Received: by 2002:a05:6000:5:b0:33e:c389:69ff with SMTP id h5-20020a056000000500b0033ec38969ffmr502235wrx.68.1711492209958;
        Tue, 26 Mar 2024 15:30:09 -0700 (PDT)
Received: from localhost (54-240-197-231.amazon.com. [54.240.197.231])
        by smtp.gmail.com with ESMTPSA id h18-20020a5d4312000000b00341bdd87fcasm11049415wrq.103.2024.03.26.15.30.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Mar 2024 15:30:09 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Pu Lehui <pulehui@huawei.com>, Daniel Borkmann
 <daniel@iogearbox.net>, Zong Li <zong.li@sifive.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH 0/2] ftrace fixes
In-Reply-To: <20240326203017.310422-1-alexghiti@rivosinc.com>
References: <20240326203017.310422-1-alexghiti@rivosinc.com>
Date: Tue, 26 Mar 2024 22:30:07 +0000
Message-ID: <mb61psf0cvd74.fsf@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_153012_991885_7C26F3CB 
X-CRM114-Status: UNSURE (   6.33  )
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

Alexandre Ghiti <alexghiti@rivosinc.com> writes:

> Both were reported recently as there are efforts ongoing to
> reimplement ftrace on riscv and both are independent of this rework,
> so here they are.
>
> Alexandre Ghiti (2):
>   riscv: Fix warning by declaring arch_cpu_idle() as noinstr
>   riscv: Disable preemption when using patch_map()
>

Thanks for this.

Acked-by: Puranjay Mohan <puranjay12@gmail.com>

for both patches.

Puranjay

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
