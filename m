Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1271D3CCA0
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 03:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uz5KhUlmDQriOrmFFrsuL5uq1XXDDo/xa4Od+4t58Ow=; b=wFe97W0XJIlt/G
	GwNuSREaH2yEeOp26p163hMHwUH3GiRcQJTcabmm6xS1U+1o+1T15pzOdylg8MkWiTs1LcTnS7QCQ
	csno5pbLguDy92jIH/W7/9YEo/9H8PRfVfZH3AV/UU+Tg0HZ972Uog/dNf08RBiAtcIk8Yxibboon
	xLVNY0CaJWz4hzCnFZm0Ujtnpbtsi3exDwM+LX6VZnJP6IAvc4Dqyo5aRieWiqcfnSJhhZdH8ylTu
	Xky8xOZbybJf+rbKsHjzn6XdV/UjYQLdEpPRhkJhjmhxzx6qwaiRUPV4jRHx/+fWb5FPop3bTmRzx
	3kNYbwMIqg92pVKP5y3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDmF-0000000Bdwl-3jpI;
	Thu, 15 Jan 2026 03:12:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDmD-0000000BdwR-43do
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 03:12:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E882F6013D;
	Thu, 15 Jan 2026 03:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C37C4CEF7;
	Thu, 15 Jan 2026 03:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768446720;
	bh=Gk/osH7DfvUyCVOdPI7ZwI4Yhgby74VLmpmAMH87lg4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eMpEibgLnCCoCpngPx1LjqAwoqkiMOK1O4Pv6xFoiICf5Rumtl6OjcBtchzbPzV4f
	 fOrU3PDXtnHoFLULkmJ/EZqFFePw0CC8HldneMcrfYufeIQNp0HY07Vp5aHrp9IHkd
	 nq3R60jTiiN+shKdZGDZMryPH7AwCtKRTq/4XKMRhdBkC2k5bVNToMndvjt7czfLar
	 x/fNxwwiNZk1fqNCF6QXd4rCKWEMN/I5M7C9Cj3EXWXZgtlkLHJyt49efPTSWgzc7A
	 eZ765DSqUt+KUoiHEilrTQ4oXDTqCKP0wfcjXMwg2eLnQOGC//VRCZKowDLG0/42aI
	 VeqGUU4KYI+uA==
Date: Wed, 14 Jan 2026 20:11:56 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
    Vlastimil Babka <vbabka@suse.cz>, 
    Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
    Christian Brauner <brauner@kernel.org>, 
    Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
    Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
    Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
    Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
    linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
    linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
    devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
    linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
    alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
    andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
    atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
    alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
    rick.p.edgecombe@intel.com
Subject: Re: [PATCH v9 02/26] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
In-Reply-To: <20250204-v5_user_cfi_series-v9-2-b37a49c5205c@rivosinc.com>
Message-ID: <9b663e94-696c-4678-829a-6471e7022895@kernel.org>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com> <20250204-v5_user_cfi_series-v9-2-b37a49c5205c@rivosinc.com>
MIME-Version: 1.0
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

On Tue, 4 Feb 2025, Deepak Gupta wrote:

> Make an entry for cfi extensions in extensions.yaml.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Here's what I'm planning to queue; please let me know if you want to 
change anything.


- Paul


From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 19 Nov 2025 09:55:05 -0700

dt-bindings: riscv: document zicfilp and zicfiss in extensions.yaml

Make an entry for cfi extensions in extensions.yaml.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de> # QEMU, custom CVA6
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Link: https://patch.msgid.link/20251112-v5_user_cfi_series-v23-2-b55691eacf4f@rivosinc.com
[pjw@kernel.org: updated subject]
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 .../devicetree/bindings/riscv/extensions.yaml      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 5bab356addc8..1aeff17c7f24 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -469,6 +469,20 @@ properties:
             The standard Zicboz extension for cache-block zeroing as ratified
             in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
+        - const: zicfilp
+          description: |
+            The standard Zicfilp extension for enforcing forward edge
+            control-flow integrity as ratified in commit 3f8e450 ("merge
+            pull request #227 from ved-rivos/0709") of riscv-cfi
+            github repo.
+
+        - const: zicfiss
+          description: |
+            The standard Zicfiss extension for enforcing backward edge
+            control-flow integrity as ratified in commit 3f8e450 ("merge
+            pull request #227 from ved-rivos/0709") of riscv-cfi
+            github repo.
+
         - const: zicntr
           description:
             The standard Zicntr extension for base counters and timers, as
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
