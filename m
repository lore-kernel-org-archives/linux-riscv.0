Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906D2606A334
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 07:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Up7TB9mD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aQ5B1k9w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iOrTnlIVTbhFSBI32lK/CTWjsVlPE/GW2LOAZuRv3bs=; b=Up7TB9mDJ4RQjc2zh6MhgAX8bb
	hHsIoY79APURBcRnIJe3igSNK8fT07rEIfwqqaPyghxqJPXthfYaDbdOCBA76HuuA9/fRCEea6utH
	Gn01hmIEyw7OYy4rozAEWJw5ZdBVilDVNeFHL2kXgNj+TaW6n2C9D96fQtGoaOeYJEdyCTeO2nz3N
	7gUGwEQGWl0AUL9yv8FFTTy5GAVf0ubiPvyLACv0FGQL/c2Iu8XXDL4WwxW5d3FxKIYa6/KSAVezg
	cCeqsg7sueCaBhdoI0dZmO29yHoXyTlEv4P7I8kRbrE90lK1KGIQstC4gTJQAgvLwf/Jb0sXs/qGd
	VCSQqS9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7oN-00000008wnm-0klP;
	Wed, 25 Nov 2026 07:53:03 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7oK-00000008wmc-3UQu
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 07:53:02 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6b87a240de3so6771284a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 23:52:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795593178; cv=none;
        d=google.com; s=arc-20260327;
        b=dvqZtNkomSH76qwrpWqrsQqDTaUkf5l/4/+2ucp7eD3qJ68aGLhZNF3cF8RxP+iciU
         /+3S2LRXk7yzZa2CGLk7CEwdcv1hTQvEM9zMHkVxTHDna7hw2eBRaSdwlG3tcMTLh/Gm
         xH51Rvn4nYZeEFkpIsnlikaxWp1eSj+FAM9bLjl0714fILE67fqUmbSDeeWDtCGW1mol
         9dP3/wRlnBp7C/uzsoWMBbu2Yo/8DuCddGQJuIiMa/NkKp9+xDw4zCly0nTqDB0y0sHN
         S5/PFt4FZgugkBqdr2bCMy3Vq7BOyYclQr8IVeDnWMCBa1eS4iMijIX8qZTXqkw7o90H
         L/JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KSGHti+DBG58dWZXRAMCvoWIexuD6kTB1LwSNHMxBG8=;
        fh=2NS4+3H8iwipQPUkbmyj51Vd4loIzUjaKoFx3NpwOv8=;
        b=GLdS32dqplrWVOfDAfqk+1xldKkWWhyOEB0SH+/RlKNFhm5RYTsViHziwup7r/wj9A
         HXnNJJiVX0oND9rmydG6ASDTp2drDrcf+WY8BMPoUkaDgTrt/jwDW5uuMIk7Ndz7/SD2
         Jf9DymxDUj81IlNsWH1vbTJRIa5lYQjMStR/tTshVPWHbJtXQN4HqdG83f47K5gbZjZm
         RFh3+ocy68WJo79kmRgcevnd55+ZDBHCGUZdIxsIoDx8raNHdLDBoN+qU/C1+cKzpi7T
         8AX5AMFK8sSrNp4jNZi/SH1/e/6twgKFblBl3TBZIxgRvEwIVoUszdDEhAdPsDt8jH8f
         fwDg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593178; x=1796197978; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KSGHti+DBG58dWZXRAMCvoWIexuD6kTB1LwSNHMxBG8=;
        b=aQ5B1k9wxJHBliiRHIV/9dDN3bmJWxMZ7YboxFUFhUXZp5K9dSLwrWkGosrLTEOLSD
         Fdcn/br5NkKkq+9VM0tIfGkpeKYKpTygCKHN18+NBLCSo01sWCBxRIYZnRnx3SGxsjzB
         DhvAW+feCFI7ZJ/3JCTDB2Wt6yswa7pit7OmGSX/8ccKbKRFazWyc6hzYi7bDk9tNk3A
         6gPfvIy3wyBjOGrODeFpnaHyyT4mfrLv8F6R/pkWVS3cFz83+gaJvdiffWHhmoW0qI/6
         2p+hVLgPoCpAf50VFurZBoISLtvcT4yhXOsK0m0wMOuxTp6jWaRhcV1srtjkgFyrzJer
         9/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593178; x=1796197978;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KSGHti+DBG58dWZXRAMCvoWIexuD6kTB1LwSNHMxBG8=;
        b=NWwwdYGCVVTUvF/0nf9ieVytlZ5cqqd6L8QLkU5wFeyCZMRM5E6elpjvSOECSGI3iF
         v4kCGOsBizVjSdWPCJMCD7DlApB+JonSj8hIiMINSJgkHg7HIWt2sutVgfdt4jqkl/9Z
         uBmSX6jaCzkFolGM7aV5dPc70X/r5VxkGjTSGdZbMgVE31YrzKUhQoVMHH92/8zvVO7K
         wfs0I1fYA32YKwfZtzQcxl8/oOyemOmk8jehJFSXIHzhwxsa6Sj5R7uE4q79VIv2+mLl
         LGwuWl9CmkcFGkPBmt8Bv8MpOZFaaVT5mNwG1cuy64guOsXGrJi3orgtzj99qO5trjxr
         E6wA==
X-Forwarded-Encrypted: i=1; AL+hErE53xLCu0222AlvS7BAPeoHy2LhupXzFO/dsYQcChrt5z49ZBJVx/qDmrZYFTp+K4b/Ytfzmc7SksLstg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9rRarX65biqsx7k+vKQ8qqoMpXhJdNB9ynqORaYmRp8nnUCusU
	pzSaOvY89VOxhy07EngxcB/r6xdoz/15MwTgJp3zQqFF3i2wEWVOfMLN+e/YHkbY8jMU9zANn+A
	26UpukeHWjdoP58+6sdlFzFK3Gm1gF0I=
X-Gm-Gg: AZFdTZej/+rj3APa7Jc9REfzVWbk/k2wRPH+uEg07L84am7ao22XHBGmW0A6l2yjanX
	/X8RY++bTb5DR8XL/HgCaL8/uEmrofgdTB5DIHvG5yB2FqDWYG3nM+Ao+KjecKF0nToi81FSinK
	jmt6e0O67AHz52sa1mlzroWQ92JoMhOohxzzKIJAkY5+SQq9xjsWkRwo7eMvqVEmU3d+Kr/WdTZ
	t7bOEDCeLxveAeIJ4uHuoP9tqpD1K33w+vd494w52ThAl5GrsSo/mmtH/RStSmQVNnhdL2jFSEg
	l2tr5h5eq/1yr8eSepgedPuzZ8KpHJS8xh9eIEeFlEADwzS/YWoVgtPWE7RDzv1sOvJ0YiuxW5T
	d3usoazNBShmxdIyvuE6JQ7XlGxQ0/KUSySU=
X-Received: by 2002:aa7:c0c5:0:b0:6b6:4dcd:9677 with SMTP id
 4fb4d7f45d1cf-6ba37d62867mr9467600a12.14.1795593178308; Tue, 24 Nov 2026
 23:52:58 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
 <awS2-clBenE1r1a1@aurel32.net> <12933da0-9bc8-4f92-96d4-36c5673d3f5e@gmail.com>
 <awXUSuYOUQMPCl-5@aurel32.net>
In-Reply-To: <awXUSuYOUQMPCl-5@aurel32.net>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 25 Nov 2026 13:22:44 +0530
X-Gm-Features: Aa3M54q54Z3pQu7569lgjovS1EclOCcqRbeez4LQayhOiQc7wEhf9EIuKCN7Gzs
Message-ID: <CANAwSgRf0XpWnyDaoiGySFv3NPKCBYn6BODf1M+P4w58BF-duw@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: Zixian Zeng <sycamoremoon376@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Junhui Liu <junhui.liu@pigmoral.tech>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_235300_896853_219ED453 
X-CRM114-Status: GOOD (  32.59  )
X-Spam-Score: -1.1 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Aurelien,

On Wed, 25 Nov 2026 at 00:14, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi Zixian,
>
> On 2026-11-24 11:31, Zixian Zeng wrote:
> > Hi Aurelien,
> >
> > On 2026/11/24 5:58, Aurelien Jarno wrote:
> > > Hi,
> > >
> > > On 2026-11-23 12:41, Zixian Zeng wrote:
> > > > The bananapi-f3 carries an AT24C02 compatible EEPROM GT24C02B [1]:
> > > > 256 bytes with an 8-byte write page, which can be found in schematic[2].
> > > > The device tree declares pagesize = <16>, which does not match the
> > > > eeprom chip datasheet which declares pagesize 8 bytes.
> > >
> > > Oops, I am not sure how I got that wrong. Sorry about that.
>
> The question of the page size has been raised in the initial review [1],
> and it seems that the GT24C02 has a 16-byte page size, while the
> GT24C02B [2] has a 8-byte page size. The BPI-F3 schematics confirms that
> the B version is used. Sorry about the mistake.
>
> > > > EEPROM pagesize of k1-bananapi-cm6-io[3] and k1-orangepi-rv2[4] changed
> > > > together, based on the chip model shown in the schematic diagram.
> > >
> > > The k1-milkv-jupiter board is also affected with the same issue, despite
> > > using a slightly different EEPROM (24C04).
> > >
> >
> > The GT24C04A EEPROM used on k1-milkv-jupiter board doesn't seem to have
> > the same issue, which you can find "Page Size: 16 bytes" in datasheet:
> > https://www.giantec-semi.com/uploads/20220929/GT24C04A.pdf
>
> Indeed you are correct, and I confirm that this is the exact version
> used on the schematics. Therefore there is no need to extend your patch,
> it can be merged that way.
>
> > But I don't have the board, simple test would be appreciated. Perhaps I
> > should include test steps in the commit message for the next revision.
>
> Unfortunately the board has the EEPROM write protection pin connected to
> VCC, which means the write protection is enabled. Therefore testing is
> not so easy.
>
> Regards
> Aurelien
>
> [1] https://lore.kernel.org/linux-riscv/aNLzRJcKCYOngc7z@aurel32.net/
> [2] https://www.giantec-semi.com/juchen1123/uploads/pdf/GT24C02_DS_Au.pdf
>
Apologies, this is a different issue.

I am currently working on enabling multi-DTB support in U-Boot SPL
for SpacemiT K1 boards.

While investigating the board detection issue, I noticed that the EEPROM
on my Banana Pi BPI-F3 does not contain a Product Name TLV entry.

alarm@k1:~$ sudo hexdump -C /sys/bus/i2c/devices/2-0050/eeprom
00000000  54 6c 76 49 6e 66 6f 00  01 00 20 24 06 fe fe fe  |TlvInfo... $....|
00000010  d5 52 bd 2a 02 00 02 23  0c 39 38 61 39 63 33 61  |.R.*...#.98a9c3a|
00000020  32 62 64 34 37 fe 04 3b  e3 ff bd ff ff ff ff ff  |2bd47..;........|
00000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
*
00000100

Although the EEPROM is readable, the missing Product Name TLV entry
explains why read_product_name() returns `-ENOENT` (-2), assuming the
EEPROM read and validation succeed.

Consequently, automatic board detection fails, and U-Boot falls back to
CONFIG_DEFAULT_DEVICE_TREE, which may select an incorrect device
tree for the target board.

Since the SD card-detect GPIO polarity differs between the Banana Pi BPI-F3
and MusePi Pro, selecting the incorrect device tree can result in SD
card detection
and boot failures.

The following SPL boot log shows the board detection failure, although
DDR initialization completes successfully:

```
U-Boot SPL 2026.10-01060-gf3080abcfe92-dirty (Oct 24 2026 - 17:30:03 +0530)
Fail to detect board:-2
vdd_core, value:900000
vdd_1v8, value:1800000
vdd_1v8_mmc, value:1800000
DDR firmware: [0xc0820900]:0xf0227179, size:0x8d98
DDR is ready
```
Could you please confirm whether the Product Name TLV entry is
expected to be programmed into the EEPROM during manufacturing?

Also, is there a recommended approach for handling boards with missing
product information in the EEPROM to ensure reliable automatic device
tree selection?

> --
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
>
Thanks
-Anand

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
