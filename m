Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E877C2BA15
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 11:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PocqbuouJ/+JYlF58RwIXiHPq4cXAkXH+XdnHiVXsVw=; b=3mN2fA1s2JAMo5
	aA6Di5XexrQ16B6+EBYJsBfYbdFJ27OICPcHuak9tR2gN4I7HU5ef2ay95MDxwhoajW0cM54chL46
	ps0CjEzJ9FnyrZO5gYtn7ha2u/CGju4Khij6I/++OoGMt0vqOKTEMcX/F0m5vPU8tnTC4zzPIGR48
	xNuYXzFfBjkfvEPqdbo+oTvGFlMLVZce4BWXvdVizy25F0yNq+m8bEKMg+XDfe57g1xTUEk44IdQr
	DJQTalTS903r9n/XCgh8tdfzTeBUgAqH0i1LIeFLT7D3HbNbXHigK8acM1HWKY0xPpdbnvS+4e9lC
	3Twh7Ozj7h3XfFK0FiWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtbQ-00000000zlX-2ARp;
	Wed, 19 Jun 2024 11:35:48 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJtbI-00000000zdD-1hRV
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 11:35:42 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2ebd6ae2f56so7293731fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 04:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718796939; x=1719401739; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3NeIVokKZeou2DRmWwx696jQqaRNB0bo5tdjndOt75M=;
        b=GiBU6FtoAReXsCpA4h2GTMZVZUvSuAnGHXA2CnGN42h7LQDVAug+GoP9/800ZrE2GI
         gFhOMFdvXV6Sk0MeVIOQCTloE9LNNjKaepxNkR44XdhBF+x+8XnRgSZ89AZuZ5mSxcdy
         JU5069LMvqVPY3PedcOoFTf/+2lWrx1Qnre3IYADz2wE+LA43fi+x2JQ7QjOOQejybYW
         VdYetaD6xhYPaORRh4ujBMgmZRTlVXOrP8OYTe5pkpBviFdkYHxVgcCWGQmmCwUUEo4J
         jQPQMxeRJcXh1I7q/IxWEuTqF5A7R4NfkwPj5eR717COQPuBxKToi6NV1bAU8M2pWU+k
         lxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796939; x=1719401739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3NeIVokKZeou2DRmWwx696jQqaRNB0bo5tdjndOt75M=;
        b=f7HoT3oA8wqS41jMjNVzZy78qOdBMk0h0QrgU6W9goz/MkOQwEmLYwoGpV+zCQnSfo
         E9yVavIzBcseqRrC+poJCcs7+mJKTn86LE/Qx42ZlH9AoHWGfEynHgO7TL2fVdU4Mlj7
         eCrtX1MrcbI6F9GJxAWqiKYSqFQAXH5lltA24itwIiQiNmfyr5+vG5I3EQUKaQy3FOtm
         NF5mOVZXLdHW7Jw/qItvFk9QdZA8MGnfxVByelSh1fpP904hj5WrrcLTnTAX9ikyjQjI
         7b6VnzB/LdYWA3gY3oR2aypxvwSGF0JYn/Bw8u+8TZ0o4A7ooEmWInF8lHX4lAOCEtoV
         Ih4g==
X-Forwarded-Encrypted: i=1; AJvYcCXUp98lUnpYTMz7q8xPszfqtn18sCzpyjv0wwH+I5n5IwLxriSKQfzdPCJcvzdo1hdfza0MvXwiuCoImeyIQ3lSHF45JR+VAm5PXHQp0UEt
X-Gm-Message-State: AOJu0YzZxOrRw1AVFrN0vHu4jGWr5/e8J6LnWDNFWdTo2g063ThbZuLi
	W/SBLWdUAHZK4KAAWDyvimomP2l3SiD9Uxj+6R/GN4c4TGCAUaxgDwI9az0WFLw=
X-Google-Smtp-Source: AGHT+IHXMR+p5Jiwrk26C4hD41FJdRZ01s6AEWYRELMLJ9ACvKi0hM30z5n9fFC1USLH9An4IqbrFw==
X-Received: by 2002:a2e:9654:0:b0:2eb:e49c:45df with SMTP id 38308e7fff4ca-2ec3d007606mr11998811fa.4.1718796938764;
        Wed, 19 Jun 2024 04:35:38 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:e67b:7ea9:5658:701a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9681sm266192075e9.28.2024.06.19.04.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 04:35:37 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v7 03/16] riscv: hwprobe: export Zimop ISA extension
Date: Wed, 19 Jun 2024 13:35:13 +0200
Message-ID: <20240619113529.676940-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619113529.676940-1-cleger@rivosinc.com>
References: <20240619113529.676940-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_043540_697986_EBD20AF5 
X-CRM114-Status: GOOD (  11.60  )
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

RXhwb3J0IFppbW9wIElTQSBleHRlbnNpb24gdGhyb3VnaCBod3Byb2JlLgoKU2lnbmVkLW9mZi1i
eTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQ2hh
cmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2Fy
Y2gvcmlzY3YvaHdwcm9iZS5yc3QgIHwgNCArKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20vaHdwcm9iZS5oIHwgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAgICAg
IHwgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCBiL0RvY3VtZW50YXRpb24vYXJjaC9y
aXNjdi9od3Byb2JlLnJzdAppbmRleCBmYzAxNWI0NTJlYmYuLjJiN2YxZDA1YjJlMyAxMDA2NDQK
LS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CisrKyBiL0RvY3VtZW50
YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdApAQCAtMjA3LDYgKzIwNywxMCBAQCBUaGUgZm9s
bG93aW5nIGtleXMgYXJlIGRlZmluZWQ6CiAgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhU
X1pWRTY0RGA6IFRoZSBWZWN0b3Igc3ViLWV4dGVuc2lvbiBadmU2NGQgaXMKICAgICBzdXBwb3J0
ZWQsIGFzIGRlZmluZWQgYnkgdmVyc2lvbiAxLjAgb2YgdGhlIFJJU0MtViBWZWN0b3IgZXh0ZW5z
aW9uIG1hbnVhbC4KIAorICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aSU1PUGA6IFRo
ZSBaaW1vcCBNYXktQmUtT3BlcmF0aW9ucyBleHRlbnNpb24gaXMKKyAgICAgICBzdXBwb3J0ZWQg
YXMgZGVmaW5lZCBpbiB0aGUgUklTQy1WIElTQSBtYW51YWwgc3RhcnRpbmcgZnJvbSBjb21taXQK
KyAgICAgICA1ODIyMDYxNGE1ZiAoIlppbW9wIGlzIHJhdGlmaWVkLzEuMCIpLgorCiAqIDpjOm1h
Y3JvOmBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzBgOiBBIGJpdG1hc2sgdGhhdCBjb250YWlu
cyBwZXJmb3JtYW5jZQogICBpbmZvcm1hdGlvbiBhYm91dCB0aGUgc2VsZWN0ZWQgc2V0IG9mIHBy
b2Nlc3NvcnMuCiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3By
b2JlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCmluZGV4IDdiOTVm
YWRiZWEyYS4uNTM4YzQwNDkzOGU2IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20vaHdwcm9iZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2Jl
LmgKQEAgLTY1LDYgKzY1LDcgQEAgc3RydWN0IHJpc2N2X2h3cHJvYmUgewogI2RlZmluZQkJUklT
Q1ZfSFdQUk9CRV9FWFRfWlZFNjRYCSgxVUxMIDw8IDM5KQogI2RlZmluZQkJUklTQ1ZfSFdQUk9C
RV9FWFRfWlZFNjRGCSgxVUxMIDw8IDQwKQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWlZF
NjRECSgxVUxMIDw8IDQxKQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWklNT1AJCSgxVUxM
IDw8IDQyKQogI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzAJNQogI2RlZmluZQkJ
UklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOS05PV04JKDAgPDwgMCkKICNkZWZpbmUJCVJJU0NW
X0hXUFJPQkVfTUlTQUxJR05FRF9FTVVMQVRFRAkoMSA8PCAwKQpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2Jl
LmMKaW5kZXggODNmY2M5MzlkZjY3Li4wNGEyZWQ0ZWU0MTUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL3N5c19od3Byb2JlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJv
YmUuYwpAQCAtMTEyLDYgKzExMiw3IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3Ry
dWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCiAJCUVYVF9LRVkoWkFDQVMpOwogCQlFWFRfS0VZKFpJ
Q09ORCk7CiAJCUVYVF9LRVkoWklISU5UUEFVU0UpOworCQlFWFRfS0VZKFpJTU9QKTsKIAogCQkv
KgogCQkgKiBBbGwgdGhlIGZvbGxvd2luZyBleHRlbnNpb25zIG11c3QgZGVwZW5kIG9uIHRoZSBr
ZXJuZWwKLS0gCjIuNDUuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
