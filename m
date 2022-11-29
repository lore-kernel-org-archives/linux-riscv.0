Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E023C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 11:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OEp/Ub5utksF3hAIjvKJmMP1ZGFUB8dv7hiBaGZC1Kk=; b=UU1gucVeuFTvcW
	ACdI+Dd1KqSbQJtdLgZm++jYPhjIA2Bx0KXCHGgkkrqKZTNjsAQqc/Dn4pSAPnRP6UiRlcnJoqW5i
	kAwuewylyLZDd2W02+vmC6iTUSX0r/naLssIKj011k+rBP610qZvAY/03jjcEa0ftFFjLhNthekiT
	yDnnLqg85lGOB4uFbw/xE63nANiEJDrcgdzBkh6jLWzy+QjMjO1zqiYVjxZzKdAuF5x8NhSpok+Rh
	Wdm4lXVWp6pLJmp5JbMZD9NQWu7CV7v0PBpDT4zpaHcAPFC63WoxJ6EesTjnf17iHXpaXYB844zGX
	vQZtNZthRK7R+8ndQKaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozyyt-008VOx-3p; Tue, 29 Nov 2022 11:40:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozyyn-008VMZ-OK
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 11:40:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669722050; x=1701258050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dj3yv782CgVSbDWsCFTsi9bDR5Zdl0MYjrJXe4M+W9k=;
  b=xv+BTDw7ehMFnLPZEH6Gxp5qBeHbYlzogIxqpLWgiFgiOQEwE2Rajcrj
   nuXY+H13bV1e9zoRQV3PH2h02+nnKttawsf1VF6SFAjsiiG3lV+IyMqS7
   YESJ9nYSw2TG0qpIvrnGRylG4l3fmaWn3ATWBNBoSi4+yUpHnbhZm6DiN
   dJtTljKZfTc7l4vVkofZuqhM6OzKPYvZs9TFsxnohUPyeaaSlgg9Q2esf
   H50mn7+S/DBARGKHvwDdi3Vp+m3W6riv+azeVBuQmzT9CVuApIHV405e8
   V9Z4g4vsrREUMZSWFZle9QzDD1dy/JeqcorAdGy9tXxcUotZWNaENhkjZ
   g==;
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; 
   d="scan'208";a="185661326"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Nov 2022 04:40:43 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 29 Nov 2022 04:40:33 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 29 Nov 2022 04:40:31 -0700
Date: Tue, 29 Nov 2022 11:40:12 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>, <palmer@dabbelt.com>
Subject: Re: [PATCH 2/2] dt-bindings: riscv: fix single letter canonical order
Message-ID: <Y4XvnHIPw8ZuBZEk@wendy>
References: <Y4UJQYgCpnZJji9o@spud>
 <mhng-8141aa74-17c6-4692-a658-b5e4faad0c14@palmer-ri-x1c9a>
 <20221129051911.5xetsgfukxiljuhf@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221129051911.5xetsgfukxiljuhf@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_034049_879453_9889CB01 
X-CRM114-Status: GOOD (  53.88  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, heiko@sntech.de, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, robh+dt@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, guoren@kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Yo Drew, Palmer,

(preserving the conversation in case any DT folks want to chime
in on the ABI comment)

On 29/11/2022 05:19, Andrew Jones wrote:
> On Mon, Nov 28, 2022 at 03:41:19PM -0800, Palmer Dabbelt wrote:
>> On Mon, 28 Nov 2022 11:17:21 PST (-0800), Conor Dooley wrote:
>>> On Mon, Nov 28, 2022 at 10:12:17AM -0800, Palmer Dabbelt wrote:
>>>> On Mon, 28 Nov 2022 10:08:05 PST (-0800), Conor Dooley wrote:
>>>>> On Mon, Nov 28, 2022 at 09:41:03AM -0800, Palmer Dabbelt wrote:
>>>>>> On Thu, 24 Nov 2022 05:42:20 PST (-0800), heiko@sntech.de wrote:
>>>>>>> Am Donnerstag, 24. November 2022, 14:04:41 CET schrieb Conor Dooley:
>>>>>>>> I used the wikipedia table for ordering extensions when updating the
>>>>>>>> pattern here in foo.
>>>>>>>
>>>>>>>          ^ foo? :-)
>>>>>>>
>>>>>>>> Unfortunately that table did not match canonical order, as defined by
>>>>>>>> the RISC-V ISA Manual, which defines extension ordering in (what is
>>>>>>>> currently) Table 41, "Standard ISA extension names". Fix things up by
>>>>>>>> re-sorting v (vector) and adding p (packed-simd) & j (dynamic
>>>>>>>> languages). The e (reduced integer) and g (general) extensions are still
>>>>>>>> intentionally left out.
>>>>>>>>
>>>>>>>> Link: https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-unpriv-pdf-from-asciidoc-15112022 # Chapter 29.5
>>>>>>>> Fixes: 299824e68bd0 ("dt-bindings: riscv: add new riscv,isa strings for emulators")
>>>>>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>>>>>
>>>>>>> So I have compared the new pattern to the isa manual,
>>>>>>> and it looks like the order checks out, so
>>>>>>
>>>>>> Which ISA manual?
>>>>>
>>>>> For me, isa manual is the above github repo.
>>>>
>>>> Which commit, though?
>>>
>>> mutt won't let me paste a clown face emoticon.
>>>
>>>>>> There have been many mutually incompatible ISA string
>>>>>> encoding rules, at least one of them was a change to the extension ordering.
>>>>>> It's not entirely clear what the right answer is here, as we can't really
>>>>>> parse ISA strings without also knowing the version of the ISA manual we're
>>>>>> meant to parse them against.  Maybe we just accept everything?
>>>>>
>>>>> I don't think accepting everything is the right thing to do. A minimal
>>>>> amount of validation is still needed here, but I think we can deprecate
>>>>> the DT property entirely & make it optional if a new-and-improved way of
>>>>> encoding the in DT is used.
>>>>
>>>> Sorry, by "everything" I meant "everything that's even been allowed by the
>>>> ISA manual".  Just accetping anything would be bad ;)

I agree. I can always relax the regex if something comes to light - but
it's already pretty forgiving about the ordering of stuff - especially
the multiletter extensions.

>>>>
>>>>>> IMO it's time to just stop using the ISA string.  It's not a stable
>>>>>> interface, trying to treat it as such just leads to headaches.  We should
>>>>>> just come up with some DT-specific way of encoding whatever HW features are
>>>>>> in question.  Sure it'll be a bit of work to write that all down in the DT
>>>>>> bindings, but it's going to be way less work than trying to keep around all
>>>>>> this ISA string parsing code.
>>>>>
>>>>> I'm a glutton for punishment, I'll try and come up with some sort of
>>>>> other way to encode this information in DT that requires less parsing
>>>>> and validation. As I said on IRC, something that more resembles:
>>>>> if (of_property_wahtever("riscv,isa-foo")) { do_enable_foo() }
>>>>
>>>> That seems way simpler to me, thanks!  We'll still need to support whatever
>>>> was here as a legacy format, but at least we won't need to add a bunch of
>>>> new stuff to it -- that's where the parsing starts to get really
>>>> complicated.
> 
> While it's easy for Linux to add new DT nodes when new extension support is
> added, it's not so easy to add new ACPI objects. The current plan for ACPI
> is to use the ISA string[1]. With that in mind, I think Linux should
> continue to parse the string for DT as well.

I was thinking about how to implement this at the gym this morning,
before even reading this mail, and I have gotten cold feet about doing
riscv,isa-foo stuff anyway.

I don't really want to create a confusing, two-location way of turning
features on. We would be either forcing all other operating systems to
switch away from using riscv,isa too or creating a difference between
how Linux handles things compared to, say, FreeBSD or U-Boot.
IOW, if the "v" in riscv,isa turned it on for FreeBSD and a boolean DT
property of riscv,isa-v did it for Linux. I really dislike the idea of
that...

If we are going to have to parse it *anyway* for ACPI, then I think
there's little merit unfortunately.

I think we would also end up ballooning the code with a bunch of checks
for the different extensions which I am not keen on either.
Completely relaxing any parsing rules, as discussed below, seems like
a less user-hostile & more "application" independent way of proceeding.

> [1] https://docs.google.com/document/d/1LlCefO_0GQ_7Tf3lzfMPETEfMlGo2FfLRJ09IMqJKEk/edit
> 
>>>
>>> Yah, and "deprecated" in dt-schema doesn't actually do anything at the
>>> moment other than let humans know not to use something. Just gonna have
>>> to do some sort of "feature-wise AND" between the existing things we

That should be s/AND/OR/

>>> parse from the isa string & whatever riscv,isa-foo stuff later on.
>>
>> I suppose this is more of a Rob question, but could we just make the DT
>> bindings match the current ISA manual's rules and then have the kernel's
>> "riscv,isa" string parser accept more orderings to remain compatible?
>>
>> Sort of a API vs ABI stability question, but for DTB and bindngs.

AFAIU, the kernel needs to keep supporting only what was ever in a
dt-binding to satisfy the DT ABI and our current regex is compatible
with that so that's fine.
Whether or not we have laxer rules within the kernel is fine, as long
as we support whatever we specified previously in the binding.

>>>> FWIW, there's a similar dicussion going on in GCC land right now.
>>>>
>>>>>> I know I've said the opposite before, but there's just been way too many
>>>>>> breakages here to assume they're going to stop.
>>>>>
>>>>> :upside_down_face:
>>>>>
>>>>> Either way, I think these two patches are worth taking in the mean time.
>>>>
>>>> Yep, just as long as it doesn't break any of the strings that were valid
>>>> according to previous versions of the ISA manual I'm fine with it.
>>>
>>> I don't think so. I had been looking around for a supposed order for
>>> where to actually put H, which had been dropped - and the only place I
>>> recall seeing that was Wikipedia - which now seems like an awful
>>> decision since the order there looks kinda off anything I see in dozen
>>> or so spec PDFs I have downloaded. But that's where I got the K & V
>>> ordering from that I now think is wrong (and doesn't match any PDF I
>>> have). The other changes relax rules and add letters so they should be
>>> okay too.
>>
>> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

I am assuming that w/ these tags I can take this with other DT stuff,
since they're kinda unrelated to the ongoing conversation.

>> as it sounds like there aren't even any fixed rules, so I guess none of this
>> even matters?
> 
> IMHO, we should try to get the spec changed to say that the only order
> which matters is that single letter extensions come first (in any order)

Good luck, I'll +1 your PR.

> and then multi-letter extensions come after (in any order). Parsing
> becomes simple and we can publish the string in proc in any order too,
> maybe preferring alphabetical order for neatness.

Devil's advocate, then we break someone's parser that relied expects
things to be how they were ordered by a prior version of the spec?

Either way, I am happy to vote for a world in which the stuff we put
into /proc follows the loosest possible wording that has ever been
using in the spec (and in fact, I think we *need* to do that).

Per the thread on the Zbb stuff, the table claims it "defines the
canonical order in which extension names must appear in the name
string, with top-to-bottom in table indicating first-to-last in the
name string, e.g., RV32IMACV is legal, whereas RV32IMAVC is not." 

It does not contain an entry for Zihintpause & I cannot see anywhere
in the current incarnation* of the naming.tex document that tells us
how to sort unmentioned Standard Additional Extensions - just that
"Standard supervisor-level extensions should be listed after standard
unprivileged extensions" & "Standard machine-level extensions should
be listed after standard lesser-privileged extensions"

(as an aside, I think that second quote is missing a comma after
standard)

The implication there, is that something like Zihintpause could, per
this version of the spec*, be placed anywhere in the string once the
"Base Integer ISA" constraint is satisfied (or not permitted in the
string at all?). Have I missed something? This particular situation
has been the cause of all of my confusion lately - the doc says it
defines the order by the table, which then has no generic entry for
"Additional Standard Extensions".

* 10eea63205f371ed649355f4cf7a80716335958f

Anyways, I feel hopelessly confused by all of this stuff & I wish
we could just write down exactly what *we* are doing w.r.t. internal
kernel representation (yeah yeah https://xkcd.com/927/) as absolutely
noone seems to be sure what to do. Maybe in the "patch acceptance"
document.

In terms of our own parsing of the isa string, assuming single-letter
followed by multiletter is about the only assumption that I think we
should be making.
I don't think that parsing in any order after that really becomes an
issue unless we have x depends on y sort of things where x is not
explicitly required.

The specs currently say:
"Some ISA extensions depend on the presence of other extensions, e.g.,
``D'' depends on ``F'' and ``F'' depends on ``Zicsr''.  These
dependences may be implicit in the ISA name: for example, RV32IF is
equivalent to RV32IFZicsr, and RV32ID is equivalent to RV32IFD and
RV32IFDZicsr."

That'd mean that out-of-canonical-order processing isn't too bad since
the more expansive extension would imply the others too.
Who knows if that will hold for future extensions, but maybe we can
deal with things down the road.

I'll take a look at the current parser to at least get things
straightened out in my own head and then maybe submit a patch for the
docs as mentioned above so we can at least point patch submitters
at something concrete?

I am really sorry for all of the "chaos" that I've sown over the last
few days on this sort of subject, but everyone is doing different things
and it triggers my OCD heh. Knowing where we stand would be nice :)

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
