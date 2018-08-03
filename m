From: hch@lst.de (Christoph Hellwig)
Date: Fri, 3 Aug 2018 14:31:05 +0200
Subject: [PATCH 11/11] clocksource: new RISC-V SBI timer driver
In-Reply-To: <78e56d2f-155b-72df-1094-fdfb45090216@wdc.com>
References: <20180802115008.4031-1-hch@lst.de>
 <20180802115008.4031-12-hch@lst.de>
 <78e56d2f-155b-72df-1094-fdfb45090216@wdc.com>
Message-ID: <20180803123105.GB18301@lst.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

>> +/*
>> + * It is guarnteed that all the timers across all the harts are synchronized
>
> /s/guarnteed/guaranteed

Fixed.
