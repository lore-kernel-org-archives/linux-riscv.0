Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BD4C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 03:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	CC:To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+pFHpbKlTlaIC+caMvoR5vquP8HQv7r/Lw/bL084Mk=; b=b+Icq+rQpQ4N//VhxG3mtorePh
	lA/rmfbV0oWbKFxmPejsPzsDVRLBxLMRU94AoMmHxeifE7EVxKiNoVS/pCQfy5aMM9a74erQxT5Xx
	YMfZDLrcs168xzMSsYVTxU1Rq0s+QvPjE5+yfMSegd+31EzLgN/VE0YB2MO8xswnxkOAYorNXjHHh
	zz3exWgnyp1p3pOlU0HaxmT1ebOkggDo7wosDJtsppU2jrRegvdMz5T+g+Z6MHAflWV0jnl+lKVIw
	4omSdVSp9AMMEMHTFqeXlmNQC5RsmXtlPzPe2DUnGlagKudGazRfLT67bp9CG2bWW7iqbazmQvmhx
	wKhWh9mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhNIT-00BI63-Hk; Thu, 21 Apr 2022 03:15:57 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhNIP-00BI4c-Kl; Thu, 21 Apr 2022 03:15:55 +0000
Received: from kwepemi500014.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KkN2851SKz1J9wN;
 Thu, 21 Apr 2022 11:14:56 +0800 (CST)
Received: from [10.67.111.227] (10.67.111.227) by
 kwepemi500014.china.huawei.com (7.221.188.232) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 21 Apr 2022 11:15:41 +0800
From: "lizhengyu (E)" <lizhengyu3@huawei.com>
Subject: Re: [PATCH v3 -next 0/6] riscv: kexec: add kexec_file_load() support
To: <palmer@rivosinc.com>
CC: <alex@ghiti.fr>, <aou@eecs.berkeley.edu>, <bjorn.topel@gmail.com>,
 <ebiederm@xmission.com>, <guoren@linux.alibaba.com>, <jszhang@kernel.org>,
 <kexec@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <mick@ics.forth.gr>,
 <paul.walmsley@sifive.com>, <penberg@kernel.org>, <sunnanyong@huawei.com>,
 <wangkefeng.wang@huawei.com>, <liaochang1@huawei.com>
References: <20220408100914.150110-1-lizhengyu3@huawei.com>
Message-ID: <6e1970d7-8eed-11c3-1d2b-cfc1d5832f62@huawei.com>
Date: Thu, 21 Apr 2022 11:15:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220408100914.150110-1-lizhengyu3@huawei.com>
X-Originating-IP: [10.67.111.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500014.china.huawei.com (7.221.188.232)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_201553_867260_AE36728F 
X-CRM114-Status: UNSURE (   2.19  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

It is suitable for rc3 without changing. I hope it is good to you.


Thanks!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
