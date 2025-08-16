Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED72CA0EE6
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 23:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DNqkDLpCzOXTrtfe5be82x2JySpQ+/jEQkbdXb+PAVg=; b=d3yX5kEP00fuTB
	azHDTiU+5D+Tz/zQr4xV/a9dktcjqmLIduipDP5geXstqiDdKMc8YW4lMHk9mUpxMyvzms5MkbGge
	Kw6Q6ZfzMa8LVMUPwngb3WvwuPikF8HQglAPOlWOUuudnxxI/RobIxQknUNM69oOyvAdiwzOoDann
	efVj67CT1aV5RU/tA10bEHgLf/ohC4rnKBE9tDC4hVUQI+WVX7WWyJspO2XauyEA04ltLFBfMiOwA
	qPxY+7/MdsNzcNwfXiyPp9KSqCq3jIgTXjSAmAfGLeMd/fTgFdmRt90IQHDB+Fiu38fmteaWRnWT3
	iVPsqNnElOc3fBJcBC4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unQJY-00000005Dk3-0pC8;
	Sat, 16 Aug 2025 23:27:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unQJV-00000005Djd-49b0
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 23:27:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D16ED4390C;
	Sat, 16 Aug 2025 23:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7BB7C4CEEF;
	Sat, 16 Aug 2025 23:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755386872;
	bh=MH+pLrfbqWRbgWT2IxanHwfX7q2c5M1yYZ9GbKJV9eU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OQDseDI+FFcvvdiy01zIsv/Uf0VWNABprBq5D2c7VYRYlj2++c8UJXCvMqvIk+pYl
	 5/Twb+qgl2XMD84h+C4e+My2OQfYEz4UBWY9WqV/XcmKCZsrF8I5zTN8wQcigef0s9
	 /S8Lkgfs3DXkNG94GNK71oeC7PiyCUfbx2zjGEbBCZut1Hjlwu4WING7S02RdiXxf1
	 wbKqcqBE2zZsdLjKn1fgwzcH22omt8GIoCedunvJTVenSsxcYraXeo/gfHRmBqX7or
	 qn7ke9AaP0rJ8ald/m/LKEYZCkIN0IL258E98xa1PrXt99ElR35J5Mw6XSrNzTiiAW
	 o6bY4nXkuBhhw==
Date: Sat, 16 Aug 2025 16:27:50 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: thead: th1520: add soft PWM fan for
 Lichee Pi 4A
Message-ID: <aKET9i0/+INnOMoX@x1>
References: <20250816093209.2600355-1-uwu@icenowy.me>
 <20250816093209.2600355-4-uwu@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250816093209.2600355-4-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_162754_052486_1BA9C6D6 
X-CRM114-Status: GOOD (  15.19  )
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

On Sat, Aug 16, 2025 at 05:32:09PM +0800, Icenowy Zheng wrote:
> Because of the SoM+Dock design of Lichee Pi 4A, heat dissipation does
> not work well; fortunately it comes with a fan port with PWM driving
> capability.
> 
> As the hardware PWM controller of Lichee Pi 4A isn't ready yet, drive it
> with pwm-gpio driver (software PWM) now.
> 
> A long PWM period is used, because not only software PWM is used, but
> also the fan port is a 2-pin one and fast PWM might confuse the BLDC
> driver on fans.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 53 +++++++++++++++++++
>  arch/riscv/boot/dts/thead/th1520.dtsi         |  2 +-
>  2 files changed, 54 insertions(+), 1 deletion(-)

Is it possible to reconcile the work that Michal is doing with the
hardware PWM controller series [1] and this series?

The PWM controller does need Rust which works okay for me when using
llvm but that might not be the case for everyone. Maybe there is some
way to use the pwm controller if available and then failback to gpio if
not.

Thanks,
Drew 

[1] https://lore.kernel.org/linux-riscv/20250806-rust-next-pwm-working-fan-for-sending-v13-7-690b669295b6@samsung.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
