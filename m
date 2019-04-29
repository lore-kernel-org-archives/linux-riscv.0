Return-Path: <SRS0=9XXM=S7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 354DAC43219
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2019 19:52:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04B8221670
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2019 19:52:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DKTM18HR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="iVUf2/db"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04B8221670
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i9/Bhl5lDtX4iqrIwnX9EHvucSHlmQxWdHUZ6kPplPQ=; b=DKTM18HRLYIFn88slp05yo4SL
	xFCBRCpxd558ax9h6/p+wN3+XmDY6oi4DPg06vjn+SM0pajO/6Q34eOiyG6VQkjbYTaD33jO/NfRx
	qcQLgLQFjokRWJquEC/4TfY/s5ckcTqNgt/Si2ffnIzNpMdrGrUfmBKUO9KoNBLqll/lH4U7L3rvP
	RG06DK6aNCNWxH/gjEbj2iJCPnRKE2V2Lu/yU+eiYXmx45NpVXIxm9WQiHcB/Uo36knLsaMReuxcN
	iVwYcmPBiRWLO9GCTvuTJO6zzCJSIqY6SfuO7YWHk+sFniJj6zq3RriZLIl/larzP9JHTCNr6FTnr
	/eRM9/aww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLCK8-0002Ef-9L; Mon, 29 Apr 2019 19:52:24 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLCK5-0002Dx-Be
 for linux-riscv@lists.infradead.org; Mon, 29 Apr 2019 19:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556567542; x=1588103542;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=iGR4Zs5nDuCr/SyO0IMhqYsZGxQL5/GTdmx0tD7WxoM=;
 b=iVUf2/db3wKEfbxl+FGGlGZoOzGO3JuOw9ThRthua4WkU4OB2+SwxpAD
 JNWDqhmOyRDLLQC6FCthJRwjkdyffUCve55U9AardZxSSpXymZYZjNcXT
 ncg/rh+7RKuf9uN0MsIcwJCxVoDBiFTFZPgNvE+wZTXmZJIx1ZYNd/4G+
 CWNWdpyggGeQkrgI2Rf+jrMp+tsM+9qygErl8uFqKE7sBP+ZQLkCABQUF
 RCfhfw36QiPjGW83a5xOZTRPJYztGG9jbq8GOvHNxpr+8aytEoiQ9xVKN
 SaoIw4OlogeLbvUn8gR+CidX+rhbPS0YXgXIHzhCSQm/xSc+slZg1oWMY A==;
X-IronPort-AV: E=Sophos;i="5.60,410,1549900800"; d="scan'208";a="108822904"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Apr 2019 03:52:20 +0800
IronPort-SDR: FGYNlUQEfQUYvysrbuOOscXialXdJf/y1G/M/vS3xKhQMXMFRW5I7HcW0es8FIMufuK+7D9iCT
 59MoNsDGO6Py94yg2wfOJmVXP7e3nliI2SW7MwZldwNxQZsr6VV5neJ9TNkA6EZyV+Fzj8zWGQ
 1EFzpTdSe250hFBux+FiFBX10MoxVezefF4wpSJ6FOj9/L/O/b8rtQ558/AF255N+8xSG2QeZD
 vQn12dNSkBOb20bMT7YdWIVDgnKi6tv9+xmztwFxtGz7mVttgHyqABSfGwqbLDyt/s1cVvA5AZ
 i2/ZEUvm/2ilTTRxzgH7vyWt
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 29 Apr 2019 12:30:50 -0700
IronPort-SDR: WCTsEeq+jdWM9wWQFiffEKgZ2ajy+EgpnirMSVaJ0tEi4A8l36v+D7tfZ6G59yMlywONSSNZ1X
 n22P6upFjfVXOl7H4ZV47RVT7HgJAmFl2r5v64s4HTUvhSoe+XA4fqmcU6Y83wdC4eiadY8KCS
 1d1eUj5vmaac3eO0xjOVEiBdeFfClh/74oFrnoWCsCYXMaVdHGe+okInPBRTabZUbl23ghneos
 t+80OXpBGVIK59DaOffRqEzqU6jFoJlH/VbDehXFTeycX4DbkaXGACaVIIDJpLyKEZcrdMCTyM
 iS8=
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.66.167])
 ([10.111.66.167])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Apr 2019 12:52:20 -0700
Subject: Re: [1/3] x86: Update DEBUG_TLBFLUSH options description.
To: Borislav Petkov <bp@alien8.de>
References: <20190410224449.10877-1-atish.patra@wdc.com>
 <20190410224449.10877-2-atish.patra@wdc.com>
 <20190411065617.GA29422@infradead.org>
 <580d95d1-224f-a372-c656-1d2cbb19d868@wdc.com> <20190414142709.GA569@zn.tnic>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <956163a3-9a9f-ac12-b429-eb592bce815b@wdc.com>
Date: Mon, 29 Apr 2019 12:52:18 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190414142709.GA569@zn.tnic>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_125221_437953_560F35A5 
X-CRM114-Status: GOOD (  13.34  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <anup@brainfault.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Gary Guo <gary@garyguo.net>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Ingo Molnar <mingo@redhat.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/14/19 7:29 AM, Borislav Petkov wrote:
> On Fri, Apr 12, 2019 at 01:14:54PM -0700, Atish Patra wrote:
>> On 4/10/19 11:56 PM, Christoph Hellwig wrote:
>>> Given that this option enables generic code (which you reuse for RISC-V
>>> later in this series) please also move the config option to
>>> mm/Kconfig, proabbly keyed off another ARCH_HAVE_DEBUG_TLBFLUSH
>>> symbol that the architecture can select.
>>>
>>
>> Sure.
> 
> And when you do that, instead of deleting the help text, make it
> generic. Otherwise, there's no explanation anymore, how that option is
> supposed to be used through tlb_flushall_shift.
> 
Not sure I am following you.
tlb_flushall_shift knob was removed by
commit e9f4e0a9fe27 ("x86/mm: Rip out complicated, out-of-date, buggy 
TLB flushing")


Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
