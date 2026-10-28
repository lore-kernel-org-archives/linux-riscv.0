Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84258606A74B
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 15:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ddb8d16C;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n6HrigJI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Jhv6dEv0mb68kgDbu6IMy3spVjN6xLat4IglZ/kt9nQ=; b=Ddb8d16CnOEXdMZI9mNul3Hpjh
	4+rJSo53vwoiZl6BNplgFwrP1EFTkOPXoEKjpt9TZ6NYLNcaRNePqxWguZr6C+K5ksTq64WKkr7HO
	ZIwVJHeLFkj4tg7DSMbifmK5Li0ib5YBbC3eDbM/Ba38Tk6v7ospucS6h+nKb2ERBt9Let+uIa1yR
	xeI6+CEXfsxlti6drIRdYcFmbtN9rBJ8Q4dFJo5U0szLk7lmXh+I/Jj+ADPRLKnjRKdBcktjkQxv+
	zq0sLR0nnSs1ptgLhA9pgHvw1r9X/zHgTnx63Pi9ETjiLoVrHRAWReZ3csdSxbgIJgVrfme7db2os
	kpHCwmUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5pr-00000007Rwk-1m5D;
	Wed, 28 Oct 2026 15:45:07 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5pk-00000007Roi-2jO4
	for linux-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 15:45:04 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48e47347279so884023f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 08:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202298; x=1793807098; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mY4KZSmblzicF17NIegUjErpV+VQHRUnKGe9o1onwtc=;
        b=n6HrigJIQS6UQByAUFw9eqz2S9l+cbPdOst+beHsVEeKCbNH5uSWSNpRsKGfWWL0od
         KvOzw4uQk5Kzzv7Pkj9bG/0tRh/0feq/yBe9QPTgJf6OPK8ymJ16TKugReeVoWDRm6/0
         bAF+7K9Z1FFB+d/VBszVl7o3rDEAsCyuuwMfJ+DnAX9yuDJYntZi++dY/kREdcFtlhLq
         JBX+/NxrfJ8oy7sndfRJ7YFNJsubDfLyw2VZz2iwfUbWqZ3UU4ubiCIC/eumV3HrYSuL
         IhQjjnR1B7jd2rYxUjpZwUfaGSzA38m/WJ8hGeEanF4UywuRFZYemnjWxGy6vGpm20Vl
         ktCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202298; x=1793807098;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mY4KZSmblzicF17NIegUjErpV+VQHRUnKGe9o1onwtc=;
        b=HMHut6QZN3m2CihJAlPWjXiv+i14ylsr6oFpCfbok5JlCf1Xq5hMuJsFFpxOERnlt1
         xJA3XlQvNSCmeHR1J5ES5y4z30C4E85Ae66QVm7S7nkCy+Qx5Z0B1xLhocsrOZWBcvKC
         eQEY4u5m5pab0Es+MdWN1roBqrEyLsg941rltbi5mP9cL7a/LryGohUxznzSnuMyaDp7
         FULI5HPjI7yp1wSURDN87rZxyYoVF/UDt8EniEcc36r0oV7/o6wuPwJW7wGriWej3c7a
         Ul1Q6QgmoRm2lRW/ctnTOPikTa9dCkwvBVFNtfqhKGyJs0/tFm6X0N4cMBdnGRYes8ik
         51DQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsDxLzSBUkexJCjMRmSPLhx6ONlifkmvyXQ792L1POvOIm+ygRUBApRUuj7e8VaXmCh70INEm+2RwZaA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLtQb6rbEyY9L4EpXdhZE5vtTHgk2M3zMu8pb2WQsks0AxOk/jf
	ZKPgfftjJxViP35qxRYH4o1C7sF3heVF19erOAByD36MDcni7wU4i1FC
X-Gm-Gg: AYBFou1ZjOCfRwofKQmUiYYWtBmclScewXxMNKk5zK7PEC5+lqPyZaU0NVXxUk5LkHZ
	5d+90Iapcxes+RV5Q6rdbHiCBOfA3lpJAcKgDLnngvSFAtvHLN4n/vSVmxXUN/4zXdNZoWOGUjq
	JIQK9AaWrDhtUaC5VW5ePLEPW+66KzlsqcQ+cjs1XwInyxqU58+VsQ6FJAyNHTtW43DypySA6n6
	6W8FRbe0j4iTXC9edzgThQSRFBt3idQypWcdsSFjUXwGYcFBtDmSIeLauIRQyGp9+OKJvQBM2x7
	zL8+d0bUXa5WCYm4uohFpdt16WKcRijLxtIllsfPe2LKFoB8RJyfr2U92mohrS0HB7V9ATLDY1u
	1r3Fji5SUMLr+eEr8dZkIQryxDZJ1frI2P1AnZ1GznciFO+2svvosqRNwkVyIgWk3i2Bci5dyGp
	PDYyKbTFo/u0NIkKV6lVdAFFR54tQ7mWhtQ8ITfIEVtmjIdUXSiNCUtSYsv77XzSCVp8LEiKucE
	ZTIv3j9bUMQnIyPVHWZhRRjfAg8bcw3CSteNjm8bhRnIMpge7WcYiHje/0oDdVYtXaiCiA06on0
	QaOhAI4KDbhNxhkl6vXjysffucF4EaMFr7O0LsTkk1286zes2s2PamGgUwv10DaTJw==
X-Received: by 2002:a05:6000:1446:b0:487:91e:d8ed with SMTP id ffacd0b85a97d-48e5d58d47emr7093332f8f.2.1793202297940;
        Wed, 28 Oct 2026 08:44:57 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8c05sm37044493f8f.49.2026.10.28.08.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:44:55 -0700 (PDT)
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
Subject: [PATCH v3 4/4] selftests/riscv: shadow stack must not leak on a failed clone3
Date: Wed, 28 Oct 2026 12:43:15 -0300
Message-ID: <20261028154315.1272705-5-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
References: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_084500_767829_0A65048C 
X-CRM114-Status: GOOD (  20.18  )
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

U2FtZSBjbG9uZTMgYmFkLXBpZGZkIGNoZWNrIGFzIHRoZSBhcm02NCBHQ1Mgc2VsZnRlc3QuCgpB
c3Npc3RlZC1ieTogTExNClNpZ25lZC1vZmYtYnk6IEl2w6FuIEV6ZXF1aWVsIFJvZHJpZ3VleiA8
aXZhbnJ3Y20yNUBnbWFpbC5jb20+Ci0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3Yv
Y2ZpL01ha2VmaWxlICAgIHwgICA1ICstCiAuLi4vc2VsZnRlc3RzL3Jpc2N2L2NmaS9zaHN0ay1j
bG9uZS1waWRmZC5jICAgfCAxNzMgKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQs
IDE3NyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvY2ZpL3Noc3RrLWNsb25lLXBpZGZkLmMKCmRpZmYg
LS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9jZmkvTWFrZWZpbGUgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9jZmkvTWFrZWZpbGUKaW5kZXggNDE4YjRiNTMyNWE1
Li5kYmVjYjFmZDNiODIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2
L2NmaS9NYWtlZmlsZQorKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9jZmkvTWFr
ZWZpbGUKQEAgLTEzLDEwICsxMywxMyBAQCBlbmRpZgogCiAKIGlmZXEgKCQoc2hlbGwgJChDQykg
JChDRkxBR1MpIC1ub3N0ZGxpYiAteGMgL2Rldi9udWxsIC1vIC9kZXYvbnVsbCA+IC9kZXYvbnVs
bCAyPiYxOyBlY2hvICQkPyksMCkKLVRFU1RfR0VOX1BST0dTIDo9IGNmaXRlc3RzCitURVNUX0dF
Tl9QUk9HUyA6PSBjZml0ZXN0cyBzaHN0ay1jbG9uZS1waWRmZAogCiAkKE9VVFBVVCkvY2ZpdGVz
dHM6IGNmaXRlc3RzLmMgc2hhZG93c3RhY2suYwogCSQoQ0MpIC1vICRAICQoQ0ZMQUdTKSAkKExE
RkxBR1MpICReCisKKyQoT1VUUFVUKS9zaHN0ay1jbG9uZS1waWRmZDogc2hzdGstY2xvbmUtcGlk
ZmQuYworCSQoQ0MpIC1vICRAICQoQ0ZMQUdTKSAkKExERkxBR1MpICReCiBlbHNlCiAKICQoc2hl
bGwgZWNobyAiVG9vbGNoYWluIGRvZXNuJ3Qgc3VwcG9ydCBDRkksIHNraXBwaW5nIENGSSBrc2Vs
ZnRlc3QuIiA+JjIpCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9j
Zmkvc2hzdGstY2xvbmUtcGlkZmQuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2Nm
aS9zaHN0ay1jbG9uZS1waWRmZC5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAwMC4uMWYxNmQ5YzUxM2U2Ci0tLSAvZGV2L251bGwKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvcmlzY3YvY2ZpL3Noc3RrLWNsb25lLXBpZGZkLmMKQEAgLTAsMCArMSwxNzMgQEAKKy8v
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisvKgorICogY2xvbmUzKENMT05FX1ZN
fENMT05FX1BJREZEKSB3aXRoIGFuIHVud3JpdGFibGUgcGlkZmQgcG9pbnRlciBtdXN0CisgKiBu
b3QgbGVhayBhIHNoYWRvdy1zdGFjayBWTUEuIGNvcHlfdGhyZWFkKCkgbWFwcyBvbmUsIHRoZW4g
cHV0X3VzZXIoKQorICogZmFpbHMgYW5kIGNvcHlfcHJvY2VzcygpIGNhbGxzIGV4aXRfdGhyZWFk
KCkuIFdpdGhvdXQgSEFWRV9FWElUX1RIUkVBRAorICogdGhhdCBmcmVlIGlzIGEgbm8tb3AgYW5k
IHRoZSBWTUEgc3RheXMgaW4gdGhlIHBhcmVudCdzIG1tLgorICoKKyAqIEFmdGVyIGVuYWJsaW5n
IHRoZSBzaGFkb3cgc3RhY2ssIGRvIG5vdCByZXR1cm4gZnJvbSBtYWluKCk6IGxpYmMKKyAqIGZy
YW1lcyBhYm92ZSB0aGF0IHBvaW50IGhhdmUgbm8gc2hhZG93LXN0YWNrIGVudHJpZXMuCisgKi8K
KyNkZWZpbmUgX0dOVV9TT1VSQ0UKKworI2luY2x1ZGUgPGVycm5vLmg+CisjaW5jbHVkZSA8bGlu
dXgvcHJjdGwuaD4KKyNpbmNsdWRlIDxsaW51eC9zY2hlZC5oPgorI2luY2x1ZGUgPHNjaGVkLmg+
CisjaW5jbHVkZSA8c2lnbmFsLmg+CisjaW5jbHVkZSA8c3RkaW50Lmg+CisjaW5jbHVkZSA8c3Rk
aW8uaD4KKyNpbmNsdWRlIDxzdGRsaWIuaD4KKyNpbmNsdWRlIDxzdHJpbmcuaD4KKyNpbmNsdWRl
IDxzeXMvbW1hbi5oPgorI2luY2x1ZGUgPHN5cy9zeXNjYWxsLmg+CisjaW5jbHVkZSA8c3lzL3dh
aXQuaD4KKyNpbmNsdWRlIDx1bmlzdGQuaD4KKworI2luY2x1ZGUgIi4uLy4uL2tzZWxmdGVzdC5o
IgorI2luY2x1ZGUgImNmaV9ydl90ZXN0LmgiCisKKyNpZm5kZWYgX19OUl9jbG9uZTMKKyNkZWZp
bmUgX19OUl9jbG9uZTMgNDM1CisjZW5kaWYKKworI2lmbmRlZiBQUl9HRVRfU0hBRE9XX1NUQUNL
X1NUQVRVUworI2RlZmluZSBQUl9HRVRfU0hBRE9XX1NUQUNLX1NUQVRVUwk3NAorI2VuZGlmCisj
aWZuZGVmIFBSX1NFVF9TSEFET1dfU1RBQ0tfU1RBVFVTCisjZGVmaW5lIFBSX1NFVF9TSEFET1df
U1RBQ0tfU1RBVFVTCTc1CisjZW5kaWYKKyNpZm5kZWYgUFJfU0hBRE9XX1NUQUNLX0VOQUJMRQor
I2RlZmluZSBQUl9TSEFET1dfU1RBQ0tfRU5BQkxFCQkoMVVMIDw8IDApCisjZW5kaWYKKworI2Rl
ZmluZSBOQ0xPTkUJCQkxNgorI2RlZmluZSBTVEFDS19TSVpFCQkoNjQgKiAxMDI0KQorCitzdGF0
aWMgaW50IGNvdW50X3NzX3ZtYXModm9pZCkKK3sKKwlGSUxFICpmOworCWNoYXIgbGluZVsyNTZd
OworCWludCB2bWFzID0gMDsKKworCWYgPSBmb3BlbigiL3Byb2Mvc2VsZi9zbWFwcyIsICJyIik7
CisJaWYgKCFmKQorCQlrc2Z0X2V4aXRfZmFpbF9tc2coImZvcGVuIC9wcm9jL3NlbGYvc21hcHM6
ICVzXG4iLAorCQkJCSAgIHN0cmVycm9yKGVycm5vKSk7CisKKwl3aGlsZSAoZmdldHMobGluZSwg
c2l6ZW9mKGxpbmUpLCBmKSkgeworCQlpZiAoIXN0cm5jbXAobGluZSwgIlZtRmxhZ3M6IiwgOCkg
JiYgc3Ryc3RyKGxpbmUsICIgc3MiKSkKKwkJCXZtYXMrKzsKKwl9CisJZmNsb3NlKGYpOworCXJl
dHVybiB2bWFzOworfQorCisvKgorICogUmF3IGVjYWxsOiB0aGUgY2hpbGQgcmVzdW1lcyBvbiBh
biBlbXB0eSBzaGFkb3cgc3RhY2ssIHNvIGEgbGliYworICogcmV0dXJuIGFmdGVyIGNsb25lMyB3
b3VsZCBmYXVsdC4KKyAqLworc3RhdGljIGxvbmcgY2xvbmVfcGlkZmQodm9pZCAqc3RhY2ssIHNp
emVfdCBzdGFja19zaXplLCBpbnQgKnBpZGZkX3B0cikKK3sKKwlzdHJ1Y3QgY2xvbmVfYXJncyBh
cmdzID0geworCQkuZmxhZ3MgPSBDTE9ORV9WTSB8IENMT05FX1BJREZELAorCQkucGlkZmQgPSAo
dWludDY0X3QpKHVpbnRwdHJfdClwaWRmZF9wdHIsCisJCS5leGl0X3NpZ25hbCA9IFNJR0NITEQs
CisJCS5zdGFjayA9ICh1aW50NjRfdCkodWludHB0cl90KXN0YWNrLAorCQkuc3RhY2tfc2l6ZSA9
IHN0YWNrX3NpemUsCisJfTsKKwlyZWdpc3RlciBsb25nIG51bSBfX2FzbV9fKCJhNyIpID0gX19O
Ul9jbG9uZTM7CisJcmVnaXN0ZXIgbG9uZyByZXQgX19hc21fXygiYTAiKSA9IChsb25nKSZhcmdz
OworCXJlZ2lzdGVyIGxvbmcgc3ogX19hc21fXygiYTEiKSA9IHNpemVvZihhcmdzKTsKKwlpbnQg
c3Q7CisKKwlhc20gdm9sYXRpbGUoImVjYWxsIgorCQkgICAgIDogIityIihyZXQpCisJCSAgICAg
OiAiciIobnVtKSwgInIiKHN6KQorCQkgICAgIDogIm1lbW9yeSIsICJjYyIpOworCWlmIChyZXQg
PT0gMCkgeworCQlyZWdpc3RlciBsb25nIG4gX19hc21fXygiYTciKSA9IF9fTlJfZXhpdDsKKwkJ
cmVnaXN0ZXIgbG9uZyBlIF9fYXNtX18oImEwIikgPSAwOworCisJCWFzbSB2b2xhdGlsZSgiZWNh
bGwiIDogOiAiciIobiksICJyIihlKSA6ICJtZW1vcnkiKTsKKwkJX19idWlsdGluX3VucmVhY2hh
YmxlKCk7CisJfQorCWlmIChyZXQgPCAwKQorCQlyZXR1cm4gcmV0OworCWlmICh3YWl0cGlkKChw
aWRfdClyZXQsICZzdCwgMCkgPCAwKQorCQlyZXR1cm4gLWVycm5vOworCWlmICghV0lGRVhJVEVE
KHN0KSB8fCBXRVhJVFNUQVRVUyhzdCkgIT0gMCkKKwkJcmV0dXJuIDE7CisJcmV0dXJuIDA7Cit9
CisKK2ludCBtYWluKHZvaWQpCit7CisJdm9pZCAqc3RhY2s7CisJdm9pZCAqYmFkX3BpZGZkOwor
CXVuc2lnbmVkIGxvbmcgc3NfbW9kZSA9IDA7CisJbG9uZyByYzsKKwlpbnQgcGlkZmQgPSAtMTsK
KwlpbnQgdm1hczAsIHZtYXMxOworCWludCBpLCBuX2VmYXVsdCA9IDA7CisKKwlrc2Z0X3ByaW50
X2hlYWRlcigpOworCisJc3RhY2sgPSBtbWFwKE5VTEwsIFNUQUNLX1NJWkUsIFBST1RfUkVBRCB8
IFBST1RfV1JJVEUsCisJCSAgICAgTUFQX1BSSVZBVEUgfCBNQVBfQU5PTllNT1VTIHwgTUFQX1NU
QUNLLCAtMSwgMCk7CisJaWYgKHN0YWNrID09IE1BUF9GQUlMRUQpCisJCWtzZnRfZXhpdF9mYWls
X21zZygibW1hcCBzdGFjazogJXNcbiIsIHN0cmVycm9yKGVycm5vKSk7CisKKwliYWRfcGlkZmQg
PSBtbWFwKE5VTEwsIDQwOTYsIFBST1RfTk9ORSwKKwkJCSBNQVBfUFJJVkFURSB8IE1BUF9BTk9O
WU1PVVMsIC0xLCAwKTsKKwlpZiAoYmFkX3BpZGZkID09IE1BUF9GQUlMRUQpCisJCWtzZnRfZXhp
dF9mYWlsX21zZygibW1hcCBwaWRmZCBwYWdlOiAlc1xuIiwgc3RyZXJyb3IoZXJybm8pKTsKKwor
CXJjID0gbXlfc3lzY2FsbDUoX19OUl9wcmN0bCwgUFJfR0VUX1NIQURPV19TVEFDS19TVEFUVVMs
ICZzc19tb2RlLAorCQkJIDAsIDAsIDApOworCWlmIChyYyA9PSAtRU5PU1lTIHx8IHJjID09IC1F
SU5WQUwgfHwgcmMgPT0gLUVPUE5PVFNVUFApCisJCWtzZnRfZXhpdF9za2lwKCJzaGFkb3cgc3Rh
Y2sgbm90IGF2YWlsYWJsZTogJWxkXG4iLCByYyk7CisJaWYgKHJjKQorCQlrc2Z0X2V4aXRfZmFp
bF9tc2coIlBSX0dFVF9TSEFET1dfU1RBQ0tfU1RBVFVTOiAlbGRcbiIsIHJjKTsKKworCWlmICgh
KHNzX21vZGUgJiBQUl9TSEFET1dfU1RBQ0tfRU5BQkxFKSkgeworCQlyYyA9IG15X3N5c2NhbGw1
KF9fTlJfcHJjdGwsIFBSX1NFVF9TSEFET1dfU1RBQ0tfU1RBVFVTLAorCQkJCSBQUl9TSEFET1df
U1RBQ0tfRU5BQkxFLCAwLCAwLCAwKTsKKwkJaWYgKHJjID09IC1FT1BOT1RTVVBQIHx8IHJjID09
IC1FSU5WQUwgfHwgcmMgPT0gLUVCVVNZKQorCQkJa3NmdF9leGl0X3NraXAoImNhbm5vdCBlbmFi
bGUgc2hhZG93IHN0YWNrOiAlbGRcbiIsCisJCQkJICAgICAgIHJjKTsKKwkJaWYgKHJjKQorCQkJ
a3NmdF9leGl0X2ZhaWxfbXNnKCJQUl9TRVRfU0hBRE9XX1NUQUNLX1NUQVRVUzogJWxkXG4iLAor
CQkJCQkgICByYyk7CisJfQorCisJcmMgPSBjbG9uZV9waWRmZChzdGFjaywgU1RBQ0tfU0laRSwg
JnBpZGZkKTsKKwlpZiAocmMgPT0gLUVOT1NZUyB8fCByYyA9PSAtRUlOVkFMIHx8IHJjID09IC1F
UEVSTSkKKwkJa3NmdF9leGl0X3NraXAoImNsb25lMyB2YWxpZCBwaWRmZCB1bmF2YWlsYWJsZTog
JXNcbiIsCisJCQkgICAgICAgc3RyZXJyb3IoLXJjKSk7CisKKwlrc2Z0X3NldF9wbGFuKDMpOwor
CisJa3NmdF90ZXN0X3Jlc3VsdChyYyA9PSAwICYmIHBpZGZkID49IDAsCisJCQkgImNsb25lMyB2
YWxpZCBwaWRmZCAocmM9JWxkIHBpZGZkPSVkKVxuIiwKKwkJCSByYywgcGlkZmQpOworCWlmIChw
aWRmZCA+PSAwKQorCQljbG9zZShwaWRmZCk7CisKKwl2bWFzMCA9IGNvdW50X3NzX3ZtYXMoKTsK
KworCWZvciAoaSA9IDA7IGkgPCBOQ0xPTkU7IGkrKykgeworCQlyYyA9IGNsb25lX3BpZGZkKHN0
YWNrLCBTVEFDS19TSVpFLCBiYWRfcGlkZmQpOworCQlpZiAocmMgPT0gLUVGQVVMVCkKKwkJCW5f
ZWZhdWx0Kys7CisJfQorCWtzZnRfdGVzdF9yZXN1bHQobl9lZmF1bHQgPT0gTkNMT05FLAorCQkJ
ICJjbG9uZTMgYmFkIHBpZGZkIHJldHVybnMgLUVGQVVMVCB4JWRcbiIsIE5DTE9ORSk7CisKKwl2
bWFzMSA9IGNvdW50X3NzX3ZtYXMoKTsKKwlrc2Z0X3Rlc3RfcmVzdWx0KHZtYXMxID09IHZtYXMw
LAorCQkJICJubyBzaGFkb3ctc3RhY2sgVk1BIGxlYWsgKCVkIC0+ICVkKVxuIiwKKwkJCSB2bWFz
MCwgdm1hczEpOworCisJa3NmdF9maW5pc2hlZCgpOworfQotLSAKMi40My4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
