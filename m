Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD1FEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 11:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sd6NZ7REjMcBnBted/z1t0CsSy/8Etovi5nVQRQXBDc=; b=WYcqQw1Fsvfjf8
	q7c+0R0gw7vUTZEjXzIi6L2feC7EkIJd/h4sXUDTp0gkucUPoWG5m9i5c9y+mPYzuyCO/cA8LO83M
	xwXUvb48kzAXKAB9omsWDCfIvw/gp8y4LLRce/s5Jb9BQS55ldhHCVHqYNPaCVstgLzORAsrdf1wj
	r0XcysZ5tJwEsjqPFg/00Erd6zdPFnzfCyR5lGPf/bwP577DWNCIT4PbvhizMRkC/nc+T0BJizf0L
	cnJXJ/ncFyDBmHPWe+ZAL+i1SQBDuV+xkukS3ftNkBv9stOMhBucmO67xhKgLR+8IHdqu0edm83c1
	XSW7tHSgzWmzsI6BN+lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJuxy-003ADv-2I;
	Thu, 13 Jul 2023 11:58:38 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJuxt-003ACs-2b
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 11:58:37 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3159da54e95so725353f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 04:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689249511; x=1691841511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nBLkkw1G6WSJr1HvvBebHePyOgAnthAqxl0kKfFGkRY=;
        b=YprnJVutMhoiweGKBDkkZSmbZayXXBuZ0/GI8RFNmiLty3opDI4z1QzMtCVecjtgw/
         TVZ9QWZaDwUoB/JKREJ7H/HZ7fMsu9HxP96g/gXK8bcS6kUj/+hn0BBvtiq3HanIRfRP
         g/1v98zt5DDuKQpr7Rsqsx7XrqWF6/9V5h4EQ/BNCN7CbBYYUuqwkq+Pjo6KkHGCpFly
         5RCssvuBkdbwHDkq562tto5dnLMnnTpSFhMca9Xxtwjd3okewrzOUejXH2jjfTTdAYHQ
         R7M4GP/m/IxWTsHAJ5tpSdZ0yYXTDMsYBIHA87/mLAWszrG3xVVzWbULrJhVjGgwca22
         fmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689249511; x=1691841511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nBLkkw1G6WSJr1HvvBebHePyOgAnthAqxl0kKfFGkRY=;
        b=WsmPefSEkPWJt0GsRhgzO0yDd6S8vBCvlX/IJkxPsmpmyz7nsYRbAKw5wDE0RDai/F
         fDmHLSuv5yAaex89lPnm4oAbzeA9xCb6lrdVS40LukO9IbS+cXsjdqIcC+wkqGiaMcM6
         Z0y34Jmo02qzjK8UlUPXUB/vawf68y4XuGaLtdEAntnuxD9+0PYgpoRyh93/CF74YjJN
         GyZRCjjV2urI0eSbGDJEdd0pxSYM9qsXQgQUkojxMIKLwhn/7g/HeDl0DUIBDU167O/z
         WyiZ0tm4UjHAi1Xixu3NWpDvGPDJmR9jSI5Bw9CPSAQf82U2LsfzfRLt3dl3xqwbthGO
         wuAg==
X-Gm-Message-State: ABy/qLZr/pi1Pg0xo8/wu1c72peghT2D38l/m/5MBW//FwR+KYJ9s9ap
	TKlBn7Lb0xYli7yBQP8ny/d7cA==
X-Google-Smtp-Source: APBJJlFfpzpAdIOQcPc6dpdK4fawVhchxwxSJ5mWwgcfyvbo9h+OdkX+A2HfhE1WN+ZtCs33kZQVtw==
X-Received: by 2002:adf:e98f:0:b0:314:220d:7 with SMTP id h15-20020adfe98f000000b00314220d0007mr1219828wrm.45.1689249511576;
        Thu, 13 Jul 2023 04:58:31 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id r8-20020a056000014800b0030fa3567541sm7767115wrx.48.2023.07.13.04.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 04:58:31 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andy.chiu@sifive.com>,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] selftests: riscv: Fix compilation error with vstate_exec_nolibc.c
Date: Thu, 13 Jul 2023 13:58:29 +0200
Message-Id: <20230713115829.110421-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_045834_072984_D02A71FE 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
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

VGhlIGZvbGxvd2luZyBlcnJvciBoYXBwZW5zOgoKSW4gZmlsZSBpbmNsdWRlZCBmcm9tIHZzdGF0
ZV9leGVjX25vbGliYy5jOjI6Ci91c3IvaW5jbHVkZS9yaXNjdjY0LWxpbnV4LWdudS9zeXMvcHJj
dGwuaDo0MjoxMjogZXJyb3I6IGNvbmZsaWN0aW5nIHR5cGVzIGZvciDigJhwcmN0bOKAmTsgaAph
dmUg4oCYaW50KGludCwgLi4uKeKAmQogICA0MiB8IGV4dGVybiBpbnQgcHJjdGwgKGludCBfX29w
dGlvbiwgLi4uKSBfX1RIUk9XOwogICAgICB8ICAgICAgICAgICAgXn5+fn4KSW4gZmlsZSBpbmNs
dWRlZCBmcm9tIC4vLi4vLi4vLi4vLi4vaW5jbHVkZS9ub2xpYmMvbm9saWJjLmg6OTksCiAgICAg
ICAgICAgICAgICAgZnJvbSA8Y29tbWFuZC1saW5lPjoKLi8uLi8uLi8uLi8uLi9pbmNsdWRlL25v
bGliYy9zeXMuaDo4OTI6NTogbm90ZTogcHJldmlvdXMgZGVmaW5pdGlvbiBvZiDigJhwcmN0bOKA
mSB3aXRoIHR5cGUK4oCYaW50KGludCwgIGxvbmcgdW5zaWduZWQgaW50LCAgbG9uZyB1bnNpZ25l
ZCBpbnQsICBsb25nIHVuc2lnbmVkIGludCwgIGxvbmcgdW5zaWduZWQgaW50KQrigJkKICA4OTIg
fCBpbnQgcHJjdGwoaW50IG9wdGlvbiwgdW5zaWduZWQgbG9uZyBhcmcyLCB1bnNpZ25lZCBsb25n
IGFyZzMsCiAgICAgIHwgICAgIF5+fn5+CgpGaXggdGhpcyBieSBub3QgaW5jbHVkaW5nIDxzeXMv
cHJjdGwuaD4sIHdoaWNoIGlzIG5vdCBuZWVkZWQgaGVyZSBzaW5jZQpwcmN0bCBzeXNjYWxsIGlz
IGRpcmVjdGx5IGNhbGxlZCB1c2luZyBpdHMgbnVtYmVyLgoKRml4ZXM6IDdjZjYxOThjZTIyZCAo
InNlbGZ0ZXN0czogVGVzdCBSSVNDLVYgVmVjdG9yIHByY3RsIGludGVyZmFjZSIpClNpZ25lZC1v
ZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KLS0tCiB0b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdnN0YXRlX2V4ZWNfbm9saWJjLmMgfCAy
IC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdnN0YXRlX2V4ZWNfbm9saWJjLmMgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdnN0YXRlX2V4ZWNfbm9saWJjLmMKaW5k
ZXggNWNiYzM5Mjk0NGE2Li4yYzBkMmIxMTI2YzEgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL3Jpc2N2L3ZlY3Rvci92c3RhdGVfZXhlY19ub2xpYmMuYworKysgYi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdnN0YXRlX2V4ZWNfbm9saWJjLmMKQEAgLTEs
NiArMSw0IEBACiAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Ci0jaW5j
bHVkZSA8c3lzL3ByY3RsLmg+Ci0KICNkZWZpbmUgVEhJU19QUk9HUkFNICIuL3ZzdGF0ZV9leGVj
X25vbGliYyIKIAogaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQotLSAKMi4zOS4yCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
