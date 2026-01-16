Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5D2D48981
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 11:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OVMrG1t5CuuuG1wghSSpN4JdHzWGrgov9NORhB3seUY=; b=y61NOzt07fo/J3
	Jlwk+yoJC8s57noi1hLytI0/KEMKAkZyhzq7HJYlXKlVxY8ZYpvhg6q5RUBCCQxY5rbgLzbDQWJiH
	v95umwsH/hyIhmDaxC55/5Lu4w3iL48z7w3aqlHil3KAzioGD7hGhNwcDxl3mCuremEeoJYr8wA2f
	FlCJ42zi96kEVNYS0OOmxL8+69Ai14RsUNhvwsIxtm0YMrDX2woX73K1kLIA6cPTRdK6MRP1zI5A8
	y3uzkgNf5wrefpjiVLq2X5DMSj3hxzv5w+mDYLhLKhLpXVPqIaHcmvr/l5uE5RfVi+yzfG1ZF5mOU
	hxWs4UgdBhQIAm4nXA+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgiCW-0000000E46W-1PK6;
	Fri, 16 Jan 2026 11:41:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgiCT-0000000E468-33lB
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 11:41:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9091443602;
	Fri, 16 Jan 2026 11:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92A4C116C6;
	Fri, 16 Jan 2026 11:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768563668;
	bh=SSdyas0vSoBFso07VZJpp3rjIqUNAbo0Zr3hqYuqVJI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hdN9YOlva0uIEzxBNhn7K4uMha+BoBRFRXw73SXW1Dr2Ya/dw5KMUxLcM1qBaqy+a
	 PIhIJuEi8IgQ9QUE6evsZuR/0lvx2T7YOjW3+4j1wi+nCla3tA58+n9YqrUFUaPcSd
	 mt9E+XTiznHREQ0VndP4Y4rhVqi7xTUy7JrNy2Qdzu/HxO+aJJFS5yElqyAZF4Fdmd
	 1HFJdKoSBYOAsF2SkHtJhjj7v4YvHeiwwdnoR8W8S0SlUnjNs8119RFcHy9BOmPFtP
	 fJRZmM6AhwNCfU2pqVk/AuhOTOsyN6yd88ctokwl1UQhaF6nIVEv/jnFgOH7akkTft
	 lKzSdYYBlT0Gw==
From: Thomas Gleixner <tglx@kernel.org>
To: Yicong Yang <yang.yicong@picoheart.com>, Anup Patel
 <apatel@ventanamicro.com>
Cc: yang.yicong@picoheart.com, anup@brainfault.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 geshijian@picoheart.com, weidong.wd@picoheart.com, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] irqchip/riscv-aplic: Register the driver prior to
 device creation
In-Reply-To: <b2eb7f70-8ee9-43f6-b086-f0c17b1f9e39@picoheart.com>
References: <20260114063730.78009-1-yang.yicong@picoheart.com>
 <CAK9=C2XrExRLihwveMxs-Ourr+8bXja5UAmN_muAJz5FSpFW8A@mail.gmail.com>
 <7b859dd5-9262-4d68-9a8e-e0be0c24ac4a@picoheart.com> <877btkht2v.ffs@tglx>
 <e30ee004-64f9-4003-8907-c407a76fc244@picoheart.com> <87y0lz2ef6.ffs@tglx>
 <b2eb7f70-8ee9-43f6-b086-f0c17b1f9e39@picoheart.com>
Date: Fri, 16 Jan 2026 12:41:04 +0100
Message-ID: <87h5sl3hv3.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_034109_808829_438CE3CA 
X-CRM114-Status: GOOD (  10.87  )
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

On Fri, Jan 16 2026 at 14:16, Yicong Yang wrote:
> On 1/15/26 9:28 PM, Thomas Gleixner wrote:
>> On Thu, Jan 15 2026 at 16:31, Yicong Yang wrote:
>>> so based on above, if we use async_wq (with async_schedule* APIs) in
>>> acpi_scan_clear_dep_queue() for creating these devices, the issue
>>> could be solved since we're sure to have these devices before entering
>>> userspace, since the barrier of async_synchronize_full(). This should be
>>> a solution with a conceptual support and I did a quick test on our
>>> platform it solves the issue.
>> 
>> Sounds about right to me. The drivers core and ACPI folks might have
>> opinions though :)
>> 
> sure I'll wait a bit to see if there's further comment before sending out
> next version.

Btw, there is a reason that this is on the default work queue. See

     commit dc612486c919 ("ACPI: scan: Fix device object rescan in
                           acpi_scan_clear_dep()")

for details. So this needs some more thought.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
