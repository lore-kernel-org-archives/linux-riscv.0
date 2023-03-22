Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6418C6FD1C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 23:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4EgjD7iyWV99W0sd7s4S2qi9BYDNYcy25vuEIlTmcwg=; b=ZDyueZ3ztev+xG
	gBpbn1MxPyteuX4yVVFe0sZ7Bq5sqyxu399zC4wW1T92y29yNNrELQjWbvb/0BxPHr8MLq2kq9t8U
	ORvvn0P0/dGa68qU8t5gt2ZihrajQsO/b+26Ks4cZuXsqCGxjbl1my+5Od/Z7zA1tOEWAJD8oIH47
	O9A98ivFEhQ0r/4gW/oxS3x9/KyHzHDk3bhzBOAeeEye2BmJaXYIcfktTn2hTgYuUU31BXR3eggIW
	ewbMeRpjE+UPyBzinik1P8akUGhyUu7ZjpMrveregS39qbsipDR+MG3I4k3hxXfTRX2ISdh1nwAS0
	5yczMLaOtwJZlyddCG+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf8Kl-000Epa-1D;
	Wed, 22 Mar 2023 23:57:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf8Kj-000EoW-0t
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 23:57:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D494F62342;
	Wed, 22 Mar 2023 23:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30014C433EF;
	Wed, 22 Mar 2023 23:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679529451;
	bh=y9U/5hZyFfh0oQkHVBhuHaZSSNPer4aXYq7GpolG5rU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hlTMsxwsdHEPbcZ0FHd0U3HCMN+5KMbB4GdzyMoynPPZs7M3Qulola3FMclIzMBGy
	 MA7IFAqYndlH8nBQt2vxK/XtVd/DEocK2WNMBtztWjrQrEjTcaf6mKYAaLYklXaw2Y
	 ccaJGUBIm0ZGvP+2ZkucdrrfK0BsWLYn+hV1JDOU2MkkKVEq4lBB3SYKqS55TF9w8K
	 g73lN0U5uwtbmEX7W6uySdtlT0wnOrAoWPGY88DPUrYN4Bj2pgcF9sJo6QorusZx4s
	 0pnDosayty3cjQPJ1PXT23JXZKQmywKg0PkvASpPD/i+jZLydr4DxMcWmW1qVJkh+b
	 8aJmkhStClcSw==
Message-ID: <ce3e64bedd449e6c782e243c28cf4945.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <b4beb457-8581-4b2f-8655-2e3f82a94f75@spud>
References: <20230320103750.60295-1-hal.feng@starfivetech.com> <20230320103750.60295-12-hal.feng@starfivetech.com> <b4beb457-8581-4b2f-8655-2e3f82a94f75@spud>
Subject: Re: [PATCH v6 11/21] dt-bindings: clock: Add StarFive JH7110 system clock and reset generator
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-kernel@vger.kernel.org
To: Conor Dooley <conor@kernel.org>, Hal Feng <hal.feng@starfivetech.com>
Date: Wed, 22 Mar 2023 16:57:29 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_165733_349370_9A2FF370 
X-CRM114-Status: GOOD (  11.85  )
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

Quoting Conor Dooley (2023-03-22 14:53:37)
> 
> This leaves me wondering which clocks are *actually* required for a
> functioning system - is it actually just osc and one of gmac1_rmii_refin
> or gmac1_rgmii_rxin.
> 
> I really don't want you to have to go and spell out every combination of
> clocks to have some sort of validation here.
> 
> Stephen, Rob or Krzysztof, do you have any guidance on this situation
> (assuming I've not made a fool of myself)? There's probably something
> "obvious" that I'm missing, as I am sure this is not a unique problem.
> 

You can always use '<0>' if the pad isn't connected for that clk input.
It's not great, but it works, so there's an escape hatch if you need it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
