Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A2B60A6F69
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 15:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e8835KiM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z4hs0SOE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QIL7iM+kkuhBr8AS4H7ugI8H8Gpm4DbROPloIHsOwpY=; b=e8835KiMGbzRnyhjtkzNMJmGlB
	77csPAv/U1XRJpBho4bKrldOJmDvc+CZXls7d1Dor3+m8zF0DQG/K54Etl0YnAp9l6tipKInpBqDE
	xgeh85SvcQqw+exh5FGqpbCvQyMXy83ewQvUbJOyFatDRvJaf4Sxwujv9UdYRPHlUvluPuIPWYCVQ
	9eVPHqygyZNWs2Z/pyu7HTIUTiRuCLyz0VIT1P6PC2L/1eLnh+OWKOGL/fOLqswovI8EdkE8RSh6B
	sPjmxNI216nsfKrdqFXDNdNpcS+TjdmJE/xsh60Ta5d+F0e7ngAIofrnhFeqgjuGE9LDatiHbrMGK
	EJ/aZj0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5pD-00000007RNn-1BWD;
	Wed, 28 Oct 2026 15:44:27 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5pA-00000007RKv-3NtG
	for linux-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 15:44:26 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so7511695e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 08:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202261; x=1793807061; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hqyoatBuWzt+rzT6XLIO+YQLmt48/m/aZM3ACi+9940=;
        b=z4hs0SOEv0p/KKh5zFAK/E546ZfeQ7FtyzdYv/P+kA4i8FoLoTcN8F5BHJ0Dw6FFSt
         2UesXDl7el2IPKUQbYuKVBlPWh009dJ2ZITi3xXAXd+jySEU2/cTlgF77pO4G7fzerK0
         q4URLlN8oLtUMSQv01n4VwITvvD8v8ItlI002fOiKCz3IHYZAotdv5O3ya0e+CtgavyN
         QTRvRBdBfpTRAXaTpJxwPYMcxN4zs9ocb4tRS+P/ME0P3xMWbaI3ReAmCZ64eju49fBQ
         C0zmhIVGpXACBYI4byp8rQKe+my/fWonfjQzDUglxliI/x/diXIx/NHOeOH/ZQyWgX4N
         w14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202261; x=1793807061;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hqyoatBuWzt+rzT6XLIO+YQLmt48/m/aZM3ACi+9940=;
        b=W7V3snElD2owreYdtyqch56j/32BKRRk5vxjwCqQvRXLX79b8YMNFl+wsRdg1iVWe9
         h7ANXhuEGuJQBO8wXlBP3tXL5dtrQy6Rgn1J/ikm53pwijNPzSuGl9s2EswWJqpY/Gg3
         QCe2BSSlaj8lvQOxOmAuCqLy2DeacRppQQK8Skj2PyLRbxMRdpd72YjtYs6H3oJ+N94n
         dX5mTV15mDf3Jz13s62ogrHOfzMauq/WEPfsxsbhjaSCwl44NMnVZ1d3eCbYQVtAgNxC
         8iRuTMnPX3nHqfI6g+7M6QXBEODIxcAJlQBwvUzmkxiz/bAOSHs+jqBakTKpio4/6Myp
         57uw==
X-Forwarded-Encrypted: i=1; AKwUvBwy0W0EzGsEiHUsROTUV8pwEGbIFWKR2r4kUZg/LbNmsIf0QzTy63drm2D7Mbpq2SondIyjHg8ByqyFeg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKlK1GWN+pNMUg664QscKlkBUGH4eNooao+bekC5SOjDs9UY8Xe
	LWlUKvlfin4TVlOZRBSUCt3Vo+TRbqa5NVLRCpb8kLnUOgR36Ty+qYDI
X-Gm-Gg: AYBFou2SXmov3JM7KmDnO2C0NB3og38MD2MDeRvU/budDcH5ukzlzb89F620ac9KK9d
	PRbWHgDhkXx36EMe4WrnT71VN/Aj9mu0w8JMtYBXXr98cSgTTo8GuO38qhhTQgyEqRxj6mdP03c
	TaypZkqxXuTxzBxBGODULDE4/U5oEyu4lA3BwUcbdPdtx/ocy4BZN17b2DY9iORhdqH0Ol5EUur
	CTn80TPUa+SQcfRyu0pW8eqH8fwDJbIeTC8IT7jLlZgcSR9qCYf4Leb9NnVks/axZN1XXtjnguS
	N1LAsL2l2kRKQzXjINsWKfiK+g7lNmRqUnpRhUr3uKdgmiq/k6EPObp0xjZqQBWqhv+wtXRCgEq
	0oCf7sQVoUshV8QJOHFEdehrMh5F7SJ5QuTSEkH2bQvtkzOR3XqPvQnhtnYhiaeBQv0ZJ06GQAR
	dn5EZ0lsxbyNRk/9kJbxpDCeXX3HxWn41fg97QNcOkEz1LySPpSWtvKcHtSOTLWp/qTkNAfmwS1
	T8RT+3FPhygn8/CkgvyhbmJwFc39Teh87ydueLL6nsOKrtnXOeSrpeUBAF1KPGvBXCP8gglUSkw
	x13baMxtl0dEhZaz+b23O/4pis06ga326iBCY7uQs7O7r45YXwAazb+yyJC2TmyT1w==
X-Received: by 2002:a05:600c:8b6d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4a967f8c344mr59591525e9.31.1793202261496;
        Wed, 28 Oct 2026 08:44:21 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8c05sm37044493f8f.49.2026.10.28.08.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:44:20 -0700 (PDT)
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
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/4] riscv/shstk: release shadow stack on failed fork
Date: Wed, 28 Oct 2026 12:43:13 -0300
Message-ID: <20261028154315.1272705-3-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
References: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_084424_871569_F4E3FFA2 
X-CRM114-Status: GOOD (  10.92  )
X-Spam-Score: 0.1 (/)
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

U2FtZSBob2xlIGFzIGFybTY0OiBjb3B5X3RocmVhZCgpIG1hcHMgYSBDTE9ORV9WTSBzaGFkb3cg
c3RhY2ssCmNvcHlfcHJvY2VzcygpIGZhaWxzIGxhdGVyLCBleGl0X3RocmVhZCgpIHJhbiBidXQg
d2FzIG5ldmVyCmltcGxlbWVudGVkLiBTZWxlY3QgSEFWRV9FWElUX1RIUkVBRCBhbmQgY2FsbCBz
aHN0a19yZWxlYXNlKCkuCgpzaHN0a19yZWxlYXNlKCkgYWxyZWFkeSBkb2N1bWVudGVkIHRoaXMg
cGF0aDsgY29ubmVjdCBpdC4gQ2xlYXIKaW5oZXJpdGVkIHRyYWNraW5nIG9uIHRoZSBhcmdzLT5m
biBwYXRoIGZvciB0aGUgc2FtZSBDTE9ORV9WTQpyZWFzb24gYXMgYXJtNjQuCgpGaXhlczogZmQ0
NGE0YTg1NTE2ICgicmlzY3Yvc2hzdGs6IElmIG5lZWRlZCBhbGxvY2F0ZSBhIG5ldyBzaGFkb3cg
c3RhY2sgb24gY2xvbmUiKQpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpDYzogRGVlcGFrIEd1
cHRhIDxkZWJ1Z0ByaXZvc2luYy5jb20+CkFzc2lzdGVkLWJ5OiBMTE0KU2lnbmVkLW9mZi1ieTog
SXbDoW4gRXplcXVpZWwgUm9kcmlndWV6IDxpdmFucndjbTI1QGdtYWlsLmNvbT4KLS0tCiBhcmNo
L3Jpc2N2L0tjb25maWcgICAgICAgICAgfCAxICsKIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3Mu
YyB8IDkgKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKaW5kZXggNmM5
ZDYxZDgzZDcxLi5iYTFlZTU2M2FhNTQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwor
KysgYi9hcmNoL3Jpc2N2L0tjb25maWcKQEAgLTE2OCw2ICsxNjgsNyBAQCBjb25maWcgUklTQ1YK
IAlzZWxlY3QgSEFWRV9GVU5DVElPTl9HUkFQSF9GUkVHUwogCXNlbGVjdCBIQVZFX0ZVTkNUSU9O
X1RSQUNFUiBpZiBIQVZFX0RZTkFNSUNfRlRSQUNFCiAJc2VsZWN0IEhBVkVfRUJQRl9KSVQgaWYg
TU1VCisJc2VsZWN0IEhBVkVfRVhJVF9USFJFQUQKIAlzZWxlY3QgSEFWRV9HRU5FUklDX1RJRl9C
SVRTCiAJc2VsZWN0IEhBVkVfR1VQX0ZBU1QgaWYgTU1VCiAJc2VsZWN0IEhBVkVfRlVOQ1RJT05f
QVJHX0FDQ0VTU19BUEkKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYwppbmRleCA3Y2M1YTZhNWMwMjAuLjViYjkzMzc3
ZDY3ZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCisrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL3Byb2Nlc3MuYwpAQCAtMTIsNiArMTIsNyBAQAogI2luY2x1ZGUgPGxpbnV4
L2tlcm5lbC5oPgogI2luY2x1ZGUgPGxpbnV4L3NjaGVkLmg+CiAjaW5jbHVkZSA8bGludXgvc2No
ZWQvZGVidWcuaD4KKyNpbmNsdWRlIDxsaW51eC9zY2hlZC90YXNrLmg+CiAjaW5jbHVkZSA8bGlu
dXgvc2NoZWQvdGFza19zdGFjay5oPgogI2luY2x1ZGUgPGxpbnV4L3RpY2suaD4KICNpbmNsdWRl
IDxsaW51eC9wdHJhY2UuaD4KQEAgLTIxMyw2ICsyMTQsMTIgQEAgdm9pZCBhcmNoX3JlbGVhc2Vf
dGFza19zdHJ1Y3Qoc3RydWN0IHRhc2tfc3RydWN0ICp0c2spCiAJCXJpc2N2X3ZfdGhyZWFkX2Zy
ZWUodHNrKTsKIH0KIAordm9pZCBleGl0X3RocmVhZChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaykK
K3sKKwkvKiBGYWlsZWQgZm9yayBhZnRlciBjb3B5X3RocmVhZCgpOyBkZWFjdGl2YXRlX21tKCkg
ZG9lcyBub3QgcnVuLiAqLworCXNoc3RrX3JlbGVhc2UodHNrKTsKK30KKwogaW50IGFyY2hfZHVw
X3Rhc2tfc3RydWN0KHN0cnVjdCB0YXNrX3N0cnVjdCAqZHN0LCBzdHJ1Y3QgdGFza19zdHJ1Y3Qg
KnNyYykKIHsKIAlmc3RhdGVfc2F2ZShzcmMsIHRhc2tfcHRfcmVncyhzcmMpKTsKQEAgLTI2MSw2
ICsyNjgsOCBAQCBpbnQgY29weV90aHJlYWQoc3RydWN0IHRhc2tfc3RydWN0ICpwLCBjb25zdCBz
dHJ1Y3Qga2VybmVsX2Nsb25lX2FyZ3MgKmFyZ3MpCiAJCXAtPnRocmVhZC5zWzBdID0gKHVuc2ln
bmVkIGxvbmcpYXJncy0+Zm47CiAJCXAtPnRocmVhZC5zWzFdID0gKHVuc2lnbmVkIGxvbmcpYXJn
cy0+Zm5fYXJnOwogCQlwLT50aHJlYWQucmEgPSAodW5zaWduZWQgbG9uZylyZXRfZnJvbV9mb3Jr
X2tlcm5lbF9hc207CisJCS8qIE5vIHVzZXIgc2hzdGsgYWxsb2MgaGVyZTsgZHJvcCBpbmhlcml0
ZWQgdHJhY2tpbmcgZm9yIENMT05FX1ZNLiAqLworCQlzZXRfc2hzdGtfYmFzZShwLCAwLCAwKTsK
IAl9IGVsc2UgewogCQkvKiBhbGxvY2F0ZSBuZXcgc2hhZG93IHN0YWNrIGlmIG5lZWRlZC4gSW4g
Y2FzZSBvZiBDTE9ORV9WTSB3ZSBoYXZlIHRvICovCiAJCXNzcCA9IHNoc3RrX2FsbG9jX3RocmVh
ZF9zdGFjayhwLCBhcmdzKTsKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
