Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58D1C5DF89
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 13:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kmq8lzwxGJjoIK4qTKr5t/BOt3+TX0FyZzIK9gYKS/4=; b=suIqxvzTuHZvHD
	2yey0Ur8ncUjrkgelMQyoDZQ9aqiyT+99MMn7ZptSBqzXrUXpRTGpTJpxrXkZk2VpzHXtC8M2FT6E
	xAQzGfE/M+fj/3qzb2iPD219uSEIb852IOMElpyGuzOYfVuUuK5vN3uNOIi4DqpJk3OoLZK80lBY5
	YDK+Z2a7DxN30oDk3Phhceuh7sYWzmCtld0ZoS5PIEPb7gbYmtQu/p57aWK14kMFUXMuGtFqRAj1i
	vKhhiY3hR73iIbkSuNXjTBmUx8Tah/qJ8OP53a3IR/bs9AcQb5xji5drvzoIqvcLEs/gz7MXyHayz
	sYjB8n/MIwtYqEZGC6ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPD4-0000000DOJP-0GkU;
	Fri, 21 Aug 2026 13:23:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPD1-0000000DOHx-0o0P
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 13:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787318578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yT6AXtl3rcDOrA8CHC13zOchRPUX94+zGeSqbRBwczI=;
	b=A7ZxBiPXU8b7JfZ/+WzXxFWkjq59SjpR50h/kErr8a5fxRlr52r4VpF50EKQBL4wxfEOKK
	zIspyYGCMdJvfNVkGHH9KqNcKmDTLnElI5KKxvs9o0IImTY8lnd79ccj5kF7L3w5T26YVf
	xlJAL7xQO4seb5Q7FTW6X24bGUaiplg=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-bpYNKrHyMUiWQNtQtxkuGg-1; Fri, 21 Aug 2026 09:22:55 -0400
X-MC-Unique: bpYNKrHyMUiWQNtQtxkuGg-1
X-Mimecast-MFC-AGG-ID: bpYNKrHyMUiWQNtQtxkuGg_1787318574
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84f0d3ab2f4so742126b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 06:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787318574; x=1787923374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yT6AXtl3rcDOrA8CHC13zOchRPUX94+zGeSqbRBwczI=;
        b=d1+e0j4zl9tAe0UPs00C5Dkse7hMCnmxz8QGhc7JdVCrxaa+kLrbvnQfjH1dBZdoDb
         oKDY3JReHVLP8eJ20lzvJY68OyWpb0XJjFLdjTYD877KhyBykMqyTNr4vVKip+Zt3CAA
         I1lCxAF/nCcDfPhs09nLGqFYWalQ30W1UuZZN5GCPwT4YSG8PtYD0+OgxvX7/MLOx2H6
         c5LA9PNpI/CaS9YMudQJsEj9V3x+EH7KNEM0lSBvgaxD0mMVK4iUMBlrazt9vrIkxIij
         nW8b+shteNXIPZ+/dkSJNMUECu9wOAb/gNHllqQhKhXOxL4qSaZEGG3ZsPMQtTzPTSbo
         p0Iw==
X-Forwarded-Encrypted: i=1; AHgh+Rqn6zmGTjmx9Ew2OquovORpuUsyGG/TDTCH3RR8r8bVI3dGO0mfLMHleVBK6/20e4LGJI1gqFiFeQHOZQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mvUw35517e2eEsm3+hMi6G9F2XZAFdBZztsqV3yZEYTifigpLm
	ZxntmCO2SO2mzDrIDUSgHxUxkAZUPZc25F9Lwy2D4SeTxRdiFbv4fHyv2TsFT+kuCnBB5sqMa8N
	y2LP+5ynXONVsnIDB3Y/CaTWhhUx6gO8qdEWuBeMWus1HkhHlb6A3NgbthlU1zKte43GSLUJqEC
	xtyg==
X-Gm-Gg: AR+sD12sZEfldKXf/dzUuNM/UtpJmdXqrTCXmJb5sgnBH8obbUD9LDjZHPTtZNwcQli
	JamFDlOMZUDQXhhtylyRJmDyF3Iy0U0S9jwQxL7s5au3tcV7DV3w7vy+61/TSCHZi/WXzb136oQ
	OfYpHEiDhFtVEjvzFs/qBa4I6aPgvrqjxAKyAqVM5ka8EKNKC/LIEc58F+PsWoETs5JeoRrX4wv
	ajlxy00qYNZRcJZS0FphJtNjjwtDvgRyCq2jjRZ1W1rd33M+HGfEwKGVRlPBlAJdYrgM05Mfgwi
	l6eDNH9eZGKYk6jIO4kVAYQajPnh69MzmzBHAreHJxrmlDw8X1g8LHZGlPIGNWjaEdztjOa+r0X
	HnG9DewB++afHQjlZFw==
X-Received: by 2002:a05:6a00:1c86:b0:846:de21:3da4 with SMTP id d2e1a72fcca58-851f9cc6dfemr11345711b3a.3.1787318573996;
        Fri, 21 Aug 2026 06:22:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c86:b0:846:de21:3da4 with SMTP id d2e1a72fcca58-851f9cc6dfemr11345592b3a.3.1787318573542;
        Fri, 21 Aug 2026 06:22:53 -0700 (PDT)
Received: from [192.168.1.3] ([122.171.22.116])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3389a37sm2905604b3a.15.2026.08.21.06.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 06:22:53 -0700 (PDT)
Message-ID: <62cb1c7d-aa17-4d6d-b780-97cc40b7ff91@redhat.com>
Date: Fri, 21 Aug 2026 18:52:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] kexec: fix error propagation in
 kexec_image_probe_default()
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Philipp Rudo <prudo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
 Baoquan He <baoquan.he@linux.dev>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Tao Liu <ltao@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org
References: <20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com>
 <20260819-mpilaniy-v2-2-95e929ede0e5@redhat.com>
 <20260820142114.0a36ac78@rotkaeppchen> <2vxzik54zmpp.fsf@kernel.org>
 <713ab0a0-235d-47cf-a0c2-73249fbc8f74@redhat.com>
 <aogHeKQ8UnudNAMu@kernel.org>
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <aogHeKQ8UnudNAMu@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aNiRgBDOTyfZHnsAhAGq1xzBUHFdVDV0GEiohVJaUoE_1787318574
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_062259_362554_0823153C 
X-CRM114-Status: GOOD (  16.51  )
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

Hi Mike, thanks for review.

On 21/08/26 1:38 pm, Mike Rapoport wrote:
> On Fri, Aug 21, 2026 at 12:48:15PM +0530, Mukesh Pilaniya wrote:
>> Hi Philipp,
>>
>> On 20/08/26 11:41 pm, Pratyush Yadav wrote:
>>> On Thu, Aug 20 2026, Philipp Rudo wrote:
>>>
>>>> Hi Mukesh,
>>>> Hi Pratyush,
>>>>
>>>> having this patch makes sense. Personally I'd go with having a
>>>> switch-case rather than individual if-blocks. E.g.
>>>>
>>>> 	switch (ret) {
>>>> 		case 0:
>>>> 			image->fops = *fops;
>>>> 			return 0;
>>>> 		case -ENOEXEC:
>>>> 			continue;
>>>> 		default:
>>>> 			return ret;
>>>> 	}
>>>>
>>>> IMHO that is better readable and easier to extend in case other error
>>>> codes need special handling as well. But that is only my personal
>>>> opinion.
>>>
>>> Well, IMO both look roughly the same so I unless Mukesh prefers your
>>> version more, we can keep it as-is.
>>>
>> Thanks for the review. I agree the switch-case reads nicely, but since
>> the current version is functionally equivalent and already
>> reviewed, I'll keep it as-is to avoid re-spinning for a style change.
>> Happy to switch if you or Pratyush feel strongly about it.
> 
> I'd like to request another style change :)
> 
> In newer code we often use 'err' rather than 'ret', so it's more obvious
> what this variable about.
> 
> I don't feel strong about if or switch, but if you go with if, please don't
> compare to 0, use !err.
>

Makes sense, will rename ret to err and use !err in v3.

-- 
Regards,
Mukesh Pilaniya


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
