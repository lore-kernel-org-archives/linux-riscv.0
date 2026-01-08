Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6A1CF6ABC
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 10:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KnVzv9m9MKq34ql2FmiRnYRilnZWVplfqR6a97X/vMc=; b=p5NHvXog7C2GPQ
	qp8dGHnwy/sdOJcs7xC0OZoTC4VcqHJUnOGi6q59aebZtwju5i7Vp3wjzYteYn9GDUHtmQ7qjrZXt
	0I66JVcPPXdg5tSpC2oSRLXkkKJj16wHesRsGnmEfj3TDVy4TGcSD1w7PhqQOIJEFoMTBXWltGjz1
	vw6o35WtvOUYrPejitECI90zwhk/Arg8xG1SVb5s7KuWEz8OzHuW/MkuSPUCXwt3b0buZX55swhy/
	vh2NmG1zyPN0WJBldmSuPs3oBkJm71jlsrk7/thwIp5oOt31bhUkFReR2qsLuXaXqgJsddI2hxW2C
	HZpRmnL6dbSqpfUfMJmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmtT-0000000GYjR-1dsk;
	Thu, 08 Jan 2026 10:05:27 +0000
Received: from mx-rz-3.rrze.uni-erlangen.de ([131.188.11.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmtP-0000000GYgA-3Hh0
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 10:05:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1767866709; bh=pnpSM3+LZ7mt++O2dJV5Zv3nt3YFPeMMaAN43GJ9qSI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From:To:CC:
	 Subject;
	b=TXRwanSqLD1caB7/z27CfdMl+01wFPEyCyYyER7hODQ7nfKk+4XAQ6n19GMWyCM8A
	 nUbjG/WzLyx9YtxeG8ajPcVS0xlmB5XWF1qggMqc2p3T32fCJNy9sAI7/d31CFSwtK
	 qR2HJY2B4tcQAziwErqszVK3Yu7Zl7eXvxGiYSPZfJwO1NoV12ffLKPQHDFhti7Ha1
	 ix/1yVb+qbCPtuvZKaeee+siCZBJSKn27khqzRi5ZQDuEAMuUq0WyEwQQas41jITYO
	 5sI8dXKMtI+ciJHNvZZ9fzJcdzAWx7i45PagAO/JWk+JVgzV8ZmIMQEOcIoH9eyIsB
	 3xlb+iqxx+3Mg==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-3.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4dn0rj5vcVz1xwT;
	Thu,  8 Jan 2026 11:05:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at boeck1.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 10.188.34.184
Received: from localhost (i4laptop33.informatik.uni-erlangen.de [10.188.34.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX180WNKE5bNi5QBpRfXLZfhB6/uihbEZEPM=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4dn0rg0bYbz1y3L;
	Thu,  8 Jan 2026 11:05:07 +0100 (CET)
From: Luis Gerhorst <luis.gerhorst@fau.de>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Lukas Gerlach <lukas.gerlach@cispa.de>,  ast@kernel.org,
  bjorn@kernel.org,  bpf@vger.kernel.org,  daniel.weber@cispa.de,
  daniel@iogearbox.net,  jo.vanbulck@kuleuven.be,
  linux-riscv@lists.infradead.org,  luke.r.nels@gmail.com,
  marton.bognar@kuleuven.be,  michael.schwarz@cispa.de,
  palmer@dabbelt.com,  pjw@kernel.org,  xi.wang@gmail.com,
  cleger@rivosinc.com,  palmer@rivosinc.com,  conor.dooley@microchip.com,
  andrew@sifive.com
Subject: Re: [PATCH] riscv, bpf: Emit fence.i for BPF_NOSPEC
In-Reply-To: <06ac0b87-d398-4cb0-a614-760bfe41cf7f@sifive.com> (Samuel
	Holland's message of "Wed, 7 Jan 2026 17:30:02 -0600")
References: <87y0m996b2.fsf@fau.de>
	<20260107095406.4082-1-lukas.gerlach@cispa.de> <87sechz4x3.fsf@fau.de>
	<06ac0b87-d398-4cb0-a614-760bfe41cf7f@sifive.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 08 Jan 2026 11:05:06 +0100
Message-ID: <875x9czagd.fsf@fau.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_020524_260737_48178381 
X-CRM114-Status: GOOD (  20.12  )
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

Samuel Holland <samuel.holland@sifive.com> writes:

> The Zifencei extension is no longer a mandatory part of the ISA, but it is
> mandatory for Linux. Linux requires at least "rv32ima or rv64ima, as defined by
> version 2.2 of the user ISA and version 1.10 of the privileged ISA".
>
> Notably, in version 2.2 of the user ISA, the Zifencei extension was still an
> unnamed subset of the I extension, so it is included in the above requirement.
> It was later removed from the I extension and given its own name, which is why
> we have weirdness like the code below. (You can see in arch/riscv/Makefile where
> we unconditionally add either ISA version 2.2 or Zifencei to CFLAGS.)
>
>> RISC-V cpufeature.c had this in [2]:
>> 
>> 		/*
>> 		 * Linux requires the following extensions, so we may as well
>> 		 * always set them.
>> 		 */
>> 		set_bit(RISCV_ISA_EXT_ZICSR, this_isa);
>> 		set_bit(RISCV_ISA_EXT_ZIFENCEI, this_isa);
>> 
>> But as of [1] it was changed to:
>> 
>> 		if (acpi_disabled) {
>> 			set_bit(RISCV_ISA_EXT_ZICSR, source_isa);
>> 			set_bit(RISCV_ISA_EXT_ZIFENCEI, source_isa);
>> 
>> So based on that I would assume fence.i may not always be supported.
>
> This is just a quirk of the parsing code. As mentioned in [1], older devicetrees
> were written while Zifencei was an implicit part of I, so we don't expect it to
> appear in the devicetree. The ACPI table definition was written after Zifencei
> was a separate extension, so we do expect Zifencei to appear on its own in the
> ACPI table. But it is still required. (We don't currently check that all
> extensions required by the kernel are actually present; this will be done as
> part of the RVA23 enablement.)
>
>> But I also found that 921ebd8f2c08 ("RISC-V: Allow userspace to flush
>> the instruction cache") seems to assume that fence.i always works (see
>> local_flush_icache_all() which I assume runs in the kernel).
>
> Yes, the kernel definitely won't run if fence.i is missing, so we don't need to
> worry about such hardware. We could probably document this better.

Thanks for clarifying this! In that case the patch looks good to me.

I assume some testing has been done to ensure the instruction coding
works. (I think the eBPF CI does not have RISC-V yet but [1] previously
worked fine for me.)

Acked-by: Luis Gerhorst <luis.gerhorst@fau.de>

[1] https://github.com/pulehui/riscv-bpf-vmtest

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
