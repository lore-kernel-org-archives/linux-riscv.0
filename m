Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2D4606A31D
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 15:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YOYDPh7y;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tJrWKxP0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GztkwTDm/ViHO+F3Je8UanPSIl2gAxPDJuH7QdxBtog=; b=YOYDPh7yMmR7Eg6fuPM3UZhI/R
	E05AGQPJD0Wk0TQBUGqHZntWCFWg1YIyfY5IxdReJuJEah1+kA/YOXV1vS3MrNozACExOuAgQ4QxJ
	G23ndUEo9tfG9cWEEUBgYetYPRIZmue1a7M7rqqDtd7vTsd5ypi3gN2wr5QK13QhWTokPKU+KY6WO
	kVEHtZUkbeWdYOEwA+HUIWOEMvitJX088EP3nnTYbnanTzf41Agjvl+stDCaxOWuV8dSPssObv4sQ
	rUybKVdt11XhXfNGXnhg51oCtJOW7rGgakWGF8QdRQOCNVYguQwOKBRmRYCyEY1MZsFg9OW25y6RF
	L/Zbr9YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5oc-00000007R3h-0yCt;
	Wed, 28 Oct 2026 15:43:50 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5oa-00000007R1y-14Rk
	for linux-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 15:43:49 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso895105f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 08:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202225; x=1793807025; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b/2i5085qoCW25HAHUxPCuBLSPl8xZ1dIdcLMdJHBiQ=;
        b=tJrWKxP07sKx1n4GrrWD6Ab01hTm22c7oOCXQTAkBW7X9mgGFqc0Cp4WmZDfAyTs2H
         HO86GNKR3zzp8ypZs6TO5hdUabwKfk7q11wcgVu3FsrDk9FNwRdrDstUWkYBJY6xyVyP
         L2RV89tZcIJiK/X0IOP9JV44sT9zCEGdkiJaavV23gjmaCp6bzCmHCvu/K/h9W+K9ucJ
         2Unv8YPbBDU6AKUK2kJJPoYoPMkQpCjHf55RXlAJKbGOCrtFDinZgSxDat7dTU+oRPYe
         0vaFd2QXJq8HBsNEjivtGsjc7EpHYVcLq3fMXo0nXBZRkjE/MaOOwcn6VSDO0D/+TAJV
         thzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202225; x=1793807025;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b/2i5085qoCW25HAHUxPCuBLSPl8xZ1dIdcLMdJHBiQ=;
        b=VdT9EfrhI5aJfJmHbBrW0hWjAD+bmbOOO6P5bp9lz2JvzosgaNw/Rduag/4vvHhzjh
         zMWoNjnqxhAONribhFfgQ7VFJjHR8xiKzjkLPsjuW19EBt86uN8+2bVTVrQ5eImZdnBY
         jTKpnVLwnVj5kSHhv+mlbAgDaksY/kXq+IGhtkZCw+vtJk5MFHXaemI/NhknSAwHbGie
         tC5VBnjouerCVKDP75s2u56vTMpuDlXuJ6vrNH9LM0IAcfeVw70/LRDBO+PEDHvLR61N
         ++oJDk6/KBFm4Pd7warYxc0Z2JRTVu1CgPFZBjAWV5HPjcd3UIkfXUEk2EJNBqTwYpfE
         ERow==
X-Forwarded-Encrypted: i=1; AKwUvBwj4eJ5O/LF6sdZpbKlFCwsvXAuWXr6JO6EUWl4A6kJZwhrlIS73utSeHpcW91G2RFa5GogT330Q2hazg==@lists.infradead.org
X-Gm-Message-State: AFq9FYK4Ppenhxm3SprsvbYr9M7dPKJvh+RyOr9kNnDF+bGU0ei+6fwi
	wQPWVPHNVqY3yU/V5gPJdKLc+LR/wTQva+aXps6lV0oupdQbEcvVbEAN
X-Gm-Gg: AYBFou3hGWg3/fLyG2LUv/sQ9zML5DDczQVlhlz1Aail3MaLPr0llp+Jd890iYRwpHU
	3i5rYWCFrnv1biS5bdGSjeoeGzNuRFfazIlcM3cVBw15k9y0/fnPgjy4WkEA+wNO40G65JNpJGn
	IRkHx9xq8EMSNN7GtYsJ9mfctZH1WpRI5C4H4KQ172IDkxXvadnKpsc3zrkUeRZtzrtE4l9kPxv
	6j0+FneuYNo3+PioO6H7KQgHvdaWkj1W27oQXIng7kvj5340SjHwbQvsGTHAbKKp8dDO4N35Dqi
	4NTe3iFdqMq5CmUrCnDMScTBhtDpZFYNaJs7UaAuqZMBlUNfeFddG5C6RW/ltKoGha1aoPU4+RW
	QjhMQ5+KzHEUnMkbaWdTxc4xzBwLTyzJ12arRkD48fefwZ9iGgXXKAl08tlaBrWUrwusLdUZ8H+
	vjl2C/A5C1G5P5qgPljqAGBq6EQIi3/X+SeYU1Wl5Nc+LqTpjUHd78y1q+Y3DjCjsOBSXfxk51y
	eymJopDS1RrXk/h2Ut/7F0UzaEAa/vEpQZnyP3yhevy/nbrGM63+Llc+8UAjpe/44jXzkTgPt7u
	rVy8Z8FgDeVyHl8cyDFc9JrLzs5+fszADJCbKk9S1y0H17bBPKXDxll7oE1PqmqPOw==
X-Received: by 2002:a05:6000:61b:b0:48a:f36d:fb57 with SMTP id ffacd0b85a97d-48e5d2e4a4amr7127543f8f.18.1793202225120;
        Wed, 28 Oct 2026 08:43:45 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8c05sm37044493f8f.49.2026.10.28.08.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:43:42 -0700 (PDT)
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
Subject: [PATCH v3 0/4] arm64, riscv: release shadow stacks on failed fork
Date: Wed, 28 Oct 2026 12:43:11 -0300
Message-ID: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_084348_307584_9C869946 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Y2xvbmUzKENMT05FX1ZNfENMT05FX1BJREZEKSBjYW4gZmFpbCBpbiBwdXRfdXNlcigpIGFmdGVy
IGNvcHlfdGhyZWFkKCkKaGFzIG1hcHBlZCBhIHNoYWRvdyBzdGFjayBpbnRvIHRoZSBzaGFyZWQg
bW0uIGNvcHlfcHJvY2VzcygpIHRoZW4gY2FsbHMKZXhpdF90aHJlYWQoKS4gYXJtNjQgYW5kIHJp
c2N2IGRpZCBub3QgaW1wbGVtZW50IGl0LCBzbyB0aGUgVk1BIGxlYWtlZC4KCng4NiBhbHJlYWR5
IGZyZWVzIHZpYSBleGl0X3RocmVhZCgpIC0+IHNoc3RrX2ZyZWUoKS4gSXRzIHNlcGFyYXRlIFRM
UwpsZWFrIGlzIHdoZW4gY29weV90aHJlYWQoKSBmYWlscyBhZnRlciB0aGUgYWxsb2MgYW5kIHNr
aXBzIGV4aXRfdGhyZWFkKCkuCgpDaGFuZ2VzIHNpbmNlIHYyOgotIE1vdmUgZ2NzX3Jlc2V0X3Ro
cmVhZCgpIGludG8gcHJvY2Vzcy5jIChNYXJrIEJyb3duKS4KLSBTcGVsbCBvdXQgdGhlIHg4NiB2
cyBhcm02NC9yaXNjdiBkaWZmZXJlbmNlIGFib3ZlLgoKdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC9jb3Zlci4xNzkyNTE5MTIxLmdpdC5pdmFucndjbTI1QGdtYWlsLmNvbS8KCkFzc2lz
dGVkLWJ5OiBMTE0KCgpJdsOhbiBFemVxdWllbCBSb2RyaWd1ZXogKDQpOgogIGFybTY0L2djczog
cmVsZWFzZSBHQ1Mgb24gZmFpbGVkIGZvcmsKICByaXNjdi9zaHN0azogcmVsZWFzZSBzaGFkb3cg
c3RhY2sgb24gZmFpbGVkIGZvcmsKICBzZWxmdGVzdHMvYXJtNjQ6IEdDUyBtdXN0IG5vdCBsZWFr
IG9uIGEgZmFpbGVkIGNsb25lMwogIHNlbGZ0ZXN0cy9yaXNjdjogc2hhZG93IHN0YWNrIG11c3Qg
bm90IGxlYWsgb24gYSBmYWlsZWQgY2xvbmUzCgogYXJjaC9hcm02NC9LY29uZmlnICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGFyY2gvYXJtNjQva2VybmVsL3Byb2Nlc3MuYyAg
ICAgICAgICAgICAgICAgICB8ICAxNiArKwogYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAxICsKIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyAgICAg
ICAgICAgICAgICAgICB8ICAgOSArCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9hcm02NC9nY3Mv
TWFrZWZpbGUgICAgfCAgIDMgKy0KIC4uLi9zZWxmdGVzdHMvYXJtNjQvZ2NzL2djcy1jbG9uZS1w
aWRmZC5jICAgICB8IDE2OCArKysrKysrKysrKysrKysrKwogLi4uL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2FybTY0L2djcy9nY3MtbG9ja2luZy5jIHwgIDIwIC0tCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9hcm02NC9nY3MvZ2NzLXV0aWwuaCAgfCAgMjQgKysrCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9hcm02NC9nY3MvbGliYy1nY3MuYyAgfCAgMjAgLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L3Jpc2N2L2NmaS9NYWtlZmlsZSAgICB8ICAgNSArLQogLi4uL3NlbGZ0ZXN0cy9yaXNjdi9jZmkv
c2hzdGstY2xvbmUtcGlkZmQuYyAgIHwgMTczICsrKysrKysrKysrKysrKysrKwogMTEgZmlsZXMg
Y2hhbmdlZCwgMzk4IGluc2VydGlvbnMoKyksIDQyIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2FybTY0L2djcy9nY3MtY2xvbmUtcGlkZmQu
YwogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2NmaS9z
aHN0ay1jbG9uZS1waWRmZC5jCgotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
