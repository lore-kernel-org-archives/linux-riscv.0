Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5360C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 07:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/zoNx5SkqBLBIxQZCGb0sJw2xAcFIdQNQpqa7giNs6A=; b=NwN+u2vSQ69r56
	+/Ne7vHQu5mxWMwwq2u1Wt13C8XoYjroD8l/g6xcVHrh+N0hKroqOS2YWOdbypmzVGd3jZZjmsrEo
	cQ+ZGA+1VLgkxzwihS+/O5eNghtZiECYWWJ8cNSql5vjCes2qOxOoPVWswda9niQBWGAH3ks168hf
	9NJUw+LgQcsy6EtYCuCP+VikkPsmlru8yOv3GbHTg3yY/hLw40c72JAcpVbqLv910gTFyHTHMXoq+
	Kr6CdMD/OBJN9b2DMy++jfjQ4ThQ5SZqQLSJ41FcxZvm2HGU0UTJhPUEee6OiI3eh287HRsf/o5fN
	S0Uae2fca0NJBXtNYSoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy6pt-006H7v-CJ; Thu, 24 Nov 2022 07:39:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy6pp-006H41-Sn
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 07:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669275589; x=1700811589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5jayOGNCRzmZOnZq94GPZtulttwW/dTDlrUvW+mI14k=;
  b=q41808arggoP9LuHjvRbWukW4OWacX4qzWSp7U3IUNULzNzZO1IbBrDm
   m+ILDZ9I4WOv71bcGaIB/eFClxzSEwF2pmTAMJLSDC4GRLnmxsVs6tn8L
   5ATkQrY8gLPvZZpwVE0q3U3Is3PEvj8jTfRrC8NjDBFsE28CEnoVimh1f
   k2dZZHCgKyq+9DEFi0kTerIHZR9nby8tHeC38TXqsmgNge5qufx+ViwkH
   PftiMyRz2t/9jupEcXUOVFrR2KbDX4T0/O2QMc5pSiAIVRK8VoGAbdWgq
   nNytQM5IC+/GSIWJyvUa/DiJbFqZyb5wvqymu7Nbnw5T0O2J9Lgst8mc8
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,189,1665471600"; 
   d="scan'208";a="190390175"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Nov 2022 00:39:45 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 24 Nov 2022 00:39:45 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 24 Nov 2022 00:39:43 -0700
Date: Thu, 24 Nov 2022 07:39:25 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Deepak Gupta <debug@rivosinc.com>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <linux-kernel@vger.kernel.org>,
	<paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang
	<jszhang@kernel.org>
Subject: Re: [PATCH] riscv: VMAP_STACK overflow detection thread-safe
Message-ID: <Y38frY5H5mjCMvDR@wendy>
References: <20221124005006.1788315-1-debug@rivosinc.com>
 <A190DD6B-18A3-4DFE-AF8B-D5D50B6B6409@kernel.org>
 <20221124072346.GB1149630@debug.ba.rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221124072346.GB1149630@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_233950_023232_4D8B7D36 
X-CRM114-Status: UNSURE (   7.85  )
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

On Wed, Nov 23, 2022 at 11:23:46PM -0800, Deepak Gupta wrote:
> On Thu, Nov 24, 2022 at 06:30:35AM +0000, Conor Dooley wrote:
> > On 24 November 2022 00:50:06 GMT, Deepak Gupta <debug@rivosinc.com> wrote:

> > For stack traces, especially long ones, please cut out the timestamps.

> I followed formatting of stack traces in commit 31da94c25ae. Assumed since
> that's merged, that's how test and stack traces should be included in commit
> msg.
> 
> I'll follow your suggestion and remove timestamps.

It's just nice for the reader, since the timestamps are pretty much
noise. But it's not a "you must do this", unlike having correct Fixes:
formatting etc.

HTH,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
