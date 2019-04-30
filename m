Return-Path: <SRS0=JPD3=TA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC4CC43219
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2019 07:02:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D10E52075E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2019 07:02:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kDQZ8Pvw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="H8iIur7w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D10E52075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iUQlr4bGjJ4doAQUxyFEFcuU5Xv3Eeg9JXIdcPz0Xuc=; b=kDQZ8PvwWJgv8d/kaiPyHpSvW
	pHnmnC3cJWVF0dca0faObAnesOTxawUP7AonyslxZdeGtvu/cxAFkMa5R2yDeKAzNNeECinNWLqwr
	IxvvEps6/iD4tIB9XBTLzl1QtbdjMCfR9+uIGUJS3+5/CaRY2fKk9ZbDCRSqK+iVTu7L2HxqilioC
	hFRMOb6fYWX1SC8QVoCAs0IvEB/rABg0rXfkWKD0t0OsqWcT2dM4mQyVxKI+RyeJHwPDj07uez0RU
	7kO6utx6JYCcHBvNxuaMAd7K/GTTI22KeHhF8FzdLqYsrlNE+Ix/opV44AR1fK5o5+4F7AMJZLNaB
	gh8EhrkOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLMm7-0004Hn-UP; Tue, 30 Apr 2019 07:01:59 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLMm1-0004HO-Q4
 for linux-riscv@lists.infradead.org; Tue, 30 Apr 2019 07:01:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556607714; x=1588143714;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=8n6EaeW48PrrWrI6O68nRWKHHFqtIgZH5h/jIZE2emA=;
 b=H8iIur7wnUrCYBqI6zkziBii+v3Hc2mPjz0R0RGYdCTPZI8BI0dMGTsS
 wD7AoGXrISpGHv+/mo83wegr08ZmIo1A1mIKF5X4uamg9FluqbCJoRXTr
 oE7o7wA6LG2bA9F8tz7ORHR1uMIQOfPfdT8WKWhsHbah5Nj7pI5EFObjM
 DcOl56pwx8EVpehlKG771W7VU0qtF3xyKWE24etNzyma5lJ6G6onWceS6
 8JBMIVLg8hlna+eQpIzgafDhVnztYvWSY8S5ZMNMgywbpj6yS7xo0gcM0
 jajG1/J8R2bJ8GQsP4jqBsu2n6Y08Zp6sLPYlw9E/z43rCWq57FOvzm1a w==;
X-IronPort-AV: E=Sophos;i="5.60,412,1549900800"; d="scan'208";a="108865508"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Apr 2019 15:01:42 +0800
IronPort-SDR: lBgBoujcPuN40eDTqSo5eKejhgRr+AoQpiKK2NsFZyWRXoqZLs8AjqGYM2H06sUfmEYvo4Cn2+
 oW2UasjE6SfoBESvTJtDl88VFuh+I1ewBfOZgATWPS+gW5q94jQedwACqRHn1uR6M/jzR7Gbpa
 1Ygc8hc7gCgBQUM2HoT3OY5cZwhfI3vpnEcMZqghYl+WGE9bjcOrAaIlLag32z1be08W+FFsmz
 CXowbe14eTup6L8KmTnOrvnIpFSe+i3cajWbPIfjiOHThgMtRLnqSxGpSPOfRcxp7yGGzKHOLJ
 FuaZckBmRN5x+iyKemFvZJbG
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 29 Apr 2019 23:38:03 -0700
IronPort-SDR: V8FpbIILrmZlEWNywzIIeFQ6p3eKpRlWYNxEzYReZWV47Wtf3woyAd35c375i1ie32Y5Z6Qcnx
 Q1dfbi/+PngtaitPYuYIcAVPrRNhXuBHYMvZD8R6ie0fFh4jo8hJd5IlJk8QkI10eAkph3MELg
 kmi6oF4sMx6rNn1Tj5pRNWwXqHSEJEhRHUjcKhjk/JEz0ydelWS7hhkZOiOqk0R2IyFkW6HpYt
 XV4NbsSbbdewTu1FvOHFupBDCe68lDQTAMaax0CVsvI3a5w0LYtNNBB5T+31zE0GcbutkfZ8lK
 PJI=
Received: from ind005306.ad.shared (HELO [10.86.55.35]) ([10.86.55.35])
 by uls-op-cesaip02.wdc.com with ESMTP; 30 Apr 2019 00:01:41 -0700
Subject: Re: [PATCH v3 3/3] clk: sifive: add a driver for the SiFive FU540
 PRCI IP block
To: Paul Walmsley <paul.walmsley@sifive.com>
References: <20190411082733.3736-2-paul.walmsley@sifive.com>
 <20190411082733.3736-4-paul.walmsley@sifive.com>
 <256b9312-4740-e7b1-84ac-c0cc1ff4bc77@wdc.com>
 <alpine.DEB.2.21.9999.1904292258000.7063@viisi.sifive.com>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <67a4a4b6-e0d7-efc2-c318-a1138cddc9c7@wdc.com>
Date: Tue, 30 Apr 2019 00:01:40 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.9999.1904292258000.7063@viisi.sifive.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190430_000156_627204_236DFD4A 
X-CRM114-Status: GOOD (  24.79  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Stephen Boyd <sboyd@kernel.org>, "Wesley W . Terpstra" <wesley@sifive.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Megan Wachs <megan@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/29/19 11:20 PM, Paul Walmsley wrote:
> Hi Atish,
> 
> On Sat, 27 Apr 2019, Atish Patra wrote:
> 
>> On 4/11/19 1:28 AM, Paul Walmsley wrote:
>>> Add driver code for the SiFive FU540 PRCI IP block.  This IP block
>>> handles reset and clock control for the SiFive FU540 device and
>>> implements SoC-level clock tree controls and dividers.
> 
> [...]
> 
>>> +static const struct of_device_id sifive_fu540_prci_of_match[] = {
>>> +	{ .compatible = "sifive,fu540-c000-prci", },
>>
>> All the existing unleashed devices have prci clock compatible string as
>> "sifive,aloeprci0" or "sifive,ux00prci0". Should it be added to maintain
>> backward compatibility?
> 
> As you note, just adding the old (unreviewed) compatible string isn't
> enough.
> 
>> Even after adding the compatible string (just for my testing purpose), I get
>> this while booting.
>>
>> [    0.104571] sifive-fu540-prci 10000000.prci: expected only two parent
>> clocks, found 1
>> [    0.112460] sifive-fu540-prci 10000000.prci: could not register clocks: -22
>> [    0.119499] sifive-fu540-prci: probe of 10000000.prci failed with error -22
>>
>> Looking at the DT entries, your DT patch has
>>
>> +		prci: clock-controller@10000000 {
>> +			compatible = "sifive,fu540-c000-prci";
>> +			reg = <0x0 0x10000000 0x0 0x1000>;
>> +			clocks = <&hfclk>, <&rtcclk>;
>> +			#clock-cells = <1>;
>> +		};
>>
>>
>> while current DT from FSBL
>> (https://github.com/sifive/freedom-u540-c000-bootloader/blob/master/fsbl/ux00_fsbl.dts)
>>
>> prci: prci@10000000 {
>> 			compatible = "sifive,aloeprci0", "sifive,ux00prci0";
>> 			reg = <0x0 0x10000000 0x0 0x1000>;
>> 			reg-names = "control";
>> 			clocks = <&refclk>;
>> 			#clock-cells = <1>;
>> 		};
>>
>> This seems to be the cause of error. It looks like this patch needs a complete
>> different DT (your DT patch) than FSBL provides.
> 
> That's right.  That old data was completely out of tree and unreviewed.
> It's part of the reason why we're going through the process of posting DT
> data to the kernel and devicetree lists and getting that data reviewed:
> 
> https://lore.kernel.org/linux-riscv/20190411084242.4999-1-paul.walmsley@sifive.com/
> 
>> This means everybody must upgrade the FSBL to use your DT patch in their
>> boards once this driver is merged. Is this okay?
> 
> People can continue to use the out-of-tree DT data if they want.  They'll
> just have to continue to patch their kernels to add out-of-tree drivers,
> as they do now.
> 

There were some concerns about the breaking the existing setup in the past.

> Otherwise, if people want to use the upstream PRCI driver in the upstream
> kernel, then it's necessary to use DT data that aligns with what's in the
> upstream binding documentation.
> 

Personally, it makes sense to me. I am okay with upgrading FSBL to 
update the DT once the patches are in mainline. In fact, I used to do 
that for topology patch series. This will help to add any new DT entry 
in future as well.

However, if SiFive can share a prebuilt FSBL image for everybody to 
upgrade, that would be very helpful.

Regards,
Atish
> 
> - Paul
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
