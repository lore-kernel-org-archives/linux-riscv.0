Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93CEC61D90
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 21:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0WwLe8sWBQ5nCd+0CnErV5z3MR3xjDYW1fQJB5Ze4TI=; b=z0HI/1rrXQvB05
	q23m7AxoF9ZrwNTePtAzBtR2DLjiwWM7R5Ra2Gu4dfYIM/UMVkJstoKbEdesu+LXC+7mHtblQrhCw
	sSi1HpL7tvHPPoILtcQt7Zl7U8z8ZwnvplXJUqVFqc2nNyyvddaJPZQBjL3Fdvt5v06WaLQyAGmAm
	Pwyo4h65yNqyp2uDmMzgAf6OYYjaNnfqyf+mvuI3Pco7laZDspILHwkiRdIdNuQ4R1BnyCDDT4MYs
	rD9+LW6KwSoMG2vwhEW9pP7wqZ1+zfgKo3E7eLtPW4CyhyGFAscFsOciBjSugjTKMH9JRPXxLE1GM
	MU28ru/VlrwQ3qSh2LKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5YNU-0007YN-2u;
	Tue, 21 Nov 2023 21:33:52 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5YNS-0007XM-0k
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 21:33:51 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3594cb642beso21832575ab.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 13:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700602428; x=1701207228; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LPztFbk4Qh4+TpFn00idAb8rtvrdHgK3UzVmP62xEfo=;
        b=m8MN7LMD6GO0ZdnqhtPVzHmaOifRj94vPYEI2nZqr792g1z1wXdfDU4IpCJ0o3PgEe
         U5Wfq2bYMnE5ESUjMIxhyS0l6NxdqF9k2oJ+s1PMolK02nKWxhIRrP5M//H6QI2n8aQs
         mYqLkU41fwSR6q8S9UqwhP3nYjeKngLkFT9kfjNYUkFzubvg3/kPfmyxOaisPh0ZAeZ1
         GO/qMMNKVgKPHIADk+V6lZ2Q5YgWxOXRqH2zLyMSclOJvOwBb1ZiBf3jIgZbcUrklV/2
         HeIgs3bV0wBpcSBoq998M9hosQ1X21RrBlGTewGYn60t0IzqwHQuh1E+oztY/mG1JlT9
         Ic0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700602428; x=1701207228;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LPztFbk4Qh4+TpFn00idAb8rtvrdHgK3UzVmP62xEfo=;
        b=GZNXXbxPm2ASLc27Fau8a+2wIume5EgIGBZso6ktpcEVEmZpPOagiFNO7tnbIhoQWn
         Tgt0Mtm2vDzu8tc6ZsvcVRJErUk+ujTkYO2RW0Wo9+oVmwqFZ1bInZzJtFm6pha3wvxG
         1KnKriZ+aBXBNvjfEfl56LK49UtEIO87GQgayNjiRL+I362j1ffntFN62P2f0YKxyUxO
         QDzOUX5uLzgzrRtJbXowb55vMhZ12ZQtFGrPhA1UKvVuk8wyvcRw1e2Xid1M9ES9weKq
         hAbnnK2E3KQQZ0z7yE2YlmZ5n+XDzV3PolzAgqfVFcW/Qhkf1nto8yV0MFlVQvSM91PN
         3Lmw==
X-Gm-Message-State: AOJu0Yyb7/+Hq7ZW9LhhDEIXLu1nec3IULaDIQmIoR2Q+G3Y6rKcFUtl
	TyO+tDR20TNY99Dep2Y7MqyiZA==
X-Google-Smtp-Source: AGHT+IHKzUB89PXmzmxg0SBTE7Y7V3/XjTJPY5gtt8nLPa5ZqRByXXPMB3TdlqkpHQoScoPBVhoi2A==
X-Received: by 2002:a05:6e02:1d13:b0:359:c24b:9ee1 with SMTP id i19-20020a056e021d1300b00359c24b9ee1mr242798ila.14.1700602428216;
        Tue, 21 Nov 2023 13:33:48 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:9465:402f:4b0a:1116? ([2605:a601:adae:4500:9465:402f:4b0a:1116])
        by smtp.gmail.com with ESMTPSA id cn16-20020a056e02389000b00359c464b632sm3413438ilb.52.2023.11.21.13.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 13:33:47 -0800 (PST)
Message-ID: <c5c11a56-7aec-48ae-b3cb-ae72f2352c28@sifive.com>
Date: Tue, 21 Nov 2023 15:33:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Correct type casting in module loading
Content-Language: en-US
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20231117-module_fixup-v1-0-62bb777f6825@rivosinc.com>
 <20231117-module_fixup-v1-2-62bb777f6825@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231117-module_fixup-v1-2-62bb777f6825@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_133350_273318_74991C2E 
X-CRM114-Status: UNSURE (   7.92  )
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

On 2023-11-17 1:56 PM, Charlie Jenkins wrote:
> Make static variables static and use __le16.
> 
> Fixes: 8fd6c5142395 ("riscv: Add remaining module relocations")
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/kernel/module.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
