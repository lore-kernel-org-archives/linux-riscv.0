From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 10 Sep 2018 06:41:47 -0700
Subject: Post-4.19 WIP Branch Cleanup, riscv-linux-4.18, and 4.20 plans
In-Reply-To: <mhng-d37c6b2f-e76a-40ae-95fd-7988b49407fd@palmer-si-x1c4>
References: <ed6952fc-000f-af33-5d2f-ca26ba59741c@wdc.com>
 <mhng-d37c6b2f-e76a-40ae-95fd-7988b49407fd@palmer-si-x1c4>
Message-ID: <20180910134147.GA25264@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Sep 06, 2018 at 02:45:00AM -0700, Palmer Dabbelt wrote:
> > I think gpio & pwm are required as well. I couldn't get networking up
> > without the GPIO driver.
> 
> That makes sense: IIRC the GPIO twiddles the pins that control the Ethernet phy.
> 
> > https://github.com/riscv/riscv-linux/commit/7b012f300afcff77c20a4d84519f4bd2b9b17bd0
> > 
> > https://github.com/riscv/riscv-linux/commit/d6e84658098c6f37875a9e4b151706c6b541dc0b
> 
> Thanks.  I've grabbed both of these into WIP branches for now, they're at
> least the self contained type so it should be viable to start cleaning them
> up, pending time.

Btw, do we have volunteers for given drivers?  I think Paul is trying
to handle the serial driver.  I'll try to spend some time on one or two,
and have a SiFive board now.  but I won't really have time to try it
until the end of the month as I'm busy travelling and at conferences.
