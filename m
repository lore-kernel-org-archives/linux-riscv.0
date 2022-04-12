Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EEAC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 14:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EkxBBrxI8Z8nODdeXtPHa2OFK4+H1GXqp1L4F1kjK2k=; b=KdvksDFOubuuQX1zFXEce/0C6Q
	fsjfHGgkZYBcCcELgbN/3rpEsTNxHL5GjFZruZcDKN4J0YtRgZu+LjNwrTCYQe0tyxow1oOY5zMH+
	ZURJTCYddP3SCNNv1aD/1lKX4JzNd0nGVH50nFDZo7XdXr+mLN1ZUN16MIDpGqsZsgEi/VzOm2X9W
	xtMbj9FLNDIaePB1VBure8TQjM1ITCrameeMD8PhXSsrzxMC204AO78F9mg8wfgQ2n/6jZ5oSfKWr
	RlSekMKwXDQAy2HmMhxEWh9Pav7+YsS/ju/0TT4b7Xpmr63gvCPi2mepvaQtGjgvW3pcA+QtMs8DB
	GQ3f37aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neHt7-00Eq7V-80; Tue, 12 Apr 2022 14:53:01 +0000
Received: from out01.mta.xmission.com ([166.70.13.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neHt3-00Eq57-W5
 for linux-riscv@lists.infradead.org; Tue, 12 Apr 2022 14:52:59 +0000
Received: from in01.mta.xmission.com ([166.70.13.51]:42280)
 by out01.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1neHsk-007MRw-6s; Tue, 12 Apr 2022 08:52:38 -0600
Received: from ip68-227-174-4.om.om.cox.net ([68.227.174.4]:43398
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in01.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1neHsi-0098PU-V8; Tue, 12 Apr 2022 08:52:37 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>,  Alexander Viro
 <viro@zeniv.linux.org.uk>,  Kees Cook <keescook@chromium.org>,  Paul
 Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,  Greg Ungerer <gerg@linux-m68k.org>,
 Mike Frysinger <vapier@gentoo.org>,  "stable@vger.kernel.org"
 <stable@vger.kernel.org>,  "linux-fsdevel@vger.kernel.org"
 <linux-fsdevel@vger.kernel.org>,  "linux-mm@kvack.org"
 <linux-mm@kvack.org>,  "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
References: <20220412100338.437308-1-niklas.cassel@wdc.com>
 <9437ce7f-0553-3688-5695-69add6b2971c@opensource.wdc.com>
 <YlVv2Z5y9qhzu7X9@x1-carbon>
Date: Tue, 12 Apr 2022 09:52:13 -0500
In-Reply-To: <YlVv2Z5y9qhzu7X9@x1-carbon> (Niklas Cassel's message of "Tue, 12
 Apr 2022 12:26:03 +0000")
Message-ID: <878rsatkv6.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1neHsi-0098PU-V8; ; ;
 mid=<878rsatkv6.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in01.mta.xmission.com; ; ; ip=68.227.174.4; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX1+Bet/PxatGaqnfgOKcuhb9h08XezFlLak=
X-SA-Exim-Connect-IP: 68.227.174.4
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: [PATCH] binfmt_flat: do not stop relocating GOT entries
 prematurely
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_075258_079339_20343EE7 
X-CRM114-Status: GOOD (  50.65  )
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

Niklas Cassel <Niklas.Cassel@wdc.com> writes:

> On Tue, Apr 12, 2022 at 08:40:27PM +0900, Damien Le Moal wrote:
>> On 4/12/22 19:03, Niklas Cassel wrote:
>> > bFLT binaries are usually created using elf2flt.
>> > 
>> > The linker script used by elf2flt has defined the .data section like the
>> > following for the last 19 years:
>> > 
>> > .data : {
>> > 	_sdata = . ;
>> > 	__data_start = . ;
>> > 	data_start = . ;
>> > 	*(.got.plt)
>> > 	*(.got)
>> > 	FILL(0) ;
>> > 	. = ALIGN(0x20) ;
>> > 	LONG(-1)
>> > 	. = ALIGN(0x20) ;
>> > 	...
>> > }
>> > 
>> > It places the .got.plt input section before the .got input section.
>> > The same is true for the default linker script (ld --verbose) on most
>> > architectures except x86/x86-64.
>> > 
>> > The binfmt_flat loader should relocate all GOT entries until it encounters
>> > a -1 (the LONG(-1) in the linker script).
>> > 
>> > The problem is that the .got.plt input section starts with a GOTPLT header
>> > that has the first word (two u32 entries for 64-bit archs) set to -1.
>> > See e.g. the binutils implementation for architectures [1] [2] [3] [4].
>> > 
>> > This causes the binfmt_flat loader to stop relocating GOT entries
>> > prematurely and thus causes the application to crash when running.
>> > 
>> > Fix this by ignoring -1 in the first two u32 entries in the .data section.
>> > 
>> > A -1 will only be ignored for the first two entries for bFLT binaries with
>> > FLAT_FLAG_GOTPIC set, which is unconditionally set by elf2flt if the
>> > supplied ELF binary had the symbol _GLOBAL_OFFSET_TABLE_ defined, therefore
>> > ELF binaries without a .got input section should remain unaffected.
>> > 
>> > Tested on RISC-V Canaan Kendryte K210 and RISC-V QEMU nommu_virt_defconfig.
>> > 
>> > [1] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/elfnn-riscv.c;hb=binutils-2_38#l3275
>> > [2] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/elfxx-tilegx.c;hb=binutils-2_38#l4023
>> > [3] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/elf32-tilepro.c;hb=binutils-2_38#l3633
>> > [4] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/elfnn-loongarch.c;hb=binutils-2_38#l2978
>> > 
>> > Cc: <stable@vger.kernel.org>
>> > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
>> > ---
>> > RISC-V elf2flt patches are still not merged, they can be found here:
>> > https://github.com/floatious/elf2flt/tree/riscv
>> > 
>> > buildroot branch for k210 nommu (including this patch and elf2flt patches):
>> > https://github.com/floatious/buildroot/tree/k210-v14
>> > 
>> >  fs/binfmt_flat.c | 11 ++++++++++-
>> >  1 file changed, 10 insertions(+), 1 deletion(-)
>> > 
>> > diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
>> > index 626898150011..b80009e6392e 100644
>> > --- a/fs/binfmt_flat.c
>> > +++ b/fs/binfmt_flat.c
>> > @@ -793,8 +793,17 @@ static int load_flat_file(struct linux_binprm *bprm,
>> >  			u32 addr, rp_val;
>> >  			if (get_user(rp_val, rp))
>> >  				return -EFAULT;
>> > -			if (rp_val == 0xffffffff)
>> > +			/*
>> > +			 * The first word in the GOTPLT header is -1 on certain
>> > +			 * architechtures. (On 64-bit, that is two u32 entries.)
>> > +			 * Ignore these entries, so that we stop relocating GOT
>> > +			 * entries first when we encounter the -1 after the GOT.
>> > +			 */
>> 
>> 		/*
>> 		 * The first word in the GOTPLT header is -1 on certain
>> 		 * architectures (on 64-bit, that is two u32 entries).
>> 		 * Ignore these entries so that we stop relocating GOT
>> 		 * entries when we encounter the first -1 entry after
>> 		 * the GOTPLT header.
>> 		 */
>
> Sure, I can update the comment when I send a v2.
>
>> 
>> > +			if (rp_val == 0xffffffff) {
>> > +				if (rp - (u32 __user *)datapos < 2)
>> > +					continue;
>> 
>> Would it be safer to check that the following rp_val is also -1 ? Also,
>> does this work with 32-bits arch ? Shouldn't the "< 2" be "< 1" for
>> 32-bits arch ?
>
> I think that checking that the previous entry is also -1 will not work,
> as it will just be a single entry for 32-bit.
> And I don't see the need to complicate this logic by having a 64-bit
> and a 32-bit version of the check.

Handling 64bit in this binfmt_flat appears wrong.  The code is
aggressively 32bit, and in at least some places does not have fields
large enough to handle a 64bit address.  I expect it would take
a significant rewrite to support 64bit.


I think it would be better all-around if instead of applying the
adjustment in the loop, there was a test before the loop.

Something like:

static inline u32 __user *skip_got_header(u32 __user *rp)
{
	if (IS_ENABLED(CONFIG_RISCV)) {
	        /* RISCV has a 2 word GOT PLT header */
		u32 rp_val;
		if (get_user(rp_val, rp) == 0) {
        		if (rp_val == 0xffffffff)
                		rp += 2;
		}
        }
	return rp;
}

....

	if (flags & FLAT_FLAG_GOTPIC) {
		rp = skip_got_header((u32 * __user) datapos);
		for (; ; rp++) {
			u32 addr, rp_val;
			if (get_user(rp_val, rp))
				return -EFAULT;
			if (rp_val == 0xffffffff)
				break;
			if (rp_val) {


Alternately if nothing in the binary uses the header it would probably
be a good idea for elf2flt to simply remove the header.

> The whole GOT (.got.plt + .got) will be more than two words anyway, if
> there is a GOT (i.e. if flag FLAT_FLAG_GOTPIC is set in the bFLT binary),
> so the "end of GOT"/LONG(-1) will always come way after these first two
> entries anyway.
>
> Another reason why I don't fancy a 64-bit and 32-bit version is because
> some architectures might be 64-bit, but I assume that they can be running
> a 32-bit userland. (And in comparison with the ELF header that tells if
> the binary is 32-bit or 64-bit, I don't see something similar in the bFLT
> header.)

Looking at the references you have given the only active architecture
supporting this header is riscv.  So I think it would be good
documentation to have the functionality conditional upon RISCV.

There is the very strange thing I see happening in the code.
Looking at the ordinary relocation code it appears that if
FLAT_FLAG_GOTPIC is set that first the address to relocate
is computed, then the address to relocate is read converted
from big endian to native endian (little endian on riscv?)
adjusted and written back.

Does elf2flt really change all of these values to big-endian on
little-endian platforms?


Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
