From: mick@ics.forth.gr (Nick Kossifidis)
Date: Fri, 09 Nov 2018 04:36:19 +0200
Subject: [RFC 0/2] Add RISC-V cpu topology
In-Reply-To: <20181108164827.GB10953@e107155-lin>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
 <866dedbc78ab4fa0e3b040697e112106@mailhost.ics.forth.gr>
 <20181106141331.GA28458@e107155-lin>
 <969fc2a5198984e0dfe8c3f585dc65f9@mailhost.ics.forth.gr>
 <20181106162051.w7fyweuxrl7ujzuz@lakrids.cambridge.arm.com>
 <abcae019e6ae749b17ecb0c721fd3177@mailhost.ics.forth.gr>
 <20181107122803.GA8433@e107155-lin>
 <d04779705c47b59b94300365e805dbd3@mailhost.ics.forth.gr>
 <20181108164827.GB10953@e107155-lin>
Message-ID: <b44d94e4a5575e2ce49344b50956bf8e@mailhost.ics.forth.gr>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

???? 2018-11-08 18:48, Sudeep Holla ??????:
> On Thu, Nov 08, 2018 at 04:52:30PM +0200, Nick Kossifidis wrote:
>> ???? 2018-11-07 14:28, Sudeep Holla ??????:
>> >
>> > I agree, but we have kernel code using it(arm64/kernel/topology.c). It's
>> > too late to remove it. But we can always keep to optional if we move the
>> > ARM64 binding as generic to start with and mandate it for only ARM64.
>> >
>> 
>> That's my point as well, if we are going to define something to be 
>> used
>> by everybody and in this case, at least for RISC-V, there is no need 
>> to
>> carry this from the ARM64 binding.
> 
> Sure, whatever you don't need in RISC-V you can see if they can be made
> optional. I don't think that should be a problem.
> 
>> It shouldn't be that hard to fix this
>> in the future for ARM64 as well, we may give the new mapping another 
>> name,
>> maybe cpu-map2 or cpu-topology to slowly move to the new one.
> 
> No, we have it and we will continue to support it. It's not broken to
> fix on ARM64. Why do you think that it's broken on ARM64 ?
> 

I never said it's broken, I just assumed that if this binding becomes 
common
across archs you'd probably like to switch to it, so it should either be
backwards compatible with what you have (or as you said "keep them 
optional")
or take steps for the transition. I'm ok either way, It's not such a 
serious
thing to have the <thread> nodes supported or keep the distinction 
between
"cores", "clusters" or whatever, I'm sorry if it looked that way. I'm 
just
saying that I'd like to have something cleaner for RISC-V and/or a 
binding
that's common for all, we can support both and be backwards compatible, 
or we
can keep it as is and mandate the <thread> nodes only for ARM64 as you
suggested.

>> Changing the
>> dts files shouldn't be this hard, we can provide a script for it. We 
>> can
>> even contain some compatibility code that also understands <thread> 
>> nodes
>> and e.g. merges them together on a core node.
>> 
> 
> Sure, hang on this idea of scripting, we can make a better use of it.
> Details later further in the mail.
> 
> [...]
> 
>> > > The same also happens with the generic numa binding on
>> > > Documentation/devicetree/bindings/numa.txt
>> > > which says we should add the nuna-node-id on each of the cpu nodes.
>> > >
>> >
>> > Yes, but again what's the problem ?
>> >
>> 
>> There is no problem with the above bindings, the problem is that we 
>> have
>> to put them on each cpu node which is messy. We could instead put them
>> (optionally) on the various groupings used on cpu-map. This would 
>> allow
>> cpu-map to be more specific of what is shared across the members of 
>> each
>> group (core/cluster/whatever).
>> 
> 
> I think Mark has already explain why/how generic bindings are useful.
> If you still have concerns, take it up separately and see how you can
> build *perfect* bindings for RISC-V to avoid any legacy baggage.
> 
> We have reasons why we can't assume information about cache or power
> domain topology from CPU topology. I have summarised them already and
> we are not discussing.

But that's what you do on arch/arm/kernel/topology.c, you assume
information on power domain and cache topology based on the CPU topology
when you define the scheduling domain topology levels.

PowerPC also does the same on arch/powerpc/kernel/smp.c and basically if
you track the usage of struct sched_domain_topology_level you'll see 
that
every arch that uses it to instruct the scheduler about the scheduling
domains, does it based on its CPU topology, which I think we both agree
is wrong.

> There may not be perfect bindings but there are
> already supported and nothing is broken here to fix. DT bindings are
> *not* same as code to fix it with a patch to the bindings themselves.
> Once agreed and merged, they need to be treated like user ABI.
> 

The only use of the devicetree spec bindings for caches if I'm not
mistaken are used on your cacheinfo driver for exporting them to 
userspace
through sysfs (thank you for cleaning this up btw). Even if we have the
cache topology  using the generic bindings, we are not doing anything 
with
that information but export it to userspace.

As for the power domain bindings, we have drivers/base/power/domain.c 
that
handles the generic bindings and it's being used by some drivers to put
devices to power domains (something used by the pm code), but from a 
quick
search it's not used for cpu nodes and I didn't see this info being used
for providing hints to the scheduler either. Even with the generic power
domain bindings in place, for CPU idle states, on ARM we have another
binding that's basically the same with the addition of 
"wakeup-latency-us".

For having different capacity there is no generic binding but I guess we
could use ARM's.

Of the generic bindings that relate to the scheduler's behavior, only 
the
numa binding is used as expected and only by ARM64, powerpc and sparc 
use
their own stuff.

So there may be nothing broken regarding the generic / already existing
bindings, but their support needs fixing. The way they are now we can't
use them on RISC-V for configuring the scheduler and supporting SMT and
MC properly + I'm not in favor of using CPU topology blindly as the
other archs do.

>> As I wrote on my answer to Mark previously, the bindings for infering
>> the cache topology, numa topology, power domain topology etc are 
>> already
>> there, they are in the devicet tree spec and provide very specific
>> informations we can use. Much "stronger" hints of what's going on at
>> the hw level. The cpu-map doesn't provide such information, it just
>> provides a view of how the various harts/threads are "packed" on the 
>> chip,
>> not what they share inside each level of "packing". It's useful 
>> because
>> it saves people from having to define a bunch of cache nodes and 
>> describe
>> the cache hierarchy on the device tree using the standard spec.
>> 
> 
> Ah, here comes. If you want to save people's time or whatever, you can 
> use
> your scripting magic you have mentioned above to define those bunch of 
> nodes
> you want to avoid.
> 

I mentioned the script as a transitioning method, but you are right, it 
goes
both ways.

>> So since cpu-map is there for convenience let's make it more 
>> convenient !
>> What I'm saying is that cpu-map could be a more compact way of using 
>> the
>> existing bindings for adding properties on groups of harts instead of
>> putting them on each hart individually. It will simplify the 
>> representation
>> and may also optimize the implementation a bit (we may get the 
>> information
>> we need faster). I don't see any other reason for using cpu-map on 
>> RISC-V
>> or for making it global across archs.
>> 
> 
> Sure, I don't have strong opinions there. Just stop mentioning that 
> this
> is the only solution and all existing ones are broken. They are not and
> needs to be supported until they are explicitly deprecated, becomes
> obsolete and finally removed.
> 
> [...]
> 

But I never said that's "the only solution and everything else is 
broken" !
I'm just proposing an extension to cpu-map since Mark suggested that 
it's
possible. My goal is to try and consolidate cpu-map with what Atish 
proposed
for RISC-V (so that we can use the same code) and point out some issues
on how we use and define the CPU topology.

>> >
>> > Why are you so keen on optimising the representation ?
>> > If you are worried about large systems, generate one instead of
>> > handcrafted.
>> >
>> 
>> I don't see a reason not to try to optimize it, since we are talking
>> about a binding to be used by RISC-V and potentially everybody, I 
>> think
>> it makes sens to improve upon what we already have.
>> 
> 
> Sure, you can always unless you stop treating existing ones are broken.
> I have already told DT bindings are not *normal code*. You can just
> replace existing ones with new optimised ones. You can only add the new
> (*optimised*) ones to the existing ones. You *need* to understand that
> concept first, otherwise there's not point in this endless discussion
> IMO.
> 
> I will stop here as I will have to repeat whatever I have already
> mentioned to comment on your arguments below.
> 
> In summary, I am not against improving the bindings if you think it's
> possible, but I don't see how it's more beneficially especially if we
> are going to support existing ones also. Mark has already given all the
> details.
> 

ACK, thanks a lot for your time and the discussion so far, I really
appreciate it.

Regards,
Nick
