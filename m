Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD8FC07E8F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 09:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yqfQRtDO257WiaegE34oS1vYzlEDQlZrVFYqQ7r/6o8=; b=Zw2L7P30Bx5HWp
	lzYoiBPgCnamJSVbnFMgGWm+MxHtkaKTbWNPr77miHgB8BgbSV+1WAPInNao0IDRN/gMAunvezAQl
	1Owg/Y/sup28WguSJi0s03RV7MRQXC0IL2b+XsRs6k2IJNE4UPe5EhMK1z/C3Atg00IpyHSGmCitu
	2qSxvsOLSTGY28hkosSmsLeOegR87yW/IrrSmY3e7bzH19hXaDfjj2YJtlnYz8wC4oPTxzkglHp5k
	mJlJ2su20cEV0OVvumfH+q34jeVfHFmmOaT7xo4n11qCcGynBRv2/OLBd7puXwFh3IaZkgfUp/Vcj
	pB2+MapRs2z7J6MsGO/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryqIA-0000000D1CO-2qKZ;
	Mon, 22 Apr 2024 09:48:54 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryqHF-0000000D0VM-3450;
	Mon, 22 Apr 2024 09:48:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 27E2FCE0A6A;
	Mon, 22 Apr 2024 09:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05CA2C32782;
	Mon, 22 Apr 2024 09:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713779274;
	bh=+AOj3OMDSB3feHYUPdQfVhUVtDWDdcImqVlO1v4xpng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pZG8pQflxLsEuJFglVKqJVh1hzZ6znU6by6zRe6CVzeVYUIAfkP3KeqnCBd341Ok/
	 ZOAQMatwn0MrxZV/qFh9l15DBEe/HrHpyTAZh+pCjnAzVTpL1PuxwVZAPTWRbs8388
	 FPoIBbcENyioCyFjKvGfWLnYLQ0jPXxHWcvQyPbJW6HlNu8cDhOXh9/zSaqXxmP2a1
	 ZQc+c66AbHHonWEZ0/NqO/wG1tPBotsJEOtsMluC1yKGZFNE6ftrfpAJMvXH8VQJx2
	 UifyO8EHPM4iUUB2xtq07CReWxKqTAgWKsDzYr0X0ychttFdDC3QIMNctMPSzamCNs
	 t1CDFLgjmIpAA==
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
Subject: [PATCH v5 15/15] bpf: remove CONFIG_BPF_JIT dependency on CONFIG_MODULES of
Date: Mon, 22 Apr 2024 12:44:36 +0300
Message-ID: <20240422094436.3625171-16-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422094436.3625171-1-rppt@kernel.org>
References: <20240422094436.3625171-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_024758_353663_709F6931 
X-CRM114-Status: GOOD (  14.31  )
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
