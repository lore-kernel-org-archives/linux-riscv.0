Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6D7C04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 12:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ngUMIgf2IShqgiA6dOqGVAXfIT1L4E3tuNnm67yf8Nk=; b=GVhu4f1pL18R5E
	jvKsMBmOCbwf40ozgifICsrx1UoSraBcxUvBIMUjZXezWVzfTbRO+MebDRrtI6Yfi2+cVQVfsxEBS
	20+kSqGJY/4eMgrhHxJcPSPciGUFSUKVH16DT2wuNF+B0KAGyqBotFUHmQAPjdZkpZOBN9ZBuDfXP
	8EdL97IprvbE+1egra4fTHh32jYPaoE/6IJaZyLw3vsGJJr0Oy134YgJhKexD0VRcTd3vtSEv/FWD
	0NACTiqoXknEfT7F1x+wvNEa5Q/l38BHz8u3L7SxZQPSgI4Jv6Kn4XvNC8XT5jYm/lrE5nBVhQjT9
	2E8e6BtTHAzevykg+mew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGg06-00DPgd-VZ; Wed, 27 Jul 2022 12:18:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGg03-00DPcY-Da
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 12:18:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 168B4D6E;
	Wed, 27 Jul 2022 05:18:47 -0700 (PDT)
Received: from bogus (unknown [10.57.11.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FCE73F73B;
	Wed, 27 Jul 2022 05:18:43 -0700 (PDT)
Date: Wed, 27 Jul 2022 13:18:38 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Samuel Holland <samuel@sholland.org>,
	Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: Add optional DT property
 riscv,timer-can-wake-cpu
Message-ID: <20220727121838.tpy55twdkuasjab7@bogus>
References: <20220727114302.302201-1-apatel@ventanamicro.com>
 <20220727114302.302201-2-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220727114302.302201-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_051851_519706_C7D7A7FF 
X-CRM114-Status: UNSURE (   9.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 27, 2022 at 05:13:01PM +0530, Anup Patel wrote:
> We add an optional DT property riscv,timer-can-wake-cpu which if present
> in CPU DT node then CPU timer is always powered-on and never loses context.
>

I don't have much idea on idle states on RISC-V but associating this
property in just CPU node seems like not so good idea.

This will be applicable for all CPU idle states which means you
can't use this even if one of the deepest idle state switches off
the timer.

We have local-timer-stop in each idle states node. IIRC RISC-V uses the
binding which is now not arm specific[0] and IIRC you moved the binding
yourself. Any reason why not can't be used and any specific reason for
needing this extra property.

[0] Documentation/devicetree/bindings/cpu/idle-states.yaml

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
