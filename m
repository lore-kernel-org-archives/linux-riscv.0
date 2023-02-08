Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03A7C636CC
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 09:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlDGfyIMoqsW/rV+ZCvtoqsVE3cPh41DPbBH+6/lbOE=; b=MO54TMrutfrhkk
	kGDPpQ7ehMWLF+9uA1wiTq9gWK2LJvR8IdwY/AEF8R9eIKpa8BdmadRdO679QvXs49gkiesRWodNm
	YM6IBBHeUzu3ZC37prEqwLULNk5V9sVlZeiOa0CjmecYAj3GFVx1uNCEq4rkQfSoJ2GnJRWHGP7gc
	xYs962411BgnhMwoKVCC9iRfllOXApNRp2p/vre7YojJc4MXD2e8Vjc9R7wJnc46L03NbMmcmilVM
	YYuQ05KHAnZPJtcgy+r/7HvE82F942iRIUdada+TBh4Bar/UQERZWwRbTl2OqYcO8Wid65EcsezJn
	oPKNKbeYDutVaC70wqqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPgcw-00Emsk-AH; Wed, 08 Feb 2023 09:20:30 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPgce-00Emk5-NO; Wed, 08 Feb 2023 09:20:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 508D5CE1FBA;
	Wed,  8 Feb 2023 09:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490D3C433EF;
	Wed,  8 Feb 2023 09:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675848004;
	bh=szmgP+e9Vsro13o4ECnuveaXGwL0/2kZ8N53HolbQmg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=p5gAp+JeKmkVU/hTiy8bkT5wOwAh8OioAr3Z7v0N8pC0ECZj/n2hG3khWuKfWQxaG
	 U10+ApGwJjN52nWB6etohMzfzemgUv9ZoLxAajC9AOyblV+rbDHcVWUXdqEdoNM1qW
	 IBpiUJjyEYDvaHaYL5INT/g+XXE9nTZN9lRMb+qAmTVWEA4WBM7LxdcjGhRqF0/WOG
	 ZpzcErVS+OEn37sogQ6XoiFQnmuCFa8bxlu15XwQvP0ZYvI3JFtcxxBut+KRN01y2Q
	 CYB+V5mt9mQeQxPWd03Ke8F/R9E4Echo/vOaPQCDv2ZUTUYr1U9qGX0BG8e9TjED/L
	 lzFwQAureBVCg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Vineet Gupta <vineetg@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: greentime.hu@sifive.com, guoren@linux.alibaba.com, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones
 <ajones@ventanamicro.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Conor Dooley
 <conor.dooley@microchip.com>, Jisheng Zhang <jszhang@kernel.org>, Vincent
 Chen <vincent.chen@sifive.com>, Guo Ren <guoren@kernel.org>, Li Zhengyu
 <lizhengyu3@huawei.com>, Masahiro Yamada <masahiroy@kernel.org>, Changbin
 Du <changbin.du@intel.com>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH -next v13 10/19] riscv: Allocate user's vector context
 in the first-use trap
In-Reply-To: <91cd3bf5-9c68-df1e-32a8-55f2cfedd84a@rivosinc.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-11-andy.chiu@sifive.com>
 <91cd3bf5-9c68-df1e-32a8-55f2cfedd84a@rivosinc.com>
Date: Wed, 08 Feb 2023 10:20:02 +0100
Message-ID: <87zg9o1pkt.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_012013_027300_A996FC2A 
X-CRM114-Status: GOOD (  10.09  )
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

Vineet Gupta <vineetg@rivosinc.com> writes:

> Hi Andy,
>
> On 1/25/23 06:20, Andy Chiu wrote:
>> +static bool insn_is_vector(u32 insn_buf)
>> +{
>> +	u32 opcode = insn_buf & __INSN_OPCODE_MASK;
>> +	/*
>> +	 * All V-related instructions, including CSR operations are 4-Byte. So,
>> +	 * do not handle if the instruction length is not 4-Byte.
>> +	 */
>> +	if (unlikely(GET_INSN_LENGTH(insn_buf) != 4))
>> +		return false;
>> +	if (opcode == OPCODE_VECTOR) {
>> +		return true;
>> +	} else if (opcode == OPCODE_LOADFP || opcode == OPCODE_STOREFP) {
>> +		u32 width = EXTRACT_LOAD_STORE_FP_WIDTH(insn_buf);
>> +
>> +		if (width == LSFP_WIDTH_RVV_8 || width == LSFP_WIDTH_RVV_16 ||
>> +		    width == LSFP_WIDTH_RVV_32 || width == LSFP_WIDTH_RVV_64)
>> +			return true;
>
> What is the purpose of checking FP opcodes here ?

From [1]: "The instructions in the vector extension fit under two
existing major opcodes (LOAD-FP and STORE-FP) and one new major opcode
(OP-V)."

[2] highlights the width encoding.

(And Zvamo is out from the spec, which used AMO,0x2f)

[1] https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc#5-vector-instruction-formats
[2] https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc#73-vector-loadstore-width-encoding

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
