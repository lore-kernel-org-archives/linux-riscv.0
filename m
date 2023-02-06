Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6072C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 13:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7KInZKjV89U0e977aTdt1xVN4uq+ES6A5SnO2RLTjUw=; b=wu9McCBaK8sdOJ
	sezNVgLgwJ5Qixc2g4xXQWU8d/NK+OD5XpdSvUm6R17zGwTTlsueaqOTJOW4bhxbd34AHxGPZYwGM
	x+Gdw3QW9ytva3qWBqBe54WlF8Kz+GyX7cy9MYg4+lYPdfMofc0xzTZjHA1LaT8UQi2VuLcLqoKcP
	l0t7JPznZmhOezKUkn58AART6ShBgV3Yxsbf7XjheRLuDFSYzxf6MIgMGQTN/+9U/4lpuojMO08uq
	taxX2ITafY+EvDotUMTECBxoSj9cTaphxJVckjd749GcVw/E2/46eTZlCqDvDvtLD9xrzlespeOjz
	RcbR7N3vjSsloIZzKcFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP1je-008eBv-Ni; Mon, 06 Feb 2023 13:40:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP1ja-008eB6-Mv; Mon, 06 Feb 2023 13:40:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 48A2A60EF3;
	Mon,  6 Feb 2023 13:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AF1CC433EF;
	Mon,  6 Feb 2023 13:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675690836;
	bh=994+xbXQlKHOxMKGinewR4j0+N2ay/bGNWMb3PM/MOw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=jMojKkSrHJHs4ciaNruZ63LJZteOD4aWFO1pEtos3KC2AG2UZEvhb8cVvbcDr8EpD
	 bMY8/U/0T/jZIaHkAAZSx4oWmDDmF87Cai2TX/hT9j5GCL5Oc8//+PtGXf1HVuqTul
	 us4Cwto0gL9wRvdJpKHALnA5Ksb0VKKDca+Ps3xXrFwfktUueALSmm/0deSGrCmb5t
	 7izIjyspldZffwFStUB0RfM/yyStyJor2cQ2BDKmyDVS9zHIluJ9GNYzaT80ul6nQ8
	 pc/zbXwyQDEHbZQe5wN7Qvw+d27iiOok2sivPmRmihNGQZ8r2f+IAIF+jizXFr6kWw
	 NzbJpkW7A8WpA==
Date: Mon, 06 Feb 2023 14:40:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
CC: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Stuebner <heiko.stuebner@vrull.eu>,
 Andrew Jones <ajones@ventanamicro.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Jisheng Zhang <jszhang@kernel.org>, Vincent Chen <vincent.chen@sifive.com>,
 Guo Ren <guoren@kernel.org>, Li Zhengyu <lizhengyu3@huawei.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Changbin Du <changbin.du@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_-next_v13_10/19=5D_riscv=3A_Allocate?= =?US-ASCII?Q?_user=27s_vector_context_in_the_first-use_trap?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CABgGipW_3tBbc3G91dqiAZCGeN-PbUvLS3n=bU0nWz0rRX9T8Q@mail.gmail.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com> <20230125142056.18356-11-andy.chiu@sifive.com> <Y9MIr2iR5rzlIGKQ@spud> <CABgGipW_3tBbc3G91dqiAZCGeN-PbUvLS3n=bU0nWz0rRX9T8Q@mail.gmail.com>
Message-ID: <36A0C855-5EA7-49B5-B92E-B28E684AC3D8@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_054038_868183_1B970311 
X-CRM114-Status: GOOD (  19.92  )
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



On 6 February 2023 13:00:00 GMT+01:00, Andy Chiu <andy.chiu@sifive.com> wrote:
>On Fri, Jan 27, 2023 at 7:11 AM Conor Dooley <conor@kernel.org> wrote:

>Changing it to a switch statement for better structuring.
>> I would like Heiko to take a look at this function!
>> I know we have the RISCV_INSN_FUNCS stuff that got newly added, but that's
>> for single, named instructions. I'm just curious if there may be a neater
>> way to go about doing this. AFAICT, the widths are all in funct3 - but it
>> is a shame that 0b100 is Q and 0 is vector, as the macro works for matches
>> and we can't use the upper bit for that.
>> There's prob something you could do with XORing and XNORing bits, but at
>> that point it'd not be adding any clarity at all & it'd not be a
>> RISCV_INSN_FUNCS anymore!
>> The actual opcode checks probably could be extracted though, but would
>> love to know what Heiko thinks, even if that is "leave it as is".
>I've checked the RISCV_INSN_FUNCS part recently. It seems good to
>match a single type of instruction, such as vector with OP-V opcode.
>However, I did not find an easy way of matching whole instructions
>introduced by RVV, which includes CSR operations on multiple CSRs and
>load/store with different widths. Yes, it would be great if we could
>distinguish VL and VS out by the upper bit of the width. Or even
>better if we could match CSR numbers for Vector this way. But I didn't
>find it.

Yup, I didn't see a straight forward way either.
I was hoping Heiko might have an idea!


>> > +     /* Sanity check. datap should be null by the time of the first-use trap */
>> > +     WARN_ON(current->thread.vstate.datap);
>>
>> Is a WARN_ON sufficient here? If on the first use trap, it's non-null
>> should we return false and trigger the trap error too?
>If we'd run into this warning message then there is a bug in kernel
>space. For example, if we did not properly free and clear the datap
>pointer. Or if we allocated datap somewhere else and did not set VS
>accordingly. Normally, current user space programs would not expect to
>run into this point, so I guess returning false here is not
>meaningful. This warning message is intended for kernel debugging
>only. Or, should we just strip out this check?

I suppose my question was "is it safe to warn and carry on, rather than disallow use of vector in this situation".

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
