Return-Path: <SRS0=wDqN=IJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB5EC433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 03:50:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF9F364E20
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 03:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF9F364E20
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:MIME-Version:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NVisb8rsC3csBmd43A83PKiChUEwSOJVIqb0Xy5NCLc=; b=reYGvLKssQ2mTlzb9B+PbekDB
	X0lvbwTcNRGPyjIyw6hAHhHMtnnNiK2eHA5YuW/vaNqXhrfWDAiKr0o1tQAkOnTc3whdXpr6a4vDe
	pgEdP9icCLMkJ3h5scFnhQT3apbI8ZhSQaNzjimsRo+PXacv3eviDohb+Fvb45oFeQrt6JaYuUsiJ
	S3pgp8m13fr20Q1gXF0Sbzn8m7rXDzbPN1cVaTUgxQqkKlrlzVBcAP072iYFr5Xsjwq4YDW6NavzW
	yB0+Yuw6ZkecHwjjpbFaFuzQyIwdhbP42fh71vk2K1nuFdLmkjRWhw0iiWAw5aYArcSDEPyIxPFqM
	zmXhWfy3Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKCLC-008K49-7F; Thu, 11 Mar 2021 03:50:26 +0000
Received: from atcsqr.andestech.com ([60.248.187.195])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKCL4-008K3F-Se
 for linux-riscv@lists.infradead.org; Thu, 11 Mar 2021 03:50:23 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 12B3o4ee065379
 for <linux-riscv@lists.infradead.org>; Thu, 11 Mar 2021 11:50:04 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from APC301.andestech.com (10.0.12.128) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0; Thu, 11 Mar 2021
 11:50:02 +0800
Date: Thu, 11 Mar 2021 11:47:07 +0800
From: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
To: <linux-riscv@lists.infradead.org>
CC: <alankao@andestech.com>, <ruinland@andestech.com>
Subject: Re: [RFC patch 0/4] riscv: introduce alternative mechanism to apply
 errata patches
Message-ID: <20210311034707.GA7334@APC301.andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: 1615175897-23509-1-git-send-email-vincent.chen@sifive.com
References: 1615175897-23509-1-git-send-email-vincent.chen@sifive.com
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.0.12.128]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 12B3o4ee065379
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_035020_886067_F4891167 
X-CRM114-Status: GOOD (  23.12  )
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


> With the emergence of more and more RISC-V CPUs, the request for how to
> upstream the vendor errata patch may gradually appear. In order to resolve
> this issue, this patch introduces the alternative mechanism from ARM64 and
> x86 to enable the kernel to patch code at runtime according to the
> manufacturer information of the running CPU. The main purpose of this patch
> set is to propose a framework to apply vendor's errata solutions. Based on
> this framework, it can be ensured that the errata only applies to the
> specified CPU cores. Other CPU cores do not be affected. Therefore, some
> complicated scenarios are unsupported in this patch set, such as patching
> code to the kernel module, doing relocation in patching code, and
> heterogeneous CPU topology.
> 
> In the "alternative" scheme, Users could use the macro ALTERNATIVE to apply
> an errata to the existing code flow. In the macro ALTERNATIVE, users need

In general I love the idea of fixing errata dynamically, yet in the past,
vendors sometimes bump into the dilemma on the necessity of using alternative
framework or just plainly "ifdefine"-ing the CONFIG_ERRATUM_XXX to toggle their
fixups.

Quoting from the Qualcomm Falkor E1041 dicssusion threads [1][2] :

"Just do it with an #ifdef"

"There's really no need for this to be an alternative. It makes the kernel
larger and more complex due to all the altinstr data and probing code."

I wonder if there will be similar disputes end up here. And having a conclusion
on what should be resolved by alternative and what shouldn't might be more
complicated since we're having a more diversed group of vendors (or "users" who
can access the errata as you mentioned).

Cordially yours,
Ruinland

[1] https://lore.kernel.org/kvmarm/20171201112457.GE18083@arm.com/
[2] https://patchwork.kernel.org/project/linux-arm-kernel/patch/1512957823-18064-2-git-send-email-shankerd@codeaurora.org/#21249629

> to specify the manufacturer information (vendor id, arch id, and implement
> id) for this errata. Therefore, kernel will know this errata is suitable
> for which CPU core. During the booting procedure, kernel will select the
> errata required by the CPU core and then patch it. It means that the kernel
> only applies the errata to the specified CPU core. In this case, the
> vendor's errata does not affect each other at runtime. The above patching
> procedure only occurs during the booting phase, so we only take the
> overhead of the "alternative" mechanism once.
> 
> This "alternative" mechanism is enabled by default to ensure that all
> required errata will be applied. However, users can disable this feature by
> the Kconfig "CONFIG_RISCV_ERRATA_ALTERNATIVE".
> 
> The last patch is to apply the SiFive CIP-453 errata by this "alternative"
> scheme. Therefore, It can be regarded as an example. According to the
> results of running this image on the QEMU virt platform, kernel does not
> apply this errata at run-time because the CPU manufacturer information
> does not match the specified SiFive CPU core. Therefore, this errata does
> not affect any CPU core except for the specified SiFive cores.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
