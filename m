From: paul.walmsley@sifive.com (Paul Walmsley)
Date: Fri, 16 Nov 2018 15:10:35 -0800 (PST)
Subject: [PATCH v2 1/2] dt-bindings: serial: add documentation for the
 SiFive UART driver
In-Reply-To: <20181024173232.GB5652@bogus>
References: <20181019184827.12351-1-paul.walmsley@sifive.com>
 <20181019184827.12351-2-paul.walmsley@sifive.com>
 <CAL_JsqJBSqaxnETdJg1Mdp+H2ay+WKT0JaxLe6D4Fwo_99qUkw@mail.gmail.com>
 <4317548d-f831-29ba-3be9-35f080587db9@sifive.com>
 <CAL_JsqLagTgjDhZ02X=wPFDB4WF2bR7=LyzSW9D=ooo_XB_zOg@mail.gmail.com>
 <6571bb0e-b36a-1196-4d90-8aa62d8a2a90@sifive.com>
 <20181024173232.GB5652@bogus>
Message-ID: <alpine.DEB.2.21.9999.1811161505240.25712@viisi.sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 24 Oct 2018, Rob Herring wrote:

> On Tue, Oct 23, 2018 at 10:05:40AM -0700, Paul Walmsley wrote:
>> On 10/20/18 7:21 AM, Rob Herring wrote:
>>> On Fri, Oct 19, 2018 at 5:06 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>>>> On 10/19/18 1:45 PM, Rob Herring wrote:
>>>>> On Fri, Oct 19, 2018 at 1:48 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>>>>>> Add DT binding documentation for the Linux driver for the SiFive
>>>>>> asynchronous serial IP block.  Nothing too exotic.
>>>>>>
>>>>>> Cc: linux-serial at vger.kernel.org
>>>>>> Cc: devicetree at vger.kernel.org
>>>>>> Cc: linux-riscv at lists.infradead.org
>>>>>> Cc: linux-kernel at vger.kernel.org
>>>>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>>>> Cc: Rob Herring <robh+dt@kernel.org>
>>>>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>>>>> Cc: Palmer Dabbelt <palmer@sifive.com>
>>>>>> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
>>>>>> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
>>>>>> Signed-off-by: Paul Walmsley <paul@pwsan.com>
>>>>>> ---
>>>>>>    .../bindings/serial/sifive-serial.txt         | 21 +++++++++++++++++++
>>>>>>    1 file changed, 21 insertions(+)
>>>>>>    create mode 100644 Documentation/devicetree/bindings/serial/sifive-serial.txt
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/serial/sifive-serial.txt b/Documentation/devicetree/bindings/serial/sifive-serial.txt
>>>>>> new file mode 100644
>>>>>> index 000000000000..8982338512f5
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/serial/sifive-serial.txt
>>>>>> @@ -0,0 +1,21 @@
>>>>>> +SiFive asynchronous serial interface (UART)
>>>>>> +
>>>>>> +Required properties:
>>>>>> +
>>>>>> +- compatible: should be "sifive,fu540-c000-uart0" or "sifive,uart0"
>>>>>>
>>>>> As I mentioned for the
>>>>> intc and now the pwm block bindings, if you are going to do version
>>>>> numbers please document the versioning scheme.
>>>>>
>>>>>
>>>>> Will add that to the binding document.
>>> I don't seem to be making my point clear. I don't want any of this
>>> added to a binding doc for particular IP blocks. Write a common doc
>>> that explains the scheme and addresses the questions I asked. Then
>>> just reference that doc here.
>>>
>>> Maybe this is documented somewhere already? Otherwise, if one is
>>> creating a new IP block, how do they know what the versioning scheme
>>> is or what goes in the DT ROM?
>>
>>
>> Seems like there might be some confusion between IP blocks as integrated on
>> an SoC vs. IP blocks in isolation.? It's not necessarily the SoC integrator
>> that sets an IP block version number; this can come from the IP block vendor
>> itself.? So each IP block may have its own version numbering practices for
>> the IP block alone.
>>
>>
>> For SiFive IP blocks, we at SiFive could probably align on a common version
>> numbering structure for what's in the sifive-blocks repository.
>
> I thought you had that from what Palmer said and what I've seen so far.
> You have at least 3 bindings so far it seems.

Yep.

>> But other IP blocks from other vendors may not align to that, or may not
>> have version numbers exposed at all.? In those cases there's no way for
>> software folks to find out what they are,? as you pointed out earlier.? This
>> is the case with most DT compatible strings in the kernel tree.
>>
>> For example, we've integrated the NVDLA IP block, from NVIDIA, on some
>> designs.? Any NVIDIA version numbers in that IP block will probably not
>> follow the SiFive version numbering scheme.? I'd propose the right thing to
>> do for an IP block compatible string is to follow the vendor's practice, and
>> then use the SoC integrator's version numbering practice for the
>> SoC-integrated compatible string.
>
> Experience has shown that using compatible strings only specific to
> vendor IP blocks (with or without version numbers) is pretty useless.
>
> For licensed IP, I'd suggest you follow standard practices.

OK

> A genericish fallback is generally only used when there's lots of SoCs 
> sharing a block.
>
> In these cases though it needs to be clear what bindings follow some
> common versioning scheme and which don't. That's accomplished
> by referencing what the version scheme is. Otherwise, I'd expect I'll
> see the versioning scheme copied when in fact the source IP in no way
> follows it.
>
>> In effect, an SoC integration DT compatible string like
>> "sifive,fu540-c000-uart" implicitly states an IP block version number:
>> "whatever came out of the fab on the chip"[**].?? I'd propose that even in
>> these cases, there's an advantage to keeping the "0" on the end, since it
>> uniquely identifies an SoC-independent IP block, rather than just the type
>> of the IP block. ? But if the "0" on the end of the SoC integration DT
>> compatible string is problematic for you, we can certainly drop that last 0
>> from the SoC integration DT compatible string, and only suffer a slight lack
>> of clarity as to what version was integrated on that chip.
>
> Personally I'd leave it off, but I'm fine with either way. It just needs
> to be the way you document for SiFive IP blocks.

OK, we'll leave it off.

> Really, I'd just like to see folks get better at putting version and
> configuration information into registers. We only need DT for what we
> can't discover.

Yep, agreed.


- Paul
