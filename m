From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 28 Nov 2018 19:01:14 -0800 (PST)
Subject: macb: probe of 10090000.ethernet failed with error -110
In-Reply-To: <20181129022858.GG5037@lunn.ch>
Message-ID: <mhng-0f0b5208-8aac-4563-a2c0-921a0f5d9084@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 28 Nov 2018 18:28:58 PST (-0800), andrew at lunn.ch wrote:
>> This is all fine as long as Linux doesn't go and reset the phy again. Until
>> bafbdd527d56 ("phylib: Add device reset GPIO support") was the case.  After
>> that commit I believe phylib is resetting the phy while attempting to enter
>> unmanaged mode, which is now allowed in this particular chip.
>>
>> Since it appears the phy is not usually described by the device tree but is
>> instead discovered by probing a MII-based ID register, it seems the best
>> place to put this is within the phy driver itself.  I find it's usually best
>> to describe things with code, so I hacked up something like
>
> Talking to Florian, i was under the impression that you could not even
> discover the device when its reset state what wrong. You could not
> read the ID registers.
>
> Your suggested change assumed you can discover the device. Is this
> true?

Sorry, I can't tell that from reading the code.  Since our bootloader resets 
the phy into unmanaged mode I think that just deasserting reset should be OK, 
but I don't have much confidence in that -- once I run into one unexpected 
feature I start to expect more :)

It looks like there's already an expectation that at least the phy ID registers 
can be read between falling and rising edges of a reset, as that's how the 
fixups are handled.  Since the error message that shows up with a single 
(single as far as Linux is concerned, triple since a cold boot) reset rising 
edge still lists the phy by name I think that probing is working well enough, 
but I wouldn't be surprised if there's something in the middle that's gone 
wrong.  It's possible registering a fixup that does the double reset can get us 
through the probing sequence.

Maybe Atish or Paul can help out?  I'm a bit embarrassed to admit that I can't 
actually figure out how to boot the board any more, it's been a year since it's 
been my primary target and since I just to arch/riscv stuff now I rely them to 
test on the board...
