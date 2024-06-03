Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C07C25B76
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 09:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fOc+PyuB9o/ekYgw0LpoU+VVKpk8x/PSoIa4uEbZDi4=; b=GdC/uDrZ1W1UCH
	zToeiZ5sRSwRC3bisfQx1M0ZyHmvTJkKTQshVqWNNjnHmQo3FmUjEA49jKz6y7Ah8q61bDEZ0Necs
	eBIwakMsD4byXneE6pojYcdpGwexvS+JgQCLYKjaaDbPAkR7XzwqTA66qGciu9CPYGUXzFMZHDXqV
	koRiPL0vbWL69hQoam7BDKB9SyffnG0TwP4zn+KOBI5Sw8YtXEU+15JjbsxgElllWDqsBpzRAxXG+
	Z2R2VSdWaKlRF6xR6i7eurX9aCnIkMyPv+a2cdYu+RnlUvqTWm23byUs7utMrMDQ4hJx5f8ZV7MRb
	FkfAuoFm187edNNAEVzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE3mS-0000000G9o2-1NRw;
	Mon, 03 Jun 2024 09:15:04 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE3mP-0000000G9mS-01z8
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jun 2024 09:15:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8477CC0005;
	Mon,  3 Jun 2024 09:14:50 +0000 (UTC)
Message-ID: <b199fde6-c24e-4c18-9c38-fdc923294551@ghiti.fr>
Date: Mon, 3 Jun 2024 11:14:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>
References: <20240531162327.2436962-1-jesse@rivosinc.com>
 <20240531-uselessly-spied-262ecf44e694@spud>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240531-uselessly-spied-262ecf44e694@spud>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_021501_277571_727A8CFF 
X-CRM114-Status: GOOD (  19.41  )
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

Hi Conor,

On 31/05/2024 19:31, Conor Dooley wrote:
> On Fri, May 31, 2024 at 12:23:27PM -0400, Jesse Taube wrote:
>> Dectect the Zkr extension and use it to seed the kernel base address.
>>
>> Detection of the extension can not be done in the typical fashion, as
>> this is very early in the boot process. Instead, add a trap handler
>> and run it to see if the extension is present.
> You can't rely on the lack of a trap meaning that Zkr is present unless
> you know that the platform implements Ssstrict. The CSR with that number
> could do anything if not Ssstrict compliant, so this approach gets a
> nak from me. Unfortunately, Ssstrict doesn't provide a way to detect
> it, so you're stuck with getting that information from firmware.


FYI, this patch is my idea, so I'm the one to blame here :)


>
> For DT systems, you can actually parse the DT in the pi, we do it to get
> the kaslr seed if present, so you can actually check for Zkr. With ACPI
> I have no idea how you can get that information, I amn't an ACPI-ist.


I took a look at how to access ACPI tables this early when implementing 
the Zabha/Zacas patches, but it seems not possible.

But I'll look into this more, this is not the first time we need the 
extensions list very early and since we have no way to detect the 
presence of an extension at runtime, something needs to be done.

Thanks,

Alex


>
> Thanks,
> Conor.
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
