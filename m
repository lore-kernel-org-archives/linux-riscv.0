Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDDBC8303C
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 19:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kDrTXFjhRVbz3Hdf+2TRn2NetdzNt2mhx5nvd2MwhzY=; b=GfYBxv7+ALlRLz
	u14TCjHis57kPHkAhg7ftffYfA94ZJbEnMN/2mN6GKiLEdluY6YpJUF4Yixiqfi2YlzmhSslykXy9
	NHBQJlVJbiy2lkRwc762HMrdkZfM9W3BF/S/pnd166PYYackK3RprIHiC8DRi5iVCEwY6443DJJwb
	UfGsRKNdyZs0CbtOmS1OWSZKBh3qpBVegqOYhcGfwz222CnU2qwZeGgeD1ey8XPiPItcFpaL5a1hR
	ZnfvQLfg1txAQeYSq5XiqzpDmMJ2eZGhn83bP6HsP1XrboR99HRu+dK+6f/mJ5JekcSc2mGn8UmUU
	P37/gFA4k+WogbSvttXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWgI2-00000006QhQ-41GL;
	Tue, 01 Jul 2025 19:05:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWeZC-00000006CCN-2RKv
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 17:14:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 38B26A5331D;
	Tue,  1 Jul 2025 17:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6540DC4CEEB;
	Tue,  1 Jul 2025 17:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751390084;
	bh=/nYOnOIIbrOV+84hpe4LR2uNAOY0fYnhNLgViKHOwaA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=opSQbVh63+1AG4gEDXtVjLecX5Ff/0yV6Pvs8ObQge9FVL2sDvLA4exzHD6w5Eiq4
	 oA0sEuYIT1FPtZzwuCIL/MFW3oLhmvSZ29YQ15I5N3swOVr5tDG9eGfOmNpTLw4Wjb
	 4/3FEXeATUtsv4d46vz5q9LkVVeArZBZuL4S68yVmPKAsVanB0nLbZIBQSQjmIr5HO
	 PDl2Ag2K+yWjOZd08MnNcHXmJdxFT3ymSUawNTxpeSt4mmq27oaOliI690M5kSMjHp
	 YU8hkAsAYkTjkXzWp3t20A9YIb0Cl+20RQu6g2QaOFNrW/kOb1Qqv1fDcfAIKk5H/1
	 JcOO8Yn5xhjOQ==
Message-ID: <aeb45ff9-73a7-427b-8cca-cc9646b65b9b@kernel.org>
Date: Tue, 1 Jul 2025 19:14:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] rust: pwm: Add core 'Device' and 'Chip' object
 wrappers
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Benno Lossin <lossin@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Drew Fustini <fustini@kernel.org>,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250701-rust-next-pwm-working-fan-for-sending-v6-0-2710932f6f6b@samsung.com>
 <CGME20250701160201eucas1p14d4182ecd8d6b2034f55ed5262bac646@eucas1p1.samsung.com>
 <20250701-rust-next-pwm-working-fan-for-sending-v6-3-2710932f6f6b@samsung.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250701-rust-next-pwm-working-fan-for-sending-v6-3-2710932f6f6b@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_101446_689289_DB8C90E5 
X-CRM114-Status: UNSURE (   7.01  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/1/25 6:01 PM, Michal Wilczynski wrote:
> +    /// Returns a reference to the parent device of this PWM chip's device.
> +    pub fn parent_device(&self) -> Option<&device::Device> {
> +        self.device().parent()
> +    }

I know what you use this for, i.e. to provide a &Device<Bound> reference in your
class device callbacks -- that's great!

But please don't expose this to the public. I think what you want instead is a
private unsafe method that returns you the &Device<Bound> directly, since you
also know that you set a valid parent device, hence no need to mess with the
Option as well.

And again, sorry for not catching it right away.

- Danilo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
