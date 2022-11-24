Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE32C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 11:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FqAXyN/KBbzzVbVsi0egBB+iRDhHHA+ZMVuMNca+1Ec=; b=zuexZJDGClzBLs
	gBfnBhEXcZIepxXG3161EjoOYjek5WuET3N88uLIc9oRU4dLzeDXzO617VI9bkqXLswMr1dMIznSc
	zzDT/RT3y7mf9Iy5FUpeB5w+deKIOTfFecFhD2vPbuX0iGE8EtgsrmJqP3J+5a+cEVMM6rCCwRs1T
	sAdZTen8Zk4kKpr47mrUzll6G4n8qSQyZ+EH9c13wnxrEGNJ6V3q0pu3HSi9SbIUkWm3TyawDRhQJ
	7ZJJwsjEVNWxZr0rSrR62BbBvq3b+Spw7NakfLY691Dsba1jTQUlgDr9rYKhWKDuSZXYJlP3STCHT
	DJF9ToUumbNofJ8nIhbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyApH-008DRr-1H; Thu, 24 Nov 2022 11:55:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyApE-008DQh-IK
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 11:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669290928; x=1700826928;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=55nH4LmzDK+5WNB9MoXsKRknvVrM2IQDWXw3Al5UU80=;
  b=EDy6qYR8OiqLFY9zK45oL63khFfMVHFVedyC8cO4xaHg3udrXdxyeSU8
   xQSjz1mnID1Q+wNM3flz+a9zk88mUh5AbRPCKaiUbJ0on0Ly1Y7YHlEsn
   IyhBMbGj2MW0eaMmmL1f5HRQrWjvV0BZ1ATDNrHLDQf//H0TQu4blVmQy
   XGS8N3UGxbigQNr/UFk7C9F4DZiAdJLCdxknozEXVNb+2y8Sj6/T+XCpP
   5YnRIruMCKnwRccuUvbGkVFe9ypLrzBoXFO0YmUuS9g1XbgXrn8kLHs40
   wiUt1QWhRWIU4BR2Mz8S9yP94mmEGBWIyCeQWt6Y0hkau1sA0u4LsEp+R
   g==;
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; 
   d="scan'208";a="124940786"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Nov 2022 04:55:27 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 24 Nov 2022 04:55:23 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 24 Nov 2022 04:55:20 -0700
Date: Thu, 24 Nov 2022 11:55:01 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Samuel Ortiz <sameo@rivosinc.com>
CC: "Hongren (Zenithal) Zheng" <i@zenithal.me>, Palmer Dabbelt
	<palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Atish Patra <atishp@rivosinc.com>, Anup Patel
	<anup@brainfault.org>, Eric Biederman <ebiederm@xmission.com>, Kees Cook
	<keescook@chromium.org>, <linux-mm@kvack.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-api@vger.kernel.org>, Michael Kerrisk <mtk.manpages@gmail.com>,
	<linux-man@vger.kernel.org>, Jiatai He <jiatai2021@iscas.ac.cn>, Heiko
 Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v3 2/3] RISC-V: uapi: add HWCAP for Bitmanip/Scalar Crypto
Message-ID: <Y39blUaC/jHiOYCk@wendy>
References: <YqYz+xDsXr/tNaNu@Sun>
 <YqY0i22SdbHjB/MX@Sun>
 <Y385rS/5zDaDJ3Os@vermeer>
 <Y39AXYPFzSiBngwI@wendy>
 <Y39Lwp4rQc3Qkl0i@vermeer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y39Lwp4rQc3Qkl0i@vermeer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_035528_683910_08A7DFC4 
X-CRM114-Status: UNSURE (   7.40  )
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

On Thu, Nov 24, 2022 at 11:47:30AM +0100, Samuel Ortiz wrote:

> Patch #1 is definitely needed regardless of which interface we pick for
> exposing the ISA strings to userspace.

I took another look at #1, and I feel more confused about what
constitutes canonical order than I did before! If you know better than
I, and you probably do since you're interested in these 6 month old
patches, some insight would be appreciated!

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
