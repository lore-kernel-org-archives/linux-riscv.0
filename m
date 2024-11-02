Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04C0E67809
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Nov 2024 20:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gb0KmxwtASDRcsaM/IGhp32zpCEgpimh4FbREzIwFHA=; b=5GAUqzDrwoR5oj
	K5KloBSzHEyVubVcZLc69rMUfKTp/WeHL4z/w7PTWhj7Jk3kdpAlnqITFiEzNg3SvfGS4OhQzbuWC
	zHv3aACNU7UvhtMK38ouPchGqsVV653lEgPhKvrCg6GUzWMTX7fpl36oCCJuifclxbmP0Lwgs/vHA
	nEf5uc5w2ZgKAxK7b61MQZGKRwUDUsbO+dmWvB67f1+TLKAA6EAuh0iLagFx7hXIOgviK+EBTTd1+
	OWbYSQ1xGrMQ32BqvfQENtHru3FEtAjvjUvjpILr8pZPYWF9377Hr1tpfsZFXPpfwt13VWvS/4CHt
	eSYY3k3kd/nXqYpWE14Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7KYL-0000000ALls-3xnq;
	Sat, 02 Nov 2024 20:16:57 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7KYI-0000000ALlE-1Ktb
	for linux-riscv@lists.infradead.org;
	Sat, 02 Nov 2024 20:16:55 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3a3a5cd2a3bso11220615ab.3
        for <linux-riscv@lists.infradead.org>; Sat, 02 Nov 2024 13:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1730578613; x=1731183413; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mfwK4sEdTx9F/aBDurQK3UATh0DRHqT2tqgZLd5JDpc=;
        b=P17Pg8mJKXxv3aJOuG5jHeDVxPQpjtgAlm3BlYrbVuURJGyRu+/36wG+nq0qHH9rOx
         8A4pAnQdlKvt6uInGM5GylMQKxK3bITjdBgGF+TPBHlXQeHNXa/K0CXhw8mISGmFPFvq
         sIbIlKiqSLCyG9PfyrhvAvQHmG3qgslgSgYOnkaQDR6tU1pOUjCR6G8ud6tLR7s5ekWP
         mw5XRAIJGjvX1BDQ1eKcoU5GxivoceEDV9dc2SH4zRW46c7RvDdto1LNj0LlPvWh6s8f
         CT5vZrslRctwjLnCyBUJjXWAXBD0Z+nQTsCPMCBur181SP+UL9TcygyXyEkpvAEHAP7Z
         o7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730578613; x=1731183413;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mfwK4sEdTx9F/aBDurQK3UATh0DRHqT2tqgZLd5JDpc=;
        b=U43hROjQ6wQZXn1vfr9TU20rRtnHBC1M/zd+xr+wCMPLEzWr2tV9H7Fc+a8P+ki3/Y
         TQUlG6I+PCLUP9u8kZFvpI6ezfbsavs8wXb+g+ySv6o+YKnxJrkMGOv48caXVpKc09bT
         SudzfYVLsJnMoesqlJ91z+TN4VyMwPjrfzT3mTF9NUzEU5aZSZ3/66xTVvnNtzk/x30r
         uX8CP9f5i7TsH8AIIG0KNUYxspHE4gk6F+M3+MmMQo8fKUKgnTC1x5aTtYkGSz4bW5SZ
         1rD+fK/KGVZjEd/1R4oNOlHIZnSgGxr5BwXskckwJ2YRgYr9jQy7v10q7sy/hGelxmfe
         SizA==
X-Forwarded-Encrypted: i=1; AJvYcCV2OzVVpUOiVc2KyzzO3uF1nW3FHRZAreaEqn9KSJ/bnjA9CSWc77AKy4gt/L8os6GlCHumolfB9Nxddg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqZ//yNx0olP4+VJHLzbSSu0ZD+LavlCHWD0wY3vZ+UihpGAvV
	OJeksTEboxHfRRJjx2XoPBdkZt3P17XMZ6QCwhNLelQR5tBUEogQBSrPwda5Uco=
X-Google-Smtp-Source: AGHT+IHxkCjpiwvEUT4o38BUaI3lSwIPU5kBEbJUiHJaWVt4Bg1m1dEkBKxTOmT48n1sycp0+0I3CQ==
X-Received: by 2002:a05:6e02:52e:b0:3a5:e3bc:c1bf with SMTP id e9e14a558f8ab-3a5e3bcc3ddmr127637225ab.23.1730578613043;
        Sat, 02 Nov 2024 13:16:53 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a6a97cf520sm14786615ab.25.2024.11.02.13.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 13:16:52 -0700 (PDT)
Message-ID: <43f05f71-71f7-4073-ae3b-5f5fa35ad2b8@sifive.com>
Date: Sat, 2 Nov 2024 15:16:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] RISC-V: clarify what some RISCV_ISA* config
 options do
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>, xiao.w.wang@intel.com,
 Andrew Jones <ajones@ventanamicro.com>, pulehui@huawei.com,
 Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
 Pu Lehui <pulehui@huaweicloud.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>
References: <20241024-aspire-rectify-9982da6943e5@spud>
 <20241024-overdue-slogan-0b0f69d3da91@spud>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20241024-overdue-slogan-0b0f69d3da91@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_131654_432886_DE619A14 
X-CRM114-Status: GOOD (  14.61  )
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

On 2024-10-24 5:19 AM, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> During some discussion on IRC yesterday and on Pu's bpf patch [1]
> I noticed that these RISCV_ISA* Kconfig options are not really clear
> about their implications. Many of these options have no impact on what
> userspace is allowed to do, for example an application can use Zbb
> regardless of whether or not the kernel does. Change the help text to
> try and clarify whether or not an option affects just the kernel, or
> also userspace. None of these options actually control whether or not an
> extension is detected dynamically as that's done regardless of Kconfig
> options, so drop any text that implies the option is required for
> dynamic detection, rewording them as "do x when y is detected".
> 
> Link: https://lore.kernel.org/linux-riscv/20240328-ferocity-repose-c554f75a676c@spud/ [1]
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/Kconfig | 36 +++++++++++++++++++-----------------
>  1 file changed, 19 insertions(+), 17 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
