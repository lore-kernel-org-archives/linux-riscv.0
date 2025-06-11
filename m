Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B47BC71137
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RXFxKhZ5SAlQOalFBblzArQocWKx8Pq1+E9ic3jmzoM=; b=OyVDQ8930LjhN0
	4CjwKbjArSPGgWBn9BZ6H9/hfAgFSit5zNUYTXYp3p6BW2RflVaTuwoZluOD9OEHcfjQEnu5tszZj
	Ci04eTtnj3USWSAvzHPleHVO+lbL4VDwLeQKl682n+19VUTUGzwb+vya+OMhXtEeQg0kWrP2fgq6N
	AHMVSgPJBr3Yu3ZE/Owfq49MVXthI/R46AcT8rvnErsy8zJfY9te/gVaOTErR7DHrSLIcjR9RjYmw
	tM81PyPyzL+BRWxtMgc47I95wMTbUrOAfci8YO+Jb6JTjecfPw/lTOzkqg2plq9P/tMCCBp8Y6kzX
	nM0SbSy+LU8nzRUxdjNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGQF-00000009Bmc-0elZ;
	Wed, 11 Jun 2025 08:02:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2u-000000097tQ-2QO5
	for linux-riscv@bombadil.infradead.org;
	Wed, 11 Jun 2025 07:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6bG4aMoRqijm3QsbYqiZsQD0WSL7HKO6ZuqtzLxBHQU=; b=kn5GT6V2As25FUSQVuzjmWr9z1
	jpAgG4QoGsdKSef3YgvqKDEIFRznzrNR6r5dv6Sdm4d7Ap3GnkYc2idMTxwHZWu+cgAjrCxvpra4P
	Emt/wcfaq9qHRW9Q2PbOe4Iyof0Yxj4i2LmhkAZaX8AWmYCyQII73cr/2ID/dvKVgmR6h32fg+Rfv
	ZRmPi1qtxKslxsYcN8hf8vb5spNN0xGhybFRzkIXcln2jdXo+GqwiSMiM0EQTVO2xvDjH0xyIbtF1
	m17cEbihZ6KjV+o25WmX97RkQBnl7g7jnHDZA8BJVnZJHJJMhOirQ8L6Qr2HCPLZe5MrxY8ru98TO
	d7P2kB+A==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPG2s-00000002ACD-0ARk
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 07:38:52 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749627513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6bG4aMoRqijm3QsbYqiZsQD0WSL7HKO6ZuqtzLxBHQU=;
	b=FtjiXTJrFGffV5jhH+yFjWxWUATl/QvykL8dX798Lj6XiLu2SWe948QyGqN8DeDVUm7NJe
	dhdNr6M2sBpSA47K4GzSqLsJlNUbnU6zny6ovmVNbFQ13U2Ifzf1stY9pypJqyK0g/Iezg
	SoRbmwjZZXoqjQXtBT1Qr/aZ0LsflD+5fbAWggU+H01hue47gmAnkAiQc9iuwJWOLWPqIX
	tHsHRPysx/z8vRn5m5csfz5bpMtFsVVQk48C7mcAqG5peJkRJgeBGRQNPHRXimQtohD3iB
	8/g9ve1Sjo8I7G2ufDq7VWot6Q9s7tcKRLX6JMZqXUdsuMJKzVfly2225Azt6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749627513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6bG4aMoRqijm3QsbYqiZsQD0WSL7HKO6ZuqtzLxBHQU=;
	b=xIy08ukSjsvelw4n9iDAl/SKLtOjP40mLJaUSwtRzttZ9Kue2Xd0byi/dKPInKbVlzMLz8
	T4CKfurqQSuSpUBA==
Date: Wed, 11 Jun 2025 09:38:11 +0200
Subject: [PATCH v3 05/16] kbuild: introduce CONFIG_ARCH_HAS_NOLIBC
MIME-Version: 1.0
Message-Id: <20250611-kunit-kselftests-v3-5-55e3d148cbc6@linutronix.de>
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
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Nicolas Schier <nicolas.schier@linux.dev>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749627510; l=1774;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=NCYTY30jFMB+Vxbmu6gr5/Uxw4+rY0ZcejjmNfEv86U=;
 b=C+X62q9na/SevRhmECzkRpWWu/ZtskbFub2LDFhmDIb1LkmC0kEXosS7Qp5TK+9oIMXwYXsvZ
 3j4MvU6yBZDDlcPlW+u3ECJRTUjkZY+yQ2ESvNuM/Pcq9271nNEmAQi
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_083850_225967_6C879904 
X-CRM114-Status: UNSURE (   9.76  )
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

Tm9saWJjIGRvZXMgbm90IHN1cHBvcnQgYWxsIGFyY2hpdGVjdHVyZXMuCkFkZCBhIGtjb25maWcg
b3B0aW9uLCBzbyB1c2VycyBjYW4ga25vdyB3aGVyZSBpdCBpcyBhdmFpbGFibGUuCgpUaGUgbmV3
IG9wdGlvbiBpcyBtYWludGFpbmVkIGluc2lkZSB0b29scy9pbmNsdWRlL25vbGliYy8gYXMgb25s
eSB0aGF0CmRpcmVjdG9yeSBpcyByZXNwb25zaWJsZSBmb3Igbm9saWJjJ3MgYXZhaWxhYmlsaXR5
LgoKUmV2aWV3ZWQtYnk6IE5pY29sYXMgU2NoaWVyIDxuLnNjaGllckBhdm0uZGU+ClNpZ25lZC1v
ZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRl
PgotLS0KIGluaXQvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKysKIHRvb2xz
L2luY2x1ZGUvbm9saWJjL0tjb25maWcubm9saWJjIHwgMTUgKysrKysrKysrKysrKysrCiAyIGZp
bGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbml0L0tjb25maWcg
Yi9pbml0L0tjb25maWcKaW5kZXggMjZjYWZiYWQ0ZjE1NjBmYjU2YjRiZWYzMWFlMjliYWY1NDE3
NTY2MS4uNmQxMGYyODE2ZTQ1M2QxZDI4ZTRiODI0OWNiYmQ5NWMyOGJhYTBmMSAxMDA2NDQKLS0t
IGEvaW5pdC9LY29uZmlnCisrKyBiL2luaXQvS2NvbmZpZwpAQCAtOTIsNiArOTIsOCBAQCBjb25m
aWcgQ0NfQ0FOX0xJTktfU1RBVElDCiAJZGVmYXVsdCAkKHN1Y2Nlc3MsJChzcmN0cmVlKS9zY3Jp
cHRzL2NjLWNhbi1saW5rLnNoICQoQ0MpICQoQ0xBTkdfRkxBR1MpICQoVVNFUkNGTEFHUykgJChV
U0VSTERGTEFHUykgJChtNjQtZmxhZykgLXN0YXRpYykgaWYgNjRCSVQKIAlkZWZhdWx0ICQoc3Vj
Y2VzcywkKHNyY3RyZWUpL3NjcmlwdHMvY2MtY2FuLWxpbmsuc2ggJChDQykgJChDTEFOR19GTEFH
UykgJChVU0VSQ0ZMQUdTKSAkKFVTRVJMREZMQUdTKSAkKG0zMi1mbGFnKSAtc3RhdGljKQogCitz
b3VyY2UgInRvb2xzL2luY2x1ZGUvbm9saWJjL0tjb25maWcubm9saWJjIgorCiAjIEZpeGVkIGlu
IEdDQyAxNCwgMTMuMywgMTIuNCBhbmQgMTEuNQogIyBodHRwczovL2djYy5nbnUub3JnL2J1Z3pp
bGxhL3Nob3dfYnVnLmNnaT9pZD0xMTM5MjEKIGNvbmZpZyBHQ0NfQVNNX0dPVE9fT1VUUFVUX0JS
T0tFTgpkaWZmIC0tZ2l0IGEvdG9vbHMvaW5jbHVkZS9ub2xpYmMvS2NvbmZpZy5ub2xpYmMgYi90
b29scy9pbmNsdWRlL25vbGliYy9LY29uZmlnLm5vbGliYwpuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwLi4yOWNiYzU0Mzdl
NzBjYmM1ZTI1NmYwMGI3NGQwYWI0ODAxYjQwZGU3Ci0tLSAvZGV2L251bGwKKysrIGIvdG9vbHMv
aW5jbHVkZS9ub2xpYmMvS2NvbmZpZy5ub2xpYmMKQEAgLTAsMCArMSwxNSBAQAorIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAorCitjb25maWcgQVJDSF9IQVNfTk9MSUJDCisJYm9v
bAorCWRlZmF1bHQgeSBpZiBBUk0KKwlkZWZhdWx0IHkgaWYgQVJNNjQKKwlkZWZhdWx0IHkgaWYg
TE9PTkdBUkNICisJZGVmYXVsdCB5IGlmIE02OEsKKwlkZWZhdWx0IHkgaWYgTUlQUworCWRlZmF1
bHQgeSBpZiBQUEMKKwlkZWZhdWx0IHkgaWYgUklTQ1YKKwlkZWZhdWx0IHkgaWYgUzM5MAorCWRl
ZmF1bHQgeSBpZiBTUEFSQworCWRlZmF1bHQgeSBpZiBVTUxfWDg2CisJZGVmYXVsdCB5IGlmIFg4
NgoKLS0gCjIuNDkuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
