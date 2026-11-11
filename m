Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E2F606A330
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 09:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jNf+iCnW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=cc6GUVMu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:Mime-Version
	:References:In-Reply-To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=03w91pr6so8ZSp+FGagtafuoReVfMydsi35BOYISbzY=; b=jNf+iCnW/RBcpq0KVrs+vHn1pv
	hIKbTmZaPUnHJERV8p/feURppM4gcAThIXTiUUuBWi/BTYu4spz/k0V015iBtm+kaIpaHmcVNYyrm
	Bz0mVDVMt1iscrucgfqlSdQ5BVYNjRCXTRVXdsHZRW3IqvzZ/49S8zEoR8aBH4fmXc6bv2cecqJOr
	FOb6xGFq0SOy4Ef29v9TaY1TQEZ379h4bIZtAlQAPF13TYfPxahr3rQVZX9dVd6PiXO/GBNIFfyn0
	ePoPIeu92eggKnrC0zXDlB8VSD2v5rIiCFxQA7wITU8hV1XQi/DmM1u2raSGU2ZkWVP5HsNVmUEyK
	/uzJufPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4QZ-000000068fG-43y6;
	Wed, 11 Nov 2026 09:15:35 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4QY-000000068eP-1Ow2
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 09:15:35 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-8b31fc13124so23190207b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 01:15:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794388530; cv=none;
        d=google.com; s=arc-20260327;
        b=GjWj3sm9hxwK0H/QwWr9bb3vS4ZXe4Ukw7ir+jyH+XY0juh2rMZ9crPLcxn2u9WcBW
         dX97mYe0UyTF5rmhOperVN+8pxESzmnkgxcOv61HgRfXVOuuVEpUsQ6FgeIR2WP2Cllr
         Gy1ay7fQGSJ5Y/bryaDyzcgqCAUGcYaLN33uxACFHTS+F9pPWdyNerujzRyKZ2cFYkSC
         kdruDfRo8U0n3dFeqMsOYAKjPvuQUFEQbFMrTDzDsiMiBns6MzWvIWIgf8+ZIcQtSgah
         RglQTgHCqtqVXyT3Ku4T/FHDCOV2v44uadVMmHr93s92+9F3V4DjawHC7JbLiEoqydlo
         985Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:user-agent
         :in-reply-to:from:dkim-signature;
        bh=5QBZ8GiNGrJnUI6N35dRz2cDj8jF0y9M+l9Eb/FSxrI=;
        fh=Hnm670QVsfJDBBBIbesxmCePonwKbWcymma4u4C9Wmg=;
        b=ZryPnDifD2CfzRIZkdrKRh3/hyot7W8hmB2Z54krrrvrLQLEYykjI2lkpglvJlb01X
         7ZNd0ZcmwBpmSC7Ux1dfdt/n0CB0DMZaXgeUlJjyw/25PEb+XEKKYuCT9+KUOqlS5RYa
         gqkYcbBkhNUqOIagejCqncrkAj+aZLIWZ23ouj0b93wN2uGA/Ju7RhJnhG8F0aWg3VL+
         z5lODG635xia+WrzWVuhGT0pd96PdWvAxKZabx/Cl+Ebwd6bdcxlLKxTrr0qsqIwTDEv
         KL/2iw9dcAXVo2QASu2q334Lj2Q53ED/uoB1V4vrNCXe0sAuV0oMQXUamBxKrOgqpWOO
         6a8Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794388530; x=1794993330; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :user-agent:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5QBZ8GiNGrJnUI6N35dRz2cDj8jF0y9M+l9Eb/FSxrI=;
        b=cc6GUVMuRib8d9gi4AJQ6yY7k6ygUEicvXJJL0U4/QMacKYCYeESQ2iSi15yS7tA1Q
         qa7w8mVjwS/rOQJ6ggoDrgdSB9wobtYoeePRmgYJbZ0qFk7a5r6y9bfDQOlKhBr/Roxr
         xF9r2094tMVIt3+oLrDM4UooWqwbggVheWj1TsR8DMqycl3UJtQrfT5JYw2HbfF9BC2W
         D1edspe5YWtswV3YYrUHpe+eelAGgVQ0vCXUIkguP7YsBsKoX6dcN25GgB8gq6ID5IER
         rogajEeo6Umg5NdQoff0Ht+PC1kQCtsUJL6bE3Cq0OZmOClWk80fWV5mc1NKnfM0+ybT
         hcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794388530; x=1794993330;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :user-agent:in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5QBZ8GiNGrJnUI6N35dRz2cDj8jF0y9M+l9Eb/FSxrI=;
        b=1bk+M99i8vIRC7T9bVk96s/4nPlvsnBeAAjrMOLan2GQwXBOiMhiiTlMOqS/NsZzUN
         7jJPRQZ48Bxj9mKoPrEORNyXlrMmLL605TZrE93+vLZKOqqo5eO+7btEBPIfBmJhQzx5
         NS5knHR6DkEobfh4zSw05HlEE/B7i+diiCQt0sJu5ZsFuyY1cB+USP4IGyVBCTmOyV9i
         RuKPa8jBWEzVWf32g2hU6c7ZyTAAcuBEM3DH0RTMXsSv0qrGW82Whq363c/L8381g5+z
         OB0duHFkcC6gsZL54a8DAUmM7NCrRjeJnPeZvi325cAKGsul5jPcnjlKsP2YYP0BXS0G
         /Z0Q==
X-Forwarded-Encrypted: i=1; AL+hErHC29sqXembg+U6NrdH7oJ0ij1AZRMvT2TCMpOCH89BjNOQ2mKDIWy//xRoHqgQhOW45s9uLp3y85ESTw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+7/FkkH05ma3iMpUPKJinC5v06eKvzKjFlYL6NMMTr7UTM/0Bx
	e5S0+KNjme3im9ug/u3+/wZi6pTZsiGegOXMSlCWVm3kwceKrHWhvHrXY7Ppjl5xUpJnZJeyTCg
	dMvDko7gQZyysJ4aRz5Lud/vynk2J7GBavhgZbzjmgg==
X-Gm-Gg: AYBFou2RvCSMTK/Z1LP8CWecCzdaskciFu4srSKc8ppgun7jLMPh3f4RMQ68/GYUCi+
	LnpPQiNJF5oOeWoZ1J6Pko5z0fGvdMGZuVgl4xz3WtE9HvFrFucZru8JH80NgqpWidBkonrEvo3
	i7kxW8XgksxyKfOtFf//atJUrdwNuwQd/w38+vhJmEVfLr+IvSOWwXzMoZvT4vZHxd+vOJCKyQn
	qpjM28FAfiILkjROmBeraCYNaR0rnjXlZkf1mZ+xtxqbQpSgOy/u2oVCNNPhhDRt63VqfOFQmZI
	w3zXXwVhkV29+o+vzjs+7NR3xARkacL2KHw+UkN3llx1VwdlEQU2cwEeI4eE5gbgq8nzXH9ibiX
	7DoFp+IE4TYrTzw16oGCu73FwnhYoyilnmZ99BA==
X-Received: by 2002:a05:690c:e3cc:b0:8b3:47fd:a020 with SMTP id
 00721157ae682-8b3a81b0dd7mr18772977b3.35.1794388530362; Wed, 11 Nov 2026
 01:15:30 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 11 Nov 2026 03:15:29 -0600
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <20261104161512.883885-2-anup.patel@oss.qualcomm.com>
User-Agent: Mozilla Thunderbird
References: <20261104161512.883885-1-anup.patel@oss.qualcomm.com> <20261104161512.883885-2-anup.patel@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed, 11 Nov 2026 03:15:29 -0600
X-Gm-Features: AclHuK9OnoLWMiiTkLADqyRKwVWpH6udmKoKB5NUgD5BSW6Guh7fRvex4qoZ3-g
Message-ID: <CACnXVnfFWF8h+o0=nSb9JESOxYsdVMO+BJKMT7t=K=XVgVwx2g@mail.gmail.com>
Subject: Re: [PATCH v7 1/1] RISC-V: Add common csr_read_num() and
 csr_write_num() functions
To: Anup Patel <anup.patel@oss.qualcomm.com>, Sunil V L <sunilvl@oss.qualcomm.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_011534_395795_025CFECF 
X-CRM114-Status: GOOD (  17.46  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Anup Patel <apatel@ventanamicro.com>, Yuanzhu <yuanzhu@bytedance.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>, Yicong Yang <yang.yicong@picoheart.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Yunhui Cui <cuiyunhui@bytedance.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
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
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 621f84d1898f..ebd82043430b 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
>
> [...]
>   /*
>    * Read the CSR of a corresponding counter.
>    */
>   unsigned long riscv_pmu_ctr_read_csr(unsigned long csr)
>   {
> -	if (csr < CSR_CYCLE || csr > CSR_HPMCOUNTER31H ||
> -	   (csr > CSR_HPMCOUNTER31 && csr < CSR_CYCLEH)) {


Could we keep the existing CSR range check in riscv_pmu_ctr_read_csr()
when switching it to csr_read_num()?

The SBI PMU driver still assumes the architectural counter layout. For
example, if SBI assigns an event to a custom counter at CSR 0x800,
pmu_sbi_csr_index() truncates 0x800 - CSR_CYCLE to zero. The perf mmap
page then advertises index 1, so userspace reads cycle while the kernel
reads 0x800. The same index is used to set and clear scounteren.

Non-snapshot overflow handling and RV32 high-half reads also assume the
architectural layout. Could we keep the PMU conversion
behavior-preserving and handle custom counters separately?

> [...]
Thanks,
Zhanpeng

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
