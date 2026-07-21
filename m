Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74617C44529
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 11:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NSdfKn9jQQY3kR/01McTp306O/86RMOTOqnYIotHDVE=; b=ARb7fKNo9bJaVx
	pANmvKCEy85Nmp3ARem9Tb2YnBw/rpUY9H77Pvi+z3nMaJQtoAfCkMSti0ja0Zc8I3+Uo0ChAYsYl
	I7DkjUNPkSbMnmNqpK4mwSl69zpLbYXPorQlrqRUcEQ6KiFtLt/9cv62FljK7EYe+ku51McCJXeuf
	4jXbBxZoQ857bS0R/bymH7coQNboY7YkkDQYNMSpUZr1L5zQ/Pq60lPc3MPy96SgX2TnKyQgb1ZoE
	6TKf198PXiKUmCLV2ikqL55FrEXp5SmwmiPLGJ4InaFXNTA/8w/LsIqIKHUY8jhGHdYcxoe/WbNTW
	nox2mW2MU3Qni1ucV7MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm8o3-00000009KgO-2u2R;
	Tue, 21 Jul 2026 11:38:39 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm8o1-00000009KfT-02P1
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 11:38:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784633911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B6lhiI2q/qZYGGxt2f3OXZ7gIkM5jB/KE2hFDF6ccMo=;
	b=XJoPdW3Hc6jLvgUnVBwb9sH4DnHCmHhDs4pvW9YJs6eWqinQYRMhBte5HrQce3jqKawL9I
	aGCMgaI1iCstyqI82p3cjEqnCAeJsdLipXVjOeUtAFLoG3HljKiP65Ct7p9K+okQYQjPl7
	wnmd5TPt4jSRBWPT+Vid6KU1NHkxpg0=
Date: Tue, 21 Jul 2026 04:38:14 -0700
Message-Id: <DK47X10AGZL8.1E8TQ4CGTYI5W@linux.dev>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: hwmon: Move LM63 family to a
 dedicated binding
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.dev>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
	<20260721-ctl2301-v2-2-ef5fb342872a@linux.dev>
	<20260721095822.1E9631F000E9@smtp.kernel.org>
In-Reply-To: <20260721095822.1E9631F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Mutt-References: <20260721095822.1E9631F000E9@smtp.kernel.org>
X-Mutt-Fcc: =Sent
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_043837_251880_E72330AD 
X-CRM114-Status: UNSURE (   6.21  )
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

On Tue, Jul 21, 2026 at 09:58:20AM +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Should the interrupts property be explicitly defined in this block?
>
> Because the LM63 family was moved out of trivial-devices.yaml (which
> broadly permitted the interrupts property) to a dedicated schema using
> unevaluatedProperties: false, device trees that correctly describe the
> hardware's interrupt capability via the ALERT# pin will now incorrectly
> fail dtbs_check validation.

Good catch. The trivial-devices binding allowed one interrupt, and the
LM63 family has an ALERT output. I will preserve that part of the existing
binding contract by adding the following to the dedicated binding:

  interrupts:
    maxItems: 1

                                            - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
