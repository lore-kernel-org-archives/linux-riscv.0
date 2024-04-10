Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38E7CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 07:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VRTP7puvpZbjNNqzAfxFfkuM95yEOyLOH2u9FndeTU=; b=lwwt23hQFSbI48K8tRCz7r0scO
	+M5Ue8AwLuE0B4qzLVbCiwE2sWBVNFOWY1uWFkED9zjifVK6yHlzxVrJctPYfdm2+rvDNOd3WpU3m
	Ks4bQJtne1FMDMokEsByijsimx/PwWOjGVnugsHLnASTKeQMH4jSXDfcrmsYxq9Ou2ZSs7MZrbhEv
	tidLR9HtMGtmtc34jDiHKmfU3ZJbVwgQ+O5U9b3j9+i2vm2CwpkdqBiLWPTpWA5l1unQ9c5RKr34s
	1yBrYAG0ZXd+0MyF1o14S/epeAWIcUxviCRo7sTy0rph8TJdQNQx7vTAOipGq6EBWXnAFTLcugmrx
	oEtitXUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruS8n-00000005Y8c-0U9w;
	Wed, 10 Apr 2024 07:13:05 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruS8k-00000005Y7f-3A5d;
	Wed, 10 Apr 2024 07:13:03 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-1e4c4fb6af3so6601925ad.0;
        Wed, 10 Apr 2024 00:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712733180; x=1713337980; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v8Z0HpTMm7JW0HfSi1migXbtT3L5ZfuOmq81pu08fxY=;
        b=dvFap8mYxj/KmqZwh2AIxG1mXPmTKOftSK7OWGIpnIw9B2A7Uh5jJmqPNlpSL1yLNy
         d5ioEM/wu2KrLmS6NzuxeGmTfTVamVDUdSpsoGg3MvZAlV5W/ZsnSRGYlNtfMiTYzGM+
         IFvxJBZo9A7HkE+7IaA7nookm3fKXPW+8Mg7sD/RsSRWgXN2+Bvx5mmpAUPEuIbTfjqA
         6phhhAz43FjQnwJjXMwVggtuJAbMAOGmsnuG9NYwmbNOfk3D4f0Fvk3bR6Jjq4rGDgNv
         LbnBQgzrL2XzZiwr49Sdb7BNsLf+nWXrqff1DNHn+xTKhrsY3NKaOSywTQcqFE2C/3ex
         eZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712733180; x=1713337980;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v8Z0HpTMm7JW0HfSi1migXbtT3L5ZfuOmq81pu08fxY=;
        b=VjJCQOnvq3itWwYxBsev3JqEaexnr9JbNl8N1PIJBCZk8+cuxJ1oHzfjO+Ueyj2S8o
         4fpmP1K0D0ldAgTu6xIuOVOvnMCNbTGH9vaIeKd7iDxndxhklt2gW+sLDc+0X9h3MEDl
         GOYeftRUSRwR/b+EO2q5erP4aatNylWfmRtRFzODZczD53fXzZn3e/NFXGqPbtWE/K64
         VJ+fkzLHD7rz2DQ+DWP2A+qyQIAeLBfhv1a+05cMBb0pILoTyZC6haaQCSw1aaqDXkX3
         GA6T42nw5Fjikw8eDE8lOWRwLRDYajD0mqWWbZaxmG2DS1g0JShoaUNBIEww+XpxgEMv
         d7tw==
X-Forwarded-Encrypted: i=1; AJvYcCWP708PYSuWpZsiD2pBeNRx+6QKuCfvdlde01JaVdxkZCkLFZmKRjGVH6nuYkLlMiIomIZ7CuZG0IBYYNZcbY0+4dTgwBDoPD9MPL1IRn4/ZuDRmO4mm9xWtsdZ2MrPQXAkYcluLFn8oQupH9Lr0g==
X-Gm-Message-State: AOJu0YxdQ9E/pbk6PDxWLfjxqE3bwRHgOwlhX7Tl2O01ews1lTBSot60
	7nRmLhnG3uyirCm6Sj4k2FN9nrJO130T/M3vhhQJiukySGRDkPRy
X-Google-Smtp-Source: AGHT+IFMrqnJaJlYiQxwL0LAGuOQ3kVshpqFKiYiLZtdnpGtgTDNithiisZ0+SBC0c+D4ORu1fIAqA==
X-Received: by 2002:a17:903:a8c:b0:1e4:3c7f:c179 with SMTP id mo12-20020a1709030a8c00b001e43c7fc179mr5797235plb.12.1712733179945;
        Wed, 10 Apr 2024 00:12:59 -0700 (PDT)
Received: from [172.27.224.145] (ec2-16-163-40-128.ap-east-1.compute.amazonaws.com. [16.163.40.128])
        by smtp.gmail.com with ESMTPSA id v12-20020a170902f0cc00b001e002673fddsm10100548pla.194.2024.04.10.00.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 00:12:59 -0700 (PDT)
Message-ID: <40a8d9d3-20a8-44e8-96d2-0dcd8627cfc8@gmail.com>
Date: Wed, 10 Apr 2024 15:12:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] RISCV: KVM: add tracepoints for entry and exit events
To: Shenlin Liang <liangshenlin@eswincomputing.com>, anup@brainfault.org,
 atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 namhyung@kernel.org, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, linux-perf-users@vger.kernel.org
References: <20240328031220.1287-1-liangshenlin@eswincomputing.com>
 <20240328031220.1287-2-liangshenlin@eswincomputing.com>
Content-Language: en-US
From: Eric Cheng <eric.cheng.linux@gmail.com>
In-Reply-To: <20240328031220.1287-2-liangshenlin@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_001302_830244_EC3AC929 
X-CRM114-Status: UNSURE (   6.74  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/28/2024 11:12 AM, Shenlin Liang wrote:
> Like other architectures, RISCV KVM also needs to add these event
> tracepoints to count the number of times kvm guest entry/exit.
> 
> Signed-off-by: Shenlin Liang <liangshenlin@eswincomputing.com>
> ---
>   arch/riscv/kvm/trace_riscv.h | 60 ++++++++++++++++++++++++++++++++++++

Conventionally, it should be named to trace.h, especially if only one. Refer to 
other arch's.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
