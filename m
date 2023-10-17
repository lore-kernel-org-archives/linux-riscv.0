Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1328CDB482
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 13:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LSA+k+bcqNkQlcObsGMudQJ3JiLROqevzfkUnFFS5YA=; b=ZLPIiehwQliVNZ
	emNqm/urprvItNp8SVJWyJ6QLJXdjqdxqHTKCWxJPGqVvfABVrUn9nu5YdtReNSEvwY2cSzakDmgK
	zfIfAEFG056Y7Su+RjLNvD+EEmn7WxTP35Ucxa3/NjQL0mF/CJt+xJURZE4YluPqosDQ3HZkDnr/J
	Rb5aZETMK/iGuPPGwdHCXJGHUoo0vn266ZaH72k6mP66ELPV8N+I3ck7iiHxPk3l1vhHrAjAGdlr0
	0Z8XQhyVLX5OX287qIxoiTr7vpSeMD+NrHWEhwQ9IYRlUOmuHDA8DhPBtAvKnyVoyq92/GsugFfxa
	5VoSZRQMPSJs4/mxXajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjvA-00CN7e-1a;
	Tue, 17 Oct 2023 13:15:40 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjv4-00CN1f-1b
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 13:15:36 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c519eab81fso3998061fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 06:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548532; x=1698153332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAwzEIcm8h808xpQc++6VSntDVwJ3qhe3e6hBMESJ6w=;
        b=DnTkCAz8iZMQjsn2PKitms9jYM3MRH6swTgQF8OJA8ihFY9ne+B7JwtWW4nkHzC+Wx
         HEJHTKlTi8tuCy7dmGfaWjEr8MCtuci/hDAmcJknn7QATW+F7EdhZ2XfGWlKfAj2eOxe
         Fidwe9n+GVo6tK/WqribJgB1ulUcz6ZZEmSDOWY+MhfnTZlzS66f5m6JBfqjdtqXmKG7
         K9KnnA1IDB/lfQnx680leziXJ6Tu7McabsJQANwZCQIKypBxEOguXgi0o3eocpE2xOyn
         svu6vwrjkdqEXXT2fq5LrDVxV3P2b5PHemLmohuoIjbNAIo7pqvu4hg2TR/MmCFk2oqy
         Sq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548532; x=1698153332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kAwzEIcm8h808xpQc++6VSntDVwJ3qhe3e6hBMESJ6w=;
        b=pWlYkE0M5btW39+HLK/Y+Dg66QQqQnpGeovsNDaxb+7mxrmoXogKVLeBwnNhJtl5X5
         +0bL667kYzLf0WCv7BlAh/MNeot42qCdA9yoGzuq8sd7elwBzUu5N/o3K6zH9TDpgzjL
         9oXltBHUkfifBp2RasXWdGItBYWdVF4vx8xjk+RwHSDCE4zMUqovS5rgIz3mxRlZDP2e
         k11fEjXY0r9DRAh/MpN3qqKIcBPVn/r2dfO+9sHNv0baqjJK7s6IkRQy3tCswH1c+lHA
         Jmhe516VnuMgCUWpvxbUUJzgLRaJMh5N7vmCci6sJe3AKp/X2pfDF5g6lC9r/5XKRf+N
         5FSw==
X-Gm-Message-State: AOJu0Yz1oE3do+/spN/Gimv8QmRRN0sxoTWrwKPLPGPWlLgaFaKsOiDD
	fjQQXLwgzDigES/R618a/HIyfP6ZXmJauZRlsQwJhQ==
X-Google-Smtp-Source: AGHT+IGxxGT0VowoXWq2hMZVGHzajiExaL8hl8rlDGCoUwUk37mS3jSgd+MAJBx5cI6dDHr6c+N8Sg==
X-Received: by 2002:a2e:b5ad:0:b0:2c5:36e:31bf with SMTP id f13-20020a2eb5ad000000b002c5036e31bfmr1328347ljn.5.1697548531317;
        Tue, 17 Oct 2023 06:15:31 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:30 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>
Subject: [PATCH v2 05/19] riscv: add ISA extension parsing for vector crypto extensions
Date: Tue, 17 Oct 2023 15:14:42 +0200
Message-ID: <20231017131456.2053396-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017131456.2053396-1-cleger@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_061534_535726_E07911DB 
X-CRM114-Status: GOOD (  11.88  )
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

QWRkIHBhcnNpbmcgb2Ygc29tZSBadiogdmVjdG9yIGNyeXB0byBJU0EgZXh0ZW5zaW9ucyB0aGF0
IGFyZSBtZW50aW9uZWQKaW4gIlJJU0MtViBDcnlwdG9ncmFwaHkgRXh0ZW5zaW9ucyBWb2x1bWUg
SUkiIFsxXS4gVGhlc2UgSVNBIGV4dGVuc2lvbnMKYXJlIHRoZSBmb2xsb3dpbmc6CgotIFp2YmI6
IFZlY3RvciBCYXNpYyBCaXQtbWFuaXB1bGF0aW9uCi0gWnZiYzogVmVjdG9yIENhcnJ5bGVzcyBN
dWx0aXBsaWNhdGlvbgotIFp2a2I6IFZlY3RvciBDcnlwdG9ncmFwaHkgQml0LW1hbmlwdWxhdGlv
bgotIFp2a2c6IFZlY3RvciBHQ00vR01BQy4KLSBadmtuZWQ6IE5JU1QgU3VpdGU6IFZlY3RvciBB
RVMgQmxvY2sgQ2lwaGVyCi0gWnZrbmhbYWJdOiBOSVNUIFN1aXRlOiBWZWN0b3IgU0hBLTIgU2Vj
dXJlIEhhc2gKLSBadmtzZWQ6IFNoYW5nTWkgU3VpdGU6IFNNNCBCbG9jayBDaXBoZXIKLSBadmtz
aDogU2hhbmdNaSBTdWl0ZTogU00zIFNlY3VyZSBIYXNoCi0gWnZrbjogTklTVCBBbGdvcml0aG0g
U3VpdGUKLSBadmtuYzogTklTVCBBbGdvcml0aG0gU3VpdGUgd2l0aCBjYXJyeWxlc3MgbXVsdGlw
bHkKLSBadmtuZzogTklTVCBBbGdvcml0aG0gU3VpdGUgd2l0aCBHQ00uCi0gWnZrczogU2hhbmdN
aSBBbGdvcml0aG0gU3VpdGUKLSBadmtzYzogU2hhbmdNaSBBbGdvcml0aG0gU3VpdGUgd2l0aCBj
YXJyeWxlc3MgbXVsdGlwbGljYXRpb24KLSBadmtzZzogU2hhbmdNaSBBbGdvcml0aG0gU3VpdGUg
d2l0aCBHQ00uCi0gWnZrdDogVmVjdG9yIERhdGEtSW5kZXBlbmRlbnQgRXhlY3V0aW9uIExhdGVu
Y3kuCgpMaW5rOiBodHRwczovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzFnYjlPTEgtRGhiQ2dX
cDdWd3BQT1Zyclk2ZjNvU0pMTC92aWV3IFsxXQpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6ln
ZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2Nh
cC5oIHwgMTAgKysrKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCA1NiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDY2IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKaW5kZXggYWI4MGQ4MjJjODQ3Li5hMmZhYzIz
YjBjYzAgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAorKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKQEAgLTY5LDYgKzY5LDE2IEBACiAjZGVmaW5l
IFJJU0NWX0lTQV9FWFRfWktTRUQJCTUxCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWktTSAkJNTIK
ICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aS1QJCTUzCisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZC
QgkJNTQKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVkJDCQk1NQorI2RlZmluZSBSSVNDVl9JU0Ff
RVhUX1pWS0IJCTU2CisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZLRwkJNTcKKyNkZWZpbmUgUklT
Q1ZfSVNBX0VYVF9aVktORUQJCTU4CisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZLTkhBCQk1OQor
I2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWS05IQgkJNjAKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9a
VktTRUQJCTYxCisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZLU0gJCTYyCisjZGVmaW5lIFJJU0NW
X0lTQV9FWFRfWlZLVAkJNjMKIAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX01BWAkJNjQKIApkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvY3B1ZmVhdHVyZS5jCmluZGV4IGQzNjgyZmRmZDlmMS4uOGNmMGI4YjQ0MmFlIDEwMDY0NAot
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvY3B1ZmVhdHVyZS5jCkBAIC0xNDQsNiArMTQ0LDQ2IEBAIHN0YXRpYyBjb25zdCB1bnNpZ25l
ZCBpbnQgcmlzY3ZfemtzX2J1bmRsZWRfZXh0c1tdID0gewogCVJJU0NWX0lTQV9FWFRfWktTSAog
fTsKIAorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWS04JXAorCVJJU0NWX0lTQV9FWFRfWlZLTkVE
LAlcCisJUklTQ1ZfSVNBX0VYVF9aVktOSEIsCVwKKwlSSVNDVl9JU0FfRVhUX1pWS0IsCVwKKwlS
SVNDVl9JU0FfRVhUX1pWS1QKKworc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCByaXNjdl96dmtu
X2J1bmRsZWRfZXh0c1tdID0geworCVJJU0NWX0lTQV9FWFRfWlZLTgorfTsKKworc3RhdGljIGNv
bnN0IHVuc2lnbmVkIGludCByaXNjdl96dmtuY19idW5kbGVkX2V4dHNbXSA9IHsKKwlSSVNDVl9J
U0FfRVhUX1pWS04sCisJUklTQ1ZfSVNBX0VYVF9aVkJDLAorfTsKKworc3RhdGljIGNvbnN0IHVu
c2lnbmVkIGludCByaXNjdl96dmtuZ19idW5kbGVkX2V4dHNbXSA9IHsKKwlSSVNDVl9JU0FfRVhU
X1pWS04sCisJUklTQ1ZfSVNBX0VYVF9aVktHLAorfTsKKworI2RlZmluZSBSSVNDVl9JU0FfRVhU
X1pWS1MJXAorCVJJU0NWX0lTQV9FWFRfWlZLU0VELAlcCisJUklTQ1ZfSVNBX0VYVF9aVktTSCwJ
XAorCVJJU0NWX0lTQV9FWFRfWlZLQiwJXAorCVJJU0NWX0lTQV9FWFRfWlZLVAorCitzdGF0aWMg
Y29uc3QgdW5zaWduZWQgaW50IHJpc2N2X3p2a3NfYnVuZGxlZF9leHRzW10gPSB7CisJUklTQ1Zf
SVNBX0VYVF9aVktTCit9OworCitzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X3p2a3Nj
X2J1bmRsZWRfZXh0c1tdID0geworCVJJU0NWX0lTQV9FWFRfWlZLUywKKwlSSVNDVl9JU0FfRVhU
X1pWQkMsCit9OworCitzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X3p2a3NnX2J1bmRs
ZWRfZXh0c1tdID0geworCVJJU0NWX0lTQV9FWFRfWlZLUywKKwlSSVNDVl9JU0FfRVhUX1pWS0cs
Cit9OworCiAvKgogICogVGhlIGNhbm9uaWNhbCBvcmRlciBvZiBJU0EgZXh0ZW5zaW9uIG5hbWVz
IGluIHRoZSBJU0Egc3RyaW5nIGlzIGRlZmluZWQgaW4KICAqIGNoYXB0ZXIgMjcgb2YgdGhlIHVu
cHJpdmlsZWdlZCBzcGVjaWZpY2F0aW9uLgpAQCAtMjIxLDYgKzI2MSwyMiBAQCBjb25zdCBzdHJ1
Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlfX1JJU0NWX0lTQV9F
WFRfREFUQSh6a3QsIFJJU0NWX0lTQV9FWFRfWktUKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6
a3NlZCwgUklTQ1ZfSVNBX0VYVF9aS1NFRCksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemtzaCwg
UklTQ1ZfSVNBX0VYVF9aS1NIKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmJiLCBSSVNDVl9J
U0FfRVhUX1pWQkIpLAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2YmMsIFJJU0NWX0lTQV9FWFRf
WlZCQyksCisJX19SSVNDVl9JU0FfRVhUX0RBVEEoenZrYiwgUklTQ1ZfSVNBX0VYVF9aVktCKSwK
KwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmtnLCBSSVNDVl9JU0FfRVhUX1pWS0cpLAorCV9fUklT
Q1ZfSVNBX0VYVF9CVU5ETEUoenZrbiwgcmlzY3ZfenZrbl9idW5kbGVkX2V4dHMpLAorCV9fUklT
Q1ZfSVNBX0VYVF9CVU5ETEUoenZrbmMsIHJpc2N2X3p2a25jX2J1bmRsZWRfZXh0cyksCisJX19S
SVNDVl9JU0FfRVhUX0RBVEEoenZrbmVkLCBSSVNDVl9JU0FfRVhUX1pWS05FRCksCisJX19SSVND
Vl9JU0FfRVhUX0JVTkRMRSh6dmtuZywgcmlzY3ZfenZrbmdfYnVuZGxlZF9leHRzKSwKKwlfX1JJ
U0NWX0lTQV9FWFRfREFUQSh6dmtuaGEsIFJJU0NWX0lTQV9FWFRfWlZLTkhBKSwKKwlfX1JJU0NW
X0lTQV9FWFRfREFUQSh6dmtuaGIsIFJJU0NWX0lTQV9FWFRfWlZLTkhCKSwKKwlfX1JJU0NWX0lT
QV9FWFRfQlVORExFKHp2a3MsIHJpc2N2X3p2a3NfYnVuZGxlZF9leHRzKSwKKwlfX1JJU0NWX0lT
QV9FWFRfQlVORExFKHp2a3NjLCByaXNjdl96dmtzY19idW5kbGVkX2V4dHMpLAorCV9fUklTQ1Zf
SVNBX0VYVF9EQVRBKHp2a3NlZCwgUklTQ1ZfSVNBX0VYVF9aVktTRUQpLAorCV9fUklTQ1ZfSVNB
X0VYVF9EQVRBKHp2a3NoLCBSSVNDVl9JU0FfRVhUX1pWS1NIKSwKKwlfX1JJU0NWX0lTQV9FWFRf
QlVORExFKHp2a3NnLCByaXNjdl96dmtzZ19idW5kbGVkX2V4dHMpLAorCV9fUklTQ1ZfSVNBX0VY
VF9EQVRBKHp2a3QsIFJJU0NWX0lTQV9FWFRfWlZLVCksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEo
c21haWEsIFJJU0NWX0lTQV9FWFRfU01BSUEpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzYWlh
LCBSSVNDVl9JU0FfRVhUX1NTQUlBKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzc2NvZnBtZiwg
UklTQ1ZfSVNBX0VYVF9TU0NPRlBNRiksCi0tIAoyLjQyLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
