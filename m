Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F81CC433E6
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 07:47:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDBEA206C1
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 07:47:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oki11Roc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SvqjbM1I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDBEA206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N3dgXQToHj5htzSMFMgI2l3tN0Dy8aUm1RLRmxogz78=; b=oki11Rocv3I353V34TbO1CiTq
	YktzEiEq0esINYXgiT8rIJUmZT0i5zvEDOEdGq1VwNCos9yUBJa/lFU3Wylt4xi/VHv6up/x5Kw+c
	D1qyTpCVge4SoXrOo2la/rLDAQwoYI2Xhxv8QB8ng87nAq6K2D52Fjsx2kMvda3ZWA8udYqrmoaHf
	7xWBJQYcthPFX6q0hxb+cbzVUDmFL17OxTstMeWFv5JGimZzCKLUlhnIFDXL3sZlDiXNoXQBGXNww
	c+Zuq7HYGQtMfOPSAVqUukZDDcr/zVj8PHIvaIZ/6CfbS00LQT4iFM45Z2GfL+dCz2BcKNzNwLEkJ
	CmMdGMHVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvybd-0000qX-FG; Thu, 16 Jul 2020 07:47:01 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvybb-0000pn-2e
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 07:47:00 +0000
Received: by mail-oi1-x242.google.com with SMTP id e4so4407136oib.1
 for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2020 00:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3BUXUL9AKrDqMaBqwt9woIa2xKGZFsJ8thm8KS7GNOo=;
 b=SvqjbM1I8bN85zcWimONZ2ozTVklUFbPOB/mg5lt6Y+tKPILTkC89j1wv+TI/vHEWy
 PtYOQw0C9VRBd7uliQgJiZ1E2UFUYq0EGNJ77CLsmHLivGWnmB4naXdj+kJeicdi167z
 YDIvILeC4NZhNsBXtgsqUht1RvatrtdtATbVSG67GB2XyNBOgVjICI/1vyj4lpuxkVE+
 V3xvVI1wJWKylQD6RWYPdI0bgHS75tgDGStMjQlL2bXLjqwIthAF+AUEh1uH5tdS+pB4
 ac48QYZi+yViVAbeXObD7OnMDUTrquYdZJR7VorvbJ8XykuIPcpl92sBT0MGX8cKTLSR
 KKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3BUXUL9AKrDqMaBqwt9woIa2xKGZFsJ8thm8KS7GNOo=;
 b=JF48P+OWfzEMUFuBuujuWgwLc6k6CYbtE8fJ2WCLC/PymCHVGpEXApgIqECLp7quif
 TPEDaWJshtFFg1sbgL3/5D+Rg2k+Zs0SPOYR+pfUWhE/5NVOCTwpxncVIIyPIbm2l/xF
 IBaEgshou3iHrI8uneEC+LXqoYVmUPc3RbIC/kZNtOTZVCSrSzPKAWJMGsm3vrEVEJAk
 d4Wgnca/5KZ3Nb9SUy1es8T1GrPG4c+JBbhG3fQifquZxHG0P68HFzlFpGeVhTZoH764
 8or97I0nsuH//ez0ebTAZx7hjN5e+MnAwfwAeyYc1fK7dAgakx4xClg8ATffGBhIpgM5
 IdZQ==
X-Gm-Message-State: AOAM531vu0IaG6GS+VbpRKIpeJmZev/SFe1bnWpYt1f4Z2Vm4FrBZWYw
 Gj1W3n07/FbE7rTDq+T+Hk5bMz5m/E3asPQrORc5hA==
X-Google-Smtp-Source: ABdhPJzCKBDq7dV4e8atqNGFS0KfPTtTyRSbv0GrxEGTjPSIOfpn+4bk/ky8L19DllK9NXe9m/wIBKvsRsRbgjA7I2U=
X-Received: by 2002:aca:be57:: with SMTP id o84mr2821993oif.32.1594885616879; 
 Thu, 16 Jul 2020 00:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594880014.git.zong.li@sifive.com>
 <28365b581b04d0237e127363a63c1ad72dbea683.1594880014.git.zong.li@sifive.com>
 <87sgdrx6qd.fsf@igel.home>
In-Reply-To: <87sgdrx6qd.fsf@igel.home>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 16 Jul 2020 15:46:45 +0800
Message-ID: <CANXhq0omXrUCAFscZy5tDFisR29_4agA1ZTTYTezgZTmQg5Y3Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: fix build warning of mm/pageattr
To: Andreas Schwab <schwab@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_034659_456440_4D4C1564 
X-CRM114-Status: UNSURE (   7.85  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 16, 2020 at 3:24 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Jul 16 2020, Zong Li wrote:
>
> > Add hearder for missing prototype. Also, static keyword should be at
>
> s/hearder/header/
>
> Andreas.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."

Hi all,

Let me describe the details in the commit message and fix the typo in
the next version.
Thanks for reviewing.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
