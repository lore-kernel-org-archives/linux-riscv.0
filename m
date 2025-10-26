Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D559CCF9E9
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Oct 2025 21:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rRbiB/weD/Ko85zL7URtDFl08tXT9p5VR9GQjf30Cd8=; b=1i6hvj2QqP1mTk
	3PuobtYCxiENTiWUY8BXMfyqnNsNCwei9hQ743/LcPjB1ropEJHu0Y5EXyRzvr0gDF9BMaNGl3ECX
	Xzs+mLXATV83TV1eot1VUXPd4RIFal8QeqQ6NYO7N3eLHb3l9uUx0LI+19v20grYPwAiMdfIyFcvs
	7HoXr2PLRpsP9cwZbQFGRQU7THh2rEi1cCEJwu9tWwAZwBPIQvv7swJWDQ/+I0hUlWqaFRoe4UE3u
	25rrwgiFcL+lv94mJ9btuY02g6CslArxD0bKSImZi7PoQxsSDV13k4dYieqj86/LWdZTbEyjNOJmn
	7rssFdVolPcS4KYzHbGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD8WZ-0000000CmAp-1KJZ;
	Sun, 26 Oct 2025 21:43:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD8WX-0000000CmAJ-3EmJ
	for linux-riscv@lists.infradead.org;
	Sun, 26 Oct 2025 21:43:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A87316022F;
	Sun, 26 Oct 2025 21:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BCD7C4CEE7;
	Sun, 26 Oct 2025 21:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761515016;
	bh=0JsaR/gVfYuPh5Cfn/iC3pjbAktuSznePf9ABPRGJoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d+NgH+oqZEUs+k6eqHk7nYMsw2921LBoEq0/LJGGHdFyVe8fLSFVy697koLHqTEQv
	 AXQ4W9s1fkcIBKPAHtDUfJWy5cz+sXl7QtnOyEK1HVxi/m5AeFbY3kwXWWdUdpkLDq
	 NDLj3zOP057NFRZsrmhmKm5p3oA7AiHFt2nPK3g4Gw+lg/gowPJCn9Xgt40KwdqaCH
	 JLMFGF7RpXEMQaoLok8Xg0408WFQx5HqMDmS4htXz8qlyETbHosen6C73Flr6WQ0FZ
	 lhmqrDEd4AzMZ1DMsBWis0Mu+weoGYLfkYZCDA8LyrRVt7R4EJ5BNk5G8QhEzwUJUP
	 6K7BB2Lw5QHrg==
Date: Sun, 26 Oct 2025 16:43:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>, sophgo@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Palmer Dabbelt <palmer@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <pjw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 07/13] dt-bindings: timer: Add Anlogic DR1V90 ACLINT
 MTIMER
Message-ID: <176151501212.2988871.10069420018987162888.robh@kernel.org>
References: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
 <20251021-dr1v90-basic-dt-v3-7-5478db4f664a@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251021-dr1v90-basic-dt-v3-7-5478db4f664a@pigmoral.tech>
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


On Tue, 21 Oct 2025 17:41:42 +0800, Junhui Liu wrote:
> Add MTIMER support for Anlogic DR1V90 SoC, which uses Nuclei UX900 with
> a TIMER unit compliant with the ACLINT specification.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  .../bindings/timer/thead,c900-aclint-mtimer.yaml        | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
