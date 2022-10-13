Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617EDC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 05:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K5rmTMEXp9SuhoE46ROqconjobTR2bZbCqzgm//+y8k=; b=3nF+wPq/ZPl3zm
	GM3Z0MdPu16XJPGNY/lhsUmUZEL5wY0RjuI1fpYQAmrdIoFMFU0kC/460u6xyIW0TQRVg6LozTTnR
	A+pRd81fLuL1KJZDqI5iTZVTMchC+XUnjlDIEUSAoI9HARCd/AKEpaySuKRVl6KX3IsS0I7F5sRyq
	HBHRRvzAtidbMJdY6H5AI0O+kxJ/14awe0qW95IiVHASwLeMsVjOHj1LvXdErIT6fhv1p5RsxVqNV
	JOFzhWPSS3n94SzNC+cFhVYezsCzLz3mTpnf3Zt9EX5h2EklWi0ZxODvY51KyNDuzEOIBB0mPkKWS
	UE4BMss2u8t43hwMqPLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqVy-00Ag9j-3h; Thu, 13 Oct 2022 05:12:14 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqVu-00Ag7u-MU
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 05:12:12 +0000
Received: by mail-ed1-x531.google.com with SMTP id s2so1094736edd.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 22:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kkyrx1Znba6oMJlbMbKNHBLPGS3UQO2yMAPG56S4wEE=;
        b=f9xOtmWTDP1Ql7HNOHis1Yu79rGcoWu7OZQLEp82wg4Hl9JWXAm7slRfxrKYiArICP
         fxKEA5SMIrJPWJ3VHPfBwumqpG7INEhi0IFp0pt/pCW3su/TI4EmjJyKP6rMP+W/br5k
         JdtoR6KjK6BWjfccliXmpaorrgcLXzRxfEK2RSF03kAVPtlseBLRLE3f7JT8lHgfm5Gu
         re9PClTkszTFmsSHkcl3Rr3vQHpMicDq8szKBOBfliKy5X5ywIB+4PAtC07qbbFbPjx3
         hGoll99IsqYGRnnVPeBwHGyA0HlgLK6F110ZOu8cXG1z7Cp2wAyX2CpjOQXw71rsJ8jR
         YohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kkyrx1Znba6oMJlbMbKNHBLPGS3UQO2yMAPG56S4wEE=;
        b=OhXk44J7esjomAiWoXmsgkSCCF7OdNAHxJzOnnmWc3u8l35ALWSX7kVs4LXITi2iME
         s7Uhzp+E8Y7mRDMYyDTRKwWgQM/szoTTLmRpdzQnmnXKUeTkPNQ34n0rSxXfcNICP5y3
         qw9/QslIPjB7iZpIJSMMqU8xqedXd0QAait2RfmEIOaToAtvyxf/Dhqw7cZ+JmP/buy5
         wX2snrfrZRJ1IDrqVs8V1t7esaa4GUBD6+4dCAPkDQpGCwb687afxLs59XJ3A26fDrU2
         lGoPUT2hT65WFiVnG7XD5U3Awwfr7AHD9hwMVQFTN7IEc2y9WA0yRq2EXrJnGM3t0vTS
         T1Zw==
X-Gm-Message-State: ACrzQf1LP0DqN7HRbG5e/lOsZdqIo/C/xDDwE4TH2ITnd0w5vSJXomU8
	4NZk8HASY2zbJBRVxPiP40Mq8C6w09cpIkIuwhQUtH/9Jq0gPQ==
X-Google-Smtp-Source: AMsMyM7SFMR5jrhhKCNnKZguMo9ZCgkQc62vc7fEb+jhJVPBQbh0COyNJm2aJZta9/2ueE3AKiyQooKxzQPENVHB0tI=
X-Received: by 2002:aa7:c78d:0:b0:454:fe1d:8eb1 with SMTP id
 n13-20020aa7c78d000000b00454fe1d8eb1mr30767436eds.59.1665637924676; Wed, 12
 Oct 2022 22:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221013045619.18906-1-palmer@rivosinc.com> <20221013045619.18906-5-palmer@rivosinc.com>
In-Reply-To: <20221013045619.18906-5-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Oct 2022 10:41:52 +0530
Message-ID: <CAAhSdy18z6CbJ2SZ-oXYge+0aLi_kikO_UFL+35k01muHF9Xng@mail.gmail.com>
Subject: Re: [PATCH 4/4] Documentation: RISC-V: patch-acceptance: s/implementor/implementer
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Atish Patra <atishp@rivosinc.com>, corbet@lwn.net, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, 
	conor.dooley@microchip.com, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_221210_776336_64A082DF 
X-CRM114-Status: GOOD (  17.82  )
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

On Thu, Oct 13, 2022 at 10:26 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> Implementor does appear to be a word, but it's not very common.
>
> Suggested-by: Conor Dooley <conor@kernel.org>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Looks good to me from a KVM RISC-V perspective.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  Documentation/riscv/patch-acceptance.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
> index 9fed6b318b49..89c7d8abd4bb 100644
> --- a/Documentation/riscv/patch-acceptance.rst
> +++ b/Documentation/riscv/patch-acceptance.rst
> @@ -26,7 +26,7 @@ specifications from the RISC-V foundation this means "Frozen" or
>  ECR.  (Developers may, of course, maintain their own Linux kernel trees
>  that contain code for any draft extensions that they wish.)
>
> -Additionally, the RISC-V specification allows implementors to create
> +Additionally, the RISC-V specification allows implementers to create
>  their own custom extensions.  These custom extensions aren't required
>  to go through any review or ratification process by the RISC-V
>  Foundation.  To avoid the maintenance complexity and potential
> @@ -38,5 +38,5 @@ RISC-V extensions, we'll only accept patches for extensions that either:
>    for which a timeline for availability has been made public.
>
>  Hardware that does not meet its published timelines may have support
> -removed.  (Implementors, may, of course, maintain their own Linux kernel
> +removed.  (Implementers, may, of course, maintain their own Linux kernel
>  trees containing code for any custom extensions that they wish.)
> --
> 2.38.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
