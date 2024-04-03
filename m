Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFF6CD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RIAoGYl5nihM6jv2Ywcl1yqR3S4RZHV/1FLo7rHbzJM=; b=LhYaU8asX2TWkU
	Gr8wkuCDzk9ez/PtQ1Nn2TeDjgK6krV8A3qWu+ZEGl3+zrsENfjcrHccIt4ViSDfSp6xsjdVzlawx
	kbLBuVfZQZnUQvAYQ9owKxr1ZR+2N287vSL0yW9T/LyRJUYahGXUuk03lYjdkgdcMraNMbN+td1Eg
	UdVbrOsmE9hxhhPT42wOenNUaXUyT6ccGHKIkgHQ6/J2djMxfRNdr/WXBwXd3O7zn3QlZN2+hkYA/
	HIc+Nr/EGFmv7QerX/2H2a3ltFORXavhKs1vB6QxFLUNs50oXT6m+wSi2f4Yo/YAjOmxLjpPme2l+
	Nazz/0oFEI1kt6WfrErQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsA0N-00000000X0H-3JOf;
	Wed, 03 Apr 2024 23:26:55 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsA0J-00000000WxH-1WNH
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:26:52 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-432b5b3dad7so2139731cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712186809; x=1712791609; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBcn9RQF0khXV9ZVvmQc6tCxymNH19L2614rNh3knFw=;
        b=VKNsnXdKcIdJ8y9HtVJ2vWrtjCRvqCg1uxIanvPcKZKRDmXWlF8wgYTQ8lkm17MmkI
         WGCNw36uJoR8H7j9vnyfUdnz3t/I6TX407KzLSrt76VVBsZuRE0YYM6KQbd/Q7lMPBbr
         18CR3CfFC6uYAqDIUQp1ESt56kShEDor4BLWvKSH2AYvNKOUTAAhk+EUU5JxG+EtIzkL
         R59Vxdi6ATH+Al0wljZiRMRvpo1vQmTM+XnsJby/T+giXRacQYyvylO/HBrIgVhPT7GN
         vRUDRkBNGUEf8Aug3Xqdh/xhxgQuqJcURRDHCjf+QqmHZxj52HwvaLUJ7kTI8S3UksWd
         HTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712186809; x=1712791609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HBcn9RQF0khXV9ZVvmQc6tCxymNH19L2614rNh3knFw=;
        b=VNCM0QIaFqK45YvHs45GRJELe9AoH4D7zakQ6xgL4yn/JTc17k2t4bGSsok2JGDNSs
         Kn/+8oFupynv0FpXD7TKYSqNp08dLVpOE+9bgwNnIKmHCg8JIlab5MgcoFQ7qcgG2SG4
         BmbVDUvldnPsYg4dvO6LwNIGo56HNRB9fhjA8Fm1n2S1jH3EbZ+tHSLYj7eZ6Xj3+mN8
         MpYai26ECwD/fLiOZIBU3FyXHGKTQ20AoNuFLs5IXrASLhOXgfd0Z7DTLSHM20xgCVGG
         vMn+ROhfJ+zOnZiRNzTlXDKPk5A2QHhjiMTR5Fv1gm29kSpTDawjXxvRdzXiNe/J4+Bn
         87Xw==
X-Forwarded-Encrypted: i=1; AJvYcCX23iEUfnHPBeXcqD4GGUpRUe5UtgjR37i1qyBzDPDRGk08FXF0dWW8G4zfZFlORK336jpE1lPyPBpjvD/i6/rofG5sp6Tnai64VkvxyTdw
X-Gm-Message-State: AOJu0YwiCwsw0W98p/Jf+sMrqLO1VUlUMwc2FXh3YgijCb1DCI3RNe9v
	Pnd4AZAKscRLhgq3MXyyik6TBtWTBFImaAwi5wm4/r8ewanRQtJyWfpzdwGmzRBjlLqSgxbFAvq
	FSCeuig1MS7hl77ZMwrNB6lrKHvzI6E7LKzKiXw==
X-Google-Smtp-Source: AGHT+IHsSnyuoqbKW/soc2+mRtnSGWMTbRhMNBsJqE1Slyi/NI5rBdix/XXtbL6+xdOG9m7FVsnvnJV9N4H6er3T94E=
X-Received: by 2002:a05:622a:ca:b0:432:b41a:17d4 with SMTP id
 p10-20020a05622a00ca00b00432b41a17d4mr691778qtw.47.1712186809558; Wed, 03 Apr
 2024 16:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240402051154.476244-1-rmclure@linux.ibm.com> <20240402051154.476244-6-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-6-rmclure@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 19:26:12 -0400
Message-ID: <CA+CK2bBTh_LSAtgx3hzmrrewtQ_rr=FUUmG85MBjAka5TvfdUg@mail.gmail.com>
Subject: Re: [PATCH v12 05/11] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pmd_clear()
To: Rohan McLure <rmclure@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, 
	christophe.leroy@csgroup.eu, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_162651_486602_7CDDCCFA 
X-CRM114-Status: UNSURE (   7.95  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBBcHIgMiwgMjAyNCBhdCAxOjEx4oCvQU0gUm9oYW4gTWNMdXJlIDxybWNsdXJlQGxp
bnV4LmlibS5jb20+IHdyb3RlOgo+Cj4gVGhpcyByZXZlcnRzIGNvbW1pdCAxODMxNDE0Y2Q3Mjkg
KCJtbS9wYWdlX3RhYmxlX2NoZWNrOiByZW1vdmUgdW51c2VkCj4gcGFyYW1ldGVyIGluIFtfX11w
YWdlX3RhYmxlX2NoZWNrX3BtZF9jbGVhciIpLgo+Cj4gUmVpbnN0YXRlIHByZXZpb3VzbHkgdW51
c2VkIHBhcmFtZXRlcnMgZm9yIHRoZSBwdXJwb3NlIG9mIHN1cHBvcnRpbmcKPiBwb3dlcnBjIHBs
YXRmb3JtcywgYXMgbWFueSBkbyBub3QgZW5jb2RlIHVzZXIva2VybmVsIG93bmVyc2hpcCBvZiB0
aGUKPiBwYWdlIGluIHRoZSBwdGUsIGJ1dCBpbnN0ZWFkIGluIHRoZSBhZGRyZXNzIG9mIHRoZSBh
Y2Nlc3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2hhbiBNY0x1cmUgPHJtY2x1cmVAbGludXguaWJt
LmNvbT4KClJldmlld2VkLWJ5OiBQYXNoYSBUYXRhc2hpbiA8cGFzaGEudGF0YXNoaW5Ac29sZWVu
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
