Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97D4C636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CvmO9rc8qFM07IKKTrS6S5ofe4B3GcEpEVAY2sXR6IY=; b=KnKmNaWuVeFVpb
	Eg843W+i9pb8metGanVqggJwvUCgZgqymiVskmvednJBT0OkCLU3HtPNKQ+LKFWzVtQIOJYEV6Nq5
	X6lopTfP8viqCBRQJC+QmES6E4bZhaGbyNgt81jSy7+J1ZvP2/roLdY0gQh5mcCklq2A5cUm8nQxD
	B8sQ1LvhF6hLFhoJ9nhlxVg2KLOjyGkSRhJYwL8JG+KuD0eBlEjyWLK6Gcz/EMQlsy0uN8JVW4HOV
	P66lnsDmcG/05vq/rXYplGRUE8dZgu7M8i3rn5C/M8ic4HW8k91KoPRQg3Myl1ZlOu36wOm8t5Wn3
	TE4HdFWEm50WP+21hI7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMZJE-00584P-QB; Mon, 30 Jan 2023 18:55:16 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMZJC-00583c-Bq
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:55:15 +0000
Received: by mail-pf1-x435.google.com with SMTP id g9so6467941pfk.13
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b3PX0zQGrK5y8iu02KEGBurLYy151zBq8KyGCmE0yjY=;
        b=AMd0kXmr9vmpbWaluw+VMzmIcJDFwS4jzcz82kHNX+SsxxzmMgzS3qoiQYiKXEYS0e
         j5z3LoWReQ0iZbUUW8RXHnkIr0REJ0c8LlYYvUgk8SzWgl6jOxowaet1RYlyWLjNrFd0
         P6754dPAWJ7i3tauY3KgyUZgDA7bewMXZ/xpOF1JbFfMSTHyKcb+0VOSePmevhHGU7F9
         UC4Cc0EyD3syozcquv5TDRSnnLDniHZPQUfCix7Vs7u6srRTC2EvcvbLcEqLnCc3WB37
         r+TP9pnxJ+KT2WYrVXcyoz06dSRBZYs4XmvKIHdUTlEK2BSUi8YjP7k+5bkXRzLpW5Co
         97Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b3PX0zQGrK5y8iu02KEGBurLYy151zBq8KyGCmE0yjY=;
        b=wnc2ccykZ9Nm7+INfMqVK8y18Q/wyDpfUK2zjMDduqONjwgW+wCLSNXJsjOf5x15X5
         5u8gM2OFaUez+lOFwX8azGa6N/eA6mi19k3IUMrq5LTaEC24meOFFT4MG4mAetk6otw0
         Zdqdhg7/AyexYqXR8I67LiNoCJx51mJjK4cvxlYqhNVkFLp4fhwUc7MSnY87eIv4WoYJ
         ET20yaeOPHA5RJOzYvNkvLlVKYTFnINK3QNMQ1k7pZAIEttqKcgXqYCOCCjeYqQQgAWX
         PXDgyKBx1A6lWpo8JoAl1lN/7Ey+UZ8vvrE98/VPjrQK5nGY6AGcGLraWfpeUc0jB8kO
         2WRg==
X-Gm-Message-State: AO0yUKV0LwHGJTP0RensQrMLZ7K9OuxXva1MPQ94eKa66s6OMhQh26EV
	jp9MghOHTeG/myFTnf4QMYYNCQ==
X-Google-Smtp-Source: AK7set/CODbF1cofKbp2tye5jjqXv4RO9tqNp12t1qheBpmw51d7+fqFth63TATK6xiAaNxji8CSFg==
X-Received: by 2002:aa7:8742:0:b0:593:b115:e2ca with SMTP id g2-20020aa78742000000b00593b115e2camr5236184pfo.9.1675104912370;
        Mon, 30 Jan 2023 10:55:12 -0800 (PST)
Received: from ?IPV6:2601:681:8600:13d0::f0a? ([2601:681:8600:13d0::f0a])
        by smtp.gmail.com with ESMTPSA id x62-20020a623141000000b0058d9058fe8asm7747970pfx.103.2023.01.30.10.55.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 10:55:11 -0800 (PST)
Message-ID: <5afd356d-7ed6-6f14-49be-246ff43d233f@ventanamicro.com>
Date: Mon, 30 Jan 2023 11:55:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 0/6] RISC-V: Apply Zicboz to clear_page
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 kvm-riscv@lists.infradead.org, devicetree@vger.kernel.org
Cc: 'Heiko Stuebner ' <heiko@sntech.de>,
 'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
 'Anup Patel ' <apatel@ventanamicro.com>,
 'Palmer Dabbelt ' <palmer@dabbelt.com>, 'Atish Patra '
 <atishp@rivosinc.com>, 'Paul Walmsley ' <paul.walmsley@sifive.com>,
 'Albert Ou ' <aou@eecs.berkeley.edu>,
 'Conor Dooley ' <conor.dooley@microchip.com>,
 'Rob Herring ' <robh@kernel.org>, 'Jisheng Zhang ' <jszhang@kernel.org>
References: <20230130120128.1349464-1-ajones@ventanamicro.com>
From: Jeff Law <jlaw@ventanamicro.com>
In-Reply-To: <20230130120128.1349464-1-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_105514_440209_9792BA24 
X-CRM114-Status: GOOD (  15.86  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

[ Sorry for the duplicate.  Andrew indicated I'd used reply-list rather 
than reply-all.  ]


On 1/30/23 05:01, Andrew Jones wrote:
> When the Zicboz extension is available we can more rapidly zero naturally
> aligned Zicboz block sized chunks of memory. As pages are always page
> aligned and are larger than any Zicboz block size will be, then
> clear_page() appears to be a good candidate for the extension. While cycle
> count and energy consumption should also be considered, we can be pretty
> certain that implementing clear_page() with the Zicboz extension is a win
> by comparing the new dynamic instruction count with its current count[1].
> Doing so we see that the new count is just over a quarter of the old count
> (see patch4's commit message for more details).
> 
> For those of you who reviewed v1[2], you may be looking for the memset()
> patches. As pointed out in v1, and a couple follow-up emails, it's not
> clear that patching memset() is a win yet. When I get a chance to test
> on real hardware with a comprehensive benchmark collection then I can
> post the memset() patches separately (assuming the benchmarks show it's
> worthwhile).
> 
So a note.  On the userspace side we are using cboz for clearing memory 
in memset.  While the data is intermixed with other changes, there's a 
very significant drop in stores and a host of related low level 
performance counters and a notable uptick in gcc #5 performance from 
spec2017 which is particularly sensitive to memory clearing.  We haven't 
seen any performance regressions attributable to using cboz across 
spec2017's integer suite.

I believe our current threshold setting is to use cboz for chunks >= 128 
bytes.

Jeff

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
