Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0B3606A31D
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 12:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q+ku/Mtc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=NeaF3gIW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	References:In-Reply-To:From:Mime-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=itnA7YtZTKoB2x4ntLcw8U6q1Nm1zbnbHnAXQ1Uw12A=; b=q+ku/MtcvZbJhAPuPJuhzhLsNm
	QbTNErhY+WUBQ2jI9uLf5X1jYzGSl5ey7aVH88lGmSf17LrOo5YJo4UytscPd2fjqkZTG+CXTaI6B
	mIkUWoPedLtJ46DBbxeayXeSvqokRPmk1F0YiD4/BM4p4v5FYnky28vOW3/LkReIwGZLHh0X2B85k
	GlzqXCNyd5uew93X2SfkYDPFzIbGgfLhR5q6Nwn9MMIby1Ylt8APSa4i48XpowdhAxhuZrwF3CwAm
	CXT5aKNC62KLHQ0IAovUB5csrqLniBtLqNCcR2X9RPJMse9VIeMXY0p6dCOMvKS1iKfA5DDzVR0Lv
	5fx6rY/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOoO-000000096cY-1hJU;
	Thu, 29 Oct 2026 12:00:52 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOoL-000000096c2-3uAH
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 12:00:51 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5ba3ec92031so2482614e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 05:00:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793275246; cv=none;
        d=google.com; s=arc-20260327;
        b=nmqyQ/YNijoq68KNw1XOBh1ESxwzEQLaPYEKLT4zbxBO2z10PB7W+VfU4nrY/z4hLJ
         bhUxBR20xA/YJVvcxKj8jNgx5E8xn1NVAbIk+EcAE4ApPHlF2fRBWyeoGqz2j4foHl+R
         OWic0dHfxb1Zn0dOnOsTHN8aVa5lMAQLSrFqLxv2YzEs+lUeU+mY559RER/2JpQEIdbc
         znEQSwnitSgU55+3heUQ/txnoQz8hwTePpRvH78fQOd/P6NmBDGydwjDVngdpV3Ss1A9
         V2UYpBVgU8LRV3OK2hDVdiTmuFN9teWct9ZcAQQ43APZqVVCCvME9YUkAZ2sDu3UTWPG
         PC6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :in-reply-to:from:user-agent:mime-version:dkim-signature;
        bh=Kfh6T58QwTFlNX2tJxJJ8wG1iXiSG5Qq4FI151fPHEk=;
        fh=QDfNGCpNoUvIsvDwcmZUiRxh0RbHg2HdIh1cHEfh4KY=;
        b=FhQ5U+McV8xKxkRjhfCfJx1IwPGAphzFgC4Y5sSJLlW2PV3109+RXuBE6TETWKda0+
         ipmSXgkHhA6ZIE2Hag8o3t3rJotLhos4SsUfeLgYxs9b6zt1BaxT+IbMtqmswwPanCdA
         pSnLr0Jx2LOh6lY37DxHhP8zUzOfLSE+rDCp8us4pWcJQeGSO8ZaqFVgNwu8yH2jLnqb
         T+l4HrqpRCAsHvJuswGXfM4OWUMpqK9mF/ac97q1mrZDUkR0/QgWbiLWeJMbmmnOsyim
         +L5Lt5HSiuzYIIFlKPamesAMQCnFrkqyGBvHI7Ja56jpvyq1KdasmWpsXkBDf/VGdJ7U
         wm0g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793275246; x=1793880046; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:user-agent:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Kfh6T58QwTFlNX2tJxJJ8wG1iXiSG5Qq4FI151fPHEk=;
        b=NeaF3gIWpBfw3hyEQN5e9Qzq02Db4bajGh7htb/lMt9DjxURB6HgZP92YaRf4gHbfA
         TuLW/cGDra8oNQZOMdgv13nfzTTO8Yq8bmd29u2ywzk8823DQVBBVRP9Ed8g0U8bOWEG
         K0qN5g/YHE41bpDVSDJHn0UoBIqzSuCx6BhSu2yR464LivTl3YUWckOOYuX7cwyjm+eL
         2z8kf4V0Uqa2JihtKSZ20LaUXWy/g47LaUXAaALS5ffrjXX4JYZ84Qkw2ZLcnC5+B9/m
         Vl3LGmj+nCVIUt8S/F3TERXarZ6BYrsyUYLTUeXLQ2E7Q6x3D0RgFFzyUIjJPfnJeG1t
         TeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793275246; x=1793880046;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:user-agent:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kfh6T58QwTFlNX2tJxJJ8wG1iXiSG5Qq4FI151fPHEk=;
        b=OZLdWxulfK5MsPPZsyVH50bdSevODIDVkYWwMsi4ama68HEJH2LfVL84eAlxnVaOYl
         Hflu1imTJMZaGxLOUxCqnSoPTvgoxky4LGV6b4TWFcjuX5AW4SSMYTQDTAJz6CHYyU/Q
         AeJ7unXRXeqnud6v2JHQADCDnXbbSlbI9JG/xwu1/B5N7y2T/s2ZZO3Bpv5SKqGMPyVJ
         l8KDEPJQ92c3j8xS97o64H5U/HvyAU1rDOoHQzZxx6Z5YtSt4DGpUiukXzI740LkFM9B
         iN1D4KfChy4pJ3cIFOBQ4orMHuuSsWUtQe5J0WkgJl66qQNy9+Ean6osSrBMJJlyOtk8
         Zdiw==
X-Forwarded-Encrypted: i=1; AKwUvBxS1WzDm+SBM0Ndy14HHr77xXogeQPt7+okzUa+JB61jrFzi6CGrk+ARfjHZUViP51YPD4KM4krwe+jKg==@lists.infradead.org
X-Gm-Message-State: AFq9FYK+T4SenUnLqtgbAn/gZq9+uLwQ+HzLir0eIFCFi2XA5/pXPkx6
	ieE86A1f7omH2bHS9tOh/uLUZKxgOqOyN1wGuK/2+DNqygs3jQ3iIpDaP9KjrOmTL8obaLA2Du/
	SD7pFytaSrt7Gozk+8XhtsBB/3f/OaTq21S7Ro8Kb9Q==
X-Gm-Gg: AYBFou0W+bPuX9GwxVfI0/bgSbYNBnrLJo2ztI6/yj4RmY1j1yRACtTuvSzEGqAyA1v
	0Co0vRX06yZMqbm7qPM09XeP8tCZuATqW+OHo2WUlhz7JG0I8wE8k2msteFk/47S4Ma8U/44l5V
	ziYuFzvi8aiBtzIGR9hoQDVM1AsVosTvjdXpY8MG/8/NDiiyuBnXopWel8N4Kj0B15QDvr9VcZV
	BSt25XZN1vM+SsSXKHEbWDCw/17+O3OuGJ+hWHS6aRYJ38h1C8i55zBR57GGbG3QNB+mTSAVWjs
	tNis9NpZTELcf0n94O9cOWmBae8q44zWeU/eHiQn6OvZpLZ7VM8f0HOpA9+wwO2gDGBkygUFkQn
	X673txXdtEBcjHPPZmK11PXBD/JziJlcp8wypyw==
X-Received: by 2002:a05:6512:340d:b0:5bf:d653:ff01 with SMTP id
 2adb3069b0e04-5bfd6540187mr229252e87.34.1793275246438; Thu, 29 Oct 2026
 05:00:46 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 07:00:45 -0500
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 07:00:45 -0500
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
In-Reply-To: <auMyx7dAPbl_1I5_@hu-himchau-blr.qualcomm.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
 <20261029074853.35467-4-zhangzhanpeng.jasper@bytedance.com> <auMyx7dAPbl_1I5_@hu-himchau-blr.qualcomm.com>
Date: Thu, 29 Oct 2026 07:00:45 -0500
X-Gm-Features: AclHuK_sbU548xic3ZPbWuif9uJX5ACTcms_1cHQ__pmhhaKq4RoduWrhke4WpA
Message-ID: <CACnXVnc0jFcNn0bmU5MSm81QTm6Ht+deSRED=91dViZnq1dNmQ@mail.gmail.com>
Subject: Re: [PATCH v12 03/11] riscv: sse: mask events during shutdown and kexec
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor@kernel.org>, 
	Anup Patel <anup.patel@oss.qualcomm.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Yunhui Cui <cuiyunhui@bytedance.com>, Atish Patra <atish.patra@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, yuanzhu@bytedance.com, yang.yicong@picoheart.com, 
	yang.susheng@zte.com.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_050050_015088_B55A2CA2 
X-CRM114-Status: GOOD (  18.28  )
X-Spam-Score: 0.2 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Himanshu,

On 10/29/26 7:49 PM, Himanshu Chauhan wrote:
> On Thu, Oct 29, 2026 at 03:48:45PM +0800, Zhanpeng Zhang wrote:
>> SSE delivery is independent of normal S-mode interrupts. Firmware may also
>> retain an event registration until Linux explicitly unregisters it. A hart
>> must therefore stop accepting SSE events before Linux stops servicing the
>> registered handler.
>>
>> Mask SSE on the local hart before panic stop, CPU stop, restart, poweroff,
>> and crash shutdown paths. This prevents firmware from entering Linux-owned
>> handler state after the corresponding CPU or kernel context is no longer
>> valid.
>>
>> A crash kernel cannot identify or take ownership of registrations
>> inherited from the crashed kernel. Reject a later normal kexec while such
>> SSE state may still exist, rather than transferring unknown firmware state
>> to another kernel.
>>
>> The restriction is deliberately based on firmware SSE availability, not
>> CONFIG_RISCV_SBI_SSE or registrations made by the crash kernel. Disabling
>> SSE in the crash kernel does not establish that registrations left by the
>> crashed kernel are absent. Consequently, normal kexec from a crash kernel
>> is also rejected when firmware advertises SSE but no registrations were
>> actually left behind. This conservative restriction remains until a safe
>> way to establish or clear inherited firmware state is available.
>>
>> Link: https://lore.kernel.org/r/as7-3PbWDxygadnJ@hu-himchau-blr.qualcomm.com/
>> Reviewed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
>> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
>> ---
>>   arch/riscv/kernel/machine_kexec.c | 11 +++++++++++
>>   arch/riscv/kernel/reset.c         | 18 ++++++++++++++++++
>>   arch/riscv/kernel/smp.c           | 17 +++++++++++++++++
>>   3 files changed, 46 insertions(+)
>>
>> diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
>> index 738df176ff6..24e7affae70 100644
>> --- a/arch/riscv/kernel/machine_kexec.c
>> +++ b/arch/riscv/kernel/machine_kexec.c
>> @@ -14,10 +14,13 @@
>>   #include <asm/set_memory.h>	/* For set_memory_x() */
>>   #include <linux/compiler.h>	/* For unreachable() */
>>   #include <linux/cpu.h>		/* For cpu_down() */
>> +#include <linux/crash_dump.h>
>>   #include <linux/reboot.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/irq.h>
>>
>> +#include <asm/sse.h>
>> +
>>   /*
>>    * machine_kexec_prepare - Initialize kexec
>>    *
>> @@ -36,6 +39,13 @@ machine_kexec_prepare(struct kimage *image)
>>   	unsigned int control_code_buffer_sz = 0;
>>   	int i = 0;
>>
>> +	/* A crash kernel cannot tear down registrations inherited from firmware. */
>> +	if (is_kdump_kernel() && image->type != KEXEC_TYPE_CRASH &&
>> +	    riscv_sse_available()) {
>> +		pr_err("Normal kexec from a crash kernel is unsupported with SSE\n");
>> +		return -EOPNOTSUPP;
>
> I think I had pointed this out in v10 also. This rejects a normal kexec from any kdump kernel whenever firmware merely advertises SSE, regardless of CONFIG_RISCV_SBI_SSE or whether anything is registered. Can you check if its breaking kexec() with SSE just being advertised?
>
> Regards
> Himanshu

Thanks for following up. Yes, the current check rejects that case based
on firmware advertising SSE alone. I noted this restriction in the
commit message, but it still needs to be narrowed.

With the merge window closing, I kept that change out of v12 and will
address it in a separate follow-up patch like we discussed.

Thanks,
Zhanpeng

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
