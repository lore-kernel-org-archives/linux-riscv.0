Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0BBC53219
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 09:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=km0JerLLwQrUo+h8b9JeX4hib2xQvv9Tz66sWDzf2Eo=; b=Me66ObcrKlQRXG
	O2jkILYFeOoTh+2ZHRI2b3n+MJOkz5E5zxIX0TO3x5YGEGm5lfG/eKE/pHPUtglaxOBtKxDcH/osg
	iqwJsGo35OpLt3n1UesOoLabG8qNvhwxFctce6Y7PPD2TcuJhRZmR3oJvMoa9v0ZfHFIiXSn1+lTf
	Yx8wKo4qiyVyL7K+BVoVAFVmeJF4v+wYdvYWO5tzaRdOxP88lvh9XzRnsK67z1c1DbQuQu4qqdTGV
	bJv00g5iV7S43cWHxTW1vzaHz7WcNv8LI5uN7IhLeOhBlQNAl7GW1mrGOlwJZsbRPbV1e7UDJWMct
	+OuUHw0q8xyGZN+USpxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeRo-00000004t2j-2HSX;
	Tue, 28 Jul 2026 09:50:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeRm-00000004t2a-4BVW
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 09:50:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AAFC940336;
	Tue, 28 Jul 2026 09:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E62C1F000E9;
	Tue, 28 Jul 2026 09:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785232202;
	bh=oLWjXuqnJhPZUydlgvzC/ZmJPhlhWN5Zieclb+yQNMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XCVb6vZy4wNmvPHoV/sE6e6bePoiGSeNP0MDACp6Zl/nTxbBH4vxscKSgF7qzpjbd
	 oCOKjdiYYizSwRviiNOAQ9V40f1oEyQdfq6K8ewIb8KWjX3lH5obnWL4p6wyXd1c9u
	 Vi4TnKCBiUzIdFSGQk8Gao2PsRB2XEGuTCquYjH8AvfRjqFHGynBhN9RkHd0jpV1pt
	 H0aJu5vP9qwaFCTigalaYYFQiXc+SHygpnq90Rly7ZPOR8M2PM0WCqVm6aP++r1oo+
	 Ou7AUAOEkEVQkXKUrv7HA2ciun3rJ/4d8I4bUAAS1IR6KNHO+/1a/JFGpYkqJxBodM
	 UCIIrrnDr1GMg==
Date: Tue, 28 Jul 2026 10:49:58 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Peixin Xie <peixin.xie@linux.spacemit.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Oza Pawandeep <quic_poza@quicinc.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] riscv: acpi: Handle LPI architectural context loss flags
Message-ID: <20260728-wolverine-of-classic-penetration-2f6cc4@sudeepholla>
References: <20260728-riscv-acpi-lpi-timer-v1-1-c722bce01e48@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260728-riscv-acpi-lpi-timer-v1-1-c722bce01e48@linux.spacemit.com>
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

On Tue, Jul 28, 2026 at 05:36:12PM +0800, Peixin Xie wrote:
> Commit 4785aa802853 ("cpuidle, ACPI: Evaluate LPI arch_flags for
> broadcast timer") replaced the generic nonzero check for LPI
> architectural context loss flags with arch_get_idle_state_flags().
> RISC-V does not implement the helper, so it falls back to the stub
> that returns 0. Consequently, CPUIDLE_FLAG_TIMER_STOP is not set when
> an LPI state loses the hart timer context, preventing cpuidle from
> using a broadcast timer for that state.
> 
> Implement the RISC-V helper and map the hart timer context loss flag
> to CPUIDLE_FLAG_TIMER_STOP.
> 

Acked-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
