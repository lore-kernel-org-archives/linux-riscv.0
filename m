Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7A7606A339
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 18:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=faOO6ndJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MjOEMYYW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eeWm50NDs2+zhKqoDHdbsu2+Ra/S7zprCx1QIMPKeSg=; b=faOO6ndJfzlqg7
	f6NsCVr3hIy/lBsHRc0Tz83q2dhpSnroCnk/mqXhLRNhczwEHuFmftu0T3x2pqfXkKi4pks9Bic2m
	rsqm2zS2K1kezKwt43saEXaNqkI/aoR5JailqPvlBJ67twKHm7GDBpQXk1Sx4SLBt6rjRI1IIKZDN
	yhiFlu9gVCAmIl4ysI/YphxlrNFzsxmO9lSPEVBYIePZu6maSxcXd48/vZ5rEMtVaYUD6B69r3wzE
	nPJshcVfUqsSx5HyZJrmgybzg8yTvvp4A9z4LcDXZ6x0n9eG3uI3Ey2qskbUu7VlCFs6YA6ntD0m8
	7i92BRnIp5yijxdB520A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJERR-0000000AQWN-36oE;
	Tue, 20 Oct 2026 18:20:05 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJERN-0000000AQRk-1f5C
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 18:20:03 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-3514b90bb89so9727781eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Oct 2026 11:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792520400; x=1793125200; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AD4FupzOkNV/tXGDExVuku+h5mwG6UM+nTlzYdmocg8=;
        b=MjOEMYYWeLFqVq2FlCN/8HU/qBkzAEkRtIa1J9kPTHIOcK0AU0nFRROdvofvgVTJur
         u+9Vclpy/fE7oNb3U5M0tu5otIXEad4H+jGJqC4pVunuFzUDxRkHytThh/2yDEj9q9ZL
         nalnmIoGSrQdlZ19iGMjzeF4RFOdqgELZ2qyl3WHPZIYvAShXXjjGoyWoQcVMO8zZ14G
         D8KPIyJVEYIsBKbb2q5RX4oCw0jjmJwxwKjvT5C5WsAFx6F1osjfWNFk41IrzXW7gDiz
         J9EapDGgPNYi3+mykdLPeRNP+Acym8QbzymwS9l17fkrvGi3YC1Yz3XxuoJhzYjDF5rd
         RHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520400; x=1793125200;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AD4FupzOkNV/tXGDExVuku+h5mwG6UM+nTlzYdmocg8=;
        b=yQI7v/Qx4Cvp/tPysPl4+rR3Iq1jv4DeNc2PtLogvBaacDMJEc3mQskbysJCb/RKcA
         5BzMhH7Ch/iMQTcYPWsce16ye0KgpveJii4PuOSinBEzqm1acx9N5aMkt36TWrYcBQyi
         j41YAwAaWljdgClrprEAIOO7enBOjB+2kEaEmnlJ6WEFBbRSK2oOn5r4rp0J9vpZhw/L
         gtwc1mVGVXWBvIPduF9H124leBVI8DSajivhv9fZel03tj3/SaW5XzAYbGeV0MeVvSNt
         ghmz5hjNyiHdsVK+KR8jMyhhNRzDlI4FBbmNJJ5k1zzD0IXEERQmC9lu4NpTz7uPc4eh
         Od1g==
X-Forwarded-Encrypted: i=1; AKwUvBwta/tFnDHZxm9k4bEYL3hAmgUjLN08i2Xb5CtXu6pfITHFl1d18cYcvOWrC4MZE7IE/9TT1rKbJE7bYg==@lists.infradead.org
X-Gm-Message-State: AFq9FYI4Mz6dkcDwLOv9R0I+VckstLTm7Jdid8PRmI/lxJNv13ce8hds
	nkimIkRdfI8OlG8TMrOtZvnH4J8cj19OXOrMGwvYV42DcHqme1N0AHJ7f4/rMfHnzQUV8Q==
X-Gm-Gg: AYBFou1WAeQNVz+LMLU+eNvaTKxYkaeSgbpjoVl/Bv2H5EnROlgSW1iknUC8KZ3ByuU
	4KdjnDRz/Y8i0P0gERAnsgcapJg6bkaA/UpWhPOmGOGq4jDJvLsLFYoNPmFop3pkkDT8YTi7C4g
	XxHnFgZPLlwC8D1ZUO8e6NUHW09BgA0zgelgQutn1aZEYgKtIgXSNkn9hjWt5+eFtTJ+MLTaILN
	zBxGioAweof1+a4IOO7os7oGth4LvNX8ooPrbwT0xHWd5nM4nPf0REgIi+I5yIGNXHm6TJRWAdY
	12A53PxByWtYXGrRNLkiP6xMYp8OMpQN41kQ+eELoa3THWJmG0xesZqJ+7ZO0QuHdNqZGJBlEYW
	Df8Yg5y691WI0qV0m/lmVPrz0jCl9lv0m93dILQE8L6OqmnsVI/mpzMSjF0iSRoZrS7iefapyaf
	UqdM4nfpwQqcc7EUqL0wUll2QaBw1jbpKs/5QKFhk6QjwbsDimerHn2+NXV/fsR6vS6TFam8dKo
	sA=
X-Received: by 2002:a05:693c:65cc:b0:367:23b6:94e1 with SMTP id 5a478bee46e88-3674e25bf5cmr60596eec.41.1792520400378;
        Tue, 20 Oct 2026 11:20:00 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm523728eec.2.2026.10.20.11.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:20:00 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
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
Subject: [PATCH v2 4/4] selftests/riscv: shadow stack must not leak on a failed clone3
Date: Tue, 20 Oct 2026 15:19:33 -0300
Message-ID: <2c48cc867d005e2e54ca7d6c28c7f87b32a7a70b.1792519121.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792519121.git.ivanrwcm25@gmail.com>
References: <cover.1792519121.git.ivanrwcm25@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_112001_445771_20955103 
X-CRM114-Status: GOOD (  21.35  )
X-Spam-Score: -0.1 (/)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HK_RANDOM_FROM,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Y2xvbmUzKENMT05FX1ZNfENMT05FX1BJREZEKSB3aXRoIGFuIHVud3JpdGFibGUgcGlkZmQgcG9p
bnRlciBmYWlscwppbiBwdXRfdXNlcigpIGFmdGVyIGNvcHlfdGhyZWFkKCkgaGFzIG1hcHBlZCBh
IHNoYWRvdyBzdGFjay4KY29weV9wcm9jZXNzKCkgdGhlbiBjYWxscyBleGl0X3RocmVhZCgpLiBX
aXRob3V0IEhBVkVfRVhJVF9USFJFQUQKdGhhdCBmcmVlIGlzIGEgbm8tb3AgYW5kIHRoZSBWTUEg
c3RheXMgaW4gdGhlIHBhcmVudCdzIG1tLgoKVXNlIGtzZWxmdGVzdC5oIC8gS1RBUC4gU2tpcCBw
YXRocyB0aGF0IGNhbm5vdCBydW4gdGhlIHJlZ3Jlc3Npb24KcnVuIGJlZm9yZSBrc2Z0X3NldF9w
bGFuKCkuIFRoZW4gY29uZmlybSBhIHZhbGlkIGNsb25lMyB3cml0ZXMgYQpwaWRmZCwgcmVqZWN0
IDE2IGJhZC1waWRmZCBjbG9uZXMgd2l0aCAtRUZBVUxULCBhbmQgcmVxdWlyZSB0aGUKc2hhZG93
LXN0YWNrIFZNQSBjb3VudCAoVm1GbGFncyAiIHNzIikgdG8gc3RheSB1bmNoYW5nZWQuCgpFTk9T
WVMsIEVJTlZBTCwgYW5kIEVQRVJNIGZyb20gdGhlIHZhbGlkIGNsb25lIHNraXAuIFRoZSByZWpl
Y3RlZApjaGlsZCBleGl0cyB3aXRoIGEgcmF3IGVjYWxsLiBUaGUgdGVzdCBleHBlY3RzIC9wcm9j
IGFscmVhZHkKbW91bnRlZC4gVGhlIE1ha2VmaWxlIHNraXBzIHRoaXMgYmluYXJ5IHdoZW4gdGhl
IGNvbXBpbGVyIGNhbm5vdAp0YXJnZXQgemljZmlzcy96aWNmaWxwLgoKQXNzaXN0ZWQtYnk6IExM
TQpTaWduZWQtb2ZmLWJ5OiBJdsOhbiBFemVxdWllbCBSb2RyaWd1ZXogPGl2YW5yd2NtMjVAZ21h
aWwuY29tPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2NmaS9NYWtlZmlsZSAg
ICB8ICAgNSArLQogLi4uL3NlbGZ0ZXN0cy9yaXNjdi9jZmkvc2hzdGstY2xvbmUtcGlkZmQuYyAg
IHwgMTczICsrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxNzcgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL3Jpc2N2L2NmaS9zaHN0ay1jbG9uZS1waWRmZC5jCgpkaWZmIC0tZ2l0IGEvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvY2ZpL01ha2VmaWxlIGIvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvcmlzY3YvY2ZpL01ha2VmaWxlCmluZGV4IDQxOGI0YjUzMjVhNS4uZGJlY2IxZmQzYjgy
IDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9jZmkvTWFrZWZpbGUK
KysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvY2ZpL01ha2VmaWxlCkBAIC0xMywx
MCArMTMsMTMgQEAgZW5kaWYKIAogCiBpZmVxICgkKHNoZWxsICQoQ0MpICQoQ0ZMQUdTKSAtbm9z
dGRsaWIgLXhjIC9kZXYvbnVsbCAtbyAvZGV2L251bGwgPiAvZGV2L251bGwgMj4mMTsgZWNobyAk
JD8pLDApCi1URVNUX0dFTl9QUk9HUyA6PSBjZml0ZXN0cworVEVTVF9HRU5fUFJPR1MgOj0gY2Zp
dGVzdHMgc2hzdGstY2xvbmUtcGlkZmQKIAogJChPVVRQVVQpL2NmaXRlc3RzOiBjZml0ZXN0cy5j
IHNoYWRvd3N0YWNrLmMKIAkkKENDKSAtbyAkQCAkKENGTEFHUykgJChMREZMQUdTKSAkXgorCisk
KE9VVFBVVCkvc2hzdGstY2xvbmUtcGlkZmQ6IHNoc3RrLWNsb25lLXBpZGZkLmMKKwkkKENDKSAt
byAkQCAkKENGTEFHUykgJChMREZMQUdTKSAkXgogZWxzZQogCiAkKHNoZWxsIGVjaG8gIlRvb2xj
aGFpbiBkb2Vzbid0IHN1cHBvcnQgQ0ZJLCBza2lwcGluZyBDRkkga3NlbGZ0ZXN0LiIgPiYyKQpk
aWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvY2ZpL3Noc3RrLWNsb25l
LXBpZGZkLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9jZmkvc2hzdGstY2xvbmUt
cGlkZmQuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjFmMTZkOWM1
MTNlNgotLS0gL2Rldi9udWxsCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2Nm
aS9zaHN0ay1jbG9uZS1waWRmZC5jCkBAIC0wLDAgKzEsMTczIEBACisvLyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMAorLyoKKyAqIGNsb25lMyhDTE9ORV9WTXxDTE9ORV9QSURGRCkg
d2l0aCBhbiB1bndyaXRhYmxlIHBpZGZkIHBvaW50ZXIgbXVzdAorICogbm90IGxlYWsgYSBzaGFk
b3ctc3RhY2sgVk1BLiBjb3B5X3RocmVhZCgpIG1hcHMgb25lLCB0aGVuIHB1dF91c2VyKCkKKyAq
IGZhaWxzIGFuZCBjb3B5X3Byb2Nlc3MoKSBjYWxscyBleGl0X3RocmVhZCgpLiBXaXRob3V0IEhB
VkVfRVhJVF9USFJFQUQKKyAqIHRoYXQgZnJlZSBpcyBhIG5vLW9wIGFuZCB0aGUgVk1BIHN0YXlz
IGluIHRoZSBwYXJlbnQncyBtbS4KKyAqCisgKiBBZnRlciBlbmFibGluZyB0aGUgc2hhZG93IHN0
YWNrLCBkbyBub3QgcmV0dXJuIGZyb20gbWFpbigpOiBsaWJjCisgKiBmcmFtZXMgYWJvdmUgdGhh
dCBwb2ludCBoYXZlIG5vIHNoYWRvdy1zdGFjayBlbnRyaWVzLgorICovCisjZGVmaW5lIF9HTlVf
U09VUkNFCisKKyNpbmNsdWRlIDxlcnJuby5oPgorI2luY2x1ZGUgPGxpbnV4L3ByY3RsLmg+Cisj
aW5jbHVkZSA8bGludXgvc2NoZWQuaD4KKyNpbmNsdWRlIDxzY2hlZC5oPgorI2luY2x1ZGUgPHNp
Z25hbC5oPgorI2luY2x1ZGUgPHN0ZGludC5oPgorI2luY2x1ZGUgPHN0ZGlvLmg+CisjaW5jbHVk
ZSA8c3RkbGliLmg+CisjaW5jbHVkZSA8c3RyaW5nLmg+CisjaW5jbHVkZSA8c3lzL21tYW4uaD4K
KyNpbmNsdWRlIDxzeXMvc3lzY2FsbC5oPgorI2luY2x1ZGUgPHN5cy93YWl0Lmg+CisjaW5jbHVk
ZSA8dW5pc3RkLmg+CisKKyNpbmNsdWRlICIuLi8uLi9rc2VsZnRlc3QuaCIKKyNpbmNsdWRlICJj
ZmlfcnZfdGVzdC5oIgorCisjaWZuZGVmIF9fTlJfY2xvbmUzCisjZGVmaW5lIF9fTlJfY2xvbmUz
IDQzNQorI2VuZGlmCisKKyNpZm5kZWYgUFJfR0VUX1NIQURPV19TVEFDS19TVEFUVVMKKyNkZWZp
bmUgUFJfR0VUX1NIQURPV19TVEFDS19TVEFUVVMJNzQKKyNlbmRpZgorI2lmbmRlZiBQUl9TRVRf
U0hBRE9XX1NUQUNLX1NUQVRVUworI2RlZmluZSBQUl9TRVRfU0hBRE9XX1NUQUNLX1NUQVRVUwk3
NQorI2VuZGlmCisjaWZuZGVmIFBSX1NIQURPV19TVEFDS19FTkFCTEUKKyNkZWZpbmUgUFJfU0hB
RE9XX1NUQUNLX0VOQUJMRQkJKDFVTCA8PCAwKQorI2VuZGlmCisKKyNkZWZpbmUgTkNMT05FCQkJ
MTYKKyNkZWZpbmUgU1RBQ0tfU0laRQkJKDY0ICogMTAyNCkKKworc3RhdGljIGludCBjb3VudF9z
c192bWFzKHZvaWQpCit7CisJRklMRSAqZjsKKwljaGFyIGxpbmVbMjU2XTsKKwlpbnQgdm1hcyA9
IDA7CisKKwlmID0gZm9wZW4oIi9wcm9jL3NlbGYvc21hcHMiLCAiciIpOworCWlmICghZikKKwkJ
a3NmdF9leGl0X2ZhaWxfbXNnKCJmb3BlbiAvcHJvYy9zZWxmL3NtYXBzOiAlc1xuIiwKKwkJCQkg
ICBzdHJlcnJvcihlcnJubykpOworCisJd2hpbGUgKGZnZXRzKGxpbmUsIHNpemVvZihsaW5lKSwg
ZikpIHsKKwkJaWYgKCFzdHJuY21wKGxpbmUsICJWbUZsYWdzOiIsIDgpICYmIHN0cnN0cihsaW5l
LCAiIHNzIikpCisJCQl2bWFzKys7CisJfQorCWZjbG9zZShmKTsKKwlyZXR1cm4gdm1hczsKK30K
KworLyoKKyAqIFJhdyBlY2FsbDogdGhlIGNoaWxkIHJlc3VtZXMgb24gYW4gZW1wdHkgc2hhZG93
IHN0YWNrLCBzbyBhIGxpYmMKKyAqIHJldHVybiBhZnRlciBjbG9uZTMgd291bGQgZmF1bHQuCisg
Ki8KK3N0YXRpYyBsb25nIGNsb25lX3BpZGZkKHZvaWQgKnN0YWNrLCBzaXplX3Qgc3RhY2tfc2l6
ZSwgaW50ICpwaWRmZF9wdHIpCit7CisJc3RydWN0IGNsb25lX2FyZ3MgYXJncyA9IHsKKwkJLmZs
YWdzID0gQ0xPTkVfVk0gfCBDTE9ORV9QSURGRCwKKwkJLnBpZGZkID0gKHVpbnQ2NF90KSh1aW50
cHRyX3QpcGlkZmRfcHRyLAorCQkuZXhpdF9zaWduYWwgPSBTSUdDSExELAorCQkuc3RhY2sgPSAo
dWludDY0X3QpKHVpbnRwdHJfdClzdGFjaywKKwkJLnN0YWNrX3NpemUgPSBzdGFja19zaXplLAor
CX07CisJcmVnaXN0ZXIgbG9uZyBudW0gX19hc21fXygiYTciKSA9IF9fTlJfY2xvbmUzOworCXJl
Z2lzdGVyIGxvbmcgcmV0IF9fYXNtX18oImEwIikgPSAobG9uZykmYXJnczsKKwlyZWdpc3RlciBs
b25nIHN6IF9fYXNtX18oImExIikgPSBzaXplb2YoYXJncyk7CisJaW50IHN0OworCisJYXNtIHZv
bGF0aWxlKCJlY2FsbCIKKwkJICAgICA6ICIrciIocmV0KQorCQkgICAgIDogInIiKG51bSksICJy
IihzeikKKwkJICAgICA6ICJtZW1vcnkiLCAiY2MiKTsKKwlpZiAocmV0ID09IDApIHsKKwkJcmVn
aXN0ZXIgbG9uZyBuIF9fYXNtX18oImE3IikgPSBfX05SX2V4aXQ7CisJCXJlZ2lzdGVyIGxvbmcg
ZSBfX2FzbV9fKCJhMCIpID0gMDsKKworCQlhc20gdm9sYXRpbGUoImVjYWxsIiA6IDogInIiKG4p
LCAiciIoZSkgOiAibWVtb3J5Iik7CisJCV9fYnVpbHRpbl91bnJlYWNoYWJsZSgpOworCX0KKwlp
ZiAocmV0IDwgMCkKKwkJcmV0dXJuIHJldDsKKwlpZiAod2FpdHBpZCgocGlkX3QpcmV0LCAmc3Qs
IDApIDwgMCkKKwkJcmV0dXJuIC1lcnJubzsKKwlpZiAoIVdJRkVYSVRFRChzdCkgfHwgV0VYSVRT
VEFUVVMoc3QpICE9IDApCisJCXJldHVybiAxOworCXJldHVybiAwOworfQorCitpbnQgbWFpbih2
b2lkKQoreworCXZvaWQgKnN0YWNrOworCXZvaWQgKmJhZF9waWRmZDsKKwl1bnNpZ25lZCBsb25n
IHNzX21vZGUgPSAwOworCWxvbmcgcmM7CisJaW50IHBpZGZkID0gLTE7CisJaW50IHZtYXMwLCB2
bWFzMTsKKwlpbnQgaSwgbl9lZmF1bHQgPSAwOworCisJa3NmdF9wcmludF9oZWFkZXIoKTsKKwor
CXN0YWNrID0gbW1hcChOVUxMLCBTVEFDS19TSVpFLCBQUk9UX1JFQUQgfCBQUk9UX1dSSVRFLAor
CQkgICAgIE1BUF9QUklWQVRFIHwgTUFQX0FOT05ZTU9VUyB8IE1BUF9TVEFDSywgLTEsIDApOwor
CWlmIChzdGFjayA9PSBNQVBfRkFJTEVEKQorCQlrc2Z0X2V4aXRfZmFpbF9tc2coIm1tYXAgc3Rh
Y2s6ICVzXG4iLCBzdHJlcnJvcihlcnJubykpOworCisJYmFkX3BpZGZkID0gbW1hcChOVUxMLCA0
MDk2LCBQUk9UX05PTkUsCisJCQkgTUFQX1BSSVZBVEUgfCBNQVBfQU5PTllNT1VTLCAtMSwgMCk7
CisJaWYgKGJhZF9waWRmZCA9PSBNQVBfRkFJTEVEKQorCQlrc2Z0X2V4aXRfZmFpbF9tc2coIm1t
YXAgcGlkZmQgcGFnZTogJXNcbiIsIHN0cmVycm9yKGVycm5vKSk7CisKKwlyYyA9IG15X3N5c2Nh
bGw1KF9fTlJfcHJjdGwsIFBSX0dFVF9TSEFET1dfU1RBQ0tfU1RBVFVTLCAmc3NfbW9kZSwKKwkJ
CSAwLCAwLCAwKTsKKwlpZiAocmMgPT0gLUVOT1NZUyB8fCByYyA9PSAtRUlOVkFMIHx8IHJjID09
IC1FT1BOT1RTVVBQKQorCQlrc2Z0X2V4aXRfc2tpcCgic2hhZG93IHN0YWNrIG5vdCBhdmFpbGFi
bGU6ICVsZFxuIiwgcmMpOworCWlmIChyYykKKwkJa3NmdF9leGl0X2ZhaWxfbXNnKCJQUl9HRVRf
U0hBRE9XX1NUQUNLX1NUQVRVUzogJWxkXG4iLCByYyk7CisKKwlpZiAoIShzc19tb2RlICYgUFJf
U0hBRE9XX1NUQUNLX0VOQUJMRSkpIHsKKwkJcmMgPSBteV9zeXNjYWxsNShfX05SX3ByY3RsLCBQ
Ul9TRVRfU0hBRE9XX1NUQUNLX1NUQVRVUywKKwkJCQkgUFJfU0hBRE9XX1NUQUNLX0VOQUJMRSwg
MCwgMCwgMCk7CisJCWlmIChyYyA9PSAtRU9QTk9UU1VQUCB8fCByYyA9PSAtRUlOVkFMIHx8IHJj
ID09IC1FQlVTWSkKKwkJCWtzZnRfZXhpdF9za2lwKCJjYW5ub3QgZW5hYmxlIHNoYWRvdyBzdGFj
azogJWxkXG4iLAorCQkJCSAgICAgICByYyk7CisJCWlmIChyYykKKwkJCWtzZnRfZXhpdF9mYWls
X21zZygiUFJfU0VUX1NIQURPV19TVEFDS19TVEFUVVM6ICVsZFxuIiwKKwkJCQkJICAgcmMpOwor
CX0KKworCXJjID0gY2xvbmVfcGlkZmQoc3RhY2ssIFNUQUNLX1NJWkUsICZwaWRmZCk7CisJaWYg
KHJjID09IC1FTk9TWVMgfHwgcmMgPT0gLUVJTlZBTCB8fCByYyA9PSAtRVBFUk0pCisJCWtzZnRf
ZXhpdF9za2lwKCJjbG9uZTMgdmFsaWQgcGlkZmQgdW5hdmFpbGFibGU6ICVzXG4iLAorCQkJICAg
ICAgIHN0cmVycm9yKC1yYykpOworCisJa3NmdF9zZXRfcGxhbigzKTsKKworCWtzZnRfdGVzdF9y
ZXN1bHQocmMgPT0gMCAmJiBwaWRmZCA+PSAwLAorCQkJICJjbG9uZTMgdmFsaWQgcGlkZmQgKHJj
PSVsZCBwaWRmZD0lZClcbiIsCisJCQkgcmMsIHBpZGZkKTsKKwlpZiAocGlkZmQgPj0gMCkKKwkJ
Y2xvc2UocGlkZmQpOworCisJdm1hczAgPSBjb3VudF9zc192bWFzKCk7CisKKwlmb3IgKGkgPSAw
OyBpIDwgTkNMT05FOyBpKyspIHsKKwkJcmMgPSBjbG9uZV9waWRmZChzdGFjaywgU1RBQ0tfU0la
RSwgYmFkX3BpZGZkKTsKKwkJaWYgKHJjID09IC1FRkFVTFQpCisJCQluX2VmYXVsdCsrOworCX0K
Kwlrc2Z0X3Rlc3RfcmVzdWx0KG5fZWZhdWx0ID09IE5DTE9ORSwKKwkJCSAiY2xvbmUzIGJhZCBw
aWRmZCByZXR1cm5zIC1FRkFVTFQgeCVkXG4iLCBOQ0xPTkUpOworCisJdm1hczEgPSBjb3VudF9z
c192bWFzKCk7CisJa3NmdF90ZXN0X3Jlc3VsdCh2bWFzMSA9PSB2bWFzMCwKKwkJCSAibm8gc2hh
ZG93LXN0YWNrIFZNQSBsZWFrICglZCAtPiAlZClcbiIsCisJCQkgdm1hczAsIHZtYXMxKTsKKwor
CWtzZnRfZmluaXNoZWQoKTsKK30KLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
