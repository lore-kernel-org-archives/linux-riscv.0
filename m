Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B143606A323
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 23:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NBTPTASw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SzUUOhIx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HvryN7fdZGMY5uJKLA7JrfoO8hEcXsgGuAOnGXCdr7A=; b=NBTPTASwkiREo4mG4tWDtxrrHe
	OOfc4L09H/BbMs+4ImPFM5r3gn57rTz++cZV1TXOodPIsfBV6dvxJiTIZLcmNRtI6ifkyd+kWN4KO
	2giRkwB+4LJbMcEDFbCpjgP4wqGWAvIzVm+KTWDMiNC+2AlVw57hR8WcJaU2eSosNcmmUBnqsQ6m0
	WrbEWvn+XTju6QDOws14Z5H47Fg7PG1LitH0q4a1K5TeZFi4V3kbwcm5R9vFEpYxa/xEeixlqJv3w
	+VDYUfaLwCceqq+2LZdBA7ptnOZqqftCwobd4f5DBUv5LxQ3rxigYTzPv2Kretni0O+Etg/Y1tRdB
	DwZYalcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMRn-0000000BYKx-2d75;
	Wed, 25 Nov 2026 23:30:43 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMRi-0000000BYIZ-3Z3B
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 23:30:42 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48e09aa5264so3711532f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2026 15:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649437; x=1796254237; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I4lPFLfieT6FbOV9CarxN3ibaJh2DCsYwIF1QQUH44s=;
        b=SzUUOhIxQeLLYCBLmgpknX/aDITrXfeF94pdt5fLNjps5jOOd+QH0c7bRQMbmr5TUC
         1Nhy7QmgHlYHAq+qHH1XWo1A/1abh39QPGbxQ94SA8zHYCQH4jHXrmPukNHFT+pgPjLB
         /t6qDBFKiB4nFLMBhii5n21uWugFfYSzK6ADoG2/Yqv0dmSHCO6oQCnJYzD6B/iB1+1e
         rFToAV9JbFag4zZe+0BQyp2VxZjhTRKv4XT/QC+OukXoLrdXh3RKfsNkb+KOfVoIXOvZ
         6QB5CZoEi6vIR3jS2loC47xpofIvhUTPwLu11htEBnglyUtSFzX96gT03OAsdwdhGGbR
         PEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649437; x=1796254237;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4lPFLfieT6FbOV9CarxN3ibaJh2DCsYwIF1QQUH44s=;
        b=pBVJT+lX9+997Jul8ZxY9Jq91ydPxlGTplaCKmpoJ7yjBEHEXQIDAfVRWXm3b673xc
         2LshzOiRLDKlb6dgBt9I+PyRj7Nt4Xmv6bvJE8Q/67CFOaD38cvW232Sdlq3dAeXOH2C
         j8yh0MOuGsy6EAxhZ7Cso9I+zHCP1rz4kd51avz63tiou2Dwlxt93wZwfqzXt2KG7ISF
         ETmShfOeRt4Qf/5Mbsz6MR7PQ3HK34PvBNpXIUYEDruG2yMJLIf6jZ+/Z73cuR2PV5iK
         EGxL3KcbvP9bSR3v2OJMu1Brq+28lhqthasFLWjpUUPevKzb9lX071gGdoN9G4MPIbso
         c+dA==
X-Gm-Message-State: APuU4Z989eN1tfOkJIHWxaH95R0/nJ41NEG3XzsSYpFji4MGLiLzC93I
	y8UJ5EgZir+dmYSMaKJLPv9NA/duauYN4r0IWtg3B5ljLlm+U/7G6dsMvmzA1qqAUPA=
X-Gm-Gg: AZFdTZdQ8adfr1UGzK8ehoNdnib660j/3d+WiDDWjueQ5ZuIotXAgq8d1pSlUGxxYD2
	ScfinWnCeSa3r9J+dupTZF/YnaggIt0ETAKGISZq1VjMTSMlQ6a34qlkXv+ZtYiIvCxK1XT+XWA
	7sc4R4IMFZQxwqlqSk5Ua2gAz4+ycNSF1IteIkaJTR+JmVfHWIsQZ7a0UVMUPn504X7i1yXswA3
	lW85QZJn9yXjg1H7LMTQ9MtEYg71o9LvNira++DqG/0uGeK2jtMrt4tv9281a5JD3JSTWhWlwUw
	0obt+cAhl72CtucB+BS45IvIGmdocOX88QoR6jM8v8EsE8EOFkgBGhfFhTaI2XB1HfNpt+x1Lou
	n0NhJ/v/9PkQInrQsryQPsuZnDlnopm1dHa1YM3lUyeBhKhc19bNB6pV85ZmyHNahvjiBtU4Jgc
	aSlDERadOImv/dcsEl+S5G/cBARfWc8F1JxsdO1e4vOtc8OqEP8vfw1LCxwWpyv383Xa0H02dhJ
	jYx8VD7xzo6j7z2hhpzypsXh9zVyV0vkUV5LLRph5c9j0HDG7DA3WY0S6rimh70qbo/c7qhfPA+
	Y7HnJRC9tHRX6NQug9SQ4MBr6H+q/Qy/kAspJgIZNLzJ+qPy2c+ZZFu5pDAOvdshxAkPJP9ZfKd
	zw3wZY2XhnA==
X-Received: by 2002:a05:6000:4381:b0:4a6:5a2a:f5a3 with SMTP id ffacd0b85a97d-4abaa9773abmr40225454f8f.3.1795649436500;
        Wed, 25 Nov 2026 15:30:36 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm36661490f8f.42.2026.11.25.15.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:30:36 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH RFC 01/19] riscv: Prepare ESP32-P4 early CLIC trap vectors
Date: Wed, 25 Nov 2026 23:30:02 +0000
Message-ID: <20261125233020.1380594-2-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_153039_134173_3A602FDE 
X-CRM114-Status: GOOD (  12.45  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhlIEVTUDMyLVA0IEhQIGNvcmVzIHJ1biB3aXRoIG10dmVjLk1PREUgZml4ZWQgdG8gQ0xJQy4g
VGhlIGxlZ2FjeQptaWUgYW5kIG1pcCBDU1JzIGNhbm5vdCBtYXNrIENMSUMgaW50ZXJydXB0cywg
YW5kIG10dmVjLkJBU0UgcmVxdWlyZXMKNjQtYnl0ZSBhbGlnbm1lbnQuCgpBZGQgYW4gb3B0LWlu
IGNvbmZpZ3VyYXRpb24gZm9yIFJWMzIsIHNpbmdsZS1oYXJ0IE0tbW9kZS4gTWFzayBsb2NhbApp
bnRlcnJ1cHRzIHRocm91Z2ggbXN0YXR1cy5NSUUgYXQga2VybmVsIGVudHJ5LiBBbGlnbiB0aGUg
ZWFybHkgcGFyaywKUE1QIHByb2JlIGFuZCBub3JtYWwgZXhjZXB0aW9uIHZlY3RvcnMgdG8gNjQg
Ynl0ZXMuCgpBSSBhc3Npc3RlZCB3aXRoIHRoZSB0cmFwIGVudHJ5IGNoYW5nZXMgYW5kIGVsYWJv
cmF0ZSB0aGUgaGVscApkZXNjcmlwdGlvbi4KCkxpbms6IGh0dHBzOi8vZG9jdW1lbnRhdGlvbi5l
c3ByZXNzaWYuY29tL2VzcDMyLXA0X3RlY2huaWNhbF9yZWZlcmVuY2VfbWFudWFsX2VuLnBkZgpT
aWduZWQtb2ZmLWJ5OiBWw610b3IgSHVnbyBTaWx2YSA8dml0b3JoZzIwMDgwQGdtYWlsLmNvbT4K
LS0tCiBhcmNoL3Jpc2N2L0tjb25maWcuc29jcyAgIHwgIDkgKysrKysrKysrCiBhcmNoL3Jpc2N2
L2tlcm5lbC9lbnRyeS5TIHwgIDYgKysrKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMgIHwg
MTMgKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnLnNvY3MgYi9hcmNoL3Jpc2N2L0tjb25maWcuc29j
cwppbmRleCBjZWNiY2UwYzQ5ODMuLjAyNzI5MjNjN2Q4OCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNj
di9LY29uZmlnLnNvY3MKKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnLnNvY3MKQEAgLTEyLDYgKzEy
LDE1IEBAIGNvbmZpZyBBUkNIX0FOTE9HSUMKIAloZWxwCiAJICBUaGlzIGVuYWJsZXMgc3VwcG9y
dCBmb3IgQW5sb2dpYyBTb0MgcGxhdGZvcm0gaGFyZHdhcmUuCiAKK2NvbmZpZyBSSVNDVl9FU1Az
MlA0X0NMSUMKKwlib29sICJFc3ByZXNzaWYgRVNQMzItUDQgZWFybHkgQ0xJQyBzZXR1cCIKKwlk
ZXBlbmRzIG9uIEFSQ0hfUlYzMkkgJiYgUklTQ1ZfTV9NT0RFICYmICFTTVAKKwloZWxwCisJICBF
bmFibGUgZWFybHkgbWFjaGluZS1tb2RlIHRyYXAgc2V0dXAgZm9yIGEgc2luZ2xlIEVTUDMyLVA0
IGhhcnQuCisJICBUaGlzIGFsaWducyB0aGUgdHJhcCB2ZWN0b3JzIHRvIDY0IGJ5dGVzIGFzIHJl
cXVpcmVkIGJ5IHRoZSBDTElDLgorCSAgRHVyaW5nIGtlcm5lbCBlbnRyeSwgaXQgY2xlYXJzIG1z
dGF0dXMuTUlFIHRvIG1hc2sgaW50ZXJydXB0cywKKwkgIHNpbmNlIHRoZSBsZWdhY3kgbWllIGFu
ZCBtaXAgQ1NScyBkbyBub3QgY29udHJvbCB0aGUgQ0xJQy4KKwogY29uZmlnIEFSQ0hfRVNXSU4K
IAlib29sICJFU1dJTiBTb0NzIgogCWhlbHAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L2VudHJ5LlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCmluZGV4IDYxYjdhNzcxNjY5Ny4u
ZjY1OWJmNjJiYjM5IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCisrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKQEAgLTEyNSw3ICsxMjUsMTMgQEAKIAkJQ09ORklH
X1JJU0NWX1VTRVJfQ0ZJKQogLmVuZG0KIAorI2lmZGVmIENPTkZJR19SSVNDVl9FU1AzMlA0X0NM
SUMKKwkvKiBtdHZlYy5CQVNFIHN0YXJ0cyBhdCBiaXQgNiBpbiBDTElDIG1vZGUuICovCisJLmJh
bGlnbiA2NAorU1lNX0NPREVfU1RBUlRfTk9BTElHTihoYW5kbGVfZXhjZXB0aW9uKQorI2Vsc2UK
IFNZTV9DT0RFX1NUQVJUKGhhbmRsZV9leGNlcHRpb24pCisjZW5kaWYKIAkvKgogCSAqIElmIGNv
bWluZyBmcm9tIHVzZXJzcGFjZSwgcHJlc2VydmUgdGhlIHVzZXIgdGhyZWFkIHBvaW50ZXIgYW5k
IGxvYWQKIAkgKiB0aGUga2VybmVsIHRocmVhZCBwb2ludGVyLiAgSWYgd2UgY2FtZSBmcm9tIHRo
ZSBrZXJuZWwsIHRoZSBzY3JhdGNoCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFk
LlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKaW5kZXggMTYzMWZkNmJjNzg2Li5mMjY2YzQy
MzhiMmYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUworKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9oZWFkLlMKQEAgLTE4Myw3ICsxODMsMTEgQEAgc2Vjb25kYXJ5X3N0YXJ0X3Ni
aToKIAljYWxsIHNtcF9jYWxsaW4KICNlbmRpZiAvKiBDT05GSUdfU01QICovCiAKKyNpZmRlZiBD
T05GSUdfUklTQ1ZfRVNQMzJQNF9DTElDCisuYmFsaWduIDY0CisjZWxzZQogLmFsaWduIDIKKyNl
bmRpZgogLkxzZWNvbmRhcnlfcGFyazoKIAkvKgogCSAqIFBhcmsgdGhpcyBoYXJ0IGlmIHdlOgpA
QCAtMjEwLDkgKzIxNCwxNCBAQCBzZWNvbmRhcnlfc3RhcnRfc2JpOgogU1lNX0NPREVfRU5EKF9z
dGFydCkKIAogU1lNX0NPREVfU1RBUlQoX3N0YXJ0X2tlcm5lbCkKKyNpZmRlZiBDT05GSUdfUklT
Q1ZfRVNQMzJQNF9DTElDCisJLyogVGhlIENMSUMgdXNlcyBtc3RhdHVzLk1JRSB0byBtYXNrIGlu
dGVycnVwdHMgZ2xvYmFsbHkuICovCisJY3NyY2kgQ1NSX1NUQVRVUywgU1JfSUUKKyNlbHNlCiAJ
LyogTWFzayBhbGwgaW50ZXJydXB0cyAqLwogCWNzcncgQ1NSX0lFLCB6ZXJvCiAJY3NydyBDU1Jf
SVAsIHplcm8KKyNlbmRpZgogCiAjaWZkZWYgQ09ORklHX1JJU0NWX01fTU9ERQogCS8qIGZsdXNo
IHRoZSBpbnN0cnVjdGlvbiBjYWNoZSAqLwpAQCAtMjMzLDcgKzI0MiwxMSBAQCBTWU1fQ09ERV9T
VEFSVChfc3RhcnRfa2VybmVsKQogCWNzcncgQ1NSX1BNUEFERFIwLCBhMAogCWxpIGEwLCAoUE1Q
X0FfTkFQT1QgfCBQTVBfUiB8IFBNUF9XIHwgUE1QX1gpCiAJY3NydyBDU1JfUE1QQ0ZHMCwgYTAK
KyNpZmRlZiBDT05GSUdfUklTQ1ZfRVNQMzJQNF9DTElDCisuYmFsaWduIDY0CisjZWxzZQogLmFs
aWduIDIKKyNlbmRpZgogLkxwbXBfZG9uZToKIAogCS8qCi0tIAoyLjU2LjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
