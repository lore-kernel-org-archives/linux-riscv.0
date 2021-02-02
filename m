Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C26CC433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 17:54:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B24C264F90
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 17:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B24C264F90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3x/utVVJs58GnTTTrdY9Vw+SUyesm2kJTQ3PUQa7Hec=; b=mggBSdO+rJ5t2LbwWm50IsFpK
	nW7+OMoxm14T9Tn9H7JWOFkuUmXZQm5tW1XVXBRinsjSS54zlyP8EPd31eNs+ZZ/+hnNp6YNqhDdi
	y46p2SIQtT4NrLBdaqdE1cd/3t82Ij7/T87aXQQbsm3ZqaLkzeI3Qdk8jo0FghuNvHAIa6rJak7H/
	svvscY0iYkOv0CLDnJSiK5qTf+LJy9XPoEAaCaRzgO3iVd8Jd9bdJpZCJSn99C30y2pBmg0P+Z3Mf
	2atYh2oX/UxI+LupBd2mSGSuvrD6Pqo4vBXeg3KFX03HGv9/O8ialWYgodWUhC5blQgaBhweZIev+
	dMCvK1h4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6zsZ-0001TO-FA; Tue, 02 Feb 2021 17:54:19 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6zsW-0001Sd-JJ
 for linux-riscv@lists.infradead.org; Tue, 02 Feb 2021 17:54:17 +0000
Received: by mail-il1-x12e.google.com with SMTP id z18so19626468ile.9
 for <linux-riscv@lists.infradead.org>; Tue, 02 Feb 2021 09:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=em1FpT76uug6DRAz+4wTkbqjvjPRUJbYEn1f/uXEBkc=;
 b=es1uit2HfGMVdqh9KRuE00YwmSOw/LtKw9dF+RBHEuOobPOd5UB2ON0C1scC8DXQsu
 h4HTBMfoz8VswROhsBOQV+eBth0ukHUPVt9skA/puLsRkhY6FEgLMpFW9WQvQ8SUMhjm
 kxtdqUheHLj10zadoZClVE+abU2XIzfRyNRPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=em1FpT76uug6DRAz+4wTkbqjvjPRUJbYEn1f/uXEBkc=;
 b=ajddc3Wygnxh+ecX2hdESH1NerRfSsmbCmEDJLTBy2/v9lGTCSmPOKDPW6nncfCId7
 6oJemOzu6ZcIWrhTmw/1A2Y3qeArEbBkNzw09qtothvjdsuGKhjCWETKXuDG/UQmZMSt
 oLBe4FBEOg8RkQfx0U3ZOLJpZTJQ7BURw1w+NftS9YUcKDKP5QnlmpYQsSBajsHk2RAQ
 rHA1WBy0XxGBg19PDfFgMRXsBD0CguzgxJNVfSMPiGs1qxiP6fslLLF/RKWqST7cgamH
 dBTO1hCQLx9aFCpkHD/lmS/Vj0EO+VTyLtddndP89np0r1cOCB8UndV+oFRvGTLrVsIB
 /7Nw==
X-Gm-Message-State: AOAM5335txLUhRmrs+TMLLmm2apoJhMc0Lu/dvYks3qjAHn39yUTMBIg
 2P2Ev4GBrC3lUHEgjZOk2BsOk5GcwbauKiOJg775
X-Google-Smtp-Source: ABdhPJxLRLtfvAv0tI0BuFoAM4y6OkPK0G+kVXthqwdJx1/kacdheNgneo0jm2r7jkxeZMPdsGkLjNOWV0cJf63cW3I=
X-Received: by 2002:a92:cd8e:: with SMTP id r14mr18683723ilb.77.1612288454471; 
 Tue, 02 Feb 2021 09:54:14 -0800 (PST)
MIME-Version: 1.0
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
 <20210202103623.200809-4-damien.lemoal@wdc.com>
In-Reply-To: <20210202103623.200809-4-damien.lemoal@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 2 Feb 2021 09:54:02 -0800
Message-ID: <CAOnJCUK4Pg25hAFULAZMMM6oEZugPJXw9bbNT6eo-1_+sHV2cQ@mail.gmail.com>
Subject: Re: [PATCH v14 03/16] dt-bindings: update risc-v cpu properties
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_125416_667787_3B7A4B5D 
X-CRM114-Status: GOOD (  17.37  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 Anup Patel <anup.patel@wdc.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 2, 2021 at 2:37 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> The Canaan Kendryte K210 SoC CPU cores are based on a rocket chip
> version using a draft verion of the RISC-V ISA specifications. To avoid
> any confusion with CPU cores using stable specifications, add the
> compatible string "canaan,k210" for this SoC CPU cores.
>
> Also add the "riscv,none" value to the mmu-type property to allow a DT
> to indicate that the CPU being described does not have an MMU or that
> it has an MMU that is not usable (which is the case for the K210 SoC).
>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index eb6843f69f7c..e534f6a7cfa1 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -39,6 +39,7 @@ properties:
>                - sifive,u74
>                - sifive,u5
>                - sifive,u7
> +              - canaan,k210
>            - const: riscv
>        - const: riscv    # Simulator only
>      description:
> @@ -56,6 +57,7 @@ properties:
>        - riscv,sv32
>        - riscv,sv39
>        - riscv,sv48
> +      - riscv,none
>
>    riscv,isa:
>      description:
> --
> 2.29.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
