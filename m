Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A86EFC617E
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 12:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M2tya4spItU8zn7yspkCbmq+w5AjHhzF+i93Gr/SzuE=; b=n6JkLD7WlgcRQ3
	SvAlE1VIeMg1bupCZxsxuxkOKLWC/LUBLVCE+K17h4mqUWi1oKbMLd3em6S8PyvCHU+6uQASJ0w2Q
	MAW4vVV03ALWGSRtDUMNYFz6pi+x7dtOiP+ZnSfmruXESW+v/JtBr8oMReSE/xD98qz4E5qDXWA3p
	9RaPPyRmTXbBnLeQ8h0sIHpfoRgCWs6Jk1LmEhOpC3R3HAKPW+XHh5Vxw6kZccpABs74uETwNh8U+
	KrJI7QOFkjim+mU4EX5h1i0P1OMt9xg8XLzbl9Aq2wgJX40/9TDpj13srKX1Jo1FUUSoiNe+8X0zy
	OS27OuF3rcLzJKKy4Dzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc0fp-00000009Leh-1tKc;
	Sat, 03 Jan 2026 12:24:01 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc0fm-00000009LeA-0i8H
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 12:23:59 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-37a2dced861so5905751fa.1
        for <linux-riscv@lists.infradead.org>; Sat, 03 Jan 2026 04:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767443036; x=1768047836; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AGEQXVff4Cjra/LEG8aFJKzdBMi+jbn5H5NG2dDiwk=;
        b=gsjl5lyusQjwp+I24u1UNrr0hFsTS+JliAbulUomFSsWqM8iyXHJVehTNcSlOpAD/k
         4o52TCio7hFJluqSON4PIlqe2Xr6XWIVAFHEzkjxzmVyNLNAbR+GHSEa/ibZ0yfHI0W7
         Mz5GHtq1dnQZ0lDNc51MXJhTyvTbft9m1yB3Qdbsv6r1kottZ0yxxbDD+wein9abY0zK
         5I5N3gHPfjhK5r7LTp2Rix4kmb2DZ3KH0dKidONsUMDHPCBqC8wnCz3p1X5REODg47zp
         dD67A+8XTc31rRcpNoF0H9Ye9MY0Mf+GUQAm+jssL0/6Q0quJISddhZ3h/eBsMRvig7F
         /E5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767443036; x=1768047836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7AGEQXVff4Cjra/LEG8aFJKzdBMi+jbn5H5NG2dDiwk=;
        b=hUBG8UuMoEXbvAUddMnfclCMjRxZnbF39/6770/Wqu2HDIYqa9FPu4asjL/gALPttk
         Eyu9Lk+LCWKg6z8+plgjraYb5qcXYoMwiirOHIaq4H3uh5vqVzQQxxEx7R2l31IeyF3z
         36OQaLA8nDqgGwefBy7rOcdbeR3suKqR1EL5+BLKxnHbP4BOyBpXoeHr/TVZqPpbpuE/
         8BbrL8GOlddJoUD9UI11LWabv0r94VTNMKLPIEXW2tnTSfCTpNAK5f/omUHaR0OKFfb3
         3AOZmRINn/wpAE/WCZ2K29g6JjvS1wXxDzRvbsbnIA8KGccPudUjjQtIlqgVIKpBNr8M
         hc6A==
X-Forwarded-Encrypted: i=1; AJvYcCU63B94uNrbfBylc1ywL7ekzCuh4RStK9xIyq9ldV3QUZdbtzmDBQ4C1EETiyNBjVI0+Fi+vDpG5HgPHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyK9mgvQvb8pOwpC38fLY9PpI0nLudYclCCFsQ+RvjFpXeMF2nL
	cXyY59EQRx7IVp/cJMM1O2y7M31oIKCDMcf07qZadCpK4yZ6yl5oK9po8iqN9Q==
X-Gm-Gg: AY/fxX7LUdGY8cGcaUHr0uuP9k68VLiK/9r//GJ9Fy+tEZ29EbLI3RF2i/tlmf9S6Sv
	9Yh7CEignF/a55vicALGYkfd7M9AiiVlRKfNHQuDBjvVtt1qwFpiudzBpXtoWOk480aq1ZHcm2e
	8a3UGsiOGLVn9wX88NHiBCQuioqI3nXbEgNwWVn0OLPp1o8X0E5utXZ77u6tZ+RxvDezHe8ob2j
	OfcH9U58lj8f95ruKHTtv7cPFYMHXc522PCcuiHU1QJNtwfO79C4YuJRdQr6JOb2aBUSK1az/Q6
	DuV1b7aNbcQOZ4dNWLwfkMJn/Ph/JNTJOwKZUNnTv5kTR8udiJfooFddY/XoZaPPc0Y4vh9jApx
	vDFFOfdpbiN7Nh8R8NDVmWTiRM2xWtEtmQc5npM8WJLBnRjDLls41XbSldDoDlz3Pi45eIR9wc+
	ee5L+IyH3bPQBnU8+pwba8U1t0DphQcoNHN/ibkZ6ys9C9efi+Uwsi
X-Google-Smtp-Source: AGHT+IGuPwj5c90N/yOSzvW/fHyvSi9BbZ6Md54mttsoAORSkjxjxsJYQaWeJvjkrO56uLXSAEKKNQ==
X-Received: by 2002:a05:600c:198a:b0:477:9fa0:7495 with SMTP id 5b1f17b1804b1-47d6c803ca7mr16959765e9.14.1767437190097;
        Sat, 03 Jan 2026 02:46:30 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6c0c148bsm13448405e9.18.2026.01.03.02.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 02:46:29 -0800 (PST)
Date: Sat, 3 Jan 2026 10:46:27 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland
 <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy Linton
 <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 2/3] prandom: Convert prandom_u32_state() to
 __always_inline
Message-ID: <20260103104627.2f385d20@pumpkin>
In-Reply-To: <719b7b99-3615-46cd-84d9-8b8fc21e3ce9@arm.com>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<20260102131156.3265118-3-ryan.roberts@arm.com>
	<CAHmME9qHiVZwf4TAringRHSZ-yqHuPwmP=Wnx98n09jv7Vu_Rg@mail.gmail.com>
	<719b7b99-3615-46cd-84d9-8b8fc21e3ce9@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_042358_271324_A44EF926 
X-CRM114-Status: GOOD (  29.20  )
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

T24gRnJpLCAyIEphbiAyMDI2IDE0OjA5OjI2ICswMDAwClJ5YW4gUm9iZXJ0cyA8cnlhbi5yb2Jl
cnRzQGFybS5jb20+IHdyb3RlOgoKPiBPbiAwMi8wMS8yMDI2IDEzOjM5LCBKYXNvbiBBLiBEb25l
bmZlbGQgd3JvdGU6Cj4gPiBIaSBSeWFuLAo+ID4gCj4gPiBPbiBGcmksIEphbiAyLCAyMDI2IGF0
IDI6MTLigK9QTSBSeWFuIFJvYmVydHMgPHJ5YW4ucm9iZXJ0c0Bhcm0uY29tPiB3cm90ZTogIAo+
ID4+IGNvbnRleHQuIEdpdmVuIHRoZSBmdW5jdGlvbiBpcyBqdXN0IGEgaGFuZGZ1bCBvZiBvcGVy
YXRpb25zIGFuZCBkb2Vzbid0ICAKPiA+IAo+ID4gSG93IG1hbnk/IFdoYXQncyB0aGlzIGxvb2tp
bmcgbGlrZSBpbiB0ZXJtcyBvZiBhc3NlbWJseT8gICAKPiAKPiAyNSBpbnN0cnVjdGlvbnMgb24g
YXJtNjQ6Cj4gCj4gMDAwMDAwMDAwMDAwMDAwMCA8cHJhbmRvbV91MzJfc3RhdGU+Ogo+ICAgIDA6
CTI5NDAxNDAzIAlsZHAJdzMsIHc1LCBbeDBdCj4gICAgNDoJYWEwMDAzZTEgCW1vdgl4MSwgeDAK
PiAgICA4OgkyOTQxMDAwMiAJbGRwCXcyLCB3MCwgW3gwLCAjOF0KPiAgICBjOgk1MzFlNzRhNCAJ
bHNsCXc0LCB3NSwgIzIKPiAgIDEwOgk1MzBlMzQ2OCAJbHNsCXc4LCB3MywgIzE4Cj4gICAxNDoJ
NGEwNDAwYTUgCWVvcgl3NSwgdzUsIHc0Cj4gICAxODoJNGEwMzE4NjMgCWVvcgl3MywgdzMsIHcz
LCBsc2wgIzYKPiAgIDFjOgk1MzE5NjA0NyAJbHNsCXc3LCB3MiwgIzcKPiAgIDIwOgk1MzEzNDgw
NiAJbHNsCXc2LCB3MCwgIzEzCj4gICAyNDoJNGEwMjM0NDIgCWVvcgl3MiwgdzIsIHcyLCBsc2wg
IzEzCj4gICAyODoJNGEwMDBjMDAgCWVvcgl3MCwgdzAsIHcwLCBsc2wgIzMKPiAgIDJjOgkxMjFi
Njg4NCAJYW5kCXc0LCB3NCwgIzB4ZmZmZmZmZTAKPiAgIDMwOgkxMjBkMzEwOCAJYW5kCXc4LCB3
OCwgIzB4ZmZmODAwMDAKPiAgIDM0OgkxMjE1NTBlNyAJYW5kCXc3LCB3NywgIzB4ZmZmZmY4MDAK
PiAgIDM4OgkxMjBjMmNjNiAJYW5kCXc2LCB3NiwgIzB4ZmZmMDAwMDAKPiAgIDNjOgkyYTQ1NmM4
NSAJb3JyCXc1LCB3NCwgdzUsIGxzciAjMjcKPiAgIDQwOgkyYTQzMzUwNCAJb3JyCXc0LCB3OCwg
dzMsIGxzciAjMTMKPiAgIDQ0OgkyYTQyNTRlMyAJb3JyCXczLCB3NywgdzIsIGxzciAjMjEKPiAg
IDQ4OgkyYTQwMzBjMiAJb3JyCXcyLCB3NiwgdzAsIGxzciAjMTIKPiAgIDRjOgk0YTAyMDA2NiAJ
ZW9yCXc2LCB3MywgdzIKPiAgIDUwOgk0YTA1MDA4MCAJZW9yCXcwLCB3NCwgdzUKPiAgIDU0Ogk0
YTAwMDBjMCAJZW9yCXcwLCB3NiwgdzAKPiAgIDU4OgkyOTAwMTQyNCAJc3RwCXc0LCB3NSwgW3gx
XQo+ICAgNWM6CTI5MDEwODIzIAlzdHAJdzMsIHcyLCBbeDEsICM4XQo+ICAgNjA6CWQ2NWYwM2Mw
IAlyZXQKClRoYXQgaXMgZ2NjLCBjbGFuZyBzZWVtcyB0byBnZW5lcmF0ZSBzb21ldGhpbmcgaG9y
cmlkIChmcm9tIGdvZGJvbHQpLgpJJ20gbm90IHN1cmUgd2hhdCBpdCBoYXMgdHJpZWQgdG8gZG8g
KGFuZCBtYXliZSBpdCBjYW4ndCBpbiBrZXJuZWwpCmJ1dCBpdCBjbGVhcmx5IGRvZXNuJ3QgaGVs
cCEKLkxDUEkwXzA6CiAgICAgICAgLndvcmQgICAxOAogICAgICAgIC53b3JkICAgMgogICAgICAg
IC53b3JkICAgNwogICAgICAgIC53b3JkICAgMTMKLkxDUEkwXzE6CiAgICAgICAgLndvcmQgICA2
CiAgICAgICAgLndvcmQgICAyCiAgICAgICAgLndvcmQgICAxMwogICAgICAgIC53b3JkICAgMwou
TENQSTBfMjoKICAgICAgICAud29yZCAgIDQyOTQ0NDMwMDgKICAgICAgICAud29yZCAgIDQyOTQ5
NjcyNjQKICAgICAgICAud29yZCAgIDQyOTQ5NjUyNDgKICAgICAgICAud29yZCAgIDQyOTM5MTg3
MjAKLkxDUEkwXzM6CiAgICAgICAgLndvcmQgICA0Mjk0OTY3MjgzCiAgICAgICAgLndvcmQgICA0
Mjk0OTY3MjY5CiAgICAgICAgLndvcmQgICA0Mjk0OTY3Mjc1CiAgICAgICAgLndvcmQgICA0Mjk0
OTY3Mjg0CnByYW5kb21fdTMyX3N0YXRlOgogICAgICAgIGFkcnAgICAgeDksIC5MQ1BJMF8xCiAg
ICAgICAgbGRyICAgICBxMCwgW3gwXQogICAgICAgIGFkcnAgICAgeDEwLCAuTENQSTBfMwogICAg
ICAgIGxkciAgICAgcTEsIFt4OSwgOmxvMTI6LkxDUEkwXzFdCiAgICAgICAgYWRycCAgICB4OSwg
LkxDUEkwXzAKICAgICAgICBsZHIgICAgIHEzLCBbeDEwLCA6bG8xMjouTENQSTBfM10KICAgICAg
ICBsZHIgICAgIHEyLCBbeDksIDpsbzEyOi5MQ1BJMF8wXQogICAgICAgIGFkcnAgICAgeDksIC5M
Q1BJMF8yCiAgICAgICAgbW92ICAgICB4OCwgeDAKICAgICAgICB1c2hsICAgIHYxLjRzLCB2MC40
cywgdjEuNHMKICAgICAgICB1c2hsICAgIHYyLjRzLCB2MC40cywgdjIuNHMKICAgICAgICBlb3Ig
ICAgIHYwLjE2YiwgdjEuMTZiLCB2MC4xNmIKICAgICAgICBsZHIgICAgIHExLCBbeDksIDpsbzEy
Oi5MQ1BJMF8yXQogICAgICAgIGFuZCAgICAgdjEuMTZiLCB2Mi4xNmIsIHYxLjE2YgogICAgICAg
IHVzaGwgICAgdjAuNHMsIHYwLjRzLCB2My40cwogICAgICAgIG9yciAgICAgdjAuMTZiLCB2MC4x
NmIsIHYxLjE2YgogICAgICAgIGV4dCAgICAgdjEuMTZiLCB2MC4xNmIsIHYwLjE2YiwgIzgKICAg
ICAgICBzdHIgICAgIHEwLCBbeDhdCiAgICAgICAgZW9yICAgICB2MS44YiwgdjAuOGIsIHYxLjhi
CiAgICAgICAgZm1vdiAgICB4OSwgZDEKICAgICAgICBsc3IgICAgIHgxMCwgeDksICMzMgogICAg
ICAgIGVvciAgICAgdzAsIHc5LCB3MTAKICAgICAgICByZXQKClRoZSB4ODYgdmVyc2lvbnMgYXJl
IGEgbGl0dGxlIGxvbmdlciAoYXJtJ3MgYmFycmVsIHNoaWZ0ZXIgaGVscHMgYSBsb3QpLgoKPiAK
PiA+IEl0J2QgYWxzbyBiZQo+ID4gbmljZSB0byBoYXZlIHNvbWUgYnJpZWYgYW5hbHlzaXMgb2Yg
b3RoZXIgY2FsbCBzaXRlcyB0byBoYXZlCj4gPiBjb25maXJtYXRpb24gdGhpcyBpc24ndCBibG93
aW5nIHVwIG90aGVyIHVzZXJzLiAgCj4gCj4gSSBjb21waWxlZCBkZWZjb25maWcgYmVmb3JlIGFu
ZCBhZnRlciB0aGlzIHBhdGNoIG9uIGFybTY0IGFuZCBjb21wYXJlZCB0aGUgdGV4dAo+IHNpemVz
Ogo+IAo+ICQgLi9zY3JpcHRzL2Jsb2F0LW8tbWV0ZXIgLXQgdm1saW51eC5iZWZvcmUgdm1saW51
eC5hZnRlcgo+IGFkZC9yZW1vdmU6IDMvNCBncm93L3NocmluazogNC8xIHVwL2Rvd246IDgzNi8t
MTI4ICg3MDgpCj4gRnVuY3Rpb24gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
b2xkICAgICBuZXcgICBkZWx0YQo+IHByYW5kb21fc2VlZF9mdWxsX3N0YXRlICAgICAgICAgICAg
ICAgICAgICAgIDM2NCAgICAgOTMyICAgICs1NjgKPiBwaWNrX25leHRfdGFza19mYWlyICAgICAg
ICAgICAgICAgICAgICAgICAgIDE5NDAgICAgMjAzNiAgICAgKzk2Cj4gYnBmX3VzZXJfcm5kX3Uz
MiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMTA0ICAgICAxOTYgICAgICs5Mgo+IHByYW5k
b21fYnl0ZXNfc3RhdGUgICAgICAgICAgICAgICAgICAgICAgICAgIDIwNCAgICAgMjYwICAgICAr
NTYKPiBlODQzNDE5QDBmMmJfMDAwMTJkNjlfZTM0ICAgICAgICAgICAgICAgICAgICAgIC0gICAg
ICAgOCAgICAgICs4Cj4gZTg0MzQxOUAwZGI3XzAwMDEwZWMzXzIzZWMgICAgICAgICAgICAgICAg
ICAgICAtICAgICAgIDggICAgICArOAo+IGU4NDM0MTlAMDJjYl8wMDAwMzc2N18yNWMgICAgICAg
ICAgICAgICAgICAgICAgLSAgICAgICA4ICAgICAgKzgKPiBicGZfcHJvZ19zZWxlY3RfcnVudGlt
ZSAgICAgICAgICAgICAgICAgICAgICA0NDggICAgIDQ0NCAgICAgIC00Cj4gZTg0MzQxOUAwYWEz
XzAwMDBjZmQxXzE1ODAgICAgICAgICAgICAgICAgICAgICA4ICAgICAgIC0gICAgICAtOAo+IGU4
NDM0MTlAMGFhMl8wMDAwY2ZiYV8xNDdjICAgICAgICAgICAgICAgICAgICAgOCAgICAgICAtICAg
ICAgLTgKPiBlODQzNDE5QDA3NWZfMDAwMDhkOGNfMTg0ICAgICAgICAgICAgICAgICAgICAgIDgg
ICAgICAgLSAgICAgIC04Cj4gcHJhbmRvbV91MzJfc3RhdGUgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgMTAwICAgICAgIC0gICAgLTEwMAo+IFRvdGFsOiBCZWZvcmU9MTkwNzgwNzIsIEFmdGVy
PTE5MDc4NzgwLCBjaGcgKzAuMDAlCj4gCj4gU28gNzA4IGJ5dGVzIG1vcmUgYWZ0ZXIgaW5saW5p
bmcuCgpEb2Vzbid0IGxvb2sgbGlrZSB0aGVyZSBhcmUgbWFueSBjYWxscy4KCj4gVGhlIG1haW4g
Y29zdCBpcyBwcmFuZG9tX3NlZWRfZnVsbF9zdGF0ZSgpLAo+IHdoaWNoIGNhbGxzIHByYW5kb21f
dTMyX3N0YXRlKCkgMTAgdGltZXMgKHZpYSBwcmFuZG9tX3dhcm11cCgpKS4gSSBleHBlY3Qgd2UK
PiBjb3VsZCB0dXJuIHRoYXQgaW50byBhIGxvb3AgdG8gcmVkdWNlIH40NTAgYnl0ZXMgb3ZlcmFs
bC4KClRoYXQgd291bGQgYWx3YXlzIGhhdmUgaGVscGVkIHRoZSBjb2RlIHNpemUuCkFuZCBJIHN1
c3BlY3QgdGhlIG90aGVyIGNvc3RzIG9mIHRoYXQgY29kZSBtYWtlIHVucm9sbGluZyB0aGUgbG9v
cCBwb2ludGxlc3MuCgo+IAo+IEknbSBub3QgcmVhbGx5IHN1cmUgaWYgNzA4IGlzIGdvb2Qgb3Ig
YmFkLi4uCj4gCj4gPiAgIAo+ID4+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIHUzMiBwcmFuZG9t
X3UzMl9zdGF0ZShzdHJ1Y3Qgcm5kX3N0YXRlICpzdGF0ZSkgIAo+ID4gCj4gPiBXaHkgbm90IGp1
c3Qgbm9ybWFsIGBpbmxpbmVgPyBJcyBnY2MgZGlzYWdyZWVpbmcgd2l0aCB0aGUgaW5saW5hYmls
aXR5Cj4gPiBvZiB0aGlzIGZ1bmN0aW9uPyAgCj4gCj4gR2l2ZW4gdGhpcyBuZWVkcyB0byBiZSBj
YWxsZWQgZnJvbSBhIG5vaW5zdHIgZnVuY3Rpb24sIEkgZGlkbid0IHdhbnQgdG8gZ2l2ZSB0aGUK
PiBjb21waWxlciB0aGUgb3Bwb3J0dW5pdHkgdG8gZGVjaWRlIG5vdCB0byBpbmxpbmUgaXQsIHNp
bmNlIGluIHRoYXQgY2FzZSwgc29tZQo+IGluc3RydW1lbnRhdGlvbiBtaWdodCBlbmQgdXAgYmVp
bmcgYXBwbGllZCB0byB0aGUgZnVuY3Rpb24gYm9keSB3aGljaCB3b3VsZCBibG93Cj4gdXAgd2hl
biBjYWxsZWQgaW4gdGhlIG5vaW5zdHIgY29udGV4dC4KPiAKPiBJIHRoaW5rIHRoZSBvdGhlciAy
IG9wdGlvbnMgYXJlIHRvIGtlZXAgcHJhbmRvbV91MzJfc3RhdGUoKSBpbiB0aGUgYyBmaWxlIGJ1
dAo+IG1hcmsgaXQgbm9pbnN0ciBvciByZWFycmFuZ2UgYWxsIHRoZSB1c2VycyBzbyB0aGF0IHRo
YXkgZG9uJ3QgY2FsbCBpdCB1bnRpbAo+IGluc3RydW1lbnRhdGlvbiBpcyBhbGxvd2FibGUuIFRo
ZSBsYXR0ZXIgaXMgc29tZXRoaW5nIEkgd2FzIHRyeWluZyB0byBhdm9pZC4KPiAKPiBUaGVyZSBp
cyBzb21lIHByZXZpb3VzIGRpc2N1c3Npb24gb2YgdGhpcyBhdCBbMV0uCj4gCj4gWzFdIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC9hUzY1TEZVZmRnUlBLdjFsQEoyTjdRVFI5UjMvCj4gCj4g
UGVyaGFwcyBrZWVwaW5nIHByYW5kb21fdTMyX3N0YXRlKCkgaW4gdGhlIGMgZmlsZSBhbmQgbWFr
aW5nIGl0IG5vaW5zdHIgaXMgdGhlCj4gYmVzdCBjb21wcm9taXNlPwoKT3IgZGVmaW5lIHByYW5k
b21fdTMyX3N0YXRlX2lubGluZSgpIGFzIGFsd2F5c19pbmxpbmUgYW5kIGhhdmUgdGhlCnJlYWwg
ZnVuY3Rpb246CnUzMiBwcmFuZG9tX3UzMl9zdGF0ZShzdHJ1Y3Qgcm5kX3N0YXRlICpzdGF0ZSkK
ewoJcmV0dXJuIHByYW5kb21fdTMyX3N0YXRlX2lubGluZShzdGF0ZSk7Cn0KClNvIHRoYXQgdGhl
IGNhbGxlcnMgY2FuIHBpY2sgdGhlIGlubGluZSB2ZXJzaW9uIGlmIGl0IHJlYWxseSBtYXR0ZXJz
LgoKCURhdmlkCgo+IAo+IFRoYW5rcywKPiBSeWFuCj4gCj4gPiAKPiA+IEphc29uICAKPiAKPiAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
