Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5939C77B61
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 09:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QM0J/PPeHUnojhAOkx6xfUnQOodNOJw6a6x8WLPfQkI=; b=078F0uxmlMtrPM
	nrJRz6PpMHbWMDALf7cIMqG1Npp9lVqJWf0wAZwnG4TfIqwX5xJizCe57pTprIu/ZlNs5GrsRMWFG
	fjFORbbf7SmCw3VzkkWVDlD4yC2WFKEpO2FEqzivHTmeOiWj2R4KduMM87+GZVPyyPIwJe44z/Xmp
	svB42daOsatAsUzbN6HJLv8IvZU7cdLNmANDk9NhG2QBg6PFSUOvaNp4K/WfoPzu0dEDgguULSQw7
	+U7zHLUWG2t3Nej/LAhDPY9CSZPdfTU31UmXkQNzPsZQCiwh/deUa9V2fPSAy1RCkNhOhCzfdVcN9
	NMExLRFC8BX+ywOl4geA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prFHe-000h20-09;
	Tue, 25 Apr 2023 09:48:26 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prFHb-000h0A-2w
	for linux-riscv@lists.infradead.org;
	Tue, 25 Apr 2023 09:48:25 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-3ef34c49cb9so64561cf.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Apr 2023 02:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682416096; x=1685008096;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CeWRGPx2LawBwBGvr0WFM+GqJWUBACPVQzzjgyj15yw=;
        b=SiGttW/+6v4IDlVVTRt0v4v3m8Io2FqeltpCVkli46UFyxzA+osamD2MUatPpJKmVJ
         fgCUX2/EgTDAbGQWKH6jmHmk3S+scJZ/xGkKt1oa0ZNXDn+zcrVGJt3X4W9Xy89l9bDz
         wJrOK+mLqS3MppcKi3Df23PlAv4tUYVgXoarmyPzHVNuzj16qE0IU0t3cd16YDsOAr+5
         tOIySf6cXAt1EGwoaeOUDN6dNXx6e8du22cTRXstSVv5u0HArhvkzaviR3i1hsJchfVp
         SEwbfbzoVz5hhDQDo9q5dd9SO5C5yvLFOdLo4YBWPOSq3MX9FS7oCOLHyoIYG0kN3kU5
         ZGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682416096; x=1685008096;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CeWRGPx2LawBwBGvr0WFM+GqJWUBACPVQzzjgyj15yw=;
        b=H7epEUxZRO+RRFWzrg1J0AX71yTUpX4N3QlfyEFSm8k8lJaWYhQrm8FIA4ww06k35s
         dJds3Eht4bsndg7l2egNSAIQlzCTkxmQZV8AkLBlN8ZXW3PfrG7nIOCUOvDe2VUe8Sv3
         7oEvBOyL7OoLI62ivIhUf1NV4xgMg1qZsgx1QZcZ7oGPLoALrKQA0mJG+KIArfzD0yfs
         W7zGfEam1bZuXPM6F9DL+BOQTDR8zhUNCwfeoMFnH5/XJ3n9C42vW8I0xCls7cjZ4CIS
         UBlDy9JgiSJaiqURCnMCPY78HCSvSLikaqORP+p/2Tsn1vh9za81KKd1xqd0FUi8OeF0
         gMCQ==
X-Gm-Message-State: AAQBX9d13mkJQoh8L6KHXs+lxtJ9Nv4G3wE1wUH68UV8cd8EWbxjyCQJ
	uIV9ZnCuLtBQFr/s1RnHAFSd4tjvW8qlRquVHvJb4Q==
X-Google-Smtp-Source: AKy350Yi/HK5wFCVHtgc0boND65EG4RC2aE2Ukvk6IvxUe2KzVKCjJaiyFXfHQ43mqzqfxrBi8TMa5kMTx6ltmj7w0M=
X-Received: by 2002:a05:622a:15ce:b0:3ef:3083:a437 with SMTP id
 d14-20020a05622a15ce00b003ef3083a437mr288540qty.18.1682416096501; Tue, 25 Apr
 2023 02:48:16 -0700 (PDT)
MIME-Version: 1.0
From: Aleksandr Nogikh <nogikh@google.com>
Date: Tue, 25 Apr 2023 11:48:05 +0200
Message-ID: <CANp29Y5dbsSjd5q2TNJYgO5U1d6wu+XSSWR3PHWTX_efg7VyEA@mail.gmail.com>
Subject: Resolving the `fixes` tree build errors
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
	Dmitry Vyukov <dvyukov@google.com>, Taras Madan <tarasmadan@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_024823_964947_22BE30B4 
X-CRM114-Status: UNSURE (   5.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Dear RISC-V maintainers,

Could you please consider picking up the following fix to the `fixes`
branch of your tree?

https://lore.kernel.org/linux-riscv/20230227072016.14618-1-rdunlap@infradead.org/

As per https://lore.kernel.org/bpf/871qkh9zj8.fsf@all.your.base.are.belong.to.us/T/,
this leads to syzbot not being able to build and fuzz Linux kernel on
its riscv instance for already 74 days.

--
Best Regards,
Aleksandr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
