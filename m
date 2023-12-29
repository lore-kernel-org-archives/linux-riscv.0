Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43ACEC3DA6E
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 00:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Z/Lmlv05GTKdecB/wnwDCT87mMR47xcUk2xzLLmqgWg=; b=YBC/gn8Ujmars34aoJgObs1Otm
	LgW2+TjZnOBJ52V6oMFWxfIYsWoEAjT5lxdRtCDFgJ+htHWedNBcy5nfQVWQcp8RG83sAfR9DjAX5
	A9rqe67+CmYaJEWMT8wr3j+Hw+5TRg8jqlMeZhnb0eQC01D3/d4/VfMcEpMoSOYd6VJLve0K1jsQp
	tHpeu5nAmKyK24bJbv8u/R4LexYNWWuu6M84VQN4Ea4XEhviQGrK5U0j7y7y/aU2n80rv7DMPJJoj
	NIjJt5hJPBbSQ+xQE6u23CFH5zSdZpB6m13XLgRBcIaF7800auYUMsI72l53E38RevesxWhwmh4Jr
	R9Fv+jYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ0Xw-00HZkq-2J;
	Fri, 29 Dec 2023 00:16:16 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ0Xq-00HZiq-2n
	for linux-riscv@lists.infradead.org;
	Fri, 29 Dec 2023 00:16:12 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3bb53e20a43so5271833b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 Dec 2023 16:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1703808968; x=1704413768; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YF8VYnIQOQqAaiJ1Fk4AaOQ/0YJajKW06kr07Kc5Pmw=;
        b=ucpxdRsUbyvtaGxoDxuxb54mRYWffjy7ccb61vZG1cbNBE303jSi/UgKj7qfgPUnoo
         Oi4xW3xaLTSnKdl0ZDUjpFRwDmfoWJx0gmKuIBRC1TwxFr0YGyGDUSe3nyVyQX46Zo8l
         cD4Cld/JYrI7B+e4k7oYP8+IbBiMxROeFyRU9bPMTW3P9fh2We/TiwrJk6kgKtSJxn1t
         m+Un6dx1fo03SpXAByMDAPuj7pkwY4o1aVPkdBz3vIFdHbMbcaBx1j5LYAzfifmp/VKb
         Jtb+7+FQr/m5aNG3kQ21MfIWESPTdvEJ+AyEWKGV1gDcBMeV+Paj3F3Sz7C3ehAXvYIM
         HkHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703808968; x=1704413768;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YF8VYnIQOQqAaiJ1Fk4AaOQ/0YJajKW06kr07Kc5Pmw=;
        b=PheAdv/87UF9+82ab3Kjy5ldmLzBR41ZSO/CCP6NCGVHFO+Lhx0FXNpOROhIOYQYLA
         2bhU8CYQymQyTdz1HR4zW2IpHNZTGEwy11CRvSlg2uDhFCczj/0PWoIT6kmC5/srqZaj
         tdB9F9eFsXb2yZyCcuOZOenXkq74wnLe+/g1zQa0YxRpl2O3N9JIBeJGv2SgP4Lbhfuq
         aJ3r3KbsslMu2Ph6d+6OIVMAEPYbxFTccw6Wc00l5o1rOWW4zhj1MsacwdJQj1UksjbH
         Kaq7gnJdyiVmKl4SDEZYpHceJG2xe00Slz2KYQofoied49wzrhHX28NYkGpY0N2tJMja
         X3cg==
X-Gm-Message-State: AOJu0YwPIZ4FtOpw6/DG6nu3uis+yBWydNQzIJan5WonX/VabiSfVk2z
	ZbyKJlrbKpOalU/+V+7c8iXaBPz7eHE1RQ==
X-Google-Smtp-Source: AGHT+IHHx4W0B/1pZutO7lzLygxRXci+UxI/fuD6WNdIvohnaJq9dm1XqSdQfH5oJFOgJO3eWZ+/fA==
X-Received: by 2002:a05:6808:1817:b0:3bb:d669:5e26 with SMTP id bh23-20020a056808181700b003bbd6695e26mr1406139oib.33.1703808968499;
        Thu, 28 Dec 2023 16:16:08 -0800 (PST)
Received: from localhost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id z188-20020a6265c5000000b006d095553f2asm14733674pfb.81.2023.12.28.16.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 16:16:07 -0800 (PST)
Date: Thu, 28 Dec 2023 16:16:07 -0800 (PST)
X-Google-Original-Date: Thu, 28 Dec 2023 16:15:40 PST (-0800)
Subject: Re: [PATCH v4 02/13] RISC-V: Add SBI STA extension definitions
In-Reply-To: <20231220160012.40184-17-ajones@ventanamicro.com>
CC: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
  virtualization@lists.linux-foundation.org, anup@brainfault.org, atishp@atishpatra.org, pbonzini@redhat.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, jgross@suse.com, srivatsa@csail.mit.edu,
  guoren@kernel.org, Conor Dooley <conor.dooley@microchip.com>, Atish Patra <atishp@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ajones@ventanamicro.com
Message-ID: <mhng-00bc7d81-742f-49cb-8f3f-c4b0bd83c6c7@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_161610_902882_1ADAB3D1 
X-CRM114-Status: GOOD (  14.95  )
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

On Wed, 20 Dec 2023 08:00:15 PST (-0800), ajones@ventanamicro.com wrote:
> The SBI STA extension enables steal-time accounting. Add the
> definitions it specifies.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/sbi.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 0892f4421bc4..b6f898c56940 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -31,6 +31,7 @@ enum sbi_ext_id {
>  	SBI_EXT_SRST = 0x53525354,
>  	SBI_EXT_PMU = 0x504D55,
>  	SBI_EXT_DBCN = 0x4442434E,
> +	SBI_EXT_STA = 0x535441,
>
>  	/* Experimentals extensions must lie within this range */
>  	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
> @@ -243,6 +244,22 @@ enum sbi_ext_dbcn_fid {
>  	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
>  };
>
> +/* SBI STA (steal-time accounting) extension */
> +enum sbi_ext_sta_fid {
> +	SBI_EXT_STA_STEAL_TIME_SET_SHMEM = 0,
> +};
> +
> +struct sbi_sta_struct {
> +	__le32 sequence;
> +	__le32 flags;
> +	__le64 steal;
> +	u8 preempted;
> +	u8 pad[47];
> +} __packed;
> +
> +#define SBI_STA_SHMEM_DISABLE		-1
> +
> +/* SBI spec version fields */
>  #define SBI_SPEC_VERSION_DEFAULT	0x1
>  #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
>  #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
