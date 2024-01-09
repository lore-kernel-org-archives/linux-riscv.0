Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF222C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 18:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8Mj2Dx5QuZ6L7PdxlCuM40vPso+rTDX4MhHYM7trAA=; b=O1+hr2vgjmUfqNV94xaC2JgtFW
	aBNs/fohsPMV03f6SA9Mb4ZvJ+MXyrAMsGVl9k60h4bzNPI19UwGm6dFH16RW9ug5B20bEpZDTH4B
	9Frbq7fnr6+CjYfZ+h8uO0kBFqpmG0xuO7z5zZg26dOHP/iGBXyG3ueRuMiUZR7DMYIDtNKDsWnpz
	pAUJ8+XLOkeMjoOVkNnWmBLygiiDeNuySW+oHMQGX8jLjZ7R/L5ri6hRt9fMpI8Gi2d2KHpk2NzcB
	10GItXe5bTRVp8iut6A1JAG6jtFF8xnJMo8ZjjxX2aZiXuuIayAKbo0CIbColWGEI0POtFNcTSfek
	SI90ADWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNGrl-009AVm-2c;
	Tue, 09 Jan 2024 18:30:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNGrh-009ATo-37;
	Tue, 09 Jan 2024 18:30:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5131961503;
	Tue,  9 Jan 2024 18:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 745D2C433F1;
	Tue,  9 Jan 2024 18:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704825017;
	bh=4e17EVKx9Ynx8QIA0PudyWmEbbNXeGXtvyR8zU7LvlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bibRrS8QD/wewhZo5L890sUv0otbbRCZc2+2QomQk5/Yhfp8eKzNtnBMc0ZuUlTDX
	 UCj7heIf7PEVTUmKVgV8BrYVzWL4T7iujkSvHIdMZQSYtv9K2W+KJoQofyyX9AxAEV
	 +SfFXCcMGMhA5nyHPWrEQ/id8KVblr1ys1HDeRML0p3zbPyFqW8+ux+4LUu5G3nql6
	 q+7mYg6kCjZK9OT/OmtFQBvMceb7InhYr6diYboDHMrnmvGMQIlEqaPgG3tnhKux3v
	 SYFHGWGMuqrHYPpO1gUhyX/b64lzkZRhSBSBBbHmbbilG677kaxsbVETkd97yKVC/U
	 zaZXQvnxr++gQ==
Date: Tue, 9 Jan 2024 18:30:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [v2 05/10] drivers/perf: riscv: Implement SBI PMU snapshot
 function
Message-ID: <20240109-vice-trash-89a4e1a171b2@spud>
References: <20231229214950.4061381-1-atishp@rivosinc.com>
 <20231229214950.4061381-6-atishp@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231229214950.4061381-6-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_103018_045410_E96947BC 
X-CRM114-Status: GOOD (  13.13  )
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
Content-Type: multipart/mixed; boundary="===============0321699124815425175=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0321699124815425175==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kO73K9XjJLp1tLC+"
Content-Disposition: inline


--kO73K9XjJLp1tLC+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 29, 2023 at 01:49:45PM -0800, Atish Patra wrote:
> +static noinline void pmu_sbi_start_ovf_ctrs_snapshot(struct cpu_hw_events *cpu_hw_evt,
> +						     unsigned long ctr_ovf_mask)
> +{
> +	int idx = 0;
> +	struct perf_event *event;
> +	unsigned long flag = SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT;
> +	u64 max_period, init_val = 0;
> +	struct hw_perf_event *hwc;
> +	unsigned long ctr_start_mask = 0;
> +	struct riscv_pmu_snapshot_data *sdata = cpu_hw_evt->snapshot_addr;
> +
> +	for_each_set_bit(idx, cpu_hw_evt->used_hw_ctrs, RISCV_MAX_COUNTERS) {
> +		if (ctr_ovf_mask & (1 << idx)) {
> +			event = cpu_hw_evt->events[idx];
> +			hwc = &event->hw;
> +			max_period = riscv_pmu_ctr_get_width_mask(event);
> +			init_val = local64_read(&hwc->prev_count) & max_period;
> +			sdata->ctr_values[idx] = init_val;
> +		}
> +		/* We donot need to update the non-overflow counters the previous
> +		 * value should have been there already.
> +		 */

One nit for if this is resent, you've got the wrong comment style here.
Otherwise, looks like the things we discussed before got addressed:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--kO73K9XjJLp1tLC+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZ2QswAKCRB4tDGHoIJi
0gOyAP9likwaQtMp2ZSARj3vlQ58zp6Y3zWoiDNp0IPqPvRVpgD8D3p4Ng+GSYTf
Nk3Ly+1hHDxZAqd9avg+wQchMGHMCgg=
=lKYo
-----END PGP SIGNATURE-----

--kO73K9XjJLp1tLC+--


--===============0321699124815425175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0321699124815425175==--

