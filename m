Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9DAC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 10:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m/WOwrTneAnvcivscHgyeNWtjf+OZguNKYyFeuxQDwA=; b=Pdy1SWB0QBvRxf
	/6poJHPkb+0ZbIMiBbKrzHDt1LORinQalVygnRZavxgMsbmkk5rN+XQSh+kiVwwl/XhP/LerEvofZ
	U0QKFj4R1w+KT3lYWb01zX/trFo77pnBC3OjIQVpnWjrOSWCBPWqld5ToqjPW33PfilT0mcisRuvK
	HNrGNDCDRZDx+JX+oPduesR79srxZouP7tB2gz3fnMmx7epNZ3AluPn6HyTuU8Cwh2Zg88M/SXhR5
	P60keKaWY4KCvtSNE0b8ExrxmFI72SdP+/Fe5iPnePqMFRpu7Q6itojBlqJPnb0ecdewJTvW/WmZh
	UbUJRCaQwZjkmyROmGIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol6CD-000EFh-Sh; Wed, 19 Oct 2022 10:21:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol6C9-000E4y-0M
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 10:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1666174865; x=1697710865;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Doivr+wgZN/Rz/fRhQp3xUvpBxG0TBrKhUsF2CC1td4=;
  b=a2PEy61gqeQdiL5jBKLNYKqNVQpfIBK2LSdHD9eIF9neumSR1Dm7a+Ir
   +5WCK0+n+ACkAghPcexRa9DMYhu6LL6mu5XJDDp8mMvPFuOldhCiN9C8B
   S6/4sVATrMXk17uKEh8RqetNAt4lXxTBQYBnuHHoPaktPellDzuUvYm+i
   wmyfmQYZtaEK3jgieMGzXJ5+Tkln7tvEBacfizKN3KHorW0PQl2eSqhGj
   7nHGiV7mtMTkrCxZBGOhg/SqDjczgfvyiuYuXNl8K4MywTgB9dzy63+kr
   XQO472xOt4aKMk853istt1dykB2tC8uGSkGJy9zd+WJDDuGklWwsyaaDg
   g==;
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; 
   d="scan'208";a="185373617"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Oct 2022 03:21:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 19 Oct 2022 03:21:01 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 19 Oct 2022 03:21:00 -0700
Date: Wed, 19 Oct 2022 11:20:44 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Cleo John <waterdev@galaxycrow.de>
CC: Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] riscv: fix styling in ucontext header
Message-ID: <Y0/PfL5SWNw8HCLr@wendy>
References: <20221010182848.GA28029@watet-ms7b87>
 <5631093.DvuYhMxLoT@watet-ms7b87>
 <Y0SDZEXQ5kXGJZLh@spud>
 <4763163.GXAFRqVoOG@watet-ms7b87>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4763163.GXAFRqVoOG@watet-ms7b87>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_032105_123069_79DE667F 
X-CRM114-Status: UNSURE (   9.37  )
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

On Wed, Oct 19, 2022 at 12:07:58PM +0200, Cleo John wrote:
> 
> Hey, because I am new to Kernel submissions I wanted to ask if there is a way for me to see / track how far this commit has gone in the pipeline of commits?

https://patchwork.kernel.org/project/linux-riscv/patch/20221010182848.GA28029@watet-ms7b87/

IIRC you sent the patch during the merge window, so it wouldn't be
applied for v6.1-rc1. You'll get an email from the patchwork-bot when it
gets applied.

HTH,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
