From: atish.patra@wdc.com (Atish Patra)
Date: Thu, 30 Aug 2018 09:11:11 -0700
Subject: [PATCH 5/8] RISC-V: Rename im_okay_therefore_i_am to
 found_boot_cpu
In-Reply-To: <20180830144118.GA27233@infradead.org>
References: <20180827184243.25344-1-palmer@sifive.com>
 <20180827184243.25344-6-palmer@sifive.com>
 <20180830144118.GA27233@infradead.org>
Message-ID: <30229ef5-ce4e-e78b-32f9-7c563f63827b@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 8/30/18 7:41 AM, Christoph Hellwig wrote:
>>   	struct device_node *dn = NULL;
>> -	int hart, im_okay_therefore_i_am = 0;
>> +	int hart, found_boot_cpu = 0;
> 
> If you rename this anyway please switch to use a bool.
> 

I can address the comment on this patch and fold it in my series to 
avoid unnecessary conflict.

@Palmer: You can drop this patch.

Regards,
Atish
