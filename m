Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F3E606A319
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 07:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m/OLe44W;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=gupQZ37J;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GewONFtE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y7gOTQBitfcsjyB7vghXd6alEYk7e4hqn+igIt7HbSM=; b=m/OLe44WIbth0m
	NMi6S7bZtVZIah6uqr7V31GPvZFVKv8oCct3WiPqXxjPHgFxESpiqh/NVoZLjuVwQdU7RGrbmBzXI
	W1v7E150BVJY2pIspaHW8hwldDE0JkpNEe3ueDibPxn+qHh1/PWwgnbt9jLeHcpxey5znBcRsrDHq
	4qmQxePcXdJjCUlDycOVBSCdhoGbnGQVnybvH3ypJaKtqEzu6i1FWskecMNBK8rukrtBwJh6Fw0f0
	NY4a1PLxGyPoUCKfbRetajm6LSlHXAtNiYgLn5ft/fenmcUtbcva19uEdBo/kPSxrX+w8GRYu1KDQ
	raiauYgIq6Toxbl8NrAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmqi-0000000DXAT-1kxD;
	Thu, 22 Oct 2026 07:04:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmqg-0000000DX9H-3Ysy
	for linux-riscv@bombadil.infradead.org;
	Thu, 22 Oct 2026 07:04:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+ByBpVD7FPTufElpNoOF6mqXMOL+Kv6Ik0YaJGkEPtg=; b=gupQZ37Jklo5TUhWfrX0oHVpRh
	OTy9Mija8Ds+8k2Iy6sA0mRjQDoEnzXYlVH0ENSJkhazZpoP5N9ErQvX/1IljeMHhedcZb9LnZ/3D
	OwZmrNEZgWBPetTo8GABze2yfYyHG2AI/s2h0Tm/T5nsFTZtzMjBGYdRgXHY+hn469X4+xuo0oyjO
	CbPtwDY0yxpan9Qmwk3/KM0/7aI2DisOI3tC+y62VV9UZcgFu1Y/06N0TDYU11Vorn8HdAEbQGA94
	nOE+8U874XrL0S9AHjgJFZknZLB4SgK3ocqu9AoXIA3Em/MtRxgD0AY0G1bDqRUP/VT82EpX69rYK
	H2j/lkig==;
Received: from mail-pj2-x08.google.com ([2607:f8b0:4864:39::8])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJmqZ-00000006XMp-2vka
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 07:04:25 +0000
Received: by mail-pj2-x08.google.com with SMTP id d9443c01a7336-2e4a61a2ff9so5392105ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 00:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792652657; x=1793257457; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ByBpVD7FPTufElpNoOF6mqXMOL+Kv6Ik0YaJGkEPtg=;
        b=GewONFtEPkfPZnIRMeU5EnecWvrmzWCSKgScWzyiY80kPdpys4iWqSE22mRL5ReEK1
         KDu6xkgFmjcJgwG5MqgbWov7/fCcZeZmI/Pna/fiXi5tAz4UZ7jjjmUUSibt86Fo/Ol9
         Ewgh0hK50hP3RMVcURUAYWzmzMP4l7G3TY0Vd4L/YXgrrETOA0dPOr5Wnqa6ZcPM9ioL
         h2fPoPsEQlIAmdY87Gi5l5WN6PyOL+Ttfsonbsv/nqMFdqY0UXf6IGj7zoolXsFWvhnK
         fT4MZy6kDvFr3JboDEfMLVpiBjYRJ4DBN2ykjfuafURDhXjGzU3N4pxAAQzd1b+M2jGb
         WWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792652657; x=1793257457;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ByBpVD7FPTufElpNoOF6mqXMOL+Kv6Ik0YaJGkEPtg=;
        b=z7Jmai9mSlx9wOZg8k5/vNEoP9YEU7CX+5HOYxh1hBgiiQRzgDTVIR44HaF6SXwjui
         2byxX39CQpF2lDrA5mMu0ImEcibeuUkJljg3EKhAV4vhrrXbLdMizS04GxbNcbF9pkkw
         PQoSc53gyq7i3SQZwiRbwXHw/NI3sD169pmgbamlKxZwEIOgpyi3pvhuv/mDrks/qgsx
         pYTHKAezetTBvkF26cNI/AcghW4KaVsaYULHZEhpIaEYaBSDQV/gq+cD8lSx3HOTMTZH
         RNUVstrGgcepKnYPwNsrumNWTj77j72EvyV0rB0U8vAcpyjQCXA72qd20WiIZ9rqjZK6
         6g7Q==
X-Forwarded-Encrypted: i=1; AKwUvByH99ttGzBoX2sAuKgdHrB7KXZ1kRMD4Wq0cgAAsaLBD0CVVdjP8sCylTcj5h9MGNaiPQgm42KsC/BQOQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJdnrWfC9P7WemLFB/CnllcABw5RzonP0djlKT0AT+VGO/e/+V5
	8b4SgdG9AfZv4ErhzMEIVjRUPyhqKBX2EUs5S6SHu9xaW/R02KXimN1q
X-Gm-Gg: AYBFou0w0b2NINYXCVTR07efgue8fZnqhU40DovHC0ui8E1/igdVpJrlTIfwIjUaVXU
	cp+ZIOU95fKHuL9E/t6zzahLgyZ27PkJRL+MG7jqXBsu8L4LojugGQYGChSR1f9frDILfohZNX5
	jhYjWkFVoVSCXUxieyQsT4uEF/qYLwNotNUbO2dzLMZaJ2EU91rAn5Vmx4xMW22zrfPoCFEkSf7
	2vVf8WXjv6pR3TKzc1n4U1P+jyUQIVF3kWqI6AvnHV9QmnraUOotVzWT6fH3qwfa+zLewhV7sNJ
	Rtboc38RIKm1KrUr/aP6SnrbfwXlm8ldpiFNibpBhR3CFGbR88K0UEe1Ebfr8QBuDYw2VqSqEih
	y+cpr0Q/MxDs3xJnt/35JHc9Y5BJ3m+ixmgYxneoo8JpzlS27w2fT51h2ykW7f+27DPJmzvmGP0
	RpkgkBA4aaSis/cnhYXqUmtQ4hB55yE0JqeXlO/8LeU6Q+BhIgEW0IDvgj/SadcepTBJDAwVOmX
	uGx6HpRjlfeG5TLGjYm5Z7ypCCqeHyl5ceE6vTgeK9VfdMPU1RoxEeRXPAV5e0=
X-Received: by 2002:a17:902:e947:b0:2e9:9bac:2e84 with SMTP id d9443c01a7336-2ea43d3a8e5mr34417885ad.66.1792652657298;
        Thu, 22 Oct 2026 00:04:17 -0700 (PDT)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b43478csm19901295ad.28.2026.10.22.00.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:04:16 -0700 (PDT)
Message-ID: <95f18ef2-8fda-447e-bc64-1732febea363@gmail.com>
Date: Thu, 22 Oct 2026 15:04:02 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/8] kdump: reduce vmcore size and capture time
To: Rob Herring <robh@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>
Cc: baoquan.he@linux.dev, m.szyprowski@samsung.com, catalin.marinas@arm.com,
 will@kernel.org, mark.rutland@arm.com, chenhuacai@kernel.org,
 kernel@xen0n.name, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 saravanak@kernel.org, akpm@linux-foundation.org, pasha.tatashin@soleen.com,
 pratyush@kernel.org, ruirui.yang@linux.dev, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org, linux-mm@kvack.org,
 iommu@lists.linux.dev
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
 <20261021132308.GB3667411-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20261021132308.GB3667411-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_080423_203492_32ED5B9C 
X-CRM114-Status: GOOD (  15.71  )
X-Spam-Score: 0.1 (/)
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
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/21/26 21:23, Rob Herring wrote:
> On Wed, Oct 21, 2026 at 04:30:03PM +0800, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> On SoCs that carve out large firmware-owned reserved memory (GPU,
>> camera ISP, ...), kdump currently dumps those carveouts as part of
>> system RAM even though their contents are firmware state that is not
>> useful for kernel crash analysis.
>>
>> ACPI systems already filter reserved memory out of the vmcore through
>> their existing path: firmware reports those carveouts as unusable in
>> the EFI memory map, they get MEMBLOCK_NOMAP set in memblock.memory
>> (is_usable_memory(), efi-init.c), and the ELF header builder has
>> always skipped nomap regions; only DT-based systems currently fail
>> to filter these regions, which is what this series addresses.
>>
>> This series introduces a MEMBLOCK_NODUMP flag (suggested by Rob) in
>> memblock to filter reserved memory on DT-based architectures. A new
>> flag is needed because MEMBLOCK_NOMAP can only express regions without
>> a linear mapping, while MEMBLOCK_NODUMP can filter regions that are
>> linearly mapped. Reserved regions are marked MEMBLOCK_NODUMP by default
>> so kdump omits them; reusable CMA regions are different because their
>> pages are handed back to the buddy allocator and may carry crash-relevant
>> data.
> 
> There is little point in continuing to send new versions until Mike 
> agrees with MEMBLOCK_NODUMP being added. You didn't answer him on v7.

Hi Rob,

Thanks for the reminder. On v7 your reply to Mike stated exactly what
I wanted to say, after a week without further objections, so I assumed
the question was settled and went ahead with next version. That was a
mistake on my part: I should have gotten Mike's agreement on the flag
before sending a new version. I'll hold off further versions until then.



Hi Mike,

Sorry for not following up on your v7 question. The reason a new flag
is needed is described in the v9 cover letter:

    A new flag is needed because MEMBLOCK_NOMAP can only express
    regions without a linear mapping, while MEMBLOCK_NODUMP can
    filter regions that are linearly mapped.

Put differently: today, whether a region ends up in the vmcore is a
side effect of how it is mapped, mapped regions are always dumped,
nomap regions never are. Nothing can express "mapped, but not useful
in a crash dump". MEMBLOCK_NODUMP decouples the two, and DT is simply
the first user.



> 
> Also, I intend to apply this[1] before any further reserved memory 
> changes which will greatly simplify the code.

Understood, and it makes sense. It removes the two-pass reserved_mem
initialization and indeed simplify the code, I'll rebase on top of
it once it lands;


Best regards,
Wandun




> 
> Rob
> 
> [1] https://lore.kernel.org/all/20261015082315.56876-1-m.szyprowski@samsung.com/


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
