Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7E2C64ED8
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 09:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CLgch2q1AlysA2nxPVIqwOV5whQWXdLe2mn6Hg5QEms=; b=0Qh3g7+1QaTqeQ
	kdp05CwxKbI5hBqj8gOfrosXXAis98e1MLrjLpV4kIlYUgxER9Q0hp39pdDa0Glw3cISGduTmcic1
	O8hur3nDy9/+Fi1op7FaQgSfYZiZMtu3rk2W5iBpis4d2FR1LuNvYGmdVlWIXERQXKSyaHjlp4ETp
	/0zR9cFgAt10P/wyxb/+uxFXuhB0dD1SQdpnZTdlWEkKKtD6my7atVFy+VXVj+VpHUMqW3uCEMZdd
	Os7KKuWNYPocwyg4/LQSxT1MezTlU75FXGaU73XGSJqQX6f4quXfkwTHa2YjoSb/BXZt5Rn3EYh8C
	qZYlKmKqwby5OlboRzfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWaEp-0096sH-EG; Mon, 27 Feb 2023 09:56:07 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWaEX-0096io-DW; Mon, 27 Feb 2023 09:55:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677491749; x=1709027749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2+o9dIFNlD8/pbPtj1kqozcC4rPUj0z7l8HRWh7LVuA=;
  b=NfqlIMOmVtm1ESwNyPCLmajAYr+qXHKgH5btFKSoxOuvGUujqtsF3xoM
   pkpZB19G7xJpEEBpIR1Z+R8uIEJY+0fXYuUYGYmXswsHU4IesWRa3wEFD
   Px4NgwdXZ5aCcZvJOVo1b0C7Gi+nvFc1vi/6xWmXNHyFGy+4Ams6ytJNf
   hKU+TGK4uQZcYpkcR4ymFSlFlKzVdPZBJzmXJjDEJ72R9+Ycw++Tr7xuM
   b1K9/zKPazyb7k46ejTveEc5AXX5ZCs8hfx2kWRzaylH2QRRzL00uYGef
   U9fvsggisOPd9NleqjSO3AgfOlZ2q7/jkPZgzd9b+YGI1Fhqw773JVPw1
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="314247207"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="314247207"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 01:55:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="816570294"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="816570294"
Received: from jrissane-mobl2.ger.corp.intel.com (HELO intel.com) ([10.249.41.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 01:55:39 -0800
Date: Mon, 27 Feb 2023 10:55:37 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 4/7] llist: simplify __llist_del_all
Message-ID: <Y/x+GTZzRJ7ExEPd@ashyti-mobl2.lan>
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <20230118154450.73842-1-andrzej.hajda@intel.com>
 <20230118154450.73842-4-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230118154450.73842-4-andrzej.hajda@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_015549_500589_B61DBEB5 
X-CRM114-Status: UNSURE (   7.43  )
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

Hi Andrzej,

On Wed, Jan 18, 2023 at 04:44:47PM +0100, Andrzej Hajda wrote:
> llist_del_all uses xchg, let's use __xchg here.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
