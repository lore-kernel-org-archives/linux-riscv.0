Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935E2C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 14:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=/kYc250qLnQt1wa0gxhwh67+7WhXtagMmIi/aH0E638=; b=PVDyx0NV6BrDLxJOwY4aGqV30r
	o3FvvXC0EYXFU1TiDX/lhIfXVGZ15fVTxMplkVLrs5S2tUOtS9en3zCTWRngvgzolISIjSJtijYZh
	YGLiYrG4S9X5qcrRi3X2XBFlFb2onn8hEZbTm0KLRqcAMrChNvlub6RnZfS6EQdSSwATUGfMI7pEW
	qlI+nnsDZ/VsBElUuFnXV/AcdghKdFrAdcqfsPege9Dl+oR5lf73XTbSYKRbA0pYmgYEFZ0/K/6FU
	Kna5Kq7dCo4wkJXmG0nowPI8m16lyn7kLxwL0lKshjU3weEJFC/V2ZJhgTWvRXdnpTNAVOZHEcx18
	DDwFYgIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8hn-005dux-1r;
	Wed, 19 Apr 2023 14:22:43 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8hk-005drE-2W
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 14:22:42 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-247048f86c7so1893015a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 07:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1681914157; x=1684506157;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9yB70xeJV1N0ZlteQUIRM4Nk0DPs/RCkhgDAa0rx6NU=;
        b=FGr5Z0zW4TGX3/eVr4y3eJPb2jFX9DbliZVi7umZ2GZlwZ+2GsTc/Xh2fkFs9PUu+F
         WAt3LkmHaWOmFIYENjePl8OoWg21kk335vx0Ap0xvGiTHgo2NMY39AeP3YfuDdK+dnCF
         gkGN+ntnQkXyV8zhwtreIXNDsm6tMkcMYpCRyEllxz1jzmoPguDZBEARb27KEbOyLr+6
         sRYhlmkSp1nDK6KovQcJ60RG4sT4q3IJxazWV5Vk9t1H+vaHdeRXnfIe5fAUS3i5Z4Y+
         LZzpCNezRR/YdHW14aU5gzBuMCvvX23ts/K/yIVQikCFrQKpNDo721r/VZg8F6FCWLjb
         6eug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681914157; x=1684506157;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yB70xeJV1N0ZlteQUIRM4Nk0DPs/RCkhgDAa0rx6NU=;
        b=OmiP0VYMOiU3MGIOJmV5qjn5eSFs9etaZA8lenNEIHFZ0X6bB0Bk21CgmeCNed6E1O
         nbYPNpEtGLMbJFN6WNcALWk1aFi99fqVE34ky3755gkpIYuzPCFpggu4ZmXoTbL3fnG2
         Gw92AxzBK+MhdUHVKmbpZJxMwl0Nix1591NE7uNRuCSD3+yQHU0dVP5k30eduIXLu857
         H1m5KuDPWV2Hno/Z+KHo9qUVrBTeH5IWoWVRwSymAnOe5iy6glA3+MTfHRhlEPq2+7H1
         3hB5o9TlYcpRKnPAWJ3tE4aNSOTbz5ykkZHIlGFe8aLA51UOzHRTi0K/8z+DHpU7Zuer
         rKFQ==
X-Gm-Message-State: AAQBX9dbRdXGlAD8ucluy0aE26qQ8re07J9SlysrE0BpzjzocaZqPqge
	LHu7NDHYB3BEwc3YKw382I4Gdw==
X-Google-Smtp-Source: AKy350aHkXwf30YbPEbBzVJv8xaBmpUhBvlebeT1NzRnd6NI8H7duPFB3Lfsb9xeVpykk8F3OPFYiQ==
X-Received: by 2002:a17:90a:b28b:b0:23f:29a:5554 with SMTP id c11-20020a17090ab28b00b0023f029a5554mr2484436pjr.48.1681914157446;
        Wed, 19 Apr 2023 07:22:37 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id jl12-20020a170903134c00b0019fea4d61c9sm11512208plb.198.2023.04.19.07.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 07:22:37 -0700 (PDT)
Date: Wed, 19 Apr 2023 07:22:37 -0700 (PDT)
X-Google-Original-Date: Tue, 18 Apr 2023 20:30:26 PDT (-0700)
Subject: Re: [PATCH V2] riscv: export cpu/freq invariant to scheduler
In-Reply-To: <20230323172403.nfrtgm5vea4qvinu@orel>
CC: suagrfillet@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ajones@ventanamicro.com
Message-ID: <mhng-d4a888a4-a2c5-4520-82d1-b8eb66a7f3d1@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_072240_819205_6E47BBD4 
X-CRM114-Status: GOOD (  19.33  )
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

On Thu, 23 Mar 2023 10:24:03 PDT (-0700), ajones@ventanamicro.com wrote:
> On Thu, Mar 23, 2023 at 08:39:24PM +0800, Song Shuai wrote:
>> RISC-V now manages CPU topology using arch_topology which provides
>> CPU capacity and frequency related interfaces to access the cpu/freq
>> invariant in possible heterogeneous or DVFS-enabled platforms.
>>
>> Here adds topology.h file to export the arch_topology interfaces for
>> replacing the scheduler's constant-based cpu/freq invariant accounting.
>>
>> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
>> ---
>> changes from V1:
>>   - fix the leading underscore and tidy the patch up
>> ---
>>  arch/riscv/include/asm/topology.h | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>  create mode 100644 arch/riscv/include/asm/topology.h
>>
>> diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
>> new file mode 100644
>> index 000000000000..727e8d163a3b
>> --- /dev/null
>> +++ b/arch/riscv/include/asm/topology.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _ASM_RISCV_TOPOLOGY_H
>> +#define _ASM_RISCV_TOPOLOGY_H
>> +
>> +#include <linux/arch_topology.h>
>> +
>> +/* Replace task scheduler's default frequency-invariant accounting */
>> +#define arch_scale_freq_tick	topology_scale_freq_tick
>> +#define arch_set_freq_scale	topology_set_freq_scale
>
> I was thinking all the right hand side would line up, which means
> the above two need additional tabs and so does topology_get_cpu_scale.

I don't see a respin, but given that the feedback in just whitespace 
changes I've got and picked this up while fixing the whitespace.

>
>> +#define arch_scale_freq_capacity	topology_get_freq_scale
>> +#define arch_scale_freq_invariant	topology_scale_freq_invariant
>> +
>> +/* Replace task scheduler's default cpu-invariant accounting */
>> +#define arch_scale_cpu_capacity	topology_get_cpu_scale
>> +
>> +/* Enable topology flag updates */
>> +#define arch_update_cpu_topology	topology_update_cpu_topology
>> +
>> +#include <asm-generic/topology.h>
>
> I'd also prefer a blank line here.
>
>> +#endif /* _ASM_RISCV_TOPOLOGY_H */
>> --
>> 2.20.1
>>
>
> Otherwise,
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
