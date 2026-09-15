Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1D7C88E53
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 12:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nFePxXNJUnVR/di/27pzrK+bT53i6wkq5sTvgHWFxhU=; b=KiC0ZrpxvADq5R
	jPdyylalv/TUVzVUF/GI7lPNHsNaroFh2cNiABFl6w2pDIOHoGNoeOgeUict8HSgKJ8ITS0d7s1XY
	H3ByRadkfGrY3vg4jPdrWc0UHAZ5pmwkVp8kwrqgWhJsDtdi9SxIP+1bngKZprWIIsV71DriXt5D5
	PU8ubR8ukLyZYutVaXyrKnZQ75XPq7H7WUVNsPIJ6attcfAOk013h7P8pKMNDktyj/ppgSFxZRsAA
	f4pWb/8in1GAogeakfQ9vpGK7BoB8a83viFoPFf+fEJf/F/LHsJNWD9NF1wSxU8l8+50I+8p+wAJA
	VU67+Qtj+EhZccPysMBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Sbh-00000006bTw-2t7q;
	Tue, 15 Sep 2026 12:49:53 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Sbd-00000006bRs-0CEb
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 12:49:51 +0000
Received: by mail-pj2-x01.google.com with SMTP id d9443c01a7336-2dae660f31bso31695235ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2026 05:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789476587; x=1790081387; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mP8qopDle1Sc4k8F6w5GND/XUp1RUEWcrZG95tdjUPs=;
        b=M3ywVOe+TADQyZY+fVMlixNJFD0+M6ZssEjauOFGcytYu/Ve0wNxH8o2cnQbgVd6+h
         VeGSpUzBAcCP/Kp01nHBfEhoQ4SvtrolE7Z7kHf2Uw8vRu8NdMfQGnDh+jyGZ2qC6moj
         y8aMSKq+ZiBHS2R1vLRAeqiPnFfIP5PB3OHRNeo5N3dBAsJb4FgtKFziqlZDfnMJJpJS
         Wy03UbrfPUkj/ZegypepypCXToggrkg676Yl6uNCqgJ+cKpUpeU8X+dHhee+zzgFPvAo
         3ZrNKIhWUKD7DQKHu6SJQCEzhk2dYUOgTxtWkj24Ov1UADRxO/EfmNMqFE03JLFN7Sfs
         NiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476587; x=1790081387;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mP8qopDle1Sc4k8F6w5GND/XUp1RUEWcrZG95tdjUPs=;
        b=wDSRFDIR/FiXQgsnYxMv9o9TitiJ7wnLGI0z0p2vELeRQ01z60hSc+hEJgd1SObqQb
         1fpqs4KkVr91/nNYXTXFK2jClue1RMosUMsdlQsfM3XD5BUmZuAyXzE06qCvXmnvErJp
         7N9hZGnK9SriHHpMHztZVYwBpENjiKTmp+Fqt4P321mO9OIM9HoIUUq+9OKXXx/M2wnt
         YT1JXja6Y4yEUcWzIva6/in2v3ytACe186NzhvaLRGfp8k7P0bF1KI21+Bm4uIE8yNT5
         uwNGIMX6g98Rdusx+P66Qdc1JBUQAgoSnVBpAnmNn2baCUyJYcMz4u8mo3ReP3j8AM9b
         E+gA==
X-Forwarded-Encrypted: i=1; AKwUvBx6n4EX8KIWP4yMvHQzSjwdpnALl0tNhuA80DEzQmY0HyLaENW7B9ILrssoY6n88dLZrfHJQN+X4UFJgw==@lists.infradead.org
X-Gm-Message-State: AFuF++ktKGrrWB99TPrpaxDfhqFm2+qPCTkbuZaULPGaLPUvPVV/t7sb
	3u1GG9WRA9oSVSAk5P/wvsFnb1sw9kRgmBWiNHbnPWNuyXDRNibR9a7q
X-Gm-Gg: AYBFou1f+YFy1OS66GCjOLbmT9xCYYHMLunD4U1m6mNMmfiljBuko08lxYqqbeeWCNh
	2+yxHZqM1K4iLNUGauXgECiXjzwlQPFGERH1DrhKUilB/4uB9HDiYapMJq6meB2eDE7L/ekWiP9
	qQ8paF3GvOgX8aSkq8RktJrl4fajOZAh330GGOJ1BRGOJTitLqI6NhO8/uH+IvA05PhWVSdQXPJ
	idmhXHfldBjNOp7O0UGPD9Uq6HwSIWaHVqloEJaE8OjqXwq5bG4svWjGLs+6WsdNKPK1k94nYEI
	cTLBFWpG6MFlzP04jOd7CVSqAfAZDEObi5f3/aZOaP7ZF1yXMOKrOus1qsCIKdnv1Lqsq57C/XO
	bv3cL0VXBFzkO6bLwIO/r3+5KWXK2UmzuVACNDHXUiItfDPkeenaTT5O/cqz4wBJMDsID3O6eaw
	Fbcqj328qpjuCwDGceXLToY8Kjz/0DFMlb2o0RPuq+vkEdkqQMCq82bYngxYGQr5d2nSA01XMxX
	vdDbI4=
X-Received: by 2002:a17:903:1a0b:b0:2d8:d4cc:be64 with SMTP id d9443c01a7336-2dd6c7134b4mr167097285ad.17.1789476587316;
        Tue, 15 Sep 2026 05:49:47 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd6f8ebbdfsm26424855ad.38.2026.09.15.05.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 05:49:46 -0700 (PDT)
Message-ID: <86a09d26-2de8-4590-b135-31564e2c7049@gmail.com>
Date: Tue, 15 Sep 2026 20:49:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/10] mm: memblock: add missing HugeTLB flag name
To: Mike Rapoport <rppt@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org,
 baoquan.he@linux.dev, pasha.tatashin@soleen.com, pratyush@kernel.org,
 m.szyprowski@samsung.com, mark.rutland@arm.com, kernel@xen0n.name,
 alex@ghiti.fr, hpa@zytor.com, ruirui.yang@linux.dev, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org, linux-mm@kvack.org,
 iommu@lists.linux.dev
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <20260902073116.802752-2-chenwandun1@gmail.com>
 <178936321614.3691424.10386784926753862087.b4-review@b4>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <178936321614.3691424.10386784926753862087.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_054949_097814_49557FF7 
X-CRM114-Status: GOOD (  10.17  )
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



On 9/14/26 13:20, Mike Rapoport wrote:
> Hi,
> 
>> Commit 7d163a75f821 ("memblock: make HugeTLB bootmem allocation work
>> with KHO") added MEMBLOCK_RSRV_HUGETLB but did not add the corresponding
>> entry to flagname[]. As a result, memblock debugfs cannot report the
>> flag by name.
>>
>> Add the missing RSV_HUGETLB entry.
>>
>> Fixes: 7d163a75f821 ("memblock: make HugeTLB bootmem allocation work with KHO")
>> Signed-off-by: Meijing Zhao <zhaomeijing@lixiang.com>
>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>> Link: https://lore.kernel.org/lkml/20260821020910.3428585-2-zhaomeijing100@gmail.com/
> 
> Can you please send this as a separate patch, I'll pick it to the
> memblock tree.

A separate patch has been sent.
https://lore.kernel.org/lkml/20260915124641.2498280-1-chenwandun1@gmail.com/

Best regards,
Wandun
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
