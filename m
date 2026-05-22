Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0431CCD5BB3
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 18:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A51BTnbq1bsurSC+MNWXsmp+Cc1+Jy10r/0iunjdCUs=; b=Jp/vs8vHuSG7D4
	0HCd9b4yiD3eppjunI5x4xyu0t9c3RniUanTFZn8PveKgsF3uzKFvJShHngewWEOmMMzTng1RparO
	JwwVF0Vrjd7/ej37bXrKOhSr+J8r8fokSfBlgXkXmxDCLOaELoXy4NuMK0gkcSS2s1GWJqmooaIfA
	xN3Mj3fstIPNquOVkDsyLr8l2UG8iQVsPskQmPFVKLglCvPDOuhXRy6N5pSGx7yKUTTxgGAKWVCkE
	CxxDX8o4yv+6Rzd8YKz20bKkxeKHk3femIuyyI3iPXYOs/t7E6sLaUTvsuSfgU9cv6bKalLGEtOco
	cnErmo2VsLyBiVqywGvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQUvX-0000000BiGm-1Q8A;
	Fri, 22 May 2026 18:48:55 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQUvU-0000000BiG9-0HQ8
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 18:48:54 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso21629385e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 11:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779475730; x=1780080530; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dgG2wYSmCA/XhBo+sOvrK/LdITZZzcYGiSbapkkBFfg=;
        b=MSYihU5jiVyuYFreU5TWdAsHlUMfZ4ZNZ2JZETjCJMnDPx9T2sM6ZbF1TgTMWK1PQn
         2LAGo5exPHjnjBqFmnN9wJ4Jion3g0AVOHCbuoi5i1dNc3BdLOZM0bIOcyoey6D5vnHI
         8nTCb9EOhYvuP2Xn1TpQHUB6KLizB/V36uyjYxsCqVpCHkyponpjFjlMHv5++51n0JIu
         KG3sMCCRj0S9tN2Uny8DJyPV5axbjxDfNX9ocF1GRwZg0LlniPIxFjFH/qBx192Rx6Yz
         /tPHp3WbE8Kucc8jYz1vRRDHShSPLBtzbOn1NI+rlJj6nZyd7yGpcxE/wDU8kngtTNbU
         qKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779475730; x=1780080530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dgG2wYSmCA/XhBo+sOvrK/LdITZZzcYGiSbapkkBFfg=;
        b=JJAZ/sd8i1D2PtniIxBn9ou8TdETvAyeTb/5O1kRViEMAHYcntMs4ZrPeYUwJOvg86
         GS/vGCfrtlGm0vq25znVjZG2bkCS8EY/+EnV5q0aysCbrEeoyBH1h9ugee7skPQ1nLTq
         HrarkdbXjIKJciVXMKkwY+csZSBxypFd3DzdulUTszdAQ5Yb41Agf7UuuAOjGgyzIOg7
         XkRsq7NDii1OVzahtMPK40U1q6IrH4fAihk4KvwIzn6IbIzt/q+r5fegdKYQlhqzlCHn
         ZntqHY+znLoPyLEhk11ZaWFJCCMsukkpZRp95U9zfzAoDarxyYn4dv0N24U9hbyv7nxt
         mEFQ==
X-Forwarded-Encrypted: i=1; AFNElJ8zdgHHyeWiiq3m/5FqPzKvT4nVFR2MqBqMPJw76EIBQ30e7abT/ZZDKkFlsaG3iWIobPHjto665XVCww==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtCcTQfhkN8TSE13SQFXbu1TN7nlZHpQLeuFSQuV/K0VHxfA2y
	aNH4VCzbEjznNXHcjdOlZWPZFv0vqs1SQthubKf8Dlw3NlCo5fJ8TJb4
X-Gm-Gg: Acq92OHRhOWem+NEQ7Cr/vmY3Kq6QbwshQPMYT2kMUJvyKX7FHROVKE0x8itUe+nTdf
	0gtALftnso+0KG1fRqU/Uy+6tMyY6Dervmvn8Y6g/THrr1jEdK9+7Yqe2KCVAK/hHuR5Tujdcg8
	/bzGCgjSH4/SBW5CQzVZajnTcpCvcbNICHC2JevllyQpN6AFmLGHPWrUaIEeJjYg15aPXLb1mjG
	vx+Wgi22ONi5YK8I9fxXLTwBsdRZuQUE7kSh1FNk8hIcPK0YMCjXl7Veco6e2RitJyHWpMxB686
	foM4TOvUtJEgi5Dlbx07sRLf8TEhx46Dvdx/chqlO4jopCnEUF0miT7KDX+tU9HR2Lk8blX3Ifd
	1MVPDdElh/NypwYSo4HIybzex1gXaUjZXxUXo2rF1HgeNAzezj5rtaP3S5iDu1+5hTwS+/P1oBP
	93akphQBYbwoA+wgA+AzpN7r9ujb4=
X-Received: by 2002:a05:600c:a402:b0:490:3f7a:108b with SMTP id 5b1f17b1804b1-490426c5be8mr59368335e9.16.1779475729950;
        Fri, 22 May 2026 11:48:49 -0700 (PDT)
Received: from curiosity ([80.211.22.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6cd151asm5438373f8f.13.2026.05.22.11.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 11:48:49 -0700 (PDT)
Date: Fri, 22 May 2026 21:48:43 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>, Alexandre Ghiti <alex@ghiti.fr>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Mayuresh Chitale <mchitale@gmail.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Sunil V L <sunilvl@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: Re: [PATCH v4 07/12] rvtrace: Add trace ramsink driver
Message-ID: <ahClCwlIMlck-DiQ@curiosity>
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
 <20260429125135.1983498-8-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260429125135.1983498-8-anup.patel@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_114852_123986_59A38B63 
X-CRM114-Status: GOOD (  14.63  )
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

> From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> 
> Add initial implementation of RISC-V trace ramsink driver. The ramsink
> is defined in the RISC-V Trace Control Interface specification.
> 
> Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> ---
>  drivers/hwtracing/rvtrace/Kconfig           |   9 +
>  drivers/hwtracing/rvtrace/Makefile          |   1 +
>  drivers/hwtracing/rvtrace/rvtrace-ramsink.c | 338 ++++++++++++++++++++
>  3 files changed, 348 insertions(+)
>  create mode 100644 drivers/hwtracing/rvtrace/rvtrace-ramsink.c

...

> +static int rvtrace_ramsink_start(struct rvtrace_component *comp)
> +{
> +	int ret;
> +	u32 val;
> +
> +	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val |= BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
> +	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
> +			       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 1,
> +			       comp->pdata->control_poll_timeout_usecs);

IIUC the code fragment above duplicates 'rvtrace_enable_component' from
rvtrace-core.c.

> +	if (ret)
> +		dev_err(&comp->dev, "failed to start ramsink.\n");
> +
> +	return ret;
> +}
> +
> +static int rvtrace_ramsink_stop(struct rvtrace_component *comp)
> +{
> +	int ret;
> +	u32 val;
> +
> +	val = rvtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	val &= ~BIT(RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT);
> +	rvtrace_write32(comp->pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	ret = rvtrace_poll_bit(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET,
> +			       RVTRACE_COMPONENT_CTRL_ENABLE_SHIFT, 0,
> +			       comp->pdata->control_poll_timeout_usecs);


IIUC the code fragment above duplicates 'rvtrace_disable_component' from
rvtrace-core.c.

> +	if (ret) {
> +		dev_err(&comp->dev, "failed to stop ramsink.\n");
> +		return ret;
> +	}
> +
> +	return rvtrace_comp_poll_empty(comp);
> +}

Regards,
Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
