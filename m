Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C236C433E3
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 04:49:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 583EF2071B
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 04:49:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gg54FUlB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8kjBqlr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 583EF2071B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tOfRy0+gUot5/tUVmNwojHl/gi/Qy731Ah0LnWL347c=; b=Gg54FUlBxI2IxGFzl5YnLQQyFb
	QBUTyiDpSRBlXeECbN03omuiA9pUk3bEQxZF4S5q8pA8Tas/5lt/1FQrPxAAhWEjmn7bTDoa6jpwp
	T/kJXiUOD3wng7IdWbAKKTPEZhPhU1EkH6GUDcQOIKkf+KibCe5MiHadEB5esbMv2XkO4BsVysJFO
	QxYgj6ztVNBTvzu9C5iJOhQV0EJI2Xov8y0cdbiZHW90FJ7YHeqjFpdqplS1M+bjq5dZk43OeqhXx
	ggk9qIaULjxBsIzNA+6Yo4l50kU+eYGKAcAWrZOSt7x2aBcUtl0oapkDgTDvWIUzrRJPRj1XuPghr
	75yt2+wA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvvq5-0004ce-RQ; Thu, 16 Jul 2020 04:49:45 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvvq3-0004cH-8W
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 04:49:44 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 133so2232462ybu.7
 for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2020 21:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=oMiXNmMNkt4Y7BobkU0r37DCmJ0zlrJUpnYHtTG7A4E=;
 b=g8kjBqlrf/aep/v8LFiEp5ZNzCJl3R0ZYDJNxlP4o6p7TnxoGJkNCeu5nea4rLp7Av
 n/E//8/vVdc1uycdDC+YAu+ycD5rTSQ7/EA4Jspt7t0+vlVvQUCMuPqrEymHbP6DuxOE
 YOfBDB9V142YldtNQWW5wUzc3S9SA0KXI1yNj5Z95Qr59Kl7AJf6SHQuGlEEpeVrVHzu
 kwlk5Xdvp1fB0Bqcd+tTfAGys6Daz3j1azE3GgMcZ7swBoeFJ4qbmT+ZGkaR7kJWfHsD
 kt68lyFi9BtJtZq5u3XeWzdoPwUI37XXxyP9m/BBvNlkpNgYLndbj4+ylcydn0PQy0tK
 w41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=oMiXNmMNkt4Y7BobkU0r37DCmJ0zlrJUpnYHtTG7A4E=;
 b=uCKB8zeCZMnpHZbIlt1oWqV60fLqn6tGhKDomgzle1chsFUcjwf98NXjipgYGIulfN
 NagU0t0HOXnvvz4gB4wy8X0rKpLsxmQ3ZU/huRZjMQU8YZNKucHwJVR4dJJV7xsejuV4
 IHIMaI5v7Tr9J9yOSsn1qmfggvBgYQfKePBZPv54IevCgOug0IVmtChCRjqyHAvKHmBE
 w4a8voISK0wTWJDbMaLhmFnItOYOxV1BYWxo2urgimOSSYVr0b8WEOCcq1dw741z6W7H
 uwEmIR03uNnNT9/koyjzF7A4JUw+vouCfZpVMObWzcv3fu34/TZTNOAwL9YXpPWYci8Q
 L7ZA==
X-Gm-Message-State: AOAM531xvSKOAkpjdkpXQmYM+KAIy9UbAX36sxQEJ5KsgLAWVHZ/pC8W
 hNeDnLBS82Tiwk14eAv7suPnzOOVlE+XpWV5KVA=
X-Google-Smtp-Source: ABdhPJy+dHEnxq1OXT27mjMky5Jb2yly+EULFjDs/1LPdW2q67AAfmJgwGrLiPf5XaLWwbi+uMJ3U/QzoGVnGhPlP1E=
X-Received: by 2002:a25:e5c3:: with SMTP id c186mr3751845ybh.332.1594874980672; 
 Wed, 15 Jul 2020 21:49:40 -0700 (PDT)
MIME-Version: 1.0
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 16 Jul 2020 12:49:28 +0800
Message-ID: <CAEUhbmV=rThbdZnjY_cbkKBeuRYNL0O2QLoJQGFPRc90SZjHoQ@mail.gmail.com>
Subject: Patchwork for linux-riscv
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_004943_339401_E2992327 
X-CRM114-Status: UNSURE (   2.44  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

Patchwork for linux-riscv seems to be stalled.
https://patchwork.kernel.org/project/linux-riscv/list/

Or am I looking at a wrong place?

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
