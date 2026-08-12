Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB4AC5AC67
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 02:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	In-Reply-To:Mime-Version:References:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZHvGJ8gMyhiwqqYBUzZRn5iY1ozN9r2qhWV0dIrsVXw=; b=g+h/b5P5DlLgg1INkXIsuWzumt
	jrLyF837B4OiCozkC8hr29zZEgFgsCAMgpnuenj/Eb8C1yUpLcMYjDXgIj2jvrs0AeMxVqGf7TXoI
	25JuKtXSW948cT1ATP7P4qeECB1Jl451pft3WW+UpsAbT1y9JYKexpuxHi1wb0GyyIayjvzmZaSb+
	PFxIv+GdoZtfZ4DBOAuBerjU4H6f+H+KNI5Gk9o6AhDzJNPbAkog2p0KJKbGmyacEmFooP0Kyqw77
	9nV4OaR5Lp7FGSFYK8SzWQs4zI1oTO4WX7Hz1Wy6zTmGxf6/02BbLJz+GvKY7jPmS9fjbvrVyJcgA
	BC0LrLrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtzAa-0000000FJsZ-1X8N;
	Wed, 12 Aug 2026 02:58:20 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtzAX-0000000FJs3-21I4
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 02:58:18 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5b011edaf7dso431964e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 11 Aug 2026 19:58:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786503495; cv=none;
        d=google.com; s=arc-20260327;
        b=lz8/KGajovku8wTINpB9lehEJNm43Ow2miKcBddDzSX657LUavxbTCIYjnEgfZb1FF
         Y9AqgkGmD5V996lkVKjy3FMUT/EVYOEhOP7FDSfUrV9wG9qgAyXK+wZT9r059mm8yO1Z
         ICR4DZdE+wCLDNL7LVC+lfnj2ik/aoaU9FDwfh65p04eR6g5KUnuBqG7QQA1LudJme/m
         I8qcwxGkhqWw7o/B1niTxlhv1hsLMIFviQsNim8FCnYE+uBs87ZMojA0sZfrlDDDKT40
         8AOGi/71aaOOSy4WvYCZgh7S9bZtW3hzAOJKSpeyZBVoOD0i4uPm0HV6fwNuEsOJYpkZ
         Zx8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:user-agent:in-reply-to:mime-version
         :references:from:dkim-signature;
        bh=i7nGgYKvE3Q27EURwBk0VQlh8/ubhEqw0Zh7p9xqrfQ=;
        fh=kMCBKp8cZRHSGCaU4Jt71J89La3GLNhOIeO2AMd0wXM=;
        b=LKQCROkZ1StSe4appe4CJby2ouzw/vlXM4wCPxqTvCRAcvjld4HWYwAe+odEoBH+ck
         gEzVYzQCcCQAV1xfmLN5VyYEVnTcsnNBlwQpKg/M5I0h5kzy0GfvjX5s1TV/mJ2KslsF
         JjhXeB/tXLHJ9Cz84CGCx6lFadCmT4fNA33NbTaIo+r+QXQozxhyR08j9Tl9W28j9lwB
         tDqg5UO+qWOVlyZmkU/LXl4tAgLDLonUFrAgXgmAKwJLxwsSNs03WhEAUIHCPWgEG4TT
         Z7jizuNbJKU4jHtNnFz2UVOp/Gjvm9jfqgG5ZkRFpo0PcIIlGm9LGVYEQy6FQUHekBB1
         uDzw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1786503495; x=1787108295; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:user-agent:in-reply-to
         :mime-version:references:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i7nGgYKvE3Q27EURwBk0VQlh8/ubhEqw0Zh7p9xqrfQ=;
        b=Cu2IoEp9pLqmHPWqe4vCdbnLJ7TDdsq7HMP/WDc2qeBpmflwko33I72hL0poMg7QaY
         ETDn/r86Wg+lEgtqKyt4uWPxDI0lFptevXqAXZbsXYiXe6bYS9T0jYL23JWWqSWDudsK
         mJMrz8FkVHNuCpKnEA5Sb24Ad/gLz018KEs4vM/E6lwvWpEK6JKr/O0FqMtgsfg47UMx
         TJKPrKwM7nrL7/c6z1hLT49BQabYny4cK9kAo3NbGNNvr5gt5Luq7C8nhZd7xERM6+Jk
         se7aNLC+yNkUVxNf3zyFP8hPFOrqXo5kC4MDMjNLcD7efiDO+17yTY8oURMM0Fwe5Kit
         QupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786503495; x=1787108295;
        h=content-type:cc:to:subject:message-id:date:user-agent:in-reply-to
         :mime-version:references:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i7nGgYKvE3Q27EURwBk0VQlh8/ubhEqw0Zh7p9xqrfQ=;
        b=JHHv1yLnCJAR91BhAqIEW0Z8tBYX7NFaxZra5sKOVKafF2nojcVDFlZhyeD3HGF84J
         jDMOHHUcNr4Q1VmUMKZoJJCwMxfJap3VeDnmW1FzuBBS2ijpeDW7MaSZbwbiuexVZbNz
         vhi3TYhir5GnGCQ9r6Fcztjw7ZxwUk+QCQh7RZGi1VLm/L8T+brA9Lb3c1DxpG2G89ar
         lBdDAX8rJ2WByvTQj/8nsdVxTkxmxPJmLXVlvxqBTUkFDCeFPdYP61WpdLPBXhBJSirP
         AVOnI7pT0SJT8654oRuPk57RlhYBRfIedwENcdPxrRlwjpGnpH3NF4b83YGEfm3gwDCl
         XbVw==
X-Forwarded-Encrypted: i=1; AHgh+Ro1MRbCczUxJDNrkNtcktJX94/pBC3SKRazIclRN7hIELBDzJhfk6ir1u1wwuww2dkpVm7/+tIfRi6uJg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeQ+avf+gEuhPbysoKyrH69JzUuLlcoT5bcI9rFChJpvCXIKnP
	Orr0nnRLNB1Dl5rS318UHpNAK0nHdJhHdvlAonOLBJ5wZrH7m7jqv1CX92V1ytAsN8mcybLAbKU
	sQpS56+l0Ie29trI2QGchcUHl0sI0Wmo0csZnBpAV+A==
X-Gm-Gg: AR+sD13XDoe7V3n75u0EuPRql64VayXrXG8x5NAf6gDzZP/mhR1R5KqPJXLFGLFGhfY
	4lOoMzFzdN77QSwlLR91ZwoLzcwWdx5b7ztMI94BoI5zVMNhGFNyLhnQ42Vs0DZ7Um3cq2YsJIu
	FiKl0bUxDyxEzTtO40APVoe1rO6mKZkciMV9ctxbUOSEHTLKiiZDS6P2ZN4d6/YPggYECp4IVGb
	to6ZPtdKBiGvqlFGzwW6oykOINnuySsBfewmdHe5HPrWsosMHCzMLrjbGG5yG7jG0SuotxrXFQM
	/L3I9w2721exDXJpMtde2kbKQOY5JpRJh+67upXzCypPfLvZ0h7uhl7C
X-Received: by 2002:a05:6512:6883:10b0:5ae:ba47:e7bb with SMTP id
 2adb3069b0e04-5b44e327b7emr127630e87.36.1786503495339; Tue, 11 Aug 2026
 19:58:15 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 11 Aug 2026 19:58:14 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 11 Aug 2026 19:58:14 -0700
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
References: <20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com>
 <20260714130657.46963-4-zhangzhanpeng.jasper@bytedance.com> <anvYGuNF3MC//Q94@x1>
Mime-Version: 1.0
In-Reply-To: <anvYGuNF3MC//Q94@x1>
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
Date: Tue, 11 Aug 2026 19:58:14 -0700
X-Gm-Features: AUfX_mxvwZ83pSWvPns7jRPE3EZ4ROM6a0cFBGgGRZzehYP0r9bHWpi6TB0BXXM
Message-ID: <CACnXVnfHZ0icevM8B3rVCiU_qxm41W+duRkPRS8HP45P05abYA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/7] resctrl: Add a devices file for external
 requester assignment
To: Drew Fustini <fustini@kernel.org>
Cc: joro@8bytes.org, palmer@dabbelt.com, tony.luck@intel.com, 
	reinette.chatre@intel.com, tomasz.jeznach@linux.dev, will@kernel.org, 
	robin.murphy@arm.com, pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com, corbet@lwn.net, 
	shuah@kernel.org, jgg@ziepe.ca, kevin.tian@intel.com, cuiyunhui@bytedance.com, 
	yuanzhu@bytedance.com, iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_195817_553353_94C51BFB 
X-CRM114-Status: GOOD (  19.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Drew,

On 8/12/26 10:19 AM, Drew Fustini wrote:
> On Tue, Jul 14, 2026 at 09:06:53PM +0800, Zhanpeng Zhang wrote:
>> Do not overload the resctrl tasks file with architecture-specific
>> non-PID tokens. The tasks ABI remains a list of task IDs, while the new
>> devices file carries external requesters assigned to a resctrl group.
>>
>> Add architecture hooks for assigning and showing those external
>> objects, and reject group removal, reparenting, or pseudo-lock setup
>> while devices are still assigned. The teardown path performs a
>> best-effort reset to the default group.
>>
>> The devices file is an assignment interface only. It does not describe
>> a new resource schema or domain; resource allocation and monitoring
>> policy remain described by the existing schemata and info files.
>>
>> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
>> ---
>>   Documentation/filesystems/resctrl.rst |  26 ++++
>>   arch/Kconfig                          |   6 +
>>   fs/resctrl/rdtgroup.c                 | 206 +++++++++++++++++++++++++-
>>   include/linux/resctrl.h               |  45 ++++++
>>   4 files changed, 280 insertions(+), 3 deletions(-)
> [..]
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index af2cbab14497..2e424c911049 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
> [..]
>> @@ -2067,6 +2236,16 @@ static struct rftype res_common_files[] = {
>>   		.seq_show	= rdtgroup_tasks_show,
>>   		.fflags		= RFTYPE_BASE,
>>   	},
>> +#ifdef CONFIG_ARCH_HAS_RESCTRL_DEVICES
>> +	{
>> +		.name		= "devices",
>> +		.mode		= 0644,
>> +		.kf_ops		= &rdtgroup_kf_single_ops,
>> +		.write		= rdtgroup_devices_write,
>> +		.seq_show	= rdtgroup_devices_show,
>> +		.fflags		= RFTYPE_BASE,
>
> Once CONFIG_ARCH_HAS_RESCTRL_DEVICES is built in, the file shows up in
> every resctrl group directory, even on hardware whose IOMMU does not
> implement QOSID. I think it would be better to make fflags zero so
> rdtgroup_add_files() skips it, and enable it at runtime from
> resctrl_init().
>
> Thanks,
> Drew

Good point. The build-time architecture capability is not sufficient to
expose the file. I will look for an appropriate runtime mechanism to
control whether the file is exposed.

Thank you for the careful review. I really appreciate it.

Thanks,
Zhanpeng

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
