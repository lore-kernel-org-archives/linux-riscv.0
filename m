Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955C4CD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 07:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MWk/CzRxbddN96USjshWl/0ow0M+LFpcFM06GzZH2LQ=; b=Hsyj7TZdDHS+5f
	Ye/OPOStf0HxP4uyr7x303nNloRHO6BPWUvV/0zMxs0FUzUEsEKGM7pOwFbxq37I91T+bf9srYfuG
	CxpnC4iuZAz4N6C2HF3uRzXHAZOTU+8f0bq92qyWOoowOceUTBbDMct/FzTWPC+7Q/Br4qxssZdLx
	OejpN2ggd4z0oKRQH9pknlqwUj79erseqppNN9qLPYnJq0RNQe62/pZeRo8sqlQk2di7OJ9+KwvOs
	a2pSvqDlmJS55/92QWVV40jxR4rHD5qCBm8iSRWZd7Wl+Yw19Ael85eb+Nsx55HE+XTgFrTJ2Vp/5
	yDEdd3ofifLKMC6LGVig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnHn-00000007epi-1BHM;
	Fri, 15 May 2026 07:48:43 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnHl-00000007ep7-17Rs
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 07:48:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=a1AVvdVarc8InzAOGW6ry1UU/91SpnKo6fW3luX2//U=; b=av5IrmdufgZCyrkWhuzfjPjqid
	qR2SeBhvG4bLfAHJc0UhihY+pCE+1pudh4/9DxKesByZDb7ddBmSJNuR3MZNMxvpV/sBGIVFh0afh
	MOXd3D8Rc2vh020gjBvhKA+W3ecJgZpuQQFcm1oUPbhIW4i95n4W9yR210YYO9lWCBNeZSwOQ7D8w
	A4ELDN0tLgPGCGDjYggh309d8EmUk3MCH5iDHbAXRWLftmENZh4bXqpdMsT5gU5kqLQ4rgMCVK8aN
	PjSYO1ijgSw7X0354AQZnh+Vxqpkr3YA7JBcmbOg+RN9Cr0G/rapoWhLocjt+vdG/9abXSB99nMQY
	BrM8Ju6Q==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wNnHf-00000008MGS-2RNt;
	Fri, 15 May 2026 09:48:35 +0200
Date: Fri, 15 May 2026 09:48:35 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: E Shattow <e@freeshell.de>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 3/4] riscv: dts: spacemit: enable eMMC on Milk-V Jupiter
Message-ID: <agbP0-OsfQRFJcr0@aurel32.net>
Mail-Followup-To: E Shattow <e@freeshell.de>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260514160356.1642075-1-aurelien@aurel32.net>
 <20260514160356.1642075-4-aurelien@aurel32.net>
 <f52a821b-157a-467d-84ee-4d1d4a96f673@freeshell.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f52a821b-157a-467d-84ee-4d1d4a96f673@freeshell.de>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_004841_306199_089E8683 
X-CRM114-Status: GOOD (  11.58  )
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

On 2026-05-14 23:49, E Shattow wrote:
> On 5/14/26 08:56, Aurelien Jarno wrote:
> > The Milk-V Jupiter board has a connector for an eMMC module. Add an
> > entry for it in the device tree and alias it mmc0. As it is not
> > populated by default, do no mark it as non-removable.
> > 
> 
> The meaning of "non-removable" here is whether it is expected to be
> added and removed during use, requiring to be probed again; not whether
> it is a user configurable module or soldered down part.

Not connecting the eMMC module and larking it as non-removable causes this info
message to appears in the logs:

mmc0: SDHCI controller on d4281000.mmc [d4281000.mmc] using ADMA
mmc0: Failed to initialize a non-removable card

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
