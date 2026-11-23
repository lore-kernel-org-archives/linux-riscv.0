Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718D9606A321
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 23:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lj4p5rr2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20260707.gappssmtp.com header.i=@dabbelt-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aDj9Ek/3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ylDRAxwyW+fnIiMdIA8drPL/AjRxgpRnt8kszb++Dl0=; b=Lj4p5rr2ng2u7lAwIL9TU8syQC
	XHiAz0Hl+ontW+XiOMpKksdBYP327tv8161OAs1kquLUkEeYYEvMCHjbVURRsLnk23ugGfmzpkg5a
	gk14SAdYsQRDbAJrC+QQLZAtCUlUrxXhSTONb68pna46W5HeZloovvNmPckTibOsG41f0DiB7yZZV
	Tq5Rq2wSy3eJ8ZS2K7dp/UmXz+lij3iowonubl5VPqlKcOewtJF2LPZyl7rM4kn2KfRDYcgOrt3wc
	SAbpFFYyXYC5A4PgURvsYgFD4yhlCQ98/1J36M+lkMLuY1n+Onk59+lhXULDMiTZGly0n+HyPBxMT
	yu0RS4lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdAo-00000005884-2abb;
	Mon, 23 Nov 2026 23:10:10 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdAi-0000000585D-38m6
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 23:10:06 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-1a3c08d6928so5444414c88.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 15:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20260707.gappssmtp.com; s=20260707; t=1795475403; x=1796080203; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yJZxE8UsaiowVdwt1YcdicPZ3NQW6lymxuwD7Hxpfzg=;
        b=aDj9Ek/3udp56j6OYz6lZpfdAYg6Uc2/zxei8xHyYFiWLeUX43dmNn+rzDObm0qyNe
         kuKZ0rytRbA9KreXX78WlemFTTfUvmDrnyBIubU8fz5MatB4iGn82Eh3aV9pIGs3VlzF
         pZkS2ZLggjWwF8DwzyDsjBAa+5VrskIvewSs0b06xgBEd3jT/fKzPYf3S9mcItiU6ImB
         KEAU9GRBY/rHGNdH8nDMs2cpy+AipjO7NvU/r3+JxiU/nvWcHiVqF4y2ew3ludbBbvt6
         qnX0dhS/XpGeQY8Kw1R9GMAJH5cx6vld46V/o/CHYT5UnV3F6uQAV1pX2MZSs/nMUnWN
         ZaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475403; x=1796080203;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yJZxE8UsaiowVdwt1YcdicPZ3NQW6lymxuwD7Hxpfzg=;
        b=Q3iN3WKhUZAnTJqwbVAf9PWeqpwm79QV5Ugh+/KgzQrjESkXqsFJVvG+Db6OeLcjPg
         8oRFAQntiViEuev808lMymbNJpBB6icppxI05LnHtgReYDD7MhC+10oKs5992RtR0nsD
         GR/rcWPuhEmf+Q2M5Z009oGkJSdjJbsnKNoIL4E+DlsezWrr+ef+/Uw/dNDU4jLxV++l
         MeV5p5LTjPHDTGd+N5imj+IbGHudQhyCvAbjQFxDg2LkjavDPAwV2TW7iHkCcu/kOri1
         +cBRCy3HbL7zucNRDb4H2wF8EVnOnP4Vf9SE/CVMPKSALRvDMCOAQ0MWhHGn9TrNOBxy
         qafA==
X-Forwarded-Encrypted: i=1; AL+hErE7ad5VPTtPJumpoGQqWGErYkUXdTbuI6EZYFBklgaN8zGvvR8gjr6C4QWzywkZ42YpBjqupmaNRPeqMg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+tctjTuE0zDcmfShg/hlQbBkDUCpaMxJ4F3v3wvc1MEJLuicrq
	Bu5q7+I7oIpEMHAW4vUjfYxKUNWwg0XBu2DiLlIjz2S4FUsIITnlh7VYfJeTwjw52AY=
X-Gm-Gg: AZFdTZeNd0ahdIpQavWqbqL3L/aRu7QMT85CRXUuMOFVAVKOR6jaxXqiB+CpdKrR5qx
	LRfV3hJQ6DQiMrPjgy8Hg4BM0ispZPsJkO3L0xDX6WKF2GlvxWhv08zJeltsU3NM4e8bbNYHSqN
	Ai9/py6NXhruFSpTMW2uvaPO7SnB4os7OLJ9QUeO/7INWVHBJpNlmrHo5bDVYcnANsBJOf/T4fs
	gaaJXSPz9unExKWlYxSPqXMWycK/NzNuk761tjObLrfePSDm6gv8Mnnf1JxtybSgbDIdFMUE7R2
	Q4qsEAZIWOD/+dd7vm6U3L/FB1S8g7W5OpVOEprEcw30VjWZ7EaBlk7dc7Ni7VWBX9OeoNsXMjA
	fR3bjs9GxIMiAcDbu4xo582UiHWb70KB7Lm6rbDmYtJx6APOhTyHibUkuzvcU0KnIEKKpcjEcrf
	JaiNNYUGbu+kLjoYVGv2LepQ2O0oNPWsBBDaL/u2omCRp1gbbFsNViQtGrhR7dbXHWxc+dVi0hl
	Lobg4B6cVV4k1aQdwLrYrFrMURgeH6Fuci+LO+8A0WIrNvMaqYpsd0CxgEB1Q7kBlmB9HboVguM
	U90+hB414UCSVVHxfVB0ktFsBUtWwSBv1OxaaPWwLcmOOWZgK9kRdIkqPSx3dyJfgyA9/DI5SPo
	sYXVI8sUS9nSbv3XyAOpQQDLLlSM=
X-Received: by 2002:a05:7022:e0d:b0:1b5:b04:139 with SMTP id a92af1059eb24-1b55668c573mr18309442c88.0.1795475403196;
        Mon, 23 Nov 2026 15:10:03 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm30075627c88.15.2026.11.23.15.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:10:02 -0800 (PST)
Date: Mon, 23 Nov 2026 15:10:02 -0800 (PST)
X-Google-Original-Date: Mon, 23 Nov 2026 15:09:00 PST (-0800)
Subject: Re: [PATCH v4 02/19] riscv: Use _stext not _text to denote the start of kernel code
In-Reply-To: <20261118182105.1633603-23-ardb+git@google.com>
CC: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  Ard Biesheuvel <ardb@kernel.org>, jgg@nvidia.com, pjw@kernel.org, aou@eecs.berkeley.edu, chenhuacai@kernel.org,
  loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ardb+git@google.com
Message-ID: <mhng-EF917BD5-807B-4931-A0E1-AE1732E69C0C@Palmers-Mini.rwc.dabbelt.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_151004_809817_05EF0AD9 
X-CRM114-Status: GOOD (  24.91  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026 10:21:08 PST (-0800), ardb+git@google.com wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> On RISC-V, _text and _stext currently refer to the same location, i.e.,
> the start of the .text output section, which follows the image header
> (.head.text) emitted by HEAD_TEXT_SECTION. _start is the symbol that
> refers to the actual start of the image.
>
> On other architectures such as arm64, _text refers to the start of the
> image, and _stext to the start of the kernel code, and generic code
> (such as the EFI stub) may start relying on this distinction.
>
> So switch the only user of _text in arch/riscv, i.e., the "Kernel code"
> resource that is exposed via /proc/iomem (and from which the "Kernel
> image" resource inherits its start address), over to _stext. This is a
> no-op given that both symbols currently resolve to the same address, but
> it permits _text to be moved to the start of the image, making it an
> alias of _start.
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/riscv/kernel/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index d79f99b86033..e6112d424fde 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -91,7 +91,7 @@ static int __init add_kernel_resources(void)
>  	 * child nodes.
>  	 */
>
> -	code_res.start = __pa_symbol(_text);
> +	code_res.start = __pa_symbol(_stext);
>  	code_res.end = __pa_symbol(_etext) - 1;
>  	code_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;

Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>
Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
