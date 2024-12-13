Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0DBE7717F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 19:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bB4ZDgXq3hyJicbGNqivCeE1DZrZfHF245QdSUUCnGk=; b=EpuHqDBllG2UjP
	EarmtXDrQqluSxCLLEwqzVMfJKkWwfxWgpqneEVvSi6/vB2Fet7ATMKXNlzHUuB3LoFPSIGH2yjs6
	Mx+BQgc8pTNOaQS7xGjtV4Gg5fZnMiQHN+RuSxGXau/7OEbQnaAuRQAJvjxubbTigJwbHvH24u6uO
	FDRujKcTQXqyJL9U4MdOzhiV1GY32/rMW9Scy9ZfawB77GI6N+qDxQ9vgrU2NomQDaGXNj29HJuv3
	6fZPDpF2wTY46xmKaFKDuRboEHl/MORZhgJAGUSJcdzWw8X6xW/vziTCWqONa2Q69sLnx+hzIDS05
	EQeFfZ/loyt9Wyh56OVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMAuG-00000004jqb-25eL;
	Fri, 13 Dec 2024 19:00:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMAuC-00000004jne-0lWc
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 19:00:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734116449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Hysh4G6LZrqgtBW9bf9kFNZmoNJmDm01ucGkIcE/z0g=;
	b=A1DgN1dfCcnTMFgym+fVYLHepk2sYE1TcT8JRRjSU3lRSEssD1b6bJszDIh9Mw3mzlOrQ9
	cRvGoNKaoYSuPzv5r93Y9dTVP06gnUYdgpuw+F+yr2m8ygTyAiPcN1fzhDDlQTKD1jRqKk
	DgWdU3RKzWRv6Gg5SQTfwjQZgweY0/Y=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-M0t7Tt9aMeuu5PUTmKFgqA-1; Fri, 13 Dec 2024 14:00:47 -0500
X-MC-Unique: M0t7Tt9aMeuu5PUTmKFgqA-1
X-Mimecast-MFC-AGG-ID: M0t7Tt9aMeuu5PUTmKFgqA
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385fdff9db5so367642f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Dec 2024 11:00:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734116446; x=1734721246;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hysh4G6LZrqgtBW9bf9kFNZmoNJmDm01ucGkIcE/z0g=;
        b=Xh1Qx12DRXgPS9M/Gmwgm0CdJWhKLWMXXHao+i9qEIwroorw6nPUVsV49do1MqOtBV
         T+asSyBMDbY3LJ3+SEIsvwqe9K/JExFBD7usq5h3KOljx5OXaSNy0r8V7P131gmicm8t
         302RZxkyooo2/b8npBOl44fg4Y02g2bhHrsJGu84fER1teJjASvYOvTfkyJ5ebLmIGmk
         Ln5EWtavBmU2pAFrS0ORMa5RKCYnDQdMOsYBMD1gtMFbxg58t1PFWNUmAmtupFObnLkS
         oBJT4r2l0YBZBIIGVb4ugl0Styv0lm+sgf1JZfeDC/rErPqFTifA/jPmu2f0Y2kQcKFf
         QKhg==
X-Forwarded-Encrypted: i=1; AJvYcCW1EHggNvOOpoVEyjR/+Ttxk9hzLGzfHGfQMzbgekdQtkUvbF+h7DSpdOz3jL5zQi0WZ+VdXVVXBasrsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3/GAX5EOy62MHijp0tnliFF2We9BeVBmcdFrGreONiGeVTvw8
	/4bsMQzSq5IvRnt8dbBUQ63bVWaWh99GTWMm4NQK6nPRwqry2rCupUTJyjD9Lm1x/LZcjoJdUPg
	SuYDTX+a1wZEDo1qmYR0XITYyXWrZG++XaptTgCGRPdDpFPHwsUWnJIyskjFB6pCyfg==
X-Gm-Gg: ASbGncsQgE0PObW5W20kLo/yUbh/qonctg4Am47Sj91zxRamOFPtga/e9HvwhcPWhcO
	mrmo1ul5VHpj+lxVyK+0LDOLE1o6yXTo2ADl4nkD6uiMLHiZCbrpsIlOaXeh2vIk/J7X4madZCZ
	dvm3vUtMtjKWhb2BpZySJec4jysG6eUdX2tbRnFSoJ9hnoYt/RuBfonvJzNEWZn6oxb0R1PGydn
	hpVKmM66xdXzfZ+OYJ6wHtMYgrJTi/VG6mwhJihqQ/bm6BuGyvpyjkzGjs=
X-Received: by 2002:a5d:6d0e:0:b0:386:1cd3:8a0e with SMTP id ffacd0b85a97d-3888e0c06demr3587778f8f.48.1734116446027;
        Fri, 13 Dec 2024 11:00:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMH7LHX8WyO4OyUiDC3F6CeTLqdILBLsfBgGhgRF00YfuJYsdMc4uonnm76mxzCZ6tmKlPlw==
X-Received: by 2002:a5d:6d0e:0:b0:386:1cd3:8a0e with SMTP id ffacd0b85a97d-3888e0c06demr3587756f8f.48.1734116445672;
        Fri, 13 Dec 2024 11:00:45 -0800 (PST)
Received: from [192.168.10.3] ([151.81.118.45])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-388c801ace1sm286162f8f.60.2024.12.13.11.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 11:00:45 -0800 (PST)
Message-ID: <98b25b36-7a19-452a-87e6-a78ae238716f@redhat.com>
Date: Fri, 13 Dec 2024 20:00:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] KVM/riscv fixes for 6.13 take #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, Atish Patra <atishp@atishpatra.org>,
 Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 KVM General <kvm@vger.kernel.org>,
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <CAAhSdy35NO2fUrgER57qgOHRSZYbGLvmKDPjdfpXOP04C1AhMg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <CAAhSdy35NO2fUrgER57qgOHRSZYbGLvmKDPjdfpXOP04C1AhMg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6TQ5THVmA0mjgyzIy-E5luBa_A8PZ1RiaYLLdC2JaFQ_1734116446
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_110052_287628_004D5BFD 
X-CRM114-Status: GOOD (  11.13  )
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

On 12/13/24 16:43, Anup Patel wrote:
> Hi Paolo,
> 
> We have just one fix related to the HVIEN CSR update
> for the 6.13 kernel.
> 
> Please pull.
> 
> Regards,
> Anup
> 
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>    Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>    https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.13-1
> 
> for you to fetch changes up to ea6398a5af81e3e7fb3da5d261694d479a321fd9:
> 
>    RISC-V: KVM: Fix csr_write -> csr_set for HVIEN PMU overflow bit
> (2024-12-06 18:42:38 +0530)

Pulled, thanks!

Paolo

> ----------------------------------------------------------------
> KVM/riscv fixes for 6.13, take #1
> 
> - Replace csr_write() with csr_set() for HVIEN PMU overflow bit
> 
> ----------------------------------------------------------------
> Michael Neuling (1):
>        RISC-V: KVM: Fix csr_write -> csr_set for HVIEN PMU overflow bit
> 
>   arch/riscv/kvm/aia.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
