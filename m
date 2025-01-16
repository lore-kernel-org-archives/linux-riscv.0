Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE2CE77188
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 04:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sv0BA+DJPp+FGeKOqUD/y0XyyVCb7twAlfiY+Q7ARU8=; b=wQS9GOECO3sMKU
	+F8vjRqXuOd1ma5FBUgca823ElspcHzz0ZEdgKxdYUNledkXg38oGvE6B9oHcvckCRg3k+SRHfEkd
	ojEs/8sUEeeM6zErXLVFBuxJyOfDeO17O+MGP7psbJh0VW6XLv1VO4h8hC9AbzsIkeboC18Y6em9U
	a+wHTv4Ty9zuCTd+6IpEMsb3UVN4pDLi1r/+r8IW4meNb0wncBYF5MUjHDGiCAm2vrZ01ucJibZY6
	20pyVHP6rKkVBEp5nXHUIObvWqoLo6Ib6al3zdCcGAsdqoeninpSA1YTqRdBJQ8vxs/sZgIXrOl4B
	k73sG4eeBHxyQ5iIU/Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYHxe-0000000Dpuz-0DKL;
	Thu, 16 Jan 2025 04:58:30 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYHxb-0000000Dpuh-3D5G
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jan 2025 04:58:28 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-844e7bc6d84so20844139f.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jan 2025 20:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1737003506; x=1737608306; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AFLg8GSDpsapBIGiAyBWLlK/6kmfSioivJ/IsRLirXs=;
        b=E94XBPy7UKrGu6/6I60BaCTnkKU+cFNanoH4VDFrzouNTwQJKY+t1KM1gExHR2DPjA
         1KuhkwhQv28Br1UoKuvOb+lz3ja6BwqkzJFZ3Tu8j3+bNqVUDmNLhsScgFpUXRXKzxx8
         jefPLe30l2JmKAf93alWjwDMhLmFG+ET6mD/C3JX+/C2Ezbbqaio9YABBzbQtR2vCCEd
         DuUo3IOKYNlxlveMIEmkGvqnVTlFZy4dF+i9kaEUajdSeLrYs5h5+bNStEN1r1kSgmeo
         LwUOtfNvWsA0vroRbrifFlDGg3WF2J6rF8N0klScQwT0Sig6x6dxqfWE5/6mQTicLQr4
         CPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737003506; x=1737608306;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AFLg8GSDpsapBIGiAyBWLlK/6kmfSioivJ/IsRLirXs=;
        b=BMsWdChuqsYrd/bw3ymZDe5oXTGaw8/BXnMeoqBkPZqHU4keP4GkqcgyU0kI+bqjH8
         0UobDQvBnskE9tw8he9Pz7RXSyEi7ZZjvErplE8jNq+tX6Bn4FdAm4Qgddh9OzR90mtr
         kOWU1UiKtdNjUkfJQB1I4NimQTm/1x6vrtoyJYFVbGS5ptcbPu5+SbCD3laeqLNTfv/S
         A0pCcB0biQJg6UFM58f8SnqBaCd1rSGRspgy6PPDYQQYruZdZdy772S+kpIw8s96G/m/
         1j8xKnS70E3mDq49Wn7extUnve00KocQ/1wr7dk9J79aplTWTr1G8Br8TnOkR6ALyY+1
         jrzg==
X-Forwarded-Encrypted: i=1; AJvYcCU2y5DHzTVnSY7IiUu+sevEpxeHqeRWEsNZau+0wTrZrPGx+/gmZOVqxt1jwS38AmZ6PcoySvNt88pA4w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1yaxMZ+2uWkK1bELjZma3SuUjOE7oaH8RE/UHYqHZ8oZ2otzK
	X4L5r7U57YdGYIE/fpByNUP+KVmc17H7xvqBob2BEJvczX/2n/WjiPsLh8XJBKs=
X-Gm-Gg: ASbGncvo/mUtqypkUJx4wbPP78EnS0SJLoKoydlZdq2bHoIptwYaC8ijtwFYNPtadDj
	r6CTaWZC4hTf0h6mUh+HR/b9zmreVKC3jpTOd4AznTcAm3oSCOcxCw/te6EC4c56UILEp5NFlFk
	cF+UcZekyHqQfReMimOwKzrnqwdhTDq8ESTYiDEnKSv9Oxm9glu0y6x/8uB98bE8s5BkqFsjaRE
	E4N1KYtfUqLCU198aJvtqs0GmRPB4nKIbiHuteK2DwFOf2Gb5QMD5/jpzlSx3YBH/9RLBwZcxaO
	8J9F
X-Google-Smtp-Source: AGHT+IGCURJWIVYousmDxQfZtWRFVgJilSrZTA63b4XTXZvjX1GtlsFKkKGE3cWs27mtEc5QXAwz2A==
X-Received: by 2002:a05:6602:7288:b0:82a:a4e7:5539 with SMTP id ca18e2360f4ac-84f672d8530mr532921139f.2.1737003506302;
        Wed, 15 Jan 2025 20:58:26 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d61fca4f0sm425517139f.44.2025.01.15.20.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 20:58:25 -0800 (PST)
Message-ID: <8d03404e-c9eb-485e-9280-27a06937c347@sifive.com>
Date: Wed, 15 Jan 2025 22:58:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] RISC-V: hwprobe: Expose Zicbom extension and its
 block size
To: Yunhui Cui <cuiyunhui@bytedance.com>
References: <20250115024024.84365-1-cuiyunhui@bytedance.com>
 <20250115024024.84365-3-cuiyunhui@bytedance.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
Cc: ajones@ventanamicro.com, alexghiti@rivosinc.com, andybnac@gmail.com,
 aou@eecs.berkeley.edu, charlie@rivosinc.com, cleger@rivosinc.com,
 conor.dooley@microchip.com, conor@kernel.org, corbet@lwn.net,
 evan@rivosinc.com, jesse@rivosinc.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, shuah@kernel.org
In-Reply-To: <20250115024024.84365-3-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_205827_825268_2FCA5E7B 
X-CRM114-Status: UNSURE (   6.59  )
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

On 2025-01-14 8:40 PM, Yunhui Cui wrote:
> Expose Zicbom through hwprobe and also provide a key to extract its
> respective block size.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 6 ++++++
>  arch/riscv/include/asm/hwprobe.h      | 2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
>  arch/riscv/kernel/sys_hwprobe.c       | 6 ++++++
>  4 files changed, 15 insertions(+), 1 deletion(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
