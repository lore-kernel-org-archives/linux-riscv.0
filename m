Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4BFC5CFDB
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 17:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pUPViWgk5zrqDEUEI+ankY9s0Sg0vsLZGD/tR6l+wBI=; b=fEt59AHp58f+RP
	pwrDE17716Y0AtqsWyVuM+xCcG0ANrq5uyxKUn6Q3InFx1gls8wfkzsI4Ri/6caKdtdEtccyf7zo3
	HvMVBOdwsdASaySAG/o+UCpshKdmdz/Gk7f2khNPbH6JbqlpJ5P8WNin2ogVy6HDZ/SrCP78l2giN
	dPeLkZqfTAh2OYd+7X7a5nwJHZR9W+honL6932xktBpTbPwv/sPMb5wQ+4lO21DznEdFaOiaRM4Nx
	3D4jyLab4gcP/c1RrQ0BfVwExtINkeMBNLHMa70b3v7JPWrbmVIUtvzDvbgKI55TENUhn6j16inur
	UxVRleRZCvc7GQwKWxoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvh9-00000002zMx-3HeU;
	Fri, 14 Aug 2026 17:27:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuvh7-00000002zLy-0GyV
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 17:27:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786728468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ALhGJdbaDFJ0vhwNsd55hO+rgDN52tftmXEPKqTi+XU=;
	b=d63/mjcCFMCUvqyyTHQFn8d3xtxmwBhamOV7XngxK1yLwO48rLq6C8CTPzNbd83l90ICAJ
	c1FNqeQizB6KTMOK3dBWwr+zwCcmJ9jIBbMpFzvO9nuzZ+YjqNSYrQrj43srseIs03aSUL
	qAolxwdLInxUgwQ94v5ZWqNtUGOqVFs=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-6souAP74MgCLeAPfQYwBWw-1; Fri, 14 Aug 2026 13:27:46 -0400
X-MC-Unique: 6souAP74MgCLeAPfQYwBWw-1
X-Mimecast-MFC-AGG-ID: 6souAP74MgCLeAPfQYwBWw_1786728465
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so2800159a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Aug 2026 10:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786728465; x=1787333265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ALhGJdbaDFJ0vhwNsd55hO+rgDN52tftmXEPKqTi+XU=;
        b=WH8OKXTxTfDjY4oAKY7wzh5dUIqYSN2v0TWt+8MMOvfMuqRvcKc4fVcx4k0haxmt2G
         unWtO/rweq2L42w1MHPLoEtxDXPoCqPsiRYPrIefbmEmWAeEnY4HxKwfnjgswc+H+8kc
         Xc912X//329CuwIZUNMKW1aqjbVkagjNXcn1SWzIV2P14dUoeEIMJxD+IBfSY/6Ipt7u
         ts+FrH5u9QtYy4ACQ1NPAzDSR6T2yBIY50NJx4RlMIm6sHbyBqkHWjgWXlwLWXvX6Ahn
         vmRQ1IdcK9vjsNkn7+45IH24wzjby55eMPVMe3cqxrbiYk0qhnNbSt44gTRT9Sr21vJV
         TsbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqa6Vp46Zw4HdCebS2nkhHC1tM9CJpJtlZwehqsGuLKr39sGHA5MzAIcP/iSc1F9aX9NoupmTPA7t2cvA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3X935aV2NUcbM23iDJI6xkKQCDbEa+mi0rF0TyoYR2fGF71rY
	ApwNCCNqIiDOI2UnlttkpgapA7Wlg39LoLKl5fVjyDk+Ghpn7+5Eaos7bHGESuhYZ8J7rmZEOT6
	+BnejTSF2fwPdflB6Ou5RkPKdhIhlIF0uOx0Ex1YwvG4g35lxJJ3UCgS6IbGftFjd0z1NFg==
X-Gm-Gg: AR+sD11ZjEnNNCRRKBWklcWwWQHntr2a5x55onJlBolMd14pCfdlNPpnSdHNnR89Uop
	yi6CTFuQE7LNFvQ3TJ1iWv4n33JOda6lY5uuxNmMheYeI4WCLC3e0RfWxua80VAhio82NMIIhzg
	JvaMaqggy6k00CN53jzpQNZJ4ZxKczxvWaCpdVAmerlGRwl63cKAyHvEU6MdpWFCWdD21HV3G5I
	bi4qrN9pd+8AvEBYEqBN0SSO38M2k0u6hvez7o0lB86jovUL2dsUu1jOG2O4zTJXqamHYxlafp5
	DAnSPYZlELaKOLVtzIy/UBPSOwAfRf/twGS2AY4gIlRhc3tnLWdGZzo3G3YVqCtDma2EucKMCfK
	7KwwpDM7PE2DKrxFVIw==
X-Received: by 2002:a17:90b:48ce:b0:390:b41a:b92b with SMTP id 98e67ed59e1d1-3933b6d05c3mr9535974a91.4.1786728465037;
        Fri, 14 Aug 2026 10:27:45 -0700 (PDT)
X-Received: by 2002:a17:90b:48ce:b0:390:b41a:b92b with SMTP id 98e67ed59e1d1-3933b6d05c3mr9535821a91.4.1786728463979;
        Fri, 14 Aug 2026 10:27:43 -0700 (PDT)
Received: from [192.168.1.2] ([122.171.16.134])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ebbcbb78sm3512184a91.13.2026.08.14.10.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 10:27:43 -0700 (PDT)
Message-ID: <9cbe111c-ff63-4f24-b518-094ddd7cea30@redhat.com>
Date: Fri, 14 Aug 2026 22:57:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kexec: return -ENOEXEC from image probe functions on
 mismatch
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Tao Liu <ltao@redhat.com>,
 Philipp Rudo <prudo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org
References: <20260813-mpilaniy-v1-1-777d4d0e30f7@redhat.com>
 <2vxzv79c23j6.fsf@kernel.org>
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <2vxzv79c23j6.fsf@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uyPhlU3G5uVscJm2VJryI69UFhEfQpUwxtonnAjNg4c_1786728465
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_102749_177545_06DA82AC 
X-CRM114-Status: GOOD (  20.33  )
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


Hi Pratyush,
On 14/08/26 7:43 pm, Pratyush Yadav wrote:
> On Thu, Aug 13 2026, Mukesh Pilaniya wrote:
> 
>> Several kexec_file_load() image probe functions return -EINVAL when
>> they do not recognize the image format.  A probe function that rejects
>> an image should return -ENOEXEC to indicate that the image is not a
>> recognized executable format.  -EINVAL implies a problem with the
>> syscall parameters, not with image recognition.
>>
>> kexec_image_probe_default() iterates through registered loaders and
>> returns the last probe's error code to the caller.  That error
>> propagates as the kexec_file_load() return value to userspace.
>> Returning -EINVAL from a probe when no loader matches is semantically
>> incorrect and misleads userspace about the nature of the failure.
>>
>> Return -ENOEXEC from all probe functions and their helpers when the
>> image format is not recognized.
> 
> Sounds fine in principle but can you please also share what the real
> problem you face is and how changing these return codes helps? These
> error codes are uAPI and while we _can_ change them as long as we don't
> break something, there should be a clear motivation for doing so.
> 
> [...]
> 
While debugging a misleading error on s390x where kexec -s reported
"syscall kexec_file_load not available" instead of the actual EINVAL
from a kernel command line that exceeded the architecture limit, we
traced the problem to the kexec-tools userspace utility treating
EINVAL the same as ENOSYS and ENOEXEC -- as a signal to silently fall
back to kexec_load().

kexec-tools supports two syscalls: kexec_file_load() and the older
kexec_load(). With -a (the default), it tries kexec_file_load()
first and falls back to kexec_load() when the syscall is not
implemented (ENOSYS) or the kernel does not have a loader for the
image format. With -s, it uses kexec_file_load() only with no
fallback.

When the kernel returns -EINVAL it means something went wrong while
loading the image, not that the syscall is missing or the image
format is unrecognized. kexec-tools should not fall back to the
older syscall in that case. However, some kernel probe functions
currently return -EINVAL when the image header does not match,
instead of returning -ENOEXEC. Keeping EINVAL in the fallback set
to accommodate these probes has the side effect of also hiding
genuine loading errors like an oversized command line.

kexec-tools should only fall back when kexec_file_load() is not
implemented or does not have a matching loader -- not when something
goes wrong during load.

The fix on the kexec-tools side is to remove EINVAL from the fallback
set, but that requires the kernel to be clean first -- probe functions
must return -ENOEXEC when they do not recognize an image format, not -EINVAL.

kexec-tools patch:
https://lore.kernel.org/all/20260814075329.30203-1-mpilaniy@redhat.com/

A review of all kexec_file_ops.probe implementations found that arm64
image_probe(), riscv image_probe(), and loongarch efi_kexec_probe()
return -EINVAL where they should return -ENOEXEC. x86 bzImage64_probe()
and s390 s390_elf_probe() already use -ENOEXEC correctly.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
