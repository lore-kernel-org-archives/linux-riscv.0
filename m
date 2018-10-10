From: thierry.reding@gmail.com (Thierry Reding)
Date: Wed, 10 Oct 2018 15:44:04 +0200
Subject: [RFC 2/4] pwm: sifive: Add a driver for SiFive SoC PWM
In-Reply-To: <20181010131128.GA29142@infradead.org>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-3-git-send-email-atish.patra@wdc.com>
 <20181010131128.GA29142@infradead.org>
Message-ID: <20181010134404.GC21134@ulmo>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Oct 10, 2018 at 06:11:29AM -0700, Christoph Hellwig wrote:
[...]
> > +static struct platform_driver sifive_pwm_driver = {
> > +	.probe = sifive_pwm_probe,
> > +	.remove = sifive_pwm_remove,
> > +	.driver = {
> > +		.name = "pwm-sifivem",
> > +		.of_match_table = of_match_ptr(sifive_pwm_of_match),
> > +	},
> > +};
> 
> What about using tabs to align this a little more nicely?
> 
> static struct platform_driver sifive_pwm_driver = {
> 	.probe			= sifive_pwm_probe,
> 	.remove			= sifive_pwm_remove,
> 	.driver = {
> 		.name		= "pwm-sifivem",
> 		.of_match_table	= of_match_ptr(sifive_pwm_of_match),
> 	},
> };

I discourage people from doing that because down the road somebody might
add a field here that's longer than the alignment tabs and then either
it becomes ugly or they either have to realign everything to keep it
pretty. Single spaces around '=' don't have that problem if used
consistently.

Thierry
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20181010/3ffe093b/attachment.sig>
