Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6FAC64ED8
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 09:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VXzD9zd9ytJppwlv0pj2k94vpb+d/1bt87zpc0Br+I0=; b=cY+zpysF6gnfHY
	myi/kVkXo8ZHSaBCeVU6UvELp0rSy9o0TpVHHqjffZ9QJ3CV0igx+s3PcQeLf5MV6a/RxjbMOSxa4
	iYd0UujZX3+NeF+Gh5ziUOIqsSnOjs54fpLPKhV7b5qTx0EpdRIijhd26JQSmkkGbvQojSm7HPKVq
	HQfYGROLVyjc1UU6JiTqDllqFtEs/ZbNkODhWenVNfFnWNKn1O7bzH5szhlbFe1mW70bXWjlNiDNV
	bwJeh0XcM0rHdBei6VzxNE6hR+XMORTZt2WfoJmhK8yoI8hDc3tebzIIkZQnnJYxGLuVtGa8YZzmz
	GdIU5VndLUrylflFiz1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWaHL-00980c-7L; Mon, 27 Feb 2023 09:58:43 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWaH2-0097rN-6s; Mon, 27 Feb 2023 09:58:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677491904; x=1709027904;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WLpJB0qI2/zRDKGnG+kitqzMLkyJLUqz1gpLf8+y3Pw=;
  b=PlC9UhwO3iZ+X+U+rY+V2CiZkJb5c8ZAh9BGeJngS91fgKHio3qK64hy
   vm1eQW3+NBVGrBTAWim3S83tiGrG1QukRqNn3jKSUJbf3cegAI8CpJC5q
   jH9DQxLYjHVkGHxjZEKXmThkj7h0tCWHcGo0fRBaimX0ykwmicxxi4LB7
   ShmbWdBx1uySvWfrRYKMaMUOKqwxecYIHArIoeJ6//GB0oLKPhursMExL
   RSjm1AF9PWcU7nZ/h7TXUceqSJs7KRwY+/sv5ryafWDit33kd5/QgHO9U
   xAwhCCmr66W1S/v/XdyviJRQ40JNT9FVm944YucpynEBI4/Q2LcDZamWt
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="361380481"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="361380481"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 01:58:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="847757997"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="847757997"
Received: from jrissane-mobl2.ger.corp.intel.com (HELO intel.com) ([10.249.41.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 01:58:16 -0800
Date: Mon, 27 Feb 2023 10:58:13 +0100
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
Subject: Re: [Intel-gfx] [PATCH v5 7/7] drm/i915/gt: use __xchg instead of
 internal helper
Message-ID: <Y/x+tckkW3BbHBYa@ashyti-mobl2.lan>
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <20230118154450.73842-1-andrzej.hajda@intel.com>
 <20230118154450.73842-7-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230118154450.73842-7-andrzej.hajda@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_015824_291527_C325056C 
X-CRM114-Status: UNSURE (   8.41  )
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

On Wed, Jan 18, 2023 at 04:44:50PM +0100, Andrzej Hajda wrote:
> Prefer core helper if available.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
