Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B93C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 23:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pwyNjUkxYl9xZ8JvpiyQZzI/IYZ9m8cAaZy4pZIFxDk=; b=RwjFkqJumcz6fT
	RWKVOIwcKOfOHCg11YkCbONfZbq0YWaIPTU5v0b20Nc0rnE/E/N7MdHKvsnh3hU4DMG4fe4Z3ILAf
	xRynox4MFumuwC1rFo4y4a6FYK6RM6sdsJxTG351TFEcgrJ0BVo1wXD295BPiwzr6thmtBQFm1/7L
	fEY+O9W698IVrAl0BEh5z74noXuIIPYWK1Kgyw4ZbD7ppBWeOXtKNujgfjLE3UrYP1GO2+XvOBx0I
	E81nMNEuJUWeRtsA4MuLqbnllJ4IZTe0/bXezjsJTAJxbC+8aU6G7K2RQHV8w985Zvx0gLQ29OhRm
	f0znFRLYw0A1jAZ305EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhJJk-00Annv-2n; Wed, 20 Apr 2022 23:01:00 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhJJa-00Anlb-1a
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 23:00:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650495649; x=1682031649;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=S3wrcHUGdl9LcKznCHJjFCjAB1oU2LwvM5QjcZA34fY=;
 b=aaMpig3V0AQFRjEzKlg48BxoJQw+GESBf9BdgszUyTT1PQWGCdho4BH0
 iEUYj2vz4Hg0On1WZk/KwK7hzdfb77Q1s7jK3mooJSJabZQJLWA8tSQSf
 LaL6xK1VsVJLedl4KyI/pqETMKydmSGiRcPR+5GvClEdjJBYK0khkjhS8
 6fK1VnzYDuMEkdEHD5T1Ub9hLToQgKvw8Z2p7zninsHFVG0MRDrBCW66X
 cXrGEnQ9gnba4FxjzBw5Zg63WDaFavLiM8C1Zi+4IJeSFZodtSETt7CFd
 i1JcMn0pK+rPpdoUIjP8VvgCYVEsPoi4ShWLZv4qzL3Ywvs6+f9HPiH2q Q==;
X-IronPort-AV: E=Sophos;i="5.90,276,1643644800"; d="scan'208";a="310377890"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 07:00:44 +0800
IronPort-SDR: tZcRqGuN3cY9/ZdaxbG9vEFN3Ox6RLUoFeTr75sKyHo8uC2q+qCRAjJDODRgCu/YN38Qe6zCVy
 AlS2hR4arw2Uca30jrBtRy2OcEZyKAU8OIL5lahCs5EiQtpWNAhL8z2Jeesd0qL5mPavxOhUof
 k11fYkzugxFC0PRr0e5WcEWU+TJpG+F0B3o6K4RgRh+BKcpshTySKw+RvcEMqCI4SIrKCNRzuq
 lD1AqnTeVueRN7lOd0noG/gWOKQoglNnS/aUt013Rjig4++Vq+IHo83mzqACgWE6HzGZmbtpea
 a8zau4REcgA5jYHUxVfso/Ob
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 15:31:02 -0700
IronPort-SDR: xQ2a5d76O4Mf1H/PWk9PFrG8Am9Wm4vldQVkoZ7uaPilLGT6AwIdUTe3D/60HCsqjAEOQLzDZO
 hoSrVKfEVnG4zZKdOboqA+gxEISac+KQnju1S3eM86QSgO0H3knlp94TiCtrZo4y0b/pz+eHLx
 hyXUwl4JMmpHPL0HIv+naBvpVgtQa1zmQjJWukVLdkLuYhhPKRRY6C5SmS+u+s4pdZWi1RZmog
 /ATrfpIGNbiVWUV83RmV5LNRVwxzyvS+QLsstl6I+93hbuwaRba+ST6tnDAMdUctps/vj9C1X+
 mlQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 16:00:45 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkGNr4sn1z1SHwl
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 16:00:44 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1650495643; x=1653087644; bh=S3wrcHUGdl9LcKznCHJjFCjAB1oU2LwvM5Q
 jcZA34fY=; b=D2NS7tuk1+iRdP2LXEmtP9/6hn5ZwQNV8bhVAXHTm6qx3RZWyL5
 c6jousROa5m5iDPz8KDFGCCqKUQ14/8fXxb+x5u4wqoE3FKSjF+IWh2fzArJDGlV
 kMXNdZ+1bffcohH0WCo3xmyWq10jH8WKZiiMcbDew14H68pdOjH/l9dBXXQK7cp7
 2qRoMSDlhBuTMnFp12RR8hWOc8ro6TqIrFTwNh/5ewrdZ40NPlO35+HNySdfJD5t
 X2iefhTMwwiq2uiGXQOqpmYE8heVo/dam/Wd9BPmhLhdH3v2+kulsKEIZ/XInTdm
 pGPF6aGbXgmmA+zSgg/E4dJvjGh1pWJXsLw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id JTz9KjloVwFA for <linux-riscv@lists.infradead.org>;
 Wed, 20 Apr 2022 16:00:43 -0700 (PDT)
Received: from [10.225.163.14] (unknown [10.225.163.14])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkGNl5hPQz1Rvlx;
 Wed, 20 Apr 2022 16:00:39 -0700 (PDT)
Message-ID: <ff01a3d8-3248-b0cb-2276-6438b995dfea@opensource.wdc.com>
Date: Thu, 21 Apr 2022 08:00:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] binfmt_flat: Remove shared library support
Content-Language: en-US
To: Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <keescook@chromium.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Eric W . Biederman" <ebiederm@xmission.com>, Niklas.Cassel@wdc.com,
 Al Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Mike Frysinger <vapier@gentoo.org>,
 "# 3.4.x" <stable@vger.kernel.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, linux-arch <linux-arch@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
References: <87levzzts4.fsf_-_@email.froward.int.ebiederm.org>
 <mhng-32cab6aa-87a3-4a5c-bf83-836c25432fdd@palmer-ri-x1c9>
 <20220420165935.GA12207@brightrain.aerifal.cx>
 <202204201044.ACFEB0C@keescook>
 <CAK8P3a2KvK78bbW_5DWKsrxLvKxYDqoCkii-kxi-mB7W9DCvNA@mail.gmail.com>
 <20220420202321.GD7074@brightrain.aerifal.cx>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220420202321.GD7074@brightrain.aerifal.cx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_160050_101601_6C8C1838 
X-CRM114-Status: GOOD (  16.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/21/22 05:23, Rich Felker wrote:
> On Wed, Apr 20, 2022 at 10:04:32PM +0200, Arnd Bergmann wrote:
>> On Wed, Apr 20, 2022 at 7:47 PM Kees Cook <keescook@chromium.org> wrote:
>>>
>>> Yeah, I was trying to understand why systems were using binfmt_flat and
>>> not binfmt_elf, given the mention of elf2flat -- is there really such a
>>> large kernel memory footprint savings to be had from removing
>>> binfmt_elf?
>>
>> I think the main reason for using flat binaries is nommu support on
>> m68k, xtensa and risc-v. The regular binfmt_elf support requires
>> an MMU, and the elf-fdpic variant is only available for arm and sh
>> at this point (the other nommu architectures got removed over time).
> 
> I believe I made the elf-fdpic loader so that it's capable of loading
> normal non-fdpic elf files on nommu (1bde925d23), unless somebody
> broke that. I also seem to recall that capability being added to the
> main elf loader later.

Last time I checked, building shared libraries usable with nommu riscv
required gcc/ld options that were not supported for riscv (PIE related
stuff). So removing the kernel support for shared flat libs is fine with me.


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
