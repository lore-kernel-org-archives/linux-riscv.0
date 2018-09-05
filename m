From: schwab@suse.de (Andreas Schwab)
Date: Wed, 05 Sep 2018 14:58:25 +0200
Subject: Unable to handle kernel paging request at virtual address
 0000001bf8068693
Message-ID: <mvmk1o0f6dq.fsf@suse.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Trying to boot git://github.com/riscv/riscv-linux#riscv-linux-4.18 on
the HiFive-U I'm getting this crash:

[    0.100000] Unable to handle kernel paging request at virtual address 0000001bf8068693
[    0.100000] Oops [#1]
[    0.100000] Modules linked in:
[    0.100000] CPU: 1 PID: 5 Comm: kworker/1:0 Not tainted 4.18.0-01735-g9f6192e555 #107
[    0.100000] Workqueue: rcu_gp wait_rcu_exp_gp
[    0.100000] sepc: ffffffe00116da98 ra : ffffffe000c9399a sp : ffffffe1f6addcb0
[    0.100000]  gp : ffffffe001404160 tp : ffffffe1f6ada140 t0 : ffffffe1f6c44000
[    0.100000]  t1 : 0000000000000000 t2 : 000000000000f8e1 s0 : ffffffe1f6addcc0
[    0.100000]  s1 : ffffffe000c7ff00 a0 : 0076161bf8068693 a1 : 000000007fffffff
[    0.100000]  a2 : ffffffe0013ac5c8 a3 : 0000000000000001 a4 : 0000000000000001
[    0.100000]  a5 : 000000007fffffff a6 : ffff8f98a08a9c8d a7 : ffffffe1f7d4c4f0
[    0.100000]  s2 : ffffffe0013ac5c8 s3 : ffffffe000c740d8 s4 : 0000000000000000
[    0.100000]  s5 : 00000000ffffffff s6 : 0000000000000000 s7 : ffffffe000c740d8
[    0.100000]  s8 : 0000000000000118 s9 : 0076161bf8068693 s10: ffffffe1f6a09000
[    0.100000]  s11: ffffffe000cc919e t3 : ffffffe001399aa0 t4 : ffffffe001399aa8
[    0.100000]  t5 : 00000000000c8000 t6 : ffffffe1f6c40a4b
[    0.100000] sstatus: 0000000200000100 sbadaddr: 0000001bf8068693 scause: 000000000000000d
[    0.110000] ---[ end trace 0ddcca0cde88bd4b ]---

The crash is inside _raw_spin_lock:

ffffffe00116da90 <_raw_spin_lock>:
ffffffe00116da90:       1141                    addi    sp,sp,-16
ffffffe00116da92:       e422                    sd      s0,8(sp)
ffffffe00116da94:       0800                    addi    s0,sp,16
ffffffe00116da96:       4705                    li      a4,1
ffffffe00116da98:       411c                    lw      a5,0(a0)
ffffffe00116da9a:       2781                    sext.w  a5,a5
ffffffe00116da9c:       fff5                    bnez    a5,ffffffe00116da98 <_r>
ffffffe00116da9e:       08e527af                amoswap.w       a5,a4,(a0)
ffffffe00116daa2:       0230000f                fence   r,rw
ffffffe00116daa6:       2781                    sext.w  a5,a5
ffffffe00116daa8:       fbe5                    bnez    a5,ffffffe00116da98 <_r>
ffffffe00116daaa:       6422                    ld      s0,8(sp)
ffffffe00116daac:       0141                    addi    sp,sp,16
ffffffe00116daae:       8082                    ret

The .config and the full log is attached.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: .config
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180905/edb889c1/attachment.ksh>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180905/edb889c1/attachment-0001.ksh>
