From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 06 Sep 2018 02:45:11 -0700 (PDT)
Subject: [PATCH 5/8] RISC-V: Rename im_okay_therefore_i_am to
 found_boot_cpu
In-Reply-To: <f62e9466-bd77-096d-fcc7-f5750d0257bb@wdc.com>
Message-ID: <mhng-dd0dbcb8-790a-47a8-8c1f-ab1026a02624@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, 31 Aug 2018 14:18:02 PDT (-0700), atish.patra at wdc.com wrote:
> On 8/30/18 10:54 PM, Christoph Hellwig wrote:
>> On Thu, Aug 30, 2018 at 09:11:11AM -0700, Atish Patra wrote:
>>> On 8/30/18 7:41 AM, Christoph Hellwig wrote:
>>>>>    	struct device_node *dn = NULL;
>>>>> -	int hart, im_okay_therefore_i_am = 0;
>>>>> +	int hart, found_boot_cpu = 0;
>>>>
>>>> If you rename this anyway please switch to use a bool.
>>>>
>>>
>>> I can address the comment on this patch and fold it in my series to avoid
>>> unnecessary conflict.
>>>
>>> @Palmer: You can drop this patch.
>>
>> If Palmer is ok with it how about you include a respin of his whole
>> series?  There are some overlaps I think and having a single person
>> in charge might be helpful.
>>
>
> Sure. I am fine with it. Palmer ?

Ya, I have no problem with it.

>
>> Btw, I've found your series in my linux-kernel folder, but it did
>> not make it to linux-riscv or my personal inbox despite the CC.
>>
>
> Thanks for the review.
> I checked my scripts. I couldn't figure out what went wrong.
> Not sure if there was some issue with infradead.org at that time.
>
> Anyways, sorry again for the mess. I will keep a watch on this next time.
>
> Regards,
> Atish
