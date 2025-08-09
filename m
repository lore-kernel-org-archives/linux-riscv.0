Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F88EC87FCB
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Aug 2025 03:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3OrkdKyHetaEcPKwMWFOdJ72xMEzXYN+s/00hU70l0Y=; b=g+0BAPJGR7xDCw
	6kiIHPK+vHJead37GV3GVcyXL5FYtzhKxXDztpT4bPAWo+/2syCqCyf1mC+aQH5KUOm7lLF1KnfJX
	X8o0kQYV5qRZE2/JeB7ZPy2FDhr2vWpaLRLP52AUgJITxbEa8nMkQi0S5lydcnlG5yF3HQ333DX/y
	skhe/+2WR+g5aizrgUcZ7N9pbpwMPegofFaddGwENXaFNgF79XaXdoOOdxk1dDCNvN18H46wo1tGD
	FOKE/uslL3KoBqT/XFphzpyliV8hmbq9Lk/ym9LJZsEiSqjIjM237iB9f0BUlhYoDbI/ngDFNc7Gy
	4iWHnfvM2h9KCUs/wrcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukajE-0000000440g-2nse;
	Sat, 09 Aug 2025 03:58:44 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukajA-000000043yI-12Ek
	for linux-riscv@lists.infradead.org;
	Sat, 09 Aug 2025 03:58:42 +0000
Received: from [10.97.0.146] (unknown [39.144.108.158])
	by APP-03 (Coremail) with SMTP id rQCowADHWnxgx5ZorpeACg--.36779S2;
	Sat, 09 Aug 2025 11:58:30 +0800 (CST)
Message-ID: <e4d21516-23b5-404b-a7da-cf6ebfd02dbc@iscas.ac.cn>
Date: Sat, 9 Aug 2025 11:58:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: Add sysctl to control discard of vstate during
 syscall
To: Drew Fustini <fustini@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Samuel Holland <samuel.holland@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Andy Chiu <andybnac@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
References: <20250806-riscv_v_vstate_discard-v2-1-6bfd61b2c23b@kernel.org>
 <aJXvWuPKIc2lCSX3@localhost.localdomain>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <aJXvWuPKIc2lCSX3@localhost.localdomain>
X-CM-TRANSID: rQCowADHWnxgx5ZorpeACg--.36779S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGFy3tr17tw18AFWxJr4UCFg_yoW5ZF47pF
	Z3Ars3Krn8Zw1fZ3sFqw4UWrWxGas3Gw15Wr15K3y8uFZ8ur9akFn5K3WrGFykJr98CrW0
	qwn5Wa48Zw4UAFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU56yI5UUUUU==
X-Originating-IP: [39.144.108.158]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_205840_653914_2B5441CF 
X-CRM114-Status: GOOD (  14.33  )
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

My previous comment on v1 on prefering clobbering with VS = Initial
handling aside...

On 8/8/25 20:36, Darius Rad wrote:
> On Wed, Aug 06, 2025 at 07:03:28AM -0700, Drew Fustini wrote:
> [...]
>> diff --git a/Documentation/arch/riscv/vector.rst b/Documentation/arch/riscv/vector.rst
>> index 3987f5f76a9deb0824e53a72df4c3bf90ac2bee1..b702c00351617165a4d8897c7df68eadcd2d562e 100644
>> --- a/Documentation/arch/riscv/vector.rst
>> +++ b/Documentation/arch/riscv/vector.rst
>> @@ -134,7 +134,25 @@ processes in form of sysctl knob:
>>  3.  Vector Register State Across System Calls
>>  ---------------------------------------------
>>  
>> -As indicated by version 1.0 of the V extension [1], vector registers are
>> -clobbered by system calls.
>> +Linux adopts the syscall ABI proposed by version 1.0 of the V extension [1],
>> +where vector registers are clobbered by system calls. Specifically:
>> +
>> +    Executing a system call causes all caller-saved vector registers
>> +    (v0-v31, vl, vtype) and vstart to become unspecied.
>> +
> Perhaps:
>
> Clobbering the vector registers may prevent leaking information to user

No... Not clobbering does not "leak" anything. If you find that it leaks
information, please report - that's a bug.

> space and aid in debugging, but can significantly increase system call
> latency for some implementations.  [...]
>
>> +However, clobbering the vector registers can significantly increase system call
>> +latency for some implementations. To mitigate this performance impact, a sysctl
>> +knob is provided that controls whether vector state is always discarded in the
>> +syscall path:
>> +
>> +* /proc/sys/abi/riscv_v_vstate_discard
>> +
>> +    Valid values are:
>> +
>> +    * 0: Vector state is not always clobbered in all syscalls
>> +    * 1: Mandatory clobbering of vector state in all syscalls
>> +
>> +    Reading this file returns the current discard behavior. The initial state is
>> +    controlled by CONFIG_RISCV_ISA_V_VSTATE_DISCARD.
>>  
>>  1: https://github.com/riscv/riscv-v-spec/blob/master/calling-convention.adoc
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 36061f4732b7496a9c68a9a10f9959849dc2a95c..7bb8a8513135cbc105bd94d273012486a886f724 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -656,6 +656,16 @@ config RISCV_ISA_V_DEFAULT_ENABLE
>>  
>>  	  If you don't know what to do here, say Y.
>>  
>> +config RISCV_ISA_V_VSTATE_DISCARD
>> +	bool "Enable Vector state discard by default"
>> +	depends on RISCV_ISA_V
>> +	default n
>> +	help
> Perhaps add the following paragraph:
>
> Discarding vector state is more robust, but has negative performance
> implications in certain implementations.

"Robust" is too vague... I don't think this word is helpful for anyone
trying to understand what this does.

Vivian "dramforever" Wang

>
>> +	  Say Y here if you want to always discard vector state in syscalls.
>> +	  Otherwise, userspace has to enable it via the sysctl interface.
>> +
>> +	  If you don't know what to do here, say N.
>> +
>>  config RISCV_ISA_V_UCOPY_THRESHOLD
>>  	int "Threshold size for vectorized user copies"
>>  	depends on RISCV_ISA_V


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
