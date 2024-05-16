Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0547C25B77
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 15:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JziHxNEQIk22RL82F6Xcvs/CPNsl/4F4dB2EtararJQ=; b=LBECE5XpXpTEDR
	Ri4a8cbIrPEFttPqeKVnE3/QHQHJ2ojNgGVglNKWsuGd5Jg+2kclDSscwNl6t+UoyQi575VQFAqTs
	hh0wAo2BdQl2jxA5bQDRKRpW+8QH3KlQ2BJxO5VUWlBG+ya1CBHN5RmbrebQj1SLSc0L6IiOfvayF
	XIC3jXp2ogBm6813hDXWmLn/QN4XQU9jAzdKSdzspTNCD3av3D5DFoe1mvMMejnw0eXgsCAkLSF8G
	uzXsr1GyBZ9Z/79nz/Gr14bKAADrQx6SWF9qPPiSefH89fnqh9cAQMUUyUc5s1ZH9+ENzEchOjjVN
	mE4a7jgZk193WNDHo67w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7dN2-00000005Nf2-0Qlg;
	Thu, 16 May 2024 15:50:16 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7dMx-00000005Nam-2fHH
	for linux-riscv@lists.infradead.org;
	Thu, 16 May 2024 15:50:14 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7e1b88a886fso5548839f.0
        for <linux-riscv@lists.infradead.org>; Thu, 16 May 2024 08:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715874609; x=1716479409; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P+iK/FVhZ4HUNEOzdTMBxIyNYiEbX2AZzsfqmN9W/BY=;
        b=L1+cNQYa/3XcKo6eHb8V4drHuwAvre8XFERScmKB1mjlm7Txw/tdkt9mPCdAsAoWFg
         NSSil4lzN/gzqdK0TW0HQuJMHvzNdJN32Rk1t9i/TVqCmm6fMplwDfAK66EryS0Ba/ij
         kZDuA4wrMRIbwZ8exoOloSMB+X0x9TLX8VO1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715874609; x=1716479409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P+iK/FVhZ4HUNEOzdTMBxIyNYiEbX2AZzsfqmN9W/BY=;
        b=VX6fYGVJGt56iIy3e8Ups3V65W736LDT9Sea95c569fqwPqG1TA3kgkmxcvKZu0p0m
         To2mAsD4wSRSOJnhK3y918XDqsZ3n6RliLSXLb5fE16xEpI/8kw4k8TqDwk0AlKRzCvq
         xT2zkDIWxDnpYj6MIL/vLBjKtz4Tyhd4qT45QT0o4iH+arwWmYvPOH27I+DZwsSw8ZkM
         Nc5E+ipeDI3dACLC4T4PEMVBb6S6xt7f0qAVPF17EdlRfotGSLdWsgycWvPtClnH+Faa
         HLq/JlSgOqQv5L5XP10WI/WDPVDDxk9UkwC+SHfMkKsIKyfKy8kmVlQ6wDDKSNL14JYd
         EKWw==
X-Forwarded-Encrypted: i=1; AJvYcCXPnsoFdguqsCOFs3OnYIiWDneAJLjIlSbFUyy1r4yPlI7NyD72eGV83t0eUkDph2wDTCdOSFuxqMWbWIfyt5+d6ch5jinNyfbQMpxIniwE
X-Gm-Message-State: AOJu0Yy2kE/l6iuUm4IDkARWwXOGbe8zvwfh4saPG+RZF3yx+Ofg2Q9v
	WcxYwmtLwSEDuVaypj5ozVuJ0sczhZougZLyz5g2yEjhto9Wh6eC85MeVIXCnA8=
X-Google-Smtp-Source: AGHT+IFJbIeUVLI7ISOMfUKtjb3QlrF6+MESxVkubwkrIwTVWoi4y8+3A4qy7lb3Ntw2ajnuWMf8Hw==
X-Received: by 2002:a05:6602:59e:b0:7d9:eeb8:ddeb with SMTP id ca18e2360f4ac-7e1b5202ae8mr1886131739f.2.1715874608958;
        Thu, 16 May 2024 08:50:08 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-489376de185sm4147976173.150.2024.05.16.08.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 May 2024 08:50:08 -0700 (PDT)
Message-ID: <bec3f30e-fc9a-45e2-b6ea-d739b2a2d019@linuxfoundation.org>
Date: Thu, 16 May 2024 09:50:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/66] selftests/cgroup: Drop define _GNU_SOURCE
To: Tejun Heo <tj@kernel.org>, Edward Liaw <edliaw@google.com>
Cc: shuah@kernel.org, =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Zefan Li
 <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Muchun Song <muchun.song@linux.dev>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosryahmed@google.com>,
 Nhat Pham <nphamcs@gmail.com>, Chengming Zhou <chengming.zhou@linux.dev>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-team@android.com, linux-security-module@vger.kernel.org,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 bpf@vger.kernel.org, cgroups@vger.kernel.org, linux-mm@kvack.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20240510000842.410729-1-edliaw@google.com>
 <20240510000842.410729-9-edliaw@google.com>
 <ZkJHvrwZEqg6RJK5@slm.duckdns.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ZkJHvrwZEqg6RJK5@slm.duckdns.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_085011_934530_EA1FB126 
X-CRM114-Status: UNSURE (   9.87  )
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

On 5/13/24 11:02, Tejun Heo wrote:
> On Fri, May 10, 2024 at 12:06:25AM +0000, Edward Liaw wrote:
>> _GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
>> redefinition warnings.
>>
>> Signed-off-by: Edward Liaw <edliaw@google.com>
> 
> Applied to cgroup/for-6.10.
> 
> Thanks.
> 

Hi Tejun,

Please don't include this in your PR to Linus. This patch series needs
to go together as it is causing several build warns and some errors.

thanks,
-- Shuah

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
