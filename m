From: zong@andestech.com (Zong Li)
Date: Tue, 13 Mar 2018 16:35:15 +0800
Subject: [PATCH 10/11] RISC-V: Enable module support in defconfig
In-Reply-To: <cover.1520928420.git.zong@andestech.com>
References: <cover.1520928420.git.zong@andestech.com>
Message-ID: <c462c00dd7f259bff0c9540bf57aa067e2d39974.1520928420.git.zong@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 92ff23586c11..07326466871b 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -74,3 +74,5 @@ CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
 # CONFIG_RCU_TRACE is not set
 CONFIG_CRYPTO_USER_API_HASH=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
-- 
2.16.1
