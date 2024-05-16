Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2A2C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 12:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PTdAAznB4Ozh5cWBB6md2Zi+CK0Kh0/80seqvNR6vK0=; b=S3+BtaKYOK89bY
	3HwOxb0NXp0NOR3xnV7Nqrv0lVarvjXzoApwekZ2V1JPURLzCZK9qP91oh6D2EOygS2Hx7aIZ9Uol
	GyDsf6vf3yIV/milFzLEate16OF6QLxgJNIcB73xE5tQ+8RfjPpmwQpsUoZTTrDATp0nzzcjBid6h
	TZGUqudwKnbatwj0eqySGY+2xfbfVnWVcTiZJUw/688GOWRMDlCmBVih0z7em/B/QRZRxnVAHI4wa
	j7jQMgrTsRGfdmXr1qXOYOhJRNK+DIAry9nhmr/pfuDQYXoU7f2GUWEdKSV/dxFZ6BNGwPlCU/Cmd
	CyLOeZt03zk+iEUH0yfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7aNX-00000004qYH-3c7W;
	Thu, 16 May 2024 12:38:35 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7aNU-00000004qX7-3bG3
	for linux-riscv@lists.infradead.org;
	Thu, 16 May 2024 12:38:34 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-523b017a5c6so1135698e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 16 May 2024 05:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1715863110; x=1716467910; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9iWXDNZutTCQXyK7swK+WhdATWJeoIgfasLnh7IMyXI=;
        b=PZRLtlNgyu1RXs/y0VgTvpV5KwspsGJmBLSspdtfOPAxjW8q4PPFydRUqGw1fyXbFl
         KqZImK1iJckPtYgW+PFmqh/EXCRDDIZuF/aiSZFqJ02uFLQ6Z4+Og6ncqXkpTjhJRVQs
         B7V6FASZp50kN+E5kVG/5lmwh3ogMQzO0rvl58l6jNWJf3Ilb5KVhrXvB44sgh0Llmog
         YrAWT0KaAzWwHgusEsivcdhUbAoU7p2bXGPUToJeYbKpTJ4NBAz4djq2OMUn4pf3E4oX
         7eQwbZDgt0q9ha2idgW65AOTefqiUx2J7ahBwTrZ5qbgawljOyGQgLXQ11Nj2ycbEHG5
         AwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715863110; x=1716467910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9iWXDNZutTCQXyK7swK+WhdATWJeoIgfasLnh7IMyXI=;
        b=C1CAem8JLefPREFZVDH6qivhiB8EMjrMn2UUeNnVZ8MXIsbU0z8DP2NvPwVg5wgXGc
         JOawTf2qJFG1MbBIn1VmQAE8FtPBxupGQZVLo1MpstJ/W8GngR4KR/AVuF1VV/0tYtLy
         4UejY6WY9E2P8XyaYICEbgFAS6QBSrqKw0slIjWkz2OuvgObJ4osFyYmypJKxdh172hn
         kJtZ7hQDO8QNNfRSDUFaFvAIulMt7n9zk78kEi02o4TYzmcZoSKHl1YF/wz0eNFRdv5j
         Kbh+CvHfdhvNlwN1HfF2iorZH93kLLjZpODXKZXN6wR1CLdquuPTxrS3Wnci1VtSpudR
         Fk1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtrZcVX6Lig6hUfbm4ejF4lonk5Fj9wiDAUHCoWHzKL478Go3e8qbSBYSOcacJxxtoEAevK7T1S30Wg8ItHxslzQyfvsJ5ccVr8B6t37cM
X-Gm-Message-State: AOJu0Yzywh/tIQjf2ZMQhUhrKKBEA6P3CIAZlp90KMVjKSavh/OPO8mC
	ffmg5MC0kTnkcbF7HZW5RgqDUH0jHVQHwtGjkKcKmPKL/wUOqatAFwXGXSQ4b6g=
X-Google-Smtp-Source: AGHT+IFvaxKFOv8LilzEoxtWuNaiQB4YOLRJwVRKx1QLhx9shrtK6ID4rKRb2vM0K66NfrbiVweSbA==
X-Received: by 2002:a05:6512:238a:b0:51a:c7d0:9e84 with SMTP id 2adb3069b0e04-5220fc7c57bmr21204513e87.12.1715863109765;
        Thu, 16 May 2024 05:38:29 -0700 (PDT)
Received: from localhost (cst2-173-78.cust.vodafone.cz. [31.30.173.78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b17d10sm974132366b.198.2024.05.16.05.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 05:38:29 -0700 (PDT)
Date: Thu, 16 May 2024 14:38:28 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Xiao Wang <xiao.w.wang@intel.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	luke.r.nels@gmail.com, xi.wang@gmail.com, bjorn@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, 
	song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com, jolsa@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	pulehui@huawei.com, haicheng.li@intel.com, conor@kernel.org, 
	ben.dooks@codethink.co.uk
Subject: Re: [PATCH v3] riscv, bpf: Optimize zextw insn with Zba extension
Message-ID: <20240516-0ec6ff4ad0e23302003be51a@orel>
References: <20240516090430.493122-1-xiao.w.wang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240516090430.493122-1-xiao.w.wang@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_053832_920412_3023AB1F 
X-CRM114-Status: GOOD (  10.59  )
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

On Thu, May 16, 2024 at 05:04:30PM GMT, Xiao Wang wrote:
> The Zba extension provides add.uw insn which can be used to implement
> zext.w with rs2 set as ZERO.
> 
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
> v3:
> * Remove the Kconfig dependencies on TOOLCHAIN_HAS_ZBA and
>   RISCV_ALTERNATIVE. (Andrew)
> v2:
> * Add Zba description in the Kconfig. (Lehui)
> * Reword the Kconfig help message to make it clearer. (Conor)
> ---
>  arch/riscv/Kconfig       | 12 ++++++++++++
>  arch/riscv/net/bpf_jit.h | 18 ++++++++++++++++++
>  2 files changed, 30 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
