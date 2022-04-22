Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB44C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Apr 2022 16:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=tRN497/VtRYVyettC6y438Rdo+ziHsq+GDi6DxodUSg=; b=Ea9GUv+SVfonXXrpZcwuzXeLlh
	YdNZuZa4yh4Yt1sI6pEtizgILteu81dWAM6Jm/ICCOEqu68D/IOv7z3MwOMWUnaJqQveqi8IlS11T
	cjVpfaV5Cf69zFin59pKZWWhSozQOUd46UociA/3DFo5/4R6rkIqivIdIHso9IUUJh5jeMiuqqnIG
	TX/lzX18PO9TIP14iolWk0mgLsulo3HUBHjWz11s1sKHBYeMI8H8QnrKR0szT7yWkYGAqOpzM1FBM
	4WgBngCtM2bybwMlj5VAIbl4bQbVYV4gFaL7arv3Z5WTmqtRjD/E/7ODvINPIMugN9SD9nrnlk66K
	1VrqAjbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhvmS-001JEe-Ec; Fri, 22 Apr 2022 16:05:12 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhvjR-001HsC-Vt
 for linux-riscv@lists.infradead.org; Fri, 22 Apr 2022 16:02:08 +0000
Received: by mail-pg1-x52e.google.com with SMTP id g9so7644302pgc.10
 for <linux-riscv@lists.infradead.org>; Fri, 22 Apr 2022 09:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=j/DRPoony39xAyuEQEwrygpJFCr5xS/J71HzZSlHAsc=;
 b=1y65yY7vuM94Cb2DFLSypSKF3EfFIP9EEDZRMMYc7BNAIb8kyV8SH6oP88tqWE12cT
 bce6V1dKCmTJjTmD4azRKGLTHybtP3QUiTBhPBKFR+yxwV4ExgYQEJk251glzy/kuPaN
 lkE9bNd+T3DehLal6fE7fziEnzYMuRh3+ayZRXciw3BXIu2uGLYqzUR7onwoWDHOm5Yl
 cd4g/julRzttzHSCmCBNZBZVI/ZY2alBNtfN1TfkY2tnhSVZsE6s9iKOktgVsYTG24zW
 TSvQdnMRVkjx4q5I6E6A8k6PJULytKbVh4wG8f6qdBporN3yw+5oPZNNMRBNY2hkTCkC
 PaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=j/DRPoony39xAyuEQEwrygpJFCr5xS/J71HzZSlHAsc=;
 b=X/NHJzJM03LaZrIeb11ugYbuWGMXfipgPpYTb+M+ER5GdQriB1IGbCAoRxfxOnE+Z9
 FccYIdoO7ZdVdZzZde724Rs5wXb8cctwnbMCTgxbmMJ3XC3ZOhOuCza5lLSzHeFd2xJT
 JAsjXeJ4+V01nbD2ldPw338RPNkx19tn3x6ZkrHcQSpgL1ipC9t/H68jTGGZoFXyfhy3
 X9gQfB5u3J1DXEduWclvh1nEE3B1Pu250vmjRxHFANlhwLjI6HZ/+XhCjnd5ItQDhy9d
 84Ayj1wAe+PVw6TXC2X9n4tQMYAuLizYqvat79nJ+TgfT6ljqwwPRzjpE53lKHLOzTfA
 N2WQ==
X-Gm-Message-State: AOAM533N9lTnY8tHOkK6bjTuV8QocBPKR6KWUCnbOBTkRfj6ypS0FS9d
 z+xVUy6MZ3UIdM2Lpkrbwhzoew==
X-Google-Smtp-Source: ABdhPJwmDrwA2ZAu5Q1rVNeT+8sU2e3D7ENPevc7XxVgU67wZEV6rG4NaJpcRjtQFBgIZVoVIxhMEA==
X-Received: by 2002:a63:5421:0:b0:3aa:5717:fadb with SMTP id
 i33-20020a635421000000b003aa5717fadbmr4478084pgb.422.1650643320884; 
 Fri, 22 Apr 2022 09:02:00 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 e6-20020a17090a77c600b001cd4989fedcsm6512927pjs.40.2022.04.22.09.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:02:00 -0700 (PDT)
Date: Fri, 22 Apr 2022 09:02:00 -0700 (PDT)
X-Google-Original-Date: Fri, 22 Apr 2022 08:35:09 PDT (-0700)
Subject: Re: [PATCH V3] riscv: patch_text: Fixup last cpu should be master
In-Reply-To: <mhng-320b7f4f-08bf-4ee8-938e-4bf687760468@palmer-ri-x1c9>
CC: guoren@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-arch@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 guoren@linux.alibaba.com, mhiramat@kernel.org, stable@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: guoren@kernel.org
Message-ID: <mhng-d2e23c07-fd6f-4ae8-a2c7-fc1825e50503@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_090206_336274_FC207D9F 
X-CRM114-Status: GOOD (  19.90  )
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

On Thu, 21 Apr 2022 15:57:32 PDT (-0700), Palmer Dabbelt wrote:
> On Wed, 06 Apr 2022 07:16:49 PDT (-0700), guoren@kernel.org wrote:
>> From: Guo Ren <guoren@linux.alibaba.com>
>>
>> These patch_text implementations are using stop_machine_cpuslocked
>> infrastructure with atomic cpu_count. The original idea: When the
>> master CPU patch_text, the others should wait for it. But current
>> implementation is using the first CPU as master, which couldn't
>> guarantee the remaining CPUs are waiting. This patch changes the
>> last CPU as the master to solve the potential risk.
>>
>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>> Signed-off-by: Guo Ren <guoren@kernel.org>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>> Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>
>> Cc: <stable@vger.kernel.org>
>> ---
>>  arch/riscv/kernel/patch.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
>> index 0b552873a577..765004b60513 100644
>> --- a/arch/riscv/kernel/patch.c
>> +++ b/arch/riscv/kernel/patch.c
>> @@ -104,7 +104,7 @@ static int patch_text_cb(void *data)
>>  	struct patch_insn *patch = data;
>>  	int ret = 0;
>>
>> -	if (atomic_inc_return(&patch->cpu_count) == 1) {
>> +	if (atomic_inc_return(&patch->cpu_count) == num_online_cpus()) {
>>  		ret =
>>  		    patch_text_nosync(patch->addr, &patch->insn,
>>  					    GET_INSN_LENGTH(patch->insn));
>
> Thanks, this is on fixes.

Sorry, I forgot to add the Fixes and stable tags.  I just fixed that up, 
but I'm going to hold off on this one until next week's PR to make sure 
it has time to go through linux-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
