Return-Path: <SRS0=GYez=4H=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F168C761A1
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2020 22:28:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 030D02469A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2020 22:28:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H89R0R52";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJV18g7W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 030D02469A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tlBM9nKY6dJReZldQlfzrMhiVFEJ4FTeKjBA3BVRPGA=; b=H89R0R52jfUHuq
	AnXjOP5g0JCKJBerd9I1OglYjcz/WKbavE3xnzdoNNDfmpq0DLKNgxLE8HOpO7QcpNOCMqOH5RnDq
	KJsjd4cD9qaQcl4uo0G4Ezfsu5S+/S0/2w4q+lRxzvP0UQN5gjWca1NmC7cjobCy/N7yZPqqdSUk8
	11D43Lwf8xMEqDd0lQAFbZLZYjBH1jd6iSU3M59kmjlNE9eXoPLu7kWzK+kPzVBSx/LTvVq3m6OV3
	7AzDgbiUlOOa991eg+gnn1KF48t3C8aazXKFNHTf+j1UNoy1dmcY8QJr6TsX+YBNmpJSnBcQ4DHBH
	mhk91l+1eAoCJ1zBWtTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4XpE-0000ts-Dq; Wed, 19 Feb 2020 22:28:12 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4XpB-0000tW-7o
 for linux-riscv@lists.infradead.org; Wed, 19 Feb 2020 22:28:10 +0000
Received: by mail-qt1-x842.google.com with SMTP id i14so1451010qtv.13
 for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2020 14:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tlBM9nKY6dJReZldQlfzrMhiVFEJ4FTeKjBA3BVRPGA=;
 b=ZJV18g7W7K/uquJ8RQ2Ytbo/TUbDTq34PFoYDMhO5pstZs0HLM2t9mV8rU+57xVbon
 +SDuwcANKUTCX/Y9VR1kwZiEWl2tWQgrS3vxycfxpFI830VHSlir4nM4S2xOZiIG3cxY
 VUJ6TrEVbek/p9LHjbMW1tZqq9a/Q+UO20LVYVl4huDM7FTP3fQZOg5Ugn1r1ZNjM6bE
 zqAeJimcoRGIX72eV/9JnhV/BihzdA3xmm31FCwSRfPWg7vp5T8zIqmgsnXFV6WjuuAq
 NrobMxBaEEu2ePdk7gyue1zVi6w9XdufypAcxZ+ihdqF4j9e73w5qd1Z6Iwit7+ME5vb
 0iPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tlBM9nKY6dJReZldQlfzrMhiVFEJ4FTeKjBA3BVRPGA=;
 b=d3PXeoQ1jVXU7DbeMICv1q+HEfJG8iZPL8dgrXFUk/mL71QZZwpS5MhF9eSthm2Z7e
 xxFa8Mn7iT7ut3mTJpe+tqbWaoncGqInyGg/kTxg/GUQYX6yZBjfTN+EhG8cZvyUfDeO
 dQLZHyL32MQu9793znL2wR9ZrDIykJiov28/4qLLBHTI4fjbidznrST3csPmPCm1qRsH
 I6ygG2Xc6rHaepHBJTniNU2G45dC5SRt2n8z1u0JY44HkFncnM9dFwxpxg7YDvdU1uHU
 cIB5uX0j53FY/2aqn2i3TBm5WOMXS45xIDIhF5X5iA+KwGkN0Em4/2J4X0M84NqS1UT1
 E3mQ==
X-Gm-Message-State: APjAAAWIMOnvLwIHLgKF/QRQanL1Gi65MnkR8cPklk5/95icSJ7fGOdn
 dXKbcwgjnZBF7m/RfKvrTeM=
X-Google-Smtp-Source: APXvYqzhOEp6jPa66kkaGxjJLjDwYrKNEkCzMvhIrF/Rlso30C+XQwwvI0+VJyRltEI29Ii093fS4w==
X-Received: by 2002:ac8:6f22:: with SMTP id i2mr24684286qtv.350.1582151286234; 
 Wed, 19 Feb 2020 14:28:06 -0800 (PST)
Received: from [192.168.1.117] ([75.102.135.197])
 by smtp.googlemail.com with ESMTPSA id t2sm579123qkc.62.2020.02.19.14.28.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2020 14:28:05 -0800 (PST)
Subject: Re: [PATCH 08/10] riscv: Add Kendryte K210 device tree
To: "Wladimir J. van der Laan" <laanwj@gmail.com>,
 Carlos Eduardo de Paula <me@carlosedp.com>
References: <20200212103432.660256-9-damien.lemoal@wdc.com>
 <48e10b3d-12f3-a65c-8017-99c780c63040@gmail.com>
 <BYAPR04MB581671F46D3FE67FD3C8B2B7E7140@BYAPR04MB5816.namprd04.prod.outlook.com>
 <bd74c841-2447-2f11-f924-a501230b3927@gmail.com>
 <BYAPR04MB5816ED294439828E562EB085E7140@BYAPR04MB5816.namprd04.prod.outlook.com>
 <CADnnUqe3AbTStJg9LS4qupH-OnBDGjuEFbnX8EXW8MUr4kwoGQ@mail.gmail.com>
 <19e78a77-4b7f-a057-eb6e-7384f3fc67c1@gmail.com>
 <CADnnUqfSq5sNXMQLktU0R_XLvYrf00nqMG5UPkTwaeL-Cy1m_A@mail.gmail.com>
 <8108cb8e-a909-24b0-f1c4-24a5bebf4e65@gmail.com>
 <CADnnUqenadntSrngNGjnu40inxZWK1Nm3T64BnyY114hEwC_Og@mail.gmail.com>
 <20200219090612.7onbaoygy6waumnw@aurora.visucore.com>
From: Sean Anderson <seanga2@gmail.com>
Autocrypt: addr=seanga2@gmail.com; prefer-encrypt=mutual; keydata=
 mQENBFe74PkBCACoLC5Zq2gwrDcCkr+EPGsT14bsxrW07GiYzQhLCgwnPdEpgU95pXltbFhw
 46GfyffABWxHKO2x+3L1S6ZxC5AiKbYXo7lpnTBYjamPWYouz+VJEVjUx9aaSEByBah5kX6a
 lKFZWNbXLAJh+dE1HFaMi3TQXXaInaREc+aO1F7fCa2zNE75ja+6ah8L4TPRFZ2HKQzve0/Y
 GXtoRw97qmnm3U36vKWT/m2AiLF619F4T1mHvlfjyd9hrVwjH5h/2rFyroXVXBZHGA9Aj8eN
 F2si35dWSZlIwXkNu9bXp0/pIu6FD0bI+BEkD5S7aH1G1iAcMFi5Qq2RNa041DfQSDDHABEB
 AAG0K1NlYW4gR2FsbGFnaGVyIEFuZGVyc29uIDxzZWFuZ2EyQGdtYWlsLmNvbT6JAVcEEwEK
 AEECGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4ACGQEWIQSQYR1bzo1I0gPoYCg+6I/stKEQ
 bgUCXT+S2AUJB2TlXwAKCRA+6I/stKEQbhNOB/9ooea0hU9Sgh7PBloU6CgaC5mlqPLB7NTp
 +JkB+nh3Fqhk+qLZwzEynnuDLl6ESpVHIc0Ym1lyF4gT3DsrlGT1h0Gzw7vUwd1+ZfN0CuIx
 Rn861U/dAUjvbtN5kMBqOI4/5ea+0r7MACcIVnKF/wMXBD8eypHsorT2sJTzwZ6DRCNP70C5
 N1ahpqqNmXe0uLdP0pu55JCqhrGw2SinkRMdWyhSxT56uNwIVHGhLTqH7Q4t1N6G1EH626qa
 SvIJsWlNpll6Y3AYLDw2/Spw/hqieS2PQ/Ky3rPZnvJt7/aSNYsKoFGX0yjkH67Uq8Lx0k1L
 w8jpXnbEPQN3A2ZJCbeMuQENBF0/k2UBCADhvSlHblNc/aRAWtCFDblCJJMN/8Sd7S9u4ZRS
 w1wIB4tTF7caxc8yfCHa+FjMFeVu34QPtMOvd/gfHz0mr+t0PiTAdDSbd6o7tj+g5ylm+FhT
 OTUtJQ6mx6L9GzMmIDEbLxJMB9RfJaL2mT5JkujKxEst6nlHGV/lEQ54xBl5ImrPvuR5Dbnr
 zWQYlafb1IC5ZFwSMpBeSfhS7/kGPtFY3NkpLrii/CF+ME0DYYWxlkDIycqF3fsUGGfb3HIq
 z2l95OB45+mCs9DrIDZXRT6mFjLcl35UzuEErNIskCl9NKlbvAMAl+gbDH275SnE44ocC4qu
 0tMe7Z5jpOy6J8nNABEBAAGJATwEGAEKACYWIQSQYR1bzo1I0gPoYCg+6I/stKEQbgUCXT+T
 ZQIbDAUJAeEzgAAKCRA+6I/stKEQbjAGB/4mYRqZTTEFmcS+f+8zsmjt2CfWvm38kR+sJFWB
 vz82pFiUWbUM5xvcuOQhz698WQnIazbDGSYaOipyVNS52YiuYJDqMszzgw++DrcSuu0oRYWN
 EWCkJjxMqjGg8uY0OZ6FJG+gYRN5wMFErGfV1OqQ7l00FYA9OzpOEuW9PzPZEutFnAbbh77i
 zvxbQtT7IJCL24A4KutNYKmWg98im4mCzQcJCxE86Bv69ErLVPUyYbp4doLadScilXlvkkjL
 iq1wOt3rRzOuw+qnWVgWGBPxdDftz0Wck941tYF9XE0aMgkf4o1sGoDZFUFPCQdfEYPzzV7O
 S5hN3/mP5UeooFHb
Message-ID: <cabd9527-3df3-4e5a-4669-5c14ed44e94d@gmail.com>
Date: Wed, 19 Feb 2020 17:28:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200219090612.7onbaoygy6waumnw@aurora.visucore.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_142809_283548_43FAD306 
X-CRM114-Status: GOOD (  18.44  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/19/20 4:06 AM, Wladimir J. van der Laan wrote:
> On Tue, Feb 18, 2020 at 04:26:17PM -0300, Carlos Eduardo de Paula wrote=
:
>> On Tue, Feb 18, 2020 at 2:48 PM Sean Anderson <seanga2@gmail.com> wrot=
e:
>>>
>>> So the LCD connector is supposed to be for a ST7789V controller, but
>>> there doesn't appear to be a driver in Linux for it. I don't have an
>>> appropriate LCD screen, so I will not be able to write a driver.
>>>
>>
>> Actually there is a driver and config DRM_PANEL_SITRONIX_ST7789V, in
>> gpu/drm/panel/panel-sitronix-st7789v.c and also FB_TFT_ST7789V and
>> CONFIG_FB_TFT_ST7789V with the driver a in
>> staging/fbtft/fb_st7789v.c. Might be easier :)

Ah, I didn't notice that, thanks.

>>
>> Weird that the Kendryte SDK refers to the LCD as NT35310
>> (https://github.com/kendryte/kendryte-standalone-demo/tree/develop/lcd=
).
>=20
> I remember checking the datasheet for both a while ago and NT35310 and =
ST7789V
> seem to be more or less compatible, with only register differences
> for more obscure functionality.
>=20
> The more involved part is likely to adapt the spi-dw driver, apart from=
 making the
> ctrlr0 shifts configurable, there's the "OCTAL" mode that is used and e=
xtra
> register that isn't set in the Linux driver (spi_ctrlr0 / 0xf4) concern=
ing
> "instruction address translation mode" and other things that needs to
> be set correctly for LCD transfers to work.
>=20
>>> There is no need for GPIOs. The datasheet shows SPI0 as hooked up to =
the
>>> SD card, but the default pinconf doesn't have it hooked up. In additi=
on,
>>> the dedicated SPI0 data lines are already connected to the LCD. For
>=20
> Yes - apparently only if you set sysctl spi_dvp_data_enable to route th=
e
> SPI0_0-7 pins to to the LCD data pins (bypassing FPIOA).
>=20
> BTW speaking of which, does anyone know what's up with the K210's DMA
> controller? It looks like it can only transfer 32-bit values from and t=
o
> peripherals? At least the kendryte-standalone-sdk goes to great lengths=
 to
> first allocate a 32-bit buffer then manually copy it to say, bytes or 1=
6-bit
> words. Seems quite a silly workaround with a lot of overhead.

Do you have a link to that section?

--Sean



