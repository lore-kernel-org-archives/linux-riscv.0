Return-Path: <SRS0=rvuQ=AN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619AEC433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2020 20:15:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B7EC20772
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2020 20:15:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qq7GBpUQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="dRf5dm4D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B7EC20772
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:Subject:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FvAtq5jIBF3zGwAlrEtNCduNUXFz+eNeTbayCyuKf5M=; b=Qq7GBpUQlSdOpg
	VPglrrZxnaNpLYATS4weiUmm3Eh18ej5JkyTqWyeroUVqgEEF2DCo16JyhPWVFVEZS8XYsJPFKjRA
	WVT7pRpE8K9pBxZvy+jLOwdC7g495+cZ7dbIVJVnP148mRcfoKoH10Zegqk5xVqRHXRnVsXeAqKTR
	OF8Y87zDCbhITZfgNkqn7hmtNVLG9QFA+I6Bgi76BcDwmK8P1E2/nicWmt0tqCVRNauoieNjLQhg3
	dzgf+VVdX7z6A3Qe7sSYKx4qBQ5VLaNnbAvWmeQnVt+Uymd8ZTbw7ATf12urPxK8lxNcB9p0+1e/E
	lMA2e24RP65yXuYZbz3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jr5c7-0004wk-7t; Thu, 02 Jul 2020 20:15:19 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jr5c4-0004v7-Kx
 for linux-riscv@lists.infradead.org; Thu, 02 Jul 2020 20:15:18 +0000
Received: by mail-pj1-x102c.google.com with SMTP id f16so2593346pjt.0
 for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2020 13:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=zH1OE8zFlfUI0xkJau18IsVtj1xNxovgWqmYj0hlhZQ=;
 b=dRf5dm4DrCj2DrrTfDdxLdD05IEyUxzNftIlXwtZLthhnxuk5eUFs+xTT8P2sDB5Ip
 spNhUUBaxIuXjVmXGTxDbw9aAzpHOjpMuI+su5FsgqBknMlnGwWLO0dDc3VD0+xP2MJe
 ovVygEXX8N8gSbKgyWDeo4MsX3I+Cr0b+dqXztg+EsDB3pcaDvX8hssGayPgKp+qaqOs
 b5Mfedl/sYFCHwtxxYg9uYM4k78GOVDG+Ms+fMgwc6VNv52TFPA0dFoXbhuCBMFu/oPq
 lT8WaiANei7vCn4YUWEbWfab1J3OAy2B1jY67vcySk7j5MAUYgQfq9BqIv+oxsbWr+/j
 FJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=zH1OE8zFlfUI0xkJau18IsVtj1xNxovgWqmYj0hlhZQ=;
 b=rGej7PAiAstETyeZnSFnMinUfcA9oAfn5bmM/GDO1rlOkR+/l8tg/htfB4Rjne77ap
 nKK+V3oTYIc1n4MmOXt08XervVteVIVfgMzWHDy0zrJCLzU3bzZoesDcJxJZ1M4B9qGt
 w4u4tVB0HeN8zauMWYJ1IT6wfIwS23TUjwdrU6sx+J4TCL6ha8inbWrsZmS25sjS8j2A
 DbnEWUu+Qct2c4Xlz0CK9KbiR40vljqdPxCbSNNSBY2FU1CiJOZUwysiYCNpXy26nn8U
 3SeNCMHFEycrYtimgNB2yfDdI+SxUnLqODJVkg0HA0j7BnAXI8tBjplKIjEHMHSr1PfW
 EMAA==
X-Gm-Message-State: AOAM530NcX9vz0Vvy95SLoHCGJg74uw1IbMzv+4hRvOks0UJgLy20EVo
 pYAK7nM17zIZG1R51VOpY3qd/VmTWRhwvw==
X-Google-Smtp-Source: ABdhPJwZIKBmldr/MG9/HiGwBlenypFHOqZvI7XgYgekL4V74nb14NlmWIP0axWY2JOESN0z9HK+/g==
X-Received: by 2002:a17:90a:f18c:: with SMTP id
 bv12mr4048629pjb.15.1593720909383; 
 Thu, 02 Jul 2020 13:15:09 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id bx18sm922953pjb.49.2020.07.02.13.15.08
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 13:15:08 -0700 (PDT)
Date: Thu, 02 Jul 2020 13:15:08 -0700 (PDT)
X-Google-Original-Date: Thu, 02 Jul 2020 13:14:56 PDT (-0700)
Subject: We may be having some mailing list issues
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-2e9ce028-571b-4994-baa9-1c8a74923d04@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_161516_803205_1277B11D 
X-CRM114-Status: GOOD (  13.21  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

I guess announcing mailing list trouble on the mailing list is an odd way to go
about this, but hopefully the message gets through:

We may be having some mailing list issues that result in messages not being
delivered (even if they're on lore or some other list).  We're definitely
seeing some issues with the archives at infradead.org.  I know that when I post
from my google.com address I get DMARC-related bounces (via the admin
interface, so you might not see them) for message delivery to individual
subscribers, which is why I'm still using my personal address.

Aside from a few patches from Alex building up the sv48 (big page kernel
mappings and CONFIG_RELOCATABLE), the oldest message in my inbox is from June
16th -- so if you sent something before that then it's been missed.  If you're
resending patches then it's probably best to at least CC me, as that'll help to
cut out mailing list issues.

I took a shot at fixing the DMARC stuff a few months ago with no luck.  I'm not
really sure how to fix these issues, as I know little about administering
mailing lists.  If anyone has suggestions I'm all ears.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
