Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE3FC282C5
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 07:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MrJGQ/ARaxhb59OW8tQpKVq47S/Nk6AJCagunPI7Fc8=; b=guGxzMYHH0yqpZ
	iMqHAd3UBASAZSShD0lH5ahhCyLjHV+8wvxAXcb/404iDRUDP7iizlMLgnEtaCU8e+ldWzniKwXXz
	/AgSKmnZy8tUY3JTueyqt/Wq4HY3opWqtV4/ETPmOHRuAnYxihRM2KIIipWLu9EJO4cEDp4GlAIRp
	Zdck5Qk7VTSGEQ+IOPLW5/QJMX5qcaR+h2ro3T9ogjnqyXy0U4UnimH7qiw+UX6yuB4IXA35sc/lB
	7AUIsNn+69QmltxMxE9YQKD1CB61wLF1oElqsPymMdEzZUcQw7+cd4y5DUE7Jp5/wGaAGorGe/Yev
	FzGP9T8CINBLiWRIlWGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp01f-0000000HPZb-3vnU;
	Mon, 03 Mar 2025 07:15:43 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp01c-0000000HPXw-3jkX
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 07:15:42 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2238e884f72so19108635ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 02 Mar 2025 23:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740986137; x=1741590937; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3xf7HJyOLISUqnBF4lpknQTsncyxq6apcdgU1Q2bwI=;
        b=YgvsSN9MJ+Lb1CDMHpW2gqq7DpanaebfUvcbHO0Iv7DIdJeLxmDvLzX4awjF/Lk8bD
         WqdrXQsVYiKVnvqQX35U74BzWw9mCsiplEZxilR5xoFyPYrt9+4TrHR7BhIux781WWaY
         XPk1vN3z4oiQ9BIwXlrHEwSXRus9/JD+lH7MsjE7yf/qnlv25VbVuui4ewBDCYdMeUIA
         WQWtrJceU5uLpY+dLNn2+FaqLKpHJRoJyfU6VSziK9rOdmOLdOKZlNa+aw4PmsihaW6b
         OdkgQ+IOV7mPsIGvI6Jqzqz6ergML3IjMyiaUdzyNvB/anXqVQP/uClDasLjjLpTJ1l3
         ZT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740986137; x=1741590937;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z3xf7HJyOLISUqnBF4lpknQTsncyxq6apcdgU1Q2bwI=;
        b=Lwbc4oRETf7+DQp87s3Bo4m0V5ExrD0al7bFY7P5nQD1H7Jt94Ky5Q/2nKdVtP83oG
         GHkOnsE71I1a6g6XWPnBwJCAT1/5g6sw3LqNPyexWMyHkAfjE1Jc2pxAjyq66QBF2X7B
         Nj43a8HUacl+1LSvA0Q+HSFK18o8JcIpB6rsivPyFBADSD7skpBvOxdzi3PgHY3OhLgO
         XzAoAsqJoOC0+BgZRz7ggwYHdqHGWZ/Yek+jQbN/WC8l6I5yD3QWLUdwp89xWMfT8SZW
         HAo12v5TCvX8vlT7fPa99k5o+SN7THRhfLOKgyytMZnh0QOSSuVS7kuzUf0tHT41g5h3
         rHMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXju89eYa2t5x0Z17hI3ktKtBWF6OhHa7HormLVcDHYIa/tTwmeV3lzNA+b1aV4FCgLbSeNGw5zdTq2uA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyougIfqViQjaLXlU5+Ssw5qreJ6JzF681nywE9hwBL6gLSrQdb
	1nxE8LRSYQstpY90WR3tqEkDAdBp8P2irQn599+s0xM7Fro/ARADIhZXCUilgyk=
X-Gm-Gg: ASbGncsPL7wgl+Bg9CavbookF46CSEgxGSqyi7eanoM5fDP+QvRxrxRPaUfzNfXHWjN
	oR4f279ZOEyMpox4VJpC6aemOQmYxS9ujHZ+J0zegzjfA0UVdnJ90IyV38Qn2T1HZPX3MJztzWW
	RJFRFWH/TgaRNbw6Rnyrv58mBel3Jm3w+Ow3bOe5Jf8O6zMpPF5dNn6HX61n/UYJoCUWBUxhfvB
	eQ60Po7zOPbZs+nZRKPGPUU0TdbuwFZZggWqzS8TsxiLzYkytFJzSD3zyoang5CHEf64UepjUmq
	gHTOTPbgl7e9XcIRC5MnQDO58W3wfR6OKFrOQ88EaBAHKdBVogXHg31gfDONYfo0nBCYPQ==
X-Google-Smtp-Source: AGHT+IFFzAQLESy+9XTrR371K4l9s8+Ug8zXVzf/oXiEIXCRNjxwSBTp4Oh3Iq6eaMxuwqzsZm0CFA==
X-Received: by 2002:a17:902:f64a:b0:223:5645:8e1a with SMTP id d9443c01a7336-2236926727dmr181629675ad.51.1740986137075;
        Sun, 02 Mar 2025 23:15:37 -0800 (PST)
Received: from [10.68.122.90] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2235050ce10sm71093955ad.200.2025.03.02.23.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 23:15:36 -0800 (PST)
Message-ID: <4eb93ca8-7526-4709-b43e-2ed9e5583e3b@bytedance.com>
Date: Mon, 3 Mar 2025 15:15:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] riscv: pgtable: unconditionally use
 tlb_remove_ptdesc()
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, riel@surriel.com,
 vishal.moola@gmail.com, david@redhat.com, jannh@google.com,
 hughd@google.com, willy@infradead.org, yuzhao@google.com,
 muchun.song@linux.dev, akpm@linux-foundation.org, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, arnd@arndb.de,
 dave.hansen@linux.intel.com, rppt@kernel.org, alexghiti@rivosinc.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org,
 linux-riscv@lists.infradead.org
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
 <9025595e895515515c95e48db54b29afa489c41d.1740454179.git.zhengqi.arch@bytedance.com>
 <CAEEQ3wnvgX=Bq=oAQV6wfg5a7H2jiG7f8P6trbC9agJ8D6t4pA@mail.gmail.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <CAEEQ3wnvgX=Bq=oAQV6wfg5a7H2jiG7f8P6trbC9agJ8D6t4pA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_231540_937964_2C60E413 
X-CRM114-Status: GOOD (  11.44  )
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



On 3/3/25 9:45 AM, yunhui cui wrote:
> Hi Qi,
> 

[...]

>>
>>
> 
> This set of patches mainly refactors the remove page table function
> interfaces. The comment "riscv_ipi_for_rfence" has been removed, as it
> was no longer needed, and this patch handles that.
> 
> Additionally, whether riscv_use_sbi_for_rfence is true or false, page
> tables can now be released using RCU. This patch changes the previous
> synchronous release logic (for !riscv_use_sbi_for_rfence) to an
> RCU-based release.
> 
> So, Reviewed-by: Yunhui Cui <cuiyunhui@bytedance.com>
> 
> Based on qemu-system-riscv64, I tested this patch. The log is as follows:
> ./gup_test
> TAP version 13
> 1..1
> # GUP_FAST_BENCHMARK: Time: get:663365 put:117 us
> # ok 1 ioctl status 0
> # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

Nice.

> 
> So, Tested-by: Yunhui Cui <cuiyunhui@bytedance.com>

Thank you very much for your review and testing!

> 
> Thanks,
> Yunhui


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
