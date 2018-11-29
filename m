From: sashal@kernel.org (Sasha Levin)
Date: Thu, 29 Nov 2018 00:55:41 -0500
Subject: [PATCH AUTOSEL 4.19 50/68] riscv: fix warning in
 arch/riscv/include/asm/module.h
In-Reply-To: <20181129055559.159228-1-sashal@kernel.org>
References: <20181129055559.159228-1-sashal@kernel.org>
Message-ID: <20181129055559.159228-50-sashal@kernel.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

From: David Abdurachmanov <david.abdurachmanov@gmail.com>

[ Upstream commit 0138ebb90c633f76bc71617f8f23635ce41c84fd ]

Fixes warning: 'struct module' declared inside parameter list will not be
visible outside of this definition or declaration

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
Acked-by: Olof Johansson <olof@lixom.net>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/include/asm/module.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/module.h b/arch/riscv/include/asm/module.h
index 349df33808c4..cd2af4b013e3 100644
--- a/arch/riscv/include/asm/module.h
+++ b/arch/riscv/include/asm/module.h
@@ -8,6 +8,7 @@
 
 #define MODULE_ARCH_VERMAGIC    "riscv"
 
+struct module;
 u64 module_emit_got_entry(struct module *mod, u64 val);
 u64 module_emit_plt_entry(struct module *mod, u64 val);
 
-- 
2.17.1
