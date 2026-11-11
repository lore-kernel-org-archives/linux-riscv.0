Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080CE606A324
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 11:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Drmh2LVK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=erdBYlPt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	Mime-Version:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kEUBY/CGb3S91vzemSRQkKSFI5XvHD/XR/3eRhIzKQg=; b=Drmh2LVKoF0Mw+OHYo60qcoUgE
	i9LtSpmGDdrv4jabD8j6IhJYDLOVkMJTxz2dJTbXtbrdPwm1MO+gKGXHVFE3vhWQAMN8Y0vZdgZsU
	achLD59nWgM47BKjK9C45o0j0/VkDNJDrZt1rXa7zXtuXSXZLtyG2QWtVlC79rR+SYM3N8Gbrtl+t
	Rg/SnVYIBKD/IP01usG9ARt3QP+Do9V67RSjjYTsLBB1SPCY56/sGbTceTbALsPwGsLu9BWi6DfAW
	LjX1fEmFTwJTZeg1C/kzD1bMI7fGzxYuDtrleChldzzC0okLM91TX9IvkQOejwzVwSA/7YjEL6wyk
	lQ/9Bwxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6mO-00000006XAa-13pK;
	Wed, 11 Nov 2026 11:46:16 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6mM-00000006X95-2Iov
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 11:46:15 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-67c6a0abc2eso686629d50.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 03:46:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794397573; cv=none;
        d=google.com; s=arc-20260327;
        b=ZF1OpjRvnHnbHEp9E6qQ1a1vfmOC30IgKVoY0KwRqTCjl0/aBk+8i8M9pCBKgUqt9f
         ma6q+YY6MvrgVfy2iwdO3DaKc09CAglYDlV6ixqW8IkSEBuA7SAkr2TrNSm63h5ejdLM
         Ldn4Qe4F4xRcQmzz8z3GgPq0GDAgOeUDxhZfuA5DiCMmeKcXSx1fUWHsdmopBSbvujLm
         /ktUgaicdN+GN9AiwhLfbASX0DYs3RxKQp2XZ3FHCzwHx0klWQFkEBXeOQLUlsDOh+r4
         u4ktnV/TdXuVVR7nfjJbo4BRq1cpj6orjqT33T3r93ME09+1ivy8mQOFDgpurUBaSSpl
         xuMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:references
         :user-agent:in-reply-to:dkim-signature;
        bh=sxD02/BBheMAurw06u7jeipcoPrAv0FPorNrk8HrBgA=;
        fh=TXClwARJvg1bq+DfLs+54sQ9DfjBX9c41yEnDxKTU5o=;
        b=MYsGF9qjEsaBxTGOIT19q8cwuNenNcs1/1E/ZInZT9LsrWsSBw9eY8nNdSA8h4NM0C
         6xlKGYP4yrFnQ5ATfENUWxoiomEPnEXdVsBh79MzywkIVIwsPCfh+8COw8XPybnqETfP
         La9QIFfgLMmn0kQAfPQ/lY5eTrlVwFpZsEUZlhQHz43WBGcL/vJqQgzAkoTJ2NNghfh4
         eEjH979vVTvlPVMnVD/Pmn2cFcQj/yWV8RZBzAwDEJAZWoMOkd1vkSAAYNfGvrgcBG33
         m+UAl5+p0mO5x35u+gwmExrogl/CQ07o7mWJe3g/3jMUhIySW2xeoiOoS0v08Z3gVuFW
         rmLw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794397573; x=1795002373; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:user-agent:in-reply-to:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sxD02/BBheMAurw06u7jeipcoPrAv0FPorNrk8HrBgA=;
        b=erdBYlPti8bACQ1Ze5gFeH6jB5wOKuv5zqKpFlsFuPJoWN4MbCTpPYSvylUTXGTVkT
         OqTsilttO/csgrA1CD9mQ2DwFIttYWa6aeuaSRWIHSFF3qpOWuYpkyHi9/5+Wb25OwNy
         /dxW3TZBDInXdNRVBhY+Q+AhyOBkM4qX5OFz5Ui2V2d31iu+WF7/Um6CZTgzqizV5L8b
         kBh17wMFkWrBxTrh/rdJDuKp4piLAmtsXMMyocGfTBxN4meLRG6T0qWQmP9U5U0Gs2ia
         xSsFQXIgYSFcurKrslzGkh8Gbna1VrOVGE6NGKukA1dwyW4h/Fz8FMT0qzWXh3esr4St
         Co1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794397573; x=1795002373;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :references:user-agent:in-reply-to:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sxD02/BBheMAurw06u7jeipcoPrAv0FPorNrk8HrBgA=;
        b=N1TD0i6Ixo7TBO46Xax4wppGdeEYJl81h6WWMySa9/MNE7OBqIgvu8IzNouU2Y+rBe
         024L6Zl89e+Sd5Isfh7mamUhG2mV+oBbH99uEyOyKu/TaWDEcpCNmaA2e04RVva3dZpi
         C34CmQ3Ts30m9vb3CxSMgtnSjGGkUV/fFBZtwZTaYbmzEQ0pyhLp50gtJ9Vmj/ybQ24f
         Uq2+BMmmXZCB5bd5MS9juZV2eNUufawO2wmFXicdS3cPOUqAFfpxHBo/3fY3+7rABX1D
         wt1OmvjxmIV2iO/O90DH/1JBSmhode4jP8kmElkjEdvcKRDKCSxwYIsW6f2hUDGO3Kmw
         pb+Q==
X-Forwarded-Encrypted: i=1; AL+hErGuBacYxwlK3cJxSSD70dr0gpnz1BTGkVT5vI/lFSEB51H2BIU4jnHUzMf+QDD0+Kxgkzj+s8s0OkRVRA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+bx7qylZTOT2XT9L3ndDNQ+qJWpx3zNhqGX0Lrm9ShYvTmASpp
	MFVrkpGMl7KFSR/h+b0Dz8Tc9o4MIkjknv6OIiVQFwKXqBQLVs2k8YZSK5YVTm/C+E6aAipq3Nr
	FY0m8Lek5/sOfpL8/PCieu749ND/txGHp7osQk5delA==
X-Gm-Gg: AYBFou1SMJWrp7ljigUitInPoAh+7WZic2TvYNtqU90ta55slVNPo7zh/Gx2A2+cala
	8p8ml0zVsk7jqun6LgZat32W6NGASQQgQCtCim7rPq9L9ZKTgJUPq56TehIoV0SVkIwqfA6wmPx
	oUOSJ2VDE67biwG7udjKR59bJnGUgh9ZPka+uVZWxb2nc4K2SSNrkwbf0ettD8me/5PsWchDrHt
	OMIbxCidpJ6tC1nvBQ9FPoa0In28/CT6+0rHoky60fhTX6FEiCpxTtgdChEUbvIG2xI2q5gnKmt
	aRZhUaTYc0IuLCY3DlGAxH00BrNzEl/CNjw6qd/DmYn81gb0eIbKyL3/Y8LuHj+I/BJL8NHY/gf
	R+qH0VXExYsD0MCshdWFEmLhmjC17Y4nKIT0=
X-Received: by 2002:a05:690c:4:b0:8ab:2f89:32e0 with SMTP id
 00721157ae682-8b3a81199f4mr13471067b3.57.1794397572467; Wed, 11 Nov 2026
 03:46:12 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 11 Nov 2026 05:46:11 -0600
In-Reply-To: <20261104161512.883885-2-anup.patel@oss.qualcomm.com>
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
References: <20261104161512.883885-1-anup.patel@oss.qualcomm.com> <20261104161512.883885-2-anup.patel@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Date: Wed, 11 Nov 2026 05:46:11 -0600
X-Gm-Features: AclHuK8VD5zdhvsTYmRtyJzXAXUoripQo7x0P6Es21hMYyxTa4lv3D3kijFwJg8
Message-ID: <CACnXVnfokcEnSgQS_wLN=LZ=jztisuusft6nC8Z--+o+xCC1tA@mail.gmail.com>
Subject: Re: [PATCH v7 1/1] RISC-V: Add common csr_read_num() and
 csr_write_num() functions
To: Anup Patel <anup.patel@oss.qualcomm.com>, Sunil V L <sunilvl@oss.qualcomm.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_034614_685544_454B84FC 
X-CRM114-Status: GOOD (  12.83  )
X-Spam-Score: 0.2 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Anup Patel <apatel@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Anup,

On 11/5/26 12:15 AM, Anup Patel wrote:
> From: Anup Patel <apatel@ventanamicro.com>
>
> In RISC-V, there is no CSR read/write instruction which takes CSR
> number via register so add common csr_read_num() and csr_write_num()
> functions which allow accessing certain CSRs by passing CSR number
> as parameter. These common functions will be first used by the
> ACPI CPPC driver and RISC-V PMU driver.
>
> Also, the RISC-V ACPI FFH specification allows arbitrary CSR number
> as CPPC register and the RISC-V SBI specification allows arbitrary
> CSR number as PMU hardware counter. This means ACPI CPPC driver and
> RISC-V PMU driver no longer need to do sanity checks on CSR number
> which are now done by the common csr_read_num() and csr_write_num()
> functions.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
> ---
>   arch/riscv/include/asm/csr.h |   3 +
>   arch/riscv/kernel/Makefile   |   1 +
>   arch/riscv/kernel/csr.c      | 165 +++++++++++++++++++++++++++++++++++
>   drivers/acpi/riscv/cppc.c    |  17 ++--
>   drivers/perf/riscv_pmu.c     |  54 ++----------
>   5 files changed, 184 insertions(+), 56 deletions(-)
>   create mode 100644 arch/riscv/kernel/csr.c
>
> [...]
> +	switch (csr_num) {
> +	switchcase_csr_read_32(CSR_CYCLE);
> +	switchcase_csr_read_32(CSR_CYCLEH);

Could we guard the CYCLEH cases with CONFIG_32BIT? They're RV32-only.

> [...]

Thanks,
Zhanpeng

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
