Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A94CC61DA4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 08:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FacQeBK5ez9aVwEHNrPJv6Rf038JgGJooFMbpV9Rbyw=; b=rmJTnUswUpiNPA
	g5q8AeuueiLORfx9/guM/U60wSe9Hch01+Xt6eaPUhwHxoZrQvzo8Vccd2hSYKwArYHaTnM3VFZVR
	kGSwbX8VX25B3Y8x4wH6XGY5vd66B7TDNp4chBzrQ4xjCXdPvwWEvKpN4dRpcjqj5DAPwwLN2pwC9
	UMYCiNTsiFyTe6JSs2bNNPvUGp5PfP0TjKoAtY6KhhtEssl8FQ7NzZI4RM6GdQ8qPETmY8CI6gIHN
	luop+y4cfQaPONTuV9/3eY9nheMiuOXcHZngYJyL549FvpzpHbyPBSBKaxknGNwM8yqNXplECC52Z
	I+StsO4o4UXEWJ6xAJUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNr7u-000xSD-8h; Fri, 03 Feb 2023 08:08:54 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNr7r-000xR3-2z; Fri, 03 Feb 2023 08:08:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 2B53DCE2F18;
	Fri,  3 Feb 2023 08:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159E1C433D2;
	Fri,  3 Feb 2023 08:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675411727;
	bh=aT42vj9PJCG8bxaMvvXlX2rC47FcFL9/q7LjTigNKCs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=YabQY1ZDzX1r0QQdTCNkgUwpYzS3PBaRFLbfkzKDxLoUMnUuviY0oNN4ALZWQWHU5
	 SxSVjkGWaEyz5yRD/EDmDswe8u15W39POSBv5aGBr6sEksGNNiFAiv9seeJz+28zWm
	 bh5gJZ5uJr8aC9zq+U40p1TdT0rvshX5SowOLp8EMUm+aTNnQEm/8HRF6ZbnQkR/fo
	 r7l/7HdmQW6/idTejVzd3+mMaLg3rkYbM+E05BR1OhmggoFZBu/1N/5i21DVb60+oX
	 +rmR+H4CLOvPHOljHU+mmLOTL3vret5hqjDmrt7Hk4h0ALKlzYQUKAWkWe6AKMjxDS
	 rI8ewIXOku+9Q==
Date: Fri, 03 Feb 2023 08:08:42 +0000
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>,
 Conor Dooley <conor.dooley@microchip.com>
CC: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <anup@brainfault.org>, Eric Lin <eric.lin@sifive.com>,
 Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 07/14] RISC-V: KVM: Add skeleton support for perf
User-Agent: K-9 Mail for Android
In-Reply-To: <CAOnJCUKVXGXsFBUE753-HOr_CtN-5Nsq+yBQj1eT13WyU2r54g@mail.gmail.com>
References: <20230201231250.3806412-1-atishp@rivosinc.com> <20230201231250.3806412-8-atishp@rivosinc.com> <Y9ufoeZ/4obZDJz6@wendy> <CAOnJCUKVXGXsFBUE753-HOr_CtN-5Nsq+yBQj1eT13WyU2r54g@mail.gmail.com>
Message-ID: <71788DAC-4DDF-460F-B881-58729D6D437C@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_000851_335981_8BD47EF5 
X-CRM114-Status: GOOD (  16.62  )
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



On 3 February 2023 08:04:00 GMT, Atish Patra <atishp@atishpatra.org> wrote:
>On Thu, Feb 2, 2023 at 3:34 AM Conor Dooley <conor.dooley@microchip.com> wrote:
>>
>> On Wed, Feb 01, 2023 at 03:12:43PM -0800, Atish Patra wrote:
>> > This patch only adds barebone structure of perf implementation. Most of
>> > the function returns zero at this point and will be implemented
>> > fully in the future.
>> >
>> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> > +/* Per virtual pmu counter data */
>> > +struct kvm_pmc {
>> > +     u8 idx;
>> > +     struct perf_event *perf_event;
>> > +     uint64_t counter_val;
>>
>> CI also complained that here, and elsewhere, you used uint64_t rather
>> than u64. Am I missing a reason for not using the regular types?
>>
>
>Nope. It was a simple oversight. I will fix it.
>Do you have a link to the CI report so that I can address them all in v5 ?

Try:
:%s/uint64_t/u64
It was just this patch, and checkpatch --strict should show it.

>
>> Thanks,
>> Conor.
>>
>> > +     union sbi_pmu_ctr_info cinfo;
>> > +     /* Event monitoring status */
>> > +     bool started;
>
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
