Return-Path: <SRS0=LzlR=MY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D192C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 11:13:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C8532077C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 11:13:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p+uNFUQg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOh/clhv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C8532077C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=95QdZ+5k96ieDCvdIamaTqa5tCbFP99ut2iZVk0P8+w=; b=p+u
	NFUQgU9DHnRAnk/ezCkmlTHukar+/3vOtUhbQfHlv8jJXBexd8VkE4SkOI9YyR1PR987QHMK68zYy
	7+Ca3r7sGlWGajyDr3gunrZJKMFqzkGiD8HKIOnOtMqR4r6C9daLtSav+CCKl8JziIxsBrSKL7eNQ
	ROXk5dxII/iBB+9+A02waQROcvXDgA23/3yP35oGcUSTy8tS44iq1Xh72VqZW+yKj0Ot+hfe88kod
	BPj2uFTfkrEbcA3UuLABrCq8uaq5FKOi2tJYN9OAVw9ggQTD8H6otQX0yX4+y1cDskQ6RHsJ8EnTn
	8jNsURCMQkqU2ZOoFe/bcc0Rn7Qkeug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gAvOG-0000oz-Jm; Fri, 12 Oct 2018 11:13:56 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAvOD-0000ns-Os
 for linux-riscv@lists.infradead.org; Fri, 12 Oct 2018 11:13:55 +0000
Received: by mail-vs1-xe36.google.com with SMTP id m5so11520173vsk.6
 for <linux-riscv@lists.infradead.org>; Fri, 12 Oct 2018 04:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=97bZcRnvuk0xAo4J3/iUJBKgZjQtzBtr9NN28v7vysw=;
 b=QOh/clhvL1OMyCKVhSmOt9DaqPd8NMiNz3Vl8uzDe977/2qU0uYrRd7dxBw1IbxHhW
 wcu1yWO1O2Gq+qY21ftfJIKTs9u9J3v2NZstxu+djo+b7CdU/2XR0CB3vI7Vas7Lcziu
 SkDqEyy8M9zISC0dAJSVmgZDNripVxWpydlEZbNb5SV2xeCodC8a/rAotr4erdXfO31q
 zPvEMkHvotvh4XbSVSr9i394pYA6Dvrsck0RRS2iewmoUL4wXE7X5zSBhCoPYaHSqV84
 Gs4wehPhsjYP8zXNZmsdjgOgFprJkzPy7wVi7ziBZ6eiOEPmBY+ucm9W1E/EGbjw12k0
 8hxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=97bZcRnvuk0xAo4J3/iUJBKgZjQtzBtr9NN28v7vysw=;
 b=AWfTysBiaijctrg8eJynQWSLQypcDbH4WquJa0Fpw6RLWwitc9L3AhNJqLlZTfAY3Q
 TdCvBWmheua+NpsXoZnzeJYPsaXdzqmOSFWN9Y6PBvGLCDEYG/pVBLC7I4SuNeyOh+G5
 n4uTTXR/xpkucEltoNZaYh2rSUdb36IbWqQSqa0lRlSOz3VTkcPpguTwJZbDRmS2FBWB
 IAZa8ADj/tnT0mZR/FPmpnOyYX0Ep6E6SEaGxdrsGPdyxnXgXLJgTK9LJxZFHPHLBgoV
 jL2y946rWombSsLZun9vKOWuNpTaOG+lxkth3L7T063ytJvju85DXX+EOTnD5NhVvovG
 y3WQ==
X-Gm-Message-State: ABuFfoigRdjWS5CXEsCgi2vy6zuhI2Pf3hlCohu8tLsfSml44TJP5lzk
 1/+T8ljAdzhzVn0PQcDISLW2VNhffRCzWn8l1h572w==
X-Google-Smtp-Source: ACcGV62wUmEYCWNG3D+rZcsZEksJGbi8NnMsAJhsuKkZWr0W06hgpvWrap1qlMFGreMHHRSsVBDPg/UM4/+gvL4FuC4=
X-Received: by 2002:a67:af0b:: with SMTP id v11mr2228528vsl.106.1539342821710; 
 Fri, 12 Oct 2018 04:13:41 -0700 (PDT)
MIME-Version: 1.0
From: Pintu Kumar <pintu.ping@gmail.com>
Date: Fri, 12 Oct 2018 16:43:30 +0530
Message-ID:
 <CAOuPNLjReF+EXOnQM9=e5cHUYOUWync66VMKR5Qt+jrN2WkG8w@mail.gmail.com>
Subject: RISCV - missing kernel features
To: linux-riscv@lists.infradead.org, Pintu Kumar <pintu.ping@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181012_041353_851284_C138E9DD 
X-CRM114-Status: UNSURE (   6.22  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20181012111330.2VdDfjdpyN1G_3VTs-Ado5YhIBPwumKIKUaBq_dEdzM@z>

Hi,

I am new to RISC-V.
However, at first, I could bring up riscv-linux kernel 4.18 on QEMU
environment using busy bear. Then I developed several sample
applications, drivers, perf, LTP tests and verified on qemu.
Now, I am curious to know what are the kernel features that are
missing in risc-v right now, and what are the plans.
If there is any TO-DO list, please share.

I would be more than happy to pick some of them and contribute in my free time.

Thank You!
Regards,
Pintu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
