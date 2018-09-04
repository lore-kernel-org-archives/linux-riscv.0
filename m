From: atish.patra@wdc.com (Atish Patra)
Date: Tue, 4 Sep 2018 14:40:41 -0700
Subject: [PATCH v2 3/3] RISC-V: Support cpu hotplug.
In-Reply-To: <20180904213623.GA2078@infradead.org>
References: <1535445370-19004-1-git-send-email-atish.patra@wdc.com>
 <1535445370-19004-4-git-send-email-atish.patra@wdc.com>
 <20180831061859.GC19292@infradead.org>
 <0d439b9d-b3d0-7d2c-117b-abb37adf769c@wdc.com>
 <20180904213623.GA2078@infradead.org>
Message-ID: <54571707-fd28-3258-fbec-4612f62ad2ad@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 9/4/18 2:36 PM, Christoph Hellwig wrote:
> On Tue, Sep 04, 2018 at 11:08:35AM -0700, Atish Patra wrote:
>>
>> I have kept it here to match all other arch. Same goes for all hotplug
>> functions in smpboot.c
>>
>> I can move them to a separate file if you think that provides better code
>> readability and structure.
> 
> I don't really have a strong opinion, but keeping this code together
> and reducing the ifdef maze seems worthwile to me.
> 
Sure. I will move it a new file accordingly in v3. If nobody else has 
objection for that, we will keep it that way.

Regards,
Atish
