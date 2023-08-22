Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64208EE49A4
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 14:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z1djbn8PwUmDrXJBGstRK/9Sf17iCvrT112q8h38lZg=; b=lC7c3eewbzXalg
	qzogQPs9M+J5ayDEQI3QfUzPYI7CGnKvl3te7Lg2BVsdIaZmA8/z6pu5NJP90wAk6IXBJpJXrDQtw
	semrzVPK84CyI9EShrUHvqZcPFf3B3SmB3US9Y9eLtKURNc1YuqhX87PJ6Ypn090wrN+cEjsIHDE+
	FkdXtG8XXFDnvRUGNOOCtXK8RihgmCTapqOkCP5ICYKUDxaL+SCxxVEk01l8TVNekMUjcIaQ8SMmW
	AZbbkf33e4gQKXwwUBlYt+gWz6fDhEGlma3oThznY6zFx9kfjY8+dI/AuqKphcb5K2dZVt4b4RRVR
	3AY2TdUqlnpkEyucshsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYS2D-00G9ar-0F;
	Tue, 22 Aug 2023 14:07:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYS1S-00G8s5-24;
	Tue, 22 Aug 2023 14:06:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=dq+jcN5GMg5Lle2kiMLPNS24YEsjylZTVcQUjBnRNs0=; b=NeQ+wBcF+TjyuVqvK1tM+b0CdG
	XBER+OL4lTLf7ejA35o3TM8wWC9f0d3+oC/obyLEKCLwEknW24XQEQT848JcTgmwnmO23lmAP5okW
	c3W7TFiqYUPfs7rhkuFvB7jwpYDtokFT5jvsD59ikYGToy29XwcPfvPJpq5+oK0ZUmxfjDWhU2h+b
	5CvqASXbMk76gQlonvx/61uRfkRPqQM0O88H1t1uwfEiWRc63B9vU+b85e+7AnLNMhTfwsv+14cs/
	e+ED5lT1Xo4SBqnKAlW13oauYmkcEywS4qc+Ltld0ZsPucY7TABagX0Msn2qnRJDT/OfViMia83s9
	GDU5s2ng==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYS1O-002n2M-23;
	Tue, 22 Aug 2023 14:06:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0EBE1657D2;
	Tue, 22 Aug 2023 14:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5084C43391;
	Tue, 22 Aug 2023 14:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692713165;
	bh=DtrqsekNxnVEUxJ8rAESK/JTguJ8OvysbbylOwjoIT0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZOgpLFvEoV4Fl1FvVbSSgz2/Mj78bvfRA8xiejW7Bi3U/XKUn1OK5Eoiwp02hRqJV
	 BoN7QzqTJlT7/4sq7e6uCpcQ0FJjQHbtBa4Bh+ISC41INrfFOdwYeh1/jBX9aooVXR
	 xozkSbtxJpejUwy8oVHtfCOrL3WFrZ1vSqvBFxc15R16xh9KYb9zqCvolFqSBzWMpC
	 blq4imAo3MoK7BNbXAhzJzD9fcNKaUfEGEyslUR+4gCpvceBvZGZmc4EsCa5kZYWJ4
	 YIqZmA0mtL1Kn+lHX89MIXxcqP96lkEkvdAZdIXGJrzCIS9l+EEO1rJPLncz9AzIix
	 qNzdyXKqj7Obg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 22 Aug 2023 14:57:02 +0100
Subject: [PATCH v5 29/37] kselftest/arm64: Add framework support for GCS to
 signal handling tests
MIME-Version: 1.0
Message-Id: <20230822-arm64-gcs-v5-29-9ef181dd6324@kernel.org>
References: <20230822-arm64-gcs-v5-0-9ef181dd6324@kernel.org>
In-Reply-To: <20230822-arm64-gcs-v5-0-9ef181dd6324@kernel.org>
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
X-Mailer: b4 0.13-dev-034f2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DtrqsekNxnVEUxJ8rAESK/JTguJ8OvysbbylOwjoIT0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBk5MAGLEBZ9sskmCLotqY50F2aYrfxhSo+BYl1xBRX
 FbvO12SJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZOTABgAKCRAk1otyXVSH0PZuCA
 CA6lfUrkE3UeDR2DNu+5N5dkfGxwXpB+tmPrcnUEeEirT3qOITAEyNfcVjBtyYo0wepiBNmuVV2RHf
 AISFl+OOwApMFIcy35/meJtPtEmfBihBmFuEpnswF7A4XzdoadZzYbNOQZHIRvThARc6HD9L8093sG
 szHiwh7XS9v9GmJt//PVC7MUAsHySUTEa3PAIcX0wUyDgAoqXddqUVLYZNX8Ib5qGmt3FamXoBkSD+
 RXvf2XbfumURCXKlF34h9zvAWwOG0AZZWRULwmH9xYbliAhgBsla19+qnXFHWulkXAOSwIL20FWsTf
 AWf2fqlFSy46sUl+38NML+eaYrGvx9
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_150615_002434_A4B45DB5 
X-CRM114-Status: GOOD (  11.40  )
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

Teach the framework about the GCS signal context, avoiding warnings on
the unknown context.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/signal/testcases/testcases.c | 7 +++++++
 tools/testing/selftests/arm64/signal/testcases/testcases.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/tools/testing/selftests/arm64/signal/testcases/testcases.c b/tools/testing/selftests/arm64/signal/testcases/testcases.c
index 9f580b55b388..1cd124732be4 100644
--- a/tools/testing/selftests/arm64/signal/testcases/testcases.c
+++ b/tools/testing/selftests/arm64/signal/testcases/testcases.c
@@ -209,6 +209,13 @@ bool validate_reserved(ucontext_t *uc, size_t resv_sz, char **err)
 			zt = (struct zt_context *)head;
 			new_flags |= ZT_CTX;
 			break;
+		case GCS_MAGIC:
+			if (flags & GCS_CTX)
+				*err = "Multiple GCS_MAGIC";
+			if (head->size != sizeof(struct gcs_context))
+				*err = "Bad size for gcs_context";
+			new_flags |= GCS_CTX;
+			break;
 		case EXTRA_MAGIC:
 			if (flags & EXTRA_CTX)
 				*err = "Multiple EXTRA_MAGIC";
diff --git a/tools/testing/selftests/arm64/signal/testcases/testcases.h b/tools/testing/selftests/arm64/signal/testcases/testcases.h
index a08ab0d6207a..9b2599745c29 100644
--- a/tools/testing/selftests/arm64/signal/testcases/testcases.h
+++ b/tools/testing/selftests/arm64/signal/testcases/testcases.h
@@ -19,6 +19,7 @@
 #define ZA_CTX		(1 << 2)
 #define EXTRA_CTX	(1 << 3)
 #define ZT_CTX		(1 << 4)
+#define GCS_CTX		(1 << 5)
 
 #define KSFT_BAD_MAGIC	0xdeadbeef
 

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
