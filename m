Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB4CC369CB
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 01:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RtJSKr0fCiiH9x4JgcVLA3UbOiosvaWzU0FSCGANCnA=; b=gW+hkNYK/p1EZL
	ELqeWeWw2RwefE0te4pVsKbcuX+K2OIvJ11YGJiCprhicLu1Fw9anOejPwjA5ymQDHEM6pp7AONI9
	lbtwsl3zfw+7T/SodQuXBWkZCzmR0u/ovOpoNt3VliU0uBdGMF8Knmv0zEZ+h8+rz97IsJ443Pmjv
	fu3vm+1Ykh8uU7IWz4z1GXx5s6iOp7Zl8YPC5jFv7RCNcvnGVByYO0ortPeX8A43nrzgm3axm/Chz
	klEr04ARsbgGf172j/Av34273tYq+7M3rk9YIqeT9DdY8pO4F8te+2HQwepjLmEMLKddFpgENqRme
	WaqtfdslHVeub1Znk15w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7P1a-00000008yFZ-1KzC;
	Wed, 23 Apr 2025 01:35:42 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7P1X-00000008yEm-0teU
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 01:35:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745372139; x=1776908139;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9/n6IciSqOC+Gn+eOBz9G3ToQgAQ+J3ZCJVNcEkC+m8=;
  b=U0n1B23cZ8ngtx4uJ2lKyKiZqKVTePOPxaOjYHcQjBcMX4wrGLNelkru
   sjNCnBe7iwqrXP1MoFSf0/atbyIdL7dqc/lwwwjccsttGPYOO8jfjzSgr
   NEqaS3B+J3gKVG+QCnP4TCQjDpn046hzDL3Hj0IzeSGJG6er/gdke25Xi
   mNdWpkuab7KNiwExbQlYzG1TWpKXq2q32vtw+oyRY7GdgfbnFt4Fe7zLR
   cDkLq9qJYjV0EysfnpIuOMTi+6slCbDRjoEPMZ3peJg8oUMrlKM/XtpkX
   /xXlv3eKjsD0Pb0etRBI3K3xPiONleJvZn5H4qJZ+e1Qu26gE1byHgSjI
   A==;
X-CSE-ConnectionGUID: O+ZRUGxpRUu9ynMBjx3MjQ==
X-CSE-MsgGUID: qQq9FOQ0SDyc/Vy6Fv9upw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="64360784"
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="64360784"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 18:35:33 -0700
X-CSE-ConnectionGUID: 16dZC9jgQUWV+pRc7hvJ5A==
X-CSE-MsgGUID: /guOLHrLQzSj+azQgbLZbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="132023795"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Apr 2025 18:35:28 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7P1K-0001Sl-0X;
	Wed, 23 Apr 2025 01:35:26 +0000
Date: Wed, 23 Apr 2025 09:34:31 +0800
From: kernel test robot <lkp@intel.com>
To: Nylon Chen <nylon.chen@sifive.com>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, Nylon Chen <nylon.chen@sifive.com>,
	Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v12 4/5] pwm: sifive: Fix rounding issues in apply and
 get_state functions
Message-ID: <202504230904.kXJdvywR-lkp@intel.com>
References: <20250422085312.812877-5-nylon.chen@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250422085312.812877-5-nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_183539_363784_24546C3B 
X-CRM114-Status: GOOD (  20.48  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Nylon,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.15-rc3 next-20250422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nylon-Chen/riscv-dts=
-sifive-unleashed-unmatched-Remove-PWM-controlled-LED-s-active-low-properti=
es/20250422-165644
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
patch link:    https://lore.kernel.org/r/20250422085312.812877-5-nylon.chen=
%40sifive.com
patch subject: [PATCH v12 4/5] pwm: sifive: Fix rounding issues in apply an=
d get_state functions
config: csky-randconfig-001-20250423 (https://download.01.org/0day-ci/archi=
ve/20250423/202504230904.kXJdvywR-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.3.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250423/202504230904.kXJdvywR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504230904.kXJdvywR-lkp@i=
ntel.com/

All error/warnings (new ones prefixed by >>):

   drivers/pwm/pwm-sifive.c: In function 'pwm_sifive_apply':
>> drivers/pwm/pwm-sifive.c:351:26: error: unterminated argument list invok=
ing macro "do_div"
     351 | MODULE_LICENSE("GPL v2");
         |                          ^
>> drivers/pwm/pwm-sifive.c:161:9: error: 'do_div' undeclared (first use in=
 this function)
     161 |         do_div(frac, state->period;
         |         ^~~~~~
   drivers/pwm/pwm-sifive.c:161:9: note: each undeclared identifier is repo=
rted only once for each function it appears in
>> drivers/pwm/pwm-sifive.c:161:15: error: expected ';' at end of input
     161 |         do_div(frac, state->period;
         |               ^
         |               ;
   ......
>> drivers/pwm/pwm-sifive.c:161:9: error: expected declaration or statement=
 at end of input
     161 |         do_div(frac, state->period;
         |         ^~~~~~
>> drivers/pwm/pwm-sifive.c:141:19: warning: unused variable 'inactive' [-W=
unused-variable]
     141 |         u32 frac, inactive;
         |                   ^~~~~~~~
>> drivers/pwm/pwm-sifive.c:141:13: warning: variable 'frac' set but not us=
ed [-Wunused-but-set-variable]
     141 |         u32 frac, inactive;
         |             ^~~~
>> drivers/pwm/pwm-sifive.c:140:13: warning: unused variable 'ret' [-Wunuse=
d-variable]
     140 |         int ret =3D 0;
         |             ^~~
>> drivers/pwm/pwm-sifive.c:139:14: warning: variable 'enabled' set but not=
 used [-Wunused-but-set-variable]
     139 |         bool enabled;
         |              ^~~~~~~
>> drivers/pwm/pwm-sifive.c:135:34: warning: unused variable 'ddata' [-Wunu=
sed-variable]
     135 |         struct pwm_sifive_ddata *ddata =3D pwm_sifive_chip_to_dd=
ata(chip);
         |                                  ^~~~~
   drivers/pwm/pwm-sifive.c: At top level:
>> drivers/pwm/pwm-sifive.c:132:12: warning: 'pwm_sifive_apply' defined but=
 not used [-Wunused-function]
     132 | static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_de=
vice *pwm,
         |            ^~~~~~~~~~~~~~~~
>> drivers/pwm/pwm-sifive.c:109:12: warning: 'pwm_sifive_get_state' defined=
 but not used [-Wunused-function]
     109 | static int pwm_sifive_get_state(struct pwm_chip *chip, struct pw=
m_device *pwm,
         |            ^~~~~~~~~~~~~~~~~~~~
>> drivers/pwm/pwm-sifive.c:81:13: warning: 'pwm_sifive_update_clock' defin=
ed but not used [-Wunused-function]
      81 | static void pwm_sifive_update_clock(struct pwm_sifive_ddata *dda=
ta,
         |             ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pwm/pwm-sifive.c:71:13: warning: 'pwm_sifive_free' defined but n=
ot used [-Wunused-function]
      71 | static void pwm_sifive_free(struct pwm_chip *chip, struct pwm_de=
vice *pwm)
         |             ^~~~~~~~~~~~~~~
>> drivers/pwm/pwm-sifive.c:60:12: warning: 'pwm_sifive_request' defined bu=
t not used [-Wunused-function]
      60 | static int pwm_sifive_request(struct pwm_chip *chip, struct pwm_=
device *pwm)
         |            ^~~~~~~~~~~~~~~~~~


vim +/do_div +351 drivers/pwm/pwm-sifive.c

9e37a53eb05114b Yash Shah            2019-06-11  131  =

9e37a53eb05114b Yash Shah            2019-06-11  132  static int pwm_sifive=
_apply(struct pwm_chip *chip, struct pwm_device *pwm,
71523d1812aca61 Uwe Kleine-K=F6nig     2019-08-24  133  			    const struct=
 pwm_state *state)
9e37a53eb05114b Yash Shah            2019-06-11  134  {
9e37a53eb05114b Yash Shah            2019-06-11  135  	struct pwm_sifive_dd=
ata *ddata =3D pwm_sifive_chip_to_ddata(chip);
9e37a53eb05114b Yash Shah            2019-06-11  136  	struct pwm_state cur=
_state;
9e37a53eb05114b Yash Shah            2019-06-11  137  	unsigned int duty_cy=
cle;
9e37a53eb05114b Yash Shah            2019-06-11  138  	unsigned long long n=
um;
9e37a53eb05114b Yash Shah            2019-06-11  139  	bool enabled;
9e37a53eb05114b Yash Shah            2019-06-11  140  	int ret =3D 0;
5bb4f54a7d6753d Nylon Chen           2025-04-22  141  	u32 frac, inactive;
9e37a53eb05114b Yash Shah            2019-06-11  142  =

5bb4f54a7d6753d Nylon Chen           2025-04-22  143  	if (state->polarity =
!=3D PWM_POLARITY_NORMAL)
9e37a53eb05114b Yash Shah            2019-06-11  144  		return -EINVAL;
9e37a53eb05114b Yash Shah            2019-06-11  145  =

9e37a53eb05114b Yash Shah            2019-06-11  146  	cur_state =3D pwm->s=
tate;
9e37a53eb05114b Yash Shah            2019-06-11  147  	enabled =3D cur_stat=
e.enabled;
9e37a53eb05114b Yash Shah            2019-06-11  148  =

9e37a53eb05114b Yash Shah            2019-06-11  149  	duty_cycle =3D state=
->duty_cycle;
9e37a53eb05114b Yash Shah            2019-06-11  150  	if (!state->enabled)
9e37a53eb05114b Yash Shah            2019-06-11  151  		duty_cycle =3D 0;
9e37a53eb05114b Yash Shah            2019-06-11  152  =

9e37a53eb05114b Yash Shah            2019-06-11  153  	/*
9e37a53eb05114b Yash Shah            2019-06-11  154  	 * The problem of ou=
tput producing mixed setting as mentioned at top,
9e37a53eb05114b Yash Shah            2019-06-11  155  	 * occurs here. To m=
inimize the window for this problem, we are
9e37a53eb05114b Yash Shah            2019-06-11  156  	 * calculating the r=
egister values first and then writing them
9e37a53eb05114b Yash Shah            2019-06-11  157  	 * consecutively
9e37a53eb05114b Yash Shah            2019-06-11  158  	 */
9e37a53eb05114b Yash Shah            2019-06-11  159  	num =3D (u64)duty_cy=
cle * (1U << PWM_SIFIVE_CMPWIDTH);
357da405567b634 Nylon Chen           2025-04-22  160  	frac =3D num;
357da405567b634 Nylon Chen           2025-04-22 @161  	do_div(frac, state->=
period;
5bb4f54a7d6753d Nylon Chen           2025-04-22  162  	/* The hardware cann=
ot generate a 0% duty cycle */
9e37a53eb05114b Yash Shah            2019-06-11  163  	frac =3D min(frac, (=
1U << PWM_SIFIVE_CMPWIDTH) - 1);
5bb4f54a7d6753d Nylon Chen           2025-04-22  164  	inactive =3D (1U << =
PWM_SIFIVE_CMPWIDTH) - 1 - frac;
9e37a53eb05114b Yash Shah            2019-06-11  165  =

0f02f491b786143 Uwe Kleine-K=F6nig     2022-07-21  166  	mutex_lock(&ddata-=
>lock);
9e37a53eb05114b Yash Shah            2019-06-11  167  	if (state->period !=
=3D ddata->approx_period) {
334c7b13d38321e Emil Renner Berthing 2022-11-09  168  		/*
334c7b13d38321e Emil Renner Berthing 2022-11-09  169  		 * Don't let a 2nd =
user change the period underneath the 1st user.
334c7b13d38321e Emil Renner Berthing 2022-11-09  170  		 * However if ddate=
->approx_period =3D=3D 0 this is the first time we set
334c7b13d38321e Emil Renner Berthing 2022-11-09  171  		 * any period, so l=
et whoever gets here first set the period so other
334c7b13d38321e Emil Renner Berthing 2022-11-09  172  		 * users who agree =
on the period won't fail.
334c7b13d38321e Emil Renner Berthing 2022-11-09  173  		 */
334c7b13d38321e Emil Renner Berthing 2022-11-09  174  		if (ddata->user_cou=
nt !=3D 1 && ddata->approx_period) {
0f02f491b786143 Uwe Kleine-K=F6nig     2022-07-21  175  			mutex_unlock(&dd=
ata->lock);
3586b02663f098a Uwe Kleine-K=F6nig     2022-07-21  176  			return -EBUSY;
9e37a53eb05114b Yash Shah            2019-06-11  177  		}
9e37a53eb05114b Yash Shah            2019-06-11  178  		ddata->approx_perio=
d =3D state->period;
9e37a53eb05114b Yash Shah            2019-06-11  179  		pwm_sifive_update_c=
lock(ddata, clk_get_rate(ddata->clk));
9e37a53eb05114b Yash Shah            2019-06-11  180  	}
0f02f491b786143 Uwe Kleine-K=F6nig     2022-07-21  181  	mutex_unlock(&ddat=
a->lock);
9e37a53eb05114b Yash Shah            2019-06-11  182  =

1695b421e1b587c Uwe Kleine-K=F6nig     2022-07-21  183  	/*
1695b421e1b587c Uwe Kleine-K=F6nig     2022-07-21  184  	 * If the PWM is e=
nabled the clk is already on. So only enable it
1695b421e1b587c Uwe Kleine-K=F6nig     2022-07-21  185  	 * conditionally t=
o have it on exactly once afterwards independent of
1695b421e1b587c Uwe Kleine-K=F6nig     2022-07-21  186  	 * the PWM state.
1695b421e1b587c Uwe Kleine-K=F6nig     2022-07-21  187  	 */
1695b421e1b587c Uwe Kleine-K=F6nig     2022-07-21  188  	if (!enabled) {
3586b02663f098a Uwe Kleine-K=F6nig     2022-07-21  189  		ret =3D clk_enabl=
e(ddata->clk);
3586b02663f098a Uwe Kleine-K=F6nig     2022-07-21  190  		if (ret) {
c4f4af7d792c74d Uwe Kleine-K=F6nig     2024-02-14  191  			dev_err(pwmchip_=
parent(chip), "Enable clk failed\n");
3586b02663f098a Uwe Kleine-K=F6nig     2022-07-21  192  			return ret;
3586b02663f098a Uwe Kleine-K=F6nig     2022-07-21  193  		}
1695b421e1b587c Uwe Kleine-K=F6nig     2022-07-21  194  	}
3586b02663f098a Uwe Kleine-K=F6nig     2022-07-21  195  =

5bb4f54a7d6753d Nylon Chen           2025-04-22  196  	writel(inactive, dda=
ta->regs + PWM_SIFIVE_PWMCMP(pwm->hwpwm));
9e37a53eb05114b Yash Shah            2019-06-11  197  =

1695b421e1b587c Uwe Kleine-K=F6nig     2022-07-21  198  	if (!state->enable=
d)
61180f68ad5b905 Uwe Kleine-K=F6nig     2022-07-21  199  		clk_disable(ddata=
->clk);
9e37a53eb05114b Yash Shah            2019-06-11  200  =

3586b02663f098a Uwe Kleine-K=F6nig     2022-07-21  201  	return 0;
9e37a53eb05114b Yash Shah            2019-06-11  202  }
9e37a53eb05114b Yash Shah            2019-06-11  203  =

9e37a53eb05114b Yash Shah            2019-06-11  204  static const struct p=
wm_ops pwm_sifive_ops =3D {
9e37a53eb05114b Yash Shah            2019-06-11  205  	.request =3D pwm_sif=
ive_request,
9e37a53eb05114b Yash Shah            2019-06-11  206  	.free =3D pwm_sifive=
_free,
9e37a53eb05114b Yash Shah            2019-06-11  207  	.get_state =3D pwm_s=
ifive_get_state,
9e37a53eb05114b Yash Shah            2019-06-11  208  	.apply =3D pwm_sifiv=
e_apply,
9e37a53eb05114b Yash Shah            2019-06-11  209  };
9e37a53eb05114b Yash Shah            2019-06-11  210  =

9e37a53eb05114b Yash Shah            2019-06-11  211  static int pwm_sifive=
_clock_notifier(struct notifier_block *nb,
9e37a53eb05114b Yash Shah            2019-06-11  212  				     unsigned lon=
g event, void *data)
9e37a53eb05114b Yash Shah            2019-06-11  213  {
9e37a53eb05114b Yash Shah            2019-06-11  214  	struct clk_notifier_=
data *ndata =3D data;
9e37a53eb05114b Yash Shah            2019-06-11  215  	struct pwm_sifive_dd=
ata *ddata =3D
9e37a53eb05114b Yash Shah            2019-06-11  216  		container_of(nb, st=
ruct pwm_sifive_ddata, notifier);
9e37a53eb05114b Yash Shah            2019-06-11  217  =

45558b3abb87eeb Uwe Kleine-K=F6nig     2022-12-02  218  	if (event =3D=3D P=
OST_RATE_CHANGE) {
45558b3abb87eeb Uwe Kleine-K=F6nig     2022-12-02  219  		mutex_lock(&ddata=
->lock);
9e37a53eb05114b Yash Shah            2019-06-11  220  		pwm_sifive_update_c=
lock(ddata, ndata->new_rate);
45558b3abb87eeb Uwe Kleine-K=F6nig     2022-12-02  221  		mutex_unlock(&dda=
ta->lock);
45558b3abb87eeb Uwe Kleine-K=F6nig     2022-12-02  222  	}
9e37a53eb05114b Yash Shah            2019-06-11  223  =

9e37a53eb05114b Yash Shah            2019-06-11  224  	return NOTIFY_OK;
9e37a53eb05114b Yash Shah            2019-06-11  225  }
9e37a53eb05114b Yash Shah            2019-06-11  226  =

9e37a53eb05114b Yash Shah            2019-06-11  227  static int pwm_sifive=
_probe(struct platform_device *pdev)
9e37a53eb05114b Yash Shah            2019-06-11  228  {
9e37a53eb05114b Yash Shah            2019-06-11  229  	struct device *dev =
=3D &pdev->dev;
9e37a53eb05114b Yash Shah            2019-06-11  230  	struct pwm_sifive_dd=
ata *ddata;
9e37a53eb05114b Yash Shah            2019-06-11  231  	struct pwm_chip *chi=
p;
9e37a53eb05114b Yash Shah            2019-06-11  232  	int ret;
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  233  	u32 val;
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  234  	unsigned int enabl=
ed_pwms =3D 0, enabled_clks =3D 1;
9e37a53eb05114b Yash Shah            2019-06-11  235  =

554d9acae42b3ee Uwe Kleine-K=F6nig     2024-02-14  236  	chip =3D devm_pwmc=
hip_alloc(dev, 4, sizeof(*ddata));
554d9acae42b3ee Uwe Kleine-K=F6nig     2024-02-14  237  	if (IS_ERR(chip))
554d9acae42b3ee Uwe Kleine-K=F6nig     2024-02-14  238  		return PTR_ERR(ch=
ip);
9e37a53eb05114b Yash Shah            2019-06-11  239  =

554d9acae42b3ee Uwe Kleine-K=F6nig     2024-02-14  240  	ddata =3D pwm_sifi=
ve_chip_to_ddata(chip);
554d9acae42b3ee Uwe Kleine-K=F6nig     2024-02-14  241  	ddata->parent =3D =
dev;
9e37a53eb05114b Yash Shah            2019-06-11  242  	mutex_init(&ddata->l=
ock);
9e37a53eb05114b Yash Shah            2019-06-11  243  	chip->ops =3D &pwm_s=
ifive_ops;
9e37a53eb05114b Yash Shah            2019-06-11  244  =

96cfceba3967198 Yangtao Li           2019-12-29  245  	ddata->regs =3D devm=
_platform_ioremap_resource(pdev, 0);
f6abac0379b8368 Ding Xiang           2019-07-18  246  	if (IS_ERR(ddata->re=
gs))
9e37a53eb05114b Yash Shah            2019-06-11  247  		return PTR_ERR(ddat=
a->regs);
9e37a53eb05114b Yash Shah            2019-06-11  248  =

55e644b840baf7a Uwe Kleine-K=F6nig     2023-04-18  249  	ddata->clk =3D dev=
m_clk_get_prepared(dev, NULL);
5530fcaf9ca30b8 Krzysztof Kozlowski  2020-08-26  250  	if (IS_ERR(ddata->cl=
k))
5530fcaf9ca30b8 Krzysztof Kozlowski  2020-08-26  251  		return dev_err_prob=
e(dev, PTR_ERR(ddata->clk),
5530fcaf9ca30b8 Krzysztof Kozlowski  2020-08-26  252  				     "Unable to f=
ind controller clock\n");
9e37a53eb05114b Yash Shah            2019-06-11  253  =

55e644b840baf7a Uwe Kleine-K=F6nig     2023-04-18  254  	ret =3D clk_enable=
(ddata->clk);
9e37a53eb05114b Yash Shah            2019-06-11  255  	if (ret) {
9e37a53eb05114b Yash Shah            2019-06-11  256  		dev_err(dev, "faile=
d to enable clock for pwm: %d\n", ret);
9e37a53eb05114b Yash Shah            2019-06-11  257  		return ret;
9e37a53eb05114b Yash Shah            2019-06-11  258  	}
9e37a53eb05114b Yash Shah            2019-06-11  259  =

ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  260  	val =3D readl(ddat=
a->regs + PWM_SIFIVE_PWMCFG);
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  261  	if (val & PWM_SIFI=
VE_PWMCFG_EN_ALWAYS) {
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  262  		unsigned int i;
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  263  =

ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  264  		for (i =3D 0; i <=
 chip->npwm; ++i) {
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  265  			val =3D readl(dd=
ata->regs + PWM_SIFIVE_PWMCMP(i));
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  266  			if (val > 0)
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  267  				++enabled_pwms;
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  268  		}
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  269  	}
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  270  =

ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  271  	/* The clk should =
be on once for each running PWM. */
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  272  	if (enabled_pwms) {
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  273  		while (enabled_cl=
ks < enabled_pwms) {
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  274  			/* This is not e=
xpected to fail as the clk is already on */
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  275  			ret =3D clk_enab=
le(ddata->clk);
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  276  			if (unlikely(ret=
)) {
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  277  				dev_err_probe(d=
ev, ret, "Failed to enable clk\n");
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  278  				goto disable_cl=
k;
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  279  			}
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  280  			++enabled_clks;
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  281  		}
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  282  	} else {
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  283  		clk_disable(ddata=
->clk);
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  284  		enabled_clks =3D =
0;
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  285  	}
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  286  =

9e37a53eb05114b Yash Shah            2019-06-11  287  	/* Watch for changes=
 to underlying clock frequency */
9e37a53eb05114b Yash Shah            2019-06-11  288  	ddata->notifier.noti=
fier_call =3D pwm_sifive_clock_notifier;
9e37a53eb05114b Yash Shah            2019-06-11  289  	ret =3D clk_notifier=
_register(ddata->clk, &ddata->notifier);
9e37a53eb05114b Yash Shah            2019-06-11  290  	if (ret) {
9e37a53eb05114b Yash Shah            2019-06-11  291  		dev_err(dev, "faile=
d to register clock notifier: %d\n", ret);
9e37a53eb05114b Yash Shah            2019-06-11  292  		goto disable_clk;
9e37a53eb05114b Yash Shah            2019-06-11  293  	}
9e37a53eb05114b Yash Shah            2019-06-11  294  =

9e37a53eb05114b Yash Shah            2019-06-11  295  	ret =3D pwmchip_add(=
chip);
9e37a53eb05114b Yash Shah            2019-06-11  296  	if (ret < 0) {
9e37a53eb05114b Yash Shah            2019-06-11  297  		dev_err(dev, "canno=
t register PWM: %d\n", ret);
9e37a53eb05114b Yash Shah            2019-06-11  298  		goto unregister_clk;
9e37a53eb05114b Yash Shah            2019-06-11  299  	}
9e37a53eb05114b Yash Shah            2019-06-11  300  =

bb472da2148f39b Uwe Kleine-K=F6nig     2024-02-14  301  	platform_set_drvda=
ta(pdev, chip);
9e37a53eb05114b Yash Shah            2019-06-11  302  	dev_dbg(dev, "SiFive=
 PWM chip registered %d PWMs\n", chip->npwm);
9e37a53eb05114b Yash Shah            2019-06-11  303  =

9e37a53eb05114b Yash Shah            2019-06-11  304  	return 0;
9e37a53eb05114b Yash Shah            2019-06-11  305  =

9e37a53eb05114b Yash Shah            2019-06-11  306  unregister_clk:
9e37a53eb05114b Yash Shah            2019-06-11  307  	clk_notifier_unregis=
ter(ddata->clk, &ddata->notifier);
9e37a53eb05114b Yash Shah            2019-06-11  308  disable_clk:
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  309  	while (enabled_clk=
s) {
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  310  		clk_disable(ddata=
->clk);
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  311  		--enabled_clks;
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  312  	}
9e37a53eb05114b Yash Shah            2019-06-11  313  =

9e37a53eb05114b Yash Shah            2019-06-11  314  	return ret;
9e37a53eb05114b Yash Shah            2019-06-11  315  }
9e37a53eb05114b Yash Shah            2019-06-11  316  =

533d29471b3c940 Uwe Kleine-K=F6nig     2023-03-03  317  static void pwm_sif=
ive_remove(struct platform_device *dev)
9e37a53eb05114b Yash Shah            2019-06-11  318  {
bb472da2148f39b Uwe Kleine-K=F6nig     2024-02-14  319  	struct pwm_chip *c=
hip =3D platform_get_drvdata(dev);
bb472da2148f39b Uwe Kleine-K=F6nig     2024-02-14  320  	struct pwm_sifive_=
ddata *ddata =3D pwm_sifive_chip_to_ddata(chip);
9e37a53eb05114b Yash Shah            2019-06-11  321  	struct pwm_device *p=
wm;
ceb2c2842f3664d Uwe Kleine-K=F6nig     2021-07-07  322  	int ch;
9e37a53eb05114b Yash Shah            2019-06-11  323  =

bb472da2148f39b Uwe Kleine-K=F6nig     2024-02-14  324  	pwmchip_remove(chi=
p);
2375e964d541bb0 Uwe Kleine-K=F6nig     2022-07-21  325  	clk_notifier_unreg=
ister(ddata->clk, &ddata->notifier);
2375e964d541bb0 Uwe Kleine-K=F6nig     2022-07-21  326  =

bb472da2148f39b Uwe Kleine-K=F6nig     2024-02-14  327  	for (ch =3D 0; ch =
< chip->npwm; ch++) {
bb472da2148f39b Uwe Kleine-K=F6nig     2024-02-14  328  		pwm =3D &chip->pw=
ms[ch];
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  329  		if (pwm->state.en=
abled)
9e37a53eb05114b Yash Shah            2019-06-11  330  			clk_disable(ddata-=
>clk);
ace41d7564e655c Uwe Kleine-K=F6nig     2022-07-21  331  	}
9e37a53eb05114b Yash Shah            2019-06-11  332  }
9e37a53eb05114b Yash Shah            2019-06-11  333  =

9e37a53eb05114b Yash Shah            2019-06-11  334  static const struct o=
f_device_id pwm_sifive_of_match[] =3D {
9e37a53eb05114b Yash Shah            2019-06-11  335  	{ .compatible =3D "s=
ifive,pwm0" },
9e37a53eb05114b Yash Shah            2019-06-11  336  	{},
9e37a53eb05114b Yash Shah            2019-06-11  337  };
9e37a53eb05114b Yash Shah            2019-06-11  338  MODULE_DEVICE_TABLE(o=
f, pwm_sifive_of_match);
9e37a53eb05114b Yash Shah            2019-06-11  339  =

9e37a53eb05114b Yash Shah            2019-06-11  340  static struct platfor=
m_driver pwm_sifive_driver =3D {
9e37a53eb05114b Yash Shah            2019-06-11  341  	.probe =3D pwm_sifiv=
e_probe,
8db7fdffaaf6cc9 Uwe Kleine-K=F6nig     2024-09-09  342  	.remove =3D pwm_si=
five_remove,
9e37a53eb05114b Yash Shah            2019-06-11  343  	.driver =3D {
9e37a53eb05114b Yash Shah            2019-06-11  344  		.name =3D "pwm-sifi=
ve",
9e37a53eb05114b Yash Shah            2019-06-11  345  		.of_match_table =3D=
 pwm_sifive_of_match,
9e37a53eb05114b Yash Shah            2019-06-11  346  	},
9e37a53eb05114b Yash Shah            2019-06-11  347  };
9e37a53eb05114b Yash Shah            2019-06-11  348  module_platform_drive=
r(pwm_sifive_driver);
9e37a53eb05114b Yash Shah            2019-06-11  349  =

9e37a53eb05114b Yash Shah            2019-06-11  350  MODULE_DESCRIPTION("S=
iFive PWM driver");
9e37a53eb05114b Yash Shah            2019-06-11 @351  MODULE_LICENSE("GPL v=
2");

-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
