Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A267C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:54:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38F4361BFE
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38F4361BFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tTRtVCsA6CY026d3DZjhrtZ5s9G5CnuCAp2IyOcp2Bo=; b=0iU5bUPTIpRocF
	mQUGiNPZmOn24oizobVauLfiVSWi4Or0ejmjbfmsqAKFJZvr236xFYcUmCqsEVHXR2i7wSulgilKr
	mQ2SHwnEcA83hbqm9ckPPW3Q7StUM7+lFj0nhS5gDRuHJmGtxgQG3HWaPlBGPuz2rDlTg2UjhWwk1
	IJZel6sgDtN1Ek0y75P9oQa8al7raVLSsFb+GK4j9U3rP8/7YZJlJTY41i7fPA1LNhV7ZntN2lzm4
	fH6ou5UUsvzRNuIp9BCpl95r0do6K/hwqk3iGa/xnKFqwLM2RLnDprZFTlZbrCJW75Fskkc0Pv9Ds
	iN/F2hD60DGQK1vJ7Z9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn0mu-002Dmz-If; Tue, 16 Nov 2021 15:54:24 +0000
Received: from mail-wr1-f44.google.com ([209.85.221.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn0mq-002DkZ-Bc
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 15:54:22 +0000
Received: by mail-wr1-f44.google.com with SMTP id a9so12305970wrr.8
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 07:54:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ajChtWUYqMXdMc87KjLJYS2NB94HvVKjmpMU7GdebZw=;
 b=kLR6QN9AyfXWKl0VDT/mBa4Xs05Wr/1/7IhcLtk78emhf5DCcy7A9m21BdVLuVKSrs
 KTWsUo9y/i84SiYyA0YnVkbZdoEuni/CncXi/zzJzEyCOCUxOZCRIUD4YdknlUA0Fk8h
 YPLXRrlMDp3HSDCvLMY4ohkP/HbYykPIBfDRHH7FU4lI2Ffr3nQn+TgEnK8pmnFZDnpV
 IYMqT7dGydyFeDUs4BJTkEDOLy0y9VHGx9jkJS5BeREOO09XzILFsm8tmO7yPitBDZuR
 SujIm9m7JIdGKus2K+C3P8OVRHTQNq3EVGcMRS4guDxGluXA7lB0ifb+F1hNOhrsh4O1
 iMhg==
X-Gm-Message-State: AOAM533zsXtxuEHlyy8bCHP6ozXORPtBQpMoR+5XIG4n72ve6+VwhXGl
 SwDIsC5pdVwoWM8c2QJPtow=
X-Google-Smtp-Source: ABdhPJwnIfVODlfJxMGZUteKR8EUcT6dR+G+Y1HLUfn6QDncxk3DZxvyqOGmjIy5xH/vcs33GCJySg==
X-Received: by 2002:a5d:628f:: with SMTP id k15mr10805248wru.363.1637078058033; 
 Tue, 16 Nov 2021 07:54:18 -0800 (PST)
Received: from joaomariovmubuntu ([2001:8a0:fa2d:4500:215:5dff:fe40:101])
 by smtp.gmail.com with ESMTPSA id w7sm17949012wru.51.2021.11.16.07.54.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Nov 2021 07:54:17 -0800 (PST)
Date: Tue, 16 Nov 2021 15:54:15 +0000
From: =?iso-8859-1?Q?Jo=E3o_M=E1rio?= Domingos <joao.mario@tecnico.ulisboa.pt>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 atish.patra@wdc.com, anup.patel@wdc.com, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/4] RISC-V: Create unique identification for SoC PMU
Message-ID: <20211116155414.GA17838@joaomariovmubuntu>
References: <20211109102555.16381-1-joao.mario@tecnico.ulisboa.pt>
 <20211109102555.16381-2-joao.mario@tecnico.ulisboa.pt>
 <20211115112316.6158e1ff@redslave.neermore.group>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211115112316.6158e1ff@redslave.neermore.group>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_075420_467351_92118745 
X-CRM114-Status: GOOD (  30.33  )
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

On Mon, Nov 15, 2021 at 11:23:16AM +0300, Nikita Shubin wrote:
> Hello M=E1rio.
> =

> On Tue,  9 Nov 2021 10:25:52 +0000
> Jo=E3o M=E1rio Domingos <joao.mario@tecnico.ulisboa.pt> wrote:
> =

> > The SBI PMU platform driver did not provide any identification for
> > perf events matching. This patch introduces a new sysfs file inside
> > the platform device (soc:pmu/id) for pmu identification.
> > =

> > The identification is a 64-bit value generated as:
> > [63-32]: mvendorid;
> > [31]: marchid[MSB];
> > [30-16]: marchid[15-0];
> > [15-0]: mimpid[15MSBs];
> > =

> > The CSRs are detailed in the RISC-V privileged spec [1].
> > The marchid is split in MSB + 15LSBs, due to the MSB being used for
> > open-source architecture identification.
> > =

> =

> This patch doesn't compile and also has a warning:
Corrected in v2.
> ```
> drivers/perf/riscv_pmu_sbi.c:239:43: error: 'pmu_sbi_id_show'
> undeclared here (not in a function)
>   239 | static DEVICE_ATTR(id, S_IRUGO | S_IWUSR, pmu_sbi_id_show, 0);
>       |                                           ^~~~~~~~~~~~~~~
> include/linux/sysfs.h:104:19: note: in definition of macro '__ATTR'
>   104 |         .show   =3D _show,
>         \
>       |                   ^~~~~
> drivers/perf/riscv_pmu_sbi.c:239:8: note: in expansion of macro
> 'DEVICE_ATTR'
>   239 | static DEVICE_ATTR(id, S_IRUGO | S_IWUSR, pmu_sbi_id_show, 0);
>       |        ^~~~~~~~~~~
> drivers/perf/riscv_pmu_sbi.c: In function 'pmu_sbi_id_show':
> drivers/perf/riscv_pmu_sbi.c:675:29: warning: format '%lx' expects
> argument of type 'long unsigned int', =

> but argument 3 has type 'uint64_t' {aka 'long long unsigned int'}
> [-Wformat=3D]
>   675 |     len =3D sprintf(buf, "0x%lx\n", pmu_sbi_get_pmu_id());
>       |                           ~~^     ~~~~~~~~~~~~~~~~~~~~
>       |                             |     |
>       |                             |     uint64_t {aka long long
> unsigned int}
>       |                             long unsigned int
>       |                           %llx
> ```
> =

> May be you wanted to place DEVICE_ATTR after pmu_sbi_id_show function
> declaration ?
> =

> Please check with a clean build.
Recompiled everything with a clean build and the necessary changes are
reflected in version 2 of the series.
If you have the time, please check again.
> =

> Yours,
> Nikita Shubin
> =

> > [1] https://github.com/riscv/riscv-isa-manual
> > =

> > Signed-off-by: Jo=E3o M=E1rio Domingos <joao.mario@tecnico.ulisboa.pt>
> > ---
> >  arch/riscv/kernel/sbi.c      |  3 +++
> >  drivers/perf/riscv_pmu_sbi.c | 46
> > ++++++++++++++++++++++++++++++++++++ 2 files changed, 49 insertions(+)
> > =

> > diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> > index 7402a417f38e..4e4f5671b864 100644
> > --- a/arch/riscv/kernel/sbi.c
> > +++ b/arch/riscv/kernel/sbi.c
> > @@ -551,16 +551,19 @@ long sbi_get_mvendorid(void)
> >  {
> >  	return __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
> >  }
> > +EXPORT_SYMBOL(sbi_get_mvendorid);
> >  =

> >  long sbi_get_marchid(void)
> >  {
> >  	return __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);
> >  }
> > +EXPORT_SYMBOL(sbi_get_marchid);
> >  =

> >  long sbi_get_mimpid(void)
> >  {
> >  	return __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);
> >  }
> > +EXPORT_SYMBOL(sbi_get_mimpid);
> >  =

> >  static void sbi_send_cpumask_ipi(const struct cpumask *target)
> >  {
> > diff --git a/drivers/perf/riscv_pmu_sbi.c
> > b/drivers/perf/riscv_pmu_sbi.c index 7a68dfa89f6f..f913d8ddfe73 100644
> > --- a/drivers/perf/riscv_pmu_sbi.c
> > +++ b/drivers/perf/riscv_pmu_sbi.c
> > @@ -236,6 +236,15 @@ static const struct pmu_event_data
> > pmu_cache_event_map[PERF_COUNT_HW_CACHE_MAX] },
> >  };
> >  =

> > +static DEVICE_ATTR(id, S_IRUGO | S_IWUSR, pmu_sbi_id_show, 0);
> > +
> > +static struct attribute *pmu_sbi_attrs[] =3D {
> > +    &dev_attr_id.attr,
> > +    NULL
> > +};
> > +
> > +ATTRIBUTE_GROUPS(pmu_sbi);
> > +
> >  static int pmu_sbi_ctr_get_width(int idx)
> >  {
> >  	return pmu_ctr_list[idx].width;
> > @@ -642,6 +651,36 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu
> > *pmu, struct platform_device *pde return 0;
> >  }
> >  =

> > +static uint64_t pmu_sbi_get_pmu_id(void)
> > +{
> > +	union sbi_pmu_id {
> > +		uint64_t value;
> > +		struct {
> > +			uint16_t imp:16;
> > +			uint16_t arch:16;
> > +			uint32_t vendor:32;
> > +		};
> > +	}pmuid;
> > +
> > +	pmuid.value =3D 0;
> > +	pmuid.vendor =3D (uint32_t) sbi_get_mvendorid();
> > +	pmuid.arch =3D (sbi_get_marchid() >> (63 - 15) & (1 << 15)) |
> > ( sbi_get_marchid() & 0x7FFF );
> > +	pmuid.imp =3D (sbi_get_mimpid() >> 16);
> > +
> > +	return pmuid.value;
> > +}
> > +
> > +static ssize_t pmu_sbi_id_show(struct device *dev,
> > +        struct device_attribute *attr, char *buf)
> > +{
> > +    int len;
> > +    len =3D sprintf(buf, "0x%lx\n", pmu_sbi_get_pmu_id());
> > +    if (len <=3D 0)
> > +        dev_err(dev, "mydrv: Invalid sprintf len: %dn", len);
> > +
> > +    return len;
> > +}
> > +
> >  static int pmu_sbi_device_probe(struct platform_device *pdev)
> >  {
> >  	struct riscv_pmu *pmu =3D NULL;
> > @@ -680,6 +719,13 @@ static int pmu_sbi_device_probe(struct
> > platform_device *pdev) pmu->ctr_clear_idx =3D pmu_sbi_ctr_clear_idx;
> >  	pmu->ctr_read =3D pmu_sbi_ctr_read;
> >  =

> > +	ret =3D sysfs_create_group(&pdev->dev.kobj, &pmu_sbi_group);
> > +	if (ret) {
> > +        dev_err(&pdev->dev, "sysfs creation failed\n");
> > +        return ret;
> > +    }
> > +	pdev->dev.groups =3D pmu_sbi_groups;
> > +
> >  	ret =3D cpuhp_state_add_instance(CPUHP_AP_PERF_RISCV_STARTING,
> > &pmu->node); if (ret)
> >  		return ret;
> =

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
