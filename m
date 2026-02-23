Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9209E98E15
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Feb 2026 10:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5b70Pcurr3InYPO3Q3YIsH/07SqGBT2lMV+D7FXhdhU=; b=GN5nRY26xr3mCvL5I34dkCMoWO
	9vL/kw+HnIjifNCMKNuAHCytp5uFHxnH0rVIiM3Wpet+DUiavr57AsKz5HJzRkRkVWUgiPdgliN0t
	MXe0Jm+v20sqQ5RMmEIVgp1bkMYqGgURqlGq5sI3wbm2/IOen+JdLB0AYR0q+ajO0aNNAhx3zBGzA
	36bIT5AUQg3u7rydcwDuNU8wblWqDJP4qilGk9jmtjpYmicjTdXXZn++Yd979hJ3sqL7cOyM5vmyQ
	Ifg8CY9ORC6w2vFJ9aMhUu2U9vGZm8NHy9+dPoxIam2AC0w2Lx0QqbLMm6S1E3Yr7NuCgjVfsl/Xa
	YettejzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuT84-000000003Yy-3VOv;
	Mon, 23 Feb 2026 10:25:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuT82-000000003Y6-1jwn
	for linux-riscv@lists.infradead.org;
	Mon, 23 Feb 2026 10:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1771842326; x=1803378326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lYJQ0s04uuY3Wl35fAWJ2aUlbd1T4PEXe2Xyn+eVL5w=;
  b=N4Hse5t/vg52WS8+a9mMlMxx2YYWQNNS/btRUgQPbnrQSmxtUnKC0K7w
   px83BtLsYOZqngT+kqZcP0RBZNlbA2Y04rR7z3lADHBNH4CyaHxTAtQ1z
   JBnN3iRs2zpQbRaUsyzet4AkhkWD4aSSqXb6nMJGMk3JEWf79X3wVUF7f
   bMNy+Q2PuiRkbhvJ48tOsgPGZinj1wzCwHi3O3swMGQ4til8mExtnRspe
   RNBLw7R4TKd+eZn95m4CNcd+5bvN4BO+A7Xhi4DHlLleGDgEASIeR+z8k
   1ckgtC/bRmwmOrl5h5u1lUYOMihz0CgjFBqXg4w4+JtLPDE/R2fe1QTiG
   Q==;
X-CSE-ConnectionGUID: dcasylaqRiGd7fkj9WTCcw==
X-CSE-MsgGUID: rXdik328QsqbLxir4O0EvQ==
X-IronPort-AV: E=Sophos;i="6.21,306,1763449200"; 
   d="asc'?scan'208";a="220994822"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Feb 2026 03:25:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 23 Feb 2026 03:24:46 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Mon, 23 Feb 2026 03:24:45 -0700
Date: Mon, 23 Feb 2026 10:24:20 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <shuah@kernel.org>
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware
 break/watchpoints
Message-ID: <20260223-mouth-plated-50294c7a6ac0@wendy>
References: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
 <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_022526_523040_A6004818 
X-CRM114-Status: GOOD (  14.13  )
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
Content-Type: multipart/mixed; boundary="===============6011065177545139836=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6011065177545139836==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c5AaKpA2g6pFDo65"
Content-Disposition: inline

--c5AaKpA2g6pFDo65
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 23, 2026 at 10:19:17AM +0530, Himanshu Chauhan wrote:
> +static void init_sbi_dbtr(void)
> +{
> +	unsigned long tdata1;
> +	struct sbiret ret;
> +
> +	if (sbi_probe_extension(SBI_EXT_DBTR) <= 0) {
> +		pr_warn("%s: SBI_EXT_DBTR is not supported\n", __func__);

This is going to run an all systems, right? A pr_warn() seems
inappropriate, given that not supporting this extension isn't a problem.
If you want to produce warnings, only do it for < 0 return values and
maybe print the actual error code too?

> +		dbtr_total_num = 0;
> +		goto done;
> +	}
> +
> +	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
> +			0, 0, 0, 0, 0, 0);
> +	if (ret.error) {
> +		pr_warn("%s: Failed to detect triggers\n", __func__);
> +		dbtr_total_num = 0;
> +		goto done;
> +	}
> +
> +	tdata1 = 0;
> +	tdata1 = RV_DBTR_SET_TDATA1_TYPE(tdata1, RV_DBTR_TRIG_MCONTROL6);
> +
> +	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
> +			tdata1, 0, 0, 0, 0, 0);
> +	if (ret.error) {
> +		pr_warn("%s: failed to detect mcontrol6 triggers\n", __func__);
> +	} else if (!ret.value) {
> +		pr_warn("%s: type 6 triggers not available\n", __func__);
> +	} else {
> +		dbtr_total_num = ret.value;
> +		dbtr_type = RV_DBTR_TRIG_MCONTROL6;
> +		pr_warn("%s: mcontrol6 trigger available.\n", __func__);
> +		goto done;
> +	}
> +
> +	/* fallback to type 2 triggers if type 6 is not available */
> +
> +	tdata1 = 0;
> +	tdata1 = RV_DBTR_SET_TDATA1_TYPE(tdata1, RV_DBTR_TRIG_MCONTROL);
> +
> +	ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
> +			tdata1, 0, 0, 0, 0, 0);
> +	if (ret.error) {
> +		pr_warn("%s: failed to detect mcontrol triggers\n", __func__);
> +	} else if (!ret.value) {
> +		pr_warn("%s: type 2 triggers not available\n", __func__);
> +	} else {
> +		dbtr_total_num = ret.value;
> +		dbtr_type = RV_DBTR_TRIG_MCONTROL;
> +		goto done;
> +	}
> +
> +done:
> +	dbtr_init = 1;
> +}

> +
> +void hw_breakpoint_pmu_read(struct perf_event *bp)
> +{
> +	/* TODO */
> +}
> +
> +void clear_ptrace_hw_breakpoint(struct task_struct *tsk)
> +{
> +	/* TODO */
> +}
> +
> +void flush_ptrace_hw_breakpoint(struct task_struct *tsk)
> +{
> +	/* TODO */
> +}

This isn't an RFC, why does it have TODOs?

--c5AaKpA2g6pFDo65
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZwq1AAKCRB4tDGHoIJi
0upiAQCLtgcVhN1YHI6iwZHUnWvpnnH9plmo8jVy34MtpsimigEA2HOgmhtAyLTZ
ozQGgdUIOu8Qqqlb8Xg4zax29nNYqA0=
=jG3k
-----END PGP SIGNATURE-----

--c5AaKpA2g6pFDo65--


--===============6011065177545139836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6011065177545139836==--

