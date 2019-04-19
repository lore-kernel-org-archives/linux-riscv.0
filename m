Return-Path: <SRS0=IJcX=SV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DAFC282DF
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2019 20:34:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75F7A20869
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2019 20:34:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qXIJYxxB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jQL63evb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75F7A20869
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WxkSIgk92AYHpYWe9rX+mZuhjKhr7TZ8QZgD1xJGmC8=; b=qXIJYxxB7XGWjw
	11P8+DNsGCJl7AqrFN0WdYt7Lvhg4kMGIwdtdIsOKs7M683uOLLVFArO6YkBnmZSElsPEVNv2rqMI
	uSCKBXgSNyftLLYy9K8TmSyAacGEi8/W2aEtjy+OB4Mx4phdp7o+GUafMEZrYe4RMthhBELh4mTp/
	GvWf+ajYTndLZ92Lus1oeiE/ChRes7wDgtwzs4UqQvrC9IlQHoWYVI1JKZP2p0OLdGT1E2sk/6mq3
	fdUuU9Q33/sqfT0QG6Yh0/dDp4k8zdM06Sv7MzqatP0uM1F8VLPlexAG7S5VwRbZhyI76Ybfp64IU
	DNlL2iUB10fS4zAg5bNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHaDH-0002yi-H8; Fri, 19 Apr 2019 20:34:23 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHaDE-0002wf-LF
 for linux-riscv@lists.infradead.org; Fri, 19 Apr 2019 20:34:22 +0000
Received: by mail-pl1-x641.google.com with SMTP id e92so1271109plb.6
 for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2019 13:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=hYJg39usgJcllYFrjiYgS86kBJRDdbEEnV9aw2W2GEs=;
 b=jQL63evb7XKqJALNJHTY+/kR8xLD6D7LYbBaI+N6ELM6b/1RyL+ZzZdYlXwsuNkdtW
 K+6M7HHA4B6S/HS2LhhoQyrgo6f0o7o/aE2K0Z+C1dzOQa2T62QuXhXDSsxbVs1B1amj
 iQAPNYrXFX7FntLuHJk0VXbd/9e5LsYwWa0bVUDtSORMYX5hUqBdzMl7pGuV5pDB7cQI
 S+iLKfGBDTvJqw9H+nMbPaeMMTVoIYCGByFuZge0NbYXIb9HWrTjLGM2MibRhrpiMony
 yqn2pSzHdvRraHrbSn/LpYS3dqmgHwVjt1Ui9CNyt2diQKlCrHCvokcfthpiTUhCLirB
 G5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=hYJg39usgJcllYFrjiYgS86kBJRDdbEEnV9aw2W2GEs=;
 b=ggkKtB0VQZkJHrG9WXHNDsOfzLjI8kUfx646mgsQxg3FR21+iWVcvP0Hfzyi36PNC6
 SCtNEwMGj/Hv0VpDvMaRPwJfpU7/KgI6X2/n18PEAxMS52sPqeUWZ+LGEcXXZktDZsBQ
 se3jTdkxEGsGB1FzqLT/UpRm5hBCqOeNYY+zhJFLguEP+Ma5KFdxph1D9TDxn4W5hX58
 q7t+/+T0m24BoRtNGS5u2/xPxOXKdS8TbmRnqFupGnjUOjow6RmpHH3Vp9/gvNhc3nK2
 pq46zgnEMpuomeybTJdAPrvYapGgS20ydkzRgcwJi+n0AIP3QQF9coCp70R24TRpcNx5
 ztdg==
X-Gm-Message-State: APjAAAX2UQ5iiEf1wiK58coHcWc6K5TUOAiVxU1xrlmRgeS1pUTt5EM5
 DaTIA36Lo+GXyHv36MWEoWvLkw==
X-Google-Smtp-Source: APXvYqyPPRxdtxGy49YM+WfG5omFqih5zYdg0hfApJjbYRpVmk2PDl+SCQvqvId06FUCmA5yfqUtHA==
X-Received: by 2002:a17:902:56e:: with SMTP id
 101mr5747587plf.142.1555706058366; 
 Fri, 19 Apr 2019 13:34:18 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:6d49:9ddc:13aa:21c9])
 by smtp.googlemail.com with ESMTPSA id u17sm7271699pfn.19.2019.04.19.13.34.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 19 Apr 2019 13:34:17 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Atish Patra <atish.patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial\@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "linux-riscv\@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "gregkh\@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 0/2] tty: serial: add DT bindings and serial driver for
 the SiFive FU540 UART
In-Reply-To: <f2bb876c-2b44-663b-ea06-d849f721fb6c@wdc.com>
References: <20190413020111.23400-1-paul.walmsley@sifive.com>
 <7hmukmew5j.fsf@baylibre.com> <883f3d5f-9b04-1435-30d3-2b48ab7eb76d@wdc.com>
 <7h5zr9dcsi.fsf@baylibre.com> <f2bb876c-2b44-663b-ea06-d849f721fb6c@wdc.com>
Date: Fri, 19 Apr 2019 13:34:17 -0700
Message-ID: <7htvetbupi.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190419_133420_717608_C93EFCCF 
X-CRM114-Status: GOOD (  21.75  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Atish Patra <atish.patra@wdc.com> writes:

> On 4/19/19 12:18 PM, Kevin Hilman wrote:
>> Atish Patra <atish.patra@wdc.com> writes:
>> 
>>> On 4/18/19 4:22 PM, Kevin Hilman wrote:
>>>> Hi Paul,
>>>>
>>>> Paul Walmsley <paul.walmsley@sifive.com> writes:
>>>>
>>>>> This series adds a serial driver, with console support, for the
>>>>> UART IP block present on the SiFive FU540 SoC.  The programming
>>>>> model is straightforward, but unique.
>>>>>
>>>>> Boot-tested on a SiFive FU540 HiFive-U board, using BBL and the
>>>>> open-source FSBL (with appropriate patches to the DT data).
>>>>>
>>>>> This fifth version fixes a bug in the set_termios handler,
>>>>> found by Andreas Schwab <schwab@suse.de>.
>>>>>
>>>>> The patches in this series can also be found, with the PRCI patches,
>>>>> DT patches, and DT prerequisite patch, at:
>>>>>
>>>>> https://github.com/sifive/riscv-linux/tree/dev/paulw/serial-v5.1-rc4
>>>>
>>>> I tried this branch, and it doesn't boot on my unleashed board.
>>>>
>>>> Here's the boot log when I pass the DT built from your branch via
>>>> u-boot: https://termbin.com/rfp3.
>>>>
>>>
>>> Unfortunately, that won't work. The current DT modifications by OpenSBI.
>>>
>>> 1. Change hart status to "masked" from "okay".
>>> 2. M-mode interrupt masking in PLIC node.
>>> 3. Add a chosen node for serial access in U-Boot.
>>>
>>> You can ignore 3 for your use case. However, if you pass a dtb built
>>> from source code, that will have hart0 enabled and M-mode interrupts
>>> enabled in DT.
>> 
>> Hmm, so what you're saying is there not currently any way to pass a DT
>> built from source using OpenSBI + mainline u-boot?
>> 
>
> OpenSBI can accept DT built from source with following build option.
>
> FW_PAYLOAD_FDT="<unleashed>.dtb"
>
> More documentation:
> https://github.com/riscv/opensbi/blob/master/docs/firmware/fw_payload.md

I'm aware of that method, but I'm looking for a way that doesn't require
me to rebuild/reflash SBI every time.

Basically, I want u-boot to TFTP the DTB (along with kernel and ramdisk)
and boot it from memory.

On all other DT platforms in kernelCI, we build DTB(s) along with the
kernel (but not built into the kernel.)  We then use the bootloader to
load the kernel, DTB and ramdisk that we built.

>> As a short-term workaround, is there a way to make these changes from
>> the u-boot command-line after loading a DTB built from source into
>> memory?  If so, I could at least script that part.
>> 
>> 
>>> Not sure if we should do these DT modifications in U-Boot as well.
>> 
>> I guess so (and I'd be happy to test the patch.)
>> 
>> Either that, or the upstream DTs (or code) should have those features to
>> the right settings.
>> 
>> Speaking of which, I tried to patch the DT from Paul's recent series[1]
>> to make the necessary changes.  I can see where to change cpu0 from
>> "okay" to "masked", but I'm not so sure how to make the PLIC change.
>> 
>
> Here is the code snippet of how OpenSBI modifies the DT.
>
> https://github.com/riscv/opensbi/blob/master/platform/sifive/fu540/platform.c#L53

Thanks, based on that, I was able to modify the DTB I'm builing from
source[1], but it still doesn't fully boot.

Looks like Paul has so far only tested this with BBL + FSBL, so I think
I'll wait to hear from him how that setup might be different from using
OpenSBI + u-boot.

Thanks for all the help,

Kevin

[1]
diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index dd3b9395cedf..299398c4201d 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -30,7 +30,7 @@
                        i-cache-size = <16384>;
                        reg = <0>;
                        riscv,isa = "rv64imac";
-                       status = "okay";
+                       status = "masked";
                        cpu0_intc: interrupt-controller {
                                #interrupt-cells = <1>;
                                compatible = "riscv,cpu-intc";
@@ -148,11 +148,11 @@
                        reg = <0x0 0xc000000 0x0 0x4000000>;
                        interrupt-controller;
                        interrupts-extended = <
-                               &cpu0_intc 11
-                               &cpu1_intc 11 &cpu1_intc 9
-                               &cpu2_intc 11 &cpu2_intc 9
-                               &cpu3_intc 11 &cpu3_intc 9
-                               &cpu4_intc 11 &cpu4_intc 9>;
+                               &cpu0_intc 0xffffffff
+                               &cpu1_intc 0xffffffff &cpu1_intc 9
+                               &cpu2_intc 0xffffffff &cpu2_intc 9
+                               &cpu3_intc 0xffffffff &cpu3_intc 9
+                               &cpu4_intc 0xffffffff &cpu4_intc 9>;
                };
                prci: clock-controller@10000000 {
                        compatible = "sifive,fu540-c000-prci";

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
