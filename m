Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F51C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 07:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ShrpOCrLp7D721h2/t3AN7WVEtStd0IDqnNOsQMApjc=; b=cE2ZlXOrgEV49j
	lb9NPLX2KlH0Hx30nl3Hbom+Z1IGSBsmrqET20LNhs0sAC1bWN4u35xamibu2EPTBFMJrHMlQCE5x
	TQfq9C8d1VnHSIfLYBuTsrQZxmtXri9dKju4milO/b/wGSRp2S8pKoTNz10GTuuLdGuDmhyXzn39f
	k0tDL5HeCvVZKutrlFuyXC1Vxc/pcKkmE59vKa9oDc8GSf1RZPveIK5CmrYTD9VIQ4JCqW8jjVG5R
	IzZzmrkBgZGi1has6enxqQPVcDVaEwN5OFxoI5HxJXUPcKi0QFz3LsbaUS8bwuVWyYL5tPSVpHtha
	Pn6L5xr6gxrZzUErbXvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1jGg-00Cfku-2k;
	Wed, 24 May 2023 07:50:46 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1jGd-00Cfj9-2c;
	Wed, 24 May 2023 07:50:45 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 647072243F;
	Wed, 24 May 2023 07:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1684914638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rvDxc996bWvS0b16mE9F71bfGKG1BiGQdYN+RnxVi20=;
	b=dRjX6YHdAr6Oz3bxNtuCewCuHWH/dKVcCRujoPkqOLdm1zrlK08Oqn/dSMqeGNcPwTpleV
	QZvcM/qUrTyxnwn1y6UXdkAXjsrmsD8LXwEvnGZ1zi/dGiBGp2gqHo0TtktBIIABWpI++Q
	lNHwWySaqT7J0jdn62RKGvrO8Yf8rmE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684914638;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rvDxc996bWvS0b16mE9F71bfGKG1BiGQdYN+RnxVi20=;
	b=fAYPQMGCH0hE9LJ7NAU43b9T50qoRGr/Aioe0Bz8GX130LN9gTmM9HcS0bN4aS+cmx4JwL
	VbPIv9dnK2fCM0Bg==
Received: from hawking.suse.de (unknown [10.168.4.11])
	by relay2.suse.de (Postfix) with ESMTP id D21882C141;
	Wed, 24 May 2023 07:50:36 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
	id 9B0444A03A8; Wed, 24 May 2023 09:50:36 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>,  "Andy Chiu"
 <andy.chiu@sifive.com>,  linux-riscv@lists.infradead.org,  "Anup Patel"
 <anup@brainfault.org>,  "Atish Patra" <atishp@atishpatra.org>,
  kvm-riscv@lists.infradead.org,  kvm@vger.kernel.org,  "Vineet Gupta"
 <vineetg@rivosinc.com>,  "Greentime Hu" <greentime.hu@sifive.com>,  "Guo
 Ren" <guoren@linux.alibaba.com>,  "Vincent Chen"
 <vincent.chen@sifive.com>,  "Paul Walmsley" <paul.walmsley@sifive.com>,
  "Albert Ou" <aou@eecs.berkeley.edu>,  "Oleg Nesterov" <oleg@redhat.com>,
  "Eric W. Biederman" <ebiederm@xmission.com>,  "Kees Cook"
 <keescook@chromium.org>,  heiko.stuebner@vrull.eu,  "Conor.Dooley"
 <conor.dooley@microchip.com>,  "Huacai Chen" <chenhuacai@kernel.org>,
  "Janosch Frank" <frankja@linux.ibm.com>,  "Qing Zhang"
 <zhangqing@loongson.cn>,  eb@emlix.com
Subject: Re: [PATCH -next v20 12/26] riscv: Add ptrace vector support
In-Reply-To: <eb61b8c5-4c0a-4d64-b817-235db848995c@app.fastmail.com> (Arnd
	Bergmann's message of "Wed, 24 May 2023 08:32:27 +0200")
References: <mhng-f92fa24d-c8bd-4794-819d-7563c1193430@palmer-ri-x1c9a>
	<eb61b8c5-4c0a-4d64-b817-235db848995c@app.fastmail.com>
X-Yow: My BIOLOGICAL ALARM CLOCK just went off..  It has noiseless
 DOZE FUNCTION and full kitchen!!
Date: Wed, 24 May 2023 09:50:36 +0200
Message-ID: <mvmzg5udv77.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_005044_014710_72EE0637 
X-CRM114-Status: GOOD (  14.45  )
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

On Mai 24 2023, Arnd Bergmann wrote:

> On Wed, May 24, 2023, at 02:49, Palmer Dabbelt wrote:
>> On Thu, 18 May 2023 09:19:35 PDT (-0700), andy.chiu@sifive.com wrote:
>
>>>  static const struct user_regset_view riscv_user_native_view = {
>>> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
>>> index ac3da855fb19..7d8d9ae36615 100644
>>> --- a/include/uapi/linux/elf.h
>>> +++ b/include/uapi/linux/elf.h
>>> @@ -440,6 +440,7 @@ typedef struct elf64_shdr {
>>>  #define NT_MIPS_DSP	0x800		/* MIPS DSP ASE registers */
>>>  #define NT_MIPS_FP_MODE	0x801		/* MIPS floating-point mode */
>>>  #define NT_MIPS_MSA	0x802		/* MIPS SIMD registers */
>>> +#define NT_RISCV_VECTOR	0x900		/* RISC-V vector registers */
>>
>> IIUC we're OK to define note types here, as they're all sub-types of the 
>> "LINUX" note as per the comment?  I'm not entirely sure, though.
>>
>> Maybe Arnd knows?
>
> No idea. It looks like glibc has the master copy of this file[1], and
> they pull in changes from the kernel version, so it's probably fine,
> but I don't know if that's the way it's intended to go.

Yes, for these types of definitions the kernel (as the producer) is the
authoritative source.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
