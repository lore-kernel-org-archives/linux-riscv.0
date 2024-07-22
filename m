Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3A1C3DA70
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 23:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=dhrlmEkxK3MLyiimenwPuC3d0udOCD9y8VPdL1DU5aM=; b=qlrDbcLhyaEoYVefD99dByv85h
	us2KwZHGatwim76iVxZ1/Trk1z0ro0HOVlnJatYd8YvcbcZYpi1cI6dA6IRDKlkixnRcmYRQ+Zk3m
	ZlU/mlGDC382eBc9pzf2CcsYSic+Vbb5skl7BxgElqo3Ho9EVen5sx63cxDHNJYt4k6dyE8ovI4xR
	3godfK96FXF+MDKBaW0Zojd88VvsjqlYh5C81foVXzabNuL0vqqGqe8A7Q0UWgQC4VPU1CI9jLCGN
	4OJVBU6AU2L+H1RoxT9RpV2ncPWWmwRwRYjgF89BZbQnfCf5mzLvpv3FUHNKw1iNFg7nEFspEp0oo
	q+uI8P3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW2iW-0000000AtCF-43cO;
	Mon, 22 Jul 2024 23:45:20 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW2iK-0000000At9I-2Ibh
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 23:45:10 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-70cec4aa1e4so2381535b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 16:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1721691906; x=1722296706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WS54cfGPwjnguy/LYntCPaN1wfikny/NE+IC80tzPG8=;
        b=K6AJv1+qnp/c+G7XsB+yCs7fq4FHC9jxs1KAD+QnPg7n03j/f23AuOMMTaAZL/8NAL
         VyQPxdNOomDG0VOgLrnMGRJJIT9oCswBbAoLEF5/Q3U2n2uSm2xwRZGpQk0HpgkUn5lT
         DhR+ldKT8ZjclgT6iXAN0ZrT/mffOA/K3hoy79bDi0iclAe1GmvhsccMvmucUYbxdHvk
         5wR8ybHY8njqpWUM6O/St9AZK4R2XihzKOrz36xte2F5cVpl+y8zYPY7HLkhIdhAloyt
         Nkv8k1VR/cdBXMwbX2/fbvFUffJE5+gbD1+T3RMrGza006pmw0PvDHLrS4ZVwyW2OsYt
         KJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721691906; x=1722296706;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WS54cfGPwjnguy/LYntCPaN1wfikny/NE+IC80tzPG8=;
        b=ZoLJoA4VDv8us/KdZerJ3XZgtnfQ5aIvpX3rqKhPf4aboXLZ2M7vHDL5EaA53PVyRW
         4NrizSNUv6dDnnw+7IM+LZkMmYiyRkwlG7JFjKY/xLjh7p8Oa8QI3JNSvhRf4g26x0gT
         Brox+J3fILP0xPTM42VQR/XnWXtlQSXwFkylpnyeL+BTUF+Uvi/FWHzlvg+wt+XISvh2
         rAwRwHg/bXNPYMQkh5e1QZmZruxiVVK6sr8RaFJkaZskEtxMVxx6IisOLJp6PzOyE/f/
         ImMQS0Xa7LcnJzlXmKsli8t4xGn5Jq6t8wYN83RoDYYzSdErjbMFswIdGT3YGzcGmSFR
         7ELw==
X-Forwarded-Encrypted: i=1; AJvYcCXCyO6mQtkk1OsN2SNnXgMVYSxqi9pv/3CHTfGUFPJrtozN/7/HSeSFJhdjj80DsnRpZGboYcYwM+JVSHaN/YlS6pzg8AHz87lRm3I9vKyQ
X-Gm-Message-State: AOJu0Yw+nGPzQNSLYdBx1APdPY5Nf2gC0ispslT1GoNvbVZpFv0X+3ME
	LYJo1sFUvU4zf/3Q+KF0E6kg/I9AgRkVLoZ6rd945n7DBRgOOmS3XOzugsYt7w0=
X-Google-Smtp-Source: AGHT+IHnxLF4xLdZqey/laXc/DP9xei64k/97GkyJAteGm1AHYh2UY/F6zpbCncn+XJoIWUIKa4z1A==
X-Received: by 2002:a05:6a20:7f8e:b0:1c3:b47d:d53f with SMTP id adf61e73a8af0-1c44f86b19cmr1622859637.25.1721691906539;
        Mon, 22 Jul 2024 16:45:06 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f2958a0sm60893425ad.102.2024.07.22.16.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 16:45:05 -0700 (PDT)
Date: Mon, 22 Jul 2024 16:45:05 -0700 (PDT)
X-Google-Original-Date: Mon, 22 Jul 2024 16:45:03 PDT (-0700)
Subject: Re: [PATCH v3 0/4] riscv: Separate vendor extensions from standard extensions
In-Reply-To: <Zp6/1CzztAOT51yU@ghost>
CC: ajones@ventanamicro.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>,
  andy.chiu@sifive.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  peterlin@andestech.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Message-ID: <mhng-fa5b8aa8-375c-4780-a90d-64511f76ab07@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_164508_795298_ECDE01CE 
X-CRM114-Status: GOOD (  27.88  )
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

On Mon, 22 Jul 2024 13:23:48 PDT (-0700), Charlie Jenkins wrote:
> On Mon, Jul 22, 2024 at 02:32:49PM -0500, Andrew Jones wrote:
>> On Fri, Jul 19, 2024 at 09:15:17AM GMT, Charlie Jenkins wrote:
>> > All extensions, both standard and vendor, live in one struct
>> > "riscv_isa_ext". There is currently one vendor extension, xandespmu, but
>> > it is likely that more vendor extensions will be added to the kernel in
>> > the future. As more vendor extensions (and standard extensions) are
>> > added, riscv_isa_ext will become more bloated with a mix of vendor and
>> > standard extensions.
>>
>> But the mix doesn't hurt and with everything in one place it makes it easy
>> to know where to look.
>>
>> >
>> > This also allows each vendor to be conditionally enabled through
>> > Kconfig.
>>
>> We can do that anyway by adding an extension menu for each vendor. If we
>> don't want a vendor's extensions bloating the array then we just need
>> some #ifdefs, e.g.
>>
>> @@ -405,7 +405,9 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>>         __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>>         __RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>>         __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>> +#ifdef RISCV_ISA_VENDOR_EXT_ANDES
>>         __RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_EXT_XANDESPMU),
>> +#endif
>>  };
>>
>>
>> So, I'm not convinced we want the additional complexity of vendor
>> extension arrays, but maybe I'm missing something.
>>
>> Thanks,
>> drew
>
> Vendor extensions are non-standard behavior, so this is largely an
> organizational effort. A benefit this provides is to delegate
> maintainership of vendor extensions to the vendor. Additionally, this
> separation of vendor extensions prevents changes to vendor extensions
> from affecting standard extensions and vice versa.
>
> Another motivation for this is that I expect vendor extensions to be
> temporary fixes in a lot of cases. A good example is xtheadvector where
> a previous version of the ratified vector spec was implemented. Another
> case is vendors creating vendor extensions while waiting for RVI
> ratification. This will cause these eventually-to-be-deprecated
> extensions to pollute the namespace and require shuffling around of the
> standard isa lists. When it's an internal structure it is less relevant,
> but it is a bigger risk when it comes to hwprobe. Allowing these kinds
> of vendor extensions into hwprobe runs the risk of causing a sparse key
> space. We may end up with many dead bits for deprecated vendor
> extensions that will never be able to be removed to maintain backward
> compatibility. Having the vendor extensions split across vendors
> streamlines the hwprobe implementation.

IIRC this came up a few times.  I think it's hard to tell which will end 
up cleaner, but it's just an internal interface and it's already written 
this way.  So I'm fine going with this as-is, if it gets clunky we can 
always change later -- at a certain point trying to predict 
endor-specific stuff just leads to insanity, I'm sure some vendor will 
figure out something crazy enough regardless of what we do...

So I've got this on staging, assuming it builds it'll end up on for-next 
soon.

Thanks!

>
> - Charlie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
