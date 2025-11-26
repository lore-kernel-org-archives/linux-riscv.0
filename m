Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343CFD0EE10
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 00:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=becg47HHa6wksiFmvN/28d8/TaDq1gNTEva2YN5D6Yw=; b=AwTuYFtcKKnxV3
	4r6DaBPJV1ev+jjgirmuDFi2/HKWzRGOXnOXztVTl6QJgHPVueZO4oasFtuIF65tFD+UP8DV4+4/Y
	whp535skxnYUwurGpL9JzuM7qkArcTjMcksqg9UWp2y89Xig5xbfe1D7zjGwzdbw36AXsiR5mfU4I
	+OLYhi11i5iIvbOLUWBCdzdauIk+j2+ugvozQ+MGZ54b3o4d2YtjVu2DKq4cvQaTsy8I3ZPpC0/Yn
	QHfyDyi83jHuDw3+Rfg/uVR/OpivDiUhYn51kSh15EOBXoVt6gKpCh2cubQ7ieY5ZZWyb2zVY6Mii
	oxS4xBFJBn8afWCNJU1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO3lY-0000000E8XG-3IeR;
	Wed, 26 Nov 2025 00:52:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO3lX-0000000E8X5-2Et7
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 00:52:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 80EE2600AA;
	Wed, 26 Nov 2025 00:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158A2C4CEF1;
	Wed, 26 Nov 2025 00:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764118334;
	bh=C0XseEjLPJm6JB1tPLzNcAsCYsamWBPPJFl0+3phHoo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CundQTJL7ilMirDV9Ew4adchtwf3uRyv8hLplnvIWO0ygoKIJm7WR7n+2IyAz3vxT
	 mC5j1E5bGlO/6Tm9LuquJozUiLeUwkOw+qanpt5/IhJ0v3liGtc434lVgjYQqvQT3/
	 0HXxoFnFXoWlI9Roy7dM2l+zEiFAH9BHlWUw3UrAW8NQUeNymDrzIdYiHdK8qLboFV
	 zKBYh3k2ouz6jQZk7kxCNcqNn7hPfkr6NoD+IzyDZCtj4wGzeCR5DELaoZGUajMWho
	 DbAJUyKr5kjA2r/u+URaY/5HBI635NMgHzSq8ZdvO0klR4gJX3I2K2wylcEA1dVq7/
	 XvJzdiLeqROmQ==
Date: Tue, 25 Nov 2025 17:52:10 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
    Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>
cc: Inochi Amaoto <inochiama@gmail.com>, 
    Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
    Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
    Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, 
    Samuel Holland <samuel.holland@sifive.com>, Eric Lin <eric.lin@sifive.com>, 
    linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
    Longbin Li <looong.bin@gmail.com>, Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH v2] perf vendor events riscv: add T-HEAD C920V2 JSON
 support
In-Reply-To: <20251014014830.613399-1-inochiama@gmail.com>
Message-ID: <ac26535e-01c8-d8c4-9f25-f5716065b37f@kernel.org>
References: <20251014014830.613399-1-inochiama@gmail.com>
MIME-Version: 1.0
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

Hello tools/perf maintainers,

On Tue, 14 Oct 2025, Inochi Amaoto wrote:

> T-HEAD C920 has a V2 iteration, which supports Sscompmf. The V2
> iteration supports the same perf events as V1.
> 
> Reuse T-HEAD c900-legacy JSON file for T-HEAD C920V2.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Would you like to take this one, or would you prefer that we take it 
through arch/riscv ?

If it's needed:

Acked-by: Paul Walmsley <pjw@kernel.org>


- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
