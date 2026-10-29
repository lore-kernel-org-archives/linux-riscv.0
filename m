Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CFA606A325
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 21:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TgakpPGL;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Jg3ya3oC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dAeQNAPt6urYJa4SEd0GiqyrRlbgQUo+hN16hZRRwVQ=; b=TgakpPGLu//YS+UZQNIR4AIOFD
	9QAp/RbBD6AujZ0XHPXolWvkH0dJ6czMNl9O4cNJ7rPNCoV90AaNcc33SRNLyBw5lRsGiLXgDwDVl
	1ikJCQFYezlCmqbIoyzTbm3ECdKCNQJTBQ8AHBWAfaL/8HQrqFrka8N85txgYhKYns+Mn1k/QBFtU
	M3oi6AmrhdHgLftEz+dFmTbgC27+l4XIIOFkhSrgVRbd9v+W3mde/gPcB8NZhd2+G0iyEcNZWURcl
	aUYrscpE9f5PTtnw+G0IxFu9ibDDWEfKEJSHye5X/bw1sumK7rARG5Tw0deVszB+hKFA9SEsnDknW
	C7WBpAXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXCq-0000000ANyq-1tWz;
	Thu, 29 Oct 2026 20:58:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXCn-0000000ANxx-3Zn6;
	Thu, 29 Oct 2026 20:58:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CAE01682;
	Thu, 29 Oct 2026 13:58:32 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0EDC3F673;
	Thu, 29 Oct 2026 13:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793307515; bh=eGINbpk+u5dvPrarZzSg3shFUdSyR5pE2iLotRLHSCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jg3ya3oCDlJtfPw43F1dYsM67Or+gCyrsue5QCdurwpKyWWtwvnp3RvmiZ9Ynid6f
	 iXK50kRZhgRaNStldTmZwtCpo9XV7zcXJIQFkujqsnRBs7R0sgV/HmWc4ZXcZO8oWA
	 kvVh9562O4fhFDKMW7e1cT/sxwAvKVPukiz1ppBs=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: Re: (subset) [PATCH v3 0/4] arm64, riscv: release shadow stacks on failed fork
Date: Thu, 29 Oct 2026 20:57:00 +0000
Message-ID: <179330742036.2531571.12603232226357262067.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
References: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_135837_939713_E3296C21 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCAyOCBPY3QgMjAyNiAxMjo0MzoxMSAtMDMwMCwgSXbDoW4gRXplcXVpZWwgUm9kcmln
dWV6IHdyb3RlOgo+IGNsb25lMyhDTE9ORV9WTXxDTE9ORV9QSURGRCkgY2FuIGZhaWwgaW4gcHV0
X3VzZXIoKSBhZnRlciBjb3B5X3RocmVhZCgpCj4gaGFzIG1hcHBlZCBhIHNoYWRvdyBzdGFjayBp
bnRvIHRoZSBzaGFyZWQgbW0uIGNvcHlfcHJvY2VzcygpIHRoZW4gY2FsbHMKPiBleGl0X3RocmVh
ZCgpLiBhcm02NCBhbmQgcmlzY3YgZGlkIG5vdCBpbXBsZW1lbnQgaXQsIHNvIHRoZSBWTUEgbGVh
a2VkLgo+IAo+IHg4NiBhbHJlYWR5IGZyZWVzIHZpYSBleGl0X3RocmVhZCgpIC0+IHNoc3RrX2Zy
ZWUoKS4gSXRzIHNlcGFyYXRlIFRMUwo+IGxlYWsgaXMgd2hlbiBjb3B5X3RocmVhZCgpIGZhaWxz
IGFmdGVyIHRoZSBhbGxvYyBhbmQgc2tpcHMgZXhpdF90aHJlYWQoKS4KPiAKPiBbLi4uXQoKQXBw
bGllZCB0byBhcm02NCAoZm9yLW5leHQvY29yZSksIHRoYW5rcyEKCk9ubHkgdGhlIGFybTY0IGNo
YW5nZXMsIHJpc2N2IGNhbiBnbyB0aHJvdWdoIHRoZSByaXNjdiB0cmVlLiBJIGNoYW5nZWQKdGhl
IGNvbW1pdCBsb2cgYSBiaXQgb24gdGhlIGZpcnN0IHBhdGNoIGFuZCBhZGRyZXNzZWQgc29tZSBu
aXRzIE1hcmsKcmFpc2VkLiBBcyBhIHNlcGFyYXRlIHBhdGNoLCBpdCBtaWdodCBiZSBnb29kIHRv
IGFkZCBhIGtzZWxmdGVzdCBmb3IgdGhlCmlvX3VyaW5nIHdvcmtlciB0aHJlYWQgYW5kIEdDUy4K
ClsxLzRdIGFybTY0L2djczogcmVsZWFzZSBHQ1Mgb24gZmFpbGVkIGZvcmsKICAgICAgaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9hcm02NC9jLzA3OGUxMjJmM2JmMApbMy80XSBzZWxmdGVzdHMvYXJt
NjQ6IEdDUyBtdXN0IG5vdCBsZWFrIG9uIGEgZmFpbGVkIGNsb25lMwogICAgICBodHRwczovL2dp
dC5rZXJuZWwub3JnL2FybTY0L2MvZjQ2YmU0ZGEyY2JiCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
