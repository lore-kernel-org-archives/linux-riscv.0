Return-Path: <SRS0=jpEU=45=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9E4C0044D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2020 03:14:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9BA720734
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2020 03:14:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DbDgZYEG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9BA720734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-sky.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4UtxKNFBCu+ZDny0Rj437/9GHJFid5ck579kjYMaaV0=; b=DbDgZYEGOH9SMs
	rIVN7G7t2iArQIPCmLnbp4mhkPeFjNnmqLv6v+CTO0jnL0MVxg2QYZLqfOxujXPeHNjbwb5vP0mtI
	c16Gevte7U/XZOWh49ZtfDFsE8+3dicvvInrD7HFuaC0E/VVR+re3klLyJ90Z7Rvnj0Q+k+MO7pqm
	9NxN1q1AICm2eGoJL3I2vg9atwKQuWth8ZJkRwzYdLQxPfgsrBAZ28lLXTChgN5OrBUnce/68RySD
	VNZUDWdH04nLmNLBzsiBFitwA8BxsZ/qJLtSvdRJiqTEWkLzW3LmRLXy4kUfw+cROSDwu/zV/dFkM
	9XBdoCD3vmjtst+/hgow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCEIz-0001Lp-F2; Thu, 12 Mar 2020 03:14:41 +0000
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCEIv-0001Kt-Jb
 for linux-riscv@lists.infradead.org; Thu, 12 Mar 2020 03:14:39 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07444842|-1; CH=green; DM=||false|;
 DS=CONTINUE|ham_regular_dialog|0.00684787-0.000191967-0.99296;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03267; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=14; RT=14; SR=0; TI=SMTPD_---.H-3cCKL_1583982869; 
Received: from 172.16.31.150(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H-3cCKL_1583982869)
 by smtp.aliyun-inc.com(10.147.42.197);
 Thu, 12 Mar 2020 11:14:30 +0800
Subject: Re: [RFC PATCH V3 00/11] riscv: Add vector ISA support
To: Greentime Hu <greentime.hu@sifive.com>
References: <20200308094954.13258-1-guoren@kernel.org>
 <CAHCEeh+XYD3uVmaQRGpY=VGxpO9hzMeKasNmAojhkZe9PJ9Lug@mail.gmail.com>
 <95e3bba4-65c0-8991-9523-c16977f6350f@c-sky.com>
 <CAHCEehK0rgBpEzrWar1UTWJoOz=OQi18iw4Y+v3z5Hi=7JCEWw@mail.gmail.com>
 <CAHCEehLq5f+DGusL0T4ZUuJ2hTRhSyLSGRpKHhq5b4J3nXfBHg@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <1da6bf25-431b-7b69-0b09-66dae4ad18ca@c-sky.com>
Date: Thu, 12 Mar 2020 11:14:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAHCEehLq5f+DGusL0T4ZUuJ2hTRhSyLSGRpKHhq5b4J3nXfBHg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_201437_847425_77E506E4 
X-CRM114-Status: GOOD (  14.91  )
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
Cc: linux-arch@vger.kernel.org, Alistair.Francis@wdc.com,
 Guo Ren <guoren@linux.alibaba.com>, arnd@arndb.de, Anup.Patel@wdc.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, wenmeng_zhang <wenmeng_zhang@c-sky.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 guoren@kernel.org, linux-riscv <linux-riscv@lists.infradead.org>,
 Dave Martin <Dave.Martin@arm.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 2020/3/10 17:19, Greentime Hu wrote:
> On Tue, Mar 10, 2020 at 4:54 PM Greentime Hu <greentime.hu@sifive.com> wrote:
>> On Mon, Mar 9, 2020 at 6:27 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>>> On 2020/3/9 11:41, Greentime Hu wrote:
>>>> On Sun, Mar 8, 2020 at 5:50 PM <guoren@kernel.org> wrote:
>>>>> From: Guo Ren <guoren@linux.alibaba.com>
>>>>>
>>>>> The implementation follow the RISC-V "V" Vector Extension draft v0.8 with
>>>>> 128bit-vlen and it's based on linux-5.6-rc3 and tested with qemu [1].
>>>>>
>>>>> The patch implement basic context switch, sigcontext save/restore and
>>>>> ptrace interface with a new regset NT_RISCV_VECTOR. Only fixed 128bit-vlen
>>>>> is implemented. We need to discuss about vlen-size for libc sigcontext and
>>>>> ptrace (the maximum size of vlen is unlimited in spec).
>>>>>
>>>>> Puzzle:
>>>>> Dave Martin has talked "Growing CPU register state without breaking ABI" [2]
>>>>> before, and riscv also met vlen size problem. Let's discuss the common issue
>>>>> for all architectures and we need a better solution for unlimited vlen.
>>>>>
>>>>> Any help are welcomed :)
>>>>>
>>>>>    1: https://github.com/romanheros/qemu.git branch:vector-upstream-v3
>>>> Hi Guo,
>>>>
>>>> Thanks for your patch.
>>>> It seems the qemu repo doesn't have this branch?
>>> Hi Greentime,
>>>
>>> It's a promise from me. Now it's ready.  You can turn on vector by
>>> "qemu-system-riscv64 -cpu rv64,v=true,vext_spec=v0.7.1".
>>>
>>> Zhiwei
>>>
>>>
>> Hi Zhiwei,
>>
>> Thank you, I see the branch in the repo now. I will give it a try and
>> let you know if I have any problem. :)
> Hi Zhiwei & Guo,
>
> It seems current version only support v0.7.1 in qemu but this patchset
> is verified in qemu too and it is based on 0.8.
> Would you please provide the qemu with 0.8 vector spec supported?
Hi Greentime,
vector-upstream-v3 only supports v0.7.1. It  is under reviewed in QEMU 
community.
Maybe I will also support v0.8 after it is merged.

As Guo Ren said, the kernel patch set works both  for v0.7.1 and v0.8,
which only uses the common instructions and CSRs.
> or
> Did I miss something?
>
> 489             if (cpu->cfg.vext_spec) {
> 490                 if (!g_strcmp0(cpu->cfg.vext_spec, "v0.7.1")) {
> 491                     vext_version = VEXT_VERSION_0_07_1;
> 492                 } else {
> 493                     error_setg(errp,
> 494                            "Unsupported vector spec version '%s'",
> 495                            cpu->cfg.vext_spec);
> 496                     return;
> 497                 }
> 498             }
>
> By the way, can I specify vlen in Qemu?
Yes, you can specify vlen through QEMU command line like
“-cpu rv64,v=true,vext_spec=v0.7.1,vlen=256”

Currently , vlen supports up to 512 bits, with a default value 128 bits.

> Thank you. :)


