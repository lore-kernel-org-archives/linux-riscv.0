Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBA7C47DD9
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 21:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BHoeURjJ7FRWPk+I5qaKWtbigdK0II5n2tdH95aAMo8=; b=AF65f8aOJRbWHU
	vz88TtqhyR1vZYfs1fdEx751KNMe+07NIu+Q0XqbtgHriXnMtem1l9Ddmj9+JLMm1jFy5fhodSYeo
	wKkMxMNm/IXlmo6fFfXC5X+hUNxkJ6rTT69BBpdIFP933VlmafOkywZQzLbqTo0WJOTStn9t8doX/
	kaYnlqSki4m5EnMCvV0qUtmxPprIDVyAdkbZeRNmKd5/wtWxzEwgq73WCQgTx16eoAzxO+r91pXMD
	bTqruv93pd2egcgmUU4LJwjfbNC2YsI6K8WAUzczq1QElL30L846TgfmkItfd6zETA8q4gDqZJkJA
	9jCoTkTLRqdfr6bVJ5hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRJCx-008T94-2B;
	Sat, 20 Jan 2024 21:48:55 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRJCt-008T7D-03
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 21:48:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 35C03CE1D19
	for <linux-riscv@lists.infradead.org>; Sat, 20 Jan 2024 21:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B10C43399
	for <linux-riscv@lists.infradead.org>; Sat, 20 Jan 2024 21:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705787328;
	bh=w1FzR7rXZDAG95Z4hhOQkThbbze/zcwVMYt1WGmSrk0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ilwNI162FBpkwnKRHDOoUYOVHZfV77D3iZOoRj31PgMyJ1/Wg2bonK0B7XcAOL27w
	 nw0THXMEKmFPbyB1YSVxA59V6rjiE/c7/AJrOHxuelLHCzmKd2/9NMin3zz2Fm0RsH
	 +Pv9Timk/yW4qihHPVkZmiSsDBpqpJpsXWtqv7Fim7D+34d59PkrbmDyaVwivA70nI
	 KZDIEVAOGUwXiTe4wiQ8hzRrGpppffVQ0gNvSb3tK7anugV4VmH+1Ggg8F5qznKmJ/
	 Wuliwx9dK5qHHrfNtx373wRFO1JQLTmW7D2IxzUWj7zUh2U+aVxSLOfpK6Z0rVTWQN
	 59zYOhrwHDgZw==
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-59938699589so1062587eaf.3
        for <linux-riscv@lists.infradead.org>; Sat, 20 Jan 2024 13:48:48 -0800 (PST)
X-Gm-Message-State: AOJu0Yz2+Dzc8y2snUYQ++SDHqeQZXy4IuYm7QFkrZso0Z80Lg4bTyYh
	WJa8GsEsMLv7SqYoQsdGX/9Uky9WHuI40La0V3KFMOwcMtixncSniEgQfmQCAfT6pkDB+r7qT4M
	csel4qfUnykh2HSfVmG7wRCOXcV0=
X-Google-Smtp-Source: AGHT+IEx9PcXx/mfn28Guw9vSLfimEoqe9scEQf7uCCkYLu2lzRy4aA+upl+phU74jIfgxmU+HKxCxrMPVW5TFISuEU=
X-Received: by 2002:a05:6870:3309:b0:210:c8f8:2a43 with SMTP id
 x9-20020a056870330900b00210c8f82a43mr2032544oae.108.1705787328227; Sat, 20
 Jan 2024 13:48:48 -0800 (PST)
MIME-Version: 1.0
References: <20231117125807.1058477-1-masahiroy@kernel.org>
In-Reply-To: <20231117125807.1058477-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 21 Jan 2024 06:48:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNAStoCja1gnoFmsKikbzGZmKTcTu+Vc7v9zg8B9hwsH+iQ@mail.gmail.com>
Message-ID: <CAK7LNAStoCja1gnoFmsKikbzGZmKTcTu+Vc7v9zg8B9hwsH+iQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: compat_vdso: install compat_vdso.so.dbg to /lib/modules/*/vdso/
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_134851_221873_14D0F909 
X-CRM114-Status: GOOD (  14.98  )
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

T24gRnJpLCBOb3YgMTcsIDIwMjMgYXQgOTo1OOKAr1BNIE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhp
cm95QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gJ21ha2UgdmRzb19pbnN0YWxsJyBpbnN0YWxscyBk
ZWJ1ZyB2ZHNvIGZpbGVzIHRvIC9saWIvbW9kdWxlcy8qL3Zkc28vLgo+Cj4gT25seSBmb3IgdGhl
IGNvbXBhdCB2ZHNvIG9uIHJpc2N2LCB0aGUgaW5zdGFsbGF0aW9uIGRlc3RpbmF0aW9uIGRpZmZl
cnM7Cj4gY29tcGF0X3Zkc28uc28uZGJnIGlzIGluc3RhbGxlZCB0byAvbGliL21vZHVsZS8qL2Nv
bXBhdF92ZHNvLy4KPgo+IFRvIGZvbGxvdyB0aGUgc3RhbmRhcmQgaW5zdGFsbCBkZXN0aW5hdGlv
biBhbmQgc2ltcGxpZnkgdGhlIHZkc29faW5zdGFsbAo+IGxvZ2ljLCBjaGFuZ2UgdGhlIGluc3Rh
bGwgZGVzdGluYXRpb24gdG8gc3RhbmRhcmQgL2xpYi9tb2R1bGVzLyovdmRzby8uCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPgo+IC0tLQoK
ClBpbmc/CihpbiBjYXNlICJ5ZXQgbW9yZSBSSVNDLVYgdXBkYXRlcyIgaGFwcGVucykKCgoKCj4K
PiAgYXJjaC9yaXNjdi9NYWtlZmlsZSB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9NYWtlZmls
ZSBiL2FyY2gvcmlzY3YvTWFrZWZpbGUKPiBpbmRleCBhNzRiZTc4Njc4ZWIuLjVjYmU1OTYzNDVj
MSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L01ha2VmaWxlCj4gKysrIGIvYXJjaC9yaXNjdi9N
YWtlZmlsZQo+IEBAIC0xNDYsNyArMTQ2LDcgQEAgZW5kaWYKPiAgZW5kaWYKPgo+ICB2ZHNvLWlu
c3RhbGwteSAgICAgICAgICAgICAgICAgKz0gYXJjaC9yaXNjdi9rZXJuZWwvdmRzby92ZHNvLnNv
LmRiZwo+IC12ZHNvLWluc3RhbGwtJChDT05GSUdfQ09NUEFUKSAgKz0gYXJjaC9yaXNjdi9rZXJu
ZWwvY29tcGF0X3Zkc28vY29tcGF0X3Zkc28uc28uZGJnOi4uL2NvbXBhdF92ZHNvL2NvbXBhdF92
ZHNvLnNvCj4gK3Zkc28taW5zdGFsbC0kKENPTkZJR19DT01QQVQpICArPSBhcmNoL3Jpc2N2L2tl
cm5lbC9jb21wYXRfdmRzby9jb21wYXRfdmRzby5zby5kYmcKPgo+ICBpZm5lcSAoJChDT05GSUdf
WElQX0tFUk5FTCkseSkKPiAgaWZlcSAoJChDT05GSUdfUklTQ1ZfTV9NT0RFKSQoQ09ORklHX0FS
Q0hfQ0FOQUFOKSx5eSkKPiAtLQo+IDIuNDAuMQo+CgoKLS0gCkJlc3QgUmVnYXJkcwpNYXNhaGly
byBZYW1hZGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
