Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17108C38142
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 10:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2tTFuz5yBVB/dafMmYG/B7QdnWpL4QjZOX1nvi/egM=; b=3dNLqcR6jQcffI
	P8HZGJpugFR+m5IMfLyeuTuwrzYgank/HmosIxybcV3U0YatmUrayiHVN65Sx0htLELOBjkNbpNwH
	NyARV/7TZLMl7XW/Q1c1NMYjjqz5/seHP6W7RdnWEV1oy6G8LlQGiXkf4Q8gclfVjsexlqdVgTqF8
	/tJ5feba/bBR8RaZ5nxSCJWATkl3RFBdWhpr6wl1I5umCbz7bRyXCEtKkgWHUyfhYmsTCXq6SJLPb
	b6HhhNkBvZ23389qylJYt4BUsk1fK1B8yjygB6x8j3f1MPzdb2BP7PWMxa9DIbDS1RzdnniUkjfcN
	wU864xAbvAwEybANHTEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLiRp-0001F5-32; Sat, 28 Jan 2023 10:28:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLiRm-0001EU-6h; Sat, 28 Jan 2023 10:28:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7BD9A60B54;
	Sat, 28 Jan 2023 10:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EE6AC433EF;
	Sat, 28 Jan 2023 10:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674901709;
	bh=LdatDRj19NTRu/mqjPRI5md+JhOX3+rhr/gM9iD9Ufo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=cFadJIPwcmhTLyHvg5LQ8QQvb9Cwxset2eCqHtvwsOp0s2Xse5iH8wX1l4XnLFZLA
	 qwmxNSPdtfYX6NtrPHqYN3IaeJHoQDc/BLKC/OlGfQ1hhD+3L3fkyivZrGB0sLzPHt
	 5Z6KsMLFvq4WMYh4g0voBaLWGoMJld5gWy2mywi1KGxIZj5fUPRqLyB9fg8gyM1+1k
	 /yuewWAu/9QcShcKezSRBhQkRE9b3tlR3zX//zZ5PbXGyhUt0NcFBRYhjQJTljGm6y
	 7VndGaKFLFXwKOVNFkZFMjttzp4G6T8zQeDVdhwxaBc2J6Nn14Ls0MhSsXLsl87se1
	 IbAK0iNLqqZhQ==
Date: Sat, 28 Jan 2023 10:28:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Guo Ren <guoren@kernel.org>
CC: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, vineetg@rivosinc.com,
 greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Guo Ren <ren_guo@c-sky.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
 Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Conor Dooley <conor.dooley@microchip.com>, Dao Lu <daolu@rivosinc.com>,
 Jisheng Zhang <jszhang@kernel.org>, Andrew Jones <ajones@ventanamicro.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Tsukasa OI <research_trasio@irq.a4lg.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_-next_v13_02/19=5D_riscv=3A_Exte?= =?US-ASCII?Q?nding_cpufeature=2Ec_to_detect_V-extension?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAJF2gTS11DcKuSBRQfn9AkU0YP=ry-FV=cH=Au5m3Us=1gVTQQ@mail.gmail.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com> <20230125142056.18356-3-andy.chiu@sifive.com> <Y9GgKiF8q2k9eRdh@spud> <CAJF2gTS11DcKuSBRQfn9AkU0YP=ry-FV=cH=Au5m3Us=1gVTQQ@mail.gmail.com>
Message-ID: <3AE48592-5756-4D49-B860-1D8C54ACFF3A@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_022834_365907_D0F07565 
X-CRM114-Status: GOOD (  22.42  )
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



On 28 January 2023 07:09:18 GMT, Guo Ren <guoren@kernel.org> wrote:
>On Thu, Jan 26, 2023 at 5:33 AM Conor Dooley <conor@kernel.org> wrote:
>>
>> On Wed, Jan 25, 2023 at 02:20:39PM +0000, Andy Chiu wrote:
>> > From: Guo Ren <ren_guo@c-sky.com>
>> >
>> > Add V-extension into riscv_isa_ext_keys array and detect it with isa
>> > string parsing.
>> >
>> > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
>> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>> > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
>> > Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
>> > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
>> > ---
>> >  arch/riscv/include/asm/hwcap.h      |  4 ++++
>> >  arch/riscv/include/asm/vector.h     | 26 ++++++++++++++++++++++++++
>> >  arch/riscv/include/uapi/asm/hwcap.h |  1 +
>> >  arch/riscv/kernel/cpufeature.c      | 12 ++++++++++++
>> >  4 files changed, 43 insertions(+)
>> >  create mode 100644 arch/riscv/include/asm/vector.h
>> >
>> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>> > index 57439da71c77..f413db6118e5 100644
>> > --- a/arch/riscv/include/asm/hwcap.h
>> > +++ b/arch/riscv/include/asm/hwcap.h
>> > @@ -35,6 +35,7 @@ extern unsigned long elf_hwcap;
>> >  #define RISCV_ISA_EXT_m              ('m' - 'a')
>> >  #define RISCV_ISA_EXT_s              ('s' - 'a')
>> >  #define RISCV_ISA_EXT_u              ('u' - 'a')
>> > +#define RISCV_ISA_EXT_v              ('v' - 'a')
>> >
>> >  /*
>> >   * Increse this to higher value as kernel support more ISA extensions.
>> > @@ -73,6 +74,7 @@ static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
>> >  enum riscv_isa_ext_key {
>> >       RISCV_ISA_EXT_KEY_FPU,          /* For 'F' and 'D' */
>> >       RISCV_ISA_EXT_KEY_SVINVAL,
>> > +     RISCV_ISA_EXT_KEY_VECTOR,       /* For 'V' */
>>
>> That's obvious surely, no?
>>
>> >       RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
>> >       RISCV_ISA_EXT_KEY_MAX,
>> >  };
>> > @@ -95,6 +97,8 @@ static __always_inline int riscv_isa_ext2key(int num)
>>
>> You should probably check out Jisheng's series that deletes whole
>> sections of this code, including this whole function.
>> https://lore.kernel.org/all/20230115154953.831-3-jszhang@kernel.org/T/#u
>Has that patch merged? It could be solved during the rebase for-next naturally.

Not merged yet. Pretty sure Andy used for-next
as his base so that CI could test it more easily
I was just pointing out it's existence in case he
hadn't seen it.
Hopefully Jishengs stuff will make 6.3 :)

>
>>
>>
>> > @@ -256,6 +257,17 @@ void __init riscv_fill_hwcap(void)
>> >               elf_hwcap &= ~COMPAT_HWCAP_ISA_F;
>> >       }
>> >
>> > +     if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
>> > +#ifndef CONFIG_RISCV_ISA_V
>> > +             /*
>> > +              * ISA string in device tree might have 'v' flag, but
>> > +              * CONFIG_RISCV_ISA_V is disabled in kernel.
>> > +              * Clear V flag in elf_hwcap if CONFIG_RISCV_ISA_V is disabled.
>> > +              */
>> > +             elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
>> > +#endif
>       if (elf_hwcap & COMPAT_HWCAP_ISA_V && !IS_ENABLED(CONFIG_RISCV_ISA_V)) {
>
>right?
>>
>> I know that a later patch in this series calls rvv_enable() here, which
>> I'll comment on there, but I'd rather see IS_ENABLED as opposed to
>> ifdefs in C files where possible.
>>
>> Thanks,
>> Conor.
>>
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
