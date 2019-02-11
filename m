Return-Path: <SRS0=4uv/=QS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DFEDC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 19:59:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F4F82083B
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 19:59:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JC7eoxk0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="GAvR1Cyi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F4F82083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=h2yj0mvbEzR6vYgTWXGmBvbIzpNsXlUxzg36bhTnDg8=; b=JC7eoxk0tHBzjungel0Zau1xa
	YRVf/KTp/JwpopWVnFwmh7n5aL4nqUpOqd3j7rVmCA0lezUjYuJI+O7Jo2QHB9TtH7pq9cGIssyTc
	ym+5Fgbu+xj8jV72+F6EZyKy1dJvCsMCBgTwBVKBoJznlPjymJ6kohZVjqIcLpRXl+t/b2TIL/KTj
	Vjlivuwc1LvpHmuwPQSLI4sjkNmnn1nyaiOvUiZXmcQsQti7sY88+sTH11t2q2EdsW0xs9kIHfBs/
	iYFpWdsJJEPKyZjNsQxZSVChlWSQ/mrK12qiCP7GJG8oLVCHkvpHPuyqHErtqEww1fQ7oskBYmPNN
	NsLvIl/dQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtHk2-0001WH-85; Mon, 11 Feb 2019 19:59:46 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtHjy-0001MH-P7
 for linux-riscv@lists.infradead.org; Mon, 11 Feb 2019 19:59:44 +0000
Received: by mail-pl1-x642.google.com with SMTP id w4so75027plz.1
 for <linux-riscv@lists.infradead.org>; Mon, 11 Feb 2019 11:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=p7LG6nbJGBphYA5mjGXF/ASFTAHEuLrBAbiWaFUvMqE=;
 b=GAvR1Cyigt3nLSBgjRTrnQHigFem82pnPb6kHmFc+daUWKbXZKlDqRdoDJKo6PoSCv
 fkT7uvZhp6bBJJU+SFawInICRODezP/ySUBY09wi04/NcyM/+Jt1SC4sefjUD7qLk8bK
 KVVdUrLRO8np2qZXmuPKDEUjNIzxjr/ZpcwxZ4MPiDD+Ix9HZBHMJGqLRp/Nae8F5Xtz
 xrd6Setl6pB1Lgw/59hWgGaj7Gn52qQ/RFUkNC04LFvU0J4gvdwknE9y6JM9awFvA+SY
 aSx08HDEPE0NUYwMF1SQ5BLa3iWFHC2VxBCXysVSS+YVG5VAR6xygrQosoPiLcYexMHV
 o3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=p7LG6nbJGBphYA5mjGXF/ASFTAHEuLrBAbiWaFUvMqE=;
 b=SLuRRVswzF5Hmk7l0bFDrkd1j4T3dUGTDYM/EUgpFMe5p7dZMkD2gHdsoQg3vvqTtw
 aBURCOk7p24vZUVme2G1XgTqlI5A6oDbMHGeJapPj1uVQ4NcF6ujofHLiogOASaXtxhc
 flIgmRF+O8pu0rNCzAPbwbxqyVTmh7Gpxcr+/YsMpc/DyrcwS1Vbtb1Aj+qOV66OqltJ
 IBy/oHskyZgto9bl4mXwJxUPSEJd+kaNJ7cECi9UypShXDVu6+Z0mqtoJ2ZWpw5vXLez
 J3aGEEjJjQrZ1QijpMf31z3u/lHk1UWkm+snwrR+Dnx0McFIe+TIm1SZKiL0goolAgSf
 knuw==
X-Gm-Message-State: AHQUAuYbgGLEk+3SfdD86+7vZANKjgSc+FQ/m2WwAiPsA7ADSjpPGFw3
 fyCAU89hokCENSNokTbEqTkqyg==
X-Google-Smtp-Source: AHgI3IZ00uDMemnAYx7ttZMpn+gwjSEUSHeJuGwnRJxcnfNI+iTl4vt0TtmzqnfmtZFO1b5Dm7cv2Q==
X-Received: by 2002:a17:902:9885:: with SMTP id
 s5mr39626594plp.52.1549915182119; 
 Mon, 11 Feb 2019 11:59:42 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id d13sm18127615pfd.58.2019.02.11.11.59.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Feb 2019 11:59:40 -0800 (PST)
Date: Mon, 11 Feb 2019 11:59:40 -0800 (PST)
X-Google-Original-Date: Mon, 11 Feb 2019 11:56:26 PST (-0800)
Subject: Re: [PATCH 0/5] riscv: minor fixes and cleanups
In-Reply-To: <20190211093406.GW4686@localhost>
From: Palmer Dabbelt <palmer@sifive.com>
To: johan@kernel.org
Message-ID: <mhng-d0cd3a60-098d-40dd-912c-f0cb77d54ae7@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_115942_818067_9B53F763 
X-CRM114-Status: GOOD (  12.48  )
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
Cc: aou@eecs.berkeley.edu, schwab@suse.de, linux-kernel@vger.kernel.org,
 johan@kernel.org, atish.patra@wdc.com, anup@brainfault.org,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 11 Feb 2019 01:34:06 PST (-0800), johan@kernel.org wrote:
> On Fri, Jan 18, 2019 at 03:03:03PM +0100, Johan Hovold wrote:
>> This series fix up some minor issues found through inspection.
>>
>> Note that the fourth patch changes which cpu (hart) devicetree nodes
>> are enabled by following the Linux convention of considering nodes
>> without a status property as enabled.
>>
>> These patches are against the riscv-next (and fixes) branch with Andreas
>> node-reference fix applied:
>>
>> 	https://lore.kernel.org/lkml/mvm8szwwo1o.fsf@suse.de/
>>
>> and have been tested using QEMU.
>
>> Johan Hovold (5):
>>   riscv: add missing newlines to printk messages
>>   riscv: use pr_info and friends
>>   riscv: fix riscv_of_processor_hartid() comment
>>   riscv: treat cpu devicetree nodes without status as enabled
>>   riscv: use for_each_of_cpu_node iterator
>
> Are these still in your queue, Palmer?
>
> Note that the node-reference dependency mentioned above is now in
> Linus's tree.

They're still in my queue.  With any luck I'll have time tonight to go through 
by Linux patch review backlog.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
