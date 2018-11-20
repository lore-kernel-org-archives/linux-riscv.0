From: atish.patra@wdc.com (Atish Patra)
Date: Tue, 20 Nov 2018 10:23:18 -0800
Subject: RISC-V Patchwork
In-Reply-To: <mhng-f1f11265-f6fe-4284-8dc0-a28ac937fdb4@palmer-si-x1c4>
References: <mhng-f1f11265-f6fe-4284-8dc0-a28ac937fdb4@palmer-si-x1c4>
Message-ID: <7b7de9a4-42f7-59d2-c952-bbc5ec023e56@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 11/20/18 8:21 AM, Palmer Dabbelt wrote:
> Atish tracked down the documentation for creating a patchwork, which now lives
> here
> 
>      https://patchwork.kernel.org/project/linux-riscv/list/
> 
> I have no idea how to use it, so we can all learn together :)
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
Awesome. I think you can change the status of the patch from a dropdown 
box, after you logged in with your patchwork id. The available options 
looks pretty much self explanatory unless there is a hidden meaning to 
it ;) ;). As a contributor, we can take a look at the patchwork to for 
the status of the patch. No need of email replies :).

pwclient was helpful in applying the patches directly in case lkml was 
not cc'd on the patch.

https://patchwork.kernel.org/project/linux-riscv/

There is git-pw also. However, I could not get it to working for 
linux-riscv.


Regards,
Atish
