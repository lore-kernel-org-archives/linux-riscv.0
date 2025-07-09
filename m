Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF89C83F03
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 16:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BKohqLJ5xHcLJOAn4ZZrFz3n24MfMDKrzInwKvKbxrs=; b=U7NTae2MeT7zoW
	XhtDq94QGsKRiDWtmTMD2+Y5xOURiX5n8PoUaikWVZsk2zE7qu+Au/RbCZjI0jx2na+v30f+keGtP
	N/Ikea1GMsD8Muwtq/cpKRZwelIg7k+7r7eRt5fsoOvqhgKD2Dm9CEpG8plaHb2s3wOKcad12vtM2
	+FDrEZpOSchJ3WT2ZyvlhwsD96CmZ6TQcijf6FqWVngdsQFh9spXYDX0wVfmXDqc8UEfZGOSONffS
	+DkAZdlQYxhJwnIVqVv0rdpvRuD26j3UP6qgrQpiKV93dvu2WsfqHYfaZK464dWJuyhcKbaxyHDQA
	qBP+A4eBr0p6+XlVtLHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXOd-00000009HeS-1BeW;
	Wed, 09 Jul 2025 16:11:47 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVf7-00000008xJl-3iLw
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 14:20:42 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-454ad911425so1858725e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Jul 2025 07:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1752070840; x=1752675640; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oK5F0Psa0jV0e0OKoSTpS2uqnRAXM+Q8I3wnhMvoqUM=;
        b=Yvj3y6c/mNUwfe70fUtvSzRUTCLuG63t57UJlDoedmK2dist7boyole1TsqbvVUvkU
         93dA2v101n8vFtp+JAI3t5QxROjdv8JkOQWohYkCBB/MUK3vxHPE2MA8aZHD4V2AScjr
         ZXGywb+0AHU0BDZ5jkzEpyMTv3eEPKuqlKmG3DMeLkxD54+9xB8W4KylVDMWuw1QihgT
         KwNonw+0/RAFolYntjdct82IMFX35v770Qkp25IPBceV3wYritcMhmHGUOOuh5fe3ODd
         j40vEjUih3Wf9hY8ZaPQ4xjU99FTqWeyStmZ9domFRk4wpTAnWZFJaQZLHJ9uT9YcJOS
         Gh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752070840; x=1752675640;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oK5F0Psa0jV0e0OKoSTpS2uqnRAXM+Q8I3wnhMvoqUM=;
        b=O0SrXha13ajItKR+E44kkVLLw2oV+Fta52USfXDMAAAX/hLGp2m3KfYed80BexFvJG
         gkQMXikOfZF1K/THNFCQt2QDRIMNEqeN+N2hCWOz8QWp2Ybt1oQ3njwTEm/lmdIU9LJs
         RWFnTqfP2kRvmg4gT5n5pGjCIdSVCXY0bevzW04vGd4VH05Kb90hkt/TX03aycjATCvc
         9EsULGHgRVL0nWoZ/zjXS1Z14RStVTPQuCZHNeAnzNU6IQyQ8+SyOJBBuJyKaBVquMgP
         ulHRT7S6eM1I3X+KYbqKggQZhAJZU6dYdpGVO3nNPd3rm/GmZFpXSCjtGzJ4fdg7OhF0
         vXyA==
X-Forwarded-Encrypted: i=1; AJvYcCWT8Ln7TCMnLFhm0ZTDPJlY8LOsg9GKOAFFCVOmntr2H8QCV4/7yCCPjkBN7kdjnCU4RI3VCw20OCrjEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZu+961nGBPgHe979hM7FMIWRZ+mNxP+lBzwxZvnNQxpO1G4qk
	5ZMoBbLUfMaNk38AH+CL4d7E09gIM8d0V+xShTorO/Bm3008R8ibswiGsGgM2Xq7hzE=
X-Gm-Gg: ASbGncvjuZ8Aiunstyn/dFCE/RC81xynQEhKD74NU7IJ6REzb7b9Y/NDPfgj42F6MHx
	do42b0Xfox8GUBcrRFkLEpBFgtm2KdZLyrG3tlL/tUJ6AEt6Cf158lna4et7auMfXyfWfrgCV9r
	j2Ldn/15KvI5SeUTYbyVsjUVPAlN4BrkzMfkmrqga+L4qRMQ7dYeAH+nBJukueECf+FifTMhLVF
	eEf2kEoOlEzlEyUeWLvHQbqaPMxPDVRCchTi5QEyQaEn4Gcj0DoEtYWpHFcuuDpW7zebzX4SmuR
	o8K86c0cYbIU4Fowjaj4YvVCeIQp19o84diySKHfz8c67uVusj4ZKHbMODNyeoUw0SdnP4Kdo1q
	qlW9TYbdmcid2eW3t7QXsbiKblSLKEXR6
X-Google-Smtp-Source: AGHT+IGxkkezw4h7f5aRtHdd0JhI8ZNN7qdtxJAKXsiUxUxHmPLMlNUPt+KptfBVUix4/wS6yDYi8g==
X-Received: by 2002:a05:6000:230b:b0:3a3:6e85:a550 with SMTP id ffacd0b85a97d-3b5e44e1087mr940883f8f.5.1752070839628;
        Wed, 09 Jul 2025 07:20:39 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b472259842sm16047493f8f.72.2025.07.09.07.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:20:39 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 09 Jul 2025 16:20:38 +0200
Message-Id: <DB7L9ZHZI3AI.36SXWX2SO9OS7@ventanamicro.com>
Subject: Re: [External] [PATCH] RISC-V: store percpu offset in CSR_SCRATCH
Cc: <masahiroy@kernel.org>, <nathan@kernel.org>, <nicolas.schier@linux.dev>,
 <dennis@kernel.org>, <tj@kernel.org>, <cl@gentwo.org>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <andybnac@gmail.com>, <bjorn@rivosinc.com>,
 <cyrilbur@tenstorrent.com>, <rostedt@goodmis.org>, <puranjay@kernel.org>,
 <ben.dooks@codethink.co.uk>, <zhangchunyan@iscas.ac.cn>,
 <ruanjinjie@huawei.com>, <jszhang@kernel.org>, <charlie@rivosinc.com>,
 <cleger@rivosinc.com>, <antonb@tenstorrent.com>, <ajones@ventanamicro.com>,
 <debug@rivosinc.com>, <haibo1.xu@intel.com>, <samuel.holland@sifive.com>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>, <wangziang.ok@bytedance.com>
To: "yunhui cui" <cuiyunhui@bytedance.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250704084500.62688-1-cuiyunhui@bytedance.com>
 <DB5U402ARSEO.4H4PE19LGCR7@ventanamicro.com>
 <CAEEQ3w=V6-d+YSWP=0WMt6UAZexrazq0UQjdyUmS3AnMtkdoKQ@mail.gmail.com>
 <DB6MLPA3BJ75.2U5FP5JSJD2LO@ventanamicro.com>
 <CAEEQ3wkoy3Jr0vZk=X4U56KYPq3=5t7Wr4RE6uNby3MS5qzh-g@mail.gmail.com>
In-Reply-To: <CAEEQ3wkoy3Jr0vZk=X4U56KYPq3=5t7Wr4RE6uNby3MS5qzh-g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_072041_922721_9E9C6CF1 
X-CRM114-Status: UNSURE (   8.35  )
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

2025-07-09T19:42:26+08:00, yunhui cui <cuiyunhui@bytedance.com>:
> Bench platform: Spacemit(R) X60
> No changes:
> 6.77, 6.791, 6.792, 6.826, 6.784, 6.839, 6.776, 6.733, 6.795, 6.763
> Geometric mean: 6.786839305
> Reusing the current scratch:
> 7.085, 7.09, 7.021, 7.089, 7.068, 7.034, 7.06, 7.062, 7.065, 7.051
> Geometric mean: 7.062466876

Great results.

> A degradation of approximately 4.06% is observed. The possible cause
> of the degradation is that the CSR_TVEC register is set every time a
> kernel/user exception occurs.

I assume the same.

> The following is the patch without percpu optimization, which only
> tests the overhead of separating exceptions into kernel and user
> modes.

Is the overhead above with this patch?  And when we then use the
CSR_SCRATCH for percpu, does it degrade even further?

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
