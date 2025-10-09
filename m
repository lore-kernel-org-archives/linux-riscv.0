Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D66CCD187
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 09:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m7FO4qF9RIXP1t+T+lxlMfeai0HNAfwpT3qA9cg3GDQ=; b=y43tfJMBHLuLvR
	5KyS+jXzHUBeZ4eIpGasnq2ISHzgFLRqMrlGQyM8hxyCoPIdK+e8bMVxGZ8VKb/BVmywcnwTRh6gl
	4O+qDKiOhqrFyDPD7xZeTvYkAjJUEogbpPZzIfEVFFbv2Bv974vm4MW04SSgsLKDotNVN4qBUwCzv
	i4wyzEelFmwj8CZTdtZg9Vhfd1C9CVLdep/m5a2REw5DwJiD/pXHpabc1NKKbiyDZTHPt3WSYPLKo
	vuv0aMWWNPm7bEOc7ckIxKNrpMv6yrmrqUjQQbwZ27xKLsEIZO+JXfKHDH7i7vqLx9YCddDTdJPU5
	hqEexsvECIG5/M/VH9nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6n2w-00000005fw6-0QQw;
	Thu, 09 Oct 2025 09:34:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6n2u-00000005fvb-0UAI
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 09:34:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760002487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Kh8JGXUB1NsHJYxaM+Pss4KMWF9Q9wo9txu36JERlj0=;
	b=WIWlk2jVPqrgeciQ9puXKhE9NxQNxlGlwJqi4I9XEfYHA45nNOFTTPQK2jNoy/jdxPV3q9
	/0ymKMeB53Xp9hgd27WvNafzcJo+ygV4PK4M6lsBJCDcRnnCfb4kNYCbdEHdBtPI2C7gKa
	RfPf5XlzsJgcmSKhbrF/4GIpgeJ9FnE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-29C_eGUiMNuleKUDJahmGQ-1; Thu, 09 Oct 2025 05:34:45 -0400
X-MC-Unique: 29C_eGUiMNuleKUDJahmGQ-1
X-Mimecast-MFC-AGG-ID: 29C_eGUiMNuleKUDJahmGQ_1760002484
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-46b303f6c9cso5210675e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 02:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760002484; x=1760607284;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kh8JGXUB1NsHJYxaM+Pss4KMWF9Q9wo9txu36JERlj0=;
        b=khXly/fIfEo9cMR55Ry3fu3xgutj07A+XR2JM/NqDz0SuWoKtZAPzMaaQOFFZlpy2A
         lC8oiYoab8bBzm/uRtcnayI76x8BZnX/zZSYremgIHLwmpcAe6mN/T/LoDemYGgibogj
         h7B7zKPqzla4vdld9TW/xu0E5W8+TY2D4vWAduiuP4P38yYRpajwHUDo1RSohs2OWO71
         LSx8F2z1kE/CcwqJtHaKQFozJiYOmQ8cLTrlGNgDpdbdPnMDMfOcHoMSDxdan5tEAZbK
         SzxSFCCHn17Cau8lB0cGvqTnDIAntvYKF7sqpPDv4UGT1xYJQP0I0DKiEabKK0fV97TU
         4qFg==
X-Forwarded-Encrypted: i=1; AJvYcCWNvB1z1F2OJ6Uuelh8cRZoC09mXMBx4ax37o5jUxvJiZ1PHk7KYf+tKxMtnjf/97V2+ATEgoYY8CHrtw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnCtvXw8Ekr9ZtKD5KfgXyeYYNph+Whz9MQjTDGgY1v/8LdTx4
	jvztAVf1s4JpZGqbfq8lwkduzUeHj+2XcYfPGznNlpIcYtUoAshe1MNXrkzle7IpTWjd2qbowJE
	FsthrVuXRtWcQAyGKr+WjPfdYDCH8gN25zKyCSme2TzdwXlim0to2HLD+R/oRDo112etUvQ==
X-Gm-Gg: ASbGncty/D3KYrvhxnqt4GU7dj/GyVMGm/0p5moWNOd5wsjAvmE5xoHJhx1DuJN5ZNu
	noipubgTASYa87ur92OseZSbQLnrW+YHazqQJ0sT6Mx6DrPQlS8tKpZ4ZVS8+FHJSUM+hJdW4L6
	X2xMEGyHz2gkmzvsGX7fHSZqu77o1ICcF+5M7r2PcG+XDBkO9DDqAoTgLEK4ZK9MI3c1HJpF1N/
	399HScaukoEBByJ6NyLLPMa8fgD+3/qSgxpXHzOs+S1rMOv2Dl+4Chuo6KD53bOrXCUq8ZauukX
	dgibGM7zD3Iv4xUnlA1/sxwXmSryDE4lEcwMXRS72lR1Wc0LUko84rZN1huicwW2/wieHZE+J/n
	9CmIpn15c
X-Received: by 2002:a05:600d:a:b0:46f:b32e:4af3 with SMTP id 5b1f17b1804b1-46fb32e4c1bmr5153195e9.1.1760002484183;
        Thu, 09 Oct 2025 02:34:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyfdLHmeLVcS/24ELo6N5hr/uPsFsSPCfyzvUigm3fcqdF/w8z07IDJSwlfvj+lOzROactJQ==
X-Received: by 2002:a05:600d:a:b0:46f:b32e:4af3 with SMTP id 5b1f17b1804b1-46fb32e4c1bmr5152945e9.1.1760002483746;
        Thu, 09 Oct 2025 02:34:43 -0700 (PDT)
Received: from [192.168.3.141] (tmo-083-189.customers.d1-online.com. [80.187.83.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9bf8288sm76286315e9.2.2025.10.09.02.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 02:34:43 -0700 (PDT)
Message-ID: <5c6aa34e-9f07-40f3-bd5c-2ad3242b31eb@redhat.com>
Date: Thu, 9 Oct 2025 11:34:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/18] mm/ptdump: Replace READ_ONCE() with standard
 page table accessors
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Conor Dooley <conor@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>,
 Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Dev Jain <dev.jain@arm.com>,
 Lance Yang <lance.yang@linux.dev>, SeongJae Park <sj@kernel.org>
References: <20251009015839.3460231-1-samuel.holland@sifive.com>
 <20251009015839.3460231-2-samuel.holland@sifive.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251009015839.3460231-2-samuel.holland@sifive.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J3TUqMCtxIY0Cf2nnGYSxR1BYMx60CK8s0j4v8Rx-V4_1760002484
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_023448_229833_60DDC370 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

On 09.10.25 03:57, Samuel Holland wrote:
> From: Anshuman Khandual <anshuman.khandual@arm.com>
> 
> Replace READ_ONCE() with standard page table accessors i.e pxdp_get() which
> anyways default into READ_ONCE() in cases where platform does not override.
> Also convert ptep_get_lockless() into ptep_get() as well.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Reviewed-by: Dev Jain <dev.jain@arm.com>
> Acked-by: Lance Yang <lance.yang@linux.dev>
> Acked-by: SeongJae Park <sj@kernel.org>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Link: https://lore.kernel.org/r/20251001042502.1400726-1-anshuman.khandual@arm.com/
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---

I'm not sure why I am not CCed on the full series given that it 
apparently has LOADS AND LOADS of core-mm changes in it.

get_maintainers.pl is your friend ;)

-- 
Cheers

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
