Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E126CD1288
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 15:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WyWlxP0yYcgvQSGCUK2FAAwGfqJxpolToYXPQkInk+Q=; b=yaay7ZBr1nocaq
	KCpakmBjITGkOtJidsyZl5rnW7JXXJqT/DambRSCzE+wivuzGHZjkxc0CmpIbvOcSDh96YpjYZM17
	fd6Iuffc6cFs+shBSlORkyhZc92wM4M0lQdiLz8cBMZpFs54ZjBmUw8ReB7+uuGqKUNJdMRZtXyPL
	TbiGGO/xmOKcrtOX/xUHk9MqD3D7DnoW8Jv08xC/av+hV+F7EdInUEA48+xmy4wxY6RbGtIXJ3P5M
	oEq02oZtcy/KPXuE1iRRX4PivjZJYPR8nI1dJjUfdEwxf/1KADryBHBCyY2jnQqZqoHjXL4mURHlx
	bFupVlaMMK5WnAhN6N9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rps9z-0000000Ecsy-3vnJ;
	Thu, 28 Mar 2024 15:59:23 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rps9j-0000000EchS-3Zrx;
	Thu, 28 Mar 2024 15:59:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9D866CE2BEB;
	Thu, 28 Mar 2024 15:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3262FC433B2;
	Thu, 28 Mar 2024 15:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711641545;
	bh=qoqinQw63fGFh+6IC/Y5pgVTD9GppSO7nESSrP07adE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ZeXxNdYdDpyc+XN31Wm34tBo8zyeQVjgDnJmmZw7SqlPg/zj94JVdBp6iabFK0Gw2
	 ITV4o/QB4aAtXsNpLjBnbnj2kuDX6I1b1ezlRqufzDzV165JDLOtFPbnIC11FikLCJ
	 GAqPNRfOsmxNEYDT3tz45gmm0cFTLKOr4n3vjooe/XqU/VyHBpATYmAS+7paJezM2K
	 9FDJEoWq38AGZ1DKjmwp613+zoL2lGeqIxkb2zRXnwlWVQFL269SZ0hQpir3GsQaC7
	 Rk1FT4Lf1yvo+YLMWPF194Ct83ik0RLug0gOTvHd5ilV4AMRJk8qEOG7Hqpejk+g3c
	 sE+IDJ1Ruargg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F760CD1284;
	Thu, 28 Mar 2024 15:59:05 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Subject: [PATCH 0/7] sysctl: Remove sentinel elements from misc directories
Date: Thu, 28 Mar 2024 16:57:47 +0100
Message-Id: <20240328-jag-sysctl_remset_misc-v1-0-47c1463b3af2@samsung.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHuTBWYC/x3MSQqAMAxA0atI1hZqncCriEhoo0acaIoo4t0tL
 t/i/weEPJNAkzzg6WThfYvI0gTshNtIil00GG0KnRutZhyV3GLD0ntahUK/sliFpsqGEmvnCCH
 Gh6eBr3/cdu/7AeaEmhloAAAA
To: Andrew Morton <akpm@linux-foundation.org>, 
 Muchun Song <muchun.song@linux.dev>, Miaohe Lin <linmiaohe@huawei.com>, 
 Naoya Horiguchi <naoya.horiguchi@nec.com>, 
 John Johansen <john.johansen@canonical.com>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, David Howells <dhowells@redhat.com>, 
 Jarkko Sakkinen <jarkko@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, 
 Pavel Begunkov <asml.silence@gmail.com>, 
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Luis Chamberlain <mcgrof@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, 
 keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, 
 io-uring@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Joel Granados <j.granados@samsung.com>
X-Mailer: b4 0.13-dev-2d940
X-Developer-Signature: v=1; a=openpgp-sha256; l=7724;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=C5ExU42iQIATTNjm61dOO7nRB4VDW70Mylk1Ch/NE2k=;
 b=owJ4nAHtARL+kA0DAAoBupfNUreWQU8ByyZiAGYFk8MCISRyCsZWM39FGDZLGap6umXikDNpN
 y/UcPPR1cdsxokBswQAAQoAHRYhBK5HCVcl5jElzssnkLqXzVK3lkFPBQJmBZPDAAoJELqXzVK3
 lkFPlNgL/iKOshbA23YN0uTNsvODr8xCuFjrnb+cdNlPZz3c0ZsZEs5Jf4Nxrtz/mlIPM5CYrgb
 tLxFHPzllWFljQyXlDt32Y6gBMKvvahcSPUMYzTREmR8avBZLhtO6IfFElpBHSjMWrkXnb0C9Ri
 PMKWSRBukVgiBwuXHUKP5CqBTyi4HiIRxR7xfZ67tjbUqXdfbYI0+VRHr3eLLxniXJpqrhfzcnE
 0V2TanI13+QxTYeLlJPfyaUtoRpA8dD+K0fSpJjqWSSXyMg/iTgIT7LcZA5YHBiD2IkdPBpRoxO
 SiPAXXa8zmVB3zMHZSQ0Jg5pEtcpkiev1frtqj1lqKsY1UNsRbSIr8hP3CAFbTO8ueuhwNkKo6W
 E3W+KMVsmBqPCtOPOlDHiYOKMT+7xbeb+UJdmFN9o/cZ3j5KLnp/oEHmEao0VQCY6K4m9vK94UU
 kMsVPtIH5meae8MuCInGSeeP3ti3V5gT+4o+lm1hKsUJLVQHWrrUSwQjkDWS2DV8z8prsF+g6n5
 UE=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for j.granados@samsung.com/default with
 auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_085908_351417_8FEE65E1 
X-CRM114-Status: GOOD (  17.06  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: j.granados@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Joel Granados <j.granados@samsung.com>

What?
These commits remove the sentinel element (last empty element) from the
sysctl arrays of all the files under the "mm/", "security/", "ipc/",
"init/", "io_uring/", "drivers/perf/" and "crypto/" directories that
register a sysctl array. The inclusion of [4] to mainline allows the
removal of sentinel elements without behavioral change. This is safe
because the sysctl registration code (register_sysctl() and friends) use
the array size in addition to checking for a sentinel [1].

Why?
By removing the sysctl sentinel elements we avoid kernel bloat as
ctl_table arrays get moved out of kernel/sysctl.c into their own
respective subsystems. This move was started long ago to avoid merge
conflicts; the sentinel removal bit came after Mathew Wilcox suggested
it to avoid bloating the kernel by one element as arrays moved out. This
patchset will reduce the overall build time size of the kernel and run
time memory bloat by about ~64 bytes per declared ctl_table array (more
info here [5]).

When are we done?
There are 4 patchest (25 commits [2]) that are still outstanding to
completely remove the sentinels: files under "net/", files under
"kernel/" dir, misc dirs (this patchset) and the final set that removes
the unneeded check for ->procname == NULL.

Testing:
* Ran sysctl selftests (./tools/testing/selftests/sysctl/sysctl.sh)
* Ran this through 0-day with no errors or warnings

Savings in vmlinux:
  A total of 64 bytes per sentinel is saved after removal; I measured in
  x86_64 to give an idea of the aggregated savings. The actual savings
  will depend on individual kernel configuration.
    * bloat-o-meter
        - The "yesall" config saves 963 bytes (bloat-o-meter output [6])
        - A reduced config [3] saves 452 bytes (bloat-o-meter output [7])

Savings in allocated memory:
  None in this set but will occur when the superfluous allocations are
  removed from proc_sysctl.c. I include it here for context. The
  estimated savings during boot for config [3] are 6272 bytes. See [8]
  for how to measure it.

Comments/feedback greatly appreciated

Best

Joel

[1] https://lore.kernel.org/all/20230809105006.1198165-1-j.granados@samsung.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/joel.granados/linux.git/tag/?h=sysctl_remove_empty_elem_v5
[3] https://gist.github.com/Joelgranados/feaca7af5537156ca9b73aeaec093171
[4] https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/

[5]
Links Related to the ctl_table sentinel removal:
* Good summaries from Luis:
  https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/
  https://lore.kernel.org/all/ZMFizKFkVxUFtSqa@bombadil.infradead.org/
* Patches adjusting sysctl register calls:
  https://lore.kernel.org/all/20230302204612.782387-1-mcgrof@kernel.org/
  https://lore.kernel.org/all/20230302202826.776286-1-mcgrof@kernel.org/
* Discussions about expectations and approach
  https://lore.kernel.org/all/20230321130908.6972-1-frank.li@vivo.com
  https://lore.kernel.org/all/20220220060626.15885-1-tangmeng@uniontech.com

[6]
add/remove: 0/0 grow/shrink: 0/16 up/down: 0/-963 (-963)
Function                                     old     new   delta
setup_mq_sysctls                             502     499      -3
yama_sysctl_table                            128      64     -64
vm_page_writeback_sysctls                    512     448     -64
vm_oom_kill_table                            256     192     -64
vm_compaction                                320     256     -64
page_alloc_sysctl_table                      576     512     -64
mq_sysctls                                   384     320     -64
memory_failure_table                         192     128     -64
loadpin_sysctl_table                         128      64     -64
key_sysctls                                  448     384     -64
kernel_io_uring_disabled_table               192     128     -64
kern_do_mounts_initrd_table                  128      64     -64
ipc_sysctls                                  832     768     -64
hugetlb_vmemmap_sysctls                      128      64     -64
hugetlb_table                                320     256     -64
apparmor_sysctl_table                        256     192     -64
Total: Before=440605433, After=440604470, chg -0.00%

[7]
add/remove: 0/0 grow/shrink: 0/8 up/down: 0/-452 (-452)
Function                                     old     new   delta
setup_ipc_sysctls                            306     302      -4
vm_page_writeback_sysctls                    512     448     -64
vm_oom_kill_table                            256     192     -64
page_alloc_sysctl_table                      384     320     -64
key_sysctls                                  384     320     -64
kernel_io_uring_disabled_table               192     128     -64
ipc_sysctls                                  640     576     -64
hugetlb_table                                256     192     -64
Total: Before=8523801, After=8523349, chg -0.01%

[8]
To measure the in memory savings apply this on top of this patchset.

"
diff --git i/fs/proc/proc_sysctl.c w/fs/proc/proc_sysctl.c
index 37cde0efee57..896c498600e8 100644
--- i/fs/proc/proc_sysctl.c
+++ w/fs/proc/proc_sysctl.c
@@ -966,6 +966,7 @@ static struct ctl_dir *new_dir(struct ctl_table_set *set,
        table[0].procname = new_name;
        table[0].mode = S_IFDIR|S_IRUGO|S_IXUGO;
        init_header(&new->header, set->dir.header.root, set, node, table, 1);
+       printk("%ld sysctl saved mem kzalloc\n", sizeof(struct ctl_table));

        return new;
 }
@@ -1189,6 +1190,7 @@ static struct ctl_table_header *new_links(struct ctl_dir *dir, s>
                link_name += len;
                link++;
        }
+       printk("%ld sysctl saved mem kzalloc\n", sizeof(struct ctl_table));
        init_header(links, dir->header.root, dir->header.set, node, link_table,
                    head->ctl_table_size);
        links->nreg = nr_entries;
"
and then run the following bash script in the kernel:

accum=0
for n in $(dmesg | grep kzalloc | awk '{print $3}') ; do
    accum=$(calc "$accum + $n")
done
echo $accum

Signed-off-by: Joel Granados <j.granados@samsung.com>

--

---
Joel Granados (7):
      memory: Remove the now superfluous sentinel element from ctl_table array
      security: Remove the now superfluous sentinel element from ctl_table array
      crypto: Remove the now superfluous sentinel element from ctl_table array
      initrd: Remove the now superfluous sentinel element from ctl_table array
      ipc: Remove the now superfluous sentinel element from ctl_table array
      io_uring: Remove the now superfluous sentinel elements from ctl_table array
      drivers: perf: Remove the now superfluous sentinel elements from ctl_table array

 crypto/fips.c                | 1 -
 drivers/perf/riscv_pmu_sbi.c | 1 -
 init/do_mounts_initrd.c      | 1 -
 io_uring/io_uring.c          | 1 -
 ipc/ipc_sysctl.c             | 1 -
 ipc/mq_sysctl.c              | 1 -
 mm/compaction.c              | 1 -
 mm/hugetlb.c                 | 1 -
 mm/hugetlb_vmemmap.c         | 1 -
 mm/memory-failure.c          | 1 -
 mm/oom_kill.c                | 1 -
 mm/page-writeback.c          | 1 -
 mm/page_alloc.c              | 1 -
 security/apparmor/lsm.c      | 1 -
 security/keys/sysctl.c       | 1 -
 security/loadpin/loadpin.c   | 1 -
 security/yama/yama_lsm.c     | 1 -
 17 files changed, 17 deletions(-)
---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240320-jag-sysctl_remset_misc-a261f5a7ddea

Best regards,
-- 
Joel Granados <j.granados@samsung.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
