From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 17 Sep 2018 07:20:17 -0700
Subject: [RFC 1/3] dt-bindings: Correct RISC-V's timebase-frequency
In-Reply-To: <1536962096-233842-2-git-send-email-atish.patra@wdc.com>
References: <1536962096-233842-1-git-send-email-atish.patra@wdc.com>
 <1536962096-233842-2-git-send-email-atish.patra@wdc.com>
Message-ID: <20180917142017.GA15588@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, Sep 14, 2018 at 02:54:54PM -0700, Atish Patra wrote:
> From: Palmer Dabbelt <palmer@sifive.com>
> 
> Someone must have read the device tree specification incorrectly,
> because we were putting timebase-frequency in the wrong place.  This
> corrects the issue, moving it from

Last time this was brought up we actually had realy life DTs with
the timebase-frequency under cpus and not the invidual cpu node.

I think we need to just document both possibilities and live with
them.
