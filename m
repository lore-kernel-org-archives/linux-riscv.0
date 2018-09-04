From: hch@infradead.org (Christoph Hellwig)
Date: Tue, 4 Sep 2018 14:36:23 -0700
Subject: [PATCH v2 3/3] RISC-V: Support cpu hotplug.
In-Reply-To: <0d439b9d-b3d0-7d2c-117b-abb37adf769c@wdc.com>
References: <1535445370-19004-1-git-send-email-atish.patra@wdc.com>
 <1535445370-19004-4-git-send-email-atish.patra@wdc.com>
 <20180831061859.GC19292@infradead.org>
 <0d439b9d-b3d0-7d2c-117b-abb37adf769c@wdc.com>
Message-ID: <20180904213623.GA2078@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Sep 04, 2018 at 11:08:35AM -0700, Atish Patra wrote:
> 
> I have kept it here to match all other arch. Same goes for all hotplug
> functions in smpboot.c
> 
> I can move them to a separate file if you think that provides better code
> readability and structure.

I don't really have a strong opinion, but keeping this code together
and reducing the ifdef maze seems worthwile to me.
