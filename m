Return-Path: <SRS0=ssm3=N3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FA2C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 16 Nov 2018 23:11:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E909B2086A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 16 Nov 2018 23:11:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ru89m5t5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="hFjYKfWF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E909B2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gxHxMAQjaPey9avgzDGPnFeaR4t0Fk/Kpb0DmULf7ro=; b=Ru89m5t5yWutDSpLaIoolbkqo
	i+DdLxC2yDsJqZo7PPE59DX9d8FdldhRTaL9jhI0ukV+ohiFUFqd8V1xQrJKRidzRt5Ekm/THZeKb
	jJCewqqCQcaz36f/nQ5Lv0KIz+ArlKpIIwfdcBTMwTOYnqzS0hHu52Kq2UwOcn+4LGFuO9IMCtjkl
	76MgbEQPqBddYBFVqs5yx09DoqAZPnIHZFFijJ//XuMzNyIfBBomZHYHaN7GqV802AjgMvMRWXfy6
	rrW4ESxyDmYXMxsHbBBmBnl+ohivSwTn3GZ2XIeo5MvJNj+2vpy8VagsZ3Y1DxBu47lHmLf/f4fwF
	L1mZFpUeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gNnGH-0006ii-RT; Fri, 16 Nov 2018 23:10:53 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNnGE-0006XB-5m
 for linux-riscv@lists.infradead.org; Fri, 16 Nov 2018 23:10:51 +0000
Received: by mail-pg1-x544.google.com with SMTP id n2so4047018pgm.3
 for <linux-riscv@lists.infradead.org>; Fri, 16 Nov 2018 15:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=1H2lGRxtevhCSYRUCI5TlF5LluRKBPaQ4iXlGKU2yyc=;
 b=hFjYKfWFMPwH92ilEtVWrUAXLc1lKMRa7srslaIcvriT78ZzNIviSMvlqmiWHnLF4J
 WZrS5Zd322KQQZ13lLcc3heyBzERKNGCPwFQddUk76hu0aXwEyt08czpLrgiGdHCu74I
 IRD7C7EdbAqtlI9L5TUaW+hR8VLGPC4nte9tRMvzFK2Cn1MErc5BGU9Dow1+sdBocHkJ
 qYOoyficMqLWEE9K+1ESSZNo/hF7Mvtb4HXi/IG8XpUgNXHLqTrZ7VAtAO2fjkl3AAi3
 OMhpVwRB1aiVCt+hRjYvZar0Uk6ikUpgFmJpxHwenONGQdhTM1yrVk5I1FbSGDD9+dsg
 Wgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=1H2lGRxtevhCSYRUCI5TlF5LluRKBPaQ4iXlGKU2yyc=;
 b=lhj9ABdeGHHlNVrrnLrXjuAMEvdPUhHeQHmgJDQcg2ll/f0DGDCClWwDiZE0dZKebp
 /x1TuGJhlSgths/UNAI17fzreVG6BWEBugOVUcCQ0SFpYpwjvf7LvvM7RBQq1ZJ4N1xf
 /SFM8wD4Cv+jmbSjHS+nuzlUmPEo+kvokl6Gti1jytuf1W0zUo/xg0F0IEQ12q+YoRMt
 3g2yiVGS73fxZBFnYusEmgS3NiAyvKkMm1G0Udwboe4qEF3twm3D7UCOIctZ32XtIJSp
 17jI8i7xuSVz96H0VqZ8V+OYZTgxZw5hHOX8N59ScVK9FoFRf6i2/ckmMAW2GxjOUtn9
 OJBA==
X-Gm-Message-State: AGRZ1gLaJcpidxnHptgesFztqSTy9DcVxEGkm/MGKxlPMtY6b4oLVq7Z
 PS7sshzpFjstZCpW7Suwe+ZpXA==
X-Google-Smtp-Source: AJdET5ejm1X6dOHY290xNJjdge5NhyfHWPUxWto0ENTMTjjsp9WNJACXhz6OLR8SH3Ls/f8st9ifSg==
X-Received: by 2002:a63:e915:: with SMTP id i21mr11475723pgh.409.1542409839110; 
 Fri, 16 Nov 2018 15:10:39 -0800 (PST)
Received: from localhost ([216.234.200.180])
 by smtp.gmail.com with ESMTPSA id u137sm25144578pfc.140.2018.11.16.15.10.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 16 Nov 2018 15:10:38 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Fri, 16 Nov 2018 15:10:35 -0800 (PST)
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: serial: add documentation for the
 SiFive UART driver
In-Reply-To: <20181024173232.GB5652@bogus>
Message-ID: <alpine.DEB.2.21.9999.1811161505240.25712@viisi.sifive.com>
References: <20181019184827.12351-1-paul.walmsley@sifive.com>
 <20181019184827.12351-2-paul.walmsley@sifive.com>
 <CAL_JsqJBSqaxnETdJg1Mdp+H2ay+WKT0JaxLe6D4Fwo_99qUkw@mail.gmail.com>
 <4317548d-f831-29ba-3be9-35f080587db9@sifive.com>
 <CAL_JsqLagTgjDhZ02X=wPFDB4WF2bR7=LyzSW9D=ooo_XB_zOg@mail.gmail.com>
 <6571bb0e-b36a-1196-4d90-8aa62d8a2a90@sifive.com>
 <20181024173232.GB5652@bogus>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-964611338-1542409835=:25712"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181116_151050_217901_9454AE7A 
X-CRM114-Status: GOOD (  26.33  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Walmsley <paul@pwsan.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181116231035.CYT-EKSUVZQBK3fsjAsdDdM5Z5niVKak-9h4jSvTeQc@z>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-964611338-1542409835=:25712
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 24 Oct 2018, Rob Herring wrote:

> On Tue, Oct 23, 2018 at 10:05:40AM -0700, Paul Walmsley wrote:
>> On 10/20/18 7:21 AM, Rob Herring wrote:
>>> On Fri, Oct 19, 2018 at 5:06 PM Paul Walmsley <paul.walmsley@sifive.com=
> wrote:
>>>> On 10/19/18 1:45 PM, Rob Herring wrote:
>>>>> On Fri, Oct 19, 2018 at 1:48 PM Paul Walmsley <paul.walmsley@sifive.c=
om> wrote:
>>>>>> Add DT binding documentation for the Linux driver for the SiFive
>>>>>> asynchronous serial IP block.  Nothing too exotic.
>>>>>>
>>>>>> Cc: linux-serial@vger.kernel.org
>>>>>> Cc: devicetree@vger.kernel.org
>>>>>> Cc: linux-riscv@lists.infradead.org
>>>>>> Cc: linux-kernel@vger.kernel.org
>>>>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>>>> Cc: Rob Herring <robh+dt@kernel.org>
>>>>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>>>>> Cc: Palmer Dabbelt <palmer@sifive.com>
>>>>>> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
>>>>>> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
>>>>>> Signed-off-by: Paul Walmsley <paul@pwsan.com>
>>>>>> ---
>>>>>>    .../bindings/serial/sifive-serial.txt         | 21 ++++++++++++++=
+++++
>>>>>>    1 file changed, 21 insertions(+)
>>>>>>    create mode 100644 Documentation/devicetree/bindings/serial/sifiv=
e-serial.txt
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/serial/sifive-serial.=
txt b/Documentation/devicetree/bindings/serial/sifive-serial.txt
>>>>>> new file mode 100644
>>>>>> index 000000000000..8982338512f5
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/serial/sifive-serial.txt
>>>>>> @@ -0,0 +1,21 @@
>>>>>> +SiFive asynchronous serial interface (UART)
>>>>>> +
>>>>>> +Required properties:
>>>>>> +
>>>>>> +- compatible: should be "sifive,fu540-c000-uart0" or "sifive,uart0"
>>>>>>
>>>>> As I mentioned for the
>>>>> intc and now the pwm block bindings, if you are going to do version
>>>>> numbers please document the versioning scheme.
>>>>>
>>>>>
>>>>> Will add that to the binding document.
>>> I don't seem to be making my point clear. I don't want any of this
>>> added to a binding doc for particular IP blocks. Write a common doc
>>> that explains the scheme and addresses the questions I asked. Then
>>> just reference that doc here.
>>>
>>> Maybe this is documented somewhere already? Otherwise, if one is
>>> creating a new IP block, how do they know what the versioning scheme
>>> is or what goes in the DT ROM?
>>
>>
>> Seems like there might be some confusion between IP blocks as integrated=
 on
>> an SoC vs. IP blocks in isolation.=A0 It's not necessarily the SoC integ=
rator
>> that sets an IP block version number; this can come from the IP block ve=
ndor
>> itself.=A0 So each IP block may have its own version numbering practices=
 for
>> the IP block alone.
>>
>>
>> For SiFive IP blocks, we at SiFive could probably align on a common vers=
ion
>> numbering structure for what's in the sifive-blocks repository.
>
> I thought you had that from what Palmer said and what I've seen so far.
> You have at least 3 bindings so far it seems.

Yep.

>> But other IP blocks from other vendors may not align to that, or may not
>> have version numbers exposed at all.=A0 In those cases there's no way fo=
r
>> software folks to find out what they are,=A0 as you pointed out earlier.=
=A0 This
>> is the case with most DT compatible strings in the kernel tree.
>>
>> For example, we've integrated the NVDLA IP block, from NVIDIA, on some
>> designs.=A0 Any NVIDIA version numbers in that IP block will probably no=
t
>> follow the SiFive version numbering scheme.=A0 I'd propose the right thi=
ng to
>> do for an IP block compatible string is to follow the vendor's practice,=
 and
>> then use the SoC integrator's version numbering practice for the
>> SoC-integrated compatible string.
>
> Experience has shown that using compatible strings only specific to
> vendor IP blocks (with or without version numbers) is pretty useless.
>
> For licensed IP, I'd suggest you follow standard practices.

OK

> A genericish fallback is generally only used when there's lots of SoCs=20
> sharing a block.
>
> In these cases though it needs to be clear what bindings follow some
> common versioning scheme and which don't. That's accomplished
> by referencing what the version scheme is. Otherwise, I'd expect I'll
> see the versioning scheme copied when in fact the source IP in no way
> follows it.
>
>> In effect, an SoC integration DT compatible string like
>> "sifive,fu540-c000-uart" implicitly states an IP block version number:
>> "whatever came out of the fab on the chip"[**].=A0=A0 I'd propose that e=
ven in
>> these cases, there's an advantage to keeping the "0" on the end, since i=
t
>> uniquely identifies an SoC-independent IP block, rather than just the ty=
pe
>> of the IP block. =A0 But if the "0" on the end of the SoC integration DT
>> compatible string is problematic for you, we can certainly drop that las=
t 0
>> from the SoC integration DT compatible string, and only suffer a slight =
lack
>> of clarity as to what version was integrated on that chip.
>
> Personally I'd leave it off, but I'm fine with either way. It just needs
> to be the way you document for SiFive IP blocks.

OK, we'll leave it off.

> Really, I'd just like to see folks get better at putting version and
> configuration information into registers. We only need DT for what we
> can't discover.

Yep, agreed.


- Paul
--8323329-964611338-1542409835=:25712
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-964611338-1542409835=:25712--

