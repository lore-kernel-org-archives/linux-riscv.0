Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB93C282CA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 09:20:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B59721773
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 09:20:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l1TSY9U1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ZpvEJHYp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B59721773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qmv08JG+X+P2PEdqjUpTcZZMw4sx4g31octn7flU6cE=; b=l1TSY9U1F4ZBs8822wBkJNLZO
	FgKhTS9WG+XBSFHVebt9Uc7d/iVKzyDIBeKhX/B22vOoaikQlXkOxlq/IIV7/v1hlxGXDIVL+zSlX
	i/2ix8UVChgbai/Mq4OgQ3rdqbXETyglqM6YDcKZUcOBhsQx+zHgwUM/Eyv9+oKm+Q7JW0hUSFPkU
	wpdYSuYPATseadE8wfe2jVn5XYTN2LMH4C5jccesG0DPVBqV6F5GSO/U9CATDCCG3/gOOLSyeQSD1
	j2/BmkQHSvETNzgDK7KLzpIGQlMZW8rCNqxZHSC0xpUMi9AU7UgBF4OamCZLFORGXQMVrNfjzhzDi
	8ohaAr9PA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtUEq-00026G-QS; Tue, 12 Feb 2019 09:20:24 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtUEn-00025t-Se
 for linux-riscv@lists.infradead.org; Tue, 12 Feb 2019 09:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1549963222; x=1581499222;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=0u22az8QufOyM/1E8fitgYFXGVFr+R6CmRAnfANUXRc=;
 b=ZpvEJHYp7rYnyK27h+mI4norRYSGKYDnq5ghSG+r67XYjnzRC0vsqYOk
 khheA6nfsBGojOBYJVZggst0aATqZJTYAd+u+e2bAe3qFADhnWGDWN8hq
 PTHNZuyMHgOK8OBuN5ms1IikyEg2FHJhSUFV1+Ucox3Mjwe6YMCnvfpRr
 9cWpg3/o3uV/TXXHftuwZMT6ZAAbjZ1jt4uTTfYpGllGMxmcowYfb+lz8
 F9N90v7IRV8kLK6nIenU1xJdCvnz7Yo7yY/TgNeAyxRq2RgZlw7WSzX92
 bS170gtooQHu5al6U868R+fhqbwFHKFUUQLdJLh9zHwQ5cxaVaO9IAgmP A==;
X-IronPort-AV: E=Sophos;i="5.58,361,1544457600"; d="scan'208";a="102774003"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2019 17:20:05 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 12 Feb 2019 01:00:41 -0800
Received: from ds141g2.ad.shared (HELO [10.86.48.95]) ([10.86.48.95])
 by uls-op-cesaip02.wdc.com with ESMTP; 12 Feb 2019 01:20:05 -0800
Subject: Re: [PATCH 5/5] riscv: use for_each_of_cpu_node iterator
To: Johan Hovold <johan@kernel.org>
References: <20190118140308.9599-1-johan@kernel.org>
 <20190118140308.9599-6-johan@kernel.org>
 <20190212071339.GL26747@infradead.org> <20190212082621.GA26912@localhost>
 <6518a7ff-0586-be7a-4a43-6c9a35194a05@wdc.com>
 <20190212085345.GA28278@localhost>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <3ceda2a6-72f1-bbab-96bd-5c1e91fff50a@wdc.com>
Date: Tue, 12 Feb 2019 01:20:03 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190212085345.GA28278@localhost>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_012021_965150_52C580EB 
X-CRM114-Status: GOOD (  17.71  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@suse.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Anup Patel <anup@brainfault.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/12/19 12:53 AM, Johan Hovold wrote:
> On Tue, Feb 12, 2019 at 12:47:09AM -0800, Atish Patra wrote:
>> On 2/12/19 12:26 AM, Johan Hovold wrote:
>>> On Mon, Feb 11, 2019 at 11:13:39PM -0800, Christoph Hellwig wrote:
>>>> On Fri, Jan 18, 2019 at 03:03:08PM +0100, Johan Hovold wrote:
>>>>> Use the new for_each_of_cpu_node() helper to iterate over cpu nodes
>>>>> instead of open coding. Note that this will allow matching also on the
>>>>> node name instead of the (for FDT) deprecated device_type property.
>>>>>
>>>>> Signed-off-by: Johan Hovold <johan@kernel.org>
>>>>
>>>> I think this is going to conflict with the ELF caps changes from
>>>> Atish.  Maybe the riscv_fill_hwcap hunk should be included in his
>>>> patch?
>>>
>>> Since that patch had some issues (e.g. the node reference underflow) it
>>> may be better to rebase it on top of this series. The changes are
>>> otherwise distinct after all.
>>>
>>
>> I have fixed the node reference underflow issue and made some more
>> changes based on comments.
>>
>> Some other patches(1,3,4,5) in this series may conflict with my series
>> as well. I can rebase my series on top of yours and send it as one
>> series if that's okay with you and Palmer.
> 
> No need for you to resend these patches as they are reviewed any ready
> to be merged. Just rebase your series and mention the dependency in the
> cover letter as I did with Andreas's patch which this series depended
> on.
>

Sure. I will do that.

Regards,
Atish
> Thanks,
> Johan
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
