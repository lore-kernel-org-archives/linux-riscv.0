Return-Path: <SRS0=5v1j=RQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E80C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2019 18:58:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 157A42075C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2019 18:58:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rSWsIV1f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="A+CsOz2d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 157A42075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wRRvrdpfYFgTCw2MnXjjQxFiy5tnmk7LTfh5t55u7BQ=; b=rSWsIV1fetBCP7
	n5Xx3s3lnC840kyklJEzCXV3M9xOdgnfxTt2XiMJNTPAcv99OL6I05v3EBBej7GIsdktBJ8QLyUiF
	EyVCdqLx+4WXLnyJMg06xAXwCVYZpzVhVJxQO+vYLiOabri+54LdY30ZqFurCYKMy7fT7A7tv/tV2
	BwDbM4w+FehjXkfoIcMOtPcL3pKC1IoWHbyTXbE7cvAP/kpIgpJ3HmFDEyDiYmztUA/u4ER5EQN1x
	yHU9bRawKlA6g/VB+T0UpoUck0nJHYcmT4Ljagh8GXeP/tFj0pTSHfC9ggEWC0DJRZQ7BI8fwGkUw
	920niB7sMmLofvbtJveA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h495A-0007hi-8d; Wed, 13 Mar 2019 18:58:28 +0000
Received: from a9-99.smtp-out.amazonses.com ([54.240.9.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4950-0007Yi-Ls; Wed, 13 Mar 2019 18:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1552503494;
 h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type:Feedback-ID;
 bh=g2CgdiRrFONcS7q84T9IT62dNXSJg3uvMtyMiaxdJsc=;
 b=A+CsOz2ddClBlbTyRB7GQ11swExrOpBL2pOzpePROa862s9ANysO3zriiooW3U6/
 /AUprZA0K2uCnLqoI6IOxUg4hBnkiTe4VFPbqFnVrrlqWKFxdWZvrszGYgFLgodSAbh
 fl1n2ZcE/oHcWKA7qOSuert+cbSarB6b3nQbe6/M=
Date: Wed, 13 Mar 2019 18:58:13 +0000
From: Christopher Lameter <cl@linux.com>
X-X-Sender: cl@nuc-kabylake
To: Gary Guo <gary@garyguo.net>
Subject: Re: per-cpu thoughts
In-Reply-To: <898ae546-fac8-3f5a-e53b-c2941d81ca66@garyguo.net>
Message-ID: <01000169786b5498-f51eec75-2348-49af-8bcf-c5e42fa9a871-000000@email.amazonses.com>
References: <CAJ+HfNgSx49dRXDdJGovb=auAjSB703bN9tULjibW1OKHuHcPg@mail.gmail.com>
 <mhng-79f13983-1ea9-4f9a-949a-87dac2060f42@palmer-si-x1c4>
 <CAJ+HfNhmUdz4y81VNnTOsvyvSNw3i3E=qR+F0Qa7XThSOAiJ1A@mail.gmail.com>
 <010001696d414b3a-d35fa0a2-01fa-4e8c-be57-ff703610755a-000000@email.amazonses.com>
 <CAJ+HfNh6bc1A8vskxqJ9CP11aPdTgrPS2SOgLGXMLyefogFLtw@mail.gmail.com>
 <alpine.DEB.2.21.9999.1903110814130.11892@viisi.sifive.com>
 <010001697026a740-ffe901ce-8e6a-445b-883f-068dd289b0a2-000000@email.amazonses.com>
 <alpine.DEB.2.21.9999.1903120717110.26459@viisi.sifive.com>
 <0100016973000e88-99188bf8-0831-4fa4-b3ae-7de6547b651e-000000@email.amazonses.com>
 <898ae546-fac8-3f5a-e53b-c2941d81ca66@garyguo.net>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-SES-Outgoing: 2019.03.13-54.240.9.99
Feedback-ID: 1.us-east-1.fQZZZ0Xtj2+TD7V5apTT/NrT6QKuPgzCT/IC7XYgDKI=:AmazonSES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_115818_800595_86809A38 
X-CRM114-Status: UNSURE (   5.98  )
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
Cc: Paul Walmsley <paul@pwsan.com>,
 =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 "will.deacon@arm.com" <will.deacon@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 Nick Kossifidis <mick@ics.forth.gr>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 12 Mar 2019, Gary Guo wrote:

> The added instruction would require three operands (base, offset,
> value), which is clearly an issue on how to encode it. Also, as RISC-V's
> base ISA is already frozen, even if we have this instruction, it will be
> an extension, and is not going to be implemented by all hardware. Linux
> will still need to support those hardware without this instruction.

We have the ability to dynamically patch the kernel on bootup as the
features of the architecture are detected. That wont be an issue and we
do this on x86 for numerous variances in the instruction set.

The per cpu atomic instructions requires a base register that contains the
pointer to the base of the per cpu area of the currently executing
processor and then an offset that may be immediate or also in a register.

And yes then the value of the increment for the most general case of
counter handling. We also need RMW operations like cmpxchg.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
