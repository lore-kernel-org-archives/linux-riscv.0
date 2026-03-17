Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5171EF3382D
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 09:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WF197MYy2R90uQ20m7KfhwplIQlzshjBgf/4NzAoaE0=; b=WpTusBytX3X7sc
	dmVwZwynufJNwSnfelyXf1/acktKfnsxEJHMFCpdncSDCfubGYnfggR4NoPFaAklelIr4reKSaj1x
	Ug9cOUbDAm37Tdy+Ug34gkaSEt/xWlh86V6VG5xyQIytWKuttKfz5KnlCORhjNtzN5w33IFRfyBer
	g17ZNFdK99jE4mLdEvl7MAuwPpGT+JGloiOCbdiKFQJ2oyiUnHpN9FlOtXEe1NWbc+1w42iGnsKBs
	h0WQrAGdZYj0xLKshFwJ5VUAoPHFoSR8GjTalCDv4Y/SxDPtJpIEGBTJS/+o0QL10za84lOPNYsVp
	5VLVOfjq4/Hsodr0Bo0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2R5f-00000005val-3skj;
	Tue, 17 Mar 2026 09:51:55 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2R5d-00000005vZy-3XSN;
	Tue, 17 Mar 2026 09:51:54 +0000
Received: from [10.18.143.174] (unknown [167.220.238.206])
	by linux.microsoft.com (Postfix) with ESMTPSA id 189EA20B7128;
	Tue, 17 Mar 2026 02:51:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 189EA20B7128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1773741112;
	bh=xbh6eljYGdIRxffTU4mBqSyhNeDzEqtJalkt9/WqCMY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TlHV8gseTBNNxGEDRkCzVMCSmd3juWFaVPdWxwkFVsF6tEp6RFYQ9PhNIvO8/4zhO
	 CwxZjNSs888nrrnCbWD+v1KrGqmach6lg7YTIFingtscICit44Aty6Ge9XFBSArwze
	 0OX07pJe6ypUTXqx3/qSvI1tzRxdT46HbinGl2G0=
Message-ID: <2b1c444c-7545-4ce7-90b0-208aee31904a@linux.microsoft.com>
Date: Tue, 17 Mar 2026 15:21:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] Drivers: hv: Add ARM64 support in mshv_vtl
To: vdso@mailbox.org, ssengar@linux.microsoft.com
Cc: Marc Zyngier <maz@kernel.org>, Timothy Hayes <timothy.hayes@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 mrigendrachaubey <mrigendra.chaubey@gmail.com>,
 Michael Kelley <mhklinux@outlook.com>, linux-hyperv@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20260316121241.910764-1-namjain@linux.microsoft.com>
 <1755043210.33472.1773718457301@app.mailbox.org>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <1755043210.33472.1773718457301@app.mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_025153_928206_E9F453CF 
X-CRM114-Status: GOOD (  14.62  )
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



On 3/17/2026 9:04 AM, vdso@mailbox.org wrote:
> 
>> On 03/16/2026 5:12 AM  Naman Jain <namjain@linux.microsoft.com> wrote:
>>
>>   
>> The series intends to add support for ARM64 to mshv_vtl driver.
>> For this, common Hyper-V code is refactored, necessary support is added,
>> mshv_vtl_main.c is refactored and then finally support is added in
>> Kconfig.
> 
> Hi Naman, Saurabh,
> 
> So awesome to see the ARM64 support for the VSM being upstreamed!!
> 
> Few of the patches carry my old Microsoft "Signed-off-by" tag,
> and I really appreciate you folks very much kindly adding it
> although the code appears to be a far more evolved and crisper
> version of what it was back then!
> 
> Do feel free to drop my SOB from these few patches so the below SRB
> doesn't look weird or as a conflict of interest - that is if you see
> adding my below SRB to these few patches as a good option. It's been
> 2 years, and after 2 years who can really remember their code :D
> 
> For the series,
> Reviewed-by: Roman Kisel <vdso@mailbox.org>



Thank you so much Roman for reviewing the changes. I think we can retain 
both the tags from you. I'll let the maintainers decide.

Regards,
Naman



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
