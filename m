Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33838C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 05:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YtG0jnC+A41dnMRtNHaUKl87AjkkM1xY3zRqeIXeeo=; b=Wz+imoMWdqBDdd+n6mYGK5B0D2
	z6L9Z2EzXkfDVkXP/MAmPRfZfrOeuHhEeU8LHfzT76f6BZiZ2VsAqMGMPoCDuxDb9Z4UbiNr1EoBM
	750xaYJCN56EbhdVxYdb7vzUF85qMS676d570K5FQYzP2yKxAPdeYQYsva+I4Wozxb5fC0QwMKRdz
	qR/ixKG7UQ6dqTMXgmPL1QUKLbbpMKSs5jBQug3OLBWXFfbH6/qUripxSprbvIYAEKZYxma3APx10
	xRb0f1+WV72gYB4HekmSMa9frfdrayX2NYlwApu537kS7nuF+nfjMUup3qIf+gideiPg8m4dyt+pR
	fdgI7uMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1hmy-000Un4-3D; Thu, 16 Jun 2022 05:11:28 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1hmm-000Uip-TQ; Thu, 16 Jun 2022 05:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655356276; x=1686892276;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=NkEFYvNXfkRiyQzrKr5w73UFu/bNjvCsd8osZsw1FkQ=;
  b=KTMRPbhC+xr+A1GVOYVT0bIhBVhq86Ny0leExhksefx80t1FhI3mpDW6
   hdv7gcqXfx3C2C8m1KvM9ge9F2c1tkY4onq1qlyDRcVsgOcbLDzXt4ovu
   bbAAIoBzWKYJZzkGH1NgQKuS+ePzCtwvqp3XFC347ni+aaQy/yTnISBfp
   tDQ3dzZNGQ9QYwhxUlVNEf0cLBBVQbhp0F7xD7GDom6RvO6dCzT0RFkI0
   KMCjG4HTAqRipmL3Cog0g7GQ/a43ijvUeIlclga8nPI285DQlwfOcC2Ko
   OwKMFVDh+aDI3SYkQHgEwuiVQ6PMEf9LIXvCDHE+LbqUrgg83fvOngYlL
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="280201011"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="280201011"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 22:11:10 -0700
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="641365226"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.249.174.230]) ([10.249.174.230])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 22:11:05 -0700
Subject: Re: [linux-next:master] BUILD REGRESSION
 8cb8311e95e3bb58bd84d6350365f14a718faa6d
To: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>,
 Networking <netdev@vger.kernel.org>, linux-staging@lists.linux.dev,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>, linux-parport@lists.infradead.org,
 linux-omap <linux-omap@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 kvm list <kvm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 bpf <bpf@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <628ea118.wJYf60YnZco0hs9o%lkp@intel.com>
 <CAK8P3a10aGYNr=nKZVzv+1n_DRibSCCkoCLuTDtmhZskBMWfyw@mail.gmail.com>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <7a9f0c2d-f1e9-dd2f-6836-26d08bfa45a0@intel.com>
Date: Thu, 16 Jun 2022 13:11:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a10aGYNr=nKZVzv+1n_DRibSCCkoCLuTDtmhZskBMWfyw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_221117_025557_D61073DE 
X-CRM114-Status: GOOD (  10.01  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 5/26/2022 4:32 PM, Arnd Bergmann wrote:
> On Wed, May 25, 2022 at 11:35 PM kernel test robot <lkp@intel.com> wrote:
>> .__mulsi3.o.cmd: No such file or directory
>> Makefile:686: arch/h8300/Makefile: No such file or directory
>> Makefile:765: arch/h8300/Makefile: No such file or directory
>> arch/Kconfig:10: can't open file "arch/h8300/Kconfig"
> 
> Please stop building h8300  after the asm-generic tree is merged, the
> architecture is getting removed.
> 
>          Arnd
> 

Hi Arnd,

Thanks for the advice, we have stopped building h8300 for new kernel.

Best Regards,
Rong Chen

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
