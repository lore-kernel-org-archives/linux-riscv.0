Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409B8D41D68
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Dec 2025 17:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fCtkHpxhr+y7BA3Hrw+YuywOJloSLUKJDMdfZpYISnI=; b=YbU9Pd1ETv3XlG
	pXn9LsL69FucZzjYGJw1t3zb1eR3q5cogcoC41AdMXknJfXpNiPktfUfWkBq1msa6YNO30SgwwKaW
	w6c4hnS1x3DKDta+koYSl9nkT4bRBEEmNLRznkJ3CmDayO2r+4AG8lnnXUXJ3JAj6HLkjaUgQQoxy
	CpCScCMVT+yOaFpL415e3wMlOVwOoNMscTM1D9s3PbzDJpfeo26DkdPdZGrHto6T+yBer8RCV65GV
	1e9GGqN1PvNY6y7ItUGiqatGsaFYDkEZTAwe7u1kDLpQd6QCazGJG7qdanhW968ooXXvMfoCKdsey
	g0HC7qWEBImxQUX6cs1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTkEH-0000000H0y6-0JBk;
	Thu, 11 Dec 2025 17:13:25 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTkEE-0000000H0xg-05Ea
	for linux-riscv@lists.infradead.org;
	Thu, 11 Dec 2025 17:13:23 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-640f88b8613so283149d50.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Dec 2025 09:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1765473200; x=1766078000; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgsqjP5OdKf2pfViq8wHSszLchDHEA8k2q0YnXN+A5g=;
        b=XhfiwheXNS+ja6aQ17eXlZa9RqkxGluI7ZgDO4WsMRGiH94cklRqJA9rrftqZc2+Oy
         4voJ2cUOPNYE6UsTow1KOFGpHhkSMHOrPrfVRu+IqSOOvwDnGV/DrmrojJ2esUDYywNQ
         sd2BmmkD+ioMzIRNW0YEGk6zjf9Nj8jBV+snLshGbrAL7Ugm9nBOd4npr9G76I4YTEfG
         iFOMgwP2lJaSX0nOKsZRFCURKJgrWNMoSwEAHtqddkWydHwI4xavpXtFxigza/SkU3FI
         Mv1h57XK8gzA+lLX1Fx4mvm2V+urzx4SIkCjNhU9b5RIRBe0UL4HaLN0MPK1EM6Z3qyy
         Z0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765473200; x=1766078000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XgsqjP5OdKf2pfViq8wHSszLchDHEA8k2q0YnXN+A5g=;
        b=eqiaJFUOv3Cd6Chpx/cxxEQ+1ArrTEmCTk67l5NqPRKYRGUrPqr9qes5XCOPwhjMVI
         ePuTG4q+TIVyeIOmWfOVCiK1LAlIh5zsGTBAskTYNpzbwgrqt0OQ4taczO0l+ctOuy+n
         NUOToTfFWLBaBavqp1sKkys5Uf+5Zme1wnjsgUe6N1JbDDdcJeFryPAdjYQ7f/G4TTD/
         wi9BnQpUbg6IejHZ82/dywy32o6PmHna06Wf1qOlfeFVi4Z77/q30oB7rRTtbkc6GxnD
         saTIlK938MAbkuNqPur3Uqetvn4cwvGI3Cu2NfI5FQmwKnTUefpKElqWel2I5cTyPqtx
         xD7A==
X-Forwarded-Encrypted: i=1; AJvYcCWWx92neiCp8z43PVN+8E8njQvYU6RNQiMGPsHk0caGXYlj3c+Hey5c2F5MziVcRHfxUJ5L7Rp0nuy/CQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUZVrQGH6e9BfeDZ4QT0aYzvxTufHyNp8ybrrm3/I4LwZ4rKr1
	ovusdk6TmjwEfF9JwbiZeUlVxJOLPeMk/IOsPM3YpV/vGN/rWMryeQtPD9O/DDOhmA3foomPBDU
	HSdgIufUlEM9MfcivReV17eXOIMBTavpNWIsbjEYqlA==
X-Gm-Gg: AY/fxX4QwMpNZzbHbd09bIMprfvxQ1wF9hwfklVRvf3MMOYZHlaoMqzbS+65Aioa2CE
	NWP3tsYHpUY12EpXwbdVvIuSi9NCW9K48w6mNCIEKuJT/ugSeI3+KoAJ9KXYowgeX4g5xzBH7vX
	2F3t3ONhQZt43HgwwhIXCXL+iQL5FqBO6riXJqnnE6z0mY0pgMeNulqNUQPKj8jRveZ3/xYUaCL
	gejE5ECkgvCONjk8JtnwnkUEtz6BTiV9iElOARiz6Tm5uwdaMih6ez8C4fXXn0DmX50miNO
X-Google-Smtp-Source: AGHT+IEDvxO44/POz7bnaB+zrKXCNOOS/WPSTW3GIVXm1upC0YATz2kq4R7kn6XsCe0YNeacKDOWMUqKTxb574ExUiM=
X-Received: by 2002:a05:690e:2514:20b0:63b:8e09:7a47 with SMTP id
 956f58d0204a3-6446e97b295mr4684556d50.19.1765473200251; Thu, 11 Dec 2025
 09:13:20 -0800 (PST)
MIME-Version: 1.0
References: <20251205-v5_user_cfi_series-v25-0-1a07c0127361@rivosinc.com>
 <20251205-v5_user_cfi_series-v25-6-1a07c0127361@rivosinc.com> <b2acb9ca-1320-ab42-3937-2ea17153fac2@kernel.org>
In-Reply-To: <b2acb9ca-1320-ab42-3937-2ea17153fac2@kernel.org>
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 11 Dec 2025 09:13:01 -0800
X-Gm-Features: AQt7F2rXBhYBRubaxsEthZTktAJEjMnbT8BXdFrJ84aaWwsz26es8ubAplXa-kc
Message-ID: <CAKC1njTfn-5ZeAV7x5819kXUqitVgO0HkKQi1S6UvZyiuroxvg@mail.gmail.com>
Subject: Re: [PATCH v25 06/28] riscv/mm : ensure PROT_WRITE leads to VM_READ | VM_WRITE
To: Paul Walmsley <pjw@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	rust-for-linux@vger.kernel.org, Zong Li <zong.li@sifive.com>, 
	Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
	Valentin Haudiquet <valentin.haudiquet@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_091322_241830_2785414B 
X-CRM114-Status: GOOD (  16.20  )
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

T24gVGh1LCBEZWMgMTEsIDIwMjUgYXQgMTI6NDfigK9BTSBQYXVsIFdhbG1zbGV5IDxwandAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIDUgRGVjIDIwMjUsIERlZXBhayBHdXB0YSB2aWEg
QjQgUmVsYXkgd3JvdGU6Cj4KPiA+IEZyb206IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMu
Y29tPgo+ID4KPiA+IGBhcmNoX2NhbGNfdm1fcHJvdF9iaXRzYCBpcyBpbXBsZW1lbnRlZCBvbiBy
aXNjLXYgdG8gcmV0dXJuIFZNX1JFQUQgfAo+ID4gVk1fV1JJVEUgaWYgUFJPVF9XUklURSBpcyBz
cGVjaWZpZWQuIFNpbWlsYXJseSBgcmlzY3Zfc3lzX21tYXBgIGlzCj4gPiB1cGRhdGVkIHRvIGNv
bnZlcnQgYWxsIGluY29taW5nIFBST1RfV1JJVEUgdG8gKFBST1RfV1JJVEUgfCBQUk9UX1JFQUQp
Lgo+ID4gVGhpcyBpcyB0byBtYWtlIHN1cmUgdGhhdCBhbnkgZXhpc3RpbmcgYXBwcyB1c2luZyBQ
Uk9UX1dSSVRFIHN0aWxsIHdvcmsuCj4gPgo+ID4gRWFybGllciBgcHJvdGVjdGlvbl9tYXBbVk1f
V1JJVEVdYCB1c2VkIHRvIHBpY2sgcmVhZC13cml0ZSBQVEUgZW5jb2RpbmdzLgo+ID4gTm93IGBw
cm90ZWN0aW9uX21hcFtWTV9XUklURV1gIHdpbGwgYWx3YXlzIHBpY2sgUEFHRV9TSEFET1dTVEFD
SyBQVEUKPiA+IGVuY29kaW5ncyBmb3Igc2hhZG93IHN0YWNrLiBBYm92ZSBjaGFuZ2VzIGVuc3Vy
ZSB0aGF0IGV4aXN0aW5nIGFwcHMKPiA+IGNvbnRpbnVlIHRvIHdvcmsgYmVjYXVzZSB1bmRlcm5l
YXRoIGtlcm5lbCB3aWxsIGJlIHBpY2tpbmcKPiA+IGBwcm90ZWN0aW9uX21hcFtWTV9XUklURXxW
TV9SRUFEXWAgUFRFIGVuY29kaW5ncy4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogWm9uZyBMaSA8em9u
Zy5saUBzaWZpdmUuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRA
YXJuZGIuZGU+Cj4KPiBUaGlzIFNpZ25lZC1vZmYtYnk6IGRvZXNuJ3QgbG9vayByaWdodC4gIEl0
IGRvZXNuJ3QgbG9vayBsaWtlIEFybmQKPiBkZXZlbG9wZWQgdGhpcyBwYXRjaCwgYW5kIGl0IGRv
ZXNuJ3QgYXBwZWFyIHRoYXQgaGUgcmVwbGllZCB3aXRoIGEKPiBTaWduZWQtb2ZmLWJ5OiB0byB0
aGUgbGlzdCByZWdhcmRpbmcgYSBwYXRjaCB0aGF0IHlvdSB3cm90ZS4gIERpZCBJIG1pc3MKPiBp
dD8gIERpZCB5b3UgbWVhbiBDby1kZXZlbG9wZWQtYnk6IG9yIHNvbWUgb3RoZXIgdGFnPwo+CgpT
ZWVtcyBsaWtlIGI0IG1lc3NlZCBpdCB1cC4gSSdsbCBmaXggaXQgdXAuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
