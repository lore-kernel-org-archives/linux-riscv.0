Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5827FC71136
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 19:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sw9d44lnsJL77bXkMTo9FPMzRE0sUQ9OkNdTVTkfyQw=; b=Mikfw/a8sGq7ER
	uDX/iobBh1USdkgRI1tAqPOiRXg3XembSkRO9y9O998290K59RIOxLdxcP2CpMA4perkIXXZIoqIC
	f8CGsK3LBaG8JItLU5LDHfb/v17VAOoD4PpFVyl3w6VNPEGTInHOeja9uAXh0q8Al14vYwIibmmrG
	y+DuhKcyA1F9F/m97IV9OG1xMjMskvB/CH5q56ZHCCzCVB8y4IY0o3ee9vcRy6LrVuRAHCJLrDU9m
	F56ZP2+TnTy/3IGHMExUwzTCgcVWruodGCpPh6HNuDrEPGV4lhAFm/vWOQ/fBthsGhWLkYeTzdUrf
	Cp4ZMcnwazZyz7l9d+8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRcEx-00000008H5W-1moJ;
	Tue, 17 Jun 2025 19:45:03 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRcDA-00000008Gn6-3oUT
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 19:43:21 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250617194308euoutp01ebfd378fca9b65d566e95e60ba6b8d3b~J6-nHIjL62516125161euoutp01U
	for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 19:43:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250617194308euoutp01ebfd378fca9b65d566e95e60ba6b8d3b~J6-nHIjL62516125161euoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750189388;
	bh=SsrrapZlggFpVYw95Drc6h8mJo8KmYhpbhG7VYywjIs=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=tQn+1aMbwyFepAeZyTjCE0hzZXQjkbcCqJBGARftZbkUFKJLWTc9EfdDMG3TezNAh
	 DIlbOcm9eVbr72Cc5FNc0HMpIvgf9sldMIsyFi1JfXTsCWsUDcCuEV/qJQQp0PfA/q
	 NJT7rOLr+MUFVmvLKM0BTaZbJfXq8aja9MxXgRbc=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250617194306eucas1p118ec57136b8265b7e13aeb1ea93a14b7~J6-l2QnM52077420774eucas1p1s;
	Tue, 17 Jun 2025 19:43:06 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250617194305eusmtip14ca5682a8b9fab2b3547be7105427287~J6-kraHC01904619046eusmtip1_;
	Tue, 17 Jun 2025 19:43:05 +0000 (GMT)
Message-ID: <98d6b8e5-4694-44df-9ba0-33e6c00d8183@samsung.com>
Date: Tue, 17 Jun 2025 21:43:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] pwm: Add Rust driver for T-HEAD TH1520 SoC
To: Danilo Krummrich <dakr@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
	Gross <tmgross@umich.edu>, Drew Fustini <drew@pdp7.com>, Guo Ren
	<guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
	Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
	Ghiti <alex@ghiti.fr>, Marek Szyprowski <m.szyprowski@samsung.com>, Benno
	Lossin <lossin@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <aFF7qqlexxh540FW@pollux>
X-CMS-MailID: 20250617194306eucas1p118ec57136b8265b7e13aeb1ea93a14b7
X-Msg-Generator: CA
X-RootMTR: 20250617140839eucas1p2d13775f8e6d34a516e93d3b426d5fb16
X-EPHeader: CA
X-CMS-RootMailID: 20250617140839eucas1p2d13775f8e6d34a516e93d3b426d5fb16
References: <20250617-rust-next-pwm-working-fan-for-sending-v3-0-1cca847c6f9f@samsung.com>
	<CGME20250617140839eucas1p2d13775f8e6d34a516e93d3b426d5fb16@eucas1p2.samsung.com>
	<20250617-rust-next-pwm-working-fan-for-sending-v3-4-1cca847c6f9f@samsung.com>
	<aFF7qqlexxh540FW@pollux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_124313_559571_0B1B8DDB 
X-CRM114-Status: GOOD (  21.21  )
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



On 6/17/25 16:28, Danilo Krummrich wrote:
> On Tue, Jun 17, 2025 at 04:07:27PM +0200, Michal Wilczynski wrote:
>> +    fn write_waveform(
>> +        chip: &mut pwm::Chip,
>> +        pwm: &mut pwm::Device,
> 
> I think you can't hand out mutable references here. This would allow things like
> mem::swap(), which I think are not valid on those structures.
> 
>> +        wfhw: &Self::WfHw,
>> +        parent_dev: &Device<Bound>,
>> +    ) -> Result {
>> +        let data: &Self = chip.drvdata().ok_or(EINVAL)?;
>> +        let hwpwm = pwm.hwpwm();
>> +        let iomem_guard = data.iomem.access(parent_dev)?;
> 
> Technically, this isn't a guard, hence would't call it that way.
> 
>> +        let iomap = iomem_guard.deref();
>> +        let was_enabled = pwm.state().enabled();
>> +
>> +        if !wfhw.enabled {
>> +            if was_enabled {
>> +                iomap.try_write32(wfhw.ctrl_val, th1520_pwm_ctrl(hwpwm))?;
>> +                iomap.try_write32(0, th1520_pwm_fp(hwpwm))?;
>> +                iomap.try_write32(wfhw.ctrl_val | PWM_CFG_UPDATE, th1520_pwm_ctrl(hwpwm))?;
>> +            }
>> +            return Ok(());
>> +        }
>> +
>> +        iomap.try_write32(wfhw.ctrl_val, th1520_pwm_ctrl(hwpwm))?;
>> +        iomap.try_write32(wfhw.period_cycles, th1520_pwm_per(hwpwm))?;
>> +        iomap.try_write32(wfhw.duty_cycles, th1520_pwm_fp(hwpwm))?;
>> +        iomap.try_write32(wfhw.ctrl_val | PWM_CFG_UPDATE, th1520_pwm_ctrl(hwpwm))?;
> 
> None of the offsets are known at compile time? :(

Sadly they are computed based on runtime parameter hwpwm, so Rust can't
guarantee correctness during compilation :-(.

Thank you for your other feedback, appreciate it !

> 
>> +
>> +        // The `PWM_START` bit must be written in a separate, final transaction, and
>> +        // only when enabling the channel from a disabled state.
>> +        if !was_enabled {
>> +            iomap.try_write32(wfhw.ctrl_val | PWM_START, th1520_pwm_ctrl(hwpwm))?;
>> +        }
>> +
>> +        dev_dbg!(
>> +            chip.device(),
>> +            "PWM-{}: Wrote (per: {}, duty: {})",
>> +            hwpwm,
>> +            wfhw.period_cycles,
>> +            wfhw.duty_cycles,
>> +        );
>> +
>> +        Ok(())
>> +    }
>> +}
> 
> <snip>
> 
>> +impl platform::Driver for Th1520PwmPlatformDriver {
>> +    type IdInfo = ();
>> +    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
>> +
>> +    fn probe(
>> +        pdev: &platform::Device<Core>,
>> +        _id_info: Option<&Self::IdInfo>,
>> +    ) -> Result<Pin<KBox<Self>>> {
>> +        let dev = pdev.as_ref();
>> +        let resource = pdev.resource(0).ok_or(ENODEV)?;
>> +        let iomem = pdev.ioremap_resource_sized::<TH1520_PWM_REG_SIZE>(resource)?;
>> +        let clk = Clk::get(pdev.as_ref(), None)?;
>> +
>> +        clk.prepare_enable()?;
>> +
>> +        // TODO: Get exclusive ownership of the clock to prevent rate changes.
>> +        // The Rust equivalent of `clk_rate_exclusive_get()` is not yet available.
>> +        // This should be updated once it is implemented.
>> +        let rate_hz = clk.rate().as_hz();
>> +        if rate_hz == 0 {
>> +            dev_err!(dev, "Clock rate is zero\n");
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        if rate_hz > time::NSEC_PER_SEC as usize {
>> +            dev_err!(
>> +                dev,
>> +                "Clock rate {} Hz is too high, not supported.\n",
>> +                rate_hz
>> +            );
>> +            return Err(ERANGE);
>> +        }
>> +
>> +        let chip = pwm::Chip::new(dev, MAX_PWM_NUM, 0)?;
>> +
>> +        let drvdata = KBox::new(Th1520PwmDriverData { iomem, clk }, GFP_KERNEL)?;
>> +        chip.set_drvdata(drvdata);
>> +
>> +        let registration = pwm::Registration::new(chip, &TH1520_PWM_OPS)?;
>> +
>> +        Ok(KBox::new(
>> +            Th1520PwmPlatformDriver {
>> +                _registration: registration,
>> +            },
>> +            GFP_KERNEL,
>> +        )?
>> +        .into())
> 
> Here you are setting up the registration for the correct lifetime, however
> drivers could extend the lifetime of the registration arbitrarily, which would
> break the guarantee of the &Device<Bound> we rely on in the callbacks above
> (e.g. write_waveform()).
> 
> Hence, pwm::Registration's lifetime has to be controlled by Devres. I'll also
> add a corresponding comment in your registration patch.
> 
>> +    }
>> +}
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
