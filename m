Return-Path: <SRS0=uYfr=A2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06ED4C433E3
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 08:46:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAF812064C
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 08:46:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="buW0gvM5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAF812064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LRqMYiB3s0eV3i2czHbt7WAeUYgy4mc9DBCXz3j4n6E=; b=buW0gvM5PAUduDwlcKHm/luJX
	lwvVIWYNa5eFafSeDuFnaw53f+A4rYScA86Axix8ls1ItnF4n7Kuan+ooN3SeDoOZO3mbX660ukXh
	tf1mAEEv2xKAWt8b6AvBorcuM+nodhuv+13ZCSGVpYeE1r8jTiu1aMsovdtnA54EbOA/HUVMkvCP+
	BHiYnmrryqGZBdSX+Ao2sRmyS8I8zfL4t4aFpWKv8URYn0y0DyvzUdCeSCOGyXLE7sGT6ZMfYguZ/
	6E9n8uhyBtyH4aAb3sYNEFoNIGNCl3y1t2ZDrDVOrNC0ZJ6gjyKwHO4DiizNTD8Vhc37RlChauMrk
	n3z1ocAPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvcaJ-0001O7-6S; Wed, 15 Jul 2020 08:16:11 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvcaE-0001Ks-9y
 for linux-riscv@lists.infradead.org; Wed, 15 Jul 2020 08:16:08 +0000
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-118-VUzQIPn9PGiRcCFwemuUlA-1; Wed, 15 Jul 2020 09:15:49 +0100
X-MC-Unique: VUzQIPn9PGiRcCFwemuUlA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Wed, 15 Jul 2020 09:15:47 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Wed, 15 Jul 2020 09:15:47 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Jarkko Sakkinen' <jarkko.sakkinen@linux.intel.com>, Peter Zijlstra
 <peterz@infradead.org>
Subject: RE: [PATCH v2 1/3] module: Rename module_alloc() to text_alloc() and
 move to kernel proper
Thread-Topic: [PATCH v2 1/3] module: Rename module_alloc() to text_alloc() and
 move to kernel proper
Thread-Index: AQHWWhTZJFla60Gj2kinqcyPQzfqlakISLKA
Date: Wed, 15 Jul 2020 08:15:47 +0000
Message-ID: <778f330d994340c89241f5318a54422f@AcuMS.aculab.com>
References: <20200714094625.1443261-1-jarkko.sakkinen@linux.intel.com>
 <20200714094625.1443261-2-jarkko.sakkinen@linux.intel.com>
 <20200714102826.GB4756@willie-the-truck>
 <20200714112927.GV10769@hirez.programming.kicks-ass.net>
 <CAMj1kXGG4vxWrp1de1FxdU=8F4Jof00=T1x-7e+BW7_HP-oZMQ@mail.gmail.com>
 <20200714130109.GX10769@hirez.programming.kicks-ass.net>
 <20200714163103.GA1472166@linux.intel.com>
In-Reply-To: <20200714163103.GA1472166@linux.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_041606_532979_D9CD04C5 
X-CRM114-Status: GOOD (  12.00  )
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Song Liu <songliubraving@fb.com>,
 Paul Mackerras <paulus@samba.org>, Zong Li <zong.li@sifive.com>,
 Andi Kleen <ak@linux.intel.com>, Paul Burton <paulburton@kernel.org>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 Petr Mladek <pmladek@suse.com>, Brian Gerst <brgerst@gmail.com>, Andy
 Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri
 Kosina <jkosina@suse.cz>, Anup Patel <anup.patel@wdc.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Philipp Rudo <prudo@linux.ibm.com>,
 Torsten Duwe <duwe@lst.de>, Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mark
 Rutland <mark.rutland@arm.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Vincent Chen <deanbo422@gmail.com>, Omar Sandoval <osandov@fb.com>,
 "open list:S390" <linux-s390@vger.kernel.org>,
 Joe Lawrence <joe.lawrence@redhat.com>, Helge
 Deller <deller@gmx.de>, John Fastabend <john.fastabend@gmail.com>, Anil S
 Keshavamurthy <anil.s.keshavamurthy@intel.com>, Yonghong Song <yhs@fb.com>,
 Iurii Zaikin <yzaikin@google.com>, Andrii Nakryiko <andriin@fb.com>, Thomas
 Huth <thuth@redhat.com>, Vasily Gorbik <gor@linux.ibm.com>, "moderated
 list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Daniel Axtens <dja@axtens.net>, Damien Le Moal <damien.lemoal@wdc.com>,
 Martin KaFai Lau <kafai@fb.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>, Atish Patra <atish.patra@wdc.com>, Will
 Deacon <will@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Masahiro
 Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Mao Han <han_mao@c-sky.com>,
 Marco Elver <elver@google.com>, Steven Rostedt <rostedt@goodmis.org>,
 Babu Moger <Babu.Moger@amd.com>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Ben Dooks <ben-linux@fluff.org>,
 Guan Xuetao <gxt@pku.edu.cn>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Jessica Yu <jeyu@kernel.org>,
 "open list:BPF JIT for MIPS \(32-BIT AND 64-BIT\)" <bpf@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Thiago Jung
 Bauermann <bauerman@linux.ibm.com>, David Howells <dhowells@redhat.com>,
 Amit Daniel Kachhap <amit.kachhap@arm.com>,
 Sandipan Das <sandipan@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Miroslav Benes <mbenes@suse.cz>,
 Sven Schnelle <svens@stackframe.org>, Ard Biesheuvel <ardb@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Anders Roxell <anders.roxell@linaro.org>, Jiri Olsa <jolsa@redhat.com>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND
 64-BIT\)" <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, "open
 list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, "Paul E. McKenney" <paulmck@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, KP Singh <kpsingh@chromium.org>,
 Dmitry Vyukov <dvyukov@google.com>, Nick Hu <nickhu@andestech.com>,
 "open list:BPF
 JIT for MIPS \(32-BIT AND 64-BIT\)" <netdev@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, "open
 list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jarkko Sakkinen
> Sent: 14 July 2020 17:31
..
> There is one arch (nios2), which uses a regular kzalloc(). This means
> that both text_alloc() and text_memfree() need to be weaks symbols and
> nios2 needs to have overriding text.c to do its thing.

That could be handled by an arch-specific inline wrapper in a .h file.

Although I actually suspect the nios2 code is just being lazy.
The processor is a very simple in-order 32bit soft cpu for Intel (Altera)
FPGA.

We have four nios2 cpu on one of our fpga images - all running small
(almost single function) code loops.
I can't imagine actually trying to run Linux on one to do anything
useful - clock speed is unlikely to be much above 100MHz.
We can't meet timing at 125MHZ (I've tried quite hard) so have
to run at 62.5MHz because of the PCIe clock.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
