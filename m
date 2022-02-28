Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDE1C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 13:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jAXRW3k78hcVDDHgyArWBDeEMwxP3fPmSKdpqCwd5bU=; b=YtSXZvRUuNeP4G
	A38DGWwOxOAW/aBTJT6wxif/Yu4fLezhH6/UpuxoKsfdLn3P3yubcAw1vfvrdnS0rkG6HKo8r10PV
	Bl1RIIfUfVv8Du2ySuD8kLgn8YL9hHOoW3o549UexIC1M/paBhiddxdQmJHTvHA9gzugMQHlzl4Bh
	PdiV3hGn0oF509o0ulRWgTeiSvOZftejU9dcm0qwXuyTQqNJVmMGxuxSTWps514RzBnfkaMqN1OsT
	GqsSJjfbyqhufH9VxnzwHy02sbIWasoFUqQEKn4lZe5VDa9Yk6Pn96abiMcHwZLk8myspjqSYXhSF
	i24sAjj5iuix8Y2/nMYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOfy8-00CWc1-GX; Mon, 28 Feb 2022 13:21:40 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOfn5-00CSJf-Qc
 for linux-riscv@lists.infradead.org; Mon, 28 Feb 2022 13:10:17 +0000
Received: by mail-wr1-x42b.google.com with SMTP id j22so15314994wrb.13
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 05:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y+tfmzsAwXlzwGA/68yHJ/dxS4HEgSBaoMff0gqNFjw=;
 b=XLm9GW/kvlSiLN8LraAP1WxOyk/8vHRHY+CejJ+XDoLmis0woM7v0Txmy7NBB5WddD
 UeU3mP2QK6Ahu1W/QcU02gdUZhZor8BeG6DUULAKiVpgdstxhIrjZKZ5jLk8P66gudcP
 KNYGyvvPcbELGHGcx8beJtj8UfDT12pNqeIJ2eBaH7+aQM/PkolEoEhaXu5Q5huCFcyS
 u3n+aJIu90mB0gHTsqTdgoEuWN0Sw8zPAeV8uFoz9tpQZr6J9ipAOFjrShB5rCzaFzDE
 r8ha7JiYIRd6fPWb5LCKWb7N1if9SnODnwGIA4/QV5AWLSFFTc8Cfhl3jwWnTSZ6RhTd
 LzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y+tfmzsAwXlzwGA/68yHJ/dxS4HEgSBaoMff0gqNFjw=;
 b=Lhlg6oYMdE9hAc2mjZbnRkArLNTO3Uryg7vR4WYkQlioFi8PqIP4cvtX9+KTyIMvWp
 +9BdvQ7OpbtlWQGEUjxMsRqadsGS/p9sK8IKUwPuIXCiJPjIqqyO1SGmjJt+C0kO0H3K
 vILTQhdYp+9tcb8BWOHtKx8l01AF43eqeCJm667gf1ti8aFPjLC8KJ+T752pBlmcojBm
 iQ2oaU/7YGdE1Z+ZUA+Ufbmpv9OIQmzDWEjUj2eSSsVHH9d/tUe34GmUut2Np7Jvrnl6
 7VdzqAiYRDMTjs6n+cxHJLSJ2oySXSMIqz2nfHeRNsH3E4LpO7eRKSyLxiJLyORuuKS/
 SO1g==
X-Gm-Message-State: AOAM533nbBOp6jF9kvpmc4o8YJ8m9A48v/+hrU5fMNwSQlZmSpgtBmxN
 rkSbQdOl4Y+iCcPlerOlQyF2ecQmwCRn0wW/lAidlvesCtvsF1hp
X-Google-Smtp-Source: ABdhPJwpYbHtsKqzvUh856LHTzTP6NBw6Ufzhzl1fuggS7R7Iuv7uS137uKXoomI1n9T2jbuozxHNd7ywAOKOGSkBt8=
X-Received: by 2002:a5d:64a8:0:b0:1ef:f99c:8c12 with SMTP id
 m8-20020a5d64a8000000b001eff99c8c12mr780480wrp.214.1646053813809; Mon, 28 Feb
 2022 05:10:13 -0800 (PST)
MIME-Version: 1.0
References: <20220216052110.1053665-1-mchitale@ventanamicro.com>
 <20220216052110.1053665-2-mchitale@ventanamicro.com>
In-Reply-To: <20220216052110.1053665-2-mchitale@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Feb 2022 18:39:44 +0530
Message-ID: <CAAhSdy2imgdYY8nv30Z_Am1PmR83uBy041H07N2+YivnRJN1kg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] riscv: enum for svinval extension
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_051015_996926_E4C1F24E 
X-CRM114-Status: GOOD (  15.05  )
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

On Wed, Feb 16, 2022 at 10:51 AM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> Similar to the other ISA extensions, this patch enables
> callers to check for the presence for the svinval extension.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>

Please update riscv_fill_hwcap() in arch/riscv/kernel/cpufeature.c
to probe Svinval extension.

Regards,
Anup

> ---
>  arch/riscv/include/asm/hwcap.h | 1 +
>  arch/riscv/kernel/cpu.c        | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 691fc9c8099b..bbff7cb279ea 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -51,6 +51,7 @@ extern unsigned long elf_hwcap;
>   * available logical extension id.
>   */
>  enum riscv_isa_ext_id {
> +       RISCV_ISA_EXT_SVINVAL = RISCV_ISA_EXT_BASE,
>         RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
>  };
>
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index ced7e5be8641..ff0613f8cc39 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -71,6 +71,7 @@ int riscv_of_parent_hartid(struct device_node *node)
>         }
>
>  static struct riscv_isa_ext_data isa_ext_arr[] = {
> +       __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>         __RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
>  };
>
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
