From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Mon, 12 Nov 2018 08:01:05 +0100
Subject: /proc/cpuinfo shows mmu:sv48, but kernel only support sv39
Message-ID: <CAEn-LTpkgi8y2XMvTLx-qXbC=xsW4pDZi-hG4ZDykE6uK9R1ig@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Hi,

I noticed that my Fedora 29 with 4.20-rc1 & latest BBL
show mmu being sv48 in /proc/cpuinfo. The kernel only
implement sv39 for 64-bit systems. QEMU 3.0.0 also
supports only sv39. 3.1.0-rc0 version bumps that to sv48.
I would expect /proc/cpuinfo to show sv39 as that's what
we are running.

[..]
 43 /* SATP flags */
 44 #if __riscv_xlen == 32
 45 #define SATP_PPN     _AC(0x003FFFFF, UL)
 46 #define SATP_MODE_32 _AC(0x80000000, UL)
 47 #define SATP_MODE    SATP_MODE_32
 48 #else
 49 #define SATP_PPN     _AC(0x00000FFFFFFFFFFF, UL)
 50 #define SATP_MODE_39 _AC(0x8000000000000000, UL)
 51 #define SATP_MODE    SATP_MODE_39
 52 #endif
[..]
