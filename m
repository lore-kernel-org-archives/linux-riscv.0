From: atish.patra@wdc.com (Atish Patra)
Date: Mon, 17 Sep 2018 19:26:52 -0700
Subject: [RFC 1/3] dt-bindings: Correct RISC-V's timebase-frequency
In-Reply-To: <20180917142017.GA15588@infradead.org>
References: <1536962096-233842-1-git-send-email-atish.patra@wdc.com>
 <1536962096-233842-2-git-send-email-atish.patra@wdc.com>
 <20180917142017.GA15588@infradead.org>
Message-ID: <b397a711-90e8-8c35-c49a-8d60b129c384@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 9/17/18 7:20 AM, Christoph Hellwig wrote:
> On Fri, Sep 14, 2018 at 02:54:54PM -0700, Atish Patra wrote:
>> From: Palmer Dabbelt <palmer@sifive.com>
>>
>> Someone must have read the device tree specification incorrectly,
>> because we were putting timebase-frequency in the wrong place.  This
>> corrects the issue, moving it from
> 
> Last time this was brought up we actually had realy life DTs with
> the timebase-frequency under cpus and not the invidual cpu node.
> 

Unfortunately, it still is. I hope SiFive can publish the updated 
firmware with correct DT entries. I can patch BBL to fix these DT issues 
until the firmware update if that's accepted.


> I think we need to just document both possibilities and live with
> them.
> 
Yup. That was the intention. I will update the document/commit text to 
reflect that.


Regards,
Atish
