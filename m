Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A840DC52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 01:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KIgIOqnQOe0Y1VbuqN2CC6AUmzTdn4w2t4B8vLVuuL0=; b=FavZpNL5TEtQnJ
	9zqckJ5G/EINlNnaxT683RkQIksdaUgw8dJztXg6oXfp7KwSMWw9Sf1WO9vsauf7pUtxr1JVjUheo
	1uurwy4fWvhDBLkR1P0GZAPf6o31rU/CNfYNaZl9wWKyNC3UKtnrjW7LZC7Y4UlGleWNfCiTJWRVc
	UVUXJaFAB1XGQaRP777g827Jg3Yu6kG/ix4cMw6AvSPDzGhscJs7lSGUAx4CTHgObJkapnBxpMfzD
	ieKOANUHMPQBdYrjV5qfrUfYGHJZNK4l6qT/JMwfBc96IiKKqeZRbop9MasW+HH/mkyBrEkvj4qes
	KPsEvYR6Dcw4VhaYMrkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwYE-0000000Au50-2m3o;
	Thu, 22 Aug 2024 01:23:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgwSW-0000000ArTb-1uQa;
	Thu, 22 Aug 2024 01:17:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BE842611D6;
	Thu, 22 Aug 2024 01:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48AD9C32781;
	Thu, 22 Aug 2024 01:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724289471;
	bh=0WRESyvBFvhlHiGA4Y8lOQoOddezzHHj49JAXCWn5As=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E97AXxJyaLvA4eWkGc/srnZc1i0qVSJTBX+sUDHdNmRoGg03x0HFQ0Ma+lm8HaScc
	 Duhxzy20BDn4wqnOjRbwWBgCYTz4T/8RKkYrgjUzHGXtwd7KzLvitF7UHI5r/KgwBc
	 D3Xj7aLSG9QI8DbtgXVwjDCG4RVVA/dfn33LCkbnC6u2lMNcNiDhFsHFEZJh38yt20
	 wZfoyvPjNo/c22X5tqMwJ9SzQ2ScyDn1mnrstbZFjIM838vHpOIcUtHrDSdOhjD+1W
	 pd1vcED/CnO9KgVwk4ZIjzZyBONBoqPTyeOdWydoAfX4uOic+6BiQsIkg8VIPNOGTv
	 Js2v5T0IkyuBA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 22 Aug 2024 02:15:12 +0100
Subject: [PATCH v11 09/39] arm64/gcs: Provide put_user_gcs()
MIME-Version: 1.0
Message-Id: <20240822-arm64-gcs-v11-9-41b81947ecb5@kernel.org>
References: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
In-Reply-To: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Ross Burton <ross.burton@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0WRESyvBFvhlHiGA4Y8lOQoOddezzHHj49JAXCWn5As=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmxpEqxiyXnYx2N/sii4yn4wPWEiex3gccD8helpbj
 Tm7s6tOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZsaRKgAKCRAk1otyXVSH0C9WB/
 wN8Eqbg+t1T6Ozlrs7p4tljp5Q6/NNlBRl+CXbZ4BJz0pmv0aBbMKEf69fLa7ToBqPn4l2Ce1sdaiT
 KJyqgPAxHOH+75KzzM286S7M2f2pY2ZF+/PKd+ydSP3j/w4XjWv90XxSZzLEMsCbrndYbD2524082z
 x4+8Oq9sWcKTTu3gUmWcST86jfaJdgluokx7H84dj00F0VDxn3PFfHnO3eho5joU49GfxI7IfHh0pV
 8nKEJXul/ofTART5hQHANESLXtY9P/ArrqfmrF7QyFzUpEFmlGciorgGHLwxf4Q3gqtOmzRaJ5GPMi
 fHNdmoz6JFKxZkDwoEy87pw3AtZnr+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_181752_674225_8ADA62F8 
X-CRM114-Status: GOOD (  11.18  )
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

In order for EL1 to write to an EL0 GCS it must use the GCSSTTR instruction
rather than a normal STTR. Provide a put_user_gcs() which does this.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/uaccess.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 6aba10e38d1c..ecdd47cf1d01 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -522,6 +522,24 @@ static inline int gcssttr(unsigned long __user *addr, unsigned long val)
 	return err;
 }
 
+static inline void put_user_gcs(unsigned long val, unsigned long __user *addr,
+				int *err)
+{
+	int ret;
+
+	if (!access_ok((char __user *)addr, sizeof(u64))) {
+		*err = -EFAULT;
+		return;
+	}
+
+	uaccess_ttbr0_enable();
+	ret = gcssttr(addr, val);
+	if (ret != 0)
+		*err = ret;
+	uaccess_ttbr0_disable();
+}
+
+
 #endif /* CONFIG_ARM64_GCS */
 
 #endif /* __ASM_UACCESS_H */

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
