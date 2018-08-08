From: hch@lst.de (Christoph Hellwig)
Date: Wed, 8 Aug 2018 08:27:25 +0200
Subject: simplified RISC-V interrupt and clocksource handling v3
In-Reply-To: <mhng-d7c67842-dff7-4200-bc2e-c3eed1a0a7bf@palmer-si-x1c4>
References: <20180804082319.5711-1-hch@lst.de>
 <mhng-d7c67842-dff7-4200-bc2e-c3eed1a0a7bf@palmer-si-x1c4>
Message-ID: <20180808062725.GA15636@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

[attention Rob: Palmer said he is going to pull it in, and I'd really
 like to have your ACK on the DT bindings, can you chime in if
 everything is ok for you?]

On Tue, Aug 07, 2018 at 07:23:19PM -0700, Palmer Dabbelt wrote:
> Thanks!  Modulo the one device tree issue I replied to in patch 3 this 
> looks great!  We've already gotten the ACKs to take this through the RISC-V 
> tree, so I'm going to put this along with the queued RISC-V patches on our 
> for-next branch, including my proposed change for "sifive,plic-1.0" but 
> leaving the device tree bindings with #{address,size}-cells=1.

Note that I saw a branch that only has the actual driver patch, this
needs to be in the documentation as well of couse.  I don't really
care which name we settle on as long we agree on it, and document it
properly.
