Return-Path: <SRS0=Yzoz=SF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E63BC4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 04:14:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F097204EC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 04:14:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t91/grxF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lkcl.net header.i=@lkcl.net header.b="kFSWbSTM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F097204EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lkcl.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AshdNYFzoQDWCpZI1jTIgcZrd4ZQnBbBylY9OoR5nm8=; b=t91/grxFTYJAA7
	SFaqwxaHp+RL7PsFHQM1X+WYg6wlYZ2bVto4lJVyH1/MwQxQJpTcl+TRpV8f/97ZWHwZHGgnZLjPC
	OuC19W0uKv67Cnsxij4i2L6nYTx1Nl4Li8c8yDS1wxZlwad3QvLkP0bbvm0E2jB8/dQo4vCEeeTsk
	MFcNwVUFGIXGRn92ZMn+Yvf4+GWgYxxJvWBPF4N5ujdYmRDCCWv2vqWZXIjO4R0/jzlget/YHmmtv
	8nDdRBkBZ/s2NN4rNdULNVC9FXLtGJkA7aEod59IRYD2Vzvago462JRlmpVpTAycHI1i5lVRCi7ls
	eR8NpnRTK/JPJomCBeLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBXI2-0002vL-51; Wed, 03 Apr 2019 04:14:18 +0000
Received: from lkcl.net ([217.147.94.29])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBXHz-0002v0-5C
 for linux-riscv@lists.infradead.org; Wed, 03 Apr 2019 04:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lkcl.net;
 s=201607131; 
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
 bh=nTkFf+GEDdFH7qYsTnuLbDaQFWdDpjoFZKzsqQ/gLIU=; 
 b=kFSWbSTMCx+qhB81vShWt1Ag56FY71Zn51LdudZpcu7c8OowbI0tTdTetOj6oJkpF0mXELdoUnWjXYo3kmzpti/o59rQ44Ai6+Vmitbt5pc1V4NK/jw1qNTI54mCfPHOvpOvNBdlgP6LAXnIOJnFTGcTCANCszzNZRb/L43n23c=;
Received: from mail-lf1-f54.google.com ([209.85.167.54])
 by lkcl.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <lkcl@lkcl.net>) id 1hBXHw-0006hh-1i
 for linux-riscv@lists.infradead.org; Wed, 03 Apr 2019 04:14:12 +0000
Received: by mail-lf1-f54.google.com with SMTP id g7so10592487lfh.10
 for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2019 21:13:56 -0700 (PDT)
X-Gm-Message-State: APjAAAXS/zKsZK37oAjg2vSmuL5LtFyKJICmuGRpw4sKB+gIsKFg/hU9
 AiKToY/5jXtEUrECrvM+syHoZgQGEx0VJ0K0zkE=
X-Google-Smtp-Source: APXvYqwIN8aUfEFyB9Fn7Yts4otZnSp2gpeAGElGk6RyIfFGg6HqU4Rb3b1nJncbonpT+VHaAH/uuRh6e+EDFJr6SmE=
X-Received: by 2002:ac2:518b:: with SMTP id u11mr17674275lfi.74.1554264831178; 
 Tue, 02 Apr 2019 21:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAPweEDyjP7iyoyuHVOUPpJSgQzUZkx5Zc+yC2kFKjuxYELEXSQ@mail.gmail.com>
 <mhng-a66e2566-0146-4da6-bb93-15d7feb0c1b5@palmer-si-x1c4>
In-Reply-To: <mhng-a66e2566-0146-4da6-bb93-15d7feb0c1b5@palmer-si-x1c4>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Wed, 3 Apr 2019 04:13:39 +0000
X-Gmail-Original-Message-ID: <CAPweEDy-fDPZ5JO-iMPucigpQ45PH81n-v5sQhh1bpvrsnnYtA@mail.gmail.com>
Message-ID: <CAPweEDy-fDPZ5JO-iMPucigpQ45PH81n-v5sQhh1bpvrsnnYtA@mail.gmail.com>
Subject: Re: [hw-dev] Re: [isa-dev] UNIX-Class Platform Specification Working
 Group
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_211415_340262_4F806226 
X-CRM114-Status: UNSURE (   6.30  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Rick O'Connor <rickoco@riscv.org>,
 RISC-V ISA Dev <isa-dev@groups.riscv.org>, Gurjeet Singh <gurjeet@singh.im>,
 Atish Patra <Atish.Patra@wdc.com>, RISC-V SW Dev <sw-dev@groups.riscv.org>,
 RISC-V HW Dev <hw-dev@groups.riscv.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 3, 2019 at 3:43 AM Palmer Dabbelt <palmer@sifive.com> wrote:

> We considered different
> contribution models as part of starting the group, but decided the standard
> RISC-V arrangement was the best fit for this group as well.

 to make it clear as to why this process constitutes "discrimination":
why was there no invitattion made public for actively interested
parties aka "stakeholders" to participate in the decision-making
process? why was there no wider consultation? why was the decision
made in secret? why are we being told *after* the decision has been
made, and why do you believe that our business objectives do not
matter?

 executive director of the RISC-V Foundation once again cc'd so that
there is no way that the RISC-V Foundation may claim that they are
unaware.

l.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
