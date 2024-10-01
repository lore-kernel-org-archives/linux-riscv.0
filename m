Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C78FCF318A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 23:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ihj071/dWFm13SJMhr8gcUIbB/8hbVPgDTQrlxw6VzM=; b=H71iyOYGJxnwZj
	lVhzSFKX+TPowE8t2jlJSBwNQmAwyKmnVCCyFEB9LbXosRYFUQPkhru0nEjeMIWbPuCU4oG0VOZeq
	UQBXHoNaqy3/ussRM7hkOGD0X1AFaCWz+w33Vonwqc9i+/Rp+GXoBvr39zIwC8oOx69/1GGkgaZgf
	K/MWJ0oHmpPTRHdOnmiQt10+xV2LZ/77B82XaDUuZ8Nv+WKtJ2sA+sY+QTinOqP3M5I5haSnfzFv9
	lMuGYF0CSHhMG5H5TjKwZhT/0+9g0NkX4tvPDI9C1+Vd9JTmms6de6BzlapCVQolRirOs/n5tbt6Z
	9s6iJQIgA0LBeLff0ntg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svm4I-00000004Kxh-06Xl;
	Tue, 01 Oct 2024 23:14:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlsM-00000004Gft-3aEM;
	Tue, 01 Oct 2024 23:01:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 064B75C1060;
	Tue,  1 Oct 2024 23:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBEEC4AF09;
	Tue,  1 Oct 2024 23:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727823709;
	bh=MhYyeOgDPJjiPnqJmYVftV/y+2757NB2AZxb6KEZfRo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O+nAC/nmVZwWMWdkYfsQ5QNw1HeIy87NQ75pgl+F8dMYjFyJLBFGMFpjkHg1uQZRC
	 vjYEghqCTeKu90RZu6kQL5Xonwg3xCT124/BQe26yHucyusg5jSF2xblyLFGbab7fi
	 uOn+iDl4a6d4TN4fSkEy8Moq5uBIhZUdIz31oCpfKK/a2I3362UA9ntiotma8DV6jm
	 sECKdDjAV8rPgzAJY6xaj2NsVoU7s6sQohoK54N5DXGYbog663prRwHWOZ0Zf4D1SH
	 dDG6Aif2oT5rhMvpfA7/UW4NLwNAgjFcxyZkDngxoM+ye3IYl2cJHm9rHoIDtFSBfJ
	 DdysV8yEx9C7Q==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Oct 2024 23:58:49 +0100
Subject: [PATCH v13 10/40] arm64/gcs: Provide put_user_gcs()
MIME-Version: 1.0
Message-Id: <20241001-arm64-gcs-v13-10-222b78d87eee@kernel.org>
References: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
In-Reply-To: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
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
 Ross Burton <ross.burton@arm.com>, David Spickett <david.spickett@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=1159; i=broonie@kernel.org;
 h=from:subject:message-id; bh=MhYyeOgDPJjiPnqJmYVftV/y+2757NB2AZxb6KEZfRo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm/H7LRW4KlQxlmJfUOX9ON9sOn/C7Urh9KeH3veeC
 argNFK2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZvx+ywAKCRAk1otyXVSH0HNOB/
 42LopqO9IfXhDQ4aJcLBH1V2IPSjrLJspB/s/FscgnTaFVT9Rk9vsh9BmrNqn4XzTtZ3lZEmU0PUMs
 J1sxyGjeOZvm4zGr1aJRDxScmujmlYg9GcalYcDWB9ySDZ6VxlD5ppP8qBZIfKtcFFEnThokH+FKBg
 tCkanKoKvK12U6GC9yWSQUlUNVkcsrfkIkCrxE9sM7rtPJbokfu1iXbwkJj/wVeh0a7KpgwwFydlxW
 Aps76h9pOYeYrdt+IY5CbvfOiHTJLDSjNo8NuYCZgK2I1NSCmbakO3qflwWHkQsBdBLsPd8ztMXzVZ
 yCkkvq97G8U8jAVxUciDeAjQRNCcTk
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_160151_018688_3A445DD5 
X-CRM114-Status: GOOD (  11.17  )
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
index 0db494b24dd0..5b91803201ef 100644
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
