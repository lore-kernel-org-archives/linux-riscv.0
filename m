Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D281C4167D
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 09:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DHoUIsM/b/BIYlaGUn9fIx58leZMmM54UCMcSw8qKtY=; b=X9iroZV/eb8dix
	7Sw0Igk3daJ5YaFAI5JkevtaENg1n+tYxRX+E7Jg1ODa3unZdnfGIr4GtnJ517j9xLc13688tzZFi
	NWH9U1q06S+9lUFqoybJL8Lguh8cphhghgGAWfnP04UKh6QOYJBANaFVAFO5gtxt5EWKQcTbtoQL7
	5hpVsMET/+5nM80UES39bmiGnkTqlyFoHJcZo9lb3wdnpMnX24/eBs4b2tg9Dx8k8v+PaJ2izx9G/
	Uz5U84E02+/Imd9rfphxutBc2F2P4Lh2lxFPOM3JbRAoDqvVdayanupNMJCZJ/Rj7WLOJzSadowHb
	E1akYA9y+IZpqXSMcCNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyq4Y-00B1YD-00;
	Fri, 03 Nov 2023 09:02:34 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyq4V-00B1XG-0E
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 09:02:32 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-407acb21f27so1279855e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 Nov 2023 02:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699002148; x=1699606948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m+1tHEC+sLfsTYbEucEalWJbhmfqSui8PoKCdZjk+zI=;
        b=UlFnfU9oDATc1/JEct5XI02xmpyYA3IlJU/+x0vBeySdjVGU8W4GaQvEmx7OZzWvgH
         LOve6ZIy2cn63x14Qz/GmfCiWSen7arMmZ0h9J3g5MRE6NPudwXuesCqZVwyYqnl/XM7
         0rK6OjxWlXUjyU54cOmq4nan6qsnnALxkGweDlPL+NPVcn9tvGJ7EsKDgwTipaWUZ3zW
         febjDGMmIDrkRlNSvcQqMw2mn+wXmV/w1QrDHHkx7jgnL+FCmZE2hMKhb3JVdSRNbBt7
         wtSfgGBJOh0erpUqrCJcNaYDQH8sSOiKoKNNrQjyA/t31KUC351NPrTdklWaJSfRqtzW
         fUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699002148; x=1699606948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+1tHEC+sLfsTYbEucEalWJbhmfqSui8PoKCdZjk+zI=;
        b=ZDpBFW1UINHFpjALp5aZosBfeaYrcscIdV8k25+Zg5aj8K831cAtPYqZf0KtMlNQ9I
         1wtwkBHC1k+yGI4F1zGXuEOAIcSQ4rkE6RUvMCzGx8rSD5hrhF8k/bv3nQ4IclcvJWLg
         8JmN5LVYusLyH8WER0GFYEmDOdti8QOiXSPYbqMn/WrmhIJKHKoJw6tAxdv7XTwpdWxL
         XzSvADq/iU/4+vAaHpEgAzVOHfsPsaxbcfkHujORh7rrInW5RDk1XYFIJztCU1WBjrKa
         shvUropdNcqS59ZeZNY8oPfVrvyEy6EP+ZJzdfKC6IakXSaKWuye9IlHdDXxV0H0Lj1a
         fQMA==
X-Gm-Message-State: AOJu0YxLjKgxLFbLm/CdANQ+Qti3DDpxlsJ0GDfrwwxkIBGgJSZXlnI3
	5n/p8vKb9YVID2axT3jAXv9lWPJ+TkTJDf+lCKCfnA==
X-Google-Smtp-Source: AGHT+IEUKIxfzHqdx0bBHDfjL1JpFeGuQKT+ZUC9qvVxD+L3bcl3Xt888YkC73FNzyQScI+PUg41eQ==
X-Received: by 2002:a05:600c:1c21:b0:401:7d3b:cc84 with SMTP id j33-20020a05600c1c2100b004017d3bcc84mr16977354wms.0.1699002148251;
        Fri, 03 Nov 2023 02:02:28 -0700 (PDT)
Received: from carbon-x1.home (2a01cb008a4f7000834139aab36b6ffb.ipv6.abo.wanadoo.fr. [2a01:cb00:8a4f:7000:8341:39aa:b36b:6ffb])
        by smtp.gmail.com with ESMTPSA id m21-20020a056000175500b0032326908972sm1346558wrf.17.2023.11.03.02.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 02:02:27 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [PATCH] riscv: fix misaligned access handling of C.SWSP and C.SDSP
Date: Fri,  3 Nov 2023 10:02:23 +0100
Message-ID: <20231103090223.702340-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_020231_323736_C3A887FE 
X-CRM114-Status: GOOD (  10.06  )
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

VGhpcyBpcyBhIGJhY2twb3J0IG9mIGEgZml4IHRoYXQgd2FzIGRvbmUgaW4gT3BlblNCSTogZWMw
NTU5ZWIzMTViCigibGliOiBzYmlfbWlzYWxpZ25lZF9sZHN0OiBGaXggaGFuZGxpbmcgb2YgQy5T
V1NQIGFuZCBDLlNEU1AiKS4KClVubGlrZSBDLkxXU1AvQy5MRFNQLCB0aGVzZSBlbmNvZGluZ3Mg
Y2FuIGJlIHVzZWQgd2l0aCB0aGUgemVybwpyZWdpc3Rlciwgc28gY2hlY2tpbmcgdGhhdCB0aGUg
cnMyIGZpZWxkIGlzIG5vbi16ZXJvIGlzIHVubmVjZXNzYXJ5LgoKQWRkaXRpb25hbGx5LCB0aGUg
cHJldmlvdXMgY2hlY2sgd2FzIGluY29ycmVjdCBzaW5jZSBpdCB3YXMgY2hlY2tpbmcKdGhlIGlt
bWVkaWF0ZSBmaWVsZCBvZiB0aGUgaW5zdHJ1Y3Rpb24gaW5zdGVhZCBvZiB0aGUgcnMyIGZpZWxk
LgoKRml4ZXM6IDk1NmQ3MDVkZDI3OSAoInJpc2N2OiBVbmFsaWduZWQgbG9hZC9zdG9yZSBoYW5k
bGluZyBmb3IgTV9NT0RFIikKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJA
cml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyB8
IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwppbmRleCAzNzhmNWIxNTE0NDMuLjUz
NDhkODQyYzc0NSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25l
ZC5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwpAQCAtMzQyLDE2
ICszNDIsMTQgQEAgaW50IGhhbmRsZV9taXNhbGlnbmVkX3N0b3JlKHN0cnVjdCBwdF9yZWdzICpy
ZWdzKQogCX0gZWxzZSBpZiAoKGluc24gJiBJTlNOX01BU0tfQ19TRCkgPT0gSU5TTl9NQVRDSF9D
X1NEKSB7CiAJCWxlbiA9IDg7CiAJCXZhbC5kYXRhX3Vsb25nID0gR0VUX1JTMlMoaW5zbiwgcmVn
cyk7Ci0JfSBlbHNlIGlmICgoaW5zbiAmIElOU05fTUFTS19DX1NEU1ApID09IElOU05fTUFUQ0hf
Q19TRFNQICYmCi0JCSAgICgoaW5zbiA+PiBTSF9SRCkgJiAweDFmKSkgeworCX0gZWxzZSBpZiAo
KGluc24gJiBJTlNOX01BU0tfQ19TRFNQKSA9PSBJTlNOX01BVENIX0NfU0RTUCkgewogCQlsZW4g
PSA4OwogCQl2YWwuZGF0YV91bG9uZyA9IEdFVF9SUzJDKGluc24sIHJlZ3MpOwogI2VuZGlmCiAJ
fSBlbHNlIGlmICgoaW5zbiAmIElOU05fTUFTS19DX1NXKSA9PSBJTlNOX01BVENIX0NfU1cpIHsK
IAkJbGVuID0gNDsKIAkJdmFsLmRhdGFfdWxvbmcgPSBHRVRfUlMyUyhpbnNuLCByZWdzKTsKLQl9
IGVsc2UgaWYgKChpbnNuICYgSU5TTl9NQVNLX0NfU1dTUCkgPT0gSU5TTl9NQVRDSF9DX1NXU1Ag
JiYKLQkJICAgKChpbnNuID4+IFNIX1JEKSAmIDB4MWYpKSB7CisJfSBlbHNlIGlmICgoaW5zbiAm
IElOU05fTUFTS19DX1NXU1ApID09IElOU05fTUFUQ0hfQ19TV1NQKSB7CiAJCWxlbiA9IDQ7CiAJ
CXZhbC5kYXRhX3Vsb25nID0gR0VUX1JTMkMoaW5zbiwgcmVncyk7CiAJfSBlbHNlIHsKLS0gCjIu
NDIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
