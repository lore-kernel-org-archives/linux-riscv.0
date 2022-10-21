Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11CCC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 14:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lw2SZ19YrvoAWbhJhWIzl7U8qrX0MCYMb3XPMVOcu7k=; b=DFwaOIVv1v1hoU
	z0mPHjcRfBc1NtBreTo9+Ki8sRcA3rHb/hcxe8MwIJlQeoceKqr8+Fmh/cn+RREOdCFz7Bnyy1+4o
	oC/KEXDDmXd5l/0w3T8+3XuGHU1TCEk9BJfjFZKSEvOcBX9Rz+gCsiBS5roMOkSk1pvCLeJg+gRN5
	xTvMNppWxGTouEZxGiNhDnI0lqi0l+5N7hHuMXoOih+Eck8Cso6/WQPK65KJLJHsG2rk0JEvUydEo
	8KiVgJaqditnZ4pB4JyLlVqJwyUq65KR6DtMX54UKdS7l/5+iV1cc84lrG+yGRj4pKoPru9VTU0ZG
	RJHr2YlxNt2usJrYG1Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oltDb-008VjP-Hr; Fri, 21 Oct 2022 14:41:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oltDY-008Vid-QE
	for linux-riscv@lists.infradead.org; Fri, 21 Oct 2022 14:41:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4045DB82C2C
	for <linux-riscv@lists.infradead.org>; Fri, 21 Oct 2022 14:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9724C433D7
	for <linux-riscv@lists.infradead.org>; Fri, 21 Oct 2022 14:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666363306;
	bh=ropLClIeHzFRkVhJYXOsh1KnHR2hkSkJ7NM6ho2IP+c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kN8e2I0x6jmgx9kop7mSITV8Rqm4QU+8c0Be7/Bb/5PC5JQ6zoN1hL/hIAOSqU4o1
	 GSAAHt9qf0c9TVi6ksvMUh5ki00dahMuKNSmlO/bDY+0IErGYa3jPBmdPi0xT1D8sz
	 0a002Vdep6v2Nl89ppHI3kiqyI9CW8iGERxdB4bJxQUp9ZUzunzGt04Inx8Fh57afD
	 pXzsN1NSaSEDNxiWQcO2T8k2WvRDdyh3LWbG4HgO3RUlWwl4O09NzTLUkvM2REZTON
	 UEEFZQg6GV7jzAXat4R3OinHjqQwKwTpQPMc4gqsinKcnavd/WlwQlS66K+KLEhsaJ
	 FMqXcYT/zl6SQ==
Received: by mail-oi1-f169.google.com with SMTP id r204so649843oie.5
        for <linux-riscv@lists.infradead.org>; Fri, 21 Oct 2022 07:41:45 -0700 (PDT)
X-Gm-Message-State: ACrzQf0P49xJMfKg5B8cFi+Ujx/glbgZLaGNdUPxanysX/GV9zW4qbw5
	FCPfb15IliU8HFXG719mw9PxyE7W56IRnSTCiWA=
X-Google-Smtp-Source: AMsMyM6vmu+6l7PBPl70AuuJwzmJIjFT3lQyrGPa9CZ9CzkdkiEtFZNRG79H8ghNVYAPWvYYCNoj1G0z2mZ1h+SqLr4=
X-Received: by 2002:a05:6808:2222:b0:354:9c65:79ed with SMTP id
 bd34-20020a056808222200b003549c6579edmr23550708oib.19.1666363305134; Fri, 21
 Oct 2022 07:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221019154727.2395-1-jszhang@kernel.org> <Y1HZFcBo21SQzXVj@andrea>
 <CAJF2gTRAEX_jQ_w5H05dyafZzHq+P5j05TJ=C+v+OL__GQam4A@mail.gmail.com>
 <Y1JaE/ot91Z0KXuC@andrea> <ed7c4027-8e15-245f-cdda-0551063761e7@huawei.com>
 <Y1KdKATQx16Xl/iL@andrea> <f1eb4756-e1e1-1f12-e767-a69a891786d6@huawei.com>
In-Reply-To: <f1eb4756-e1e1-1f12-e767-a69a891786d6@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 21 Oct 2022 22:41:33 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRdtcpccL5W48O8VEXCMvxNAyyrKJzhwNJkc8js+H2iJg@mail.gmail.com>
Message-ID: <CAJF2gTRdtcpccL5W48O8VEXCMvxNAyyrKJzhwNJkc8js+H2iJg@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix race when vmap stack overflow
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Andrea Parri <parri.andrea@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_074149_017712_3E5DE165 
X-CRM114-Status: GOOD (  14.33  )
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

T24gRnJpLCBPY3QgMjEsIDIwMjIgYXQgOTo0NiBQTSBUb25nIFRpYW5nZW4gPHRvbmd0aWFuZ2Vu
QGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4KPgo+IOWcqCAyMDIyLzEwLzIxIDIxOjIyLCBBbmRyZWEg
UGFycmkg5YaZ6YGTOgo+ID4gSGkgVG9uZywKPiA+Cj4gPj4+PiBJIHVzZSBhdG9taWNfc2V0X3Jl
bGVhc2UgaGVyZSwgYmVjYXVzZSBJIG5lZWQgZWFybGllciBtZW1vcnkKPiA+Pj4+IG9wZXJhdGlv
bnMgZmluaXNoZWQgdG8gbWFrZSBzdXJlIHRoZSBzcCBpcyByZWFkeSB0aGVuIHNldCB0aGUgc3Bp
bgo+ID4+Pj4gZmxhZy4KPiA+Cj4gPj4gICAgICBDb25zaWRlciB0aGlzIGltcGxlbWVudGF0aW9u
OikKPiA+Pgo+ID4+ICAgICAgc21wX3N0b3JlX21iKCZzcGluX3NoYWRvd19zdGFjaywgMCk7Cj4g
Pgo+ID4gc21wX3N0b3JlX21iKCkgaGFzICJXUklURV9PTkNFKCk7IHNtcF9tYigpIiBzZW1hbnRp
Y3M7IHNvIGl0IGRvZXNuJ3QKPiA+IGd1YXJhbnRlZSB0aGF0IHRoZSBzdG9yZSB0byBzcGluX3No
YWRvd19zdGFjayBpcyBvcmRlcmVkIGFmdGVyIHByb2dyYW0KPiA+IC1vcmRlciBlYXJsaWVyIG1l
bW9yeSBhY2Nlc3Nlcy4KPiA+Cj4gPiAgICBBbmRyZWEKPiA+IC4KPgo+IEhpIEFuZHJlYToKPgo+
IElJVUMsIHRoZSBlYXJsaWVyIG1lbW9yeSBhY2Nlc3MgYW1vc3dhcC5hcXJsLCBoZXJlIC5hcXJs
IGd1YXJhbnRlZSBpdC4KPiBCdXQgYW55d2F5LCBjb25zaWRlciB3ZSBkb24ndCBjYXJlIGFib3V0
IHBlcmZvcm1hbmNlIGhlcmUsIHVzaW5nCj4gc21wX3N0b3JlX3JlbGVhc2UoKShhZGQgYmFycmll
cigpKSBzdXJlbHkgcmlnaHQuCldlIHVzZSBzbXBfc3RvcmVfcmVsZWFzZSgpIGlzIGZvcjoKICAg
ICAgICAvL2xvYWQgcGVyLWNwdSBvdmVyZmxvdyBzdGFjawogICAgICAgIFJFR19MIHNwLCAtOChz
cCkKCk5vdCBhbW9zd2FwLgoKQWN0dWFsbHksIGFtb3N3YXAuYXFybCBndWFyYW50ZWVzIG5vdGhp
bmcgYmVjYXVzZSBhbGwgaW5zdHJ1Y3Rpb25zCmRlcGVuZCBvbiB0aGUgc3AgcmVnaXN0ZXIuCgo+
Cj4gVGhhbmtzLAo+IFRvbmcuCgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
