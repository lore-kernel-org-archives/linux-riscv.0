Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A7BCED63E
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 09:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=tW2ds9jpdiKsjY6gM9Fm5ml4fG8iATXiQXhEbetY94U=; b=xAN
	JTEwoaSk5rQ5kjNe9f8WL0T04n+coOgflmi4rm/OdIV+22Q7tfPVsc0+NnLkQzLH6x4MgG/e3JP7F
	T40AEX7yhM7uWRKOfVbe74n+MUfqD/JtySQtpErrJxvdcLD1bSadNSfLPVOoUGQvGnnmJMdyLestn
	K58ADCi1WNSc4Fpbgk5SwX4/7eXyh6koqXkw/CkCtp/bf+67woqJE5Z6AFB51NgB+ZdSOtfwHNf37
	J80frBDvgP2ktaVSMCmxT9HX6ngs/DB+msSt2RKKe8g1vn8CJnz/UEwsBH/WXykTg0T3LrDeMjKAP
	mQO5kZNZ574GmmX/eDONDm7atvpWW6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syTEN-00000008jTS-1TOZ;
	Wed, 09 Oct 2024 09:43:43 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syTEL-00000008jT8-003W
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 09:43:42 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-287b8444ff3so2998081fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 02:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728467020; x=1729071820; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QB3YYJj7uC7H5yzkkix/m2UznupWTcGjD476x/KJcI4=;
        b=Yd8Y/ry1mtCgA/r2ve1qKXNdKCN84o5ZTXAgaCOLX0sT2RVkuxrOAI+VDDo3hAwVl4
         LIQHM0Orn+2cUK94P79OcPzTr1ePg6SXTb1/8ztRvernuNXaupoV9i/R1N8ip8c5lSeI
         cMmXBsnzxSSOZXm2CaXDIXdv6ELpp9cVgmqhRKfCnF21VOrC6fn5iR5Wj7YN2sn+cMo0
         wFwEpov3H1eBOJGxrX+SjtSK++y8szknh1j/mz9BWgKP7nCv8YLWy1dQ50Jd50aYczco
         PMY2ILXjmj5C+Yt3tm2OuLxPdeKn39uo+l34964/r5sb+Ki82AJv7nkbeJXC02oYAyLg
         jgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728467020; x=1729071820;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QB3YYJj7uC7H5yzkkix/m2UznupWTcGjD476x/KJcI4=;
        b=f8dHoOWLoouyYh2itnpcPb/aJOcipUprjEOcath4/OyNtFkkXj8TqQwM90owugIKMo
         enHx8VJeJ/BqZ4R2xq3+nsdHIr0x/QD3mcCyVHDli0YT7SQ9elTY4tOTWi8veWeAkup4
         RCpYwgIuNgl+xnTWjTjwuUq1WBIB9NGkN0jdwtyFCKQPm9pOpe5Ovc3652nU8K1pTWCq
         lkwW4nDi9q9lerQg4zxmWTzgv8T9trl3MsK1sOmZsYxC15TFlbyrY++MF3aw2AyToiQ+
         dBbtruFLMik3j6EFOJ8aLtd2aOdaGaNeEFX5TK0t6q3sps8CgZRLdFhxQzIsi6NyIRKR
         2oEQ==
X-Gm-Message-State: AOJu0Yz0lt/Dg789BMtFCmAlPpCaYCqKCu1b5gmA3zzZM4lnlfgT/a2u
	sWw/Ykb4w8BbJTXN1Oml+6wxLGvxKaPTMuldaJV5pFwoQOT4IJG6jarXtvIH+vZsJCx0mVQg2TT
	tMT4Ad1iQt4GURNdF7mYcC00GCLsSEvU=
X-Google-Smtp-Source: AGHT+IH2Inh4M4Tvdg2p9kn2sofU8LQxP9Un+GbQax4AZa+sx9rsyXkcBejzzTfU1Qm1UJrPs9vdNmU+OoTNzV/42EQ=
X-Received: by 2002:a05:6870:4402:b0:270:6ec0:c00 with SMTP id
 586e51a60fabf-288342b2981mr1635549fac.12.1728467019697; Wed, 09 Oct 2024
 02:43:39 -0700 (PDT)
MIME-Version: 1.0
From: Guillem Senabre <guillemsenabre@gmail.com>
Date: Wed, 9 Oct 2024 11:43:28 +0200
Message-ID: <CAE30jh3Wa_imwKQ78wTW8E8D4JMoWtCY2TbJAO0-gz7sHceYFg@mail.gmail.com>
Subject: [RISCV] [BUG] CPU topology issue on TH1520 on Kernel 5.10.113-th15020
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_024341_058118_6CA7DDC6 
X-CRM114-Status: UNSURE (   5.62  )
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

Dear Linux kernel developers, `sysfs` shows unexpected values when
listing CPU topology for a TH1520 RISC-V CPU.

In particular, the following commands output always -1:

cat /sys/devices/system/cpu/cpu0/topology/{core_id,die_id,physical_package_id}
cat /sys/devices/system/cpu/cpu1/topology/{core_id,die_id,physical_package_id}
cat /sys/devices/system/cpu/cpu2/topology/{core_id,die_id,physical_package_id}
cat /sys/devices/system/cpu/cpu3/topology/{core_id,die_id,physical_package_id}

The expected outputs would be a positive integer, rather than the -1
currently obtained for all.

For more context: We are testing qemu on top of libvirt. This issue is
blocking us since libvirt aborts after calling "virHostCPUGetCore()",
which reads: /sys/devices/system/cpu/cpu0/topology/core_id and obtain
a "-1".

We have resources allocated to debug this issue, but we'd appreciate
guidance on where to focus our efforts.

Hardware:
- Board: Sipeed LicheePi4a
- Processor: TH1520
- Architecture: riscv64

Software:
- OS: Debian GNU/Linux trixie/sid
- Kernel: Linux 5.10.113-th15020
- libvirt: 10.6.0

Thank you for your time and assistance. Please let us know if you need
any additional information to help diagnose this issue.

Best regards,
Guillem

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
