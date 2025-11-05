Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CD3CCF9F8
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 10:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0L//sDpROrVXbaw+IqA7JqmnsjsscPYApgmoVtKxrdA=; b=ceU3bur5XJuszV
	KOmXrSJNA5BgAVWYLJiHe+N2JNR5IPSyg2TscVyEJJQofhklRBbrQD/z5Ly0xTze2IoAZda0RCqKO
	4vaeo3AT4HMO1ctLiXyg8neP8dd/6Z0EBRM+wpiWzE5BWiy2lbzx+aWMOMCGUx7W1Cf30dVjqYwK3
	dP15dxumPiMzAMSlO8mOI+TwV4FVeU4HO+boaDNEzSqv6fAtYpJWrKRMxavJHqeJ/bh6RB5CU5YW7
	8AgY2jSArk6xV8V3qq37O/qGRZT1rScU2JNjPYphe/HFjvtxi+CKpgzFb5EWKx8Co/vvaY3t8WyVa
	pmv2OJ1Bs1kQTU3mCfBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaSL-0000000DRp0-0ipH;
	Wed, 05 Nov 2025 10:09:33 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaSI-0000000DRoA-04F9
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 10:09:32 +0000
Received: from [192.168.0.105] (unknown [114.241.85.109])
	by APP-03 (Coremail) with SMTP id rQCowABX1Os1IgtpLC6YAQ--.36657S2;
	Wed, 05 Nov 2025 18:08:54 +0800 (CST)
Message-ID: <0a0b8b94-ad94-46ea-ac0d-cbf35dec0f50@iscas.ac.cn>
Date: Wed, 5 Nov 2025 18:08:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/7] Linux RISC-V IOMMU Support
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 linux@rivosinc.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>,
 iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>
References: <cover.1729059707.git.tjeznach@rivosinc.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <cover.1729059707.git.tjeznach@rivosinc.com>
X-CM-TRANSID: rQCowABX1Os1IgtpLC6YAQ--.36657S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZF47Jr43XF47Ar4rKFWfZrb_yoWkWwc_uF
	Z29r4ktw1UArWxta13KF12vrnrX3s29r10yaykJry2y34rtF4kJFZ8ArySv3Zxtw4fWrnx
	Gw4DGw12vw429jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsxYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07jDsqXUUUUU=
X-Originating-IP: [114.241.85.109]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_020930_421536_42E11A1E 
X-CRM114-Status: GOOD (  12.74  )
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

Hi Tomasz,

On 10/16/24 14:52, Tomasz Jeznach wrote:
> This patch series introduces support for RISC-V IOMMU architected
> hardware into the Linux kernel.
>
> [...]
>
> Follow-up patch series providing MSI interrupt remapping, complete ATS/PRI/SVA
> and VFIO/IOMMUFD support are available at the GitHub [2], and has been tested
> with published QEMU RISC-V IOMMU device model [3].

I'm currently looking into building drivers for some "accelerator" style
devices, and I'm trying to figure out the current situation of drivers
for the more advanced IOMMU features, specifically the ATS/PRI/SVA combo.

I see that the GitHub branch has been rebased in May to 6.15, but
seemingly hasn't been touched since. Is this still the latest version of
these patches? Aside from other IOMMU subsystem-wide changes since
v6.15, is there any other code/information that I should take into account?

This isn't super urgent or anything, but I'm pretty new to this, and
given that a year has passed since this series has been merged, I'm not
sure if there's some other development I've missed.

Thanks for your help.

Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
