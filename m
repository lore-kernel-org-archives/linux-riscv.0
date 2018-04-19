From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 19 Apr 2018 15:04:43 -0700
Subject: [PATCH] RISC-V: Add CONFIG_HVC_RISCV_SBI=y to defconfig
Message-ID: <20180419220443.25970-1-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The SBI exists on all RISC-V systems, so there's no reason not to
compile this driver in.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index bca0eee733b0..07326466871b 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -44,6 +44,7 @@ CONFIG_INPUT_MOUSEDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_HVC_RISCV_SBI=y
 # CONFIG_PTP_1588_CLOCK is not set
 CONFIG_DRM=y
 CONFIG_DRM_RADEON=y
-- 
2.16.1
