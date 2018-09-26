From: mhocko@kernel.org (Michal Hocko)
Date: Wed, 26 Sep 2018 11:37:39 +0200
Subject: [PATCH 16/30] memblock: replace __alloc_bootmem_node with
 appropriate memblock_ API
In-Reply-To: <1536927045-23536-17-git-send-email-rppt@linux.vnet.ibm.com>
References: <1536927045-23536-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1536927045-23536-17-git-send-email-rppt@linux.vnet.ibm.com>
Message-ID: <20180926093739.GQ6278@dhcp22.suse.cz>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri 14-09-18 15:10:31, Mike Rapoport wrote:
> Use memblock_alloc_try_nid whenever goal (i.e. minimal address is
> specified) and memblock_alloc_node otherwise.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>

Acked-by: Michal Hocko <mhocko@suse.com>
-- 
Michal Hocko
SUSE Labs
