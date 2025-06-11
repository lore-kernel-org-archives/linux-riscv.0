Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D927C61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 09:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hUIWydSEfpoi1uozfCIr+RazqxDd+aV1/JJkyfs4hUk=; b=P8NcUpcfsDN7Nc
	dWuGSP/IfVPy1orQab4v+SjF1uWGD4TbC91F+oDlsgwK5vjHHkRSFjbU6swRR9thoQBZNL3KsflWS
	G/T8rb7cs/EfJQd6+KYu04e7MMAOiXnPX5l74TUnIsEBJCLf20SYkr7TSMc6oa5KXs6SkJH1YclPQ
	oSdUYpMiC99Q1vs78bcCoUNXCvw4NMdmWEESdxBNtgFJGkE8blGi/Pzfsno5VNww609/Hmc4m5OJe
	T6OIU4lWLMAy+ucViUu34MbzjEo5hjBzx/K+qVoh6v9ds2o0Q9mP2vRxDPDraOaZHoXF+7HtIsqXN
	DUYE9UTi/yYfwfwPRfaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHfh-00000009SEa-35mC;
	Wed, 11 Jun 2025 09:23:01 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHf7-00000009S6i-2BYf
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 09:22:26 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749633744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gtYgOefu94eR3RuXR7DVpGUE6/xkMULsMy2O7gqiDqY=;
	b=Y27HfuNuJ6IPljHL94P/HKaHtbIOrwMmpfN23MTcgT99Uo4XLnDjHl5sK3K5lPYdbvus8g
	doza6GTfWeSO9ttXLtrw4SUGEByYTM/TuyxmrwxbqBueFG8G4gQJXh0VzEUZfezDPzYna6
	qW5kD1PDxlIKdbsqwj2HzwdG2tBhoSFAhl2kZrbgssOWSHZng4qIYxlaiw1hVaRs0MOyVj
	xJCZT67VblAdor73Kux9icKD5WFwME5u1yHiWmCccmIHVrfX20jGC8w5Sjiz9/lOIfSoma
	DR0O/S28QgqLIQTfHsMnkdO3Pt8cDvUJNHHmjka0pA0LZ7UyrBDL3DMUNvEHQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749633744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gtYgOefu94eR3RuXR7DVpGUE6/xkMULsMy2O7gqiDqY=;
	b=mm+BijQvxC8T3rubjv5cs6i7IMbmoXGRIGu7+Ilu6J1kAsbHp5AoGtG5g3OrrSSH4MpcAb
	KUGXnxUlArV5yhAQ==
Subject: [PATCH v3 0/3] vdso: Reject absolute relocations during build
Date: Wed, 11 Jun 2025 11:22:11 +0200
Message-Id: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMNKSWgC/23NywrCMBCF4VcpWRtJJr1YV76HuMhlagMlkaQNl
 dJ3Ny0IIl3+B+abhUQMFiO5FgsJmGy03uUQp4LoXronUmtyE2BQsRIuNJnoqVTRD9OINODgNZU
 ANbRC86bmJF++AnZ23tX7I3dv4+jDe3+S+LZ+vfbQS5wy2l4ayWRnOFPVbbBuGoN3dj4bJJuZ4
 McR7NiB7FTYaS2ULhXU/866rh+8y6gjAgEAAA==
X-Change-ID: 20250428-vdso-absolute-reloc-a226293c1761
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749633741; l=1205;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=zMHc74VYhNgWp77fM7mNXEn5XWz8DWEdPaX03X6eDm4=;
 b=hzIp8UgPRCEt3QpiRZcd2rwTinMga3jJ+1CI3QAmYdaMe7kTveSjuYDkffunecvqAWuYsF+Q/
 JKshY4eYcFtD2XDuQNbVQYZsMtedWWg0w2G4XgnXe4mUiaRgG8UpYG4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_022225_705601_0F82EB77 
X-CRM114-Status: UNSURE (   5.39  )
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

VGhlIGNvbXBpbGVyIGNhbiBlbWl0IGFic29sdXRlIHJlbG9jYXRpb25zIGluIHZEU08gY29kZSwK
d2hpY2ggYXJlIGludmFsaWQgaW4gdkRTTyBjb2RlLgpEZXRlY3QgdGhlbSBhdCBjb21waWxlLXRp
bWUuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhA
bGludXRyb25peC5kZT4KLS0tCkNoYW5nZXMgaW4gdjM6Ci0gRHJvcCBhbHJlYWR5IGFwcGxpZWQg
YnVnZml4IGZvciBhcm02NAotIERpc2FibGUgTFRPIGZvciB0aGUgcmlzY3YgdkRTTywgYXMgaXQg
aXMgaW5jb21wYXRpYmxlCi0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDI1MDQzMC12ZHNvLWFic29sdXRlLXJlbG9jLXYyLTAtNWVmY2MzYmM0YjI2QGxpbnV0cm9uaXgu
ZGUKCkNoYW5nZXMgaW4gdjI6Ci0gTGluayB0byBvcGVuZW5kIChpbnZhbGlkKSBHQ0MgYnVnIGNv
bnRhaW5pbmcgbW9yZSBleHBsYW5hdGlvbnMKLSBSZWZpbmUgY29tbWl0IG1lc3NhZ2VzCi0gRG9u
J3QgZmFpbCBvbiBjb21taXQgYWJzb2x1dGUgcmVsb2NhdGlvbnMgaW4gZGVidWcgaW5mbwotIExp
bmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA0MjktdmRzby1hYnNvbHV0
ZS1yZWxvYy12MS0wLTk4N2EwYWZkMTBiNUBsaW51dHJvbml4LmRlCgotLS0KVGhvbWFzIFdlacOf
c2NodWggKDMpOgogICAgICByaXNjdjogdmRzbzogRGVkdXBsaWNhdGUgQ0ZMQUdTX1JFTU9WRV8q
IHZhcmlhYmxlcwogICAgICByaXNjdjogdmRzbzogRGlzYWJsZSBMVE8gZm9yIHRoZSB2RFNPCiAg
ICAgIHZkc286IFJlamVjdCBhYnNvbHV0ZSByZWxvY2F0aW9ucyBkdXJpbmcgYnVpbGQKCiBhcmNo
L3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlIHwgNyArKysrLS0tCiBsaWIvdmRzby9NYWtlZmls
ZS5pbmNsdWRlICAgICAgIHwgNiArKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiAxM2EyZWE5MjVhZDcxN2RlMzJi
NWFlYWFjY2RhNjJlZDI2MTQ2ZDlmCmNoYW5nZS1pZDogMjAyNTA0MjgtdmRzby1hYnNvbHV0ZS1y
ZWxvYy1hMjI2MjkzYzE3NjEKCkJlc3QgcmVnYXJkcywKLS0gClRob21hcyBXZWnDn3NjaHVoIDx0
aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
