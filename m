From: hch@infradead.org (Christoph Hellwig)
Date: Sun, 4 Nov 2018 23:05:51 -0800
Subject: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
In-Reply-To: <20181105065807.GA1286@andestech.com>
References: <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
 <mhng-01f0ac6a-c2fd-41be-9d53-44d1c139d453@palmer-si-x1c4>
 <20181101174857.du2zu4vnrhpu5asf@excalibur.cnev.de>
 <20181105065807.GA1286@andestech.com>
Message-ID: <20181105070551.GA7274@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Nov 05, 2018 at 02:58:07PM +0800, Vincent Chen wrote:
> Many thanks for kinds of comments. I quickly synthesize the comments and
> list them as below.
> 1. The kernel image shall include all vendor-specific code.

I fundamentally disagree with this? and think it should be the contrary.

1. The kernel shall support no vendor specific instructions whatsoever,
period.
