Return-Path: <SRS0=uKmQ=JE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC9C7C433ED
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 12:32:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B32E611EE
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 12:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B32E611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nHT+IJObfPQIiJUz0VM4fHvQGkOTywHRrm1arArhnWM=; b=UuFnQs2prCGZgiWcTBykukJVP
	x42qCzGYZ0QvYyl/PpslJ0nX265gX/NE/djemGu8SoQUfmKd1t60chLo5NREO6Oxo3dKWkvBBkLTs
	7Jv3Vyzl4Y/uSpE35DiMzFRu/ShxSU4uW07FfX64hhPfp6eF/jkM/psuparlAAw/mRPUAm9QI8vSI
	vG2262Tlmi5+kNI2AeoWNlZVIvgjf4rw/olAfJOsquN0S5ugvoIrcKK5THn1vXX24cgG9w0BwPV9s
	IlYJ373L6lG/oI/cJGA0uYV8Csg3DaT6+17BYObOf33aQ0iujM85OMULAlZQNvI0d/BlVNKKL6a2Y
	1mkm89Nng==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU7Lh-004xh3-OU; Wed, 07 Apr 2021 12:31:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU7La-004xgX-Ad
 for linux-riscv@lists.infradead.org; Wed, 07 Apr 2021 12:31:52 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EAAED611C9;
 Wed,  7 Apr 2021 12:31:48 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lU7LV-0064P2-VD; Wed, 07 Apr 2021 13:31:46 +0100
From: Marc Zyngier <maz@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] irqchip/sifive-plic: Mark two global variables
 __ro_after_init
Date: Wed,  7 Apr 2021 13:31:42 +0100
Message-Id: <161779861852.1095473.7951826017831477751.b4-ty@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330020911.26423e9e@xhacker>
References: <20210330020911.26423e9e@xhacker>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: paul.walmsley@sifive.com, tglx@linutronix.de,
 palmer@dabbelt.com, jszhang3@mail.ustc.edu.cn, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_133150_677536_7B5A0AFD 
X-CRM114-Status: UNSURE (   9.52  )
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

On Tue, 30 Mar 2021 02:09:11 +0800, Jisheng Zhang wrote:
> All of these two are never modified after init, so they can be
>  __ro_after_init.

Applied to irq/irqchip-next, thanks!

[1/1] irqchip/sifive-plic: Mark two global variables __ro_after_init
      commit: e03b7c1bcbfad6f27b4682f638b98627c4e416ba

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
