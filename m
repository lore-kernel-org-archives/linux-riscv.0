From: palmer@sifive.com (Palmer Dabbelt)
Date: Thu, 06 Sep 2018 02:45:06 -0700 (PDT)
Subject: [PATCH 5/8] RISC-V: Rename im_okay_therefore_i_am to
 found_boot_cpu
In-Reply-To: <30229ef5-ce4e-e78b-32f9-7c563f63827b@wdc.com>
Message-ID: <mhng-aa617456-63d1-4275-8032-126a6b21305c@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 30 Aug 2018 09:11:11 PDT (-0700), atish.patra at wdc.com wrote:
> On 8/30/18 7:41 AM, Christoph Hellwig wrote:
>>>   	struct device_node *dn = NULL;
>>> -	int hart, im_okay_therefore_i_am = 0;
>>> +	int hart, found_boot_cpu = 0;
>>
>> If you rename this anyway please switch to use a bool.
>>
>
> I can address the comment on this patch and fold it in my series to
> avoid unnecessary conflict.
>
> @Palmer: You can drop this patch.

Thanks!
