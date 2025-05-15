Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA27C54756
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 08:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TpOiye4DTM76Dp3Nsn+C9B4l1z5yAuLX0VcwNwF+FSM=; b=uU8F32aDD8ubCv
	RD2m1wtkmXSnmT4N52rLMzvA403B/H0HPA1KQL4REtkE5qeUC2Q+WnG44pgtmmsWuDw2Lsu5A913l
	EYIygFlchDqwP2DCnHboQYnmHCaMxs1Rq+8lNWCfoIY7GTa+UCAke3rnsGNvJPZD6vM6MWojmalbK
	yjh5WfmQTxTcyMHrm5xNTc7nOMnU7m/gP4KpsSYGJfG/jap5eINE76Kd6GwBjxySXaadAt3Jw4Ea9
	2nL3DguFi+d1c8xSt2sVWVocJAoNh1mg3b5k4edMnv+fu8iDq0TEbZCpcJ2MKyZ9SbnfTgZifHdQa
	A5q8+cFqRRSD82aHMvpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTyA-0000000HXfn-2H07;
	Thu, 15 May 2025 08:29:34 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTsZ-0000000HVfk-2J7p
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 08:23:49 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so4636615e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 01:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297426; x=1747902226; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVRcVKoxl0DwUNG2KUS/gJuyrRdppt9iuLXI01MGzME=;
        b=dnBCLscNfpDJtjHxaiWRpBQU0xZvZuIQkQitcBsybvLPmEYPK+ZZ+7WQ4JqOo+QKH7
         jVKr2aRHR4wNrr/1vhmABqPAeXhN0/UgcyQeWHZPI3N1utdiSs1oHP5jaJAoY9gsKKfJ
         GQXFnrLCD89o57c2kUxXcQFh6bD6AOTSXB1+s43uQWOTW1huGYaB/3qkB640TCRWq2V6
         YoUokOIhmjqm5E7H4mlEB1+PvEpbg0/lZOSPlFqem3TvK/TaU3H9TqcUFGQhW5eNNWn1
         ZEZmdriTefQvZyfCShoYw3UQVQ2KFDju/iqPlUepEuha2NS782X54y14DquTqMTv0b7/
         k79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297426; x=1747902226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVRcVKoxl0DwUNG2KUS/gJuyrRdppt9iuLXI01MGzME=;
        b=ukcCPqwPQ7j3u6fkBIGuUNsdlPM3B9Hs2TvfkiMcioLcLHsXoD9IJHqpyiaQoArnFo
         mRfIwMaHoxHMuN81RqD2kC+ZLqurPibZ3W9fdtzc0quSDrvMNIckr8XWSSmyJRCgVoZ+
         m8/bCfCdGJ1i+BuV2qPGo7w9nLb2qmoLIqyuIlMywSi5SBCDw/yLN8pTmWXdSSqDPd7n
         M1BkgWeFTWGjI0aogt7Mu/1HFXePjEezWrWm9xiVS9QTLS6/R/ZA052SqIDDFOoeyadI
         g61nxlxgdRB03huN2rOWs8fc8D6y89h5M5UjmDHiG2gs992B8zjS2zDEWzKMKqUMRGlg
         cQpg==
X-Forwarded-Encrypted: i=1; AJvYcCWenx9luHeqTFODiXaDNSElcbExC4vOq+8rUibaZHBVnLGrekdwcOMYcpsMwXDm2KXwjNZ8GSGhNspZNg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmUGTXHxRsKpWjnO6zaokTOSRkc2c+BgK+kZv7mkIQGNWlvJOc
	eluXCYpTGaJgxwj2vmVLrRd2y7M0vpw+WwrjOQAExnVUDenVX+Q+URhS5mLCgxURWoM=
X-Gm-Gg: ASbGncuZas4nlmT7SIYA40gVXBjjkOqrDbV7+BEPh2hOw+MtoNfMkKJtceb7M4SUFa+
	Xz3Pmsko4TOa5hIGSR0ZFN1AW8CUIaHQsBtbYixr/skGF/j2OiMmIRUXloTGIT8yMyTQUrkHTpp
	vovuA2rIW8hxmX3eMabORQJb09eaVbCe4rXEP3yiDkJbaiHWpS96V/yNNRRHVAwQLW++HR7y2aC
	u9by7u7zVDQFkKG+mJ1aHltxZW5PA9TtylPlqwhMnmaASftXSc5XopjKn8mSt2csVA79WLERQmJ
	iEvHRuK3M7k5Gy0zRK5N8DqBrqUByvv5RdpoaSFFH8kjOJw2lzAEgNrutf3lTQ==
X-Google-Smtp-Source: AGHT+IEf/m3FG8FRM27DD2c+gtkesEWRNvfkiivPTHatSmLHF+9dpAc024hgwxzmnfOdGRF2n1iTFw==
X-Received: by 2002:a05:600c:46c9:b0:442:f8f6:48e5 with SMTP id 5b1f17b1804b1-442f8f6494fmr16827155e9.8.1747297425789;
        Thu, 15 May 2025 01:23:45 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:45 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v7 02/14] riscv: sbi: remove useless parenthesis
Date: Thu, 15 May 2025 10:22:03 +0200
Message-ID: <20250515082217.433227-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_012347_585571_1928598D 
X-CRM114-Status: GOOD (  10.26  )
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

QSBmZXcgcGFyZW50aGVzaXMgaW4gY2hlY2sgZm9yIFNCSSB2ZXJzaW9uL2V4dGVuc2lvbiB3ZXJl
IHVzZWxlc3MsCnJlbW92ZSB0aGVtLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxj
bGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4KUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMu
Y29tPgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3NiaS5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvc2JpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwppbmRleCAxOTg5Yjhj
YWRlMWIuLjFkNDRjMzUzMDVhOSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMK
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKQEAgLTYwOSw3ICs2MDksNyBAQCB2b2lkIF9f
aW5pdCBzYmlfaW5pdCh2b2lkKQogCQl9IGVsc2UgewogCQkJX19zYmlfcmZlbmNlCT0gX19zYmlf
cmZlbmNlX3YwMTsKIAkJfQotCQlpZiAoKHNiaV9zcGVjX3ZlcnNpb24gPj0gc2JpX21rX3ZlcnNp
b24oMCwgMykpICYmCisJCWlmIChzYmlfc3BlY192ZXJzaW9uID49IHNiaV9ta192ZXJzaW9uKDAs
IDMpICYmCiAJCSAgICBzYmlfcHJvYmVfZXh0ZW5zaW9uKFNCSV9FWFRfU1JTVCkpIHsKIAkJCXBy
X2luZm8oIlNCSSBTUlNUIGV4dGVuc2lvbiBkZXRlY3RlZFxuIik7CiAJCQlwbV9wb3dlcl9vZmYg
PSBzYmlfc3JzdF9wb3dlcl9vZmY7CkBAIC02MTcsOCArNjE3LDggQEAgdm9pZCBfX2luaXQgc2Jp
X2luaXQodm9pZCkKIAkJCXNiaV9zcnN0X3JlYm9vdF9uYi5wcmlvcml0eSA9IDE5MjsKIAkJCXJl
Z2lzdGVyX3Jlc3RhcnRfaGFuZGxlcigmc2JpX3Nyc3RfcmVib290X25iKTsKIAkJfQotCQlpZiAo
KHNiaV9zcGVjX3ZlcnNpb24gPj0gc2JpX21rX3ZlcnNpb24oMiwgMCkpICYmCi0JCSAgICAoc2Jp
X3Byb2JlX2V4dGVuc2lvbihTQklfRVhUX0RCQ04pID4gMCkpIHsKKwkJaWYgKHNiaV9zcGVjX3Zl
cnNpb24gPj0gc2JpX21rX3ZlcnNpb24oMiwgMCkgJiYKKwkJICAgIHNiaV9wcm9iZV9leHRlbnNp
b24oU0JJX0VYVF9EQkNOKSA+IDApIHsKIAkJCXByX2luZm8oIlNCSSBEQkNOIGV4dGVuc2lvbiBk
ZXRlY3RlZFxuIik7CiAJCQlzYmlfZGVidWdfY29uc29sZV9hdmFpbGFibGUgPSB0cnVlOwogCQl9
Ci0tIAoyLjQ5LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
