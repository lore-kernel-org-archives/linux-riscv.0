Return-Path: <SRS0=v9z2=S4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A92DC43218
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 04:41:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24FC3206A3
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 04:41:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iEnk22jc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="MiHXgjDA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24FC3206A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iyaPnp9IP5xHdY/YYSf/4u+RVjyZSaVFVNtgzIr1+8c=; b=iEnk22jcFFTVosJPALD/z3Y+L
	omozq3UnY30EYMp4M9vnRbbmdj3WnbWLlldlPLA9NAn/YiQ4yZUqrQYRmJu3k1xzUhfq1V9xge5Z9
	CxcgAB8NAMblAEt5CL7Us4AVsPHxV4Z4HbJZpIM/aksq1FDqOvsuu1MUVgjIjPwCFyqiEE9TdiIc8
	IbE0wCO+wPJCUjsEJBUTldWXT1OmQMfjyGIvaesyvtdbYwgzaJvFgliQpr4Cq0X1kCSd8QAIraq8u
	4Xh0lUYtXH4KlIQZOGDXwyleZLCzzrBbPVhw96soQvTgm8Yy2ParDFTKaJhOnHn53RtJ121AYwms0
	mpLamG2ug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJsfx-0003b2-AL; Fri, 26 Apr 2019 04:41:29 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJsft-0003ai-Sp
 for linux-riscv@lists.infradead.org; Fri, 26 Apr 2019 04:41:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556253686; x=1587789686;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=MpWvheFOejWRs2zd9Qglh5YkbiX057ZAvN5hIeqKvGg=;
 b=MiHXgjDAUURujauyLDNi/50tjbBZi1G+uvvWPwZCIHuPGghwJsCqXRh5
 fbid1Snhf8TEIi4RGN+UHmDWuC5A0trUGaQnG9gFKEOWCTeeeu/htFbGB
 cZ7bJUmd7LRKrw1KIEFTYjWUqXn41gpgnDMu6SscXKhgOirMhf8na5db5
 05p1H/SWmtEjWcGMtCPbP4y2z4NUjTV3rFigqUY1NJ4K6x7TPpyMNzct8
 ZXG19ybhyGDZoXL/3Ner7fcvkRoxNO1XrWCy+EJ7AHl5pGi1LBmPHT+Ap
 9tGzZDuz0B+o2jZ2XbR9qG2wva4OYVoK74/0dyjPveC3kMdqMYfMBY4EA A==;
X-IronPort-AV: E=Sophos;i="5.60,396,1549900800"; d="scan'208";a="111830451"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 26 Apr 2019 12:41:23 +0800
IronPort-SDR: 2hxXF5702uYaRnIwaBIfY84yJdv5GU8ef01XSb6/9hl+0/ptGoeC/+/pCLzc6BFLbWij/uFxAE
 iqae9x2Jxj/N8vAgvNLNFd30STXIYUJKkPC+sHs5ySI1Cu2xKvxQyDR6tWmLQl9sauk1j0LU5i
 VV4r4inyI1N4OtxTOt2efcMPO+nN7obi9i3sHh6thL/3fiwbP66z5I2cMC+jnCAQ/5jbDCiDjd
 Jf9lYSE417K0O8UeK6999kKd7ctphBlOTR6Zwl4lJs9/F//cIzjVV8YHZblv7ELhMQyHollXF1
 8/ljfew6GT1LUo/NnlQQUt65
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP; 25 Apr 2019 21:20:00 -0700
IronPort-SDR: U3aV7ee0cykZHXpN0/znPIqgRaqQfDMLXGGa8LArrP7M+zdfNNiDSefYqC50qQqSyAnAfA2mtE
 T7qBObKPgcOlc/RzeNNWd4By+0xOsWJUVMH9+b9oq7x+523e7mezX+XfZMd1B02bYtz4G39DxP
 8te9T7QaBXt3D90DnF8wTlOwvXXwzzz5W3lJiy0ULk1RJXiHwgytRcjAxJ7aZF3/RT2DiO+lr+
 yFDWbVTblOwKmQ1BC90SdBhwCwECPdYRp6zZzcAkQJOD5lS/l6Iiaf9TrQdMfgv2jZ0hZTZgPB
 w2E=
Received: from usa001205.ad.shared (HELO [10.86.53.92]) ([10.86.53.92])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Apr 2019 21:41:23 -0700
Subject: Re: [PATCH] tty: Don't force RISCV SBI console as preferred console
To: Anup Patel <Anup.Patel@wdc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>
References: <20190425133435.56065-1-anup.patel@wdc.com>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <9a8be7ef-e62e-2a93-9170-e3dc70dfb25f@wdc.com>
Date: Thu, 25 Apr 2019 21:41:21 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190425133435.56065-1-anup.patel@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_214126_049374_5B2AA79C 
X-CRM114-Status: GOOD (  20.51  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/25/19 6:35 AM, Anup Patel wrote:
> The Linux kernel will auto-disables all boot consoles whenever it
> gets a preferred real console.
> 
> Currently on RISC-V systems, if we have a real console which is not
> RISCV SBI console then boot consoles (such as earlycon=sbi) are not
> auto-disabled when a real console (ttyS0 or ttySIF0) is available.
> This results in duplicate prints at boot-time after kernel starts
> using real console (i.e. ttyS0 or ttySIF0) if "earlycon=" kernel
> parameter was passed by bootloader.
> 
> The reason for above issue is that RISCV SBI console always adds
> itself as preferred console which is causing other real consoles
> to be not used as preferred console.
> 

Do we even need HVC_SBI console to be enabled by default? Disabling 
CONFIG_HVC_RISCV_SBI seems to be fine while running in QEMU.

If we don't need it, I suggest we should remove the config option from 
defconfig in addition to this patch.

Regards,
Atish
> Ideally "console=" kernel parameter passed by bootloaders should
> be the one selecting a preferred real console.
> 
> This patch fixes above issue by not forcing RISCV SBI console as
> preferred console.
> 
> Fixes: afa6b1ccfad5 ("tty: New RISC-V SBI console driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>   drivers/tty/hvc/hvc_riscv_sbi.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
> index 75155bde2b88..31f53fa77e4a 100644
> --- a/drivers/tty/hvc/hvc_riscv_sbi.c
> +++ b/drivers/tty/hvc/hvc_riscv_sbi.c
> @@ -53,7 +53,6 @@ device_initcall(hvc_sbi_init);
>   static int __init hvc_sbi_console_init(void)
>   {
>   	hvc_instantiate(0, 0, &hvc_sbi_ops);
> -	add_preferred_console("hvc", 0, NULL);
>   
>   	return 0;
>   }
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
