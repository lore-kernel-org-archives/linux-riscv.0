Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DC7C55ABF
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 07:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZTWqHOwYvXhj+fRZC7LgHC36OxgEjsbikzS3VyaD7A=; b=dk5+T5x0NZd9mc
	x6VA6oqxlJRmNh1TspXVJELqIFvwYUrWT3IpNiX8krfr2km0GtAXP4uNoynjTwzYNkScWiNSVKEQn
	AAMCkKQ4twxDxasVMHREgqQewQ0sYq0RSPdFgMJM1j8bUjYyHFXXYShW5Tf7FqDqhmxFxxNv6g3qj
	I8GOUcy8ftCHNWjXAUWF0bhSTjKv0v02uvNyefSfqNZ/XHnIEn3Zvqaf7NWFj7P3kEVVDGz72XkOn
	Fd8LOtdMMCW5PJmiq5LHELKkHy2xlp98XH/Bww3pFHi5jm2cyZgnNmIBHU7m8Cb+4RYzmnCVW5A6c
	LEGWB3QhEZhKct67dxug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsEn-000000057BS-18z2;
	Thu, 06 Aug 2026 07:09:57 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrsEj-000000057A8-3E9p;
	Thu, 06 Aug 2026 07:09:55 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786000190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eMT4S1LkWt8Ik0+XZRVYI9d+h5TnrJVOqIGCgTgfYIs=;
	b=oy/uxERExhL2WaAwWd/K4RgtnvN0AEg7Hn6/85XUvPfoyLwYN+HaaO4X4und2xDRys+BBU
	MpBH0BaoZFoyEbNcnHB189Mh8a2kPnIWAq30qF/8Ie9HBs+EGNLZWlzk+vEVMoNR8m+kAa
	6IsNmonvA0YcReWDC+MwoXW6UqZFGq38AbM5YvUEoAgYZDQqIoMkhf8OkVUSq9Kj6Tfxyg
	zBMcceT5pUQcKbaOdb7XxAdm3Fp+3/K99p5MSm0VqvkGW+2O3YevJLnrIwH77x4wYceT9S
	Han6Wz9QBij6Fwpb5P/HGP2E3FqjgBJwlUBlyViDqC5XvJdAMDXEzQYsw2wFaw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786000190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eMT4S1LkWt8Ik0+XZRVYI9d+h5TnrJVOqIGCgTgfYIs=;
	b=bwtbJhpx1H17PQArbXdA2T8ILJ7epNL6NyKp17SWMYNcd47jKpDMPD0hISSHG0iOqz1J9X
	uuvpwRmzWve4/8AQ==
To: Charlie Jenkins <thecharlesjenkins@gmail.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Atish Patra
 <atish.patra@linux.dev>, Conor Dooley <conor@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah
 Khan <shuah@kernel.org>, Radim =?utf-8?B?S3LEjW3DocWZ?=
 <radim.krcmar@oss.qualcomm.com>,
 Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Charlie Jenkins
 <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH v3 03/17] riscv: kgdb: Use generated instruction headers
In-Reply-To: <20260707-riscv_insn_table-v3-3-3f8e5f75ba97@gmail.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
 <20260707-riscv_insn_table-v3-3-3f8e5f75ba97@gmail.com>
Date: Thu, 06 Aug 2026 09:09:50 +0200
Message-ID: <87o6ffd8sh.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_000953_960899_87D71819 
X-CRM114-Status: UNSURE (   6.67  )
X-CRM114-Notice: Please train this message.
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

Charlie Jenkins <thecharlesjenkins@gmail.com> writes:
> +#define riscv_insn_branch(_insn, regs_ptr, _opcode, _pc, _comparison, type)     \
> +	({                                                                      \
> +		unsigned long _ret;                                             \
> +		if ((type)riscv_insn_reg_get_val(                               \
> +			    regs_ptr,                                           \
> +			    riscv_insn_##_insn##_extract_xs1(_opcode))          \
> +			    _comparison(type) riscv_insn_reg_get_val(           \

That _comparison(type) looks like _comparison is a function and type is
its argument.

Can we change to
    _comparison (type)riscv_insn_reg_get_val(
to make it clearer?

>  		} else if (riscv_insn_is_c_beqz(op_code)) {
> -			rs1_num = decode_register_index_short(op_code,
> -							      RVC_C1_RS1_OPOFF);
> -			if (!rs1_num || regs_ptr[rs1_num] == 0)
> -				*next_addr = RVC_EXTRACT_BTYPE_IMM(op_code) + pc;
> +			rs1_num = riscv_insn_c_beqz_extract_xs1(op_code);
> +			if (regs_ptr[8 + rs1_num] == 0)
> +				*next_addr = riscv_insn_c_beqz_extract_imm(op_code) + pc;

Would it make sense to include the +8 part in riscv_insn_c_beqz_extract_xs1()?

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
