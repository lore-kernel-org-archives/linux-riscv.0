Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B755C4321E
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 10:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RAouOUynZpIiClKFlRjpHQ1CMbq7Fy+0yldcIWS31Ys=; b=272mSB4m62IkyI
	A3EgdR3/hz6gZlI0SMKXFNRqSGwNugL+UqZKIJtKaoWs/7K26xox574kyFg+62t5t/+GIrTmOlk8f
	yJYwEauLJpjih1hIgNOS/o58FzNJIJX17/sMlLejA9YybkPLmH2C2PDbvYOUhJyZgvAGBrpTuaKZc
	09wA1BI0+gHrj0OOWfGQyX/lJsiEpV3rFAdeVAF8KCoNhfSJCYdxxWw5auMe7EYIElFHVe7lkjwFF
	pUtfiYdUQELUnpJQa7lpCnAeup109IIrwPhdszFKKUNb9GoMlK+USS/L7g2gqDODJymQ5jHpZLukx
	xeA4uQprmnatq27N1INA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3nT-00C9Sd-Sx; Mon, 21 Nov 2022 10:13:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3nL-00C9JA-Oe
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 10:13:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669025577; x=1700561577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pVdeoOFj7fYuCIS5ieay2j91M7ujDPFCdZJ8zE193G8=;
  b=FBlHRDxnZIkFVaNvxbx2jA7GJ6zdWCVRm1TJX7VuGpWD28buRiycC2WK
   3CNP3EYBNbk8v4z68yXytf0zncx1/c5TZF1KTEVW4k2KCFXAHs1GBDJ5n
   IQkNEEZrYqQCHuEV9Ec7ZJQbCRULr9caMhgYaJ0FwPpcIKX0pqVE44AcO
   l2R9wTN5D3fVaOxIa1zQ4xVWhCT7XD7gqXrPVOH99ZXS/g8c/JiTshhNX
   iOsyZyWC8xwqfazVqnwNXEhkYKBimmmTPJ/ZYcL07kyFN4mABUE+zcl8k
   1FI0yg65mrV+YQZkmkF+PjETWcfDBwC44OvL4gLMDPhD2cMR9k/DQKwSR
   A==;
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="189821766"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Nov 2022 03:12:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 21 Nov 2022 03:12:52 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 21 Nov 2022 03:12:50 -0700
Date: Mon, 21 Nov 2022 10:12:32 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: <guoren@kernel.org>
CC: <palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<mhiramat@kernel.org>, <changbin.du@intel.com>, <zong.li@sifive.com>,
	<rostedt@goodmis.org>, <boqun.feng@gmail.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Changbin
 Du <changbin.du@gmail.com>
Subject: Re: [PATCH V2] riscv: patch: Fixup lockdep warning in stop_machine
Message-ID: <Y3tPEDvM3aVJmVxF@wendy>
References: <20221120101049.2078117-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221120101049.2078117-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_021258_302124_2C9A55AE 
X-CRM114-Status: UNSURE (   8.78  )
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

On Sun, Nov 20, 2022 at 05:10:49AM -0500, guoren@kernel.org wrote:
> From: Changbin Du <changbin.du@gmail.com>

> Fixes: 0ff7c3b33127 ("riscv: Use text_mutex instead of patch_lock")
> Cc: Changbin Du <changbin.du@gmail.com>
> Co-developed-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Zong Li <zong.li@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> ---

Hey Guo Ren,

FYI you're missing a SoB from Chanbin on this patch. They gave one in
their v1 though so you should be able to re-use that?

Thanks,
Conor.

> Changes in v2:
>  - Rewrite commit log with lockdep explanation [Guo Ren]
>  - Rebase on v6.1 [Guo Ren]
> 
> v1:
> https://lore.kernel.org/linux-riscv/20210417023532.354714-1-changbin.du@gmail.com/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
