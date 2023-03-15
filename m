Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C801BC61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 05:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=4KPNd/OtYxOsnlA2fnXrDYG/PSBqnbaj2gf1F/do4+w=; b=FTs7YtonDrr+dOXg6IJf6wJY/A
	L3gmgOz8y19uyQYpliNUZD2wWpzA/CQgjmuIa04dcHWf9dnnr4/Ceq2r8Ae3vBvCtn5MdOPiE7P0V
	0qoZNc/1zu5rLctNalixCPeg9Rk9bXSE4IylhYkmAB3dUMVGfd2vek4IRfEj6hd0gXknR9xmEWpdl
	atSlBlzQbcFSEHslF4w91ITkED4W3sBPpEt5G2enWur6koOaxpD2rTESXYcJjHzDKilYi94jS4u+f
	aDNgl5uvbWfydIIraI2dO4LQRY+3Eo+rwAk4rQTxtnIXESibuHiKAH0a+qgTo1MBL2qEe1h98K0GB
	v0DcFS8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcJO4-00CLZa-20;
	Wed, 15 Mar 2023 05:09:20 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcJNu-00CLXR-0M
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 05:09:17 +0000
Received: by mail-pl1-x62b.google.com with SMTP id iw3so2008135plb.6
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 22:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678856947;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cDhp6I3SlNxGtr/O2yKbwiije8DSntjdlAK0nvSsNNE=;
        b=fGqFohi/U0BaTxNiwoIwD6MODRfd07bt2ES8n34/VYOh/f4HlZWFxnzVvt4O3h+BRC
         /hAb0APS4PAYxvTzi2Wvcd3eeDXlio7s+9p4lZjr4x/yQzLq47Qr+hPKSTiT+7hYxBGs
         i3CDZA9bQAiO4CFCL1K6uKFdUBa8BMNqmI8DeAuDdPC7CW1PBcSNVA8fzPdMqp1iGZKd
         MYtTLzfNUmesH/WxmH5wiwAYCcRbvl3QewEWJlqd/12S9r1FfC8WwmpkbTiZH629IJDp
         o7GcnJZZQyUv4B7T5OsfTiVlLXHGXe1c9tlVmlHIevWqwcF/P2S3qs6EzumHpyHrdo2G
         DhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678856947;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDhp6I3SlNxGtr/O2yKbwiije8DSntjdlAK0nvSsNNE=;
        b=L7uyDErU1wziYWG748tHPfi/IFbooQl1eBGCbdDvb6v9NKd7zrYzsN5BrWRb5P2SOV
         mV1DuU6EJ7B7/SFdgrkFfLhslNs/lLSr4/qIvS+k8fjhjcCqR6wYDsUJVhI6qUGvRRQ2
         mPoluRfsJB08NGXb1XF2AYV9nvLE6MrWPhb3lAP4reUgWM/+qua8A1xBS1df933HJApj
         QpywI0liMsuAyIIr2xM92h6h8JYwX4W+r9eKuBtkSAbJthDPUTANSsOwu+htWS8dayRn
         qhcHtQyttOsBtAyKXvKHIl+jnikhVqAZdcDXXNXv1O5GWGjqX811cjXCBkR4mWYKiQvv
         Ve8Q==
X-Gm-Message-State: AO0yUKU6Pw4O3oOPC45Im8sPr0WGcsmF4hqAHioFZOjjiurC7FYEC75p
	orhQlRiLi13XNEY+wpFmzQ3+AVHCyky35lEu2Ss=
X-Google-Smtp-Source: AK7set8juefow6279l5hDaRc9EcSMejPwOhhh67Wy+KVPRNO0G7i+DJ7i60mGKb+GVMj9wBlxJ/qVg==
X-Received: by 2002:a17:903:1c1:b0:1a1:7b8d:670a with SMTP id e1-20020a17090301c100b001a17b8d670amr370816plh.21.1678856946844;
        Tue, 14 Mar 2023 22:09:06 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id gt22-20020a17090af2d600b0023530b1e4a0sm391684pjb.2.2023.03.14.22.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 22:09:06 -0700 (PDT)
Date: Tue, 14 Mar 2023 22:09:06 -0700 (PDT)
X-Google-Original-Date: Tue, 14 Mar 2023 22:08:14 PDT (-0700)
Subject: Re: [PATCH v2 1/6] riscv/mm/fault: simplify code for do_page_fault()
In-Reply-To: <ZBFRbVJDK8p5nelT@casper.infradead.org>
CC: akpm@linux-foundation.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
  linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tongtiangen@huawei.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: willy@infradead.org
Message-ID: <mhng-dc587968-81c2-4f28-8d27-f739230b25cb@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_220916_381851_74DC686C 
X-CRM114-Status: GOOD (  13.69  )
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

On Tue, 14 Mar 2023 22:02:37 PDT (-0700), willy@infradead.org wrote:
> On Tue, Mar 14, 2023 at 08:03:54PM -0700, Palmer Dabbelt wrote:
>> To make the code more hierarchical and readable, we fold vma related
>> judgments into __do_page_fault(). And to simplify the code, move the
>> tsk->thread.bad_cause's setting into bad_area(). No functional change
>> intended.
>
> I think this is exaactly the wrong thing to be doing.  Please _stop_
> using custom internal VM_FAULT flags, not adding new uses!

I'm fine with that.  The rest of the patch set was to chunk out a few to 
avoid them stepping on generic stuff, but we don't really need that in 
RISC-V land (aside from this, which is sort of a mixed bag WRT whether 
this is simpler or not).  That's sort of why I held off on merging this 
in the first place.

That said, the follow-on patches do clean up some mixing between generic 
and arch codes for other ports.  I'm not sure if those can manifest as a 
real bug or not.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
