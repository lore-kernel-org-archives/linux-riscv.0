Return-Path: <SRS0=g+2U=B4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1095FC433E3
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Aug 2020 22:18:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D396120789
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Aug 2020 22:18:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E/Z6pOLA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OIqydpEt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D396120789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZsSe/vAZojv8ZwtzDT7jV+Pu/tv4j+jyaPqx7JumejA=; b=E/Z6pOLATqTNQ2w1L/pjIatjE
	bFjimwTCUSRG76iBMxspMdKe0ov+BgTbXcZ1AT+4v7mOsqaN0sDYbG3iIiMYoKjj/XJ8cgVb48wcW
	ax0lG9LQn1N1DQCpDfPjCvuPz8zFGLohxr7DPG/mD4a3HqljyEwleZ2U+dDRSvBv3Z6+qlaWbdpSa
	9jfyUk06sqxxeYZJZTu47gPV31X0HsuaiWHxe56nMcTo9gaAVuLwmYiRvjgeMOHJIW3hQOJXfI27O
	LcGYRJgvguEkVVHTIHr46nWIEghEHHoRtbf3eVRTyJvFxvhgSBeRA0AFi4R3ROYEn/KbtXtcpMfNC
	Exc1w9vRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k89vt-00052s-QL; Tue, 18 Aug 2020 22:18:17 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k89vp-000518-V0; Tue, 18 Aug 2020 22:18:14 +0000
Received: by mail-lf1-x142.google.com with SMTP id c15so11049765lfi.3;
 Tue, 18 Aug 2020 15:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nn5mkrGFBbPg90QSTX4ScoaPazdulb+v6hO8tmlQUhM=;
 b=OIqydpEtkNgTroF3lnVBbcPUKQ2ogcmEFiN7wEqPDoyKdbDTrVZZ+NzClaB1tmtiGg
 1q5dVw3gvA1HPNIt4f5Vr2bR4NBZwxXhiEUf3tzRwKt7NekpaA3/ibZvmA16+OG3grZ+
 Y0pgD14ByceFmFxwkAMy97PtaHPZGmMkTHmHfX1qI8cguewQrhSEyNet//D8uLt3URbX
 wtAIYHJxjbyMRdcrkRjXE+IjNA6JaY3Jp4v8SILylCVLQ416pwm5RG8VS/kkCIf9Vupf
 N2rIlz5ZIsghwkVWwHdlgrBINrap6VQaSjRwMPYFZcqiCFlD1Cw4CyHiSO7wqpA8NX8m
 GJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nn5mkrGFBbPg90QSTX4ScoaPazdulb+v6hO8tmlQUhM=;
 b=PONPQFkbkVhXv//DeYY/EA+AFLU6r8ti2h4kvrZ682WZv/ZzbhSZzhmoz/HKr/7SlZ
 gboaetOMidAfE9w8UGaUKShRENBE90c3jOEUWbauXLAfo92D/lZECK39LJjOBvZFlSnw
 oYndRCf8oQpQ7eK0Ct9fpXxRSsq/RN2BTB1eMl8BauJekSTReoMXpfJGbxB0ELtFM5Vx
 5yKG6fwd/EjwQ/8aqubRVeqHYN1YxZbNONE4pkahJ//os4p54uBvBZdW3kP6ch60m264
 Ry2sdURKIO43m/i0QUjmWIEG4dgUlw6CipKXXoZZE9PzPJ1Uv6hBaT2Q7d6hJ37L44yu
 JOag==
X-Gm-Message-State: AOAM531igaQtag54ATSULvqEvCCI62jqKAlcruAkImwugqvnYH5xRV5r
 4Xkl0MwV+kdaRYGS9wjbTAJIrzQwDc1mxcw/1/8=
X-Google-Smtp-Source: ABdhPJyYNUN3v5scOCVMaoKuHu78eqvAibUFuUkJdpzA5rqp/I7KCAgyGHrlcUN+z5qLySo7/N7W852szcke7k/pYlA=
X-Received: by 2002:a19:cb51:: with SMTP id b78mr10676996lfg.130.1597789091106; 
 Tue, 18 Aug 2020 15:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200818151634.14343-1-rppt@kernel.org>
 <20200818151634.14343-11-rppt@kernel.org>
In-Reply-To: <20200818151634.14343-11-rppt@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 19 Aug 2020 00:18:00 +0200
Message-ID: <CANiq72mnzTv7SphVxsYy++rAPdaKVVLGGHauxNLY5D4dzq3CPA@mail.gmail.com>
Subject: Re: [PATCH v3 10/17] memblock: reduce number of parameters in
 for_each_mem_range()
To: Mike Rapoport <rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_181814_039125_E785589B 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Baoquan He <bhe@redhat.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Ingo Molnar <mingo@redhat.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Linux-MM <linux-mm@kvack.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 18, 2020 at 5:19 PM Mike Rapoport <rppt@kernel.org> wrote:
>
>  .clang-format                          |  2 ++

For the .clang-format bit:

Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

Cheers,
Miguel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
