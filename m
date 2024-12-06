Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B94E77173
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Dec 2024 05:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nhRikgxh4iTtoSMVSxzEV9csE9QRyNYPDyGmtEETbRM=; b=RPNJSwI2uru0Vw
	APg8zk8Ih/mnQ41Fu/onWUFCp5d5DFgjTPXonVWmHN3f9HgW2k19TNa54VOMibhI2PY5ijNmqSgkl
	mvdfyzXOSH4kwOtnJIGFbvyB3jF2mpJP7s7t9ZzU3HJ+5w7vIywUCY/9b1LkNpKavEnxCLZvWvncQ
	53yFtCeF3aalofAnNVeINpaubiuKK8L2Vwh3lt7aIYoADFECx9QlJiK50bTD08oHOaumWCBs5xH62
	PvjVfPhNG+Je7ue6YtnUPaM5iUJcDDv6YXUaEzuDQyYSJTOwpY5IBJ9E0wpnOOLryrsvHARAP8QE+
	nawR1PJGIFO9KXxPvdSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJRNa-00000000f9t-3hbW;
	Fri, 06 Dec 2024 05:59:54 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJRN8-00000000ezl-1wmC
	for linux-riscv@lists.infradead.org;
	Fri, 06 Dec 2024 05:59:27 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-466a079bc5eso12759381cf.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 21:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733464765; x=1734069565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99+Mfl/GHyyDKmDCEIDfOnHV+iERdk7X1PZjrxCa1IU=;
        b=hAC6KyeFfu2YkH7gZESLRUqfy+RyPp+AAvaIGRvGl1GaNjjYPCAAS4PVqNq4tAwPC0
         Sz5Anw2zB2LjaZ+j1tpqBfBN1Vbp55srLxQdGjXP7LLJs3jacWr4/MOotwTyXqn6zITV
         G9cYOEg+X9p7wDxLA6VrJN85sjS+xOfBwiGrKoFx08i8miIGwk2S+iAUgaATZ6bVSWNa
         IfYCG7ZLkaiBiJOBQsWECsx64tlDzfdQiKQB0GmeyBU/VtHvQmIVnB1BcErqkUjiXw1E
         L7mlKvMvoWF/PE6eVvwn3smGA2Q9xsipDSWcVNXzwbb2vUSOUlmB2noFoAJ8+v/s6oh0
         l9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733464765; x=1734069565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=99+Mfl/GHyyDKmDCEIDfOnHV+iERdk7X1PZjrxCa1IU=;
        b=cyMyIXSlet3UWqqYWuLaTnWvNwL6hZ43+/mkd24lVPWxgedAfVXU3K6a3dxr5f44av
         7z9R4mIXL0duJiEIq1qAsk/9PHUkr7cKnFC/xXtU7+KavI1YtvW6NxJiilMbpQMtG+jj
         /+qpMPUvCfXPxtOXvruT6LEqsAdtrJgv1w07tOUgqX2HzI4FBULKETPL7f1/FTHcXpN3
         8lodIZZGGELq4UqYrk4+orXKCvrqxEeZQJDoydTCwHwUvRNj2r4W70NU4mSJQpvF9fgJ
         wI11wDPO6h0d/7mRCFVbV0ckmdmG5s511Np1AwlRtX/TA2nP2W9yHDk9rj1MpsY3yqMA
         mzbg==
X-Forwarded-Encrypted: i=1; AJvYcCWIbBBV6a19Zx7TljdJW4aaK7q5s9NzxPRuHrGYHnjzmuEdLSzyqMkA8zUZ8s576xIDBKSGhx6s29DwYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDRlvmANlg40BM5bTXaJysyBNkLdXoR94YZeHqsr+L7cY5n95V
	icFiFViManZprSdAkzc3T+5kGP0dMFmiJTfAz5p9/6SGNKSrITRJ
X-Gm-Gg: ASbGncs7o0m6USRwq0qsKbeuw9hoPi047GJxF66Neq1NQxBu62TJdGKDDW31Bu2Xn8R
	wCsIAiPn/o/ukUOUPOpCOMO+L7O0444UhkmX5GIylNJFyvmED3lxZvsx7HGeCj0GOo+xn8Mr5uu
	AkF5cC0BjWJQLLNAjygerZPNdq9tj8PCJKIQ8qt54LODzP9cWvISDf0yPDXmhBU8FXP9e6AAdDo
	s+Kzp3ZqKjjfEesWqUmRL/vxQ==
X-Google-Smtp-Source: AGHT+IF0kNksBAetSJdav341ahruff6KWAb7ZkcXBJa+STsOcvKmHNoEQ+0qcg4RzK0XD/H9bZ0JMw==
X-Received: by 2002:a05:622a:199b:b0:466:a61f:9ead with SMTP id d75a77b69052e-46734f7d305mr32306181cf.36.1733464765105;
        Thu, 05 Dec 2024 21:59:25 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46729793741sm17182941cf.61.2024.12.05.21.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 21:59:24 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 3/3] riscv: hwprobe: export bfloat16 ISA extension
Date: Fri,  6 Dec 2024 13:58:29 +0800
Message-ID: <20241206055829.1059293-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206055829.1059293-1-inochiama@gmail.com>
References: <20241206055829.1059293-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_215926_501863_7D958881 
X-CRM114-Status: GOOD (  10.39  )
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

RXhwb3J0IFpmYm1pbiwgWnZmYmZtaW4sIFp2ZmJmd21hIElTQSBleHRlbnNpb24gdGhyb3VnaCBo
d3Byb2JlLgoKU2lnbmVkLW9mZi1ieTogSW5vY2hpIEFtYW90byA8aW5vY2hpYW1hQGdtYWlsLmNv
bT4KUmV2aWV3ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0t
CiBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgIHwgMTIgKysrKysrKysrKysr
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgIDMgKysrCiBhcmNoL3Jp
c2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAgICAgIHwgIDMgKysrCiAzIGZpbGVzIGNoYW5nZWQs
IDE4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3Yv
aHdwcm9iZS5yc3QgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKaW5kZXgg
OTU1ZmJjZDE5Y2U5Li5hOWNiNDBlNDA3YTQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vYXJj
aC9yaXNjdi9od3Byb2JlLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9i
ZS5yc3QKQEAgLTI0Miw2ICsyNDIsMTggQEAgVGhlIGZvbGxvd2luZyBrZXlzIGFyZSBkZWZpbmVk
OgogICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9TVVBNYDogVGhlIFN1cG0gZXh0ZW5z
aW9uIGlzIHN1cHBvcnRlZCBhcwogICAgICAgIGRlZmluZWQgaW4gdmVyc2lvbiAxLjAgb2YgdGhl
IFJJU0MtViBQb2ludGVyIE1hc2tpbmcgZXh0ZW5zaW9ucy4KIAorICAqIDpjOm1hY3JvOmBSSVND
Vl9IV1BST0JFX0VYVF9aRkJGTUlOYDogVGhlIFpmYmZtaW4gZXh0ZW5zaW9uIGlzIHN1cHBvcnRl
ZCBhcworICAgICAgIGRlZmluZWQgaW4gdGhlIFJJU0MtViBJU0EgbWFudWFsIHN0YXJ0aW5nIGZy
b20gY29tbWl0IDRkYzIzZDYyMjlkZQorICAgICAgICgiQWRkZWQgQ2hhcHRlciB0aXRsZSB0byBC
RjE2IikuCisKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWlZGQkZNSU5gOiBUaGUg
WnZmYmZtaW4gZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCBhcworICAgICAgIGRlZmluZWQgaW4gdGhl
IFJJU0MtViBJU0EgbWFudWFsIHN0YXJ0aW5nIGZyb20gY29tbWl0IDRkYzIzZDYyMjlkZQorICAg
ICAgICgiQWRkZWQgQ2hhcHRlciB0aXRsZSB0byBCRjE2IikuCisKKyAgKiA6YzptYWNybzpgUklT
Q1ZfSFdQUk9CRV9FWFRfWlZGQkZXTUFgOiBUaGUgWnZmYmZ3bWEgZXh0ZW5zaW9uIGlzIHN1cHBv
cnRlZCBhcworICAgICAgIGRlZmluZWQgaW4gdGhlIFJJU0MtViBJU0EgbWFudWFsIHN0YXJ0aW5n
IGZyb20gY29tbWl0IDRkYzIzZDYyMjlkZQorICAgICAgICgiQWRkZWQgQ2hhcHRlciB0aXRsZSB0
byBCRjE2IikuCisKICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6IERl
cHJlY2F0ZWQuICBSZXR1cm5zIHNpbWlsYXIgdmFsdWVzIHRvCiAgICAgIDpjOm1hY3JvOmBSSVND
Vl9IV1BST0JFX0tFWV9NSVNBTElHTkVEX1NDQUxBUl9QRVJGYCwgYnV0IHRoZSBrZXkgd2FzCiAg
ICAgIG1pc3Rha2VubHkgY2xhc3NpZmllZCBhcyBhIGJpdG1hc2sgcmF0aGVyIHRoYW4gYSB2YWx1
ZS4KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCmluZGV4IDNhZjE0MmI5OWY3Ny4u
YWVjYzFjODAwZDU0IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdw
cm9iZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKQEAgLTcz
LDYgKzczLDkgQEAgc3RydWN0IHJpc2N2X2h3cHJvYmUgewogI2RlZmluZQkJUklTQ1ZfSFdQUk9C
RV9FWFRfWkNNT1AJCSgxVUxMIDw8IDQ3KQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkFX
UlMJCSgxVUxMIDw8IDQ4KQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfU1VQTQkJKDFVTEwg
PDwgNDkpCisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aRkJGTUlOCSgxVUxMIDw8IDUwKQor
I2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlZGQkZNSU4JKDFVTEwgPDwgNTEpCisjZGVmaW5l
CQlSSVNDVl9IV1BST0JFX0VYVF9aVkZCRldNQQkoMVVMTCA8PCA1MikKICNkZWZpbmUgUklTQ1Zf
SFdQUk9CRV9LRVlfQ1BVUEVSRl8wCTUKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05F
RF9VTktOT1dOCSgwIDw8IDApCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1V
TEFURUQJKDEgPDwgMCkKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2Jl
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCmluZGV4IGNiOTNhZGZmZmM0OC4u
YmQyMTVmNThiZDFiIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5j
CisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKQEAgLTEzMSw2ICsxMzEsOCBA
QCBzdGF0aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWly
LAogCQkJRVhUX0tFWShaVkU2NEQpOwogCQkJRVhUX0tFWShaVkU2NEYpOwogCQkJRVhUX0tFWSha
VkU2NFgpOworCQkJRVhUX0tFWShaVkZCRk1JTik7CisJCQlFWFRfS0VZKFpWRkJGV01BKTsKIAkJ
CUVYVF9LRVkoWlZGSCk7CiAJCQlFWFRfS0VZKFpWRkhNSU4pOwogCQkJRVhUX0tFWShaVktCKTsK
QEAgLTE0Nyw2ICsxNDksNyBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0cnVjdCBy
aXNjdl9od3Byb2JlICpwYWlyLAogCQkJRVhUX0tFWShaQ0QpOwogCQkJRVhUX0tFWShaQ0YpOwog
CQkJRVhUX0tFWShaRkEpOworCQkJRVhUX0tFWShaRkJGTUlOKTsKIAkJCUVYVF9LRVkoWkZIKTsK
IAkJCUVYVF9LRVkoWkZITUlOKTsKIAkJfQotLSAKMi40Ny4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
