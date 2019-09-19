Return-Path: <SRS0=fbrL=XO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2045BC3A5A6
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 19 Sep 2019 10:03:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E32F921924
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 19 Sep 2019 10:03:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q5EM7eto";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vaIt1v1n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E32F921924
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ItM12t5SJRmBTnjBqY9tNKOLoZdYUXo693MHPlMKJKQ=; b=q5EM7etocBrwmM
	exgoXa+ONN+H1HF4WujV9pqmk/UDWnP8EHzn/RXLEN+utJuDPPeIfPuMBnkbLM6RJB4tHKcLEaNnm
	CIWvkXLOhL3C7FrXjgF5F4MKjdtlS8cQkzYJVv0swXCI0ckEpall3MjiVjw0bXAtRzx45XPyYWlyS
	V1mfhJSMCJDCwKEHj9WaVtm596QWoExWzpXLgoU9tYSe9JthN6wgtFypdGWs0sFJuMTTPYLzkfLpF
	N6Z/6CKXgx2Gp9A+8ryMZT+3FXBId/A7kLqa9V+EQxihyXhg36aZmmO6z6HUlgQOQl5GxBkDhBeU7
	+VCC25atj0rGH68fMK5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAtHF-0001eD-Fo; Thu, 19 Sep 2019 10:03:05 +0000
Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAtHD-0001dM-Qq
 for linux-riscv@lists.infradead.org; Thu, 19 Sep 2019 10:03:05 +0000
Received: by mail-yw1-xc42.google.com with SMTP id e205so1012197ywc.7
 for <linux-riscv@lists.infradead.org>; Thu, 19 Sep 2019 03:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LbfIr6OQXLdhxdBKJUGehYuATbbMYOVoX4Zq+xNFWpY=;
 b=vaIt1v1ngk2wUVJXcbIHoIHXLmL/TBHF0n04p8ml3Py/MA8g4KOQUuvYwT3L9s9lLi
 c9v3H+DCeAX4bH8w3y84lLDGBPr2tjgxd4n7PXQeYGJBGs2e/d9aeX1iCXoCeKVvSnEU
 opDhtHqI72jUR3nG0aCOgdYskGwyuPoqGWbUvQCJ4Cyt6bjzjYgSf6zi36QDsUfVkOUc
 ZjoQhb5/TqJsZfKGFPlX6WEXMPWejaQbqucBQsLipMfyl702ZXRD4bv3s7v/dh0LHXOd
 aaOnM5Vp0EB5wWTC/X7MgBmi3M+cfNVbZ8KDCF8QxdZHFW3zqusodkQ1qDSueoZJnZpJ
 cxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LbfIr6OQXLdhxdBKJUGehYuATbbMYOVoX4Zq+xNFWpY=;
 b=tVwMRC+tIJuqntRVhal/kF+Rd6lOAyAgr0jIWWsIcFrEgXOPLKZdKZvh/SWIqHJM5l
 x5H1K/HBDZjbcmV8qQ755Bwa9EbPI7A96MgzshOrPmtkbc9b9kKjVwXPYN/2WcDaojsW
 piaGSm2asSGCm1owLRnWWZAvOQsYfWNbw3dH+f00qDjq9iEY34cMkvm1BPNnGpqjyAUT
 o9gxQq3viUKfurc8+aN0EUtWdbNkUs5ebdotPtNdMPUqiSAl7scaOPVLg6BYH7HuAwkx
 k4Qlnt3aAvHTFJKGfQjiicgwZllrj8EWtiUhs99aX1FQDHziUYxlEWRYLQHne27yLBqi
 +rPg==
X-Gm-Message-State: APjAAAVObOFN1OlC6DVSzOMFgbSQ02x/1ou/6kVux3n9N+cJ4ecgC3Rn
 Wv1OMHLbXqrvLhwxtTaMYPfOYxnbV98cxKgnDL4=
X-Google-Smtp-Source: APXvYqwm40n8QgsVc8kcRdeZ+GCKm2aFLW8M50nQbNWhjhpZ3gOFAMo8UIPXBM9A5RhIkOhVGakOs4Su+Xkizx3vc6g=
X-Received: by 2002:a81:310f:: with SMTP id x15mr7045781ywx.257.1568887382238; 
 Thu, 19 Sep 2019 03:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <1567687553-22334-1-git-send-email-bmeng.cn@gmail.com>
 <20190910061431.GB10968@infradead.org>
In-Reply-To: <20190910061431.GB10968@infradead.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 19 Sep 2019 18:02:51 +0800
Message-ID: <CAEUhbmVD8bfmELA30nLa-P5Y5CL4+z-R+bR5H=fKanuBrTNvwA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dts: sifive: Drop "clock-frequency" property of
 cpu nodes
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_030303_894067_04F1FBDD 
X-CRM114-Status: UNSURE (   7.36  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, Sep 10, 2019 at 2:14 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Thu, Sep 05, 2019 at 05:45:53AM -0700, Bin Meng wrote:
> > The "clock-frequency" property of cpu nodes isn't required. Drop it.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>
> Looks good:
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

What's the status of this patch? thanks!

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
