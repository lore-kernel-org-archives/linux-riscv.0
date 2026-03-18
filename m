Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AAB107760E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 21:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bqyl4gqVG4cPivzAHf3eucLx/G5P/eeV5E8iSQtO/f4=; b=2uMxcerRgbN6m7
	YI2yk/3PNZHz2wpk6L/ajfPazQzptgHnIFQVybxmJusFaE3At5nMKD8QsOao/hTup0fgPxPfcTUUt
	DQGibhw4P9Yz0MdhGW8frG+l4QCGMzNoFVL47CFeT7bpfagzkN5dh99fVTN64u1yOoNYdgi+Hot41
	0h6ob1yVIZmgvR+aGhEr/FXoMWyGT7EqlPTCIyy1Rix7xAy88fm19jzXrHLfJ4VFMIqcvBKKko/ii
	EBDKeBYWaxTEhFgpPkYzvfbyGT8L/mZUbv9Nu4k+T4U/dcmxsUOzoG2FUj8gdNz1n1Zt5niudAsh2
	bnbu6bvOlwvExkrpQ1mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2yIa-00000009NDc-20Ka;
	Wed, 18 Mar 2026 21:19:28 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2yIY-00000009NCt-0HYv
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 21:19:27 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-799001d73bdso3422327b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Mar 2026 14:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773868764; x=1774473564; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1Qp9lS9mJbsbw6BdqhHIoqJG66lBxCc3NYAKkS9f8Q=;
        b=DubDZY/87GoCPOJi0ahxlHKpbCVOFfdW5jWWi1itdhhC+tg2v/hfi+pbis7+07JcA+
         SqjqjGsLxuCWeFhAY7PLyvB58F0Onz0cYaaAmzJFjQhWaXVK5y91HjLLV2Xf73aHuiX2
         i7j6x0xlVZv/QdF0WrS8HIzfe+2GegWvSPeUsqDpEIK/vD3mwfdEWecXtHBylTt7HCy8
         gs0xSUuiEi6KQXTnyL/vOoSHx2U1pQHazewRI7ijIZbu9dItNfCcWBO4qrrN1lDXJxnm
         peeULC+uNdLS+bUE9dfH84PRJwTff50auSfdP67zyI/b4eNO5ej1z8RKmNSD0/m1wfjv
         wOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773868764; x=1774473564;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s1Qp9lS9mJbsbw6BdqhHIoqJG66lBxCc3NYAKkS9f8Q=;
        b=syLNrKRw3HsKSjatGFCGHrPOzyIqm57DfnlzfSYP9gRLwNUmMEEDXJYBJ2OJ/Ht6Nb
         p6J6wjHjXwMO3trKOOLd7/Q/9cjGdhAJhLxlO/W019uVRpcY/xFPLy0tsV/sJQjhFm+m
         G6uWNGalAgG2/9Op5D9S5NqDzPBnx4ZLJRIcxpsArvWpMgxYMSJsW3iWUvgCso9jHWeX
         f/BiF5/ou0/G4lPCL+hxcUU2Job4KwclJj0225vW9nAnMyLFMQwc07IjsW7KvBrQKc76
         Q2r6VZtht+LPqXoTYZ8XDR7FJ6hZ+la//XjINI9jKvbd8yKVq3cYM0FRNqvraPYwxJMB
         LxuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrRfy24d7ePyO1vAOHtsHbzF7A8TFZkG8wcKWAi/z2TcMXRjyWRvx8gVWwV+kFHG4Hszq3j8Tf8Cs34w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfiVJVSos+ehGSy+uFANyDnzRRdQ74ZgSV/yMKZvTJrIznEBeW
	XdKIav7FRNiwjy486ozqmo3RBTFpP+bbkUS5hx01mLvASyrJd4f4B6Qm
X-Gm-Gg: ATEYQzxwZhf1yL3DkPH+qAyT17kiEOmKquqVE7qfCib7e8+j2hHAEa/VpiylrHMA8RS
	WBVTx7cZT+MWUJoRLqs7ILGZmK8rRem5XOVnfNK39ym87UA9djtFoBVKZIXAkow3MVgdN77Izqq
	gdN+wfH4oJgmE1t+t20oI5YYwRX/HcICa1oc6hbb1tdPMG5VozIiMpSQabHbt8pDrKvWDfLXIql
	ITBIsaHLqPhv2MFSm0cVuX+17RqZsqXgt57KGgPaUsGpL48QOSuAbsWbA+1g273jNLqLK6V5INh
	XSI8x3FDAdqI5gRbX9oRsB6IQWpJKzi9lBJfqzLk026z7CotXmxEme+3L0rt+sq+PffCEHo4iiG
	MDNk2llpXuuEKzPmRekBxhCrxg2nI2xLLO7VEs76XWZJ4cDRoLVYIOSn62zpLRNyiFjDs0s24sP
	fOkHmoVjv4cukfp+cc0OtUjUUaUaOs9kJTCW4cOfCe4H7aULAm8O213tgesfPxntM1X3Q1+RU+W
	Xm9JPHFq9Z2j9DvKQfqENJ88bu5O0Ht
X-Received: by 2002:a05:690c:dc4:b0:79a:2ef2:82a with SMTP id 00721157ae682-79a718c82b6mr50873677b3.20.1773868764218;
        Wed, 18 Mar 2026 14:19:24 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::f769])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a7136de7bsm24223777b3.2.2026.03.18.14.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 14:19:23 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 18 Mar 2026 16:19:22 -0500
Message-Id: <DH67ZVO5UL9G.3SP1BFT4TQOI5@gmail.com>
Cc: <atish.patra@linux.dev>, <pjw@kernel.org>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <ajones@ventanamicro.com>,
 <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] RISC-V: KVM: Fix out-of-bounds by 1
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Ethan Tidmore" <ethantidmore06@gmail.com>, <anup@brainfault.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260228152226.2116895-1-ethantidmore06@gmail.com>
In-Reply-To: <20260228152226.2116895-1-ethantidmore06@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_141926_108922_B7E62888 
X-CRM114-Status: UNSURE (   8.13  )
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

On Sat Feb 28, 2026 at 9:22 AM CST, Ethan Tidmore wrote:
> The array kvpmu->pmc is defined as:
>
> struct kvm_pmc pmc[RISCV_KVM_MAX_COUNTERS];
>
> So, accessing it with index RISCV_KVM_MAX_COUNTERS would be
> out-of-bounds by 1.
>
> Change index check from > to >=.
>
> Detected by Smatch:
> arch/riscv/kvm/vcpu_pmu.c:528 kvm_riscv_vcpu_pmu_ctr_info() error:
> buffer overflow 'kvpmu->pmc' 64 <= 64
>
> Fixes: 8f0153ecd3bf1 ("RISC-V: KVM: Add skeleton support for perf")
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---

Friendly ping.

Thanks,

ET

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
