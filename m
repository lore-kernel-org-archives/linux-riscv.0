Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E338C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 17:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=JSJictKQnyAcAVxic0dDMrb6xfIbavO+7zJs0qh4Uzo=; b=cRjfBhpXv9KKkaHZSdrMh4AAUp
	iSqR6m0QgpNTfFMpdzTWH1bUlxWpIxaWjHEbncfVtvgi0B+0FsUOW4mw29sHUE0Yuhxnby21O3cKs
	hqxkqdjt0G122l2YAodkIjaQvMFx/uuJoJTAMushrNSChLYqDd6jvW+NT7J6JlAABZ77FVPLvKpvW
	2RTln+80E8818vcGeMOpSg5UhGep0pyB03lcHfHQEEwzAS18Ji2K2QGJKj7pK7f8tnlsyPMucYGn+
	NcGb5zTFogrsnsI5p4xafw+uIlLbmZTXDd4Gt/joI7VNfp3X7T0T/HAY1Y2O+7fuz8Q2Li/UddNvQ
	3jLdMSow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1AEO-000SGD-UC; Fri, 02 Dec 2022 17:53:48 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1AEL-000SDl-U8
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 17:53:47 +0000
Received: by mail-pl1-x630.google.com with SMTP id y17so5298047plp.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 09:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZvJzDorQtOwNqLa1HHYVuO6backFKSVBd3ruJxRA2A=;
        b=eQnZOvNRY11eiZD6GVvQZwn1takWYswEZO6mnHfFnI3IOwcIiD6Zx+pagggcuTggyE
         KI2v9qhiuLOtxUaSbh05X+3u3ZJeuy2KPUw24QAEHeemgwvBVYSNg7VIrTgM/9CZF7Mh
         qIGRAfb52QV9/EArXB3WfOf73n/Zj+mT+acVF8xXToHtE9sTGamB58BUDzFZvKKrcrQs
         N82x9nRGEqlbGZDDayglBKpHk1Ju0LRifyISFL7XGTuJ4VTQZxgsAckVsHg9WKJDAtXL
         l1P2Bi6HAp3c1vtRk7yGNxdUdXKhF7PSfRXpRsPFM+uN9qkQfh86kWUV6Q3Nt+kAw8ul
         RFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZvJzDorQtOwNqLa1HHYVuO6backFKSVBd3ruJxRA2A=;
        b=gWRG8It9UbmRMf/j65Yt/FbM833ysI/9ba2HNlMF+AtXW5m2vzid+ojNjqzJTWALod
         N2N7IB9GyRQrKM95B158PGaHwsTNqDChVRsWtnfv66OOwsogsSBWJ2HoBQl8BsTngP2L
         rz1f+1+za8t6j/ymBzXv42X/zp5+/kDEheN3hAlvPnSazcEIR97QJwJdTWJaQiLQrn15
         RSKo2sXANNDn1vWJdFmtZQVNWGoi6hQaZjwaucf+DWzOp7G6pLXM/HggeIWaqb8tGzC8
         eaUehaoSn7unIDMubG4RMS37/q7JizhnrQtzvIhkyOuZIyjjRorVDO5JVsEH5BHL89O1
         zgMQ==
X-Gm-Message-State: ANoB5pl5cN0vPBzGU24Hn7jf88mAvYPLI2lD10C7wRDdY2j0aQa7fwwD
	UZ40VFkmJZOxPQhSTFSHbtx8bw==
X-Google-Smtp-Source: AA0mqf5X/TeHx5A5xtNnIKw6jgBgvRIH82EYzaYQxx+YmUJkhxCg9UKytVs/q/xMiH6X+7zxecaK0w==
X-Received: by 2002:a17:90a:ca85:b0:219:88aa:d3d1 with SMTP id y5-20020a17090aca8500b0021988aad3d1mr4968286pjt.135.1670003619663;
        Fri, 02 Dec 2022 09:53:39 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id w15-20020aa7954f000000b0056283e2bdbdsm5391440pfq.138.2022.12.02.09.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 09:53:39 -0800 (PST)
Date: Fri, 02 Dec 2022 09:53:39 -0800 (PST)
X-Google-Original-Date: Fri, 02 Dec 2022 09:53:24 PST (-0800)
Subject: Re: [PATCH 6/9] RISC-V: Export sbi_get_mvendorid() and friends
In-Reply-To: <20221128161424.608889-7-apatel@ventanamicro.com>
CC: pbonzini@redhat.com, atishp@atishpatra.org,
  Paul Walmsley <paul.walmsley@sifive.com>, ajones@ventanamicro.com, anup@brainfault.org, kvm@vger.kernel.org,
  kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  apatel@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: apatel@ventanamicro.com
Message-ID: <mhng-365b9851-cb0a-4e2c-9cf4-4eca9623cf04@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_095345_976313_6EDF7553 
X-CRM114-Status: GOOD (  14.50  )
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

On Mon, 28 Nov 2022 08:14:21 PST (-0800), apatel@ventanamicro.com wrote:
> The sbi_get_mvendorid(), sbi_get_marchid(), and sbi_get_mimpid()
> can be used by KVM module so let us export these functions.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kernel/sbi.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 775d3322b422..5c87db8fdff2 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -627,16 +627,19 @@ long sbi_get_mvendorid(void)
>  {
>  	return __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
>  }
> +EXPORT_SYMBOL_GPL(sbi_get_mvendorid);
>
>  long sbi_get_marchid(void)
>  {
>  	return __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);
>  }
> +EXPORT_SYMBOL_GPL(sbi_get_marchid);
>
>  long sbi_get_mimpid(void)
>  {
>  	return __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);
>  }
> +EXPORT_SYMBOL_GPL(sbi_get_mimpid);
>
>  static void sbi_send_cpumask_ipi(const struct cpumask *target)
>  {

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
