Return-Path: <SRS0=EtLq=FE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B885CC3E8C5
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 00:13:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00DB020709
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 00:13:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3JQULBbw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X69LefQa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00DB020709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+O02rJzo0e0cFdQI+2fCyslPqnMaSO8yLF59Rm74aRg=; b=3JQULBbwy3/XfcCtWxmXoszeU7
	dV9QPhtDLvivfNmpzfMSHrexu/AvqA8beIEUbndiPxih4ecuKPV+FEsqOqe36QVzThZbgxZlWUSl6
	Xp4qiL1MJ1XTI6kUBgBhj7FUktdCBYTDj23X/rJs1jSAExY0STwfhPkMTt5a7lUPbew49fCRLFc6P
	s1D2CA9OF5b9FU4GyD5aHP5J0lBWHLfeqnR834E3un+QSahHciVJS8sY9d6Ix4p4O4+hwEGH8pFRy
	hpQUTf2wiizSqfm6MzdZiTuPDQGLsk6w9furSeo6JQjqojTEkuIGsVUzUr/ijKDdRSihuOdyHu9Lf
	5imikljw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjWoP-0005ID-Bh; Mon, 30 Nov 2020 00:13:01 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjWoK-0005Hq-RR
 for linux-riscv@lists.infradead.org; Mon, 30 Nov 2020 00:12:57 +0000
Received: by mail-pf1-x434.google.com with SMTP id w202so9279766pff.10
 for <linux-riscv@lists.infradead.org>; Sun, 29 Nov 2020 16:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:organization:mime-version
 :content-transfer-encoding;
 bh=r5gOm63N9r2G0UuXiUtBAnvoVflu0pVHx/1wXoOioUQ=;
 b=X69LefQai39g3MumyUGX6Vt8jn3uxKTzPVYVfjgAUlTkQjHg7bPbAaoWs1IPxw81yZ
 zEiBGEmXp3N7CnYJbMyOxlXIQubKoihxjLLIuQDwqm7XTEB/obUDBXGKqWhNMrVtcHzx
 5RqKgjs8pRG5GTmFGMsUWvNL80OVjNnvYF6j+Cqlp3+WWEDHaPPoGzbyJIeGmegSgRZ5
 Vj2jKxVIn3wvR0RsCKeTtUiB1DOyBwDaHLanW8QOhdigpsEyIPP3kjPozVvP3pqnwnej
 DB4vc9vsU6hPEfJ14ctd1viNqXWCgzchK3ffihUIWItuBNZCLabROUUl3Ovg42VFU50v
 uS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:organization
 :mime-version:content-transfer-encoding;
 bh=r5gOm63N9r2G0UuXiUtBAnvoVflu0pVHx/1wXoOioUQ=;
 b=WY7Cstpnc8fAgUxBE9hKtKopBJsAO+86MLvo4UCFM/V08yo1NzEYcddG0yGg2ChvPj
 hndWN+u/RS7RP3V0fT31SvgSEhMZv+25FKbYs08ukZYeRO5cXJ9gap9UAtOSYikgkV1n
 aCa3qe3kextxU03GghUH73xXjRCJjZqgGxLdPNuVtApx4aCU5G5DcRk+7k8EgyqMTAPO
 zhjMGGksbcbBuU9PmFwb6f+qAIZXgOEnhSuyn/rhUjRVxBBRbi8vBP1qDFPTZ00rbjN3
 LSOX/7bO6mH36wLBpaX1MKcF/rKKi0E1lN/DYyUQRtEHnHoTd1w7dbf1ejHvlJ2vJhl6
 fjCw==
X-Gm-Message-State: AOAM532NQD9c1vx8T3q/D/wkgT7+u+0FkJ+sn2bgLYsBOmwRVr+nTHFN
 SYlmEVjg++LqCxafjV6ZeHIAn4YmBv0aBQ==
X-Google-Smtp-Source: ABdhPJxGoIKYtY1VXYNjr98Q++5cZ2d8AaEtXTjU0LvYF1GpeBdjghaYNWJQKWHHrerUG7hUE+83UQ==
X-Received: by 2002:a62:1b02:0:b029:18a:b052:deb1 with SMTP id
 b2-20020a621b020000b029018ab052deb1mr16284681pfb.32.1606695172549; 
 Sun, 29 Nov 2020 16:12:52 -0800 (PST)
Received: from rata.localnet ([2406:e007:8145:4301:28da:23d:33fb:8a85])
 by smtp.gmail.com with ESMTPSA id x6sm11760117pgr.20.2020.11.29.16.12.50
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 16:12:51 -0800 (PST)
From: Paul Campbell <taniwha@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: Turning the MMU on .....
Date: Mon, 30 Nov 2020 13:12:48 +1300
Message-ID: <3057294.0aWk0VS80s@rata>
Organization: Moonbase Otago
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart2021202.rEpcuPdsNp"
Content-Transfer-Encoding: 7Bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_191256_967113_F17E33EC 
X-CRM114-Status: GOOD (  21.30  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is a multi-part message in MIME format.

--nextPart2021202.rEpcuPdsNp
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

I'm new to this list, likely ignorant to past discussions, please bear with=
 me=20
:-)

I'm bringing up a new core, one that's heavily pipelined/speculative/O-O al=
l=20
that good stuff, and reached the point where linux is coming up, most of my=
=20
issues are mine but there's one I've come across in the tip-of-tree riscv=20
linux that I think is more general .... it's this code in relocate() in hea=
d.S=20
=2D to paraphrase the code is:

relocate:
	li a1, PAGE_OFFSET
        	la a2, _start
        	sub a1, a1, a2	    //a1 is relocation offset
       	....
	la a2, 1f
	add a2, a2, a1
	csrw CSR_TVEC, a2  // vector is 1f relocated
	....
	la a0, trampoline_pg_dir
	srl a0, a0, PAGE_SHIFT
	or a0, a0, a1
	sfence.vma
	csrw CSR_SATP, a0
	.align 2
1:	....

In my world this fails miserably, mostly because the sfence.vma does a pipe=
=20
flush (as it should) and by the time the csrw CSR_SATP, a0 is executed has=
=20
already fetched (using the old [turned off] MMU mapping) and speculatively=
=20
executed much of the code up until the following return instruction. What I=
=20
think that the code is expecting to happen is that the instruction followin=
g=20
the write to CSR_SATP will fault and refetch the instruction stream using t=
he=20
new mapping, and this likely works on some microarchitectures, it also=20
probably works by happenstance on some systems where there happens to be an=
=20
invalid instruction hiding under the ".align 2".

Reading the RISC-V priviliged spec it's very explicit about "csrw CSR_SATP,=
=20
a0":

"Note that writing satp does not imply any ordering constraints between pag=
e-
table updates and subsequent address translations. If the new address space=
=E2=80=99s=20
page tables have been modified, or if an ASID is reused, it may be necessar=
y to=20
execute an SFENCE.VMA instruction (see Section 4.2.1) after writing satp."

4.2.1 includes the note:

"A consequence of this specification is that an implementation may use any=
=20
translation for an address that was valid at any time since the most recent=
=20
SFENCE.VMA that subsumes that address. In particular, if a leaf PTE is modi=
fied=20
but a subsuming SFENCE.VMA is not executed, either the old translation or t=
he=20
new translation will be used, but the choice is unpredictable. The behavior=
 is=20
otherwise well-defined."

What does this mean? it means that if you SFENCE.VMA and then subsequently=
=20
write to satp it is undefined whether the new page table regime is in place=
 for=20
an arbitrary number of instructions thereafter (this number could be quite=
=20
large if you are turning on the MMU for the first time because some larger=
=20
systems may have hundreds of decoded instructions in flight at a time - in =
some=20
versions of my current system it can be ~100, though in this particular cas=
e=20
it's more likely in the order of 10-12 or so instructions that manage to pa=
ss=20
the instruction TLB between when the sfence is executed and when the satp i=
s=20
written).

In general I think that for RISCV mmu code to work we always need to sfence=
=20
after every write to satp or page tables (as the spec says it needs to be f=
or=20
an 'enclosing range') .... AND there needs to be a mapping in place in the =
MMU=20
configuration both before and after the execution of the write to satp that=
=20
includes a valid mapping of the virtual address of the code fragment betwee=
n=20
where the write to satp occurs and the sfence instruction.=20

This last requirement, is normally not an issue in the linux kernel since a=
ll=20
the code is mapped with one big mapping that doesn't change .... except of=
=20
course when you first turn on the MMU, when you're switching from no MMU to=
 a=20
running MMU - which is the situation where I started this discussion.

=2D------------------------------------------------------------------------=
=2D-----------------------------------------

So a proposal: rather than use the 'trampoline' code, that only works for s=
ome=20
systems, we should use an initial kernel mapping that maps both the kernel=
=20
virtual addresses and also maps the initial memory 1:1. If we do that then =
the=20
actual initial switch becomes simple (see the attached code fragment), the=
=20
other required change is in setup_vm() - instead of making a 'trampoline'=20
mapping and an initial kernel mapping we just make an initial kernel mappin=
g=20
that also contains a 1:1 mapping for the initially  loaded kernel.

Anyway this has gone on too long, hopefully the right people will read it a=
nd=20
understand - as I mentioned above I'm a noob here (but a kernel hack since =
V6,=20
and have been laying gates for almost as long)

	Paul Campbell
	Moonbase Otago
--nextPart2021202.rEpcuPdsNp
Content-Disposition: attachment; filename="h.S"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"; name="h.S"

#ifdef CONFIG_MMU
relocate:
	/* Relocate return address */
	li a1, PAGE_OFFSET
	la a2, _start
	sub a1, a1, a2
	add ra, ra, a1

	add	gp, gp, a1

	/* Compute satp for kernel page tables  */
	srl a2, a0, PAGE_SHIFT
	li a1, SATP_MODE
	or a2, a2, a1

	/*
	 * Switch to kernel page tables.  
	 */

	csrw CSR_SATP, a2
	sfence.vma

	ret	// switch to kernel addressing occurs here
#endif /* CONFIG_MMU */

--nextPart2021202.rEpcuPdsNp
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--nextPart2021202.rEpcuPdsNp--




