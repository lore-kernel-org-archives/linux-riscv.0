Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4196EEAA54
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 16:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4WZr78DiL+WS3uXhtLz9pQErniYXKfhlfitnikihv5g=; b=5FNJG3r8CXi7kE
	RPqEJGvwf0p9xpexKAXCWEnJ5YqxAXrmog0f2vqAiIlhhD19iJNo8jCmo52hBGKuAxHYFcUIyePwj
	1d5G/5w4infh9PoC1PYnRYRJ46zrJk4i8x1uEXiBiCn2tWFuF3K2pg2Ibc0YlTM+N2poKvhwm8C5A
	wW1V+eVeEB+0A2AlE/US9m3xPGbE4Scx0NiaL847ea/l85aSVKewaTi6jG6DxrR4r3HL1J24SrCDM
	zmTtxD9EeNccAUWKylnY5Cw2aZQ7HmQvUtTdDT3RqRAXpMDAHG9U1Vg+qx+Ya13m9tRTIydvuStUC
	9xtwDpYhCvQscFYFCpsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgomo-008qtI-0k;
	Thu, 14 Sep 2023 16:01:46 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgomh-008qpb-35
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 16:01:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1694707293;
	bh=9Dr/Qlwz9Z5VVtmbM8JisJIKlg1q6mK4mMaDaT8aZHA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fQaMl0ZADkTcn1qLdesYc0JElUD9GU3vjgALM2c2J2mMVoWd0UxMkI4DTYNLV6u71
	 N/euTGpE0aCdUp0gXHiuUqU+DXM1U0oq5wlWc4hq/C+9whepDaEWRX8wla4vJnezGV
	 hLGAFnCFKk+1Kvk3qK+d/aFnNWNHlinSmp956LPU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 14 Sep 2023 18:01:17 +0200
Subject: [PATCH 1/4] selftests/nolibc: allow building i386 with multiarch
 compiler
MIME-Version: 1.0
Message-Id: <20230914-nolibc-syscall-nr-v1-1-e50df410da11@weissschuh.net>
References: <20230914-nolibc-syscall-nr-v1-0-e50df410da11@weissschuh.net>
In-Reply-To: <20230914-nolibc-syscall-nr-v1-0-e50df410da11@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694707292; l=915;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=9Dr/Qlwz9Z5VVtmbM8JisJIKlg1q6mK4mMaDaT8aZHA=;
 b=4hV3jmCa9Owq/qDwKo7tLD8BIPuEx78VNy7e+gUuEGgiBDFvmAUaNjzfTv12ywRmmXc39/n+P
 t1qzu7r4eSGA1L3Bu5s4gUucQV1Iy2C30Ct+vTxX9WnaFcRJ9QUf+Yd
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_090140_148126_EADE6058 
X-CRM114-Status: UNSURE (   6.73  )
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

V2hlbiBidWlsZGluZyB3aXRoIGEgbXVsdGlhcmNoLWNhcGFibGUgY29tcGlsZXIsIGxpa2UgdGhv
c2UgcHJvdmlkZWQgYnkKY29tbW9uIGRpc3RyaWJ1dGlvbnMgdGhlIC1tMzIgYXJndW1lbnQgaXMg
cmVxdWlyZWQgdG8gYnVpbGQgMzJiaXQgY29kZS4KCldyYXAgaXQgaW4gY2Mtb3B0aW9uIGluIGNh
c2UgdGhlIGNvbXBpbGVyIGlzIG5vdCBtdWx0aWFyY2gtY2FwYWJsZS4KClNpZ25lZC1vZmYtYnk6
IFRob21hcyBXZWnDn3NjaHVoIDxsaW51eEB3ZWlzc3NjaHVoLm5ldD4KLS0tCiB0b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvTWFrZWZpbGUgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9N
YWtlZmlsZSBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9NYWtlZmlsZQppbmRleCA2
ODk2NThmODFhMTkuLjE5MDk2YTlkZWQ1NSAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvbm9saWJjL01ha2VmaWxlCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGli
Yy9NYWtlZmlsZQpAQCAtMTEzLDYgKzExMyw3IEBAIGVsc2UKIFE9QAogZW5kaWYKIAorQ0ZMQUdT
X2kzODYgPSAkKGNhbGwgY2Mtb3B0aW9uLC1tMzIpCiBDRkxBR1NfcHBjID0gLW0zMiAtbWJpZy1l
bmRpYW4gLW1uby12c3ggJChjYWxsIGNjLW9wdGlvbiwtbW11bHRpcGxlKQogQ0ZMQUdTX3BwYzY0
ID0gLW02NCAtbWJpZy1lbmRpYW4gLW1uby12c3ggJChjYWxsIGNjLW9wdGlvbiwtbW11bHRpcGxl
KQogQ0ZMQUdTX3BwYzY0bGUgPSAtbTY0IC1tbGl0dGxlLWVuZGlhbiAtbW5vLXZzeCAkKGNhbGwg
Y2Mtb3B0aW9uLC1tYWJpPWVsZnYyKQoKLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
