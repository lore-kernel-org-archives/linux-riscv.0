Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D39C6786F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 16:17:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A120B2081B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 16:17:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PdswXOrX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="LnQhnmNA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A120B2081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=dQD4FT8czjuIyHNpFFpaX2BPbpY7nkl7wzhOvsTBJoQ=; b=PdswXOrXbCDUYUfx6ATAUTild
	VHrHeL+7ETxy0tB3G4AlLxigWbjpJDCdhnPr4kb62ew/+PN2CIAc5BApa5iJwyZDnQTDhHcOMXgKw
	bVqcN51fUKeOz28okwcvgnTytGrlN+IJd5n4JkdhevmFTfsidJL3BWW6a+7a0Lum5D9sNP/8Xs/Zc
	Lf7J5dprNsZBa0VB2kLPKzH/u9qQV2l0rz5l83WXbFPDr3AcUbskitnF4mcSqji7wYJCHxKkxr22c
	LMOwvmTxin2qzl32oIpFdZYRLu785yBuqWDBBvDCeur7HLhVn8k8FHD6dvVzYDt7WMKgRL7UN1N+D
	zir7t86oQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIFf2-0003qt-R1; Thu, 01 Nov 2018 16:17:32 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIFez-0003pI-LL
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 16:17:31 +0000
Received: by mail-pl1-x642.google.com with SMTP id bh10-v6so9180476plb.4
 for <linux-riscv@lists.infradead.org>; Thu, 01 Nov 2018 09:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=hJzb4s2hKRO79UqIs4qwRGjIMZpjP+ft/ZmPMZJET5g=;
 b=LnQhnmNAAfjfhf5y9siGGTzvceRzASPS8cWzFvG5nWyAvIYnlDMc11le+8v+OH+ETE
 6gBZbBsjOgTKY7L231JlNe3BDbZ6GWDwcuVkN5Vez0pb35WUB8vqunQpMkI4kd7tbgjI
 NGDWyw23jZGGkqIOcVPCu9AZtWW0D0AorVLNQBXnwbmGcpohsEeUU4WBIVYyHeeoRAMx
 BnBM6zUl2gljWiE5OS3CjKUTxEnGSPa1fJSKHB7436TVvN/JQN2JNiNmS3jlUkirxXhl
 0pHB+6Vu/oyzx+sWoLj0ngG2cj3Don8BpP0RGdVm/tzQNrbwFpFiNpPI76uoIya5XcZr
 6EPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=hJzb4s2hKRO79UqIs4qwRGjIMZpjP+ft/ZmPMZJET5g=;
 b=ZNfhAzDxdMKPAD0a+3XdLwFBDz40LCgSdLXFMERAbhipKM3S3xKOx5EZS6yYYJe4Hx
 0sBZPVrNaDRmHyUWUYOhC9QVYPl8XdDsq8yRdtCnUJ4UPJ5gAmALyXb822jNlJWrf9kY
 vZbTfSM4BAsLSwjbTxHav5/CLOJheHZnECN0rgemWvMvljE8/fp+YHcVQYUpiaVjRlC8
 HfppM7fZ/PBuxErVnkifl77VuXQflrgCTI+t0F4RZn9Rw3oKb/OyHXQ/X2hQI/soLVQe
 tgRoPSxzn9KvJamALU88hVg/Slux5IfTiC0gSuPOlEQ+hZp4UxOBxBrCX8vVdyOj139o
 tQbw==
X-Gm-Message-State: AGRZ1gJwb68ERzjaTd1KH0kNvZtw8xr9O9WIOIku55cZWzSTdyiwBJLg
 ptH+MUUG1a6qX5joMLQlK7tHLg==
X-Google-Smtp-Source: AJdET5fshnB+8jEotlG1LfA74E132DDaea+6Rt/ub95sXq8dGm2emVzkvp06giypP2lBaVhlcS6sAg==
X-Received: by 2002:a17:902:7c0b:: with SMTP id
 x11-v6mr8143842pll.60.1541089037781; 
 Thu, 01 Nov 2018 09:17:17 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id v84-v6sm42169056pfk.12.2018.11.01.09.17.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Nov 2018 09:17:16 -0700 (PDT)
Date: Thu, 01 Nov 2018 09:17:16 -0700 (PDT)
X-Google-Original-Date: Thu, 01 Nov 2018 09:16:57 PDT (-0700)
Subject: Re: [PATCH 0/3] RISC-V: A few build/warning fixes and cleanup
In-Reply-To: <da34ca57-ea7b-7fb9-bc45-4b315513e43f@deltatee.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: logang@deltatee.com
Message-ID: <mhng-b2753147-e1db-4a2a-8dfb-710e71a38bed@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_091729_698406_FFEE7D86 
X-CRM114-Status: GOOD (  12.58  )
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
Cc: aou@eecs.berkeley.edu, lkp@intel.com, kbuild@lists.01.org,
 zongbox@gmail.com, linux-kernel@vger.kernel.org, philip.li@intel.com,
 Olof Johansson <olof@lixom.net>, linux-riscv@lists.infradead.org,
 fengguang.wu@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181101161716.KMSG-q6RAoXLLW_ejSWpBXmGzQMv-8Ylp8ZjksCO9B8@z>

On Thu, 01 Nov 2018 08:43:15 PDT (-0700), logang@deltatee.com wrote:
>
>
> On 2018-10-31 8:19 p.m., Li, Philip wrote:
>>>> I think it would also be very nice to get the existing kbuild test robot
>>>> to start compile testing a few riscv configs. It already does most of
>> thanks Logan, the support to riscv and nds32 has been in our TODO list for
>> a while, but whole team is blocked by other effort. We will focus on this soon
>> to complete it within 2-3 weeks.
>
> Thanks! Glad to hear it.

We should probably at least have builds for rv32imac, rv32imafdc, rv64imac, and 
rv64imafdc.  It's probably also good to test SMP/non-SMP as well as 
medlow/medany, as I doubt those get regularly tested.  If you'd like I can 
write up the configs, just point me to something that describes what I should 
do.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
