From: shea@shealevy.com (Shea Levy)
Date: Thu, 08 Mar 2018 14:41:11 -0500
Subject: [PATCH] set_handle_irq: Return EBUSY if the handler has already
 been registered.
In-Reply-To: <mhng-8027a7d2-1e7e-44f2-9f45-8f62284815c7@palmer-si-x1c4>
References: <mhng-8027a7d2-1e7e-44f2-9f45-8f62284815c7@palmer-si-x1c4>
Message-ID: <877eqmuzhk.fsf@xps13.shealevy.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Yep, thanks!

Palmer Dabbelt <palmer@sifive.com> writes:

> I squashed it into the patch set I just sent out -- sorry, I thought I got your 
> OK for it.  Is that OK?
>
> On Thu, 08 Mar 2018 11:13:25 PST (-0800), shea at shealevy.com wrote:
>> Hi all,
>>
>> Any thoughts on this?
>>
>> Thanks,
>> Shea
>>
>> Shea Levy <shea@shealevy.com> writes:
>>
>>> This is what's expected by the comments and at least by irq-riscv-intc.c
>>>
>>> Signed-off-by: Shea Levy <shea@shealevy.com>
>>> ---
>>>  include/linux/irq.h | 2 +-
>>>  kernel/irq/handle.c | 5 +++--
>>>  2 files changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/include/linux/irq.h b/include/linux/irq.h
>>> index 2930fd2572e4..77e97872a13e 100644
>>> --- a/include/linux/irq.h
>>> +++ b/include/linux/irq.h
>>> @@ -1179,7 +1179,7 @@ int ipi_send_mask(unsigned int virq, const struct cpumask *dest);
>>>   * Returns 0 on success, or -EBUSY if an IRQ handler has already been
>>>   * registered.
>>>   */
>>> -void __init set_handle_irq(void (*handle_irq)(struct pt_regs *));
>>> +int __init set_handle_irq(void (*handle_irq)(struct pt_regs *));
>>>
>>>  /*
>>>   * Allows interrupt handlers to find the irqchip that's been registered as the
>>> diff --git a/kernel/irq/handle.c b/kernel/irq/handle.c
>>> index dee4f9a172ca..3570c715c3e7 100644
>>> --- a/kernel/irq/handle.c
>>> +++ b/kernel/irq/handle.c
>>> @@ -213,11 +213,12 @@ irqreturn_t handle_irq_event(struct irq_desc *desc)
>>>  }
>>>
>>>  #ifdef CONFIG_GENERIC_IRQ_MULTI_HANDLER
>>> -void __init set_handle_irq(void (*handle_irq)(struct pt_regs *))
>>> +int __init set_handle_irq(void (*handle_irq)(struct pt_regs *))
>>>  {
>>>  	if (handle_arch_irq)
>>> -		return;
>>> +		return -EBUSY;
>>>
>>>  	handle_arch_irq = handle_irq;
>>> +	return 0;
>>>  }
>>>  #endif
>>> --
>>> 2.16.1
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv at lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 832 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180308/432394e5/attachment.sig>
