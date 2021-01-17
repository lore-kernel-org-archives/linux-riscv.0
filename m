Return-Path: <SRS0=fQ+v=GU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1310C433E0
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jan 2021 04:58:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 197F522DBF
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jan 2021 04:58:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 197F522DBF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bVoldsLhvvIcniweT86MoTb57mdgE/CFXBXWUrUTf3k=; b=xOiVtCY4sEmh8kfcQxmiUS/Tn
	1VQeiM8GLLmSrWTo9tdLloYFDMhsTKhj3vQkir1SBPScqgBM5BlBNX3E50PYGCtHEHPSqd8IKeIZK
	gqtn+X7HgBD7+IDqmwfxHaZ4HcZ1bUCSNKM75SiNCwZEmhlblQ5n84YlcT8Cqp37tgyxEmKVKUPf1
	1dzjxGJElZggY/hMlu5Rahuz1gY9pVU3+POlHdqm/q/sqk5YiM+xa1eFUc1vMH7S0cGPNFFfdQkh+
	Z43zi+cnKItmWe3464RracxYBSJ1AVnWWpnN39Zni1+cxQcwSQzwwcip/VKmyfbBs8rnOSHGr08NT
	rx/zg1WoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1090-0000O3-VE; Sun, 17 Jan 2021 04:58:30 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l108v-0000M9-Af; Sun, 17 Jan 2021 04:58:26 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DJN1M1cKszl4mF;
 Sun, 17 Jan 2021 12:56:39 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Sun, 17 Jan 2021 12:57:56 +0800
Subject: Re: [PATCH v3 0/4] initrd: Use unified initrd reserve function in
 ARM/RISCV
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Russell King <rmk+kernel@armlinux.org.uk>, 
 <palmerdabbelt@google.com>, Atish Patra <atish.patra@wdc.com>
References: <20210115054606.124502-1-wangkefeng.wang@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <48c006a8-a352-488c-4981-768faffbe343@huawei.com>
Date: Sun, 17 Jan 2021 12:57:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210115054606.124502-1-wangkefeng.wang@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210116_235825_676478_6947F32D 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: guoren@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Correct Russell's mail address (from linux@armlinux.org.uk to 
rmk+kernel@armlinux.org.uk, should update the MAINTAINERS)

On 2021/1/15 13:46, Kefeng Wang wrote:
> Use the same implementation of initrd reserve to avoid duplication.
>
> v3:
> - split into four patches, suggested-by Palmer Dabbelt
> v2:
> - fix build error found by kernel test robot
>
> Kefeng Wang (4):
>    initrd: Add the preprocessor guard in initrd.h
>    initramfs: Provide a common initrd reserve function
>    ARM: Covert to reserve_initrd_mem()
>    riscv: Covert to reserve_initrd_mem()
>
>   arch/arm/mm/init.c     | 43 +--------------------------------
>   arch/riscv/mm/init.c   | 54 +-----------------------------------------
>   include/linux/initrd.h | 11 +++++++++
>   init/initramfs.c       | 45 +++++++++++++++++++++++++++++++++++
>   4 files changed, 58 insertions(+), 95 deletions(-)
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
