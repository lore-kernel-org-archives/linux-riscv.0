From: shea@shealevy.com (Shea Levy)
Date: Wed, 28 Mar 2018 16:36:43 -0400
Subject: [PATCH v4 0/16] Generic initrd_free_mem
In-Reply-To: <20180328152714.6103-1-shea@shealevy.com>
References: <20180328152714.6103-1-shea@shealevy.com>
Message-ID: <20180328203659.18692-1-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This patch series extracts out code for unloading the initramfs that
was identical across 14 architectures, and moves those architectures
to the common code path. Additionally, RISC-V is newly moved to the
common code path.

In addition to reducing duplication, this allows us to bring future
improvements (such as generalizing existing "keep initrd" command line
options) to multiple architectures at once.

v4: Use weak symbols instead of Kconfig.
v3: Make the generic path opt-out instead of opt-in.
v2: Mark generic free_initrd_mem __init.
