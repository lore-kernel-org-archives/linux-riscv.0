Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C3AC433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 14:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YbRQSZR75QX5TOVbySaMvJvEgZ/RBItokBUZLte6PsI=; b=s+4FD5y/2eulOoshpRkQWI4Yx6
	7xwfrArXGGjBk5JUdDQomAauQuEavpyZtHqh+S0TzNJSzRv3TbruBVXdnWIGpMStDMd+n61knk+xZ
	ed3ggvmzYGA9thWXtQft40mh8lUyiB5Qae/bXuKkIh8DprjKhaBIbL61DX/ys8Gk7I2U3DCr4yW7l
	YBoyPspIf9RSWcPUEsjYK5+Gu7j0VKBPt/7Ap/5mT/HgkuqhToVSHG2mSRSNOam/7qqsrwGt9QeYJ
	bXh6EDF/v3UK/IsiM2bw1TUQpMdXKgDEo+VMuYaRkTio3ALZByqg8QoJxL04IJJCZ5goSaGoo14oO
	57PeMJgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofinT-009vEH-BV; Tue, 04 Oct 2022 14:21:23 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofinQ-009vDK-BM
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 14:21:22 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net ([86.15.83.122] helo=[192.168.0.17])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1ofimx-009aVI-AG; Tue, 04 Oct 2022 15:20:52 +0100
Message-ID: <f91748e8-bec6-e19f-1b1a-dd6b0bda59cb@codethink.co.uk>
Date: Tue, 4 Oct 2022 15:20:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 0/7] Use composable cache instead of L2 cache
Content-Language: en-GB
To: Zong Li <zong.li@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 krzysztof.kozlowski+dt@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greentime Hu <greentime.hu@sifive.com>,
 Conor Dooley <conor.dooley@microchip.com>, Ben Dooks <ben.dooks@sifive.com>,
 bp@alien8.de,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 linux-edac@vger.kernel.org,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
References: <20220913061817.22564-1-zong.li@sifive.com>
 <CANXhq0qG-aEEHxWbtRgC+RO-wC36MtPUfu+eMpX89wOtqGJL0w@mail.gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <CANXhq0qG-aEEHxWbtRgC+RO-wC36MtPUfu+eMpX89wOtqGJL0w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_072120_438595_DCE1E4EF 
X-CRM114-Status: GOOD (  22.79  )
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

On 21/09/2022 06:09, Zong Li wrote:
> On Tue, Sep 13, 2022 at 2:18 PM Zong Li <zong.li@sifive.com> wrote:
>>
>> Since composable cache may be L3 cache if private L2 cache exists, we
>> should use its original name "composable cache" to prevent confusion.
>>
>> This patchset contains the modification which is related to ccache, such
>> as DT binding and EDAC driver.
>>
>> The DT binding is based on top of Conor's patch, it has got ready for
>> merging, and it looks that it would be taken into the next few 6.0-rc
>> version. If there is any change, the next version of this series will be
>> posted as well.
>> https://lore.kernel.org/linux-riscv/20220825180417.1259360-2-mail@conchuod.ie/
>>
>> Change log in v5:
>>   - Add a patch to modify aux vector for sysconf
>>
>> Change log in v4:
>>   - Change the return value from from ENODEV to ENOENT
>>   - Apply pr_fmt refinement to all pr_err
>>
>> Change log in v3:
>>   - Merged the EDAC patch into L2 rename patch
>>   - Define the macro for register shift and refine the relative code
>>   - Fix some indent issues
>>
>> Change log in v2:
>>   - Separate the rename and diff to different patches
>>   - Rebase the dt-bindings based on Conor's modification
>>   - Include the patches of Ben for refinement of printing message
>>
>> Ben Dooks (2):
>>    soc: sifive: ccache: reduce printing on init
>>    soc: sifive: ccache: use pr_fmt() to remove CCACHE: prefixes
>>
>> Greentime Hu (2):
>>    soc: sifive: ccache: Rename SiFive L2 cache to Composable cache.
>>    riscv: Add cache information in AUX vector
>>
>> Zong Li (3):
>>    dt-bindings: sifive-ccache: change Sifive L2 cache to Composable cache
>>    soc: sifive: ccache: determine the cache level from dts
>>    soc: sifive: ccache: define the macro for the register shifts
>>
>>   ...five-l2-cache.yaml => sifive,ccache0.yaml} |  28 ++-
>>   arch/riscv/include/asm/elf.h                  |   4 +
>>   arch/riscv/include/uapi/asm/auxvec.h          |   4 +-
>>   drivers/edac/Kconfig                          |   2 +-
>>   drivers/edac/sifive_edac.c                    |  12 +-
>>   drivers/soc/sifive/Kconfig                    |   6 +-
>>   drivers/soc/sifive/Makefile                   |   2 +-
>>   .../{sifive_l2_cache.c => sifive_ccache.c}    | 200 ++++++++++--------
>>   .../{sifive_l2_cache.h => sifive_ccache.h}    |  16 +-
>>   9 files changed, 158 insertions(+), 116 deletions(-)
>>   rename Documentation/devicetree/bindings/riscv/{sifive-l2-cache.yaml => sifive,ccache0.yaml} (83%)
>>   rename drivers/soc/sifive/{sifive_l2_cache.c => sifive_ccache.c} (31%)
>>   rename include/soc/sifive/{sifive_l2_cache.h => sifive_ccache.h} (12%)
>>
>> --
>> 2.17.1
>>
> 
> Hi Palmer,
> I was wondering if this series looks good to you, and could you please
> help us to take it into riscv-tree?
> Thanks.


I've given this series some basic testing, so would also like to see
this sorted out.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
