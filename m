Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E018DFCC9AA
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 02:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q23ANGZZl3To59p8IlDkPbsg48tnVtftYI3C7kLi4zQ=; b=OhQYY61gltXB0eXZ8AXKUbDel8
	gopu96KxwhQ0T6FMOLRuOx8LnjUSUGBoRtYW2qO+2sAjeu7doSrXL0RQL6CCrB4Xk/NfI3Ug5oAb/
	h/lwyaMNZEqwCXIVemBS9x+wcfZgmgqnR47CpB77iEZJ4H5EjQBFo8I24h6VFKMdR3w/MX0dRZ718
	KIij2lrf1hQy+QlDP7LfTavSVJG/Ign8LNmfka5w0BLHEZokBNP/lnY1qBzf4mvqQDmL6hFUGJQ9Q
	d3HDOfn82Q6IjqJiKrtwlK6SUsYZSUmNg3uAS+C8hd4IqiwPjmmQHOUg2fvy9ForcKpoWlP0F1UT0
	3U8mwk0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznIY-00000008bFa-1m4N;
	Tue, 10 Mar 2026 02:58:18 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznIW-00000008bFI-0494
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 02:58:17 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-1274204434bso8104409c88.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 19:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1773111495; x=1773716295; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sxlH9X74vyhrxb5FVYtDdw9Y8Mx6idydU5k2uIXNGOU=;
        b=cdhJ++wvLGpGwHLpGiOtPePQjuuSrz3NIOOxEtxk96f8rHCkeIv8+12LWamWnJ5+sN
         iyDIBgEDjDfloX1ww2l+vFzydelzN4uYyeFdUJvM02/j3ZmL8bHALYgrmMv1vTMsHBaV
         1OJNH8dKcnizk4uZZjmyAsZiD8AQJwVzr+5h0jK2vMvCtxkt5IXelcUXGb8OjIn4u43h
         GDtFTIEQpGRyR7hPZE0iOpXtzqy7sf5AbXnMYm21aaipZFNFpf3vnkfiEZ20KOSEwwt1
         WSYL+bP2NdeRoFxVsLudGDK7N61trcWRkElf2m5BTcEDEka0/+ale8v2HdvCydZCIKWN
         mLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773111495; x=1773716295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxlH9X74vyhrxb5FVYtDdw9Y8Mx6idydU5k2uIXNGOU=;
        b=ej3gKF4QUlTT0FeYydIkOBNDw5g0E+ccNjvuoNHzf79MfXU4hSGKqsxXMdl518DpgL
         t7/iRnNM4SLAM9U0pgru7/k3TU0CI1MGS5XSJDHcNd8OzhvV2mplLmxxOfwLFHDqRSia
         fs8r92Of8T5VGFSVa1ZRRHEBAf2jARU+CSbPiZrzvF+iGNCTBC9CUiJmCZZv29mlP2hV
         SIvp4HcwL5cP/+DvO9AVxN11uK8iQBKLQcQwGGiqAXSAZqxNmJo0Iy8eULYl+yvGHa3i
         Haf3BBO2TduRf8dPWflxfAKI1sZzVGGW3FZcDiSvWXC/id1aLlr5tOiLlYwdQzhR6IRw
         uxxA==
X-Forwarded-Encrypted: i=1; AJvYcCXobiAcI1PGut6B3gKMXrnxwQRcW0jeM9pqnU/hcEbuQbYayl8+r7Rr5iGC2PdecRbcj8d0urg7Rc0xJg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwM/9XCMSGylHJaN1c8CjgvyNQUH3WSVHEabRolkVR3sgnt+F6
	MrO/GEPZeK3MyYli7F//pRi8MSmYNf6kf9eNirwEshovp9+97oZEnavf/RUkNgORLpE=
X-Gm-Gg: ATEYQzy7xy83rOvDbD7C16Gt6wPx/8/NCg+oHqn8sY+v90TjRfJmsbA9FRZ8vTa/Sgs
	hg/udPEOlsBXT1x87AtiYJ9OeeVZA6nFMCn3hOPrrCtTRTrHBRQ9NyaapA4VbP7pSrZ0buBORmN
	+j7XhCWl93hDn/MosCXIC0nYshpcym2iEIouGgJpBOjkGmJnx2+npv5mxuc039JjGtaOtu3l+8Y
	+lQKpU5N9cI+cyL1/YrSloZF2KKsktnBBmh0mdJKuIFlWmrLAFf5Hhs4y7wgJvhfCtv2cqiJD6E
	rZ96E1pVrdXwG90uhcXkyATig/fIILV9Hqp2lfOdwf8wPyt9LH+T09MPVp3O/Y1N3lmvLvF5XkU
	BhvogGLnMJgdh15CeW7s3PC+Wg/9ZG2UnAlB9ysCAOm8FAtB/AHUfcRDERcvy9wRrhJIEFRwS6n
	L7TOvOFo/oNpeQvpTod+b7GqGn2gQ3TQ+w
X-Received: by 2002:a05:7022:4588:b0:123:2de5:346e with SMTP id a92af1059eb24-128ddd84d17mr826349c88.0.1773111494689;
        Mon, 09 Mar 2026 19:58:14 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3f43593sm12578580c88.9.2026.03.09.19.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 19:58:14 -0700 (PDT)
Date: Mon, 9 Mar 2026 19:58:12 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: thecharlesjenkins@gmail.com
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Andy Chiu <andybnac@gmail.com>, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] selftests: riscv: Add license to cfi selftest
Message-ID: <aa-IxLzWVVGN88XL@debug.ba.rivosinc.com>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
 <20260309-fix_selftests-v2-4-9d5a553a531e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309-fix_selftests-v2-4-9d5a553a531e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_195816_050972_DC38B980 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
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

On Mon, Mar 09, 2026 at 06:52:13PM -0700, Charlie Jenkins via B4 Relay wrote:
>From: Charlie Jenkins <thecharlesjenkins@gmail.com>
>
>The cfi selftest was missing a license so add it.
>
>Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>

>---
> tools/testing/selftests/riscv/cfi/Makefile | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/tools/testing/selftests/riscv/cfi/Makefile b/tools/testing/selftests/riscv/cfi/Makefile
>index 96a4dc4b69c3..93b4738c0e2e 100644
>--- a/tools/testing/selftests/riscv/cfi/Makefile
>+++ b/tools/testing/selftests/riscv/cfi/Makefile
>@@ -1,3 +1,5 @@
>+# SPDX-License-Identifier: GPL-2.0
>+
> CFLAGS += $(KHDR_INCLUDES)
> CFLAGS += -I$(top_srcdir)/tools/include
>
>
>-- 
>2.52.0
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
