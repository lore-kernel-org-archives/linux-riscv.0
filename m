Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9BBC5DF87
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 07:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iZ+Mcq0jectX8USH29KDoJPRjDTJcJELbjou6Xf1Ack=; b=NAOwvaQOQUmDSi
	RWeCoi6oN1Q2FJhtzTDiFj2u+GrkfIf4h3BPCj2PSzaDwlTg0aMhQ9rWlc7N+2EqUY2Zq9LYIzwHh
	W6lHSJGF/LsdL2C23jJ2bbDdxpADBxJRLJMpn6xefkfhgJ3PJd6Wjm3phEv/FLCK9FQvfBsny4hE1
	DSoBZoBki87fRh73KaRzslINmYFjo7zBRbiCBXRsDqNImsDDr6E9Lxg4sVI84ul2fswpDt3c84FBg
	+rOSadkbUI2V7xcJIywuxaBDpJKTFM/+VpD0OvhSDfQn2ZSaMfSyVCOXRQB0j2zdQoDtFVtK3RnR+
	sYEY1GwbIzoonPBN/1JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJWQ-0000000CgRQ-1LxI;
	Fri, 21 Aug 2026 07:18:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJWN-0000000CgQe-297y
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 07:18:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787296712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6xlKCRyJmUt4oo7s6EMRczgy6MnR0ePY4jhsRQ6cVx4=;
	b=U4/FH2QsZHDP0lSiMuwRcvu3Xt7fPubgQDTT0fhbmc9pgpWHhuT12xQWMDxKeKAT/4sDZE
	0IbOQqpn0ozvE+P73k8g3uisb75XSuumFiCjSjPAP/biPhmaQ+BhD/gXcojMV1So1JNPfN
	wKC5FkuIb5FUOHGa5//wPjdInv9HQNI=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-HcuiVHs9MTK2lQV5zL0org-1; Fri, 21 Aug 2026 03:18:26 -0400
X-MC-Unique: HcuiVHs9MTK2lQV5zL0org-1
X-Mimecast-MFC-AGG-ID: HcuiVHs9MTK2lQV5zL0org_1787296705
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84859a64079so1073067b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 00:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296705; x=1787901505;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xlKCRyJmUt4oo7s6EMRczgy6MnR0ePY4jhsRQ6cVx4=;
        b=Ln6LB/4V4xC+FC1NSSnFHEHz7SKtSNrPkOzN4+J9aZ8IBcTbLJXTmkIix2yI4a3Nrv
         TUG0iqeDJKaGkvQJ7yDX4glKv9Cg9gFU5p/C0OKgCVYB3S86M8seKnFU8GvcWhYzoM+T
         2cO2zdiPWBq6AN6z2OCjot/mO9XZ7kmAerwwAgNwses1yGzmmdnbwv8EDCq7NJmt3DTr
         0IGycT/2LnzHxrV/Nsz3/6Oyy2zcAv8RdEAaNB4K8Vy7+WPk+LicbITIiNS8h+dfzZ1x
         Jr8chuVig/kcJsNjs0Gt5W4+YrTKS022UXj68dzfSzzQ6FwAQMC+EEPImH6i++S1zcM4
         LcSg==
X-Forwarded-Encrypted: i=1; AHgh+RouAJiuI2UpkGnf7BnqYeqcUnHePYzHGns22rJarDEmOKnDej8dGwGTyxECVbPSP51NUVivNbH+3516GQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lTtIXeBsFQPYAkw5leFPu0Y7By1aWhntiEq1tQORBqVL5owCnK
	oWrJSxHCBvv8Ru+ah2I277PgDVe/G5zariUlb82auayr1b3vjhpWiT3iU0aR0XOgTFPZCpi4iGw
	CgrL5gI9FRX0acqEvxDxEXpnhkp3dE57AJW75TyHnltLJ8eIV2khbF/znFSezgdeolFtOBg==
X-Gm-Gg: AR+sD11FbvTpcZYgsua1suHZoFD+hmC3zBVxp3KNvPvny7TTvT9BK70L0WCLuEC8qYB
	ZBG72nLi0LIteRy+WMQmvR/vfRaefxB9+Ec/6CgIrIV7lJPn1mP2nAlR977AaRHNSEry6cVUySI
	AkKcp8vJNNQcXISfbU4BVzlQK+rZ93a2Ye3J+K917btBcOHhODhHwXITrhplGfiUFfPQPVH+zO4
	x/rkpa+Fexgke0Lu9tmm3S//Y02M3QruzXgJ0f4IvRgQvkYG1kCB00/JZSGrFmHzXowumR/+voW
	Zkuw6FPBfM5kl1f2GTV1BkDQ0QHU6MaPzgZMOgU/SjxTjP6GWTRxF6aeL1WDz8X1KCOwzHAP93T
	PG0cPFLra8E06OPOfIA==
X-Received: by 2002:a05:6a00:179a:b0:847:8449:2ba6 with SMTP id d2e1a72fcca58-851f9f66789mr6258585b3a.8.1787296705128;
        Fri, 21 Aug 2026 00:18:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:179a:b0:847:8449:2ba6 with SMTP id d2e1a72fcca58-851f9f66789mr6258522b3a.8.1787296704696;
        Fri, 21 Aug 2026 00:18:24 -0700 (PDT)
Received: from [192.168.1.3] ([122.171.22.116])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3361d24sm2509087b3a.5.2026.08.21.00.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 00:18:24 -0700 (PDT)
Message-ID: <713ab0a0-235d-47cf-a0c2-73249fbc8f74@redhat.com>
Date: Fri, 21 Aug 2026 12:48:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] kexec: fix error propagation in
 kexec_image_probe_default()
To: Pratyush Yadav <pratyush@kernel.org>, Philipp Rudo <prudo@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Tao Liu <ltao@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org
References: <20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com>
 <20260819-mpilaniy-v2-2-95e929ede0e5@redhat.com>
 <20260820142114.0a36ac78@rotkaeppchen> <2vxzik54zmpp.fsf@kernel.org>
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <2vxzik54zmpp.fsf@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vDKHVGSBuekDObC7Z6NCjWPBWFvqy03Ys16sKKf3xiY_1787296705
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_001835_654383_4582D80B 
X-CRM114-Status: GOOD (  22.87  )
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

Hi Philipp,

On 20/08/26 11:41 pm, Pratyush Yadav wrote:
> On Thu, Aug 20 2026, Philipp Rudo wrote:
> 
>> Hi Mukesh,
>> Hi Pratyush,
>>
>> having this patch makes sense. Personally I'd go with having a
>> switch-case rather than individual if-blocks. E.g.
>>
>> 	switch (ret) {
>> 		case 0:
>> 			image->fops = *fops;
>> 			return 0;
>> 		case -ENOEXEC:
>> 			continue;
>> 		default:
>> 			return ret;
>> 	}
>>
>> IMHO that is better readable and easier to extend in case other error
>> codes need special handling as well. But that is only my personal
>> opinion.
> 
> Well, IMO both look roughly the same so I unless Mukesh prefers your
> version more, we can keep it as-is.
> 
Thanks for the review. I agree the switch-case reads nicely, but since
the current version is functionally equivalent and already
reviewed, I'll keep it as-is to avoid re-spinning for a style change.
Happy to switch if you or Pratyush feel strongly about it.

>>
>> Independent on which implementation you use.
>>
>> Reviewed-by: Philipp Rudo <prudo@redhat.com>
> 
> Thanks for reviewing!
> 
> One tiny suggestion. Can you please reply in-line the next time around?
> It is a bit easier reading this response below the code that it refers
> to.
> 
>>
>>
>> On Wed, 19 Aug 2026 23:17:23 +0530
>> Mukesh Pilaniya <mpilaniy@redhat.com> wrote:
>>
>>> kexec_image_probe_default() overwrites ret with each loader's probe
>>> return value and returns whatever the last loader returned when no
>>> probe matches.  The error code reaching userspace depends on whichever
>>> loader happens to be last in kexec_file_loaders[].
>>>
>>> Only continue to the next loader when a probe returns -ENOEXEC.
>>> Propagate any other error such as -ENOMEM immediately. Return -ENOEXEC
>>> only when all loaders have been tried and none matched.
>>>
>>> Suggested-by: Pratyush Yadav <pratyush@kernel.org>
>>> Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
>>> ---
>>>  kernel/kexec_file.c | 12 +++++++-----
>>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
>>> index 59fb9d71e9d8..b3060e984ef3 100644
>>> --- a/kernel/kexec_file.c
>>> +++ b/kernel/kexec_file.c
>>> @@ -68,17 +68,19 @@ int kexec_image_probe_default(struct kimage *image, void *buf,
>>>  			      unsigned long buf_len)
>>>  {
>>>  	const struct kexec_file_ops * const *fops;
>>> -	int ret = -ENOEXEC;
>>>  
>>>  	for (fops = &kexec_file_loaders[0]; *fops && (*fops)->probe; ++fops) {
>>> -		ret = (*fops)->probe(buf, buf_len);
>>> -		if (!ret) {
>>> +		int ret = (*fops)->probe(buf, buf_len);
>>> +
>>> +		if (ret == 0) {
>>>  			image->fops = *fops;
>>> -			return ret;
>>> +			return 0;
>>>  		}
>>> +		if (ret != -ENOEXEC)
>>> +			return ret;
>>>  	}
>>>  
>>> -	return ret;
>>> +	return -ENOEXEC;
>>>  }
>>>  
>>>  static void *kexec_image_load_default(struct kimage *image)
>>>
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
