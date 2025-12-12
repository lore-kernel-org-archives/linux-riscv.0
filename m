Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6DCD4337F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Dec 2025 08:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EHmb67wIlAbNS4xiLmiW2izOJg7kHy2DHpgyE1N/b7w=; b=Zbys3mwzQDafGB
	R3rhGb7xuEJKcBxOYI162SsTZdpoEWVDnCG81RWRN62D47XcXHEvrRhnaGnRgQEEAGB70xD0h3FJL
	1BD63CjzjFT08PDllJ05jeM0FuMjE18CueuKZMaUMUYDG89u3ocjf5+H49Fvy9i/2mocfTvv92tjv
	hXCD1JHi3TEO8daVnaM0LcKDK/SEJYN4RJFkBdIG19DK5t+DooS2Y89TEcCWed4bCVt1myLwp6nzj
	rNpLOePVNEf44OtCk28t3DdgvdqJ4WZwFYbXkAQFnA//ResvUQWPO/8h1YNJt8rIhfeCim/hHbCv5
	YHyY6H6tTIQudwSYz46w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTyJL-00000000Fc3-0xjW;
	Fri, 12 Dec 2025 08:15:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTyJJ-00000000Fbu-2ZUd
	for linux-riscv@lists.infradead.org;
	Fri, 12 Dec 2025 08:15:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CDFC60123;
	Fri, 12 Dec 2025 08:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38DDC4CEF1;
	Fri, 12 Dec 2025 08:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765527331;
	bh=/hrrCjWB7RCTyEWEeMlOdi0WwTl2Sn/DGE23XvsAA1U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nFeJPvAgpE2u+HqSBX8PIxPmMSQ17wJNJelCCJFq1uX7BJ4kkZTE58a4A/8W62uDv
	 8dCoi9GTVmIMujcz+AOuXNHyzOpNdkqYb0DKCTnbVN5TLfcAkHHk4X5GkOY53+fRgD
	 H2vRj24tmoDmCl8w/eVYpZl4Jls0dlJuEvEZknT2PTiKXaOtE9hzu2MBmaeM6kr1j/
	 ogHmwcJaqT9Ixl5mvdquTPY2dsBps1wEREysFISYUzN+OM8KsbYw3C3l1ZIxq/kU5p
	 WRGZq7FJYPTT9l34JbOAyhRb6Au3e9WpMLWJE01Ek738rPu9oBt8WFwFmkHSBIxHo9
	 YRpD801VkVqYw==
Date: Fri, 12 Dec 2025 01:15:11 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
cc: linux-riscv@lists.infradead.org, tglx@linutronix.de, mingo@redhat.com, 
    bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
    akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz, 
    lorenzo.stoakes@oracle.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
    aou@eecs.berkeley.edu, conor@kernel.org, robh@kernel.org, 
    krzk+dt@kernel.org, arnd@arndb.de, brauner@kernel.org, 
    peterz@infradead.org, oleg@redhat.com, ebiederm@xmission.com, 
    kees@kernel.org, corbet@lwn.net, shuah@kernel.org, jannh@google.com, 
    conor+dt@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
    boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
    a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
    lossin@kernel.org, linux-kernel@vger.kernel.org, 
    linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
    devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
    linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
    alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
    andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
    atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
    alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
    rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
    zong.li@sifive.com, david@redhat.com, andreas.korb@aisec.fraunhofer.de, 
    valentin.haudiquet@canonical.com, cmirabil@redhat.com
Subject: Re: [PATCH v26 00/28] riscv control-flow integrity for usermode
In-Reply-To: <176551861579.2032148.13920544388182691102.git-patchwork-notify@kernel.org>
Message-ID: <b9991702-44d9-1f0d-e5c8-677c404e2522@kernel.org>
References: <20251211-v5_user_cfi_series-v26-0-f0f419e81ac0@rivosinc.com> <176551861579.2032148.13920544388182691102.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
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

On Fri, 12 Dec 2025, patchwork-bot+linux-riscv@kernel.org wrote:

> This series was applied to riscv/linux.git (for-next)
> by Paul Walmsley <pjw@kernel.org>:
> 
> On Thu, 11 Dec 2025 09:20:33 -0800 you wrote:
> > v26: CONFIG_RISCV_USER_CFI depends on CONFIG_MMU (dependency of shadow stack
> > on MMU). Used b4 to pick tags, apparantly it messed up some tag picks. Fixing it

This is the Patchwork bot getting things wrong, again.  

What got repushed was a slightly modified version of the v23 series -- 
with the non-code changes described here:

   https://lore.kernel.org/linux-riscv/176551861579.2032148.13920544388182691102.git-patchwork-notify@kernel.org/T/#t

Deepak: as others have pointed out, you shouldn't be sending patch series 
during merge windows.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
