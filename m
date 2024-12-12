Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB860E77180
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Dec 2024 12:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KHALYW2nCPYpV5YoP/ONRgwp1wv4mpBNfhCk0aZeits=; b=ttSreB4hN9naNS
	x43EO8vRA4zzU3+lw+7x3G3yHaKdpsP2fwwgXMTCpr2lizZMSVFX9QrF+rGgX/2Y+uagI2yhNWbUS
	rvvNkGCE8Aic/QeI6HZRFxZLn2gUXhcYVeMDn8bB7/hxI5u/bQp8iHKxSzNhsfXRN56qN9+OMaGod
	uuSReImsaFNYa8WSsHK6YXq+eTvykEkpX90VYI8a3Ob2sbJ68QLcrekMYANqGuIWsgwF6W03CWwo9
	dYacFqPOAq9FmEK4F5Nzlc33EvkmdwYvKJRhTmcbMSxdRlX7IUqXCEC8MpOau3e4TRtw1Li38U1AH
	J48mJ/x40/hw8c6QSk/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLiUZ-00000000OLP-1kVQ;
	Thu, 12 Dec 2024 12:40:31 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLiUW-00000000OKM-3ieb;
	Thu, 12 Dec 2024 12:40:29 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ef718cb473so76878a91.1;
        Thu, 12 Dec 2024 04:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734007227; x=1734612027; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1wFQ2XEw4h3NqlPy/Ig8PdgIYeLmggghPp5vpM+aTg=;
        b=cpPwBhypbudeOImkkmdFgT2xYQ8RBNEdtNm5xFBe3t3AJFECc9A3BFYutQvipqiAgs
         RQaITW3hey9x6EZ9gIrV2mfGU3t9IliN+p7xzcaBBMu/ZxQITercgvG6VjBUv2RnjFR8
         ot8nzYRE4DR8d24AzyTsDUES2uvgD2xxHXV0uli9qmMDaU5VzYt6D1OGcCPH6DMSglYC
         B6kO3w1MXalexY1iTsRd5jUO6WzphwRu+uP4RIwlc9TvCBEVTZtQUGATMHvFrTe3z6HR
         menkH0cQMeHlNQUvQe4+2uEP5AC0p24SFNd1ExHMTWCnskAJeW0WZ/sUX3tkj54SZATO
         56ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734007227; x=1734612027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1wFQ2XEw4h3NqlPy/Ig8PdgIYeLmggghPp5vpM+aTg=;
        b=Q02eBYNx2m5qF2gJSGsEJO8c/HOyBzvfZiYSKTqw7SJVoIj8dS5qwXuT/9kfmTqHzv
         jCXOysDK+AFn4OcEkGNleOf73UTuEk/mbNosdyIw5yyq8z2gTSLDUshh2p9XdDjlUpEs
         9RQepYUJ+Rp19vtHgHD3kACMS3KOgg1aFudN34NvCrgPUU/P7WVnignUxG+ztrGpHYGn
         GRpyT4JwSOG96Wk2fKhyaOtU7DSvXhDJg+dbzEDidnJ5Q5t8mGrUq8ig4xH1qpzH9N7i
         +oJfp0INtYBigyUqHKgKMwMnmODatjMtzPMnC0Xc4t5e8J9cfBpGhIO3ygEZvwJrZ6/r
         8pqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHbOsUXQog0kRJY8t17oEn5KDhd/uWFBl4SgGjH9f1n1YMtvTov4ATLGiBzQsL716KS28Uq5+1Hq8hPFE=@lists.infradead.org, AJvYcCXiWaFZy27esEvcWjb9YQHZBBTJkI2fCSYL5AWmMi6943UQCCMh1oQX1F7WNyKtF/5y2Y7HqBsga9xpmC82qYgQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf2HNNw2fGPi1hYaNCxvy3EKs8PlGr52N/uVFksAFJactk8KEd
	8BymqzfAUHYuvVqw/jNe5T6kE7e8WAmUXI+4+9wkkOA8j/ne4hkGTB197hlvNaJ+7l3IEzOJWzV
	4nQaZ8ZapFMn8bmDUquCK7X9PCBY=
X-Gm-Gg: ASbGnctG78ogjONeWca3rZBPChyoWY+CoTokiUUv+n51hAGeJQqybGzhJuIkiJLNl6t
	GXwLjiEVYahh5IYysHsjtNOrboBl29TU95oRcNA==
X-Google-Smtp-Source: AGHT+IGFpqHYpP+ryhHdXHcJSw/i/CLG0LKsPNa9VsJsTDjRyGichTiBKLOQwEEn9jpAx0lNH3xQvXBViE9Iz/QqtPc=
X-Received: by 2002:a17:90b:3b87:b0:2ee:f59a:94d3 with SMTP id
 98e67ed59e1d1-2f127e2416fmr3955460a91.0.1734007227479; Thu, 12 Dec 2024
 04:40:27 -0800 (PST)
MIME-Version: 1.0
References: <20241030-tracepoint-v12-0-eec7f0f8ad22@google.com> <173395634899.1729195.7492083712432982213.git-patchwork-notify@kernel.org>
In-Reply-To: <173395634899.1729195.7492083712432982213.git-patchwork-notify@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Dec 2024 13:40:13 +0100
Message-ID: <CANiq72mmO5SswxmdcLc0i_rY+ZVo4zY8AsmHPPBKb_Vmzk8+aw@mail.gmail.com>
Subject: Re: [PATCH v12 0/5] Tracepoints and static branch in Rust
To: patchwork-bot+linux-riscv@kernel.org
Cc: Alice Ryhl <aliceryhl@google.com>, linux-riscv@lists.infradead.org, 
	rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, ardb@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, 
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arnd@arndb.de, linux-arch@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, seanjc@google.com, 
	ubizjak@gmail.com, catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, mark.rutland@arm.com, ryan.roberts@arm.com, 
	tabba@google.com, linux-arm-kernel@lists.infradead.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	apatel@ventanamicro.com, ajones@ventanamicro.com, alexghiti@rivosinc.com, 
	conor.dooley@microchip.com, samuel.holland@sifive.com, chenhuacai@kernel.org, 
	kernel@xen0n.name, maobibo@loongson.cn, yangtiezhu@loongson.cn, 
	akpm@linux-foundation.org, zhaotianrui@loongson.cn, loongarch@lists.linux.dev, 
	cmllamas@google.com, palmer@rivosinc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_044028_920117_6AB2C8D9 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
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

T24gV2VkLCBEZWMgMTEsIDIwMjQgYXQgMTE6MzLigK9QTSA8cGF0Y2h3b3JrLWJvdCtsaW51eC1y
aXNjdkBrZXJuZWwub3JnPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIHdhcyBhcHBsaWVkIHRvIHJp
c2N2L2xpbnV4LmdpdCAoZml4ZXMpCj4gYnkgU3RldmVuIFJvc3RlZHQgKEdvb2dsZSkgPHJvc3Rl
ZHRAZ29vZG1pcy5vcmc+OgoKSG1tLi4uIFRoaXMgaXMgYWxyZWFkeSBpbiBtYWlubGluZSwgYW5k
IEkgZG9uJ3Qgc2VlIGl0IGluCnJpc2N2L2xpbnV4LmdpdCAoZml4ZXMpIC0tIEkgZ3Vlc3MgaXQg
d2FzIGEgbWlzdGFrZT8KCkNoZWVycywKTWlndWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
