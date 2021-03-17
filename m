Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C53C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 05:08:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED63864FA8
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 05:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED63864FA8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=DNk3UmxjBpItuTMuPcEf2s4DSSUCXvNAm8w/vf1ZTZY=; b=miy9as13hTsdHxhffKdx0LMTv
	GPr8i0W0yQLDLoT0JGYGCCy3xyX6HbYRcCCZ7JeIlsLbJ1gEzaHxMPSpe1GJAxxil+G8NYAswhAGo
	R88kBoy1f1gnTNtf4ApD7NBLgiBhJXAk88z+HPMzPbq4FKd/RDctL0foAtlyBS3e8yUvYweoXNVRw
	m4n9NSCNTof8r8F8TjXLQfbl/pbL9LVX63tWUnV96MBID+8yU9tO8FvGISGVm+uAsN/rKWfFPtCtc
	pZ+3C02DqoBJvC6nLW6jXo0IbCgitdKI1XCzHCQXJJ4M+m4eSEvxD/fI/n3JAQROmt5rLfduon80+
	ffXaY4HeA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMOPs-002U64-Ie; Wed, 17 Mar 2021 05:08:20 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMOPn-002U5g-Ps
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 05:08:18 +0000
Received: by mail-pg1-x530.google.com with SMTP id o10so24091728pgg.4
 for <linux-riscv@lists.infradead.org>; Tue, 16 Mar 2021 22:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=0skOxIz4xhfCTZ0VNwqsfY6NBbJN3e7Av5/rXN6cj/0=;
 b=dKAlbnzTgqbs9DMRjCdE4no8gsnOj57DaFLf50xhlLPr77tjH2ztzS5KJ2R2PKrIV+
 4SRXbqqko/0e/TzfSTXWKpU3PxKB/98Z0/cMhWk3b7gfJpYKNLMie4EYWKQRQxQ/E9re
 /xhgOy3MgIb9cOBeOwQdnE09OBEeUgzMQLVi6eqj2rkp3D3jELn4HLsEVxugA/Z+B63B
 AH0nKpVPI0MG2n3qDZEi2jvbEirfsLiLnaRrIxRGfQ2DYUAQajiJiqdwdjQ2IxfA3ZQO
 t3XoGsKL4UwfeeDicgryOAe/r0iXyH6Hvm/722NVKrHtMJ/+D/QGxBSfq5/Qn+6F7uJ8
 CHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=0skOxIz4xhfCTZ0VNwqsfY6NBbJN3e7Av5/rXN6cj/0=;
 b=iQRlSlNwRVU8rLD9LWpn/mA3R21Kqbhy4m738OeU5Dxwsj9iOHhq6yHsE19rqoyZDb
 IeVv+yA1AftMBOZ75YcaxeftC3QZpaVE9mvkKYUSvDcb/0F1zLchbs3XfM+7hyOw95Jl
 gZYGyVllI498EPfczk6mCoF0rr95QW7oNJ3rBy7uxuyadxSL6rHXYufdfzztLR0wS+NB
 ZI9P8pYW5Hpb4se61fD+IWPTA3i96IocpRLHQA17HXPG2ak+0i+PZRRQzjeyZ/cVtkye
 VJU/JaBqsoWmrtyyEiyLK0zkmc+8eLSGLDWqmNlD23S0GntVqPKf9EnVWkxRO4U+mXhd
 4WcQ==
X-Gm-Message-State: AOAM530HOiPxbCDY2yKMsahZAhfN7Vs8HysRn0NCuxjfvNfXi6ZAnG01
 98llL2hQ+9gifRfylx+PDdCVWA==
X-Google-Smtp-Source: ABdhPJxyF6choZsOEthrs6FkxV0u4DcptNNowEAldsfR7i5nVLXhWCspGoXV1Sy33c0Ua8caUUL7Zg==
X-Received: by 2002:aa7:8389:0:b029:209:da1c:17b5 with SMTP id
 u9-20020aa783890000b0290209da1c17b5mr2604704pfm.29.1615957694242; 
 Tue, 16 Mar 2021 22:08:14 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id h7sm18589926pfo.45.2021.03.16.22.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 22:08:13 -0700 (PDT)
Date: Tue, 16 Mar 2021 22:08:13 -0700 (PDT)
X-Google-Original-Date: Tue, 16 Mar 2021 22:07:36 PDT (-0700)
Subject: Re: [PATCH v6 1/2] RISC-V: Don't print SBI version for all detected
 extensions
In-Reply-To: <20210315110500.802897-2-anup.patel@wdc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 anup@brainfault.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anup Patel <Anup.Patel@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-15799b77-832f-49f3-ac18-af2ec08eebf5@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_050816_000681_F108A6E5 
X-CRM114-Status: GOOD (  17.60  )
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

On Mon, 15 Mar 2021 04:04:59 PDT (-0700), Anup Patel wrote:
> The sbi_init() already prints SBI version before detecting
> various SBI extensions so we don't need to print SBI version
> for all detected SBI extensions.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/kernel/sbi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index f4a7db3d309e..c0dcebdd30ec 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -577,19 +577,19 @@ void __init sbi_init(void)
>  			sbi_get_firmware_id(), sbi_get_firmware_version());
>  		if (sbi_probe_extension(SBI_EXT_TIME) > 0) {
>  			__sbi_set_timer = __sbi_set_timer_v02;
> -			pr_info("SBI v0.2 TIME extension detected\n");
> +			pr_info("SBI TIME extension detected\n");
>  		} else {
>  			__sbi_set_timer = __sbi_set_timer_v01;
>  		}
>  		if (sbi_probe_extension(SBI_EXT_IPI) > 0) {
>  			__sbi_send_ipi	= __sbi_send_ipi_v02;
> -			pr_info("SBI v0.2 IPI extension detected\n");
> +			pr_info("SBI IPI extension detected\n");
>  		} else {
>  			__sbi_send_ipi	= __sbi_send_ipi_v01;
>  		}
>  		if (sbi_probe_extension(SBI_EXT_RFENCE) > 0) {
>  			__sbi_rfence	= __sbi_rfence_v02;
> -			pr_info("SBI v0.2 RFENCE extension detected\n");
> +			pr_info("SBI RFENCE extension detected\n");
>  		} else {
>  			__sbi_rfence	= __sbi_rfence_v01;
>  		}

Thanks.  I'm just putting this one on for-next so you don't have to carry
around the diff.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
