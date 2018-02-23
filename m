From: shea@shealevy.com (Shea Levy)
Date: Thu, 22 Feb 2018 22:12:18 -0500
Subject: [PATCH 9/9] RISC-V: Build a module-enabled kernel by default.
In-Reply-To: <20180223031218.10390-1-shea@shealevy.com>
References: <20180223031218.10390-1-shea@shealevy.com>
Message-ID: <20180223031218.10390-10-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Signed-off-by: Shea Levy <shea@shealevy.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 47dacf06c679..56ad83919b42 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -73,3 +73,4 @@ CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
 # CONFIG_RCU_TRACE is not set
 CONFIG_CRYPTO_USER_API_HASH=y
+CONFIG_MODULES=y
-- 
2.16.1
