From: olof@lixom.net (Olof Johansson)
Date: Sun, 25 Nov 2018 14:51:21 -0800
Subject: [PATCH] riscv: perf: fix build warning
Message-ID: <20181125225121.4454-1-olof@lixom.net>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Due to the -ENOENT return, the variables can't actually be used
uninitialized, but the compiler isn't smart enough in this case.

Let's just set them before returning with the error for now, it'll be
filled in once implemented.

arch/riscv/kernel/perf_event.c:166:5: warning: 'type' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/riscv/kernel/perf_event.c:166:38: warning: 'op' may be used uninitialized in this function [-Wmaybe-uninitialized]
arch/riscv/kernel/perf_event.c:167:39: warning: 'result' may be used uninitialized in this function [-Wmaybe-uninitialized]

Signed-off-by: Olof Johansson <olof@lixom.net>
---

I swear I posted this exact fix just last week, but can't find a reference
to it anywhere.

 arch/riscv/kernel/perf_event.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/perf_event.c b/arch/riscv/kernel/perf_event.c
index a243fae1c1dbb..81f3ba76f1dbc 100644
--- a/arch/riscv/kernel/perf_event.c
+++ b/arch/riscv/kernel/perf_event.c
@@ -150,6 +150,9 @@ static int riscv_map_hw_event(u64 config)
 int riscv_map_cache_decode(u64 config, unsigned int *type,
 			   unsigned int *op, unsigned int *result)
 {
+	*type = 0;
+	*op = 0;
+	*result = 0;
 	return -ENOENT;
 }
 
-- 
2.11.0
