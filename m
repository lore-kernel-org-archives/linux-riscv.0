Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9994C3064D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 15:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l8AHkOAWdUIrrKOWBw5Ig0QCKR8E/7o+e/TjIx33qUI=; b=kcP7OVnZGWROdI
	S26/hYZhYIZuJF6GvajZzrvjQNVHX+vjtfNOxJuiZv/q6KOzxKAk3I2lwQggbMRrF5ZAPfu67tXsH
	1kcSrpBkQkw1XXV5IqUdGLOTY+k3aZ/6qp7jOx61Jdl1iUFJN9jhqjm+FAlf6GGFDcLgmpKhTdfUV
	gQAKV2lg6l6grLue4y1A2W78iJUZrTzbKjdQg2l3V1zq0UutwrEvOJinrObnqjomqSX/v/BrWkFrh
	YfPU0VfEBUjWhiuF1+2JFTdSEbQ4WZ58OiF1w5LoGjy+9rQFLw8zCkKeqiTfsf8z6H2e9tJO8cU2e
	gFIhKVvPXPatt6znADLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7nv-00000003Q3M-2xCn;
	Tue, 25 Jun 2024 15:09:55 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7iO-00000003Lr3-0eub;
	Tue, 25 Jun 2024 15:04:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 25913CE1B7D;
	Tue, 25 Jun 2024 15:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1362BC32781;
	Tue, 25 Jun 2024 15:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719327849;
	bh=b9Gx7QUiEPIAdR9RNFo057BasR3/TeEIE9B40jmDJ/c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tavxR+nKLIiH02ssJeoEROBXmOsCstTILDhWkKXxGu60OsgiMLuDIKVo0pL6GtCmE
	 igPSP6RIQSQWfikzRMGnE1Kg/67CHxNork4mRYKI3D96sfMbYWvsSFQl3IOmRa/Sf4
	 mRBbETLNbBhApzSodjPWF64W2dhM+zeIMkgpyuJ/OGB/QVYcC8rdr+Gm2ZH2a9dTQO
	 +ie8cUyHrEBDEw9rUgJ52SuTROV/Atv37rarClR6qcQhAf0oPjoMDxiJZAhnY63WRF
	 10koRgwnGojMJHrP7lJKHTgsKkLjfX59wpBQd7C+FiFvMud/7otZgv4IbZEzQvVpJG
	 zIHRIuySEFbYA==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 25 Jun 2024 15:57:57 +0100
Subject: [PATCH v9 29/39] selftests/clone3: Enable arm64 shadow stack
 testing
MIME-Version: 1.0
Message-Id: <20240625-arm64-gcs-v9-29-0f634469b8f0@kernel.org>
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
In-Reply-To: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
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
 Ross Burton <ross.burton@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.14-dev-d4707
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471; i=broonie@kernel.org;
 h=from:subject:message-id; bh=b9Gx7QUiEPIAdR9RNFo057BasR3/TeEIE9B40jmDJ/c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmetuJPYum8zU2drU0QkG0Oevd9R7hfLQlztVXJmOP
 AMNcKOSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZnrbiQAKCRAk1otyXVSH0BxTB/
 9RAJG8vNMCnKeW0ZaJ2eAuj74/NV9s5bUsk5CVhSS9OmMa/aJ+gGWY94HaF0LO0M1jlnry4Je6LXUz
 N04y86o4L+9c3XkvE+GTl1jJ/1Gkna5RVE2LXbIbT8mRZiwGQSJdDveYSoa2Bj37DHov5V1RP25uMZ
 wGWAuPensfQp/ZFhSyZUpW4mSTgmdApUyOm6005OB6HsSqlcTKdRwjD6o7DEhh+iNAcTBm4+UR8ROm
 936rXsxL2yXXYX24fQXH0f8hiOJNgnDfmeHYMdbPZxh/xgFapx45UVH2J4t9am/rGr4blvsGhgPbUV
 BEAqQPu/bmkwHrSC+EwrYkGwBWaNjY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_080412_820656_74863039 
X-CRM114-Status: GOOD (  10.42  )
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

In order to test shadow stack support in clone3() the clone3() selftests
need to have a fully inline clone3() call, provide one for arm64.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/clone3/clone3_selftests.h | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tools/testing/selftests/clone3/clone3_selftests.h b/tools/testing/selftests/clone3/clone3_selftests.h
index 38d82934668a..e32915085333 100644
--- a/tools/testing/selftests/clone3/clone3_selftests.h
+++ b/tools/testing/selftests/clone3/clone3_selftests.h
@@ -69,6 +69,32 @@ static pid_t __always_inline sys_clone3(struct __clone_args *args, size_t size)
 
 	return ret;
 }
+#elif defined(__aarch64__)
+static pid_t __always_inline sys_clone3(struct __clone_args *args, size_t size)
+{
+	register long _num  __asm__ ("x8") = __NR_clone3;
+	register long _args __asm__ ("x0") = (long)(args);
+	register long _size __asm__ ("x1") = (long)(size);
+	register long arg2 __asm__ ("x2") = 0;
+	register long arg3 __asm__ ("x3") = 0;
+	register long arg4 __asm__ ("x4") = 0;
+
+	__asm__ volatile (
+		"svc #0\n"
+		: "=r"(_args)
+		: "r"(_args), "r"(_size),
+		  "r"(_num), "r"(arg2),
+		  "r"(arg3), "r"(arg4)
+		: "memory", "cc"
+	);
+
+	if ((int)_args < 0) {
+		errno = -((int)_args);
+		return -1;
+	}
+
+	return _args;
+}
 #else
 static pid_t sys_clone3(struct __clone_args *args, size_t size)
 {

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
