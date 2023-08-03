Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE011C001DE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 00:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bZp01Niwqxf8gfQwVAbG8suB1MNbUskB4Z67x3K3m3U=; b=J6sEETtLbVv2jF
	0k4mhkTQkAr3jHeKrV6Jm/y7dCwU1FyGhH+VIUgaOhImuw3eAx3YqipWC4YqwmgIWJxcs39QhmrZ3
	67Nwph89nX1V7HMhMXMvOPl2d4Zt2Y/Z2Uqe/aAj1xwFREkrjQfiQc/hcjIpX08RcBFwCXEcpyDT+
	NxAszvSb5wmmn2ypFOXnW5RHkcvrVcRDKDgAdplrJHv/CFz+HXaVJuIqPsFzNEs7f4q6f8bySZ3hT
	iv86+LkS8Tmmx0b4cgXYLMd8YqSkHtfeVVdiPJxOU9RrEaSqaTo/0w0uTHxFPW4M9uZYIuwLm56MS
	sUUtO7nHJnVaC80DtLpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRMB7-006GiA-1d;
	Thu, 03 Aug 2023 00:26:57 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRMB5-006Ggs-01;
	Thu, 03 Aug 2023 00:26:56 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b9cdba1228so5703201fa.2;
        Wed, 02 Aug 2023 17:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691022410; x=1691627210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoZdJRRCD7DIg3T8Q7QTkRnDEpeEEskUwca7pJG+IxI=;
        b=BV2XGnI/qFy1jP2RZrxxy5PawxaXrBSIao/gy4MzJBqpa4EbCFUEpNLyYig7VDdtj9
         v+k1mvb1C7xOquCCMI6G1VL2Aay0byu28r9oephZTneSQYDz5ce+mhkGeFK8/elA09OC
         +PuzYQBmeVSBl4B7Ax0khlHfW4Xm+y1N+SCl4YtsjzG1cn8NzrahMD0ilWBze8j05C6a
         F7jlgJZXO0K5FQsAl2kQXMmOBMS2ItO9LD3B8Iv32RmhV0c/CybF3iW7WKlR13haTlBE
         e+6pJFPOeCl5dS/Ho3NvMbHoJhk9WgG1jdovtQiigPstzckWOtNglqw7zT9XtCDKHT/2
         OloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691022410; x=1691627210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoZdJRRCD7DIg3T8Q7QTkRnDEpeEEskUwca7pJG+IxI=;
        b=Qdq7sKDjde0bRfq5VAz++P7/toj22xp+PYVNXKCgA0G9omKdRtN0DztkNMY+jgWM1/
         JWjriuWfoUlQIV20Mftwsxba2z+holBal1CkXdDy/6CFMHnNB83LabMvO4/GRTCGiF/P
         UizYunOUtZKbjOJCfsTN4EtYCb7fdvkYTqe8OFRv58FHX70deJoPwICgD3zjbxF0ANUd
         yHF9f2GD9dLNhoWx3VtM7Ki6YQUH/KGaiu2q9FaE4+5sggnvD/arWh//gVgWJMG2xkGa
         3K9Q850cVHWB8/vBnzT3HnDZBYHdaLgdQX4VDYvmWOTKfIkgL6XDJoIAYsKdDvbXJ4da
         3M6Q==
X-Gm-Message-State: ABy/qLZM4NoA8qYMwnKwBQ13z1J4K2s3GonfhWdeTdoyGPICtvIUUgbn
	pbrUZQS5QxtYcG9nMMZdrRrw+GoEoHtbUoNKBlU=
X-Google-Smtp-Source: APBJJlEcAwC99kXfiEl4UCa5fPyerikS8DcTMLizuQYjiq50F+4FTOBrsrpftIMhPY0eV8AIVrrKUx1zPtue/DCnV4g=
X-Received: by 2002:a2e:380a:0:b0:2b9:601d:2ce with SMTP id
 f10-20020a2e380a000000b002b9601d02cemr6671331lja.35.1691022410379; Wed, 02
 Aug 2023 17:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690364259.git.haibo1.xu@intel.com> <ZMrVrXlvu/FJEayx@google.com>
In-Reply-To: <ZMrVrXlvu/FJEayx@google.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Thu, 3 Aug 2023 08:26:39 +0800
Message-ID: <CAJve8omSEsGN6n9mzWLaPtu7-UxzP2mU3sw+h5AJwpgBrx4XgQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] RISCV: Add kvm Sstc timer selftest
To: Sean Christopherson <seanjc@google.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, ajones@ventanamicro.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Marc Zyngier <maz@kernel.org>, 
	Andrew Jones <andrew.jones@linux.dev>, Vishal Annapurve <vannapurve@google.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_172655_059280_3EB8EFFD 
X-CRM114-Status: GOOD (  11.48  )
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

T24gVGh1LCBBdWcgMywgMjAyMyBhdCA2OjE24oCvQU0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdWwgMjcsIDIwMjMsIEhhaWJvIFh1
IHdyb3RlOgo+ID4gVGhlIHNzdGNfdGltZXIgc2VsZnRlc3QgaXMgdXNlZCB0byB2YWxpZGF0ZSBT
c3RjIHRpbWVyIGZ1bmN0aW9uYWxpdHkKPiA+IGluIGEgZ3Vlc3QsIHdoaWNoIHNldHMgdXAgcGVy
aW9kaWMgdGltZXIgaW50ZXJydXB0cyBhbmQgY2hlY2sgdGhlCj4gPiBiYXNpYyBpbnRlcnJ1cHQg
c3RhdHVzIHVwb24gaXRzIHJlY2VpcHQuCj4gPgo+ID4gVGhpcyBLVk0gc2VsZnRlc3Qgd2FzIHBv
cnRlZCBmcm9tIGFhcmNoNjQgYXJjaF90aW1lciBhbmQgdGVzdGVkCj4gPiB3aXRoIExpbnV4IHY2
LjUtcmMzIG9uIGEgUWVtdSByaXNjdjY0IHZpcnQgbWFjaGluZS4KPiA+Cj4gPiBIYWlibyBYdSAo
NCk6Cj4gPiAgIHRvb2xzOiByaXNjdjogQWRkIGhlYWRlciBmaWxlIGNzci5oCj4gPiAgIEtWTTog
cmlzY3Y6IHNlbGZ0ZXN0czogQWRkIGV4Y2VwdGlvbiBoYW5kbGluZyBzdXBwb3J0Cj4gPiAgIEtW
TTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIGd1ZXN0IGhlbHBlciB0byBnZXQgdmNwdSBpZAo+ID4g
ICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IEFkZCBzc3RjX3RpbWVyIHRlc3QKPgo+IEZZSSwgcGF0
Y2ggNCB3aWxsIGNvbmZsaWN0IHdpdGggdGhlIGluLWZsaWdodCBndWVzdCBwcmludGYgY2hhbmdl
c1sqXSwgYXMgd2lsbAo+IHJld29ya2luZyB0aGUgZXhpc3RpbmcgYXJjaF90aW1lciB0ZXN0LiAg
TXkgcGxhbiBpcyB0byBjcmVhdGUgYW4gaW1tdXRhYmxlIHRhZwo+IGxhdGVyIHRoaXMgd2VlayAo
d2FpdGluZyB0byBtYWtlIHN1cmUgbm90aGluZyBleHBsb2RlcykuICBJIGhpZ2hseSByZWNvbW1l
bmQgYmFzaW5nCj4gdjIgb24gdG9wIG9mIHRoYXQuCj4KPiBbKl0gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjMwNzI5MDAzNjQzLjEwNTMzNjctMS1zZWFuamNAZ29vZ2xlLmNvbQoKU3Vy
ZSwgdGhhbmtzIGZvciB0aGUgaW5mbyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
