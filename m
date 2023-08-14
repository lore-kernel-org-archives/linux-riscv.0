Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2165DC001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 14:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ya9fke6g8agV/eW3CZELHftTsw5zqc3/kgXP7BqORKU=; b=mt4yyL4lJ4bKLa
	nZhpLfe3EPX5hpAS3p1JSgYPJtIXjxZE5S5XtE66xxqKBDH/lU0q6O8sxf/1QlKrhsbWglZyFu/l7
	YHbIA2pQmvpoQrqdthjPkmdYm1oOSHLdmCRXOFZEO0n2nWOayTgWMPYbTZLzJ7RtdABHpHhO6N0iL
	atIJJpr+5k8nwRin3PWTfRJmo3o8Vmyf8Z04mHggABeKSEyeAPrxbRrq2eC8sz+GRLdlRf+bIM88d
	XC30I7/5o572/5K/RAWUe738M3RIqFaewYTX3qiDXvn9YHrwrXfjSOnEReLTSaY2QDeR9/urI/raG
	5iL9Z8oxg+JU8BUgmBWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVYAx-00HDxd-0F;
	Mon, 14 Aug 2023 14:04:07 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVYAu-00HDwW-25
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 14:04:05 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99bcfe28909so564967666b.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Aug 2023 07:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692021841; x=1692626641;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2tYT70QSADvKey9KGvE0OeVu+4Pc0bll8FUx1XFEc0k=;
        b=Y6/Pg10v/eMAJ47QaGFn8fHG5ZWmsBsXECHzC/cOW+aauVThwHvFr/K/KSf4yl0CkD
         JGdPfT23l03LduO0WcXQMxv59ERjEqiadP3CpXhEk2ncUwGrpfxy0tFmMjlZPZjsIasX
         i2rapg4LnyI/adj354368TE7iCYMfJ0Mw4xpxynT4VAq5A0gXg8SVwKBIGg/V+jKQBtT
         xxpbXk1hPCc3sp2jWTDUG8rnZTg6cQK359rZiyKigeUJ+ESZr5MQgewaDVWfXEi0cKKh
         AcXYnak0fIXCvd7fwm2npk030LuuamPlrkmx6zF4HoCRdrDDwNWmTrVFCiUjfG6/2VDC
         tafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692021841; x=1692626641;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2tYT70QSADvKey9KGvE0OeVu+4Pc0bll8FUx1XFEc0k=;
        b=fZY9Yrh+ZplB6OXRV/k486gkQrwsLH6tXTNZPMTjej9qzh1RJuk8v0d7DsYwBsj8f/
         6HP/S651wWZEzzxE3lWpfdgnfUXR92hwxuiUAT6i3UGtL5kozkqUahFRwapEjHNLNUVd
         Da7y4vET/BquT0lB1/3lgi+8/z+zDNpS6V2244xbiU+ZAqlZC1w6V1xskZbBew9rUO8b
         4N6CfNfGzgHofOatNmaR7COYxz4RIxJjhxdFEqZsukGeBYjvaDts7oovUWjIuE2l5Z5r
         wD53NoX0u5+jVxXdIZMDYz/bfRGaOseEwrW9t4LJPrY9MUO+SeuolMV8g/oZH1973lfa
         DRqQ==
X-Gm-Message-State: AOJu0YyT3O3ihi73nbl1zSiua6/54tfJcwdLzG5U7TbS3aujTSumRBeG
	HZkyPVdEP7iApw7xdLM1zQo=
X-Google-Smtp-Source: AGHT+IFPBeqS62+BAbDxMk76ReppLTfDmZdeYVPiM8FQMd6zx2Hr87kqNLX37RBdrArI04/01vCJzw==
X-Received: by 2002:a17:906:10d7:b0:99d:6dd7:42c2 with SMTP id v23-20020a17090610d700b0099d6dd742c2mr7337754ejv.40.1692021840744;
        Mon, 14 Aug 2023 07:04:00 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id gw4-20020a170906f14400b00993b381f808sm5672731ejb.38.2023.08.14.07.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 07:04:00 -0700 (PDT)
Date: Mon, 14 Aug 2023 16:03:58 +0200
From: Nam Cao <namcaov@gmail.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, charlie@rivosinc.com
Subject: Re: [PATCH] riscv: correct riscv_insn_is_c_jr() and
 riscv_insn_is_c_jalr()
Message-ID: <ZNo0TvIOUIx3GdTm@nam-dell>
References: <20230731183925.152145-1-namcaov@gmail.com>
 <87o7j9g73d.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o7j9g73d.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_070404_681799_472C3599 
X-CRM114-Status: UNSURE (   7.73  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Aug 14, 2023 at 02:07:50PM +0200, Bj=F6rn T=F6pel wrote:
> In the future, add a Fixes-tag for these kind of changes!
> Fixes: ec5f90877516 ("RISC-V: Move riscv_insn_is_* macros into a common h=
eader")
> =

> (No need for a respin, b4 will pick up the Fixes above.)

Thanks! I will keep that in mind in the future.

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
