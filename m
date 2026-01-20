Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021DFD26284
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 18:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dBnZr+KghyaXdtV8tJvDso3cYnUwWsb1Zlt97JEiz7Q=; b=ZbkEZnbm4Fn1cI
	ZIKkIVYjCmwIz9USDf1A4FZmfeQZoNdBiuHeOJgo2ER5kwgsct10BHN1h20miQrFuEFJ+dSDfuZAD
	zlXRswHvQn8g63ODBiZDzdkRMlC9bSEG5IM0t6yYsRcM8Lsdwsc+yzJiMscRUWx4fTj1bOflK33MC
	g5kfXRyYA5vi8JLr3LbMDS9dIvK58oSKYUu9yqdt77desaVsRkEVJHp5mOygR9ohLiykviqkmMRYi
	KOKkwOEHDUL0Dl+37nwfFz+mYcuvdc+8RKGqBJjrieLygNACSAgqt62sdmU77862PmTb9yP5kdZug
	mukZH2vTBKFNdVeB6Gew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viGjh-00000004Jlm-1itC;
	Tue, 20 Jan 2026 18:45:53 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viGja-00000004JkO-0NIn
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 18:45:51 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4358fb60802so65969f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 10:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768934743; x=1769539543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thnE7Lerq2YAOWgwctI0eLWWpc+gSu6vXOqPs3mAkT8=;
        b=AnFKBR8gJ92rj+YIF9GqyjAK7IbSKIjkNmzcG2kexro5HChJinYZKEoyFTWwUc+NPI
         8GCtbGGzVloWB7PP/mmuhhhW75P8uUZdT/q3qZOYOUEneaZFa3zm8hWlop+MxPAyyEZE
         nfBsc/od2oP2QmldPkytFi50KZCHfC2OeEx4CGEpkk/BGQfQPQNmwF52mdlOSH8Ztv51
         mX9RejGOi+55q//Sdnmb0T9euLirnj3E5zQ4tMkq97LZSoNl1QqNzVFxjjx6H+b53oRr
         ak97Y08WD/0BgLO9Mh8YcK+NqystWPxS8Az32fZX/4XdyO40XFKwikpFcCWfPSTeUr1T
         dhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768934743; x=1769539543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=thnE7Lerq2YAOWgwctI0eLWWpc+gSu6vXOqPs3mAkT8=;
        b=Kl7nl9aHcSokHoUcsH1+5KXAkkmLnLWGSo2G4BY6/uxU2s5tRWyYWdke0loh7hqUeO
         +A1A1SH4WdXEB/weECH2it5J3i5yEn3e+ClKiCPaZI+O6r6eyoM9DMRRc/1j3PiP/wrb
         ksS8p0kSUJWrHbsiBXWCNu5L+Q7FAOOe6Ux3fXiCQLeJvqBEnbklqV4OgspGuXGRIX90
         KlgUNIoIXj/6wbMAbSDCQsysiB51IQHbAfKDrJt/CUg0czeTVtSBlll74q0+P8SaNlgF
         F8EmjTANpVVZAEEVqmCE2kig5glfMr7Sw/4XuoG2d3RTa2AuG40D9Dja3Fmd64k48GTC
         tjJA==
X-Forwarded-Encrypted: i=1; AJvYcCV1SZRPJ3FL8TatKbcJ+2ASRRm3CGvWrY2wc/c3J7E4zaap977yY9MietSd0xca35h+Ve2JFY8BOhMgyA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8JveJC4iaY07P6gZPTeotqyudt3tlrQ07cwYkOQ2SPtPWqwb2
	QNPykBqha6DAB5iDAAYYXo4cxG+u/Mw7i7/lMFM/0GoF3ubm9DFPlJBK
X-Gm-Gg: AZuq6aJLHP90Paq6cCwcHl+15fVv5VddEfBoIWUv1S043oxRzdOKkFYj132rCCBT/us
	u0Xa6DPuuy6tMKSoMqXixDigC8h89fOwxJOVfANCg3n1/SCG3Fr1XhyqI19EVxHFYXlxYP6U0jF
	u3WZoa6Fmpru74UM54+m8eNZ/t9g8ml/b+DaqSuVn8t28wRkxSlgS1Ug1knP/2QbbRlohxhS9eD
	2T3IH3QX+MDwR7N1Rrl4xtDSx9wOEhQocY7mM3lDF+PkujGSNOUtZyrDIkaZrCXJRH5CcagsbI/
	ElrVfEOFkwjEH4PjZ4LQLpJ3woQIt4fVxBvf/Qqh2dotwIAEhDD7V4V0oPKEKjDd1OshbHCGBFS
	YwrMpkaXFz14C4ajpYUO/zfPOSAxSs5JH9Ymj0K0Q6nSWLjbkapVHr6ILF9hOSfKTvmGRZBaywx
	9XW/NyV1tPO8yLqE83EPrBeGsJuX/irdm+FQmYuLShRB+pe2kliRvY
X-Received: by 2002:a05:6000:2484:b0:430:fcbc:dc4a with SMTP id ffacd0b85a97d-434d75c16c1mr25592154f8f.19.1768934743113;
        Tue, 20 Jan 2026 10:45:43 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997eb1fsm30869735f8f.35.2026.01.20.10.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 10:45:42 -0800 (PST)
Date: Tue, 20 Jan 2026 18:45:41 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Kees Cook <kees@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "Gustavo
 A. R. Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark
 Rutland <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard
 Biesheuvel <ardb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 0/3] Fix bugs and performance of kstack offset
 randomisation
Message-ID: <20260120184541.0a463cd1@pumpkin>
In-Reply-To: <a8ca3483-d61a-41bd-9b1b-17a8f3ac03eb@intel.com>
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
	<20fb97f1-7e50-485a-bdfd-a2901d20ec84@intel.com>
	<C502BCE6-2FB2-4A06-93A8-E8DEDFC22914@kernel.org>
	<785a7d90-babe-43af-93a6-c220c1877bcf@arm.com>
	<a8ca3483-d61a-41bd-9b1b-17a8f3ac03eb@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_104546_147726_0B3A253F 
X-CRM114-Status: GOOD (  20.10  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMCBKYW4gMjAyNiAwODozNzo0MyAtMDgwMApEYXZlIEhhbnNlbiA8ZGF2ZS5oYW5z
ZW5AaW50ZWwuY29tPiB3cm90ZToKCj4gT24gMS8yMC8yNiAwODozMiwgUnlhbiBSb2JlcnRzIHdy
b3RlOgo+ID4gSSBkb24ndCB0aGluayB0aGlzIHF1ZXN0aW9uIHdhcyByZWFsbHkgYWRkcmVzc2Vk
IHRvIG1lLCBidXQgSSdsbCBnaXZlIG15IG9waW5pb24KPiA+IGFueXdheTsgSSBhZ3JlZSBpdCdz
IHByZXR0eSBiaW5hcnkgLSBpdCB3aWxsIGVpdGhlciB3b3JrIG9yIGl0IHdpbGwgZXhwbG9kZS4K
PiA+IEkndmUgdGVzdGVkIG9uIGFybTY0IGFuZCB4ODZfNjQgc28gSSBoYXZlIGhpZ2ggY29uZmlk
ZW5jZSB0aGF0IGl0IHdvcmtzLiBJZiB5b3UKPiA+IGdldCBpdCBpbnRvIC1uZXh0IEFTQVAgaXQg
aGFzIDMgd2Vla3MgdG8gc29hayBiZWZvcmUgdGhlIG1lcmdlIHdpbmRvdyBvcGVucwo+ID4gcmln
aHQ/IChMaW51cyBzYWlkIGhlIHdvdWxkIGRvIGFuIC1yYzggdGhpcyBjeWNsZSkuIFRoYXQgZmVl
bHMgbGlrZSBlbm91Z2ggdGltZQo+ID4gdG8gbWUuIEJ1dCBpdCdzIHlvdXIgdHJlZSDwn5iJICAK
PiAKPiBGaXJzdCBvZiBhbGwsIHRoYW5rIHlvdSBmb3IgdGVzdGluZyBpdCBvbiB4ODYhIEhhdmlu
ZyB0aGF0IG9uZSBkYXRhCj4gcG9pbnQgd2hlcmUgaXQgaGVscGVkIHBlcmZvcm1hbmNlIGlzIHN1
cGVyIHZhbHVhYmxlLgo+IAo+IEknbSBtb3JlIHdvcnJpZWQgdGhhdCBpdCdzIGdvaW5nIHRvIHJl
Z3Jlc3MgcGVyZm9ybWFuY2Ugc29tZXdoZXJlIGFuZAo+IHRoZW4gaXQncyBnb2luZyB0byBiZSBh
IHBhaW4gdG8gYmFjayBvdXQuIEknbSBub3Qgc3VwZXIgd29ycmllZCBhYm91dAo+IGZ1bmN0aW9u
YWwgcmVncmVzc2lvbnMuCgpVbmxpa2VseSwgb24geDg2IHRoZSAncmR0c2MnIGlzIH4yMCBjbG9j
a3Mgb24gSW50ZWwgY3B1IGFuZCBldmVuIHNsb3dlcgpvbiBhbWQgKGFjY29yZGluZyB0byBBZ25l
cikuCihUaGF0IGlzIHNlcmlhbGlzZWQgYWdhaW5zdCBhbm90aGVyIHJkdHNjIHJhdGhlciB0aGFu
IG90aGVyIGluc3RydWN0aW9ucy4pCldoZXJlYXMgdGhlIGZvdXIgVEFVU1dPUlRIRSgpIGFyZSBp
bmRlcGVuZGVudCBzbyBjYW4gZXhlY3V0ZSBpbiBwYXJhbGxlbC4KSUlSQyBlYWNoIGlzIGEgbWVt
b3J5IHJlYWQgYW5kIDUgQUxVIGluc3RydWN0aW9ucyAtIG5vdCBtdWNoIGF0IGFsbC4KVGhlIHNs
b3cgYml0IHdpbGwgYmUgdGhlIGNhY2hlIG1pc3Mgb24gdGhlIHBlci1jcHUgZGF0YS4KWW91IGxv
c2UgYSBjbG9jayBhdCB0aGUgZW5kIGJlY2F1c2UgZ2NjIHdpbGwgY29tcGlsZSB0aGUgYSB8IGIg
fCBjIHwgZAphcyAoKChhIHwgYikgfCBjKSB8IGQpIG5vdCAoKGEgfCBiKSB8IChjIHwgZCkpLgoK
SSB0aGluayBzb21lb25lIHJlcG9ydGVkIHRoZSAnbmV3JyB2ZXJzaW9uIGJlaW5nIGZhc3RlciBv
biB4ODYsCnRoYXQgbWlnaHQgYmUgd2h5LgoKCURhdmlkCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
