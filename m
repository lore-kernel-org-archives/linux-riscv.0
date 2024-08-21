Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045E2C52D6F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 18:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j2ZFaVGoBiLUYFPfu+ee1SGou8IGYRIFGCIcsFFYqoc=; b=YXTPIag+JK70BV
	Ak8mm7v2K7K8esmsZKmICbWgBQVtVZBZy6C7P0WW3+rsnXfBdiQofx7LfBuzIEjREQqAZwZ7b6rg2
	cIngAR9QgEqAzCm8n2uftdKOMpjpUCx1v031SPcsbu0WIKcwiYhSvcjn+u8e6pjUDKPLTPT2gr+8g
	u5hxQ/XfZyYmCdFAljBiagDtK4depBTJb0LqWbqSejCVTeondULcjRne0elxy7hc7nZcWr9a075Mn
	59UozT31L9xbkii7iMOGKoswCfSp8R/iJ/4z0ETzoZDKkQ908zc0MRo1A/gyv0eGgUIZm4pmrtkfQ
	kczX65NmtBYCRS2PE5Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgpt1-0000000A2ZK-2zu0;
	Wed, 21 Aug 2024 18:16:47 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgpsx-0000000A2YC-0Z5i;
	Wed, 21 Aug 2024 18:16:44 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-44fff73f223so105811cf.2;
        Wed, 21 Aug 2024 11:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724264201; x=1724869001; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sG1wp5ENtjpkC5FIqQpPJO0RYHtQ0kKqwcDpDZ1g0uo=;
        b=YoMVtroDdYfOJQXfwbBE/iy4wQKq/5r+48ivHrg3Z/t2DXmPReZERj/rfsVn3dLF32
         36wI7oCpCUF/zB4/CLaOkcgRZUMVn315RS3RHYUhny2SUoCiERojtqhuUWxCiYv66wvN
         0fowVdxbtNd6I427e59MBUdqIXp4h3Ic7jRvM25bPwNFbihLQhX+F0ADh47iYBKoBcTo
         lOytiWj0kMLwZRgbdEk5c837CyxKNGBGx2jeocZQK2Yy2tuZiWIf4NdRG8TXpbijgiwI
         Z8G4YTFKPwdTd+gmP98XuLqovvIu7qzRFmPBMi2xpYtKbGiR9pTnmyxZqDuMTOuJCzbP
         tm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724264201; x=1724869001;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sG1wp5ENtjpkC5FIqQpPJO0RYHtQ0kKqwcDpDZ1g0uo=;
        b=ZnOslVXWXiWs0bdtutBJKO/LbjCVDux1IuNvsCcfY1wIebc8Tq0goVJh8yLAjQmnDx
         mreWe5Q0R6fnschu6R2uUas8qusK74758Erl4k3hhUAIcRKQtNt9V7smOaRUAROszcye
         bRT6UfA/oyOUiIymBcqICShT9vR+ZAbcpeHacOfAEsDkuPFhvEuF5R96RINw3Sc3HTKP
         2vbQ3T/FmbayFOH5wh/tB7cYpzdVTsbw/ipFRPo0QVp+K5OoY047sWBp1HhtHFKmMXg3
         M0j8xpXZJ6KWAGV4kwx3zBm9z5zp2OUqfm8w5RBiejFrHo7fkmGrKKwR11Qwmft+HBNx
         uNdg==
X-Forwarded-Encrypted: i=1; AJvYcCUT1ueihKIvs4AYD0DucWnT5GB+m5q92+KaBg7jflETBRYDO7mEH+Q9U5QiOyqpYYzp+SfBbzm7XX5gTWqQ9v61@lists.infradead.org, AJvYcCVJHDNIVEkmieFwdwzng07MFzLXqUWm1bEsbglKW1Drft6K/vh/hWVT4c/f8RnlGmiaD1PqEsjmj/nz6zQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzuwb0a4zeamZLtBL0dc3iwvq0sEg2SZrEhB17LFQ24AOZoQ8Il
	tuBQIpoIb4cspbgSJU9ztHr31ue4tWVp+p+kR4F0EIOWysnxlTHn
X-Google-Smtp-Source: AGHT+IEmIudWwUZSOHrAG/eup+YcE8K3ibS5ReEgFCUmkDy3yMOQddDLaWBfo/D6lfVEz1iolaNsRQ==
X-Received: by 2002:a05:622a:4c87:b0:447:e542:ab00 with SMTP id d75a77b69052e-454f2572a5bmr39175031cf.50.1724264201152;
        Wed, 21 Aug 2024 11:16:41 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45369ff5348sm61597621cf.32.2024.08.21.11.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 11:16:41 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.nyi.internal [10.202.2.41])
	by mailfauth.nyi.internal (Postfix) with ESMTP id D2D001200068;
	Wed, 21 Aug 2024 14:16:38 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 21 Aug 2024 14:16:38 -0400
X-ME-Sender: <xms:Bi_GZjkYOU0_uPVPB7K8kPU5t6uwe1a7iRrD-8l2b4FwhEEHvPWNqA>
    <xme:Bi_GZm2ilDewDM48ADFZyAyLkN8ETYp8o2kgHXVk2M3oH1XV2KSY8l8XSHpaXSdPi
    vUWJDJ9vpJCTKTtBQ>
X-ME-Received: <xmr:Bi_GZppuE27zSpGhNm_MKiRYFzIueXaa6Olt3HDwdTYkHLAy97t7mvl_E4M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddukedguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeevgffhueevkedutefgveduuedujeefledt
    hffgheegkeekiefgudekhffggeelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepheegpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehmihhguhgvlhdrohhjvggurgdrshgrnh
    guohhnihhssehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlihgtvghrhihhlhesghho
    ohhglhgvrdgtohhmpdhrtghpthhtoheprhhoshhtvgguthesghhoohgumhhishdrohhrgh
    dprhgtphhtthhopehmhhhirhgrmhgrtheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    mhgrthhhihgvuhdruggvshhnohihvghrshesvghffhhitghiohhsrdgtohhmpdhrtghpth
    htohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepjhhpohhi
    mhgsohgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjsggrrhhonhesrghkrghmrg
    hirdgtohhmpdhrtghpthhtoheprghruggssehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Bi_GZrnffxrLWDEUyOfAuK4X7MxRHl41DuNXEXwU9qN7EOxG4IC8rw>
    <xmx:Bi_GZh08QhTMZZDvPplmdtt8yUAyIg0RVUC7Hs34ECG-0ApoLpa8Lw>
    <xmx:Bi_GZqtC2DOqemnStVjIsc28f6yLb0riAR4qzKHtDsMZ3qIXiCyfOg>
    <xmx:Bi_GZlWWO5FFsKpoIG5v09YA8ZfPbtyqcLKXJfL7WsrB9b0kzX0aXg>
    <xmx:Bi_GZg0tfLSerjrQuTHq9tMZrxOF1nPbYUVoJWR9XLUkCH6bFCPKKA61>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Aug 2024 14:16:38 -0400 (EDT)
Date: Wed, 21 Aug 2024 11:16:32 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,	Jason Baron <jbaron@akamai.com>,
 Ard Biesheuvel <ardb@kernel.org>,	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,	Uros Bizjak <ubizjak@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,	Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>,	Oliver Upton <oliver.upton@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,	Ryan Roberts <ryan.roberts@arm.com>,
 Fuad Tabba <tabba@google.com>,	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev
Subject: Re: [PATCH v7 5/5] rust: add arch_static_branch
Message-ID: <ZsYvAJbGB8qUcjXA@boqun-archlinux>
References: <20240816-tracepoint-v7-0-d609b916b819@google.com>
 <20240816-tracepoint-v7-5-d609b916b819@google.com>
 <ZsYfAFrBFVewchGM@boqun-archlinux>
 <CANiq72np8GhZ4V22b7RekvQOhCbM67A-19Px2aVLgweC4Qxebg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiq72np8GhZ4V22b7RekvQOhCbM67A-19Px2aVLgweC4Qxebg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_111643_202902_164F65E0 
X-CRM114-Status: GOOD (  23.98  )
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

T24gV2VkLCBBdWcgMjEsIDIwMjQgYXQgMDc6NTQ6NTFQTSArMDIwMCwgTWlndWVsIE9qZWRhIHdy
b3RlOgo+IE9uIFdlZCwgQXVnIDIxLCAyMDI0IGF0IDc6MDjigK9QTSBCb3F1biBGZW5nIDxib3F1
bi5mZW5nQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGF2ZSB5b3UgdHJ5IHRoaXMgd2l0aCAi
bWFrZSBPPTxkaXI+Ij8gSSBoaXQgdGhlIGZvbGxvd2luZyBpc3N1ZSwgYnV0IEkKPiA+IGFtIHJl
YmFzaW5nIG9uIHJ1c3QtZGV2LCBzbyBJIG1pZ2h0IG1pc3Mgc29tZXRoaW5nOgo+ID4KPiA+ICAg
ICAgICAgZXJyb3I6IGNvdWxkbid0IHJlYWQgLi4vcnVzdC9rZXJuZWwvYXJjaF9zdGF0aWNfYnJh
bmNoX2FzbS5yczogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeSAob3MgZXJyb3IgMikKPiA+ICAg
ICAgICAgICAtLT4gLi4vcnVzdC9rZXJuZWwvanVtcF9sYWJlbC5yczozOToxNwo+ID4gICAgICAg
ICAgICB8Cj4gPiAgICAgICAgIDM5IHwgY29uc3QgXzogJnN0ciA9IGluY2x1ZGUhKCJhcmNoX3N0
YXRpY19icmFuY2hfYXNtLnJzIik7Cj4gPiAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgIF5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl4KPiA+ICAgICAgICAgICAgfAo+ID4g
ICAgICAgICAgICA9IG5vdGU6IHRoaXMgZXJyb3Igb3JpZ2luYXRlcyBpbiB0aGUgbWFjcm8gYGlu
Y2x1ZGVgIChpbiBOaWdodGx5IGJ1aWxkcywgcnVuIHdpdGggLVogbWFjcm8tYmFja3RyYWNlIGZv
ciBtb3JlIGluZm8pCj4gPgo+ID4gICAgICAgICBlcnJvcjogYWJvcnRpbmcgZHVlIHRvIDEgcHJl
dmlvdXMgZXJyb3IKPiAKPiBZZWFoLCB3ZSBzaG91bGQgdXNlIGEgYCpUUkVFYCBldmVyeXdoZXJl
LiBJbiBhZGRpdGlvbiwgd2Ugc2hvdWxkIG5vdAo+IHVzZSBgU1JDVFJFRWAgYnV0IGBPQkpUUkVF
YC4gSXQgaXMgbXkgZmF1bHQsIHRoaXMgY29tZXMgZnJvbSBteQo+IHByb3RvdHlwZSBJIGdhdmUg
QWxpY2UuCj4gCj4gUGxlYXNlIHNlZSB0aGUgYXR0YWNoZWQgZGlmZi4KPiAKClllcywgdGhpcyBm
aXggd29ya3MsIHRoYW5rcyEKClJlZ2FyZHMsCkJvcXVuCgo+IENoZWVycywKPiBNaWd1ZWwKCj4g
ZGlmZiAtLWdpdCBhL3J1c3Qva2VybmVsL2p1bXBfbGFiZWwucnMgYi9ydXN0L2tlcm5lbC9qdW1w
X2xhYmVsLnJzCj4gaW5kZXggNzc1N2U0ZjhlODVlLi5jY2ZkMjA1ODljMjEgMTAwNjQ0Cj4gLS0t
IGEvcnVzdC9rZXJuZWwvanVtcF9sYWJlbC5ycwo+ICsrKyBiL3J1c3Qva2VybmVsL2p1bXBfbGFi
ZWwucnMKPiBAQCAtMzYsNyArMzYsNyBAQCBtYWNyb19ydWxlcyEgc3RhdGljX2tleV9mYWxzZSB7
Cj4gCj4gIC8vLyBBc3NlcnQgdGhhdCB0aGUgYXNzZW1ibHkgYmxvY2sgZXZhbHVhdGVzIHRvIGEg
c3RyaW5nIGxpdGVyYWwuCj4gICNbY2ZnKENPTkZJR19KVU1QX0xBQkVMKV0KPiAtY29uc3QgXzog
JnN0ciA9IGluY2x1ZGUhKCJhcmNoX3N0YXRpY19icmFuY2hfYXNtLnJzIik7Cj4gK2NvbnN0IF86
ICZzdHIgPSBpbmNsdWRlIShjb25jYXQhKGVudiEoIk9CSlRSRUUiKSwgIi9ydXN0L2tlcm5lbC9h
cmNoX3N0YXRpY19icmFuY2hfYXNtLnJzIikpOwo+IAo+ICAjW21hY3JvX2V4cG9ydF0KPiAgI1tk
b2MoaGlkZGVuKV0KPiBAQCAtNDUsNyArNDUsNyBAQCBtYWNyb19ydWxlcyEgc3RhdGljX2tleV9m
YWxzZSB7Cj4gIG1hY3JvX3J1bGVzISBhcmNoX3N0YXRpY19icmFuY2ggewo+ICAgICAgKCRrZXk6
cGF0aCwgJGtleXR5cDp0eSwgJGZpZWxkOmlkZW50LCAkYnJhbmNoOmV4cHIpID0+IHsnbXlfbGFi
ZWw6IHsKPiAgICAgICAgICAkY3JhdGU6OmFzbSEoCj4gLSAgICAgICAgICAgIGluY2x1ZGUhKGNv
bmNhdCEoZW52ISgiU1JDVFJFRSIpLCAiL3J1c3Qva2VybmVsL2FyY2hfc3RhdGljX2JyYW5jaF9h
c20ucnMiKSk7Cj4gKyAgICAgICAgICAgIGluY2x1ZGUhKGNvbmNhdCEoZW52ISgiT0JKVFJFRSIp
LCAiL3J1c3Qva2VybmVsL2FyY2hfc3RhdGljX2JyYW5jaF9hc20ucnMiKSk7Cj4gICAgICAgICAg
ICAgIGxfeWVzID0gbGFiZWwgewo+ICAgICAgICAgICAgICAgICAgYnJlYWsgJ215X2xhYmVsIHRy
dWU7Cj4gICAgICAgICAgICAgIH0sCj4gQEAgLTY1LDcgKzY1LDcgQEAgbWFjcm9fcnVsZXMhIGFy
Y2hfc3RhdGljX2JyYW5jaCB7Cj4gIG1hY3JvX3J1bGVzISBhcmNoX3N0YXRpY19icmFuY2ggewo+
ICAgICAgKCRrZXk6cGF0aCwgJGtleXR5cDp0eSwgJGZpZWxkOmlkZW50LCAkYnJhbmNoOmV4cHIp
ID0+IHsnbXlfbGFiZWw6IHsKPiAgICAgICAgICAkY3JhdGU6OmFzbSEoCj4gLSAgICAgICAgICAg
IGluY2x1ZGUhKGNvbmNhdCEoZW52ISgiU1JDVFJFRSIpLCAiL3J1c3Qva2VybmVsL2FyY2hfc3Rh
dGljX2JyYW5jaF9hc20ucnMiKSk7Cj4gKyAgICAgICAgICAgIGluY2x1ZGUhKGNvbmNhdCEoZW52
ISgiT0JKVFJFRSIpLCAiL3J1c3Qva2VybmVsL2FyY2hfc3RhdGljX2JyYW5jaF9hc20ucnMiKSk7
Cj4gICAgICAgICAgICAgIGxfeWVzID0gbGFiZWwgewo+ICAgICAgICAgICAgICAgICAgYnJlYWsg
J215X2xhYmVsIHRydWU7Cj4gICAgICAgICAgICAgIH0sCj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMv
TWFrZWZpbGUuYnVpbGQgYi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkCj4gaW5kZXggNGYwZjZiMTNl
YmQ3Li43NDZjY2U4MDU0NWYgMTAwNjQ0Cj4gLS0tIGEvc2NyaXB0cy9NYWtlZmlsZS5idWlsZAo+
ICsrKyBiL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQKPiBAQCAtMjY5LDcgKzI2OSw3IEBAIHJ1c3Rf
YWxsb3dlZF9mZWF0dXJlcyA6PSBhc21fY29uc3QsYXNtX2dvdG8sbmV3X3VuaW5pdAo+ICAjIGN1
cnJlbnQgd29ya2luZyBkaXJlY3RvcnksIHdoaWNoIG1heSBiZSBub3QgYWNjZXNzaWJsZSBpbiB0
aGUgb3V0LW9mLXRyZWUKPiAgIyBtb2R1bGVzIGNhc2UuCj4gIHJ1c3RfY29tbW9uX2NtZCA9IFwK
PiAtCVNSQ1RSRUU9JChhYnNwYXRoICQoc3JjdHJlZSkpIFwKPiArCU9CSlRSRUU9JChhYnNwYXRo
ICQob2JqdHJlZSkpIFwKPiAgCVJVU1RfTU9ERklMRT0kKG1vZGZpbGUpICQoUlVTVENfT1JfQ0xJ
UFBZKSAkKHJ1c3RfZmxhZ3MpIFwKPiAgCS1aYWxsb3ctZmVhdHVyZXM9JChydXN0X2FsbG93ZWRf
ZmVhdHVyZXMpIFwKPiAgCS1aY3JhdGUtYXR0cj1ub19zdGQgXAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
