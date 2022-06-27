Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27163C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 10:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zxmo0bjm1KAlX2joFyVC70eGZPmuBwL80/o7Uha99oM=; b=n5Mny3bxcX2s3D
	jwGDgBvU2jjO2j0NNzJ8ikxhyvlAcQV4RPzv4ixFAndRe6t5ksRMfNJ3LumnxDHJ5so/EBR4LgkXX
	MIolzt87JZcfS5jfl/nehrtIRdwxf6D1nONXih7QbLm0HxDv8STXWleW6rtIYg4mEtlcQNLfVHmls
	jxr04FMidXsy++SsyyfbTyNe+OJ4nARPrSuVjYceRIOmWsGUzjYv40FbWUHtFyGcB+almuYiZD1cB
	5L8VXghFLhnBL4+/yTvr4dNvfLF+hTjnoe5vjnICeIWkyC1CO/QOzCpur94sjvZVWVU/GOgA0b1Fd
	dtGozBjmLADtcGVaWTLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5mPl-000JGO-Gh; Mon, 27 Jun 2022 10:56:21 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5mPY-000JB7-VT; Mon, 27 Jun 2022 10:56:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8205FB810A2;
	Mon, 27 Jun 2022 10:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F39C3411D;
	Mon, 27 Jun 2022 10:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656327366;
	bh=ZP/cwDpw3phVOoc86jYL1gb83zZ+27HL+h+osgRcvO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H55EG3Z5qpRg+niCkCAbsdjZljaH5i0Iys3jHRIkS4UZihJGTv12Ow5HF2f/trV31
	 0vmtg84VUwiFAOt7OJeFogL9fl1yEdv7JRNIBoOJEjKK909iswwYnuxEzPG9iYZLEH
	 GpV2fqXymoh3TN6h8MzsjE5zCO4NZzSjN8rUoG3CpshgRxC9SvLnVrzFd+X+PJW0ad
	 D6Go4Uzfyqsfcx02kIkIAgkGrBQIlh9G05f9QlzNBIgcr6MRZU8BJwGXvPzffAl6yW
	 8cPWtUO3UG9TkJ5RfVlUKCnVnY6FOcmPHxO4eBVIpSG0lC2D2c45ScnY3mUispQCNr
	 dr0bsMA3iFWxg==
Date: Mon, 27 Jun 2022 11:56:00 +0100
From: Will Deacon <will@kernel.org>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
	=?iso-8859-1?Q?Jo=E3o_M=E1rio?= Domingos <joao.mario@tecnico.ulisboa.pt>,
	linux@yadro.com, Nikita Shubin <n.shubin@yadro.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] drivers/perf: riscv_pmu_sbi: perf format
Message-ID: <20220627105559.GE22095@willie-the-truck>
References: <20220624160117.3206-1-nikita.shubin@maquefel.me>
 <20220624160117.3206-2-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220624160117.3206-2-nikita.shubin@maquefel.me>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_035609_198752_97C812C0 
X-CRM114-Status: GOOD (  17.83  )
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

On Fri, Jun 24, 2022 at 07:00:51PM +0300, Nikita Shubin wrote:
> From: Nikita Shubin <n.shubin@yadro.com>
> =

> Update driver to export formatting and event information to sysfs so it
> can be used by the perf user space tools with the syntaxes:
> =

> perf stat -e cpu/event=3D0x05
> perf stat -e cpu/event=3D0x05,firmware=3D0x1/
> =

> 63-bit is used to distinguish hardware events from firmware. Firmware
> events are defined by "RISC-V Supervisor Binary Interface
> Specification".
> =

> perf stat -e cpu/event=3D0x05,firmware=3D0x1/
> =

> is equivalent to
> =

> perf stat -e r8000000000000005
> =

> Inspired-by: Jo=E3o M=E1rio Domingos <joao.mario@tecnico.ulisboa.pt>
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> Link: https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sb=
i.adoc
> ---
>  drivers/perf/riscv_pmu_sbi.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> =

> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index dca3537a8dcc..2b5861a10d8e 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -21,6 +21,25 @@
>  #include <asm/sbi.h>
>  #include <asm/hwcap.h>
>  =

> +PMU_FORMAT_ATTR(event, "config:0-62");
> +PMU_FORMAT_ATTR(firmware, "config:63-63");

Usually single-bit fields omit the upper bound, so this would be simply
"config:63".

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
