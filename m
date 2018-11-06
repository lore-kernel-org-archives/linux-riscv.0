From: schwab@suse.de (Andreas Schwab)
Date: Tue, 06 Nov 2018 09:03:19 +0100
Subject: [sw-dev] About the Use of sfence.vma in Kernel
In-Reply-To: <mhng-098e5d8e-3af1-4c5a-9c0d-2f2baba961da@palmer-si-x1c4>
 (Palmer Dabbelt's message of "Mon, 05 Nov 2018 18:33:23 -0800 (PST)")
References: <mhng-098e5d8e-3af1-4c5a-9c0d-2f2baba961da@palmer-si-x1c4>
Message-ID: <mvmk1lqk4zc.fsf@suse.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Perhaps that't the reason I sometimes get errors like this:

[303420.500000] swap_info_get: Bad swap file entry 2000000000df09b1
[303420.500000] BUG: Bad page map in process struct-ret-3.ex  pte:6f84d8c0 pmd:8f579001
[303420.510000] addr:000000008a1610cd vm_flags:00100173 anon_vma:0000000036036fc9 mapping:          (null) index:3ffffe7
[303420.520000] file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
[303420.530000] CPU: 1 PID: 2054 Comm: struct-ret-3.ex Not tainted 4.19.0-00040-g2d5ee99e76 #42
[303420.530000] Call Trace:
[303420.530000] [<ffffffe000c847d4>] walk_stackframe+0x0/0xa4
[303420.530000] [<ffffffe000c849d4>] show_stack+0x2a/0x34
[303420.530000] [<ffffffe0011a6800>] dump_stack+0x62/0x7c
[303420.530000] [<ffffffe000d55942>] print_bad_pte+0x146/0x18e
[303420.530000] [<ffffffe000d56df6>] unmap_page_range+0x33a/0x5ea
[303420.530000] [<ffffffe000d570d4>] unmap_single_vma+0x2e/0x40
[303420.530000] [<ffffffe000d57278>] unmap_vmas+0x42/0x7a
[303420.530000] [<ffffffe000d5cb92>] exit_mmap+0x7e/0x106
[303420.530000] [<ffffffe000c872aa>] mmput.part.2+0x26/0xa0
[303420.530000] [<ffffffe000c87344>] mmput+0x20/0x28
[303420.530000] [<ffffffe000c8ba24>] do_exit+0x238/0x7c0
[303420.530000] [<ffffffe000c8c006>] do_group_exit+0x2a/0x82
[303420.530000] [<ffffffe000c8c076>] __wake_up_parent+0x0/0x22
[303420.530000] [<ffffffe000c83722>] ret_from_syscall+0x0/0xe

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
