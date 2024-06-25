Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA89C2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 15:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hK9y7YnuQ0K2A7gfZ46J3WAPpChWHojvPBGoYcIkztc=; b=4dZEnO8pm+cpN9
	mAbRjS7eUvFFikyMuD1MgXk65oOBVzLZ+hwRiUytYAB2T5AamCEr7m3RitleqL25q4pF6fwz71bF8
	2h+tWumIhj0YCBzWjoOHzeDBuIid/Q9kBLrQmvtKw4G2TaKFfNnIpbpp1T6LplUYfjO4ZHWu6Fudv
	9DrJKLZ9FOJdU1KillL6E9AUTAzhBqo24rKf7MyFnP4z6wztrHTtLbVVumiu0pzWWndnqopwXapbZ
	gz1asRCdtbBzcI+8GvZMPlTRWLe0e+i3mX9hXRzuPCt4TqzvnyM8yYfHMN348Pl0BofOE5IuSSfQQ
	I7jHVp7QQXWDBiSoYP9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7fk-00000003Jda-03wG;
	Tue, 25 Jun 2024 15:01:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7fU-00000003JR0-2EiH;
	Tue, 25 Jun 2024 15:01:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=pqqAahuGOgVzBd2V2rC3cp6LsHNItpORh1WCuQkluUA=; b=LkbBBauOlTAI6k4zz0eLEr/+yW
	uTIZf7XIP4DZ7j+khBzUWbIUS5T5Nd5vwwdhcFUALB+4F8m0Gzuu8k9JwwnHrgOEr05iN6MDjaf7e
	mJf8t9CX67e8vJFGlMmAj4o6oUyy71vEBw38upyPDSfwZ27sgWlJwMB17G/MZcL+WJhzEzS1M2cKx
	HYYJB2CMaxb1CtkYdwp7ISjCT79J6o9NNtK1YkD8rxrBDFEFPkejf3ggroP/ihs5ac7ea1/35Qd3O
	1VTfVGPqIk5QjW3AdGv+bcvPv38UGlhBwO6xH8RKmhb0tgflYNvKj6NEJbG2ZwVarr3u0YsYfJxTE
	QNJs+dXw==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7fD-00000008QfD-2iGC;
	Tue, 25 Jun 2024 15:01:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 784F2CE1B78;
	Tue, 25 Jun 2024 15:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4B5C4AF0D;
	Tue, 25 Jun 2024 15:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719327647;
	bh=bsiMqAlOgEwP0cbRhsqWxUT30GAWtj7CcR/m2yEY+EM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l/DeTr8DtWFxGVC0HSS5cpujEUcCgKLCZdzEw1O9VJ2Y4+V401JvdWm7738DDT2/C
	 G31QUqtzxIQZYudpEY0/P5f2zr7w1zPdsTPrEbkp5lmRa2tsGlqVdN0CyC1dp6NjtL
	 ELltzeKbigD9l+7ZGj84vGJd+3Uqd4d6bk4ACP8dyOyavMy/Oaewyx3t1Q8fZb319K
	 Gqdq1v0FTLFQvDNb784RnjnjMGe10RcOmczkA5hsJNRyqwCfmZ5A8PWj+63UUI0/J3
	 pp6kLurbonsGGkBgjQnu3gHPCidOe++OBQ9irsvejwzmw+SvRVZeM17QnuBInZ4aah
	 hUj2m/22++x8A==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 25 Jun 2024 15:57:29 +0100
Subject: [PATCH v9 01/39] arm64/mm: Restructure arch_validate_flags() for
 extensibility
MIME-Version: 1.0
Message-Id: <20240625-arm64-gcs-v9-1-0f634469b8f0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bsiMqAlOgEwP0cbRhsqWxUT30GAWtj7CcR/m2yEY+EM=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhrSq28XSrHeTDQNbdl0X0BCQ+rpHkPMtP8d2NzG3RUzHQzoy
 7sR2MhqzMDByMciKKbKsfZaxKj1cYuv8R/NfwQxiZQKZwsDFKQATEatn/8OVLK9tLPw9cH7NJM1ajY
 fK+jNFwy/NbM93yxcLMmBMVcja8Gbirm3POx4XMj4I41xe9pop+rUF8682uRZLjk28NszHFd5cqpx/
 j7vQWzJz4bzta5OXTe5SFBWZ6TShQze17E7yRqfk9212NYGh0S5X6kr14lXCunZP+bDy8NSVBTVtU6
 R010Uof3l5SzrbkbWe4dDihxdOVb51+VHL9T+ta9Pp3L6Z/ruMU2OEuOc1326Pn22nkf60uO7OcQHB
 Zhn+so3s6m6xu2o+L3s9PzDuSfYpi8QNnz5Z/NoXuZFVxLh2vnzbqiU1UWFNdxR3SYf/X3FdRmH6bb
 OewP3bQgO2rb38+iVD9o3lDDorAQ==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_160107_881558_337B5F2E 
X-CRM114-Status: GOOD (  11.78  )
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

Currently arch_validate_flags() is written in a very non-extensible
fashion, returning immediately if MTE is not supported and writing the MTE
check as a direct return. Since we will want to add more checks for GCS
refactor the existing code to be more extensible, no functional change
intended.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/mman.h | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/mman.h b/arch/arm64/include/asm/mman.h
index 5966ee4a6154..c21849ffdd88 100644
--- a/arch/arm64/include/asm/mman.h
+++ b/arch/arm64/include/asm/mman.h
@@ -52,11 +52,17 @@ static inline bool arch_validate_prot(unsigned long prot,
 
 static inline bool arch_validate_flags(unsigned long vm_flags)
 {
-	if (!system_supports_mte())
-		return true;
+	if (system_supports_mte()) {
+		/*
+		 * only allow VM_MTE if VM_MTE_ALLOWED has been set
+		 * previously
+		 */
+		if ((vm_flags & VM_MTE) && !(vm_flags & VM_MTE_ALLOWED))
+			return false;
+	}
+
+	return true;
 
-	/* only allow VM_MTE if VM_MTE_ALLOWED has been set previously */
-	return !(vm_flags & VM_MTE) || (vm_flags & VM_MTE_ALLOWED);
 }
 #define arch_validate_flags(vm_flags) arch_validate_flags(vm_flags)
 

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
