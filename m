Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FE1D0D151
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 17:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NL4UhFnGhD6PPVQLU/mbxczW6gvcdcNVrfS5+AL+QBk=; b=MO8OfmDvGRJfdH
	EfRVsaHArWU5T0u0wEOb8NS4Aius4hp0Ri6fu2mpSSzUwyxWTdQaEA44jwJ2RXHN9GK4604MVaqkg
	pZXFvbqn3r/wYYEb9Oo/70xy/svmXuvnyOsrdd5a2kH45NeFmByRi+lRPIAtHa67oNEn54ZXxHQpl
	En3UV3Pxcw4rCzJr7EUe7L8jpxqfbmN1VpOfcz6XoHDhoc4BshhOI6TzuMEpzu+tSJY9KUUQNJffA
	nFUywXdg4LsE5RySKWQOYCCwp49u/S6YNLv2EvH0+sfiYT3kOqIJ8guBNYdfmEiO1b91uWLj2oW2j
	sOZOp5OQVc16+n7MGy+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXhz-0000000FOzi-1FQ5;
	Wed, 07 Jan 2026 17:52:35 +0000
Received: from mx-rz-2.rrze.uni-erlangen.de ([131.188.11.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXhw-0000000FOyN-0TDv
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 17:52:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1767808348; bh=FEBbEJYjF9VeYuE/c6VI2LwqJ1VlZp1N2SisoMN0mzg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From:To:CC:
	 Subject;
	b=frVi5bsOpHQyFdBNg/aA4J73jE61+MYbzsrKroDpZBhxhbi0vauKHV5NrIACNrO5b
	 dyMBdoXBaDAUxS9LZQjaF4Z9c1AjI8un16hnHb8G31qeuFwqWGbWizET+PWIioS7kp
	 IVHr6UmC+vDQWrrM50QQIuZImmRpWP1rGgApKU05Xoj+yCE6dPIshlq+cSqZ50d1oh
	 jcP8hRBen2TLlJyQXBfFIX/T6zyKV3lq41JLsMXYKoF5Q+5ilWviIxt20IsKo1Cb0X
	 MPXbjPRN725V30meLJRVY2I0ci2/SlJ3/yoNyCkDO2gWlkEShVe5Nx34WZ4KJvVmup
	 wQNDzMuCNmsPg==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-2.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4dmbGM6ssTzPkCM;
	Wed,  7 Jan 2026 18:52:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at boeck2.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 10.188.34.184
Received: from localhost (i4laptop33.informatik.uni-erlangen.de [10.188.34.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX19Sh7w1z3IDDyxOFeZshEUU57P0q9RJGdo=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4dmbGJ700vzPk7g;
	Wed,  7 Jan 2026 18:52:24 +0100 (CET)
From: Luis Gerhorst <luis.gerhorst@fau.de>
To: Lukas Gerlach <lukas.gerlach@cispa.de>
Cc: <ast@kernel.org>,  <bjorn@kernel.org>,  <bpf@vger.kernel.org>,
  <daniel.weber@cispa.de>,  <daniel@iogearbox.net>,
  <jo.vanbulck@kuleuven.be>,  <linux-riscv@lists.infradead.org>,
  <luke.r.nels@gmail.com>,  <marton.bognar@kuleuven.be>,
  <michael.schwarz@cispa.de>,  <palmer@dabbelt.com>,  <pjw@kernel.org>,
  <xi.wang@gmail.com>, <cleger@rivosinc.com>, <palmer@rivosinc.com>,
 <conor.dooley@microchip.com>, <andrew@sifive.com>
Subject: Re: [PATCH] riscv, bpf: Emit fence.i for BPF_NOSPEC
In-Reply-To: <20260107095406.4082-1-lukas.gerlach@cispa.de> (Lukas Gerlach's
	message of "Wed, 7 Jan 2026 10:54:05 +0100")
References: <87y0m996b2.fsf@fau.de>
	<20260107095406.4082-1-lukas.gerlach@cispa.de>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 07 Jan 2026 18:52:24 +0100
Message-ID: <87sechz4x3.fsf@fau.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_095232_302422_37615099 
X-CRM114-Status: GOOD (  18.51  )
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

Lukas Gerlach <lukas.gerlach@cispa.de> writes:

> Regarding bpf_jit_bypass_spec_v1/v4(): currently this is per-architecture.
> What we need is per-processor granularity, so we can disable mitigations
> on in-order cores and keep them enabled on vulnerable out-of-order processors.

Yes, sorry this was unclear. I just wanted to point out that once you
have that infrastructure you can implement them as follows:

bpf_jit_bypass_spec_v1/v4() {
  if (RV_CPU_IN_ORDER())
    return true;
  else
    return false;
}

But you are right that the definition of RV_CPU_IN_ORDER() is still
missing of course.

> Regarding fence.i being an extension: all RISC-V processors supported by the
> kernel that are vulnerable to these attacks support this instruction.

I am not sure if I misunderstand the "that are vulnerable to these
attacks".

If you mean that vulnerable CPUs always have fence.i: What if a CPU
still does not support the instruction (no matter if it is vulnerable or
not)?

If I understand the RISC-V JIT correctly, it will then still generate
fence.i with this patch. When this eBPF program is then invoked the
CPU will panic upon reaching the fence.i which is a invalid opcode as
far as this CPU is concerned. Or is there some ifdef I am missing here?

I would assume you need something like this:

case BPF_ST | BPF_NOSPEC:
  if (riscv_has_extension_likely(RISCV_ISA_EXT_ZIFENCEI))
    emit_fence_i(ctx);
  break;

Or is there some guarantee that this extension is always available? I
read [3] as implying that this is no longer the case with the 2.0
instruction set for unprivileged. Does this also mean it is an optional
extension for the privileged ISA?

RISC-V cpufeature.c had this in [2]:

		/*
		 * Linux requires the following extensions, so we may as well
		 * always set them.
		 */
		set_bit(RISCV_ISA_EXT_ZICSR, this_isa);
		set_bit(RISCV_ISA_EXT_ZIFENCEI, this_isa);

But as of [1] it was changed to:

		if (acpi_disabled) {
			set_bit(RISCV_ISA_EXT_ZICSR, source_isa);
			set_bit(RISCV_ISA_EXT_ZIFENCEI, source_isa);

So based on that I would assume fence.i may not always be supported.

But I also found that 921ebd8f2c08 ("RISC-V: Allow userspace to flush
the instruction cache") seems to assume that fence.i always works (see
local_flush_icache_all() which I assume runs in the kernel).

Even if the CPU is known vulnerable but does not support the extension,
it will be better not to generate the instruction. If we still want to
do something about these CPUs, maybe add a warning message to advise the
user that unpriv eBPF should definately be kept disabled on this CPU?

[1] https://lore.kernel.org/all/20230711224600.10879-1-palmer@rivosinc.com/
[2] https://lore.kernel.org/all/20230607-nest-collision-5796b6be8be6@spud/
[3] https://docs.riscv.org/reference/isa/unpriv/zifencei.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
