Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09CEC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 11:33:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1980D64F6A
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 11:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1980D64F6A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=20lVVQHMQzm748VrUsdzpD03ikMpKivJeVKLARp1Zog=; b=OsreyamqcGIqYHBfud9L4TIhI
	p1rYhIKYDZ9tpLBk/wTFRRGGE3zAzbLwq+08y+iahGDZ0wF/JVh7GADlrXEwYZs8qhpZTHVzS07DC
	Q9vbHx0I7t7DmmlCz9e3TKcR3EBoEQyUfTKsdgB3XJyLFCNDeb5bcnUTVv1s6CwKsfbIZeAJSvwIF
	Jjvn2ltLETpAle0dV8HKnETeI1ppbJnlrdjWMypwXFMY9LFKDBBZqxs0qAUXD9+0tGE9xC2ZPwn+3
	66JMVJTMwp3v/Iyd9hfYfGUNJWy/Wr7SdSUGbDGXpQZFnGwX4yfa1FtOrMk9dZE+A9OudDHm9iukY
	JwsmucCFQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMUQR-0031wo-Dk; Wed, 17 Mar 2021 11:33:19 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMUQL-0031vX-Sm
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 11:33:16 +0000
Received: by mail-wr1-x42a.google.com with SMTP id v11so1447314wro.7
 for <linux-riscv@lists.infradead.org>; Wed, 17 Mar 2021 04:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o85Z/knH6JvZ9dTgiKMthI4Cgpv55g11sGfQK4L0z+A=;
 b=vE8yBhU/l93+UweXELj1T1qBVQoFhJ/0GdUKXYJYCq7OCz6kpI8oWUS+m3LGeAx6hN
 15EqGRVDK0/yST3Ul3LqnTjyHcEBB8ByQ35piFJKM2yxjSFUD/yrIrfLlyO/p4zUlCg+
 rx3pak6rcKTyVIT0eeiBSCfIR/zOMzluRRSk433FhdKhiaEwI+INHSy1PRjy4tcuHYbV
 UDuxzO27bsv4yUb1jGSGCLc1bB7s1jYgbE/rTTKYv41k34r59ma7y1brqa9uT3/fe3Xs
 hABkgo1mZXolifknCYB7oV20xmdERP5Q4W/9ia9LMG3lshKUXP8L6cVbp/LjqNPVy+k7
 WO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o85Z/knH6JvZ9dTgiKMthI4Cgpv55g11sGfQK4L0z+A=;
 b=S7Is7flex8TUL95w/XSpk3C45mJc3Z7J8PTQvOGi5gdIr8ds6OCKwNe6TgW2pPjuVi
 QZe7S+MaAGlPm35txliv53K8SM99hJjqnbwpVt0KMMRZJE2gFNs4OIBSbdzMibfn7krh
 +n0uf+LB/sThQZ5m4aldhdm013gWtclrF6YtAMgbqzPDNlUVdW4RSXWrhXeEa1UDCj9l
 syyqJ064M/qoIDMtKBNC4UbBpjra9z/U8TBsSlmT0jiofzDLfecDJrSEtfmZv3+QUM7N
 K12wl7RbH+Oixjq5YCxklWB3ABPGeKlOUTF0mKXFJB/iON+ExZmKCSxfX0qjqtRu8KFJ
 CYFQ==
X-Gm-Message-State: AOAM530ODCYdPO1MGbfdPBy94gKA79fPoID0bn1xIrFy3d/8i1B2A+Gy
 eR5jjHOvGHsqqb6VnchUAVTPNfGiUgK3dR7gy1IJpw==
X-Google-Smtp-Source: ABdhPJzGY27HxkmCjxKxH/jqPTz1LjXQT7yjQlvrKI4wAV8jHMoEK34f7Zr1SMHiNp7WfPVCBdHOJ/5Ul+WGKY4fFA8=
X-Received: by 2002:a05:6000:250:: with SMTP id
 m16mr4031909wrz.325.1615980793230; 
 Wed, 17 Mar 2021 04:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <1615973613-22364-1-git-send-email-vincent.chen@sifive.com>
 <1615973613-22364-2-git-send-email-vincent.chen@sifive.com>
In-Reply-To: <1615973613-22364-2-git-send-email-vincent.chen@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 17 Mar 2021 17:02:58 +0530
Message-ID: <CAAhSdy0QKHgPhuDJTUhuNnuRKbtrDUnG01cJfY3DY1tnY0D9fA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] riscv: Add 3 SBI wrapper functions to get cpu
 manufacturer information
To: Vincent Chen <vincent.chen@sifive.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Frank.Zhao@starfivetech.com, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Guo Ren <guoren@kernel.org>, 
 Alan Kao <alankao@andestech.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 ruinland@andestech.com, 
 David Abdurachmanov <david.abdurachmanov@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_113314_029809_D278AAD8 
X-CRM114-Status: GOOD (  15.34  )
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

On Wed, Mar 17, 2021 at 3:04 PM Vincent Chen <vincent.chen@sifive.com> wrote:
>
> Add 3 wrapper functions to get vendor id, architecture id and implement id
> from M-mode
>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/sbi.h |  3 +++
>  arch/riscv/kernel/sbi.c      | 15 +++++++++++++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 99895d9c3bdd..dd2329962ceb 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -97,6 +97,9 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>
>  void sbi_console_putchar(int ch);
>  int sbi_console_getchar(void);
> +long sbi_get_mvendorid(void);
> +long sbi_get_marchid(void);
> +long sbi_get_mimpid(void);
>  void sbi_set_timer(uint64_t stime_value);
>  void sbi_shutdown(void);
>  void sbi_clear_ipi(void);
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index f4a7db3d309e..ead7e3fec104 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -547,6 +547,21 @@ static inline long sbi_get_firmware_version(void)
>         return __sbi_base_ecall(SBI_EXT_BASE_GET_IMP_VERSION);
>  }
>
> +long sbi_get_mvendorid(void)
> +{
> +       return __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
> +}
> +
> +long sbi_get_marchid(void)
> +{
> +       return __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);
> +}
> +
> +long sbi_get_mimpid(void)
> +{
> +       return __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);
> +}
> +
>  static void sbi_send_cpumask_ipi(const struct cpumask *target)
>  {
>         struct cpumask hartid_mask;
> --
> 2.7.4
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
