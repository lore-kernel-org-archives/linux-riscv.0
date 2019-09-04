Return-Path: <SRS0=6ibT=W7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCD8C3A5A7
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2019 12:11:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5311622CED
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2019 12:11:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ucYx4JGH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="bZRGOE4M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5311622CED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wdG4mqYvuuXQ5wDF5bhGQGWO33rVulb7uRQjy+C806Y=; b=ucYx4JGHilxA5k
	DWyZepMRfYG1lSHkA2J318F8fSVYwNC/Go/yIHGI3fg/OiGpwtB8P4FIb9e6XCT4b1TpzAJDSor7e
	UzgchkqrL0Y7IGYDA3P4Fz+d8mxrzKwKnyxUWEuRksy1NIlrj7CO0GKur01Lvydiwd4wKlodXzeUb
	IlmlVeaSs/V7mPI58/EnFTVlLXiI46N+UQN7Rf/R0dEwZwC77VBl4P36CG7PO3pfaLF/IBU6Qs27K
	hDQX16iS8kYk7VBiXIVKRyvdjk4AGFCnyGCVOMHAwqedS99USe7JzxHXl4WGGzbusK4ysE8iIm4g3
	EoNCFQs1c5Avdp7vVIug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5U7w-00084s-S9; Wed, 04 Sep 2019 12:11:08 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5U7r-000845-TI
 for linux-riscv@lists.infradead.org; Wed, 04 Sep 2019 12:11:07 +0000
Received: by mail-lf1-x136.google.com with SMTP id l11so15718575lfk.6
 for <linux-riscv@lists.infradead.org>; Wed, 04 Sep 2019 05:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Sbn4WvhXi2SN97WE/ER2GcVDBNdL4f0DKQLlN5gdE0=;
 b=bZRGOE4Ms77c7h0UOMkhDbatEyZAWh2VW6IMNk3uARbJjb4XIofOOLvviyixJaAYrl
 oVtfmKGHP/7y4mi65n6HjQIGikLHBuJSAwNjHPzQBqNmwES8tddVfJFDqpiE8Wn/yQ6g
 FnA8Hic8ao8aoGNgVqujymjAqF6wb2t6ERzP65c+ZP/EkpCJk0Sh8lwAv6hTEcGWeHD5
 tkvW41DOIg9r+xc/A8qrrNRL2AiNoV+/jRT2BEanT4AXb4mecZNf0qxyY5dxF7vXqsC5
 wg8w7wkRTdTeoh1uh2VennsUHcMYR0dPVthh/njgo/7eBmBOnFP3vSi9sFAVeM+g18JX
 jiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Sbn4WvhXi2SN97WE/ER2GcVDBNdL4f0DKQLlN5gdE0=;
 b=rDUGP7Y4wN3gCPOngz8KUMifS5aTXqOBwAMuxZmwq7IsQ5ADlqjJxX0LPCBDnpEjlU
 7v/A8lDJOr1w3HUdgFun84ugi0tlRlM4Hykn9ACCU5dgH/7FqyORfoP7d0SxMS6CfhnS
 2elArPLMBePv+ciZ3C23f8B+gzeffcDFBtrweZQAsltExsflgEGgILvkQSoskpkOWNuP
 Jy6REzecPtPb4SuSPBtfObEWTCSs/G5dskE0tXTr4V28UxkMkyE+Dg5EM/x7DEinELI/
 xNTB0VGuKByqffhtwUVKr74gkr2TocV29hCqb0ShGOkXOzEWPG6f6/d+VGPGpreqRzLK
 OZ5Q==
X-Gm-Message-State: APjAAAWX6n+mgBUmT67/h1RhkG9v4mi25Ra0J3k+QVmVy3/JURPAEMDP
 PaQeqJFvvoQxVmD8Wn7iZ5TLV8JDUPapzLJEb3CD/A==
X-Google-Smtp-Source: APXvYqyuMigwoe5rk8OKUmkhLwr0krRPy5cW4X1jr5B7Y2tY07Q8fTwkocKNhiYQuS0GgYymYYMmI70dnX0r3fXsja8=
X-Received: by 2002:a19:2207:: with SMTP id i7mr23806501lfi.185.1567599058577; 
 Wed, 04 Sep 2019 05:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190904111836.122616-1-weiyongjun1@huawei.com>
In-Reply-To: <20190904111836.122616-1-weiyongjun1@huawei.com>
From: Yash Shah <yash.shah@sifive.com>
Date: Wed, 4 Sep 2019 17:40:22 +0530
Message-ID: <CAJ2_jOHMu3V=wv7mThSw0A6wMkE1N_=sN3_8PjEOw+cLPO94NA@mail.gmail.com>
Subject: Re: [PATCH -next] pwm: sifive: Remove redundant dev_err call in
 pwm_sifive_probe()
To: Wei Yongjun <weiyongjun1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190904_051106_447978_6436187E 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-pwm@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
 kernel-janitors@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Sep 4, 2019 at 4:31 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/pwm/pwm-sifive.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>

Reviewed-by: Yash Shah <yash.shah@sifive.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
