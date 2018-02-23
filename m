From: shea@shealevy.com (Shea Levy)
Date: Thu, 22 Feb 2018 22:12:09 -0500
Subject: [PATCH 0/9] RISC-V: Make modules loadable.
Message-ID: <20180223031218.10390-1-shea@shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This was enough to load enough modules to make virtio_scsi devices
appear on the qemu virt machine on a highly modular distro kernel.
