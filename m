Return-Path: <SRS0=SHZ6=F3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3DEC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 04:54:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46A4022287
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 04:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46A4022287
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=FjrWnN/zvbA7Q7w+lDzvhonKynIVir4PE2/jQ0vAJZU=; b=n1gyccryTY2UaKq+SYL59eF+B
	LyN4IRwMGAJHHe6Z8nuppsr5+LPeUd4Qc6LGYQB0guYm1xQhl96x5GGqMrLxyDky+KQL98pGxLtjM
	BhU5YL9Ze2pgj66GdBqOM3kTasBR5mTXwyGlOc4dY9TNa3MjAp20LZoNtNT7SYBtH+Wd5In95LzPf
	hy6S1a/urN32sCSj1Q6XGBbWrx78G/0f3mXN+01p+nn7n999zOr/TrIGgJNNZuMRsGAY8ZagYNdVn
	WiO1r0o4ncO8DCqQkyD1Z0hAabW5z7dBNZEQJTslPDO5GOO7r3ohXkcGhMh83+YE+LCjr5vypN+bf
	Dq3wavbvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krw9u-0007G8-7n; Wed, 23 Dec 2020 04:53:58 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krw9s-0007Fn-MW
 for linux-riscv@lists.infradead.org; Wed, 23 Dec 2020 04:53:57 +0000
Received: by mail-pl1-x631.google.com with SMTP id q4so8527233plr.7
 for <linux-riscv@lists.infradead.org>; Tue, 22 Dec 2020 20:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=idJz8D1ceM8Xy7ndBg7gXGBghoQBVYrGT2e4Lnm1Qqw=;
 b=Torj3veqcUDYbFSbEAhdtr0AQQ8IXXamqJbSKImaB85uANuFUe9n6yaPt3A4xtBT40
 luBOaYX7sg9v5IC6ZElmxxQPct3Z8G6poY0I2E2FAWdsSLD7gS8t9+BbTKoof9iXr5j/
 GBImgOxhsPtQoDfXa+VcZYh27U2vjt35C1ceGa79z418+AEY/wK5ahWU/iCPM75iuDIc
 iucNpmEaIL68p1mmGBfHrhwe8iRhnlTaK9noUkBQCoWjSMkUBwp5mARFn04nKVeKPmRp
 zF7r97aWcFHUD/NamI6xdM6SZPVj/Ub8evDA4C1vktSCr83AXbSHh/g4/CLBuRDA82jT
 Uadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=idJz8D1ceM8Xy7ndBg7gXGBghoQBVYrGT2e4Lnm1Qqw=;
 b=G1wRkTeLiietyRd/LbBV/IQbeu0FkgSyI4wk83EX/ovFuXH513092B4Kf09XnLEokp
 PjcbvrbO250FrBs1gNfclobYOZeHipamrCas92nbCCa6E/xF35SSC1f+9GjBIeVYhFwp
 M7VG76AtWqlswMHOCKlHSbnOx6/Xzg5+j8dxbbHXlnQPnRe0KvQfjrarjNvY2amcO5n7
 m8tCIwZzqwBODt9IGZ3bDM5DWkXA7tFCw7HC0NQ/czVWmb/Jg0Fv1+3YdsVlPRAbjHrg
 wUhcfoe+rdAaZghWLoEBGiD0w7ia4/q3z3LN3jkNwTCQcskZ+s7kJQVlVscqwmxRdzcL
 qfmg==
X-Gm-Message-State: AOAM532RVNrQaOqvrDNYnyZtelf/hBTCG/t/7EFwzZWKuxcO0vZ8MFs7
 vZrBHpTc5RxYBq/1ctVHzDLuQQ==
X-Google-Smtp-Source: ABdhPJz2+KFMCDukeOOXDD0EY8sflPdm9kxDnIj75OeH2wBBXH4BL3VfuvBDmDGhlWxEFQrwzmUU7w==
X-Received: by 2002:a17:90a:8a82:: with SMTP id
 x2mr25097002pjn.107.1608699231836; 
 Tue, 22 Dec 2020 20:53:51 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id h18sm22032722pfo.172.2020.12.22.20.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 20:53:51 -0800 (PST)
Date: Tue, 22 Dec 2020 20:53:51 -0800 (PST)
X-Google-Original-Date: Tue, 22 Dec 2020 20:53:49 PST (-0800)
Subject: Re: [PATCH v2] riscv: cacheinfo: Fix using smp_processor_id() in
 preemptible
In-Reply-To: <CAK8P3a1awG0wWM2awvZy+uMB0jXnB+zggoGrCw4xnxGUECwQVQ@mail.gmail.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: arnd@kernel.org
Message-ID: <mhng-fd76c8c7-4a6a-4493-9339-bb136d1226ad@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_235356_770178_FD08A409 
X-CRM114-Status: GOOD (  20.07  )
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
Cc: wangkefeng.wang@huawei.com, aou@eecs.berkeley.edu,
 Atish Patra <Atish.Patra@wdc.com>, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 22 Dec 2020 08:23:06 PST (-0800), arnd@kernel.org wrote:
> On Tue, Dec 22, 2020 at 5:01 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>>
>> Use raw_smp_processor_id instead of smp_processor_id() to fix warning,
>>
>> BUG: using smp_processor_id() in preemptible [00000000] code: init/1
>> caller is debug_smp_processor_id+0x1c/0x26
>> CPU: 0 PID: 1 Comm: init Not tainted 5.10.0-rc4 #211
>> Call Trace:
>>   walk_stackframe+0x0/0xaa
>>   show_stack+0x32/0x3e
>>   dump_stack+0x76/0x90
>>   check_preemption_disabled+0xaa/0xac
>>   debug_smp_processor_id+0x1c/0x26
>>   get_cache_size+0x18/0x68
>>   load_elf_binary+0x868/0xece
>>   bprm_execve+0x224/0x498
>>   kernel_execve+0xdc/0x142
>>   run_init_process+0x90/0x9e
>>   try_to_run_init_process+0x12/0x3c
>>   kernel_init+0xb4/0xf8
>>   ret_from_exception+0x0/0xc
>>
>> The issue is found when CONFIG_DEBUG_PREEMPT enabled.
>
> The warning sounds legitimate.
>
>>  static struct cacheinfo *get_cacheinfo(u32 level, enum cache_type type)
>>  {
>> -       struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(smp_processor_id());
>> +       struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(raw_smp_processor_id());
>
> And this just hides the warning if someone calls this function
> without disabling preemption first.
>
> If you cannot use the normal get_cpu()/put_cpu() interfaces or
> the cacheinfo of the boot CPU, maybe add a comment to explain
> why raw_smp_processor_id() is necessary here.

The problem is actually bigger: the interface we're using to provide this
information to userspace just assumes there's a homogeneous cache hierarchy
(and a fixed number of levels).  There's nothing we can do with the hart ID to
fix that, so at a bare minimum we need some mechanism to stop providing this
information when it can't be accurate.  That would likely sort out this issue
as well, as we wouldn't be coupling this to the current processor ID.

That said, I'm somewhat inclined to take this (or something like it), as the
warning is somewhat noisy and the real problem is something different.  We
probably need a new interface at some point, but we don't have any systems that
violate the current one so it's not likely to be all that high priority.

Certainly warrants a comment, though (and I also had mine just using a static
hart id, so at least users get deterministic results).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
