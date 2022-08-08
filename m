Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E897AC00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 15:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:Mime-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/V4xDDN5H7kOd6LlVEXyU8uiyAXAmVZIo46gKhGFyTU=; b=SmbOYz/j544+Dt
	RXUAJ630F6WG34dkMSdl924MZfK4JC0o3IwMz16qUBa2b2C7Y77ECtrEuw93meuNR8xdygqVeWwlq
	TiIJT/TufCMpt1pgfdyzZ4jZypMfNIAoZ02ZYHMMO4Xjet/sQkY2Fos1ZxZNGk3Gj3JN7HiVUgKkg
	PYE1+HZLVYf1LOrVDmhhjrurTqGofe+sdTOxb1oeG3867LqD5tVVPai61cqRQ1U5S4Yr0MVK0IXXR
	MUvyfVQxi2FHs5+H9E54jw4BO8Q2pUFICR/E0ZAndshCJwzhR7evpMD38lfoAF46VlRK9P7z4dC/b
	RAZjg/vcNVNN2aQ2rzOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL4Hw-00EZ7c-3k; Mon, 08 Aug 2022 15:03:28 +0000
Received: from mail-sender.a4lg.com ([153.120.152.154] helo=mail-sender-0.a4lg.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL4Hs-00EZ57-Eo
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 15:03:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 18B2A300089;
	Mon,  8 Aug 2022 15:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
	s=2017s01; t=1659970994;
	bh=DgSyfOgUNFubFDCGFCAz4VdWSvv8D4vLl+5Gq2B4Td4=;
	h=Message-ID:Date:Mime-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=fwmhxYd6TGpchqoh5EXeU8H/iKS6grmwSQJK58A7ns40Nq/S6IOzosaOGL4+MOArt
	 g9UZYrqOSP8POiClzPMr3MxbVdACf4Mr03YFPu+VtrEEE26lZQf3Dol6D32njOedSs
	 fX2dIw/wHUW9DMbj5qsxkOaKG9ae9gzAyKH8xIfk=
Message-ID: <0f453024-1d1e-105d-855b-234c3c8fedbb@irq.a4lg.com>
Date: Tue, 9 Aug 2022 00:03:12 +0900
Mime-Version: 1.0
Subject: Re: [PATCH 1/5] target/riscv: Ignore the S and U letters when
 formatting ISA strings
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>
References: <20220805155405.1504081-1-mail@conchuod.ie>
 <20220805155405.1504081-2-mail@conchuod.ie>
From: Tsukasa OI <research_trasio@irq.a4lg.com>
In-Reply-To: <20220805155405.1504081-2-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_080325_098226_5A001B73 
X-CRM114-Status: GOOD (  20.57  )
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

On 2022/08/06 0:54, Conor Dooley wrote:
> From: Palmer Dabbelt <palmer@sifive.com>
> 
> The ISA strings we're providing from QEMU aren't actually legal RISC-V
> ISA strings, as both S and U cannot exist as single-letter extensions
> and must instead be multi-letter strings.  We're still using the ISA
> strings inside QEMU to track the availiable extensions, so just strip
> out the S and U extensions when formatting ISA strings.
> 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> [Conor: rebased on 7.1.0-rc1 & slightly tweaked the commit message]
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  target/riscv/cpu.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ac6f82ebd0..95fdc03b3d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1122,7 +1122,23 @@ char *riscv_isa_string(RISCVCPU *cpu)
>      char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
>      for (i = 0; i < sizeof(riscv_single_letter_exts) - 1; i++) {
>          if (cpu->env.misa_ext & RV(riscv_single_letter_exts[i])) {
> -            *p++ = qemu_tolower(riscv_single_letter_exts[i]);
> +            char lower = qemu_tolower(riscv_single_letter_exts[i]);
> +            switch (lower) {
> +                case 's':
> +                case 'u':
> +                    /*
> +                    * The 's' and 'u' letters shouldn't show up in ISA strings as
> +                    * they're not extensions, but they should show up in MISA.
> +                    * Since we use these letters interally as a pseudo ISA string
> +                    * to set MISA it's easier to just strip them out when
> +                    * formatting the ISA string.
> +                    */
> +                    break;
> +
> +                default:
> +                    *p++ = lower;
> +                    break;
> +            }
>          }
>      }
>      *p = '\0';

I agree with Alistair.  **I** removed 'S' and 'U' from the ISA string
and it should be working in the latest development branch (I tested).

I tested it on master and QEMU 7.1-rc1 (tag: v7.1-rc1).

Example:
/opt/riscv/bin/qemu-system-riscv64
         -machine virt
         -nographic
         -cpu rv64
         -smp 1
         -kernel images/linux.bin
         -initrd images/busybox.cpio.gz
         -append 'console=hvc0 earlycon=sbi'
         -bios images/opensbi-fw_jump.elf
         -gdb tcp::9000

Replacing -machine virt with -machine virt,dumpdtb=sample.dtb dumps the
binary DeviceTree as sample.dtb and generated CPU-related parts like...

                cpu@0 {
                        phandle = <0x01>;
                        device_type = "cpu";
                        reg = <0x00>;
                        status = "okay";
                        compatible = "riscv";
                        riscv,isa =
"rv64imafdch_zicsr_zifencei_zba_zbb_zbc_zbs";
                        mmu-type = "riscv,sv48";

                        interrupt-controller {
                                #interrupt-cells = <0x01>;
                                interrupt-controller;
                                compatible = "riscv,cpu-intc";
                                phandle = <0x02>;
                        };
                };

Besides, this function alone generates the ISA string for DTB and
there's no way such ISA strings with invalid 'S' and 'U' can be
generated.  It's definitely a behavior of QEMU 7.0 or before.

Please. Please make sure that you are testing the right version of QEMU.

Thanks,
Tsukasa

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
