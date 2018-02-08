From: ulfalizer@gmail.com (Ulf Magnusson)
Date: Fri, 9 Feb 2018 00:20:21 +0100
Subject: [PATCH] ALSA: ac97: kconfig: Remove select of undefined symbol
 AC97
In-Reply-To: <20180208231536.xnlrldm4to4pfv57@huvuddator>
References: <20180205012146.23981-1-ulfalizer@gmail.com>
 <CAFkk2KRafUf3ki2R7B1pE_wzYkYn-OdeqLnvL0kScSxdzDMEXw@mail.gmail.com>
 <87lgg587ys.fsf@belgarion.home>
 <20180208231536.xnlrldm4to4pfv57@huvuddator>
Message-ID: <20180208232021.ygw24klb7co6shrm@huvuddator>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Fri, Feb 09, 2018 at 12:15:36AM +0100, Ulf Magnusson wrote:
> The AC97_BUS_NEW Kconfig symbol selects the globally undefined symbol
> AC97.
> 
> Robert Jarzmik confirmed in https://lkml.org/lkml/2018/2/7/96 that the
> select was put in by mistake and can be safely removed, with no other
> changes required. Remove it.
> 
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
> ---
>  sound/ac97/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/sound/ac97/Kconfig b/sound/ac97/Kconfig
> index f8a64e15e5bf..baa5f8ef89d2 100644
> --- a/sound/ac97/Kconfig
> +++ b/sound/ac97/Kconfig
> @@ -5,7 +5,6 @@
>  
>  config AC97_BUS_NEW
>  	tristate
> -	select AC97
>  	help
>  	  This is the new AC97 bus type, successor of AC97_BUS. The ported
>  	  drivers which benefit from the AC97 automatic probing should "select"
> -- 
> 2.14.1
> 

I didn't have a particular tree in mind for this patchset by the way.
Feel free to take the patch in wherever it makes sense.

Cheers,
Ulf
