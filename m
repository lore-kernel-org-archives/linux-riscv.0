Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF567C001CC
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 17:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yqfQRtDO257WiaegE34oS1vYzlEDQlZrVFYqQ7r/6o8=; b=iYKa32+LfkXqV1
	5kFHCZqabKrwPlybLlZ6bfqBJE7kmwszVr2FuliSH2rrX7FDwH9j6kuLoUPjGIcXbBkbdPJC/CosZ
	QuThwUfWvBGE8f4lYpUmG8qcZLuMwijLxOjGNeb2eNJFjzDFLmRAz8bSlw9OxdNt7xLc4q6xX6RKm
	31cdRJHUGAAlBx1gzHIQ9R0zoNUklPEhATTFuukbLCoU5aaA8ljB867ZfwJjp5qwsyPFlAz8JId6O
	rdyF0bvrUwNjutne3cMHTX9UU1q0LeEX8/upacD0vZyKsB1cQql0L5mkWjEyw6hDn0smV0oQwjSKm
	RzAXW0abIm9GiSypnwjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruy4O-0000000DKgs-0nFM;
	Thu, 11 Apr 2024 17:18:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwuh-0000000CvED-0d9Y;
	Thu, 11 Apr 2024 16:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lhsv45r1t4Tm+Nf53YDSZFCWV2ksRDlGBGes39kXPmM=; b=mTUvaTc1IBK+GrXX73LCGHGnP4
	l9T5OTB0yVP/L8kcu5C8eFvDtWtl/gSkCZVmk8q8z8lwmTRUA1ftfiyk69GeJAgMTWEKb/49Hu+5L
	LHqH5nffAjYpeO3SYRUbLFwWBK/54cTAeQaVXGnqbLugqxgV2Yd/XH2iN/fL2XH8lp/9P0Mr34Zig
	CDeOc+zxe4xMbtGlikOp4/V0lTgkLvAMG6uXUTpYlhb1IZK8OEr9DOEXSoFfxE8dSRPMGv/rB6hbF
	HFCndK8hCrjHzvfK6j9kDkWWtKfl42iFzALSrILBKiNVd7XtEorIL3Mxef0vsEPw2NvGxsSiShNJD
	lOgq4gHw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwuc-00000008h30-3Zif;
	Thu, 11 Apr 2024 16:04:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F350F620E6;
	Thu, 11 Apr 2024 16:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1098C113CD;
	Thu, 11 Apr 2024 16:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712851461;
	bh=+AOj3OMDSB3feHYUPdQfVhUVtDWDdcImqVlO1v4xpng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SxJIf0UPAU/LSJIdhd5VJkQ97hM+Vopgra/mjrFIBCe+cviCEtH8l//T3816NvlXD
	 JNi13TTDCZkr1Fg3WXdPtQ+MZRUJwf1k1qRoeQyxufSwG+h+JZeR8/tvkEBGc8TcVR
	 4kRT3j5Stzw4SWMef8fiEbIX6jEtbDFYCl6VOLTAE7qUe+BaJYoN70qBRU9UyVdRdK
	 SnPe3YHBtYQkdMJyF6t+OlokdAyToH6ZaN+xGGpQSe+9dEZuQCdf7HQ8nt9T2j9jQX
	 o3VlR73dRPQLNATQXpf1b4JuRSG48Vtoma+TPIBkV3i2OZl6wAJsdHYuvFMkZ7Tt+a
	 /PvhAgJJc2OoQ==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Donald Dutile <ddutile@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Nadav Amit <nadav.amit@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	netdev@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v4 15/15] bpf: remove CONFIG_BPF_JIT dependency on CONFIG_MODULES of
Date: Thu, 11 Apr 2024 19:00:51 +0300
Message-ID: <20240411160051.2093261-16-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240411160051.2093261-1-rppt@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_170431_135003_35CC8D20 
X-CRM114-Status: GOOD (  13.83  )
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

RnJvbTogIk1pa2UgUmFwb3BvcnQgKElCTSkiIDxycHB0QGtlcm5lbC5vcmc+CgpCUEYganVzdC1p
bi10aW1lIGNvbXBpbGVyIGRlcGVuZGVkIG9uIENPTkZJR19NT0RVTEVTIGJlY2F1c2UgaXQgdXNl
ZAptb2R1bGVfYWxsb2MoKSB0byBhbGxvY2F0ZSBtZW1vcnkgZm9yIHRoZSBnZW5lcmF0ZWQgY29k
ZS4KClNpbmNlIGNvZGUgYWxsb2NhdGlvbnMgYXJlIG5vdyBpbXBsZW1lbnRlZCB3aXRoIGV4ZWNt
ZW0sIGRyb3AgZGVwZW5kZW5jeSBvZgpDT05GSUdfQlBGX0pJVCBvbiBDT05GSUdfTU9EVUxFUyBh
bmQgbWFrZSBpdCBzZWxlY3QgQ09ORklHX0VYRUNNRU0uCgpTdWdnZXN0ZWQtYnk6IEJqw7ZybiBU
w7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgKElC
TSkgPHJwcHRAa2VybmVsLm9yZz4KLS0tCiBrZXJuZWwvYnBmL0tjb25maWcgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9r
ZXJuZWwvYnBmL0tjb25maWcgYi9rZXJuZWwvYnBmL0tjb25maWcKaW5kZXggYmMyNWY1MDk4YTI1
Li5mOTk5ZTRlMGIzNDQgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9icGYvS2NvbmZpZworKysgYi9rZXJu
ZWwvYnBmL0tjb25maWcKQEAgLTQzLDcgKzQzLDcgQEAgY29uZmlnIEJQRl9KSVQKIAlib29sICJF
bmFibGUgQlBGIEp1c3QgSW4gVGltZSBjb21waWxlciIKIAlkZXBlbmRzIG9uIEJQRgogCWRlcGVu
ZHMgb24gSEFWRV9DQlBGX0pJVCB8fCBIQVZFX0VCUEZfSklUCi0JZGVwZW5kcyBvbiBNT0RVTEVT
CisJc2VsZWN0IEVYRUNNRU0KIAloZWxwCiAJICBCUEYgcHJvZ3JhbXMgYXJlIG5vcm1hbGx5IGhh
bmRsZWQgYnkgYSBCUEYgaW50ZXJwcmV0ZXIuIFRoaXMgb3B0aW9uCiAJICBhbGxvd3MgdGhlIGtl
cm5lbCB0byBnZW5lcmF0ZSBuYXRpdmUgY29kZSB3aGVuIGEgcHJvZ3JhbSBpcyBsb2FkZWQKLS0g
CjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
