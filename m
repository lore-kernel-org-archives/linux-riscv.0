Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E293BCA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 13:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDeBqdu73VG6khOKQR6Q9cpuEKadG8tw6KG8lHitJU0=; b=tZo/qvpxahs82Q4Xfl9HDB6w9Y
	fP5tRk7klG0u5eXvU26Y+q31tIb6wwSY7C9kAvgzep6yanAagONgMaZX867t2XVH0qcD8L/Zlnbon
	eI1BVOkU5VitVO9lp+Hvbuyo9Zh9hW8QvsvQE+aZ0pUzqvvr0ya8bvdsd1mkD36qSDx5yvmFaRzw2
	DYAshBS5Mz+SolL7Nj4tRiXB05yR5EU2WC/ap9gKdZNAjyDdx+0Py/3JuYYcyv6aLUJwp2VYJ5dnI
	w0O6duvWU5gKR0b7Q8ArscCMfZvyg/DxCDvtoZVK3IgGzwwxunyMfrX58g90e/tN0rB28XtN5ldP8
	LH1MMQxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unGey-00000004flG-0oXr;
	Sat, 16 Aug 2025 13:09:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unGdz-00000004fiw-3G1e
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 13:08:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C9C42601F8;
	Sat, 16 Aug 2025 13:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB37C4CEF1;
	Sat, 16 Aug 2025 13:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755349701;
	bh=+T/6B/T5uz0eml6pEVTOry9UZOIWHyEWSI6jNc/vg/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PXLNHcyYcgveCQu5Z+a8nzuhWIqZ7ADuPzJ2pjRCpG/4mN2tixFh751kEtg45Pgoy
	 v2U8vwVZc3AMk7C29H9+a3rXWG75oKbxrX0mpjzA+kPs8WNvk/fZy9mm2jsTh60ZIQ
	 eMueFSAiZ7ePJ+KwPTh5IKf6rW1R6qWz2JQ+WOB8vCdLeiFM1uHYL9BEo2IqMEMV80
	 qS2CsXwsX7bMb0hrAOwb4FzowYRSHO9kZ4FZICk/jz3jjTJrcYI68ANK1smYktsO7j
	 HgOYteqVnXKaEQMSxb7SqcBbGzz8aiYj6oetIos2n/uZ8gYqtlI8j2H5aOF6mUy+fI
	 fcvRLL4rjSkHg==
Date: Sat, 16 Aug 2025 09:08:19 -0400
From: Sasha Levin <sashal@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	Nylon Chen <nylon.chen@sifive.com>, Zong Li <zong.li@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>, paul.walmsley@sifive.com,
	samuel.holland@sifive.com, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 6.1 24/51] pwm: sifive: Fix PWM algorithm and
 clarify inverted compare behavior
Message-ID: <aKCCwwjndbFXFbIB@lappy>
References: <20250804003643.3625204-1-sashal@kernel.org>
 <20250804003643.3625204-24-sashal@kernel.org>
 <52ycm5nf2jrxdmdmcijz57xhm2twspjmmiign6zq6rp3d5wt6t@tq5w47fmiwgg>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <52ycm5nf2jrxdmdmcijz57xhm2twspjmmiign6zq6rp3d5wt6t@tq5w47fmiwgg>
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Aug 04, 2025 at 12:38:15PM +0200, Uwe Kleine-K=F6nig wrote:
>Hello,
>
>On Sun, Aug 03, 2025 at 08:36:16PM -0400, Sasha Levin wrote:
>> From: Nylon Chen <nylon.chen@sifive.com>
>>
>> [ Upstream commit 7dbc4432ea6bf9d709391eb57f1e9fb44e99845a ]
>>
>> The `frac` variable represents the pulse inactive time, and the result
>> of this algorithm is the pulse active time. Therefore, we must reverse
>> the result.
>>
>> Although the SiFive Reference Manual states "pwms >=3D pwmcmpX -> HIGH",
>> the hardware behavior is inverted due to a fixed XNOR with 0. As a resul=
t,
>> the pwmcmp register actually defines the low (inactive) portion of the p=
ulse.
>>
>> The reference is SiFive FU740-C000 Manual[0]
>>
>> Link: https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8=
b16acba_fu740-c000-manual-v1p6.pdf [0]
>>
>> Co-developed-by: Zong Li <zong.li@sifive.com>
>> Signed-off-by: Zong Li <zong.li@sifive.com>
>> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
>> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
>> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
>> Link: https://lore.kernel.org/r/20250529035341.51736-3-nylon.chen@sifive=
.com
>> Signed-off-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>>
>> LLM Generated explanations, may be completely bogus:
>>
>> **Backport Status: YES**
>>
>> This commit should be backported to stable kernel trees. Here's my
>> extensive analysis:
>>
>> ## Critical Bug Fix Analysis
>>
>> 1. **The commit fixes a significant functional bug** - The PWM algorithm
>>    was fundamentally broken:
>>    - The `frac` variable was incorrectly used (lines 158-161 in
>>      original, now 168-171)
>>    - The driver was writing the duty cycle value directly to PWMCMP
>>      register (line 193), but the hardware actually expects the
>>      **inactive** (low) time
>>    - This results in inverted PWM output behavior where users get the
>>      opposite duty cycle from what they request
>>
>> 2. **Hardware behavior discrepancy** - The commit reveals and fixes a
>>    critical mismatch between documentation and actual hardware:
>>    - The documentation states "pwms >=3D pwmcmpX -> HIGH"
>>    - But the hardware has a hard-tied XNOR with 0 that inverts this
>>      behavior
>>    - The driver now correctly compensates for this hardware quirk
>>
>> 3. **User-visible impact**:
>>    - **In `pwm_sifive_get_state()`**: The driver now correctly inverts
>>      the value read from hardware (lines 115->122-126)
>>    - **In `pwm_sifive_apply()`**: The driver now inverts the duty cycle
>>      before writing to hardware (lines 162->171)
>>    - **Polarity change**: Changed from `PWM_POLARITY_INVERSED` to
>>      `PWM_POLARITY_NORMAL` (lines 126->137, 142->152)
>>    - **Documentation fix**: Updated comment from "cannot generate 100%
>>      duty" to "cannot generate 0% duty" (lines 11->27, 160->170)
>>
>> 4. **The fix is relatively small and contained**:
>>    - Changes are isolated to the PWM algorithm logic
>>    - No architectural changes or new features
>>    - Simple mathematical inversion: `duty =3D (1U << PWM_SIFIVE_CMPWIDTH)
>>      - 1 - inactive`
>>
>> 5. **No risky side effects**:
>>    - The change is straightforward and mathematically correct
>>    - Doesn't affect other subsystems
>>    - Maintains the same register interface
>>
>> 6. **Affects all SiFive PWM users**:
>>    - Any system using SiFive FU540 or FU740 SoCs would have incorrect
>>      PWM output
>>    - This includes various RISC-V development boards and embedded
>>      systems
>>    - Users would get inverted duty cycles, potentially breaking motor
>>      controls, LED dimming, etc.
>>
>> 7. **Clear documentation reference**:
>>    - The commit references the official SiFive FU740-C000 Manual
>>    - Provides clear explanation of the hardware behavior mismatch
>>
>> The bug causes PWM outputs to be inverted from user expectations, which
>> is a significant functional issue that would affect any system relying
>> on proper PWM behavior for motor control, LED dimming, or other PWM-
>> dependent functionality. The fix is clean, minimal, and addresses a
>> clear hardware/software mismatch that exists in production systems.
>
>What your LLM missed is that the device trees using this PWM relied on
>this "bug" and so this commit should be applied either together with
>f4bcf818e5d6 ("riscv: dts: sifive: unleashed/unmatched: Remove PWM
>controlled LED's active-low properties") or not at all.
>
>Given that there might be device trees in use that are not in mainline
>and that break in the same way without a possiblity for us to fix that I
>tend to prefer not to backport this breaking change to stable.

Ack, I'll drop it. Thanks!

-- =

Thanks,
Sasha

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
