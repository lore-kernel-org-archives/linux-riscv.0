Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E60DC5AC67
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 18:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aC0/Uwec4bVkTGQ1h+jiHExkJXHg1aTwG2cHG+y92hs=; b=dzDVTREVDAfyie
	vGYCzW25ePHasf54/dvUGbo/LtxDrBeOUd4mju5swxce9sNoVN2XmjTIZRxlCpEkXBwTFLM5ZvnEJ
	mXJzlhMzDWNwGoRyrfhOhd3acEuG4ryRAxzbKeK0quzHNs+IYPmlmd+xJr0h7nNc/fNUYegzD24OJ
	lQYJJtx8VMA+XKyitqp++sU3TMRCReSyPc6ZAzCUEQ0qkRXhUaDzhGr8M+5+hxqkXcdMSHj4U4l1/
	YZmgrL4hg5IgL7qOj/3W2UmauP4P2Gbmv2UOTsZ8aagnn0tbIeELgYG+r6mx6jsze1Ynl5Tqv3PZQ
	ZN1gaA4jSMG3/DIcYl+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws2sv-00000006UQG-2Gz8;
	Thu, 06 Aug 2026 18:32:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws2su-00000006UPV-0e2a;
	Thu, 06 Aug 2026 18:32:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B9E4A406EA;
	Thu,  6 Aug 2026 18:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8BF01F000E9;
	Thu,  6 Aug 2026 18:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786041123;
	bh=ATZjqoQT7LRR3mM3kyDT1fKkCMOmzavajpIqeRssK7I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=FhWh+1csbKU8E7LYyPtQAIeeCjJQV4o3pExGfcwAYoc7RwkLgkbCRhm8RAis1QhGk
	 YLoBQPAPMjphW1ckP/4jGIDOMx7so2dWoZmYLT+ElGkHARvbBAkKwg/wYfAg5hS1JS
	 dnET2u/vp9YaRinByFs4I2pqwv6Fmn2nboDdhiyjbcp6xmb4CWXFq79k/OsSG0uI0B
	 A1uT1E/S/uJSYSm2kMKFghc9BNK2FCzsNCS4zLh8mC/8mpvt26q/Yc94wdcJWtt/1l
	 ezir/73O14+oh0Gw4gf1ie31BiM/M4BrsWQ+X7SqjG8xmejgXFe5fSRAnDaZfs3DqR
	 qOD8cZSptcaoA==
Date: Thu, 6 Aug 2026 12:32:01 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Guodong Xu <docular.xu@gmail.com>
cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>, 
    Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
    Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
    Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
    Chen Wang <chen.wang@linux.dev>, linux-doc@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
    Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
    Jesse Taube <jtaubepe@redhat.com>, 
    Charlie Jenkins <thecharlesjenkins@gmail.com>, 
    Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
    spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
    linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 06/17] riscv: Add Ziccamoa, Ziccif, Ziccrse, and Za64rs
 to cpufeature and hwprobe
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-6-2c61f94a695a@gmail.com>
Message-ID: <6aa9b348-931b-e358-6005-7e38f97092ef@kernel.org>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com> <20260701-rva23u64-hwprobe-v2-v5-6-2c61f94a695a@gmail.com>
MIME-Version: 1.0
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

On Wed, 1 Jul 2026, Guodong Xu wrote:

> From: Andrew Jones <andrew.jones@oss.qualcomm.com>
> 
> Add Ziccamoa, Ziccif, and Za64rs to riscv_isa_ext[] so they can be
> parsed from devicetree/ACPI ISA strings. Ziccrse is already present
> in cpufeature; this patch only adds its hwprobe exposure.
> 
> Expose all four extensions via hwprobe through new bits in
> RISCV_HWPROBE_KEY_IMA_EXT_1 (RISCV_HWPROBE_EXT_ZICCAMOA, _ZICCIF,
> _ZICCRSE, _ZA64RS), so userspace can probe each of these
> RVA23U64-mandatory extensions individually.
> 
> Reviewed-by: Jesse Taube <jtaubepe@redhat.com>
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>

Thanks, queued for v7.3.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
