Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A45AC636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 14:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jyTjhjGOLseZxH8AQQMNYc6eciw0j2lDnqa5P2S03HI=; b=napnQfWYzz8S++
	lFCxyCTIwHnpoGCwqNVQiUt06ijNJb4tVIlj2lPBDXDXhjZ3ohHak8TrqOgd6OLGZkn77LP4grRw2
	y/HK5DjmX6hfkWzwxGPjborCQAAUJ3FenFtFRGkG3Xjf559vDIpBnwCN7gJxfBoyumFdjvjsJxivM
	7WX8S+DODKo4//BuhyKZ25X/ElYpipBx0oCPrIO7wuwOCrhEKtIKY1N7c8obmjyuQarU6JdpV0FvE
	+MZflFl7ddbvPb7qnE5m9ImOYeiGVCcCWFVX6DYMQtiqg1kiY1AEN2HjlRBtfrUm+25Z/wtBOGVik
	mhkTKNSA6ACynbtppD4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSIvd-006ET3-LD; Wed, 15 Feb 2023 14:38:37 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSIva-006ERa-Jy
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 14:38:36 +0000
Received: by mail-wr1-x431.google.com with SMTP id y1so19389892wru.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 06:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDDQpcu4wlArU6dZYMfeUKSEQsg6b1kdryOeCUrFQlc=;
        b=NWWiA7pEQ+rkqfq6PxjAcfVNFkh/3naJV1qTqerZm0mmH+bBEsJWA+oh5IwlpOL+AR
         KXJ7H0JHrAp17b0C+1P0EDUTnuDad6z1StppmmFKeMYRzqBEF3AGsqgBNWd1EXa3LGM+
         tapyOWmDfrPK0EU9s24YUWPS6qTqye3oovAJGa1pJupXz6nwhjkr+q6Reclx3sk9qFJu
         XBx6069D3Wbt7BpXxmJ9T1iuGjsn1zcCKIfJYCvjGHUacLH4MuHMP6cQh14cOZVXoq7a
         /29ySlqZo/dPkpGQ3aqKvkoH086Qd9+B+FfSjJzwbgfmBhtWniu+UssrHq8ODeuVJoTf
         BBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDDQpcu4wlArU6dZYMfeUKSEQsg6b1kdryOeCUrFQlc=;
        b=X5xX60GGVeJjbe+PX2KcmmZekS29PiIvxErbX9ViGbXlBIh8GCiTTkjEhLItoH5sys
         Dz3ES5sjg17rf8ZlRv9kFPrACQGvmo7DFFFYpP6R9G2Ei/DT59Gvk9GsDtQ5EfmgqjQc
         dNuVUP7DWO1L+6a7LKNWvEe0HgYcAj2Ylt0go0NpjjnPOQmvk6/5wGjyCIwrL/R7rX/A
         lSmeVRFstAexegjkpzBSr8zwSbLs7VyBIVog8l/K+9H6DjVZuBLrK/xUHqbdURahrAnK
         OST95QhIcHpht8mXCd6MhOXCZpJUmYSm4cn0iCw9EH1RRPPfFqhILaExnZALtQQFbEwt
         RdKw==
X-Gm-Message-State: AO0yUKUNTyNH5ORaiwx9LVRYB2vRdmJ2P7yUDOHS0D+37JKKM4LrHAje
	aTt2O/13iPnGWJfGWHQzkOsaZQ==
X-Google-Smtp-Source: AK7set9Df7sPhWCSuF3fCAo3V27citHHiLZ7aQJdxJGeprd+nLleiF9LWkfZ3+y7qC+M4ZRkrTuxnA==
X-Received: by 2002:a5d:5552:0:b0:2c5:5dbf:1cc2 with SMTP id g18-20020a5d5552000000b002c55dbf1cc2mr1659354wrw.32.1676471910785;
        Wed, 15 Feb 2023 06:38:30 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id q4-20020a05600000c400b002c54737e908sm13906189wrx.91.2023.02.15.06.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 06:38:30 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v8 2/3] powerpc: Move script to check relocations at compile time in scripts/
Date: Wed, 15 Feb 2023 15:36:25 +0100
Message-Id: <20230215143626.453491-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230215143626.453491-1-alexghiti@rivosinc.com>
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_063834_681206_EB3919C2 
X-CRM114-Status: GOOD (  14.65  )
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

RnJvbTogQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPgoKUmVsb2NhdGluZyBrZXJuZWwg
YXQgcnVudGltZSBpcyBkb25lIHZlcnkgZWFybHkgaW4gdGhlIGJvb3QgcHJvY2Vzcywgc28KaXQg
aXMgbm90IGNvbnZlbmllbnQgdG8gY2hlY2sgZm9yIHJlbG9jYXRpb25zIHRoZXJlIGFuZCByZWFj
dCBpbiBjYXNlIGEKcmVsb2NhdGlvbiB3YXMgbm90IGV4cGVjdGVkLgoKUG93ZXJwYyBhcmNoaXRl
Y3R1cmUgaGFzIGEgc2NyaXB0IHRoYXQgYWxsb3dzIHRvIGNoZWNrIGF0IGNvbXBpbGUgdGltZQpm
b3Igc3VjaCB1bmV4cGVjdGVkIHJlbG9jYXRpb25zOiBleHRyYWN0IHRoZSBjb21tb24gbG9naWMg
dG8gc2NyaXB0cy8Kc28gdGhhdCBvdGhlciBhcmNoaXRlY3R1cmVzIGNhbiB0YWtlIGFkdmFudGFn
ZSBvZiBpdC4KClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4K
UmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CkFja2VkLWJ5OiBN
aWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+IChwb3dlcnBjKQotLS0KIGFyY2gv
cG93ZXJwYy90b29scy9yZWxvY3NfY2hlY2suc2ggfCAxOCArKy0tLS0tLS0tLS0tLS0tLS0KIHNj
cmlwdHMvcmVsb2NzX2NoZWNrLnNoICAgICAgICAgICAgfCAyMCArKysrKysrKysrKysrKysrKysr
KwogMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKIGNy
ZWF0ZSBtb2RlIDEwMDc1NSBzY3JpcHRzL3JlbG9jc19jaGVjay5zaAoKZGlmZiAtLWdpdCBhL2Fy
Y2gvcG93ZXJwYy90b29scy9yZWxvY3NfY2hlY2suc2ggYi9hcmNoL3Bvd2VycGMvdG9vbHMvcmVs
b2NzX2NoZWNrLnNoCmluZGV4IDYzNzkyYWYwMDQxNy4uNmIzNTBlNzUwMTRjIDEwMDc1NQotLS0g
YS9hcmNoL3Bvd2VycGMvdG9vbHMvcmVsb2NzX2NoZWNrLnNoCisrKyBiL2FyY2gvcG93ZXJwYy90
b29scy9yZWxvY3NfY2hlY2suc2gKQEAgLTE1LDIxICsxNSw4IEBAIGlmIFsgJCMgLWx0IDMgXTsg
dGhlbgogCWV4aXQgMQogZmkKIAotIyBIYXZlIEtidWlsZCBzdXBwbHkgdGhlIHBhdGggdG8gb2Jq
ZHVtcCBhbmQgbm0gc28gd2UgaGFuZGxlIGNyb3NzIGNvbXBpbGF0aW9uLgotb2JqZHVtcD0iJDEi
Ci1ubT0iJDIiCi12bWxpbnV4PSIkMyIKLQotIyBSZW1vdmUgZnJvbSB0aGUgYmFkIHJlbG9jYXRp
b25zIHRob3NlIHRoYXQgbWF0Y2ggYW4gdW5kZWZpbmVkIHdlYWsgc3ltYm9sCi0jIHdoaWNoIHdp
bGwgcmVzdWx0IGluIGFuIGFic29sdXRlIHJlbG9jYXRpb24gdG8gMC4KLSMgV2VhayB1bnJlc29s
dmVkIHN5bWJvbHMgYXJlIG9mIHRoYXQgZm9ybSBpbiBubSBvdXRwdXQ6Ci0jICIgICAgICAgICAg
ICAgICAgICB3IF9iaW5hcnlfX2J0Zl92bWxpbnV4X2Jpbl9lbmQiCi11bmRlZl93ZWFrX3N5bWJv
bHM9JCgkbm0gIiR2bWxpbnV4IiB8IGF3ayAnJDEgfiAvdy8geyBwcmludCAkMiB9JykKLQogYmFk
X3JlbG9jcz0kKAotJG9iamR1bXAgLVIgIiR2bWxpbnV4IiB8Ci0JIyBPbmx5IGxvb2sgYXQgcmVs
b2NhdGlvbiBsaW5lcy4KLQlncmVwIC1FICdcPFJfJyB8Ciske3NyY3RyZWV9L3NjcmlwdHMvcmVs
b2NzX2NoZWNrLnNoICIkQCIgfAogCSMgVGhlc2UgcmVsb2NhdGlvbnMgYXJlIG9rYXkKIAkjIE9u
IFBQQzY0OgogCSMJUl9QUEM2NF9SRUxBVElWRSwgUl9QUEM2NF9OT05FCkBAIC00NCw4ICszMSw3
IEBAIFJfUFBDX0FERFIxNl9MTwogUl9QUENfQUREUjE2X0hJCiBSX1BQQ19BRERSMTZfSEEKIFJf
UFBDX1JFTEFUSVZFCi1SX1BQQ19OT05FJyB8Ci0JKFsgIiR1bmRlZl93ZWFrX3N5bWJvbHMiIF0g
JiYgZ3JlcCAtRiAtdyAtdiAiJHVuZGVmX3dlYWtfc3ltYm9scyIgfHwgY2F0KQorUl9QUENfTk9O
RScKICkKIAogaWYgWyAteiAiJGJhZF9yZWxvY3MiIF07IHRoZW4KZGlmZiAtLWdpdCBhL3Njcmlw
dHMvcmVsb2NzX2NoZWNrLnNoIGIvc2NyaXB0cy9yZWxvY3NfY2hlY2suc2gKbmV3IGZpbGUgbW9k
ZSAxMDA3NTUKaW5kZXggMDAwMDAwMDAwMDAwLi4xMzdjNjYwNDk5ZjMKLS0tIC9kZXYvbnVsbAor
KysgYi9zY3JpcHRzL3JlbG9jc19jaGVjay5zaApAQCAtMCwwICsxLDIwIEBACisjIS9iaW4vc2gK
KyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIKKworIyBHZXQgYSBs
aXN0IG9mIGFsbCB0aGUgcmVsb2NhdGlvbnMsIHJlbW92ZSBmcm9tIGl0IHRoZSByZWxvY2F0aW9u
cworIyB0aGF0IGFyZSBrbm93biB0byBiZSBsZWdpdGltYXRlIGFuZCByZXR1cm4gdGhpcyBsaXN0
IHRvIGFyY2ggc3BlY2lmaWMKKyMgc2NyaXB0IHRoYXQgd2lsbCBsb29rIGZvciBzdXNwaWNpb3Vz
IHJlbG9jYXRpb25zLgorCitvYmpkdW1wPSIkMSIKK25tPSIkMiIKK3ZtbGludXg9IiQzIgorCisj
IFJlbW92ZSBmcm9tIHRoZSBwb3NzaWJsZSBiYWQgcmVsb2NhdGlvbnMgdGhvc2UgdGhhdCBtYXRj
aCBhbiB1bmRlZmluZWQKKyPCoHdlYWsgc3ltYm9sIHdoaWNoIHdpbGwgcmVzdWx0IGluIGFuIGFi
c29sdXRlIHJlbG9jYXRpb24gdG8gMC4KKyMgV2VhayB1bnJlc29sdmVkIHN5bWJvbHMgYXJlIG9m
IHRoYXQgZm9ybSBpbiBubSBvdXRwdXQ6CisjICIgICAgICAgICAgICAgICAgICB3IF9iaW5hcnlf
X2J0Zl92bWxpbnV4X2Jpbl9lbmQiCit1bmRlZl93ZWFrX3N5bWJvbHM9JCgkbm0gIiR2bWxpbnV4
IiB8IGF3ayAnJDEgfiAvdy8geyBwcmludCAkMiB9JykKKworJG9iamR1bXAgLVIgIiR2bWxpbnV4
IiB8CisJZ3JlcCAtRSAnXDxSXycgfAorCShbICIkdW5kZWZfd2Vha19zeW1ib2xzIiBdICYmIGdy
ZXAgLUYgLXcgLXYgIiR1bmRlZl93ZWFrX3N5bWJvbHMiIHx8IGNhdCkKLS0gCjIuMzcuMgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
