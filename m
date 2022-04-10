Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D076FC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Apr 2022 08:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KC8eKH3IOzeuI+6D/Kkk1Y2paaLJj3DgMwQAuY2lII=; b=eSbvRgTxUtA27u
	wXWleGcJVc7cs25shBWiVEI9sokUHXFk+ZwtD7fCqH08lHMdx3GB6u2uOAuf5bxq5ykHDZ5ppeLf4
	Btv8PXSl9ctVcEHKP7jiagpvlw+zI5TE+NVWBeDQ/VVn89RiY6I/Eu3k/nUnTiL1/jYvV7rG5FO4C
	3AoFhKNe6b7o8m16ZfkPygxl1UFQcdWPCfxCFjT/JWxoAaepXo/iQWP4AcN7D8Be/z6Y/5dLkJeD3
	dpAHITISHFRulxd0QOzNC14QzpYUlrWVXfrouWkSiTZvX6DSeb3bdbwRtWk2cA//NXanlmAOXmaKa
	hYFURIJGkarXZ33Jbqqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndSYe-004RbZ-Jc; Sun, 10 Apr 2022 08:04:28 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndSYb-004Raa-Df
 for linux-riscv@lists.infradead.org; Sun, 10 Apr 2022 08:04:27 +0000
Received: by mail-ot1-x329.google.com with SMTP id
 c24-20020a9d6c98000000b005e6b7c0a8a8so5751778otr.2
 for <linux-riscv@lists.infradead.org>; Sun, 10 Apr 2022 01:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=vS2s2qRevra2XEsFF3mSNB6jYFDG6iqb3Cu6xK44T5w=;
 b=Li9YdVUVqp0sNmfxs6nv4NNpyPzm8bGG/the7OIBqSo1JGcFhZWoNFg9lf2ROaUmFi
 3mz05iZGfTWperb7Ok/G4OK9Ta/MhLswL1/6cA9xfrjAiXQwyzL8uB0o2QLaHor3WpFW
 7QBD++pHwAqwowvS0S36bjTfpsEQM4FXy0orqj/kkVHDBp8MnKKBxu+LVw5CqSpMycIW
 Xmgn6R7fNGbYF7Z/l4lwQrOU/pHlj5sdVZkdHwOiYzW2BYYPymXAnCOqVUOE6H5zWas4
 pqA1iJ1wvsJUMu+4HhWhypqAG9jkVLeTyoJGlmI2j6WnXayocEjqm1bpyX7E3prjbrAW
 Z+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=vS2s2qRevra2XEsFF3mSNB6jYFDG6iqb3Cu6xK44T5w=;
 b=M95nJdluIKtgwv50+fpRVuZThDShloxZR3nQSqv9A9xq/n4vHktBq65q9opWlurpvE
 tI2RB+vmTEvlGU9amYICGm3ZYHtRjjXYqHL9/bPpxU6Y0SdCQ1I0WGkLqcjGNDWKL5Qx
 njlIcK8/eHwcWdXV+owkZqNdfa/+OqUHPLxpRP8Ds/Xt3fWYX8SpvgqaX+ZqVrW2S8HW
 MWsm5A5rCWvi27q6v2YYzc3O+rG/qKbsb4hS4ZaKJYbsxW2BIMhMEPSWCPOaeTed5Z6K
 9LyqQLNLSQ2Gxps5psKadLcPLe0QfLesQ8I3SWHT4wA6jL6QeWk/Pf2wv59Atv25//6x
 88tA==
X-Gm-Message-State: AOAM533aJg+xuPWZKu1WLg3bBRGgGfomT3Ph2bwT1WQyHVQYhfjL2nfv
 bRiwgDDAPnFSMhH8aGMbltYCwQ==
X-Google-Smtp-Source: ABdhPJwuUsxhMJlcTXCsTWUNi3Ca75DoosL6uhnW6f+xEXD95nBE4QwZrKmWdAfMv/HsKALTxrW2Aw==
X-Received: by 2002:a05:6830:82a:b0:5b2:36d5:1603 with SMTP id
 t10-20020a056830082a00b005b236d51603mr9400402ots.240.1649577864303; 
 Sun, 10 Apr 2022 01:04:24 -0700 (PDT)
Received: from [192.168.224.179] ([172.58.198.202])
 by smtp.gmail.com with ESMTPSA id
 lh22-20020a0568700b1600b000e2ba035051sm762425oab.58.2022.04.10.01.04.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 01:04:23 -0700 (PDT)
Message-ID: <130c8036-208c-2f6b-999c-31b2e507ecb5@landley.net>
Date: Sun, 10 Apr 2022 03:08:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PULL] remove arch/h8300
Content-Language: en-US
From: Rob Landley <rob@landley.net>
To: Greg Ungerer <gerg@linux-m68k.org>, Finn Thain <fthain@linux-m68k.org>
Cc: Daniel Palmer <daniel@0x0f.com>, Arnd Bergmann <arnd@arndb.de>,
 Christoph Hellwig <hch@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 "moderated list:H8/300 ARCHITECTURE"
 <uclinux-h8-devel@lists.sourceforge.jp>,
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Linux-sh list <linux-sh@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <6a38e8b8-7ccc-afba-6826-cb6e4f92af83@linux-m68k.org>
 <CAFr9PXkk=8HOxPwVvFRzqHZteRREWxSOOcdjrcOPe0d=9AW2yQ@mail.gmail.com>
 <5b7687d4-8ba5-ad79-8a74-33fc2496a3db@linux-m68k.org>
 <8f9be869-7244-d92a-4683-f9c53da97755@landley.net>
 <3d5cf48c-94f1-2948-1683-4a2a87f4c697@linux-m68k.org>
 <147dc6cc-1fbb-558f-8e6d-29d4327d54b4@linux-m68k.org>
 <ae4125f5-e725-43ed-d05b-b1f88c0cd50c@landley.net>
In-Reply-To: <ae4125f5-e725-43ed-d05b-b1f88c0cd50c@landley.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_010425_570155_317D7EFD 
X-CRM114-Status: GOOD (  14.93  )
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

On 4/10/22 02:26, Rob Landley wrote:
>> FWIW this will do it:
>> 
>>      qemu-system-m68k -nographic -machine mcf5208evb -kernel vmlinux
>> 
>> That will boot an m5208evb_defconfig generated vmlinux.
>> But you will need a user space to get a full boot to login/shell.
> 
> No FDPIC support. :(

First stab at switching on CONFIG_BINFMT_FDPIC in the coldfire config and adding
enough stuff to shut up the compiler. Maybe it'll let me load a PIE binary?
Dunno yet, but it compiled a vmlinux that booted to the same panic as the
previous one because I haven't fed it an initramfs yet...

I also had to disable CONFIG_ELF_CORE or else the link died with:

m68k-linux-musl-ld: fs/binfmt_elf_fdpic.o: in function `elf_dump_thread_status':
binfmt_elf_fdpic.c:(.text+0x18): undefined reference to `task_user_regset_view'
make: *** [Makefile:1155: vmlinux] Error 1

But when I did THAT it compiled. :)

diff --git a/arch/m68k/include/asm/elf.h b/arch/m68k/include/asm/elf.h
index 3d387ceaea3f..bcb072396640 100644
--- a/arch/m68k/include/asm/elf.h
+++ b/arch/m68k/include/asm/elf.h
@@ -114,4 +114,6 @@ typedef struct user_m68kfp_struct elf_fpregset_t;

 #define ELF_PLATFORM  (NULL)

+#define ELF_FDPIC_CORE_EFLAGS 0
+
 #endif
diff --git a/arch/m68k/include/asm/mmu.h b/arch/m68k/include/asm/mmu.h
index 5c15aacb1370..6f6d83b731ed 100644
--- a/arch/m68k/include/asm/mmu.h
+++ b/arch/m68k/include/asm/mmu.h
@@ -8,6 +8,10 @@ typedef unsigned long mm_context_t;
 #else
 typedef struct {
 	unsigned long		end_brk;
+#ifdef CONFIG_BINFMT_ELF_FDPIC
+        unsigned long           exec_fdpic_loadmap;
+        unsigned long           interp_fdpic_loadmap;
+#endif
 } mm_context_t;
 #endif

diff --git a/arch/m68k/include/uapi/asm/ptrace.h
b/arch/m68k/include/uapi/asm/ptrace.h
index 19a1b9d0d858..869601381f30 100644
--- a/arch/m68k/include/uapi/asm/ptrace.h
+++ b/arch/m68k/include/uapi/asm/ptrace.h
@@ -71,6 +71,10 @@ struct switch_stack {
 #define PTRACE_SETREGS            13
 #define PTRACE_GETFPREGS          14
 #define PTRACE_SETFPREGS          15
+#define PTRACE_GETFDPIC           31
+
+#define PTRACE_GETFDPIC_EXEC      0
+#define PTRACE_GETFDPIC_INTERP    1

 #define PTRACE_GET_THREAD_AREA    25

diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
index 4d5ae61580aa..073360aa982c 100644
--- a/fs/Kconfig.binfmt
+++ b/fs/Kconfig.binfmt
@@ -45,7 +45,7 @@ config ARCH_USE_GNU_PROPERTY
 config BINFMT_ELF_FDPIC
 	bool "Kernel support for FDPIC ELF binaries"
 	default y if !BINFMT_ELF
-	depends on (ARM || (SUPERH && !MMU))
+	depends on (ARM || (SUPERH && !MMU) || M68K)
 	select ELFCORE
 	help
 	  ELF FDPIC binaries are based on ELF, but allow the individual load



Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
