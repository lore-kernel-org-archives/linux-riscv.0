From: hch@lst.de (Christoph Hellwig)
Date: Thu, 2 Aug 2018 11:55:27 +0200
Subject: [PATCH 6/6] dt-bindings: interrupt-controller: RISC-V PLIC
 documentation
In-Reply-To: <CAL_JsqJWOXX7-_sb4W63wPRqFjHuU-DM-LNYgczieWjAE5ABfQ@mail.gmail.com>
References: <20180725093649.32332-1-hch@lst.de>
 <20180725093649.32332-7-hch@lst.de> <20180731224630.GB12168@rob-hp-laptop>
 <20180801071635.GC20224@lst.de>
 <CAL_JsqJWOXX7-_sb4W63wPRqFjHuU-DM-LNYgczieWjAE5ABfQ@mail.gmail.com>
Message-ID: <20180802095527.GD14203@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Aug 01, 2018 at 12:26:31PM -0600, Rob Herring wrote:
> Not really my problem that they didn't follow the process and upstream
> their binding first. But this alone is just a string identifier, so I
> don't really care that much. If things are really a mess, then the
> next implementations will have to have better compatible strings. More
> likely, I'll just see folks trying to add various properties to deal
> with all the differences.
> 
> You could always define a better compatible and leave 'riscv,plic0' as
> a fallback to avoid breaking things.

Is there any better way to define a compatible other than having
duplicate IRQCHIP_DECLARE() statements?
