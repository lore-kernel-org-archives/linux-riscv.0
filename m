From: hch@lst.de (Christoph Hellwig)
Date: Thu, 2 Aug 2018 11:53:25 +0200
Subject: [PATCH 7/9] irqchip: add a RISC-V PLIC driver
In-Reply-To: <1b380e3c-e137-ebe9-4528-852062d2192e@wdc.com>
References: <20180726143723.16585-1-hch@lst.de>
 <20180726143723.16585-8-hch@lst.de>
 <1b3f6066-0c7c-a5f5-75ad-559fe81091ee@wdc.com>
 <dc69d688-f765-74cc-3234-563fecff6002@wdc.com> <20180731165712.GA2521@lst.de>
 <dcb17e67-9f83-0ff5-a2c6-a6dd1b4d9c0d@wdc.com>
 <20180801121656.GA25806@lst.de>
 <1b380e3c-e137-ebe9-4528-852062d2192e@wdc.com>
Message-ID: <20180802095325.GC14203@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Aug 01, 2018 at 06:09:42PM -0700, Atish Patra wrote:
> On 8/1/18 5:12 AM, Christoph Hellwig wrote:
>> On Tue, Jul 31, 2018 at 05:38:01PM -0700, Atish Patra wrote:
>>> crash details are at
>>> https://paste.debian.net/1036078/
>>
>> Is this running without kallsyms?  It seems to lack useful symbols
>> and a backtrace unfortunately.
>>
> Yes. I checked the config. All KALLSYMS options and STACKTRACE are enabled
>
> CONFIG_KALLSYMS=y
> CONFIG_KALLSYMS_ALL=y
> CONFIG_KALLSYMS_BASE_RELATIVE=y
>
> CONFIG_STACKTRACE_SUPPORT=y
> CONFIG_STACKTRACE=y
>
> Not sure if I missed something.

That should be all that is needed normally.
