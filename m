Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA32D74959
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 13:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AdhRX2USONadL/a1vLT2K73XOPJOeuPzg08Fpdn32v0=; b=o38k8r9v8nO2TY
	aXYMT0O1radBRDflWcGAwC8ZGPjPMIrxU/en7Wp3WlJCYZhYt4/qbWqILDWovcC5orGY8OHabg5la
	tlv38ONaaif5A4M9L01hhFl8FocbNOBfJXvbYtLlgXcmtu00zfe7CEP3wEOh6LkZoW7mQ+vQrvLoO
	vBsYAJc2IIjydQt+ZvJcr3EGGjtWeCynd/MV283Dn8BQNPJ9d5Y2fv1DLdiPGfHQpDH+tFzpRp+Tw
	9JaVIHZuwe9Hui2uSU396FYkBkZRhtfLapjKoSX9u9v7zKbadJh2L+ZdwfhEKMizS/ZCDpbIlNjdQ
	//8K5cvqvOT5hkoObPAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Uyq-00000003eWy-0hYd;
	Thu, 31 Oct 2024 13:12:52 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UwO-00000003dsg-3ODa
	for linux-riscv@lists.infradead.org;
	Thu, 31 Oct 2024 13:10:25 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730380218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n9KzjzVNQ8Kocvxcj31qY9sIt3lmgpdIUIkiScgCA4Y=;
	b=cZPr7c9reVDeCHTlZwoxBPVYMZlN3G/dTVTQdkTTDaJ89tpKCtPo8EkeU27J1U2NKhv801
	5lQ0w7+al8WvIbp5qPeOp/1W71eF8XFHZovHvM873GgwnxRq/Wbt0xNjgYs67PA6+YUmqW
	YiJm4SpGCaaksFnT/OFSdM3lHs0Sp5MutH9zzBB5TdFzfp+a8x9ghckGs0o8Tax/4jQUOG
	w/PEpAZwP+Jg6A7cJMeQab4KduJXxkwIUpec86VkGxT0qh71AYiixi0+C9gztjf/KqJdG3
	xU/vFXaYaRr3/+M/M+lvpCJ0JLpb3TE7ckYAMlPLqIoWf5ffv2uobiVI/rLJ4w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730380218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n9KzjzVNQ8Kocvxcj31qY9sIt3lmgpdIUIkiScgCA4Y=;
	b=r/WF7NtEoHc5yMmmmEgyNRfuKPAwN6UMWQX7pGgI8kOncV4SLVrtCGL1KPWEVsxsmKVtXe
	sWw/W+y07XAozBDQ==
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Chen Wang
 <unicorn_wang@outlook.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Peter Zijlstra <peterz@infradead.org>, Inochi Amaoto
 <inochiama@outlook.com>, Guo Ren <guoren@kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Yangyu Chen <cyy@cyyself.name>,
 Anup Patel <apatel@ventanamicro.com>, Hal Feng
 <hal.feng@starfivetech.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 1/3] dt-bindings: interrupt-controller: Add Sophgo
 SG2044 ACLINT SSWI
In-Reply-To: <20241031-armored-marbled-36cfb6d599e3@spud>
References: <20241031060859.722258-1-inochiama@gmail.com>
 <20241031060859.722258-2-inochiama@gmail.com>
 <esuteqvz37blehx6wa5cj5ixlglcbullhuls3rcvjtuiviqqpb@ojho3arlnwst>
 <20241031-armored-marbled-36cfb6d599e3@spud>
Date: Thu, 31 Oct 2024 14:10:18 +0100
Message-ID: <87ikt8wh8l.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_061021_114185_4AD10BAD 
X-CRM114-Status: GOOD (  11.59  )
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

On Thu, Oct 31 2024 at 12:38, Conor Dooley wrote:
> On Thu, Oct 31, 2024 at 02:14:40PM +0800, Inochi Amaoto wrote:
>> On Thu, Oct 31, 2024 at 02:08:57PM +0800, Inochi Amaoto wrote:
>> > Sophgo SG2044 has a new version of T-HEAD C920, which implement
>> > a fully featured T-HEAD ACLINT device. This ACLINT device contains
>> > a SSWI device to support fast S-mode IPI.
>> > 
>> > Add necessary compatible string for the T-HEAD ACLINT sswi device.
>> > 
>> > Link: https://www.xrvm.com/product/xuantie/C920
>> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
>> 
>> Hi, Conor,
>> 
>> Could you review it again? I have updated the description of
>> the binding and mark the device is T-HEAD specific.
>
> Only thing I would say is that
> title: Sophgo sg2044 ACLINT Supervisor-level Software Interrupt Device
> should probably be
> title: T-Head c900 ACLINT Supervisor-level Software Interrupt Device
> or similar, since this isn't Sophgo's IP.
>
> w/ that,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> (dunno if Thomas is willing to change that on application)

Yes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
