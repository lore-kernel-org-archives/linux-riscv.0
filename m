Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA509CA0ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 16:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=y/WozQxyQCoz+TCSKor+oxzhpEVnjGFh/KxGr14cQRY=; b=tfuDx3Lh2BBi4umMizJjmufyE2
	jm/pupbMvbRzAFU/jF0t3taZ0031Miiz1p0Gwk/jf0bnajbo7kuDJerm5Z5rBOzfSDtcnLwNC5f53
	In5YhX6YFYp4h3U7ZG7JB6njBiHwT6/EiORk3k9XCYrmYhfUIiF+vURPU4KU+5wgPJ7fLcFBXnrdR
	LVdbKc2MCSgtUE9Y7qAIIBo7uFDyJHLEVpTO5Ok6bsYRuhfnr3C2bA2IHA3Zwr4VS+dZbXliyinVI
	E5PyqVNGOwxW8yXRifwMePGdu8hDdPQAaB96wGTWncwIc+0GpV9oRpVdPJ23Qn4lBZNIVm99adk8X
	3WHFhSwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umxlk-000000032Yu-2tRB;
	Fri, 15 Aug 2025 16:59:08 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umw08-00000002npD-1SFt
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 15:05:55 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b4717543ed9so1341358a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 Aug 2025 08:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1755270350; x=1755875150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38zqqxNHqbGz3C68JOy9Ugb8wAb711DWGVbxjNinx0U=;
        b=eRU4w0v5ntR9PrDOzmPaY3AiO/jlhmhkdbbTvDUw3B5tgZVrifJjv5ooIvlqR4bWsV
         cY6PGMWK8+3dKD+VA7DFPWvOz+u0GCSNqj44p3xZuRzjh/flUrob2Yi+BrtPCA/L8iuo
         +sHQlO+ddfkzI+vrUI4uGlvoD2EMnSnj5/sPBk1FcrnKSdA1uHLe9cnLC6Am9XQZhP8Q
         HHVyjh89KnUxjOJPmJxgKpZTwkzL4afXSagwutu6meXKujioSTSC/P+KWbgDbeRVLt9H
         agIvQMFOwN6qQxxkRE1emMPeolN1VvIK25hXsFY4k/70uih4wUvFsJ3xvtN6caiCfSTC
         +FSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755270350; x=1755875150;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38zqqxNHqbGz3C68JOy9Ugb8wAb711DWGVbxjNinx0U=;
        b=fiqYob8xk5J5pryaDomr2irxAoWamj0DLpfVNmTpwdpyl1M7K9UNasAgbuT7MxLgbh
         vyY6ru44ByYvNzBa9F9ccAQSfO1H6R7a857r5Nkv3jcGthp1qJBhAsTGK8wGf5D00On0
         QDHFC67BsFV4yh15MXhA1yBHOtqQgO2xBlUpC9zEmkJ1qED/fQpHi9s0yAL7wzK5n0Yf
         3oSmDYYlvfUymnOOfdlALggobu6Q7teWoHz+VJ/uB8qRy1SsjRf2SX0buuUPwP0k5V9m
         WUL2kEJRZJubbXLHPuS6YDneS2lGp594DEUZVCQ6verhxvQ3s/v6A82hBc2KQOfXfA7m
         w0ag==
X-Forwarded-Encrypted: i=1; AJvYcCWnemZmAfoj+qdYsv8DBGgEeURRRV21nosxeG5yqDhjNRM2okAFD3NUN1uPU7wJurxS0Iq4ggQADYaR+g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1s93Czo/8mQFX4Yd7drZaZR0L48gHDbLX8+Jik+GyVdz1/OsS
	9bgaufzAr0gS9R+sZ2Rg0FXFEXz5foGmEuSXUvP1hdRqJW7dbWqPVOwY0cx2yS5xs+I=
X-Gm-Gg: ASbGncvY5qTLl0HRGOvKXgWK81frftJ18kuBG1I7YftxYTAG23tlDPchKednmM+fuCs
	BENZ3IS4le34dpHopWiNXr7aye0YISO4C5Cf+a6FmzAe8L6Sjc6jWdPDmXzZJnC1661Rm7Rp+2o
	EvIKzSqCGSp856JihvxipaFnzJi/toUnFDeYdm94nHE29OP2z0W5ZJ9gPrjFixAdfAVfZyeZou5
	xUTKZ1CSHKUyFqrCX0W5wdB3DtwF5FF0t6fwhwbqiebOZMiuwXcGOLp4MP/SvaLYIbEoJMRPz9d
	YNljDTtCgwzzPr0TqagdBuYTTfLcNladE7uVWT/E40c2T9WVPrpTGE73CjiUF9C+/UX1pB8ld3x
	8QGvks/Nzsmz7GanXA+GOGSlLhCdzbXnaZPc=
X-Google-Smtp-Source: AGHT+IG3gBMogdOr+spUGY65daTLUVfmz5lhgO/opdXo6UimhkccgL0C2Gx+F8DUbrOBq4AI/2z6Vg==
X-Received: by 2002:a17:903:198c:b0:240:a222:230c with SMTP id d9443c01a7336-2446d5af743mr41307075ad.12.1755270349908;
        Fri, 15 Aug 2025 08:05:49 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2446cadf96fsm16286885ad.41.2025.08.15.08.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 08:05:49 -0700 (PDT)
Date: Fri, 15 Aug 2025 08:05:49 -0700 (PDT)
X-Google-Original-Date: Fri, 15 Aug 2025 08:05:47 PDT (-0700)
Subject: Re: [PATCH v4 06/24] riscv: elf: Move relocation constants to UAPI
In-Reply-To: <20250812-vdso-absolute-reloc-v4-6-61a8b615e5ec@linutronix.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
  justinstitt@google.com, luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com,
  kees@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
  hpa@zytor.com, richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
  linux@armlinux.org.uk, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
  maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
  chenhuacai@kernel.org, kernel@xen0n.name, hca@linux.ibm.com, gor@linux.ibm.com,
  agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, tsbogend@alpha.franken.de,
  ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
  bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
  tmgross@umich.edu, dakr@kernel.org, nicolas.schier@linux.dev, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
  linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org,
  linux-kbuild@vger.kernel.org, jstancek@redhat.com, acme@redhat.com, alexghiti@rivosinc.com,
  thomas.weissschuh@linutronix.de
From: Palmer Dabbelt <palmer@dabbelt.com>
To: thomas.weissschuh@linutronix.de
Message-ID: <mhng-5B6E084E-60EE-440E-BFF9-5E81AAC9A473@Palmers-Mini.rwc.dabbelt.com>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_080552_478703_EB21676C 
X-CRM114-Status: GOOD (  11.95  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxMSBBdWcgMjAyNSAyMjo0NDoxOSBQRFQgKC0wNzAwKSwgdGhvbWFzLndlaXNzc2No
dWhAbGludXRyb25peC5kZSB3cm90ZToKPiBUaGVzZSBjb25zdGFudHMgYXJlIHVzZWZ1bCBmb3Ig
Y3Jvc3MtcGxhdGZvcm0gdXNlcnNwYWNlLCBmb3IgZXhhbXBsZSB0bwo+IHByb2Nlc3MgRUxGIGZp
bGVzIGR1cmluZyBrZXJuZWwgY3Jvc3MtY29tcGlsYXRpb24uCj4KPiBNb3ZlIHRoZW0gZnJvbSB0
aGUga2VybmVsLXByaXZhdGUgYXJjaGl0ZWN0dXJlLXNwZWNpZmljIGhlYWRlciB0byB0aGUgVUFQ
SS4KPgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1
aEBsaW51dHJvbml4LmRlPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vZWxm
LmggfCA2NiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgaW5jbHVk
ZS91YXBpL2xpbnV4L2VsZi1yLmggICAgICAgIHwgNjYgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKSwgNjYg
ZGVsZXRpb25zKC0pCgpBY2tlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNv
bT4KCkknbSBnb2luZyB0byBhc3N1bWUgeW91IHdhbnQgdG8gdGFrZSB0aGVzZSBhbGwgdG9nZXRo
ZXIgdGhvdWdoIHNvbWUgCm90aGVyIHRyZWUsIHRoYW5rcyEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
