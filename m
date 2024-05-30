Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC069C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 03:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hnBOrXWbiraDavW/o9zM6zb+8+gNUm6dzRbzMcxBgQs=; b=M9DAme5GJcUgmt
	mIIs94SfpTkwjKgIaOM1+nyaxb0uL7L3bSOkW3YNoJhDq2pcROxeoepZyIAUIBW7bO7Hbdp4d8xYB
	T7Tp6676R3CB4usUBoSqq+BQodokndM/vnHx8A5p5LEm4cWfYmPeEyuJUdCqn+oIuvAdKAb4BY2sh
	hJVu5936v675tSThNWc+9V2q2y/yUhf2O9cUaUX6oLPzhNBf3VUwG/8yAZpylpju7Fo9zk0vlcB52
	C6wQYr4EfW+gsgq7MdxDWzTHHzrkksZJeyDoHoWLUcTzqngOf/PIbD36l67Eahd9S81Rcmjhj9o4X
	kfEN6s8nmVdLTfNGBuNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCWbZ-00000006CqP-0q28;
	Thu, 30 May 2024 03:37:29 +0000
Received: from out162-62-58-216.mail.qq.com ([162.62.58.216])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCWbS-00000006Cpb-1gFc
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 03:37:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1717040224; bh=W+5Ks2nSljVj8pYcDqby5hGNu9Ghhwrfc6A07R0SAhQ=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=qLiWi4KWBuioBlXm/K0GO0a7XBB/p9QK4eXqc3lqfyPh5u2y+SgbV2ihyw87rHKAG
	 yc7jrUnd5LJkBjGCNnjUygO9z95v0GuhayGEXm+AY61oqwWoUEBS6BMr1mjjNwkIP8
	 bP1x/qMzBJFQuIk08uaytOzKkpklDhzUvSCPFlvk=
Received: from smtpclient.apple ([2408:8207:18a0:162f:64ab:dad6:af9f:27b2])
	by newxmesmtplogicsvrsza15-1.qq.com (NewEsmtp) with SMTP
	id 93BB5C3A; Thu, 30 May 2024 11:36:59 +0800
X-QQ-mid: xmsmtpt1717040219t0woo2fy3
Message-ID: <tencent_C5BBD6F106D73F662084BD91904F54504805@qq.com>
X-QQ-XMAILINFO: M79JLxWTMB1h2KmKdGdTSvzFCeQgQlHjNQ+9jX7TiUQ/waSoCje4RE7QVI5LyL
	 6+gfl1aJiH2luTL0EegevsOBf2YN64de+BAHGvNykYNmxYgYEss0DiRcvo1MyBxz7r/10zUbHyF5
	 FYPT1igb/Bk3U8TfJp2gCgQ/lvofOwh95DU3U1sn0nrUDPqKdxqytJZ++u5QdS6+jhz0M4tw5cgN
	 Z8eeRlHmo7DB8owyGW8jmymZ24mJJEbVKb9wCsI7ttIz1FKhVmDhUw5e1opLaaNx+IKenwTtmLDD
	 TCiwPAK+3ZyW/3vpvd9WjbfkrkN7YMQrV1PCto48y77kUWTGhup/l14fVX9XBzo0mYuygO5iZng5
	 JmdbFB1+OTodbJdxWjoJv0NKPv4xtCMYiDt8Pd4iEquB3zYphMiQtNWQcpqTcmNV5n5I2S5lyzLQ
	 rR+iNYsU5ge5y4LI/5JMNyDROpeeozN9FvaT6nGinTwycdU+T+aURcfoLzkZyJZLyQziOIqZUVoN
	 fNP13btjlBNhwVWkYyZSvkSO9+ko1p4m4QLGXj7EnvAa26Li8tuEYlt8ArRZ5/UZRWvUv43SSvTu
	 gAsARXT8u+Ib9qLHj2Io4vbYaovuZDtcUDxv02JTDkM6aNxh0ESQ+rxn+IqSV2Dlnw4XwLb9ljjF
	 aClPDHiHZQeSgQEvjR3Byxur/miE8BNPrwJLaYzRutNxWeyDstqsX2hXnFMgvxqKTzCDgHgyxiip
	 k15o/bG0cSX6nZwbp1f5chwTueYg38QQhJwylmwPSzOGFWwA2OC5js0p7n+086cDUt3ewhDaI86M
	 HPKjbhWomC0jsIXVPRBUlWGM43sOxr7Z/m/z2BoctKg9d3jl/rERFcGce+IaJBqv6Wuu/h9yTkgr
	 N55Tno5FGxS2dji2DW0gN9ku0CyG0yCTT1iPEDB3gqAciSAYf7zeLTETE3NFhMP0aadGLDg84f1R
	 iCvl37TOKehlKEbFmJVx6MxdtjuP6UscReRyd1uvJoWJsqUbBCJGGFxMI8dQHv
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH] RISC-V: hwprobe: Add MISALIGNED_PERF key
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <20240529182649.2635123-1-evan@rivosinc.com>
Date: Thu, 30 May 2024 11:36:45 +0800
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Jones <ajones@ventanamicro.com>,
 Andy Chiu <andy.chiu@sifive.com>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Costa Shulyupin <costa.shul@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
X-OQ-MSGID: <4AAEA79D-BC7A-43A1-BD4E-B8CE355DEC0D@cyyself.name>
References: <20240529182649.2635123-1-evan@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_203726_511693_F2326CF4 
X-CRM114-Status: GOOD (  34.29  )
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

On 2024/5/30 02:26, Evan Green wrote:
> RISCV_HWPROBE_KEY_CPUPERF_0 was mistakenly flagged as a bitmask in
> hwprobe_key_is_bitmask(), when in reality it was an enum value. This
> causes problems when used in conjunction with RISCV_HWPROBE_WHICH_CPUS,
> since SLOW, FAST, and EMULATED have values whose bits overlap with
> each other. If the caller asked for the set of CPUs that was SLOW or
> EMULATED, the returned set would also include CPUs that were FAST.
> 
> Introduce a new hwprobe key, RISCV_HWPROBE_KEY_MISALIGNED_PERF, which
> returns the same values in response to a direct query (with no flags),
> but is properly handled as an enumerated value. As a result, SLOW,
> FAST, and EMULATED are all correctly treated as distinct values under
> the new key when queried with the WHICH_CPUS flag.
> 
> Leave the old key in place to avoid disturbing applications which may
> have already come to rely on the broken behavior.
> 
> Fixes: e178bf146e4b ("RISC-V: hwprobe: Introduce which-cpus flag")
> Signed-off-by: Evan Green <evan@rivosinc.com>
> 
> ---
> 
> 
> Note: Yangyu also has a fix out for this issue at [1]. That fix is much
> tidier, but comes with the slight risk that some very broken userspace
> application may break now that FAST cpus are not included for the query
> of which cpus are SLOW or EMULATED.

Indeed. Since the value of FAST is 0b11, the SLOW and EMULATED are 0b10 and
0b01 respectively.

When this key is treated as a bitmask and query with
RISCV_HWPROBE_WHICH_CPUS if a CPU has a superset bitmask of the requested
value on the requested key, it will remain in the CPU mask. Otherwise, the
CPU will be clear in the CPU mask. But when a key is treated as a value, we
will just do a comparison. if it is not equal, then the CPU will be clear
in the CPU. That's why FAST cpus are included when querying with SLOW or
EMULATED with RISCV_HWPROBE_KEY_CPUPERF_0 key now.

For me, deprecating the original hwprobe key and introducing a new key
would be a better solution than changing the behavior as my patch did.

> I wanted to get this fix out so that
> we have both as options, and can discuss. These fixes are mutually
> exclusive, don't take both.

It's better to note this strange behavior on
Documentation/arch/riscv/hwprobe.rst so users can quickly understand the
differences on the behavior of these two keys.

The C code part looks good to me.

> 
> [1] https://lore.kernel.org/linux-riscv/tencent_01F8E0050FB4B11CC170C3639E43F41A1709@qq.com/
> 
> ---
> Documentation/arch/riscv/hwprobe.rst | 8 ++++++--
> arch/riscv/include/asm/hwprobe.h | 2 +-
> arch/riscv/include/uapi/asm/hwprobe.h | 1 +
> arch/riscv/kernel/sys_hwprobe.c | 1 +
> 4 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index 204cd4433af5..616ee372adaf 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -192,8 +192,12 @@ The following keys are defined:
> supported as defined in the RISC-V ISA manual starting from commit
> d8ab5c78c207 ("Zihintpause is ratified").
> 
> -* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
> - information about the selected set of processors.
> +* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated. Returns similar values to
> + :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_PERF`, but the key was mistakenly
> + classified as a bitmask rather than a value.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_PERF`: An enum value describing the
> + performance of misaligned scalar accesses on the selected set of processors.
> 
> * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
> accesses is unknown.
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> index 630507dff5ea..150a9877b0af 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,7 +8,7 @@
> 
> #include <uapi/asm/hwprobe.h>
> 
> -#define RISCV_HWPROBE_MAX_KEY 6
> +#define RISCV_HWPROBE_MAX_KEY 7
> 
> static inline bool riscv_hwprobe_key_is_valid(__s64 key)
> {
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index dda76a05420b..bc34e33fef23 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -68,6 +68,7 @@ struct riscv_hwprobe {
> #define RISCV_HWPROBE_MISALIGNED_UNSUPPORTED (4 << 0)
> #define RISCV_HWPROBE_MISALIGNED_MASK (7 << 0)
> #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE 6
> +#define RISCV_HWPROBE_KEY_MISALIGNED_PERF 7
> /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
> 
> /* Flags */
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 969ef3d59dbe..c8b7d57eb55e 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -208,6 +208,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
> break;
> 
> case RISCV_HWPROBE_KEY_CPUPERF_0:
> + case RISCV_HWPROBE_KEY_MISALIGNED_PERF:
> pair->value = hwprobe_misaligned(cpus);
> break;
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
