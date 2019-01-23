Return-Path: <SRS0=FsxO=P7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C0BC282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Jan 2019 18:57:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A80A62184B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Jan 2019 18:57:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GTI6q5s9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Kbg9FiSo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A80A62184B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=bYvGGL3h0z76D2NgryZoySlZqMaW6y1UzsaeKk8FXYc=; b=GTI6q5s92BZTm/SNY9p2DQZL4
	swdFl4Lpgrpu6ILQclusL93dwFIPmd8dRMvlPwE7njy4cQMm4T0ub4odZ7oZuqu9g7qZ0nlNo1oSX
	GB0UIMWi7wQOafWqt8TrSYtWjPdhTsZ4oUT6ECeqU4oVIyRxs7w3yjhHz/Ex7dn7IG+8SUa4hKMjf
	oYWBvHwWUx307jJ5u/p+YvNYmMV3DGZPumIjNiiF0/nk9hIZpxo2iY4mst8l6WXowYA36xcP2HzYE
	477ZNEhu88V6cCUQWGq17bJSbjlFvjQ+K8dDMf13PQOfsiSo5QPxnOJ55QgXi0SsJzZDfJtL+B8fp
	zKqMqNLqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmNiH-0000Rm-Iz; Wed, 23 Jan 2019 18:57:25 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmNiE-0000Ou-1V
 for linux-riscv@lists.infradead.org; Wed, 23 Jan 2019 18:57:23 +0000
Received: by mail-pl1-x643.google.com with SMTP id w4so1630800plz.1
 for <linux-riscv@lists.infradead.org>; Wed, 23 Jan 2019 10:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=U1WsJmslgBLY9GOtslk4qThnp+cW4bfYpnkivVNFvQo=;
 b=Kbg9FiSoQ3iiZHLpbMKRis7X+dneMwpt3CspuoaHYPWKQTpfTfjslbv3ojZpwwvap8
 BVnF6j01NuEbrfNVWmmvtDnfIYND/qc8JcMQGAFY6eo4Wqu+67IDRlhnCk9IhVLv8bs3
 BdQadqXdDkygI1xkFkYD+SiYrLQ/Loi+tZcitoRSSzZJiqTE2ID6/wwFv2v3e42R8OD7
 u4oDWojQlImgZtfyZSevWn0nKgrzZhzPixcngvJ8+Q0SZrSv/Se9vT6t1faVelpj5lz1
 c2MkA69MZgSDZGiHRX5hCuK3IpT2SHvXw1VR6eSKqdLJ9W6Gw5Xp1Jk+SMDqVQIbXDd5
 pvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:in-reply-to:cc:from:to
 :message-id:mime-version:content-transfer-encoding;
 bh=U1WsJmslgBLY9GOtslk4qThnp+cW4bfYpnkivVNFvQo=;
 b=kX4JLoPr+PJKKGsvkyOEwbgSVIJe4drMi6gikXpH3hYiS//yLXRCMpTEroIbhGG2D1
 5v6GkvnKQkbUBr/u/RxmtBwlMOzK5jWGHIG6PrIBK9IEjNY8q4Ofpz/LfZyxlnGyn7JV
 JoKf+IiGihN3cSFY3a9bPTfcE2PU+wgyTFNtOA/fi+3kv5AfYygaaAx0v1yeYt3iwR2g
 RMdOhq5WqqyX/0Y6s1mooQ/KG37ws8VLJte9gLG2dpQ/b8QJW3CjaCyIdpoO0G6kAWLW
 kWA+7muTSTE6EeBVuqVnuQOeesS8Qj2TZaEpKf66xoDY2WiO1q/Btn6KQleWrb65vhge
 KZcA==
X-Gm-Message-State: AJcUukem3FSj5KPkai3XFz2hktuJ83srXZe6MCHw/7cKWVfz1yWD5zCi
 tmQapCGyK0WPg61LLoYulyytobRbMAA=
X-Google-Smtp-Source: ALg8bN4fDpKyTZzxVTaFe/IX0h487qc3QH33K9l6bQTgiDkuaLmcaJRwHhPabal11H74AvtgbnznrQ==
X-Received: by 2002:a17:902:bc81:: with SMTP id
 bb1mr3338500plb.223.1548269839630; 
 Wed, 23 Jan 2019 10:57:19 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id z7sm26302103pga.6.2019.01.23.10.57.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Jan 2019 10:57:18 -0800 (PST)
Date: Wed, 23 Jan 2019 10:57:18 -0800 (PST)
X-Google-Original-Date: Wed, 23 Jan 2019 10:55:42 PST (-0800)
Subject: Re: [PATCH] RISC-V: asm/page.h: fix spelling mistake "CONFIG_64BITS"
 -> "CONFIG_64BIT"
In-Reply-To: <20190108194538.28669-1-antonynpavlov@gmail.com>
In-Reply-To: <20190115135730.GI28946@infradead.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: antonynpavlov@gmail.com, Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-ccbc59c2-8283-46b1-9ae5-b9397e55752a@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_105722_301465_83F4264E 
X-CRM114-Status: GOOD (  10.04  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 15 Jan 2019 05:57:30 PST (-0800), Christoph Hellwig wrote:
> On Tue, Jan 08, 2019 at 10:45:38PM +0300, Antony Pavlov wrote:
>> There is no CONFIG_64BITS Kconfig macro.
>> Please see arch/riscv/Kconfig for details, e.g.
>>
>>   linux$ git grep -HnA 1 "config 64BIT" arch/riscv/Kconfig
>>   arch/riscv/Kconfig:6:config 64BIT
>>   arch/riscv/Kconfig-7-        bool
>>
>> Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
>
> This looks correct.  But I wonder why we even bother with the explicit
> width and don't just use "%lx" directly without the macro.

I don't think there's any hard reason for it, but from grepping around it 
appears other arches (arm64 and all the one-liners) pad it with either zeros or 
spaces.

I'm happy with the patch, as at least it's not broken :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
