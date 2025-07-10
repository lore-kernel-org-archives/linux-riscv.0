Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C78C83F17
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 11:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wcKNEA6tZJh560dBvs+o8y9mFY1a3p+pcm6Jev4lLIM=; b=I5waB3zpyWALbI
	8OA8M/zHItHRCOt2cIUOZewO30gqsTmDY0lfN2/qqLnjtFfiJKmwKWkk1AWH93zZm0FQs3iiqcdrn
	YB/ZLT4jZO4B1+JbKZLMRmIGoF941ctsoZyx0rh8oIrOrpsxBsV0DB7E0Y/CCV7lpsJaruK9KZfIQ
	sMRAiv1VW5BOwBeACqyG9HG60YL9hndYLyXTK6f06Fn/A/Tto/3juLCMqEGnCI4ep7XaS/AX1eZiz
	2u0zCUe+8fxSgnidRJKASqyy5e5/YMFT4fBIIhJfyfjTQriH4aOzpOjnBciJpk8zmwX1E37VkmAMD
	+wIojedB3FwreeLPMRBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpiQ-0000000BfOb-3QAD;
	Thu, 10 Jul 2025 11:45:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoL2-0000000BSdp-0cL9
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 10:17:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 323B7A546EC;
	Thu, 10 Jul 2025 10:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 911DFC4CEE3;
	Thu, 10 Jul 2025 10:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752142630;
	bh=fiadbZJTOVijBGDI4SQbxUWDNXsmiOttH+ylENKymGE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=VHOptsQXxjGrjx+Epibq7qQYdIn3VPDfFMd20JJPXeMITVuNGQLN+hXAugz3/Z+AB
	 zguJuAGrZw/QlDKd3R8XJjLNVBzyeGURC46uQ6hM8/p06xwFSufr2tP9CPbU3LAgk1
	 WbiyR0+PqAEhA8KTFN6BerhC6lA5bpl7SBWWCV+VtbOkl4PZKlMMSAY3JF+svS+T2l
	 cT7lCpYgKs4itMuClsaNV3yn4vyQjJG7UCd6al4wQ9/anCtDxwsA5KtZR0iuADWlCg
	 n5HypetI6XoXSaTtFO2bK7AG4pGTvpX7eX3Vr22Vviw/fUoJCX5kVhzVSL9AB6hzt+
	 s0uEPLD0pCj9g==
Mime-Version: 1.0
Date: Thu, 10 Jul 2025 12:17:03 +0200
Message-Id: <DB8AQ15RTAJ2.3QXX8Q2FTFGCP@kernel.org>
Subject: Re: [PATCH v10 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Guo Ren" <guoren@kernel.org>, "Fu Wei"
 <wefu@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Benno Lossin" <lossin@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>, "Drew Fustini"
 <fustini@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <CGME20250707094926eucas1p155bd967b6986c4a999776839b1aa1fc6@eucas1p1.samsung.com> <20250707-rust-next-pwm-working-fan-for-sending-v10-0-d0c5cf342004@samsung.com> <e8a4a821-e7e4-4bcd-a2ac-f6b684b6ceea@samsung.com>
In-Reply-To: <e8a4a821-e7e4-4bcd-a2ac-f6b684b6ceea@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_031712_311449_97B8A15C 
X-CRM114-Status: GOOD (  19.91  )
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

On Thu Jul 10, 2025 at 10:42 AM CEST, Michal Wilczynski wrote:
> I was hoping you could clarify the intended merge path for this series,
> as it introduces changes to both the Rust and PWM subsystems.
>
> Is the expectation that the Rust maintainers will take the abstraction
> patches into the Rust tree first? Or would Uwe, as the PWM maintainer,
> pull the entire series? Any guidance on the coordination would be very
> helpful.

Except for the helpers I only see PWM code, so this is fully on Uwe's purview I
think.

I see that there is a new MAINTAINERS entry:

	PWM SUBSYSTEM BINDINGS [RUST]
	M:	Michal Wilczynski <m.wilczynski@samsung.com>
	S:	Maintained
	F:	rust/helpers/pwm.c
	F:	rust/kernel/pwm.rs

I assume this is agreed with Uwe?

In case there's no agreement yet, the typical options are:

  1) Maintain the Rust abstractions as part of the existing MAINTAINERS entry.
     Optionally, the author can be added as another maintainer or reviewer.

  2) Add a separate MAINTAINERS entry; patches / PRs still go through the same
     subsystem tree.

  3) Add a separate MAINTAINERS entry; patches don't go through the subsystem
     tree (e.g. because the subsystem maintainers don't want to deal with it).

I don't recommend (3), since it's really just a fallback.

The above looks like (2). In this case I recommend to also add the C maintainers
as reviewers, such that they can easily follow along and specifiy the tree (T:).

But, of course, that's up to you and Uwe.

> I understand that it may be too late in the development cycle to merge
> the full series. If that's the case, perhaps patch 2 could be considered
> on its own, as it hasn't received comments in the last couple of
> revisions. As another possibility, patch 1 and patch 3 are dependent on
> each other and could be applied as a pair, depending on your assessment.
>
> The RISC-V driver itself would need to wait for the IoMem series merge [1].
>
> [1] - https://lore.kernel.org/rust-for-linux/20250704-topics-tyr-platform_iomem-v12-0-1d3d4bd8207d@collabora.com/
>
> Best regards,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
