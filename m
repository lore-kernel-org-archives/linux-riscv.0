Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE88C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 12:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yqfQRtDO257WiaegE34oS1vYzlEDQlZrVFYqQ7r/6o8=; b=NKvo2u4oV/092/
	luNE+G5CaHCUUUUOJSz9Dcupa1VYtvHTybjvDk/yaGRovMP/HpUtF+kPtZZT8DPhBHzv5BXaErDR1
	NlcdMCGobyRuCd+M7uwiTeLjqWzBYSyRS5aXFzrPSiYCEmLIqCzkec9oAipOvGElGX6ZL3Doq/HQC
	Ucg9vkCIPLKhD0fiurQJNzhPXL/M2M0oyozVjLrPitBuvBgIOy1L2AnX/4JCmOF01fbzEweMCpKSX
	WqppcoiRjB681F0kipWpsYVAxxpmL0MflpgHExIdbwUgUT69/x18zfVX8FFDQXy8Rl7+9sy32I/mb
	bv9xTquW0n4Iqxjy0KJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Q08-00000002hCS-1eGe;
	Mon, 29 Apr 2024 12:20:56 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Pyx-00000002gRM-0rkr;
	Mon, 29 Apr 2024 12:19:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 39BBECE0A59;
	Mon, 29 Apr 2024 12:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FDEC4AF1A;
	Mon, 29 Apr 2024 12:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714393180;
	bh=+AOj3OMDSB3feHYUPdQfVhUVtDWDdcImqVlO1v4xpng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X7f0wuVAWdgbS5Dnrk/8uxCz/WMBnwfIEbrYQjsFBoWK/NO+gFsetX++9RtisOg+R
	 lyducI87XJq0Sa6/5knT2xgBqH7K2xW/qMnGa0g1XffUGK3v88+KqpLas4BZaDB8ho
	 7TEZf3UWszPCEBdKLSl5tSKkPNsGUW+hGDbSDeQiXvAbbZQ7/jWj/FVqaI9aEzKfJ3
	 n7rBw9DjLbVvNCoFkwi9pBCXtg9xh2adrE6zMXEpc+zsBt1S+VUeMtGvQpJ7f9J2+M
	 Gqm1Q42MZd9YPy1rtpJAQ/o+FnD8mnYQVVTP4aKCUYjgJ2YMq1N1K7OajA96dLskDm
	 vAoCNMH3V0h1Q==
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
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Nadav Amit <nadav.amit@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	Sam Ravnborg <sam@ravnborg.org>,
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
Subject: [PATCH v7 16/16] bpf: remove CONFIG_BPF_JIT dependency on CONFIG_MODULES of
Date: Mon, 29 Apr 2024 15:16:20 +0300
Message-ID: <20240429121620.1186447-17-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429121620.1186447-1-rppt@kernel.org>
References: <20240429121620.1186447-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_051943_675229_832CF362 
X-CRM114-Status: GOOD (  14.16  )
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
