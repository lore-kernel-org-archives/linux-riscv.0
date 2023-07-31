Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A388EC001DF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 13:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5J2YNO4zgc2Spd4dgqNmXTdhrRbw+pz5V9wwn3UIIMM=; b=QvBHztzzC+94Hx
	cbML52BxCRaACUZeUajNbcmV6p/eE2bvjgkSI5gRtTAIFdWZ7O6m6T2dKKHQ3W8vHPcgN2RMWBLi1
	nBl+Ihk9jjnvsrytw7Q+6vyrHs+IfxhMOPFjmbjE3C1cQFWLy8mBspPwqmse9jHdjS22TVDsyBXJ7
	CRbLxAZ/mlpQ4XIvg+7fnwk6nquxyK1bmX5arm+dnwTy2g7Aw6VcLO9h7D8KGvLkQ/RJir9K0Y7bF
	PZHaQZx7GO3zR1HQeQQrDUv3rhz08k2NMWVWPx9JjrCFgwrz3Ikr/gorDLGWTkZXkWHk6b9r1V+Uk
	30MspOQbheS6Qy36MHXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQTN6-00FvCe-3D;
	Mon, 31 Jul 2023 13:55:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQTLB-00FtTs-1s;
	Mon, 31 Jul 2023 13:53:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6f2sHhBx1jepR/YNA5SyNc7wOpOk2HW/TCkILD2DXmg=; b=kCzK8e99RAZp+lPAs3luAbLnSa
	LrbiRkOk5c5MTR9FoTzUKwORWsiPuupBcldZGNFSjf2wFTf6QJ9ZNg++pZ7yaEGT1dOST7wOYRexo
	jFN4dNiiZbmtTSl6KCOF0MMjyqutPGNIkw8jnWbyrP4DpExFp2lFyFn1fHYqsMREqyk4FuhvR/uUk
	fa5MS+apctGY+6btlEVpkk3h/A6ORWX8YMnksYINsP/ViQLRfgOHwFU4mXF5nZxN2ZRpjTvkhLl6G
	ECUPJiobWiJj3YlPmp99oSZkON8OrJp1/oLKOn94HPUY3tFoV4XBJogSgf+RmcEuYWZuaIO8FUF6w
	1CBpW2NQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQTL7-00Cjgd-0H;
	Mon, 31 Jul 2023 13:53:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EA6C161158;
	Mon, 31 Jul 2023 13:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDCDC433CB;
	Mon, 31 Jul 2023 13:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690811610;
	bh=6C9vpUKzxaC1YPufnnUpE8qHeuHqYjFB9iVUxK25t6w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UZFz5zJl1rGYE8fD7JHP53kzdgO69dJ63VOmzz7bUb0LRuW6i+ZcOMuBP5jDkeRes
	 0opKxX8qDYyU7cowwofSW23tP91yr2be4yytxli0fu8+qJNaTuoP6yXPE0BzQ/2HJd
	 btw9ri7qVDKqBxG9CDZa4sEC+7NsK9s1eXRoR4LIR9/02JoljenLgYA+nviZBBpIy5
	 3WFlQYKikMTaZRg8oZMHE5jqtdU5WWNcGod+fL1x8b5uRW6F3CV5PNvRD/qGhWtYMe
	 LA9Lwu0Uo9+P//db7CjlsLxsv3amgMixYWOFazIc1PJp2o1GXXEZWoko+CJfn3Bb3w
	 3CdSUM0Hussmg==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 31 Jul 2023 14:43:35 +0100
Subject: [PATCH v3 26/36] kselftest/arm64: Verify the GCS hwcap
MIME-Version: 1.0
Message-Id: <20230731-arm64-gcs-v3-26-cddf9f980d98@kernel.org>
References: <20230731-arm64-gcs-v3-0-cddf9f980d98@kernel.org>
In-Reply-To: <20230731-arm64-gcs-v3-0-cddf9f980d98@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6C9vpUKzxaC1YPufnnUpE8qHeuHqYjFB9iVUxK25t6w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkx7wotwwlH/8oWbi9bhoozQqb9Mmh8Aqb/FKJVt4Z
 qCjBxyGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZMe8KAAKCRAk1otyXVSH0IsnB/
 9tm+woi16lWLPQgMUT4tC/eRXlObR5g86WJCuPogQIpgBdTwwdKYR98ce07K6N7QDtvGAeT+3D7cTe
 JwbWzUZOYAUDAbdVuM2yT2WvrhhTVVromril0fKmh5LaOewRZNej29XwphRZ168nYzkX0jaCK1z6/5
 KzEm388tMfPmjOVOtet36gYdjmnBWBSD79CpbZUDTtk2Ld5YvAfo01QDVQde95o1Bhp2d8AFYXkUv2
 uzEGsFfsW6vn3HxjeNQxJYuDfaHcq/wCJPt+3WGavHLwqClwxZLMG11kK+ZbZpSL/0sJmUeHkQ6CRM
 nb0Zdkh3/BvB5mcAUTCYuK6uO6A/F8
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_145337_553459_978737EF 
X-CRM114-Status: GOOD (  12.01  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add coverage of the GCS hwcap to the hwcap selftest, using a read of
GCSPR_EL0 to generate SIGILL without having to worry about enabling GCS.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index d4ad813fed10..38844e4c5aae 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -39,6 +39,17 @@ static void cssc_sigill(void)
 	asm volatile(".inst 0xdac01c00" : : : "x0");
 }
 
+static void gcs_sigill(void)
+{
+	unsigned long *gcspr;
+
+	asm volatile(
+		"mrs	%0, S3_3_C2_C5_1"
+	: "=r" (gcspr)
+	:
+	: "cc");
+}
+
 static void mops_sigill(void)
 {
 	char dst[1], src[1];
@@ -223,6 +234,14 @@ static const struct hwcap_data {
 		.cpuinfo = "cssc",
 		.sigill_fn = cssc_sigill,
 	},
+	{
+		.name = "GCS",
+		.at_hwcap = AT_HWCAP2,
+		.hwcap_bit = HWCAP2_GCS,
+		.cpuinfo = "gcs",
+		.sigill_fn = gcs_sigill,
+		.sigill_reliable = true,
+	},
 	{
 		.name = "MOPS",
 		.at_hwcap = AT_HWCAP2,

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
