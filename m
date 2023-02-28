Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59991C64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 17:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IbfSZQccQ87NPRQ/PtY90RsaCAKoOtLPtZalDdoUwUE=; b=LZn43rXj/n5y7s
	qDmNEi6zupqAc18Q+KVUjGS9BkCnjWdgPRxo4Jo3jjhYymR3iaW7krRFwF3fAZyaaL1Sbr+in9AMW
	2TVLg1N0coldr6K8Cpm4aaO6PIFw164TtWPmtkiUQUe6Jfkbr9W+twYKflg47ePhREVWuqXmkr8NB
	qoYQFEkSSHe/wTHIqhMrtkei0gkvatTpCdja/iHfLrvo93dcevCMQfykCUTuJXvO22karDQU04T6l
	YLjiN6lPOHlMPHdRVjOO2vMQa8lzunmmJd9cVArWjSXId8YeVu+3SZgjDwVkmUOpyDCd1gjaJfZ+j
	V9ZYxJ00g7KKQ0skDVlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX3Pv-00DpfT-Ct; Tue, 28 Feb 2023 17:05:31 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX3Ps-00DpeV-CT
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 17:05:29 +0000
Received: by mail-wm1-x331.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so5800221wmq.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 09:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uRlVne1cPHWQTiIJ7TpRc51l4pn44yUwelt6IAH+brc=;
        b=jD1YvwXY8A8SmfNay0MNTLlt7Mgdw7WkC+tiY/atQGdUsIfbyXDGRbhxy98rtKA4cN
         X4swK7OlxCf4aF48gUaJSc9fGCqPLVQXcgzN7tMtB314DQaZveTP91wdXInlv2db2V4O
         SewWK9YdY4x59a6V6+xZpX25H2ZY6rRsBPdDctl2tyeZAZdoGwlTBBQbXz/a0XSDtk9t
         bjjNDrtaWJIz708WrTfLO4g3IhZFcm9ZtHxtc4FWAbjUB6wIx5dMnCZlDPhQ/yscqNzN
         xGUjBwwQZAybkBI4NDWDC+IrFWra8xqSpIEJGZup+qAM5humNHsPOU/QSKTKbkRItOIS
         4b9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRlVne1cPHWQTiIJ7TpRc51l4pn44yUwelt6IAH+brc=;
        b=AL6KYeTs3A2YVfISrTQu2yXbRu/rmhDjHPJDMVRMTeJG4AwsHJ9SFpUQmLWaZy0nav
         e1rHKI8LivD9RuQIsNaOTQYfaklvXsRwtlvvJYTo+9y4tjese/Cp/piieYUGkJt37tss
         7gmaT+38boR1OeOHYDuO5Q1qeKwuZrO4Xia37m5mbNV0FI2OCFxzgn7SRXhuYRXiJ8bt
         FMptl97v3gj86Z9sAOI1INU5PllpCVpqWUr1oVpVrDSI9wd9Y/X6IJFZNXMveAZ9ot9a
         xVyAsXo54waFrBkZORmAqT4q9kdxFvfsH6ARvfh68OET9eI/jNj5Ab/XfLxSATRyJark
         OIsg==
X-Gm-Message-State: AO0yUKXY44x3X+moitZNacLrPx3C9yzt2nSBHNbVnMoOwCfH38SQvSzT
	pHLerF9b+XM+xqTBPtyKGNoyMw==
X-Google-Smtp-Source: AK7set9aBElTSRwOWh2DozkI1yWwL19TrGhTpHoCU9L1IZtloME4gBX4gKOrvxjxbLIoT7ie5evnPQ==
X-Received: by 2002:a05:600c:a4c:b0:3eb:2e27:2cf0 with SMTP id c12-20020a05600c0a4c00b003eb2e272cf0mr9749969wmq.0.1677603926171;
        Tue, 28 Feb 2023 09:05:26 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id bd12-20020a05600c1f0c00b003e0015c8618sm16737530wmb.6.2023.02.28.09.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 09:05:25 -0800 (PST)
Date: Tue, 28 Feb 2023 18:05:24 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: apatel@ventanamicro.com, Atish Patra <atishp@rivosinc.com>,
	linux-riscv@lists.infradead.org, leyfoon.tan@starfivetech.com,
	jeeheng.sia@starfivetech.com,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
Subject: Re: [RFC v2 PATCH 1/1] riscv: sbi: Introduce system suspend support
Message-ID: <20230228170524.jjbsecq7rn5aeqzs@orel>
References: <20230118180338.6484-2-ajones@ventanamicro.com>
 <mhng-2b30e6d6-d8bf-4fae-a95c-f9e042ec90d0@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-2b30e6d6-d8bf-4fae-a95c-f9e042ec90d0@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_090528_447351_5052AFC0 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

On Tue, Feb 28, 2023 at 07:54:56AM -0800, Palmer Dabbelt wrote:
> On Wed, 18 Jan 2023 10:03:38 PST (-0800), ajones@ventanamicro.com wrote:
> > +#endif /* CONFIG_RISCV_SBI */
> 
> The code looks fine, but I can't find the SUSP extension anywhere.  There's
> just hart suspend in
> <https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc>.

Thanks for looking, Palmer. It looks like Conor got you pointed at the
draft spec addition[1]. When the spec addition gets accepted, I'll rebase
and repost this patch without the RFC.

[1] https://github.com/jones-drew/riscv-sbi-doc/commit/0a7ddb1786b0566287efaa6b55321dafecc885ca

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
