Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6606BC433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 07:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bgvNVioGszzNwXxy6enEvaIBDsxVTxcggPUdc85n6WE=; b=rRPVxkTtkpUeEC
	N8A13KKSu1rJZFZkO0FiW0mZRXFzl9i1cpno7Tu/YVnoW9USuQuzSjWhDiFrB7YOApDBwGweCMuwB
	UkCF9q17Vpyu7luB++MQ92FBDeWZaEJWC0orByE+8YK10JH/Kj8ca+5CbfdKAdxTQPAuDDyQg1ry4
	ciwPJOYO5n0ihVIa/OKwXR54GVRxVr1w6Xh5eMwEP8x9PAdpnG9iPnoKXu4dmTtXLhgmWF3wPxDPn
	jNVj6OvkeGbyiXmxf2jGGyL34Hw5KxefYQR026S++h/s7CO/pTs3IN4V9I9wYliwfUMOlebMIj+R/
	dhTCkcDWdUl3M5gIg/Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osJT5-003VFa-C0; Tue, 08 Nov 2022 07:56:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osJT2-003VF0-SN
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 07:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1667894180; x=1699430180;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UZKMnJKFAv4vSHd9oWtskNWgnKnXMz5bt69bqiWFP88=;
  b=J0o4L0blqWds6IDas7g1y50JbPelIFznoP96gn4DWDfNiUoIIbhm3PCW
   Gjt0QKmT1EqJ8UTbgo+Jy9ZJyIGBO3ikWyziaFY6sKSWmceX7De0bRaFt
   9ZZS+6q63j5SbaYkmRiB7aw2bNWInT03QE6oVvymluRqqEGvdRtnvd+om
   lkLqRZqu6/v7T9D1nSnP9IebkTgfJCvzJ9JAgOiWLfYRIUZx1Wx99G4td
   M3E1hXTcfcRi3w4W/Hhvbv/JTeHuzH6i6ShmMkSIBRnKQAX6o5kXG4zRl
   A+otCPy1muAAW1Rqx4hDghKwtQMn633UXMfnP5aZ6bSPEvAIGSf754AoO
   A==;
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="198857937"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Nov 2022 00:56:20 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 8 Nov 2022 00:56:19 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 8 Nov 2022 00:56:17 -0700
Date: Tue, 8 Nov 2022 07:56:01 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Vineet Gupta <vineetg@rivosinc.com>
CC: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Chris Stillson
	<stillson@rivosinc.com>, Greentime Hu <greentime.hu@sifive.com>, Guo Ren
	<guoren@linux.alibaba.com>, Vincent Chen <vincent.chen@sifive.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Andy Chiu
	<andy.chiu@sifive.com>
Subject: Re: [PATCH v12 04/17] riscv: Add vector feature to compile
Message-ID: <Y2oLkQSdCBJPvZW/@wendy>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
 <20220921214439.1491510-4-stillson@rivosinc.com>
 <87zgd2d6j1.fsf@all.your.base.are.belong.to.us>
 <f4887649-3933-0a65-7ed5-1bf6bd842a46@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4887649-3933-0a65-7ed5-1bf6bd842a46@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_235620_997679_B38EF2A1 
X-CRM114-Status: GOOD (  12.79  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 07, 2022 at 04:04:28PM -0800, Vineet Gupta wrote:
> +CC Andy, Conor
> =

> On 11/7/22 09:21, Bj=F6rn T=F6pel wrote:
> > > +config VECTOR
> > > +	bool "VECTOR support"
> > > +	depends on GCC_VERSION >=3D 120000 || CLANG_VERSION >=3D 130000
> > > +	default n
> > > +	help
> > > +	  Say N here if you want to disable all vector related procedure
> > > +	  in the kernel.
> > > +
> > > +	  If you don't know what to do here, say Y.
> > > +
> > > +endmenu
> > "VECTOR" is not really consistent to how the other configs are named;
> > RISCV_ISA_V, RISCV_ISA_VECTOR, RISCV_VECTOR?
> =

> Good point, I've changed it to RISCV_ISA_V to keep it consistent with
> existing RISCV_ISA_C.

Hey Vineet, kinda randomly replying here but the wording makes it look
like you're going to take this patchset on?
If so, please check out v10 (think it was from April) as there are some
comments on that version that IIRC remain un-resolved.
Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
