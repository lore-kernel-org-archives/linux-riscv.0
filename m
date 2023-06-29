Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DCAEB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 16:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VvxYPEWEMoApheRPywq0eC7v1shdaT/ygVes5WniJX0=; b=Pe3pCYVb9WGUm/
	yrst9aS1ab/WLIQy0dOLWbHQs0HvFRWhaIl5bj7H2wqwQmNesCnTTe0AmUrffCFwIFWIoHg4bqBS5
	iSmsRJ8EVT4I7mPrjIgOeGKNG1UsGpaUgI4q1Q2CEUmWq7kchwGB3FkihLnS3vRzdPsgaXDr4bBm6
	VHIXp3bPR6X83/+AGtqOD3RMYYEr3N31w2ijCEsveiGVT2krL+aJArj492LF37XrobvGi6kLdX00V
	e9tVka9SfeRLVuqYOVPMJwagWRklcliBDPbm7jU0H1IjfvtQ4PATR2gFUSfi1XJZjugiVuBb+ktyH
	ukR31VyZ3QdK04itREiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEuQV-001WQ8-0B;
	Thu, 29 Jun 2023 16:23:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEuQR-001WNd-0A
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 16:23:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8C46D61594;
	Thu, 29 Jun 2023 16:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7985CC433C8;
	Thu, 29 Jun 2023 16:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688055798;
	bh=eSikYjWsf1u1YgOapbpSLUxaH7RnxQ8gql0i+FIyKOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GH5vzihxkqKrWfUSkEKUdSRtT7VCzM3913wENVZNjt2Ql/kVpdzrxhXsx/kjSSTio
	 kpKtokaAAj1o0/AnrmymQb6xOXoKr/DjEOAI/TAMMf1UUPT+K7TmoDi35HpGUawsKR
	 NqyorhSn7WiV6Y4f3mZxc/hvyYK48p/J9iF5JoNaWgkRZTSuAxylqqdxFllwGMw/hb
	 thcQVYfMLEfqO6w1Mn8o8xI3muqD0PkJtpRb4EYWM3O5MDhi2nrEvlI3VT1GQdcPhS
	 0CmMhC0Zq7YLi7sUBMqF6xpezgMz0gmHhPR55oFW/hKGJJ1/+Ae1B0NsGc3o/eZ0uf
	 9jT9uq6fOl0CA==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Alexey Dobriyan <adobriyan@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 2/2] selftests/proc: Do not build x86-64 tests on non-x86-64 builds
Date: Thu, 29 Jun 2023 18:23:00 +0200
Message-Id: <20230629162301.1234157-3-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230629162301.1234157-1-bjorn@kernel.org>
References: <20230629162301.1234157-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_092319_127555_45662794 
X-CRM114-Status: UNSURE (   8.05  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKVGhlIHByb2MtZW1wdHkt
dm0gdGVzdCBpcyB4ODYtNjQgb25seS4gUmVtb3ZlIHRoYXQgdGVzdCBmcm9tCm5vbi14ODYtNjQg
YnVpbGRzLgoKU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29t
PgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Byb2MvTWFrZWZpbGUgfCA0ICsrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9wcm9jL01ha2VmaWxlIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcHJvYy9N
YWtlZmlsZQppbmRleCBjZDk1MzY5MjU0YzAuLjM1ZTc2NWY3OWI2ZCAxMDA2NDQKLS0tIGEvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvcHJvYy9NYWtlZmlsZQorKysgYi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9wcm9jL01ha2VmaWxlCkBAIC04LDcgKzgsMTEgQEAgVEVTVF9HRU5fUFJPR1MgKz0g
ZmQtMDAxLWxvb2t1cAogVEVTVF9HRU5fUFJPR1MgKz0gZmQtMDAyLXBvc2l4LWVxCiBURVNUX0dF
Tl9QUk9HUyArPSBmZC0wMDMta3RocmVhZAogVEVTVF9HRU5fUFJPR1MgKz0gcHJvYy1sb2FkYXZn
LTAwMQorCitpZm5lcSAoLCQoZmlsdGVyICQoQVJDSCkseDg2XzY0KSkKIFRFU1RfR0VOX1BST0dT
ICs9IHByb2MtZW1wdHktdm0KK2VuZGlmCisKIFRFU1RfR0VOX1BST0dTICs9IHByb2MtcGlkLXZt
CiBURVNUX0dFTl9QUk9HUyArPSBwcm9jLXNlbGYtbWFwLWZpbGVzLTAwMQogVEVTVF9HRU5fUFJP
R1MgKz0gcHJvYy1zZWxmLW1hcC1maWxlcy0wMDIKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
