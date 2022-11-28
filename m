Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5BBC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 14:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1jvxg2jx9nUTE/spT5ZdHLN3hmqJ0cbVWBNEQ4rxmOo=; b=k4DiTdICsdbn4p
	2ANdu9wsjLL66kanQ7PrLJREtnI2MNUjNvxeF1vLpiksIdAKveAnTnCUNf66+O1qk4cuB64Xr7SoP
	b8Zc+WT9pavSnWS+IXHQnE33ayyURlEARN+QPU4kQ0UOV2/fklWndSHzdH2WhQV8LSIf9pmk3g/ag
	MOkv7KM2nREBOvfAvRGRx17wjJx+OgfKWac6meFyJSvjtnEFrThWtFkUk2K7FWgB3cu7NcgoQ0KNx
	6/u2KMJyU5rmCmKQ/5CHDZHHQY4ArYtlxY1ZH6X42y/Bn+KNz/86OJOXJ1CDKTj5wO0oLX04fpm/G
	XmNOZOydRcvFnr0p6rPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozfTR-002LNU-N4; Mon, 28 Nov 2022 14:51:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozfTK-002LKN-4d
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 14:51:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669647062; x=1701183062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wtpNKUl602erZp5JhGLEdS/fNX0dwgMjE2H5qtJYc2s=;
  b=uRRn4UURlu4nNkVHQoEN/+ief4vitNA8eC/k+Xa+c3dVKvQh0zGTmVwE
   CjUu5/gWxnDMseP5WjtmkmwdJDF5+bMr154A3gnhNhPGHJgP02J3YbNYg
   mT4baBAoOB9pAG8qtgQjCPikwNDeWCbY2V16UNvLu9bAS4cKFVmYdF+0M
   GvMdMMXmTU1TEGcf2/to9j6NtEH2nd+kr3SrT5LDKLDCyzx2bjOmxHUG7
   r66e/wi/UFvkyRUVVVRR7/DzJ2cLMAffl4xRHl8TxWbCSnv7RQjlgGgaI
   PtIY3pMwnsmNqjDXS1sAsggIZct2CHiyhqKz2eF53Or40nyu8xmnh5Rwb
   w==;
X-IronPort-AV: E=Sophos;i="5.96,200,1665471600"; 
   d="scan'208";a="188967090"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Nov 2022 07:51:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 28 Nov 2022 07:50:59 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 28 Nov 2022 07:50:57 -0700
Date: Mon, 28 Nov 2022 14:50:39 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Ilpo =?iso-8859-1?Q?J=E4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-serial@vger.kernel.org>
Subject: Re: [PATCH v2 8/9] MAINTAINERS: riscv: add entry for Bouffalolab SoC
Message-ID: <Y4TKv5Ca6Zor7Y2Y@wendy>
References: <20221127132448.4034-1-jszhang@kernel.org>
 <20221127132448.4034-9-jszhang@kernel.org>
 <Y4Of7s6UGpD0/Iga@spud>
 <Y4OgNW6uOe60Pi09@spud>
 <Y4TF8FzX19puws37@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y4TF8FzX19puws37@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_065102_282688_40E97FBA 
X-CRM114-Status: GOOD (  11.38  )
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

Hey Jisheng,

On Mon, Nov 28, 2022 at 10:30:08PM +0800, Jisheng Zhang wrote:

> Per my past experience of synaptics/mrvl arm SoCs, I usually sent PRs to Arnd
> if there are two or more commits/patches; If there's only one patch, I
> asked Arnd for picking it up directly. So in bouffalolab SoC case, I
> want to do similar, but with one difference -- if there's only one
> patch, may I ask you for picking it up directly?

Works for me :) Unless I hear otherwise on a given patch, I'll assume
you've got it taken care of.

> > > git tree here. Otherwise, LMK and I'll bundle it with the other "misc
> 
> Hmm, is "git tree" necessary?

If you have one that you're sending PRs from, it's nice to know
what/where someone that may have a patch for your stuff can base
their changes on. You don't need to obviously.

Thanks!
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
