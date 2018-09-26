From: mhocko@kernel.org (Michal Hocko)
Date: Wed, 26 Sep 2018 11:25:29 +0200
Subject: [PATCH 05/30] mm: nobootmem: remove dead code
In-Reply-To: <1536927045-23536-6-git-send-email-rppt@linux.vnet.ibm.com>
References: <1536927045-23536-1-git-send-email-rppt@linux.vnet.ibm.com>
 <1536927045-23536-6-git-send-email-rppt@linux.vnet.ibm.com>
Message-ID: <20180926092529.GM6278@dhcp22.suse.cz>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri 14-09-18 15:10:20, Mike Rapoport wrote:
> Several bootmem functions and macros are not used. Remove them.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>

Acked-by: Michal Hocko <mhocko@suse.com>
-- 
Michal Hocko
SUSE Labs
