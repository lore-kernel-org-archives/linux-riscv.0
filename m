Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D474C678D5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 06:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r8HQ1K7f/kJhLJ1GP/hJmH3d26NMwzfLSJ+0t6Uhy6w=; b=KqQEY21SAfePWL
	f/M0eqv7ED41ciLh8u0jBwt2OEwgLuBiGEPGXGIAXiy3k044Gq99Ub8jwUIAvLpDKH3Hg0FVxq5KU
	gOJLJGK4uFgQT3UzOdSgUNCUxi62Ddud9gFxnQlYo4onzERu70RV5rsszjobGQV/eyA8clv/3J+g3
	Hmg8LgHuzbEmL6f6GKeBTPirl61Ujs8uub4oRPpwHnpUeOVynLu5Ahv9dgEUp2WavapzualByvcqI
	Job8qhx8MiWYwOOpPLxfxLLRNtu1+66K8lN5anhwqAXFMVfZuf71fczl/jexByRuA/A/PP28xgBZ7
	14EzsWjsOLNLN46MxXcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZQZt-00GKnN-18; Tue, 07 Mar 2023 06:13:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZQZq-00GKm6-Bc
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 06:13:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 03259611D1;
	Tue,  7 Mar 2023 06:13:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF63C433D2;
	Tue,  7 Mar 2023 06:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678169610;
	bh=xf0x6cqpQmmfZLNlygDl/x3UlC8DENzrRv3kNRhpTTc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=bgFYdTVrcrjW7ir3dhuVSDPLPmyjfBGF1o1lFWTz4SeyRWK7ZU3emLUBvv8kFE+kD
	 WhvYY0xXn/KizUTQJJ/i5PQ9ZW11Pa2P6W4U69CtAIZtFgMSO70hJa078RAj9o6tQr
	 KM9FDEJHmIys5arjV6eHobRMaNiKaf75TrW3vmMki47wrM/om+6WXFsl6FbIU3wfRP
	 MVJ7yEDPLT5mz+j5krb2R47f4B/Ovu+3oJfcd+E1wb69yh7WNKNVZRQkEkYbgCvpmr
	 IIeLptbdOSKsFGzsaxUIpUmdLaTwXTljxw98zGvqe8SbG1NejE6ETv5HfMxROaMW9T
	 H0H30Rs+hEuZQ==
Date: Tue, 07 Mar 2023 06:13:22 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
CC: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>,
 Atish Patra <atishp@rivosinc.com>,
 'Conor Dooley ' <conor.dooley@microchip.com>, llvm@lists.linux.dev
Subject: Re: [PATCH V3 00/20] Add basic ACPI support for RISC-V
User-Agent: K-9 Mail for Android
In-Reply-To: <ZAbGSA6F0kfv9YYw@sunil-laptop>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com> <16007014-c5f2-4b07-baec-e19952236aa5@spud> <ZAbGSA6F0kfv9YYw@sunil-laptop>
Message-ID: <E7FB4927-1FE6-435A-914E-9615C2AD9D34@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_221334_493909_8DED2393 
X-CRM114-Status: GOOD (  18.64  )
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



On 7 March 2023 05:06:16 GMT, Sunil V L <sunilvl@ventanamicro.com> wrote:
>On Mon, Mar 06, 2023 at 09:51:09PM +0000, Conor Dooley wrote:
>> Hey Sunil,
>> 
>> On Fri, Mar 03, 2023 at 07:06:27PM +0530, Sunil V L wrote:
>> > This patch series enables the basic ACPI infrastructure for RISC-V.
>> > Supporting external interrupt controllers is in progress and hence it is
>> > tested using poll based HVC SBI console and RAM disk.
>> > 
>> > The first patch in this series is one of the patch from Jisheng's
>> > series [1] which is not merged yet. This patch is required to support
>> > ACPI since efi_init() which gets called before sbi_init() can enable
>> > static branches and hits a panic.
>> > 
>> > Patch 2 and 3 are ACPICA patches which are not merged into acpica yet
>> > but a PR is raised already.
>> > 
>> > Below are two ECRs approved by ASWG.
>> > RINTC - https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
>> > RHCT - https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view
>> > 
>> > The series depends on Anup's IPI improvement series [2].
>> > 
>> > [1] https://lore.kernel.org/all/20220821140918.3613-1-jszhang@kernel.org/
>> > [2] https://lore.kernel.org/lkml/20230103141221.772261-7-apatel@ventanamicro.com/T/
>> 
>> Building a clang-15 allmodconfig (I didn't try gcc) with this series, and
>> Anup's IPI bits, results in a broken build, due to failings in cmpxchg:
>> 
>> /stuff/linux/drivers/platform/surface/aggregator/controller.c:61:25: error: call to __compiletime_assert_335 declared with 'error' attribute: BUILD_BUG failed
>>         while (unlikely((ret = cmpxchg(&c->value, old, new)) != old)) {
>>                                ^
>Hi Conor,
>
>I am able to build without any of these issues using clang-15. I am
>wondering whether the base is proper. I had rebased on top of the master
>and couple of patches from IPI series were already merged in the master.
>
>Do you mind verifying with my branch
>https://github.com/vlsunil/linux/commits/acpi_b1_us_review_ipi17_V3?

I can check that later I suppose.

>
>Or if you could provide me your branch details, I can look further.

6.3-rc1, with both series applied, sans Anups applied patches.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
