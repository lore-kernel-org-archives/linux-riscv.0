Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48C0C77B7C
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 03:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iSKfF8CmWNFhOMeuEp/DBLorue27W2AHXAFb1JAhcVo=; b=xlq2FsaGql5/qv
	eHwjfpX2iX4n0PqBrEGUTHTAuUTVZVyR19L44cve2Ru9XjEOL4dMbnFZnDd572Un6yvWtqqkhrVfx
	Xz6tMEqKspNFkDmaXyYiuiigfyqzfj81IWBBn5jpkJ6u48AUGly7S73Ow7Fq/RYQTisTaEEGh4dnQ
	eZ9w8RI0uVI9ch+/zrX1hrz9Vybfp6zzKDGuIbq1HGnwPIh8o6GzGPQ9MXJ6kydyZq2gxulpB7aoi
	6pS0d45VMxL5z6PX+nQAC00SC4OemmSSYl8tZJdJL2djoeUWh5q4d7EZO5d/3ZZX3NMtNB+c+bNue
	DDq9EpeLDiICUcDV2shw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0Zei-002wOD-0n;
	Sun, 21 May 2023 03:22:48 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0Zee-002wMk-3A
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 03:22:46 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id E93155C0073;
	Sat, 20 May 2023 23:22:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 20 May 2023 23:22:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1684639357; x=1684725757; bh=5x449E8xOblw0cWhc2zaiCyBHOICHOXIWTj
	e+n35wtI=; b=EjtTcWCh+TATl0B1ppu+eEjmWT6bkd/Z1dLDzpA8brfCmq+zS2M
	MICMbj7XZ/IUEeRugfbjWi8l9hg/Eqj/m9q1BnyDpDiza4zMRZg2ebbQW6wmiaqk
	wSjmmpd/EV2tMI3DjxwUYdf0bhCQCI5TlV5wsrqWjBJM2Rmmm7bRg5PffH0JsAXQ
	Uez4r12kKLLhfQid8sMnXI36N9qRePhiCWc6+AFUUV3auvX6VRzCt8LeCzZd0zsI
	pRGb8tMF2lsgqRSDFT+vopNd8qDC1dWaJ3mxoaO8VpXauTIFNUBPBJ1hfv8ruwGG
	5CMXEGCagyopfcW6fG5phHP94cr/m6t/fjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1684639357; x=1684725757; bh=5x449E8xOblw0cWhc2zaiCyBHOICHOXIWTj
	e+n35wtI=; b=G05n+AltallEGNUVXYH17ypowjA8m+ND4dth3mdHO35rYgtI390
	x95JOdFUmXj0Va/RthgNlqWBgZbEFDciRxK8omPhaebCusJZtefTljzL/Mn9oSDV
	emGolvlAZ1AeNRlsYG955vt0ql0CfUH1iQ26uncu5NQx4PaYduNtjd8NpDgXjNYW
	91BsKGnH7urKNK7zvcHDtRileZT2FUPU/HyMetndXhw6rEMk5GvjptFVwpD7kPIj
	4TVCaWYru1KfgWMz5fd9sPjs4VMyloGxp0nXIUcP2k0ess0dXKuc3ow7jjGEs+SE
	5UoVJKOfYWYzwF2aTvJvdBmfEV3aZ83pRyw==
X-ME-Sender: <xms:fY5pZJSiHUyjM8DxzMZ6P4obLTPGHBerBHXZDXd2C8jCrcvsvlN_lw>
    <xme:fY5pZCxNFYn2P-Jtu0cEXFVXIYsFI4AiwMQ9eOItDQ74jBocWViG0wF9HliLAVZij
    ni4UPuXhnFxfFW6zQ>
X-ME-Received: <xmr:fY5pZO27V8WyJw4lJo8OuChWYJC1oIM3x-Exkyk6bZC87-z7dOXDDnHpzH71Gajrtcx9Dek5OXnIXYLeOTMIfChqf9IIRiXK2ylMd51cWrB75NFur0NLy6rQvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeikedgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfvfevfhfhufgjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeejgfffhfdujeeftdeuudeguedttefgieetffffheejuefguedv
    heejteeftdfftdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:fY5pZBBekeLprzpI4h8vjuEu24cNSyqf3eVQcSzb3FO_uQ2JodkDBQ>
    <xmx:fY5pZCgxa-XbBl9A-fIsGlQmW3FeA4cm1MTPYFXXOJL6XhCbQRTTyg>
    <xmx:fY5pZFp6lH4KWGXIbwraOziZusg7LxduYl937an2WCvISqsZRceDNw>
    <xmx:fY5pZLV50QlMhrKsAZpnbRyz5eRmuTkDRnr8aDsK4asVGVf3STEpVg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 20 May 2023 23:22:36 -0400 (EDT)
Message-ID: <51339689-b92f-52fb-9202-2b91733f9180@sholland.org>
Date: Sat, 20 May 2023 22:22:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Drew Fustini <dfustini@baylibre.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
References: <ZGl8gn/rD8WZ0nak@x1>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: riscv: boot failure for 3335068f8721 ("riscv: Use PUD/P4D/PGD
 pages for the linear mapping")
In-Reply-To: <ZGl8gn/rD8WZ0nak@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_202245_626945_9147605F 
X-CRM114-Status: GOOD (  18.75  )
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

Hi Drew,

On 5/20/23 21:05, Drew Fustini wrote:
> Hello, I tested 6.4-rc1 on an internal RISC-V SoC and observed a boot
> failure on a Store/AMO access fault (exception code 7) in __memset().
> stval (e.g. badaddr) was set to 0xffffaf8000000000. This SoC is RV64GC
> with Sv48 so it seems that address is the start of the "direct mapping
> of all physical memory" [1].
> 
> The 6.3 release boots okay and the system is able to operate correctly
> with an Ubuntu 23.04 rootfs on eMMC. Therefore, I decided to bisect and
> I found the failure begins with 3335068f8721 ("riscv: Use PUD/P4D/PGD
> pages for the linear mapping"). The system boots okay with the prior
> commit 8589e346bbb6 ("riscv: Move the linear mapping creation in its
> own function").
> 
> The boot log [2] shows that the fault happens right after buildroot's
> init script [3] uses switch_root to execute init from the Ubuntu rootfs
> on the eMMC.
> 
> DWARF4 is enabled in .config [4] and the decoded stack trace [5] shows:
> 
>   epc : __memset (/eng/dfustini/gitlab/linux/arch/riscv/lib/memset.S:67)
> 
> From memset.S:
> 
>  Line 67:         REG_S a1,        0(t0)
> 
> From the oops:
> 
>  epc : ffffffff81122d6c ra : ffffffff80218504 sp : ffffaf8002e47500
>   gp : ffffffff82695010 tp : ffffaf8002e2ec00 t0 : ffffaf8000000000
>   t1 : 0000000000000080 t2 : 0000000000000001 s0 : ffffaf8002e47550
>   s1 : ffff8d8200000040 a0 : ffffaf8000000000 a1 : 0000000000000000
> 
> Thus I think it is trying to store 0x0 to 0xffffaf8000000000 which is
> the start of the direct map. From the boot log [2], OpenSBI shows:
> 
>  Domain0 Region00 : 0x0000000002080000-0x00000000020bffff M: (I,R,W) S/U: ()
>  Domain0 Region01 : 0x0000008000000000-0x000000800003ffff M: (R,W,X) S/U: ()
>  Domain0 Region02 : 0x0000000002000000-0x000000000207ffff M: (I,R,W) S/U: ()
>  Domain0 Region03 : 0x0000000000000000-0xffffffffffffffff M: (R,W,X) S/U: (R,W,X)
> 
> The DDR memory on this SoC starts at 0x8000000000 with size 2GB. The
> memory node from the device tree [6]:
> 
>         memory@8000000000 {
>                 device_type = "memory";
>                 reg = <0x80 0 0x00000000 0x80000000>;
>         };
> 
> I think the direct map address 0xffffaf8000000000 would map to physical
> address 0x8000000000. Thus I think the attempted store in S-mode to that
> address would violate the PMP settings for Region01.
> 
> I do not yet understand why this happens with 3335068f8721 ("riscv: Use
> PUD/P4D/PGD pages for the linear mapping") but not for the prior commit
> 8589e346bbb6 ("riscv: Move the linear mapping creation in its own
> function").

Where does Linux's DTB come from? It should be the one that was modified
by OpenSBI to add a reserved-memory node matching PMP Region01
(fdt_reserved_memory_fixup()).

Before this commit, Linux ignored the first 2 MiB of physical RAM. So if
OpenSBI was loaded in this region, you could get away with ignoring the
firmware-provided DTB; now you actually need to use it, as intended.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
