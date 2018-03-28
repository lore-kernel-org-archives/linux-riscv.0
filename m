From: joe@perches.com (Joe Perches)
Date: Wed, 28 Mar 2018 13:44:13 -0700
Subject: [PATCH v4 14/16] powerpc: Use generic free_initrd_mem.
In-Reply-To: <20180328203659.18692-15-shea@shealevy.com>
References: <20180328152714.6103-1-shea@shealevy.com>
 <20180328203659.18692-1-shea@shealevy.com>
 <20180328203659.18692-15-shea@shealevy.com>
Message-ID: <1522269853.12357.135.camel@perches.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 2018-03-28 at 16:36 -0400, Shea Levy wrote:
> Signed-off-by: Shea Levy <shea@shealevy.com>

Most people seem to want some form of commit message
and not just your sign-off.

And btw:

It seems you used get_maintainer to determine who to
send these patches to.

I suggest you add --nogit and --nogit-fallback to the
get_maintainer command line you use to avoid sending
these patches to people like me that have done drive-by
cleanup work on these files.
