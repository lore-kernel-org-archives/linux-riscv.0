Return-Path: <SRS0=qhrg=NC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A51C004D3
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Oct 2018 16:42:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2544B20645
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Oct 2018 16:42:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dE6GeOlP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SyuSQPT+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2544B20645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=1IxRyXFBFvIc+eexidUGl6BhSbUlK9lWCfjCiZz0uhs=; b=dE6GeOlPz1AhpFvnc+BUtB5c0
	liEqMyQZuaaPrgy0vor3CDM5jMyCNtzMpsU0VRmJB4U6Z1hws9kF9ZwBSiAvyhHMxHjDUTTg7gXNs
	DSCLMVbFB6f8FTT58Q/XN+HfavX6XC4cOtsgleVNJjQXsRRIVbeQN3VDHuZi+TelL8iNjCmuHn48x
	ZS/cbaU8pjFhPCHNWoVVSxBul7iIN29dYsDnxl9PuH5S8G68HnzxNdxroiBQ9afIdHP1kUOyiwiy+
	IBBDQlQMq8M5QzEgVwX6plnX4hRNTN9kVxKLkpY32u/z6clnjPa3RBd99simy4+5AQql00IWXbFGQ
	kvqu16qog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gEdHL-0008Rq-RR; Mon, 22 Oct 2018 16:42:07 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gEdHI-0008Pn-1c
 for linux-riscv@lists.infradead.org; Mon, 22 Oct 2018 16:42:05 +0000
Received: by mail-pl1-x644.google.com with SMTP id e67-v6so10350366plb.6
 for <linux-riscv@lists.infradead.org>; Mon, 22 Oct 2018 09:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ou0XepXjkzvDYW0kG4OS6ZSNPTOhZGtmWZRLSrbu6ds=;
 b=SyuSQPT+39l7kciaLFcqZczw1tlXekOARqgLBXoAeZCRDysrARiEAyQG66+p95TIXv
 689M8DdtzvyxrvrlbZLtalmBFKT4k7iU03uXG+nRl2ssRy6a8Uj3NHDq6kQ3m8+8w/rq
 3fn5CPDWebee/n/3x+O0DVzBRWrVeCMqm3rn2HNdxcGcZqTEqNODTjI7c4smksLhwDOd
 VVriGRFLcuBXTECQUG42O4gncmDfesEh2BOLwG3qzysX1z3352AL9KSE088fM1SKVsGo
 7FRDc3uzpHwwJGfK9gpL5st2WXeKTnoNwEIRzPBTVOgyzg2PO2kXpnX9lfxLCN34mWKd
 bQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ou0XepXjkzvDYW0kG4OS6ZSNPTOhZGtmWZRLSrbu6ds=;
 b=Y5C76TZ7qQYAPaNB+DVQtSjuMRSHDOSWZSVV3TUVIMPCfgpgAKgdkrXJlAwHCd1tmu
 PPvk9YNEtPJN75sJ7A8LmGQVOk/TuiUeKVijdtqtoKrzp3/dMZQhfyxqWS1UjQosmmvu
 E5rfFDrrsvweDym0Ffxkcrl1DQjA+X4Cuu3PN/0FdJXgwds3FJMuSFAWmJhRDwPPAThP
 ywzqJ6Xn1wlde2ViiZb6Y2Rrnl8wMTvt6rXprapv010pVXaag4uv+sJh4pZPknLETP4b
 935SpNr7HvbDWi7nYPTRSi1XFCCgMqiX2VFir6Uz/ysSdQSzLWsTDyKRV1C/UcduRb1O
 q36Q==
X-Gm-Message-State: ABuFfogm7iCy5VrhwDuYoGOR2qnEZiORxIKahrM0cctvJaUKOcOromfb
 7RH6+zK0lVPZbav6M3wRBw+bfg==
X-Google-Smtp-Source: ACcGV60VUfGMgsT7EAosxmJxwxe0c87WkKTMmlV8KNL8rGBygfDR3nKXfACxOMl0bnAvlSt6f6K+yg==
X-Received: by 2002:a17:902:507:: with SMTP id
 7-v6mr35686908plf.272.1540226512597; 
 Mon, 22 Oct 2018 09:41:52 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id x19-v6sm4120148pga.15.2018.10.22.09.41.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Oct 2018 09:41:51 -0700 (PDT)
Date: Mon, 22 Oct 2018 09:41:51 -0700 (PDT)
X-Google-Original-Date: Mon, 22 Oct 2018 09:31:29 PDT (-0700)
Subject: Re: [PATCH v2 1/2] dt-bindings: serial: add documentation for the
 SiFive UART driver
In-Reply-To: <CAL_JsqJBSqaxnETdJg1Mdp+H2ay+WKT0JaxLe6D4Fwo_99qUkw@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: robh+dt@kernel.org
Message-ID: <mhng-44b7601c-c2f4-4de8-a12e-7730e03d691e@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181022_094204_087391_9EDE0CE3 
X-CRM114-Status: GOOD (  23.58  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, paul@pwsan.com,
 Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181022164151.--b-bRY8B-DM8f5hQhBUoM3RawGOkr_dCAAhtBe_y2M@z>

On Fri, 19 Oct 2018 13:45:57 PDT (-0700), robh+dt@kernel.org wrote:
> On Fri, Oct 19, 2018 at 1:48 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>>
>> Add DT binding documentation for the Linux driver for the SiFive
>> asynchronous serial IP block.  Nothing too exotic.
>>
>> Cc: linux-serial@vger.kernel.org
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-riscv@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Palmer Dabbelt <palmer@sifive.com>
>> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
>> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
>> Signed-off-by: Paul Walmsley <paul@pwsan.com>
>> ---
>>  .../bindings/serial/sifive-serial.txt         | 21 +++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/serial/sifive-serial.txt
>>
>> diff --git a/Documentation/devicetree/bindings/serial/sifive-serial.txt b/Documentation/devicetree/bindings/serial/sifive-serial.txt
>> new file mode 100644
>> index 000000000000..8982338512f5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/serial/sifive-serial.txt
>> @@ -0,0 +1,21 @@
>> +SiFive asynchronous serial interface (UART)
>> +
>> +Required properties:
>> +
>> +- compatible: should be "sifive,fu540-c000-uart0" or "sifive,uart0"
>
> I assume once again, the last '0' is a version? As I mentioned for the
> intc and now the pwm block bindings, if you are going to do version
> numbers please document the versioning scheme. Palmer mentioned the
> compatible string is part of the IP block repository? Where does the
> number come from? What's the next version? Major vs. minor versions?
> ECO fixes? Is the version s/w readable? How do you ensure it gets
> updated? All that should be addressed.

The RISC-V ecosystem is a bit different than that of ARM, MIPS, or Intel in 
that the ISA is an royalty-free open standard that anyone can implement (ie, 
without even signing a license agreement), with only the "RISC-V" trademark 
being held behind a pay+conformance wall.  As a result, we don't actually have 
any control over who builds a RISC-V chip so all we at SiFive can really to is 
try to demonstrate good practices in software land and go from there.

As far as SiFive's codebase is concerned, the version number is embedded in the 
RTL generator, and a device tree is generated along with the RTL.  This device 
tree is then embedded into a mask ROM on the chip, which allows the earliest 
stage of boot to proceed.  As I'm sure you know, boot is a very complicated 
process and as a result the device tree passed to Linux doesn't necessarily 
look like what's in the ROM, but the intent is to keep iterating until we can 
get these as similar as possible -- that's why we're submitting every 
devicetree binding to the standard.

Specifically as far as the UART is concerned, the compat string that's not 
chip-specific lives here (the "sifive,fu540-c000-uart" string lives in an 
internal chip repo that I can't point to):

    https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/uart/UART.scala#L43

The version numbering scheme right now is pretty simple: I try to pay as much 
attention as possible to how the hardware changes (both by looking and with 
some automation), and I go yell at anyone who does something stupid.  I know 
it's not the most scalable of schemes, but it's the best we have.  The UART is 
actually an interesting case right now because we have an outstanding pull 
request that adds a bit to the UART and then adds "sifive,uart1" to the compat 
string

    https://github.com/sifive/sifive-blocks/pull/90

My intent is to ensure that the device tree's compat string uniquely identifies 
the software interface to a block.  Thus, whenever a device's implementation 
changes in a software-visible way (bug fix or feature addition) we change the 
compat string -- either adding one (as is the case of the UART, where the 
compat string will be both "sifive,uart1" and "sifive,uart0" since the new 
feature is backwards compatible with the old software) or changing one (if the 
interface change is not compatible with old software).

Like I said above, this is all a manual process right now and this only applies 
to SiFive's implementations.  I'm confident that I can at least ensure that, 
for any given SiFive implementation, a block's compat string will uniquely 
identify the software interface to it.  For the rest of the RISC-V world all we 
can do is set a good example and review the software.

> Otherwise, don't do version numbers because we have no visibility to
> what they mean.
>
>> +- reg: address and length of the register space
>> +- interrupt-parent: should contain a phandle pointing to the SoC interrupt
>> +    controller device node that the UART interrupts are connected to
>
> Don't need to document interrupt-parent here.
>
>> +- interrupts: Should contain the UART interrupt identifier
>> +- clocks: Should contain a clock identifier for the UART's parent clock
>> +
>> +
>> +Example:
>> +
>> +uart0: serial@10010000 {
>> +       compatible = "sifive,uart0";
>> +       interrupt-parent = <&plic0>;
>> +       interrupts = <80>;
>> +       reg = <0x0 0x10010000 0x0 0x1000>;
>> +       clocks = <&prci PRCI_CLK_TLCLK>;
>> +};
>> --
>> 2.19.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
