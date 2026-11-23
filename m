Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347D7606A31E
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 09:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=anmLxvDo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2BRs8kNn;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=orqM62jb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Er9yo89F50om2Q24yjdH41lQGhWc1E7njrKNfEYLmOc=; b=anmLxvDonl+Mas9RBCTQoJr0wI
	lTVyZM3QYY3F58tg+t2qXnIX1g1NRjmqFc2Mk8KY8cS6fQzVbZZFUPi9M7gsMKH1VJI7JN9HbwsMB
	luef+uK8fp54lNjzn4wKWcXfEoy2bP4H9lYMJswKb0kiZXkZeAXVHvVUreP4lzOzFHBK/n2QLlzJ7
	DdCb/SJdV3ammRCNZX/cu7TuxfqeclbOCOXGEr5xmWsDZTfdllaXgdmsAH/WZKMbEIT7xm393+87U
	ldLNCAOjyw++HacHaVlDVxDhCkuzcF6R1NfS/Qei6Y8K/cqMSwriL6TdSxt+vh6w6o6skCbmrwzbn
	gHQgB9ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQVm-00000002lFs-3Kex;
	Mon, 23 Nov 2026 09:38:58 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQUR-00000002jpp-1f6s;
	Mon, 23 Nov 2026 09:37:39 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795426649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dQUU5u79vuDftzZPq41mVfEGZTZsxAT4nxqA9JHwFwM=;
	b=2BRs8kNnJh8jUvFne0pup0kjd56RKwfZQoVTswB8jaQkT/1+UC3J0057egOH4HK7xFJAqA
	HqCywtOh7slUrHcQGQvefA6eL7zyv5hsSA1zxFFvN/6ge8RI/bO/4bG9ak1pAwLXjgZqj6
	iGcErJRTwGr5nVvFFDPmW/Nm8laVaZu6XMnvCEkeIwUojmTfuvrSIQyqYv8EdmwCWWVV1W
	ki1aQCBFjitTjq+qvrPiLfH9aOLweh50rgCPL57R9s9qzuuIqDA61unszxi5VtgurELgBe
	RanufkaLmGxg3YO/o8/JlKLnrf6Pe3A3XF6OnxlZIDqBXd9EKN0qE98NapY4hQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795426649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dQUU5u79vuDftzZPq41mVfEGZTZsxAT4nxqA9JHwFwM=;
	b=orqM62jbjJv4cXHhrjV4L7jD4t6CApiSqCiCMjGa0zhR8JXKvf+tjoeh2jm1k5ccyk1y6u
	4vDc7mLpel0lpJCg==
Date: Mon, 23 Nov 2026 10:37:11 +0100
Subject: [PATCH v3 06/15] arm64: Remove AT_VECTOR_SIZE_ARCH from UAPI
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-at-vector-size-arch-v3-6-d342dae9e843@linutronix.de>
References: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
In-Reply-To: <20261123-at-vector-size-arch-v3-0-d342dae9e843@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795426640; l=1590;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=y+NTI479tyoHV6O0h6k1NetFm2TSA10tCjlo/HGZYvg=;
 b=R4duhjDRQUXysUPjCyGoikenj+2lzks0w9tUzNKNfbwsEci78RXNuIVq9fOyG8pXBz36DsOCf
 bTSsZCwaQ+5AeQSIEa48ysbBSHeolzWma3r0l38rQVQGcphJQ8frdez
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013735_613515_DDD41285 
X-CRM114-Status: GOOD (  11.50  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlcmUgaXMgbm90aGluZyB1c2Vyc3BhY2UgY2FuIGRvIHdpdGggdGhpcyB2YWx1ZS4gSW4gdGhl
IGtlcm5lbCBpcwphbHdheXMgY29tYmluZWQgd2l0aCBBVF9WRUNUT1JfU0laRV9CQVNFLCB3aGlj
aCBpcyBub3QgZXhwb3NlZCB0bwp1c2Vyc3BhY2UgYW5kIGFsc28gY2hhbmdlcyBmcm9tIHRpbWUg
dG8gdGltZS4KCk1vdmUgdGhlIHN5bWJvbCB0byBhIGtlcm5lbC1pbnRlcm5hbCBoZWFkZXIuCgpT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRy
b25peC5kZT4KUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwub3JnPgotLS0KIGFy
Y2gvYXJtNjQvaW5jbHVkZS9hc20vYXV4dmVjLmggICAgICB8IDcgKysrKysrKwogYXJjaC9hcm02
NC9pbmNsdWRlL3VhcGkvYXNtL2F1eHZlYy5oIHwgNiArKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
aW5jbHVkZS9hc20vYXV4dmVjLmggYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL2F1eHZlYy5oCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uZGUyNGVhYWEwNmUyCi0tLSAv
ZGV2L251bGwKKysrIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9hdXh2ZWMuaApAQCAtMCwwICsx
LDcgQEAKKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCisjaWZuZGVmIF9f
QVNNX0FVWFZFQ19ICisjZGVmaW5lIF9fQVNNX0FVWFZFQ19ICisKKyNkZWZpbmUgQVRfVkVDVE9S
X1NJWkVfQVJDSCAyIC8qIGVudHJpZXMgaW4gQVJDSF9ETElORk8gKi8KKworI2VuZGlmCmRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmggYi9hcmNoL2FybTY0
L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgKaW5kZXggNzQzYzBiODRmZDMwLi5mYjUxZTkwNjgx
M2EgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS91YXBpL2FzbS9hdXh2ZWMuaAorKysg
Yi9hcmNoL2FybTY0L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgKQEAgLTE0LDEzICsxNCwxMSBA
QAogICogWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UKICAqIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtLiAgSWYgbm90LCBzZWUg
PGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgogICovCi0jaWZuZGVmIF9fQVNNX0FVWFZF
Q19ICi0jZGVmaW5lIF9fQVNNX0FVWFZFQ19ICisjaWZuZGVmIF9fVUFQSV9BU01fQVVYVkVDX0gK
KyNkZWZpbmUgX19VQVBJX0FTTV9BVVhWRUNfSAogCiAvKiB2RFNPIGxvY2F0aW9uICovCiAjZGVm
aW5lIEFUX1NZU0lORk9fRUhEUgkzMwogI2RlZmluZSBBVF9NSU5TSUdTVEtTWgk1MQkvKiBzdGFj
ayBuZWVkZWQgZm9yIHNpZ25hbCBkZWxpdmVyeSAqLwogCi0jZGVmaW5lIEFUX1ZFQ1RPUl9TSVpF
X0FSQ0ggMiAvKiBlbnRyaWVzIGluIEFSQ0hfRExJTkZPICovCi0KICNlbmRpZgoKLS0gCjIuNTYu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
