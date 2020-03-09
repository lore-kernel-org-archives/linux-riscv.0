Return-Path: <SRS0=yxlK=42=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CDF5C10F27
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2020 10:27:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7B0D20828
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2020 10:27:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KEM4+mYp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7B0D20828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-sky.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WO20CG5fseyHugPofVrQoeB5G/yzKX7DsmT814U+Jog=; b=KEM4+mYpOwl7wU
	bAQE9gdiF0QIyzkxzwQe2CqnnkJGysYbb0y6H2hRtaLIY4yRmISHiXlZ8IsW2MgdqnGw/avpxQNNP
	YpX+jwVlg7Kh1CWL0LkyjfpGtan78M9YLbFcVkHo93fyBqJrB7yySlfJmkqvM5U+Q1xLzDPdgL2VS
	obI0RIzvs0kvtZ2DyoqMuypHAS4zCqa2Xm+VSLeTv2ZNPW97rkl8i3bja0V7a0muMRC9SmTm7hKu7
	UpcdAbt/i3QmbxJ6PEQIMJfoG9A6dhNDaOFllg3469qQT+BYGsi00czD9I0kZqdiAUFXqD6LM2vOg
	2v53moCLxhMD6KXnefoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBFcz-0004pA-0s; Mon, 09 Mar 2020 10:27:17 +0000
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBFcw-0004oa-20
 for linux-riscv@lists.infradead.org; Mon, 09 Mar 2020 10:27:15 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1169725|-1; CH=blue; DM=||false|;
 DS=CONTINUE|ham_system_inform|0.0111236-0.0031218-0.985755;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03300; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=12; RT=12; SR=0; TI=SMTPD_---.GyXya.O_1583749628; 
Received: from 172.16.31.150(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.GyXya.O_1583749628)
 by smtp.aliyun-inc.com(10.147.41.143);
 Mon, 09 Mar 2020 18:27:09 +0800
Subject: Re: [RFC PATCH V3 00/11] riscv: Add vector ISA support
To: Greentime Hu <greentime.hu@sifive.com>, guoren@kernel.org
References: <20200308094954.13258-1-guoren@kernel.org>
 <CAHCEeh+XYD3uVmaQRGpY=VGxpO9hzMeKasNmAojhkZe9PJ9Lug@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <95e3bba4-65c0-8991-9523-c16977f6350f@c-sky.com>
Date: Mon, 9 Mar 2020 18:27:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAHCEeh+XYD3uVmaQRGpY=VGxpO9hzMeKasNmAojhkZe9PJ9Lug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_032714_323077_40E40FFD 
X-CRM114-Status: UNSURE (   9.39  )
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
Cc: linux-arch@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 arnd@arndb.de, Anup.Patel@wdc.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Dave Martin <Dave.Martin@arm.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 2020/3/9 11:41, Greentime Hu wrote:
> On Sun, Mar 8, 2020 at 5:50 PM <guoren@kernel.org> wrote:
>> From: Guo Ren <guoren@linux.alibaba.com>
>>
>> The implementation follow the RISC-V "V" Vector Extension draft v0.8 with
>> 128bit-vlen and it's based on linux-5.6-rc3 and tested with qemu [1].
>>
>> The patch implement basic context switch, sigcontext save/restore and
>> ptrace interface with a new regset NT_RISCV_VECTOR. Only fixed 128bit-vlen
>> is implemented. We need to discuss about vlen-size for libc sigcontext and
>> ptrace (the maximum size of vlen is unlimited in spec).
>>
>> Puzzle:
>> Dave Martin has talked "Growing CPU register state without breaking ABI" [2]
>> before, and riscv also met vlen size problem. Let's discuss the common issue
>> for all architectures and we need a better solution for unlimited vlen.
>>
>> Any help are welcomed :)
>>
>>   1: https://github.com/romanheros/qemu.git branch:vector-upstream-v3
> Hi Guo,
>
> Thanks for your patch.
> It seems the qemu repo doesn't have this branch?
Hi Greentime,

It's a promise from me. Now it's ready.  You can turn on vector by 
"qemu-system-riscv64 -cpu rv64,v=true,vext_spec=v0.7.1".

Zhiwei



