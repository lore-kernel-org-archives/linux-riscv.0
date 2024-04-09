Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B853C67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 00:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nn7DH8D1scG1OezDhMu7zMEWtjtmfwaqZeMOLzQFNcA=; b=EWcg+/ZK1ydEZA
	PzG2xdLzexs68VNaZ9MbhEgWKseoqqXPDCVhWAJPrzOSUeKEAuRs4I8DriFyFMgMQ3kRbaHbM2x/u
	KnIsVoXe2rgfh1t/umAc6qSTlCq7Baw7l8ywim7+poE3eI83DaZK4z/71LC/KWTNoAnf7HuXVLNzb
	qqG2FAj9wbkOKDcJu1E+nqgxLg6RSJEwDOo9vwKb761q+ZPoL1I9d/rx0SPVyd+oUHW1YPK0eNKTw
	nDRwVirg+Hh5lwRbANAngRCNonxvr6Fz5pxLAL+FvU2KMp2j2Ef4kkmxZdMh9Vr/6uPnFAuA8ictX
	BKJAW+XSmG7xsN4wSA6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtzFW-0000000HGGK-1AuC;
	Tue, 09 Apr 2024 00:22:06 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtzFP-0000000HGDf-3zat
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 00:22:04 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-7d5ee54dcecso63865039f.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 17:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712622115; x=1713226915; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k4RWqXaWFwmiNP6pNOx5Yfz/MuJboItuSjd5cmtvGoo=;
        b=IoeSieiXWHGLeF3hAvrWQCjM9ir3Viqr0Za/z7hd0Y7jmn2CMh2rrinEw2oP9ORrX8
         ymJI0zv/eG8kLDQSAwxvo0WvN8AHv3io0E42kg20RAHLEjYtd6Tngy4e0i/BlpStzbsO
         v42uzgZbi/XoItdI3ONegxrKYidWllnaOrCg0IHJ1aYDYRXTsNR7hmI5LsAdoy4/NCvJ
         Lm8CUJfx8uQLVexWADrQeARYhK7EgNk2j4mrSdak0bgwWn+mlRh9lMP+9dRhhhlbzLtn
         bf+ZWgjUrZru5jez8xLB3BvWzdXtOMB9K+5HDGBYnOuE8Mw2Jxc5FL4r88Spd/BE7EzA
         WrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712622115; x=1713226915;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k4RWqXaWFwmiNP6pNOx5Yfz/MuJboItuSjd5cmtvGoo=;
        b=xKF7V7RLqz9cnT27H+EaItwWCUDLXeFkQTiBaKcziCssZx0q/ifprbAxpfEHW8pnlp
         jS43YEE7bLEbidSc8gdgBvceXLeq4364cuMeiIOns26vod9zgGidGX95IfAZaZaTtt8M
         P9wGHK/VilZr48lK79pHdR8UohzWjOqAo7NLbhPVXzbu0KbK7YDWNwRV9PQXpLS5gOG4
         k3PyT41QoZYvFXi0hWl7jU2F+2hggJhhGW4Tvu+mEz1s+gADYuzkU65b6zl7zJiK+rAO
         ZCpVeG9QD47kLW+m1CX01Y0Wxynxa5O1FxBzj0k9at4wBL+2vQHJMQ/igAaShnXWaIiH
         wNyA==
X-Forwarded-Encrypted: i=1; AJvYcCWWx8/dilXFGNGdR4y/yeh9HU2Esj+khKhqncFwiAiCMe0x0g3ytZCteDH5tIK8Jd7AqXaCuU3kxCCXrcFbD+S7FtQ6uWwsA9aQUrjfjprj
X-Gm-Message-State: AOJu0YwaxKvPMn/FcU716jOUDfr4KLgoaT93toIg0HhVjyB/2v50YNAC
	ITTWOLfcU+8PTmr31KhsBRy6o4d+I87MwWL4j19x2briv2kYUePyPjAuD1ODVj0=
X-Google-Smtp-Source: AGHT+IGDn7RB5cU8iSXf8xntybKszf4HI5OoCRwBUHdVivfSY4dzeQk6+44VVtnK3iUR/Ypb1pjzqA==
X-Received: by 2002:a05:6e02:20cb:b0:36a:203e:6433 with SMTP id 11-20020a056e0220cb00b0036a203e6433mr6545247ilq.9.1712622115407;
        Mon, 08 Apr 2024 17:21:55 -0700 (PDT)
Received: from ?IPV6:2601:647:4180:9630::e8c1? ([2601:647:4180:9630::e8c1])
        by smtp.gmail.com with ESMTPSA id e1-20020a630f01000000b005f072084432sm7093745pgl.38.2024.04.08.17.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 17:21:55 -0700 (PDT)
Message-ID: <c33b4da9-5759-4a1a-844d-c6dbad028d12@rivosinc.com>
Date: Mon, 8 Apr 2024 17:21:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/22] drivers/perf: riscv: Implement SBI PMU snapshot
 function
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>,
 Ajay Kaher <akaher@vmware.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Alexey Makhalov <amakhalov@vmware.com>, Juergen Gross <jgross@suse.com>,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>,
 virtualization@lists.linux.dev,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Will Deacon <will@kernel.org>, x86@kernel.org
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-7-atishp@rivosinc.com>
 <20240404-bbfb02e3aec944f9e11745ae@orel>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240404-bbfb02e3aec944f9e11745ae@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_172200_016440_E110EEBB 
X-CRM114-Status: UNSURE (   9.24  )
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

On 4/4/24 05:01, Andrew Jones wrote:
> On Wed, Apr 03, 2024 at 01:04:35AM -0700, Atish Patra wrote:
> ...
>> +static int pmu_sbi_snapshot_disable(void)
>> +{
>> +	struct sbiret ret;
>> +
>> +	ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_SNAPSHOT_SET_SHMEM, -1,
>> +			-1, 0, 0, 0, 0);
> 
> The "Rename the SBI_STA_SHMEM_DISABLE" patch should come before this
> patch so SBI_SHMEM_DISABLE can be used instead of the -1's here.
> 

Sure. Done.

> Thanks,
> drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
