Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CE3C64EB1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 16:29:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41ACB20837
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 16:29:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YD1oqphm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="QqWh8jvD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41ACB20837
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=IlQDG/IBBlf4McJ8/2EOQH0hI5sp1tL7w9nhMRlTkUA=; b=YD1oqphmQH90ekiSl75LsoLnx
	acvJEY9aO9RPbnA2GAQ07YY5cyuEa/gDceu5n/g65dDhefEhzuFoh9UPsXD1ybV1fDxKC7AlUsEj5
	j3nHVyE+SBj78dQC0Mm0cWEEzpK/iwO+bkANPrZyfHyBTGtZU3lRnNEpDWyWDDW7KFwf+6uZcT+r2
	7F5Y+wQAkhCNZalMvzb/U61CVNcOsMtT+itNMGotXrTifKh1l8GmTrfD7YnjesOvaxDb6drCBai1C
	l8LpxSP1kX9Rgm8PTnwnqADbdwqeBOorc0aPEZuXzZuYil38fCZYCOgvPBuoFW2jYxqITfAHVpRNl
	mRTXpF7hA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVJ0V-0005em-NV; Fri, 07 Dec 2018 16:29:39 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVJ0R-0005TO-7D
 for linux-riscv@lists.infradead.org; Fri, 07 Dec 2018 16:29:38 +0000
Received: by mail-pl1-x644.google.com with SMTP id gn14so2045726plb.10
 for <linux-riscv@lists.infradead.org>; Fri, 07 Dec 2018 08:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=X2pu8p3WZy3f+AE9epItTKGjPmNG8+ItYYTRAcx7W+g=;
 b=QqWh8jvDePAOhofuVQh0swZUyA8wlLQxcP6G07/2c8ZcESSxdI9GUqiDoXsymf8GQl
 rMN5a73555bUpsR0RbLU2GK7F2K9gGwnOwB4Kt3ZjdV3vb2t9Y8FBrmjFQlsCh1r9Cec
 vokBs5WxtgwVmFlt1gzu23Anf6ODsjc08PotZzDOn588ukXJYHrd7MocKk7z+m5kxeh7
 tmg1ZdxjC6EhHhP1TxKTjK+/ROTYEoGJta3Z9XdlGuQjtiknQWKbGpi1Fgk3FVfzh7zX
 +U0oHPhdmIpRjbhUAxLKZP+UHBrVnTcMxLffnOtc/5GdETNFyp3YMr+P9XJBrcMLytud
 YnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=X2pu8p3WZy3f+AE9epItTKGjPmNG8+ItYYTRAcx7W+g=;
 b=iHn9VsI4bKLc+fpjf7VJTXDv9npNE/pean2sl4/0w9xZS3mILkQGDMpJdMnt/ZiQGc
 wLxVDO8nXKd5TmM54YV9DuAlLTVwbVGMUJ6da5rsCz9+BObKBbgJC73nw6XOOssDTsEl
 AmZ27+lpwMnQLH0v6D2G0UKE6lPukLBCAMbAkNbc4V6B8DgQBzjg2O624b241HwaiU14
 jnEo7N+dHeOcAq8giNnM2y/JMlHTdCF1cLIp41WCk3CZoQpWEJMYSAa5yZ2NhIzF6Uq/
 uB767tpiaEFdYhq1Fdug2ppnS4M4zXm8YbRwFx1cG8BLtxwGHRONI5wk+Ue5X5YEaha8
 N1fw==
X-Gm-Message-State: AA+aEWZJlSu9bDb+nQBdQGIjDbFQiQeUMhDSzfxwRJ+nH+0L/iCNpVrI
 P2iTiwx0Fm4OiU4VH+pXfIqaBA==
X-Google-Smtp-Source: AFSGD/VPQK3YjMW5KcYamItmXPt3ZkU3p4hQQuC7lNu6PLyR5sqQ/VdrhMHUbVoUIHb/ETybuLhMrw==
X-Received: by 2002:a17:902:a6:: with SMTP id
 a35mr2734632pla.201.1544200164102; 
 Fri, 07 Dec 2018 08:29:24 -0800 (PST)
Received: from localhost ([216.3.10.7])
 by smtp.gmail.com with ESMTPSA id g2sm4750135pfi.95.2018.12.07.08.29.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Dec 2018 08:29:23 -0800 (PST)
Date: Fri, 07 Dec 2018 08:29:23 -0800 (PST)
X-Google-Original-Date: Fri, 07 Dec 2018 08:23:54 PST (-0800)
Subject: Re: [PATCH 1/4] dt-bindings: Correct RISC-V's timebase-frequency
In-Reply-To: <1543870651-16669-2-git-send-email-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: atish.patra@wdc.com
Message-ID: <mhng-a15b587e-3bfe-4568-8262-dc421585bc36@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_082935_376078_C938D799 
X-CRM114-Status: GOOD (  19.87  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Damien.LeMoal@wdc.com,
 aou@eecs.berkeley.edu, dmitriy@oss-tech.org, anup@brainfault.org,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org, atish.patra@wdc.com,
 robh+dt@kernel.org, tglx@linutronix.de, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 03 Dec 2018 12:57:28 PST (-0800), atish.patra@wdc.com wrote:
> From: Palmer Dabbelt <palmer@sifive.com>
>
> Someone must have read the device tree specification incorrectly,
> because we were putting timebase-frequency in the wrong place.  This
> corrects the issue, moving it from
>
> / {
>         cpus {
>                 timebase-frequency = X;
>         }
> }
>
> to
>
> / {
>         cpus {
>                 cpu@0 {
>                         timebase-frequency = X;
>                 }
>         }
> }
>
> This is great, because the timer's frequency should really be a per-cpu
> quantity on RISC-V systems since there's a timer per CPU.  This should
> lead to some cleanups in our timer driver.

I think I was actually wrong here: the top version is preferred if 
timebase-frequency is the same between all CPUs, while the bottom is if it's 
different.

Updating the documentation is still good, because it matches the hardware, but 
the commit message should be a bit less assertive... :)

> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.txt b/Documentation/devicetree/bindings/riscv/cpus.txt
> index adf7b7af..b0b038d6 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.txt
> +++ b/Documentation/devicetree/bindings/riscv/cpus.txt
> @@ -93,9 +93,9 @@ Linux is allowed to run on.
>          cpus {
>                  #address-cells = <1>;
>                  #size-cells = <0>;
> -                timebase-frequency = <1000000>;
>                  cpu@0 {
>                          clock-frequency = <1600000000>;
> +                        timebase-frequency = <1000000>;
>                          compatible = "sifive,rocket0", "riscv";
>                          device_type = "cpu";
>                          i-cache-block-size = <64>;
> @@ -113,6 +113,7 @@ Linux is allowed to run on.
>                  };
>                  cpu@1 {
>                          clock-frequency = <1600000000>;
> +                        timebase-frequency = <1000000>;
>                          compatible = "sifive,rocket0", "riscv";
>                          d-cache-block-size = <64>;
>                          d-cache-sets = <64>;
> @@ -145,6 +146,7 @@ Example: Spike ISA Simulator with 1 Hart
>  This device tree matches the Spike ISA golden model as run with `spike -p1`.
>
>          cpus {
> +                timebase-frequency = <1000000>;
>                  cpu@0 {
>                          device_type = "cpu";
>                          reg = <0x00000000>;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
