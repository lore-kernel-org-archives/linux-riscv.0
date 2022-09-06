Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FAAECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 01:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9Lyk9RiZrvw6xi/eWvw5HTWYiAKn4rs8G44P7dsyJQ=; b=ktyr1bv/rnyacm
	llMC2Ituio7MpEYzt4GXqWOLBsCVEJM3DFIcsFq8Fpe0Dm7ZqeKU3mzHEMrkbupO5IQI+1Yygq2Tk
	yOdQds89RaFE9crp3F3AtaOHdy5uTB46pYaGRTFhQQs45T4f9JrRjOjXCSuu4kMBONS7ODifQg0W1
	9J+MR5+O47fwMFyBHYuMOvwupcPe2FzPIlb7njF7+EdAKCrm5e38AWiZ69ofZHaCPJl/tRG2L8uAf
	vJADLjHrHmC8YFG3mcknMZanRsV4Mu/XwaGe0+47KVHrqmzmFGQlZxxFV0GweYRhNSNenANES8Y95
	Wx09NuPxmbnl29OqVh/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVNTZ-001H9I-3Q; Tue, 06 Sep 2022 01:34:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVNTW-001H5D-Bp
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 01:34:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EC1F2B815C9
	for <linux-riscv@lists.infradead.org>; Tue,  6 Sep 2022 01:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8347C43470
	for <linux-riscv@lists.infradead.org>; Tue,  6 Sep 2022 01:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662428039;
	bh=7jdjCsTQ10QeWX2F6xU7ujVBgxg1gpahwxgqLaOihhc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qPJ6fecU60A87EOZ1izMltMufCNClQrCLfKIt+tunUt9d478rc5W2mefgXN0BcFf7
	 IcFbO5g1d/Z9PO6TVTRic9QYONWc4RFIEQsszkQK5dfWOULEezZOx0bsS3TzLracKO
	 2VC/JdgvTJPb3a3xAR6hjYRhHANAky3Gw6zW0PNTIzU1gwyY8a0EdgYrIFUiDNC7sJ
	 kYScAK6Z2DdwKZpEJaU+vJJwsDDRHs8KAyA/BMGwlY1qakbgBizVnbeCMby9QYV7K2
	 t6jw5bZYuOoosITjL4ROaEOQ93m041oihkBbursKrrw9AQdmxmSHKhbxcESiYAkqM/
	 3wf3KGnuav1OQ==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-11f34610d4aso24891810fac.9
        for <linux-riscv@lists.infradead.org>; Mon, 05 Sep 2022 18:33:59 -0700 (PDT)
X-Gm-Message-State: ACgBeo1pTPKJ7ByBwEzZFt+AyGxFTRc1hO2SkY8E6CvEYGY03tgioSWR
	94HV0S1mLTPoZkbKjIyj6NjGRM3tC0BHQXAKzYw=
X-Google-Smtp-Source: AA6agR6T3PqL9F1CwsN79Krt3sajHmoioNBxuPXmIjJBV3FNIIHOOVC+gpKHm5eHaqUpZS7pDoC/tFojOR2E8gO7IhI=
X-Received: by 2002:a05:6808:150f:b0:343:3202:91cf with SMTP id
 u15-20020a056808150f00b00343320291cfmr8674404oiw.112.1662428038857; Mon, 05
 Sep 2022 18:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220905111027.2463297-1-heiko@sntech.de> <20220905111027.2463297-6-heiko@sntech.de>
In-Reply-To: <20220905111027.2463297-6-heiko@sntech.de>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 6 Sep 2022 09:33:45 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRB6Rq=MbFDuoEeU4-0B1N-JVjuxrHFK6YDg59ya2R9GQ@mail.gmail.com>
Message-ID: <CAJF2gTRB6Rq=MbFDuoEeU4-0B1N-JVjuxrHFK6YDg59ya2R9GQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] riscv: check for kernel config option in t-head
 memory types errata
To: Heiko Stuebner <heiko@sntech.de>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	apatel@ventanamicro.com, atishp@rivosinc.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_183402_575015_A52EC03C 
X-CRM114-Status: GOOD (  17.56  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Mon, Sep 5, 2022 at 7:10 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> The t-head variant of page-based memory types should also check first
> for the enabled kernel config option.
>
> Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/errata/thead/errata.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index a6f4bd8ccf3f..902e12452821 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -17,6 +17,9 @@
>  static bool errata_probe_pbmt(unsigned int stage,
>                               unsigned long arch_id, unsigned long impid)
>  {
> +       if (!IS_ENABLED(CONFIG_ERRATA_THEAD_PBMT))
> +               return false;
> +
>         if (arch_id != 0 || impid != 0)
>                 return false;
>
> --
> 2.35.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
