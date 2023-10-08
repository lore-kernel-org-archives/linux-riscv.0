Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70AAE95A82
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Oct 2023 09:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9DQfWN8AQiWYGbrfWGlg4E7xWmqsAiALWMYLhGBFga4=; b=JjNSn8cTvfOBru
	TmboQx6wo/HnSU4WwY+Y6Ddxq1FKl1dkZ8dUuWpZHVhFUm0tLZr3VMMNqA/grpqTFB/BDaNVpvDmz
	ntCyJZr5cVO7yhRjYWO2UovpvxWFv7YmZYmsn1eSBdin+E/Du/mMo25cF9JrFeIedsuW3kyCIJn2J
	OXNpCmBa10Z+ZI0PY3HYj2JvQm75mtcsPJ6qVTLB6iOHg7gFowL3UzuBKfqK5vVVzZLMlImVqTAMD
	LEjxovgGJDmlQWfnLWJiZnXQ1SXZ8jcldnt3jJZeKOe1jMRlCIjbv0x+we4qShtJ8IK7tO3qIBKIk
	YW4BQIjqN8XZYWIbBEJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpPx9-008ZwN-0w;
	Sun, 08 Oct 2023 09:19:59 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpPx6-008Zvj-1B;
	Sun, 08 Oct 2023 09:19:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=yfP3gGX1yyUl5QHESaZJyn6UY8zszLp7eG3TpVZ56ls=; b=R7/jzwi3LuXJ5LJ7c9HRnnLXZM
	2R3sfTlozkNouwmvSq6uFZ47jk+zybr3DUti0lF9tzJ1tvFRNg1ezjLn/FiU2Ms6433pRlmaoD9Kz
	C7SeQ9JkOV4ZnOSVgj94PMjlS+cdPI7c5VoQMMFDiCuJzDz9JjbQyOIM9qmP6g8yVLEw6ornKl9MB
	FfscDUv6r7IIl8TBoT62NDFsTEINHy89CBFMoAhxfv0jcM/m6cC8xecIMF+ah2bPU+40PEEYt2Z6V
	94zSqOexb/LZ3jbJ/DJN5m/K4BwYuAtW75FS8Y/JngLq5sKZoIH7efLF9Ai+FAcnp3s2eWKaO6npv
	LaKtsfSQ==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1qpPwq-00Cdwi-NE; Sun, 08 Oct 2023 11:19:40 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.97-RC0)
	(envelope-from <aurelien@aurel32.net>)
	id 1qpPwp-00000007FeR-43ro;
	Sun, 08 Oct 2023 11:19:39 +0200
Date: Sun, 8 Oct 2023 11:19:39 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Rob Herring <robh@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Wenting Zhang <zephray@outlook.com>, Guo Ren <guoren@kernel.org>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH -next v21 14/27] riscv: signal: Add sigcontext
 save/restore for vector
Message-ID: <ZSJ0K5JFrglyJY8o@aurel32.net>
Mail-Followup-To: Andy Chiu <andy.chiu@sifive.com>,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Rob Herring <robh@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Wenting Zhang <zephray@outlook.com>, Guo Ren <guoren@kernel.org>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Al Viro <viro@zeniv.linux.org.uk>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
 <20230605110724.21391-15-andy.chiu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230605110724.21391-15-andy.chiu@sifive.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_021956_843958_B0FCE447 
X-CRM114-Status: GOOD (  18.29  )
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

Hi,

On 2023-06-05 11:07, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> This patch facilitates the existing fp-reserved words for placement of
> the first extension's context header on the user's sigframe. A context
> header consists of a distinct magic word and the size, including the
> header itself, of an extension on the stack. Then, the frame is followed
> by the context of that extension, and then a header + context body for
> another extension if exists. If there is no more extension to come, then
> the frame must be ended with a null context header. A special case is
> rv64gc, where the kernel support no extensions requiring to expose
> additional regfile to the user. In such case the kernel would place the
> null context header right after the first reserved word of
> __riscv_q_ext_state when saving sigframe. And the kernel would check if
> all reserved words are zeros when a signal handler returns.
> 
> __riscv_q_ext_state---->|	|<-__riscv_extra_ext_header
> 			~	~
> 	.reserved[0]--->|0	|<-	.reserved
> 		<-------|magic	|<-	.hdr
> 		|	|size	|_______ end of sc_fpregs
> 		|	|ext-bdy|
> 		|	~	~
> 	+)size	------->|magic	|<- another context header
> 			|size	|
> 			|ext-bdy|
> 			~	~
> 			|magic:0|<- null context header
> 			|size:0	|
> 
> The vector registers will be saved in datap pointer. The datap pointer
> will be allocated dynamically when the task needs in kernel space. On
> the other hand, datap pointer on the sigframe will be set right after
> the __riscv_v_ext_state data structure.

It appears that this patch somehow breaks userland, at least the rust
compiler. This can be observed for instance by building the rust-lsd
package in Debian, but many other rust packages are also affected:

* Failed build with kernel 6.5.3:
  https://buildd.debian.org/status/fetch.php?pkg=rust-lsd&arch=riscv64&ver=0.23.1-7%2Bb1&stamp=1696475386&raw=0

* Successful build with kernel 6.4.13:
  https://buildd.debian.org/status/fetch.php?pkg=rust-lsd&arch=riscv64&ver=0.23.1-7%2Bb1&stamp=1696491025&raw=0

It happens on hardware which does not have the V extension (in the above
case on a Hifive Unmatched board). This can also be reproduced in a QEMU
VM. Unfortunately disabling CONFIG_RISCV_ISA_V does not workaround the
issue.

It is not clear to me if it is a kernel issue or a wrong assumption on
the rust side. Any hint on how to continue investigating?

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
