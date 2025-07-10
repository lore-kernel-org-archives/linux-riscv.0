Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5C3CA0EDC
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 22:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZcUoCQTMSXQ6REDv5WYvpyG2C9KfqWVPv7h30dMwDJs=; b=UKi49Z1ACv9id0
	60VMsZGPXazOfIUVYqOSHMItItmtFA6VUGX7p+y1+Bv1Mzgo6I61/bengt2j1IHlKIf9k52yWg5dV
	5LQ8QF4HeXrOge97S2k70fEqXCElgL/1Cy115mpiMYr0oj5m1Aav3B1eeq4ukTBzKYA5pQkDevLLG
	O3L3Eh4PcaGAxBj2kgD3BHYUpJ2lgg1cs4dVuswlSmrHUYIynW/fQ2dw5Qnf7gcd2mcQTGlvaDfOO
	s5eiAXbeJzNIHsZc0a34fIiOVRfFmr7lJ+HEX+6Lu/VF07VZi4pzWJSJZkBgaH5eMUtc2bP1Y/AJc
	ISP7aW+UcSEx4JhzGMXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulx23-0000000C6rH-1wSq;
	Tue, 12 Aug 2025 21:59:47 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqkA-0000000BpSK-0xfX
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 12:51:19 +0000
Received: from hawking.nue2.suse.org (unknown [IPv6:2a07:de40:a101:3:92b1:1cff:fe69:ddc])
	by smtp-out2.suse.de (Postfix) with ESMTP id 77DB31F451;
	Thu, 10 Jul 2025 12:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752151876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pj4SAQIjVy3UL+SBRWSwrncs47otrM5/W1FfAs15JA4=;
	b=E0ornY9OSuhJZ2Nw0OP1ac35SLgAYXyF/KplYSzuAgwhlJ0q0TyvsOU6npQCfCvxowRge4
	1RdMe0RFS3T1Ej/C/tphIHb9sHROcaLOmS1mcAo1ZAXyHF6Z95+oDxxpbfxfvCJZdxuL4m
	9L9rEHUWLIDts4kjiQTL0RSe3ba9XxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752151876;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pj4SAQIjVy3UL+SBRWSwrncs47otrM5/W1FfAs15JA4=;
	b=aTEQCosHXxQwGfXdoMwvthZhMDZBzMVDowVu0cL0YTjxtT15fp94odAymH7n4q3P5uqxSV
	lrmx0pn1T7Ned9Dw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=E0ornY9O;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=aTEQCosH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752151876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pj4SAQIjVy3UL+SBRWSwrncs47otrM5/W1FfAs15JA4=;
	b=E0ornY9OSuhJZ2Nw0OP1ac35SLgAYXyF/KplYSzuAgwhlJ0q0TyvsOU6npQCfCvxowRge4
	1RdMe0RFS3T1Ej/C/tphIHb9sHROcaLOmS1mcAo1ZAXyHF6Z95+oDxxpbfxfvCJZdxuL4m
	9L9rEHUWLIDts4kjiQTL0RSe3ba9XxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752151876;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pj4SAQIjVy3UL+SBRWSwrncs47otrM5/W1FfAs15JA4=;
	b=aTEQCosHXxQwGfXdoMwvthZhMDZBzMVDowVu0cL0YTjxtT15fp94odAymH7n4q3P5uqxSV
	lrmx0pn1T7Ned9Dw==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 623F14A0569; Thu, 10 Jul 2025 14:51:16 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org
Subject: Re: openSBI 1.7 causes v6.16-rc boot to hang on VisionFive 2
In-Reply-To: <4e6cab2e-c18e-4bc3-8a9f-450326324d98@ghiti.fr> (Alexandre
	Ghiti's message of "Wed, 9 Jul 2025 08:46:24 +0200")
References: <mvm1pqrkmoe.fsf@suse.de>
	<4e6cab2e-c18e-4bc3-8a9f-450326324d98@ghiti.fr>
Date: Thu, 10 Jul 2025 14:51:16 +0200
Message-ID: <mvmms9cgqez.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Rspamd-Action: add header
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [15.28 / 50.00];
	SPAM_FLAG(5.00)[];
	NEURAL_SPAM_LONG(3.50)[1.000];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_SPAM_SHORT(2.99)[0.997];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[hawking.nue2.suse.org];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[hawking.nue2.suse.org];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	DIRECT_TO_MX(0.00)[Gnus/5.13 (Gnus v5.13)];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_ONE(0.00)[1];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DNSWL_BLOCKED(0.00)[2a07:de40:a101:3:92b1:1cff:fe69:ddc:from];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email]
X-Spamd-Bar: +++++++++++++++
X-Rspamd-Queue-Id: 77DB31F451
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_055118_556352_D5016155 
X-CRM114-Status: UNSURE (   7.58  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 12 Aug 2025 14:55:28 -0700
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

On Jul 09 2025, Alexandre Ghiti wrote:

> Do you have a means to know what happens here (pc, sepc, stval etc)? I
> don't have this board to give it a try.

Apparently disabling unused clocks kills the early console, and booting
with clk_ignore_unused reveals the real bug:

[   15.362214][    C2] ------------[ cut here ]------------
[   15.362239][    C2] kernel BUG at arch/riscv/kernel/patch.c:54!
[   15.362265][    C2] Kernel BUG [#1]
[   15.362279][    C2] Modules linked in: blake2b_generic xor raid6_pq dmi_sysfs
[   15.362348][    C2] CPU: 2 UID: 0 PID: 240 Comm: modprobe Not tainted 6.16.0-rc5-113-default #1 PREEMPT(voluntary) openSUSE Tumbleweed (unreleased)  c33d66cc520b3125c763ff4496b8fbb5b54061ef
[   15.362389][    C2] Hardware name: starfive StarFive VisionFive 2 v1.2A/StarFive VisionFive 2 v1.2A, BIOS 2025.07 07/01/2025
[   15.362406][    C2] epc : __patch_insn_write+0x3d8/0x3e8
[   15.362457][    C2]  ra : __patch_insn_write+0x132/0x3e8
[   15.362487][    C2] epc : ffffffff9d61ade8 ra : ffffffff9d61ab42 sp : ffffffc6005ab920
[   15.362506][    C2]  gp : ffffffff9fe6e900 tp : ffffffd6c0f96e40 t0 : ffffffff9d622468
[   15.362525][    C2]  t1 : 0000000000006000 t2 : 0000000000001000 s0 : ffffffc6005ab980
[   15.362542][    C2]  s1 : 0000000000000000 a0 : 0000000000000000 a1 : 0000000020345c44
[   15.362558][    C2]  a2 : 0000000000000004 a3 : ffffffff9e46f388 a4 : 0000000000000000
[   15.362574][    C2]  a5 : 0000000000000000 a6 : ffffffffa01789f8 a7 : 0000000054494d45
[   15.362591][    C2]  s2 : 0000000020345c44 s3 : 0000000000000c44 s4 : 0000000000000c48
[   15.362608][    C2]  s5 : 0000000000000fff s6 : 0000000000002000 s7 : ffffffff9f2358f8
[   15.362624][    C2]  s8 : 0000000000000004 s9 : 0000000020347484 s10: 0000000000000000
[   15.362640][    C2]  s11: ffffffff203946d8 t3 : 0000000000000001 t4 : ffffffd6c0f96f00
[   15.362658][    C2]  t5 : 0000000000000400 t6 : 0000000000000000
[   15.362671][    C2] status: 0000000200000120 badaddr: 0000000000000000 cause: 0000000000000003
[   15.362690][    C2] [<ffffffff9d61ade8>] __patch_insn_write+0x3d8/0x3e8
[   15.362726][    C2] [<ffffffff9d61afa8>] patch_text_nosync+0x48/0x80
[   15.362760][    C2] [<ffffffff9d614f92>] riscv_cpufeature_patch_func+0xc2/0x130
[   15.362795][    C2] [<ffffffff9d614108>] _apply_alternatives+0x90/0xb8
[   15.362825][    C2] [<ffffffff9d61431c>] apply_module_alternatives+0x14/0x28
[   15.362855][    C2] [<ffffffff9d62032e>] module_finalize+0x66/0xa0
[   15.362887][    C2] [<ffffffff9d714a32>] load_module+0x151a/0x1f48
[   15.362914][    C2] [<ffffffff9d7156a2>] init_module_from_file+0x82/0xe0
[   15.362940][    C2] [<ffffffff9d71594a>] __riscv_sys_finit_module+0x24a/0x348
[   15.362967][    C2] [<ffffffff9e257796>] do_trap_ecall_u+0x3be/0x498
[   15.362997][    C2] [<ffffffff9e266414>] handle_exception+0x154/0x160
[   15.363054][    C2] Code: 17a6 8726 97b6 7863 00d7 b683 030a 05b3 40d7 bfa9 (9002) 4605 
[   15.363076][    C2] ---[ end trace 0000000000000000 ]---
[   15.363092][    C2] Kernel panic - not syncing: Fatal exception in interrupt
[   15.363107][    C2] SMP: stopping secondary CPUs
[   15.363145][    C2] Kernel Offset: 0x1d600000 from 0xffffffff80000000

So it looks like the insn decoder is broken.  Instrumenting the kernel
shows the following insns being emulated:

[    7.318366][    C0] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c5ba14a INSN=c190
[    7.318401][    C0] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c5ba146 INSN=c190
[    7.318459][    C0] handle_scalar_misaligned_load: PC=riscv_cpufeature_patch_func+0x32/0x138 ADDR=ffffffff0c5ba152 INSN=c4a903
[    7.476473][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a7c3 INSN=c59023
[    7.476519][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a7bd INSN=c190
[    7.476538][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a7b9 INSN=c190
[    7.476556][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a7b3 INSN=c59023
[    7.476575][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a7ad INSN=c190
[    7.476593][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a7a9 INSN=c190
[    7.476612][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a79d INSN=c190
[    7.476630][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a799 INSN=c190
[    7.476648][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a793 INSN=c59023
[    7.476666][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a78d INSN=c190
[    7.476684][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a789 INSN=c190
[    7.476703][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a77d INSN=c190
[    7.476722][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a779 INSN=c190
[    7.476740][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a773 INSN=c59023
[    7.476758][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a76d INSN=c190
[    7.476777][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a769 INSN=c190
[    7.476795][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a75d INSN=c190
[    7.476814][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a753 INSN=c59023
[    7.476832][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a74d INSN=c190
[    7.476850][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a749 INSN=c190
[    7.476868][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a743 INSN=c59023
[    7.476887][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a73d INSN=c190
[    7.476906][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a733 INSN=c59023
[    7.476924][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a72d INSN=c190
[    7.476942][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a729 INSN=c190
[    7.476961][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a723 INSN=c59023
[    7.476979][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a7a3 INSN=c59023
[    7.476998][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a713 INSN=c59023
[    7.477018][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a70d INSN=c190
[    7.477036][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a709 INSN=c190
[    7.477055][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a703 INSN=c59023
[    7.477074][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a6f9 INSN=c190
[    7.477093][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a783 INSN=c59023
[    7.477111][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a6f3 INSN=c59023
[    7.477130][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a6ed INSN=c190
[    7.477149][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a6e9 INSN=c190
[    7.477168][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a6e3 INSN=c59023
[    7.477187][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a6d9 INSN=c190
[    7.477205][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a763 INSN=c59023
[    7.477224][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a6d3 INSN=c59023
[    7.477243][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a6cd INSN=c190
[    7.477262][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a759 INSN=c190
[    7.477280][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a6c9 INSN=c190
[    7.477299][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a6c3 INSN=c59023
[    7.477318][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a6bd INSN=c190
[    7.477337][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a6b9 INSN=c190
[    7.477356][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a6b3 INSN=c59023
[    7.477374][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a6ad INSN=c190
[    7.477393][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a739 INSN=c190
[    7.477411][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a6a9 INSN=c190
[    7.477430][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a6a3 INSN=c59023
[    7.477449][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a69d INSN=c190
[    8.111827][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a699 INSN=c190
[    8.111852][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a693 INSN=c59023
[    8.111871][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a71d INSN=c190
[    8.111890][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a68d INSN=c190
[    8.111909][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a719 INSN=c190
[    8.111928][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a689 INSN=c190
[    8.111946][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a683 INSN=c59023
[    8.111965][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a67d INSN=c190
[    8.111984][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a679 INSN=c190
[    8.112003][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a673 INSN=c59023
[    8.112022][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a6fd INSN=c190
[    8.112040][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a66d INSN=c190
[    8.112059][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a669 INSN=c190
[    8.112078][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a663 INSN=c59023
[    8.112097][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a65d INSN=c190
[    8.112116][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a659 INSN=c190
[    8.112135][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a653 INSN=c59023
[    8.112153][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a6dd INSN=c190
[    8.112171][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a64d INSN=c190
[    8.112190][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a649 INSN=c190
[    8.112209][    C2] handle_scalar_misaligned_store: PC=apply_16_bit_accumulation+0xe/0x48 ADDR=ffffffff0c84a643 INSN=c59023
[    8.112228][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a63d INSN=c190
[    8.112247][    C2] handle_scalar_misaligned_store: PC=apply_32_bit_accumulation+0x10/0x48 ADDR=ffffffff0c84a639 INSN=c190
[    8.113036][    C2] handle_scalar_misaligned_store: PC=apply_r_riscv_64_rela+0x14/0x28 ADDR=ffffffff0c71ad0c INSN=e190
[    8.113062][    C2] handle_scalar_misaligned_store: PC=apply_r_riscv_64_rela+0x14/0x28 ADDR=ffffffff0c71ad34 INSN=e190
[    8.113078][    C2] handle_scalar_misaligned_store: PC=apply_r_riscv_64_rela+0x14/0x28 ADDR=ffffffff0c71ad3c INSN=e190
[    8.436515][    C2] handle_scalar_misaligned_load: PC=riscv_cpufeature_patch_func+0x32/0x138 ADDR=ffffffff0c84a645 INSN=c4a903
[    8.436556][    C2] handle_scalar_misaligned_load: PC=riscv_cpufeature_patch_func+0x36/0x138 ADDR=ffffffff0c84a641 INSN=84d583
[    8.436575][    C2] handle_scalar_misaligned_load: PC=riscv_cpufeature_patch_func+0x9a/0x138 ADDR=ffffffff0c84a639 INSN=4a983
[    8.436594][    C2] handle_scalar_misaligned_load: PC=riscv_cpufeature_patch_func+0x9e/0x138 ADDR=ffffffff0c84a63d INSN=44ac83
[    8.436627][    C2] handle_scalar_misaligned_load: PC=riscv_cpufeature_patch_func+0xb2/0x138 ADDR=ffffffff0c84a643 INSN=a4d603

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
