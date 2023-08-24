Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E33C3DA66
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 02:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bIljG73YiVCj1WhKMKrpyNDxp7qC9M/sCw1ipBUzojI=; b=xlriHr9P6DCp0u
	NdI8zns1zjWaI5Khxuf+QKNVjofeGOml9ynRCtSMiLSkDjita2KAOydzd8x6AFvnXHRToDd9lr0Fr
	aMp9q5dONPjhzwYyFZQxO4wHG0X2BJx5W8Yd/R7lNnumkRR67v4KJQobrN85jS6/BYYOFpDYmNLo2
	cfeNnh07tGFXk32Z2iI7PLweMQdon3FUfOCvbZH77m3m+s9l8njg9QJ9XYe4sI4Lr4TRQPIOUwFmw
	lAVXK028mOrpqOoTX9ulwH/2R/wF9x5PlCpkti/3SMPV5xmdDxle9vTH0mdE9zHEtyDJLolfIXTSh
	RTLLnDWg5oghVuC+50Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYzjG-001w1x-1U;
	Thu, 24 Aug 2023 02:05:46 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYzjC-001w12-2z
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 02:05:45 +0000
Received: from kwepemi500020.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RWRDR1nSgzLp7y;
	Thu, 24 Aug 2023 10:02:31 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemi500020.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 24 Aug 2023 10:05:36 +0800
Message-ID: <53b858fe-8f42-ffc2-fede-4d5918e1e9de@huawei.com>
Date: Thu, 24 Aug 2023 10:05:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH bpf-next v2 0/7] Add support cpu v4 insns for RV64
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, Pu Lehui <pulehui@huaweicloud.com>
CC: <linux-riscv@lists.infradead.org>, <bpf@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Yonghong Song
	<yhs@fb.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, Song Liu <song@kernel.org>, John Fastabend
	<john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav Fomichev
	<sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Xu Kuohai <xukuohai@huawei.com>,
	Puranjay Mohan <puranjay12@gmail.com>
References: <20230824095001.3408573-1-pulehui@huaweicloud.com>
 <20230823185356.0db6cc1d@kernel.org>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20230823185356.0db6cc1d@kernel.org>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500020.china.huawei.com (7.221.188.8)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_190543_195138_D79237C8 
X-CRM114-Status: UNSURE (   3.43  )
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



On 2023/8/24 9:53, Jakub Kicinski wrote:
> On Thu, 24 Aug 2023 09:49:54 +0000 Pu Lehui wrote:
>> Add support cpu v4 instructions for RV64.
> 
> Please make sure you fix the timezone on your system before sending
> out the next version.

It looks so odd, will dig it out. Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
