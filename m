Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2B4C71136
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fVWnwz5k3/jvZhTgMZDb9avBphLhdGMgdVKeFe5bZCM=; b=kGjaF1JHmgVlN/
	G2aoF0olPWxxBbPL4NViP3buieeBKLtgv9RmQjZwcHMUiQWnovNxa+9+w6gpP9SonIFWzzwq90Tg8
	oJchU9lmpQNHKUD3eWiPBpr5rl0p3ZfN1SZvHyRYib+g32NRLve1dUQOBaVgL7q+Ryh4gHyPp6Ewe
	pJD/NewsihSoD6rTQtCZuNvh98yyLqnW1zHrKOmUQhWHKoFJ2KxaH8Pd90EWPoQC5gSpxtV02Zle0
	1WAMGWZr4SVvzDAegmc4NGGA0yeGeFl3mVLYuppAtpQcuzNNuSc/dJK+7rPbLiplhbDmrhVqKIUsd
	1KLDSRGMmtuYNCV3ZO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGQB-00000009Bjz-3RAd;
	Wed, 11 Jun 2025 08:02:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2t-000000097sY-06Ry
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 07:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Aw4RctE+kQHvgi29VkPu93qy1QWd5JKnsQyp7snGObQ=; b=CbZ+LTSWHn5uPctDILYXsN0329
	qY49ZFgzQ3yxn+Ny0JBSVUmJWS/2d6lmx5OTZDMLeY4zOMlAnldg+PSzk2myjMNSG/E/33XuHbHI9
	TzC34SwLI6PgNNUj2FQ2OPs3KeqclDJwkzkm7z0fo4wDn40b0tbs9PY1tTnIvZrbqfZrN2j3/1V6G
	dQEF9ENL7TMnMbOpnMvKPC0miud1NRUNLhygvA2N0G1akyrY7Se71XpnR1MeEzNNTFqrt9KCV2z/w
	3b7xqeH3inpG4upDDxtM6kPBgeCWcMSenqLd/XeT4OSpB511hnnviz/iIZ4ef2pVBfVbkrD9n9eLG
	PTl71iiA==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2q-00000002AB6-0AuD
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 07:38:50 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749627516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aw4RctE+kQHvgi29VkPu93qy1QWd5JKnsQyp7snGObQ=;
	b=sqfWria4kP4SOQlx1s0jeMGRs860S4UMdUyhSuujik88VHEcuMnxIlIzeiMySEFDo8/epW
	zWE7I4w886hrw9IKV74YQICqYDtk4ZljmNT/3k3hZX5EHJRW8x/MRK8b6Pv0D6yqkk0Lnk
	RzZVc0SuQnyBP0O82sAcl7gImdhtMDf9QmBbtoVcBuZqSZwaoyDWICKSBvAnRfC+gKvslq
	j00F6hpjjcCYg79YCcUhI6i+BB3qjnt4I+HLuAdIi6WWKTuO3bE0Mt5yYRoCIk5bulU5LR
	MNIlWDJP2qjZUMBYnLlWfU8KC31qUcY2jDWuclMq3kFmGC4lsYRMJp64jpu1DA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749627516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aw4RctE+kQHvgi29VkPu93qy1QWd5JKnsQyp7snGObQ=;
	b=RwA/RNJjm6lnqAE+lJMU9c2ShEsZEVzHJ/yZEjQdiKvsS/DNrm2odS9qKdRlhkpVMy7ERE
	MzGpaaEV28jg1FAg==
Date: Wed, 11 Jun 2025 09:38:18 +0200
Subject: [PATCH v3 12/16] kunit: qemu_configs: loongarch: Enable LSX/LSAX
MIME-Version: 1.0
Message-Id: <20250611-kunit-kselftests-v3-12-55e3d148cbc6@linutronix.de>
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
In-Reply-To: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nicolas Schier <nicolas.schier@linux.dev>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 workflows@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749627510; l=948;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=GN2rs7xDDVc7vTzexjV169ensgRHmJNe+Aa1g92I+yw=;
 b=ng06gPoY8CuYRAkcYG8/q+yKDYB+VZpGZMcx5yDl1uLNf1fCDkWV7YBZf521G7jCF0zPnjHlX
 9OeH5xEqNjZBWFVvYKUb/B7Ra3JxbP98FF2DZVmzfzvgdNwwTVDCIF0
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_083848_163953_670A4C92 
X-CRM114-Status: UNSURE (   6.37  )
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

VGhlIHVwY29taW5nIGt1bml0IFVBUEkgZnJhbWV3b3JrIHdpbGwgcnVuIHVzZXJzcGFjZSBleGVj
dXRhYmxlcyBhcyBwYXJ0IG9mCmt1bml0LiBUaGVzZSBtYXkgdXNlIHRoZSBMU1ggb3IgTEFTWCBp
bnN0cnVjdGlvbnMuCgpNYWtlIHN1cmUgdGhlIGt1bml0IGtlcm5lbCBjYW4gaGFuZGxlIHRoZXNl
IGluc3RydWN0aW9ucy4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMu
d2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgotLS0KIHRvb2xzL3Rlc3Rpbmcva3VuaXQvcWVtdV9j
b25maWdzL2xvb25nYXJjaC5weSB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL2t1bml0L3FlbXVfY29uZmlncy9sb29uZ2Fy
Y2gucHkgYi90b29scy90ZXN0aW5nL2t1bml0L3FlbXVfY29uZmlncy9sb29uZ2FyY2gucHkKaW5k
ZXggYTkyNDIyOTY3ZDFkYTlmMTY1OGVmMWU4MGQwZDczNjVkZGJhZTMwNy4uMWRiYTc1NTI4NGYx
MWZmYzk0ZDg5NDYxMDViMGNmYTQ5Y2I2ZjYwNCAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9r
dW5pdC9xZW11X2NvbmZpZ3MvbG9vbmdhcmNoLnB5CisrKyBiL3Rvb2xzL3Rlc3Rpbmcva3VuaXQv
cWVtdV9jb25maWdzL2xvb25nYXJjaC5weQpAQCAtMTEsNiArMTEsOCBAQCBDT05GSUdfUFZQQU5J
Q19QQ0k9eQogQ09ORklHX1NFUklBTF84MjUwPXkKIENPTkZJR19TRVJJQUxfODI1MF9DT05TT0xF
PXkKIENPTkZJR19TRVJJQUxfT0ZfUExBVEZPUk09eQorQ09ORklHX0NQVV9IQVNfTFNYPXkKK0NP
TkZJR19DUFVfSEFTX0xBU1g9eQogJycnLAogCQkJICAgcWVtdV9hcmNoPSdsb29uZ2FyY2g2NCcs
CiAJCQkgICBrZXJuZWxfcGF0aD0nYXJjaC9sb29uZ2FyY2gvYm9vdC92bWxpbnV4LmVsZicsCgot
LSAKMi40OS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
