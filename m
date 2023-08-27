Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41363C83F10
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 08:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OC3PnbrwzJHQVsQXhsv+8rvgHphXOHyma8e3w+y35Rs=; b=iKIdU2n/IH/bVz
	bl1F2LKgm89iv+bSvKthzTZmMBTq38G51d14umz7brPg7qHTGp9bDssGRzumdCRojVMCX/9LtpM9L
	8FxsdqoGW1OSRZYpxRyQehPNCG7HXVNzqwEYzr8DQCv//OIZk2CRkyiJFzd6RJUQwwhfk+F3bqiaQ
	Gr1RFdaGPHtSFTB8mSV62PVNoHBMB30zh7bxAPcvufq8CnBxD2DfldtJl7OhWIcpxhzt9vcWgbq0P
	hcn0MUr+w83Qkn2lJzSluSKkNfo56vrLRd0hsn2LZflDw5h2L7u82ggTzaicCWd1Aogpq++MP1etO
	xKI+EHmOUmVzkzWai9ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaBcQ-007hSK-1E;
	Sun, 27 Aug 2023 08:59:38 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaBcN-007hRy-2P;
	Sun, 27 Aug 2023 08:59:37 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2ba1e9b1fa9so34226021fa.3;
        Sun, 27 Aug 2023 01:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693126773; x=1693731573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDTbBWfZTyLSY1GxTLcGBmj9Y3R8+oQOjLKgrRVSRoI=;
        b=QsTJuukBOy9Wx5+UjxISZ03vjGGYXro+mcZAYFcirguMTn9wzEcqwl3AWIhPfbjSyk
         luVnPk0eM9dz9PKRvwu4DR210UOLRAd4/aBqeq6Fv8e7VamaG42C6935IR6Ypka1P2z6
         5lokt1yKQIEyNSrNa9Wpt4jrLPhkDto+udqpKpNpxXYxTBTLnYZreMAFn0Kthsq5TUzZ
         NsvqrXNK56usF0VJbCp4Fm2TE8tIzLSj/0agSbXp762Jtu6yFvc3ywz4kfYBRYXEcYRb
         A6yXEtiwgi0ehzbg2Ke0OYKeokPz9JJabP62Sk+aTjTDgwJkCq8s/CZWe2iEVVHcIeaF
         vhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693126773; x=1693731573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDTbBWfZTyLSY1GxTLcGBmj9Y3R8+oQOjLKgrRVSRoI=;
        b=NKyE792RwQ1xTRq4NpgunWiRIiWivhUeXueOI9xHBc1xB1cxz2/b3oCQpqoJH8GtsG
         fJueKNWACHv+RREaRhCymur1XquCEKej9QMlCUY+WcSb88cq5FhJrgXhqNd1KRUhUcfL
         d8DwKtvL7EKbEv27cBwv74PibiDuK4N1yGU0m74KPYjWCc3HAiv5zcj3e+eYnZoedFP/
         kNNO06vG0Dvdu8MPy9yCiJMh9xuKWJodFU1TZ627l+LNhCZTQM75OU33pBaRixsTa47J
         Tvv7d96vRWBIKVYiP8+edI/vDaA/rZuvcFFL/7Z/yRGLtfaum9pR/bfDNKujDhwufN9G
         f8vQ==
X-Gm-Message-State: AOJu0YxJL0CNYdIGLptYN/MPKaRwD3WIDI/E3W847ErOZfUDGplZ2QQb
	ESKsRcWGk5nkc2+UeiceL9FeWRd/mx6E84kFc6c=
X-Google-Smtp-Source: AGHT+IELcxDKtVSIb76h/AeuCg5XOvMcz/LwNeD+AyhN6t71aP3KPCKwg35DFtyslslGZGaVHIe92vXp93/iEL4SPfM=
X-Received: by 2002:a2e:93c4:0:b0:2b4:6e21:637e with SMTP id
 p4-20020a2e93c4000000b002b46e21637emr14351630ljh.16.1693126772636; Sun, 27
 Aug 2023 01:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690364259.git.haibo1.xu@intel.com> <ZMrVrXlvu/FJEayx@google.com>
In-Reply-To: <ZMrVrXlvu/FJEayx@google.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Sun, 27 Aug 2023 16:59:21 +0800
Message-ID: <CAJve8onbxHjJoC-k-TtOm1BBtjm38moaW-Kk8siKsxt9nwZZZw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230827_015935_786540_6EFE9E14 
X-CRM114-Status: GOOD (  10.95  )
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
bmQgYmFzaW5nCj4gdjIgb24gdG9wIG9mIHRoYXQuCj4KCkhpIFNlYW4sCgpDb3VsZCB5b3UgaGVs
cCBwb2ludCBtZSB0byB0aGUgaW1tdXRhYmxlIHRhZyBmb3IgdGhlIGd1ZXN0IHByaW50ZiBjaGFu
Z2VzPwoKUmVnYXJkcywKSGFpYm8KCj4gWypdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDIzMDcyOTAwMzY0My4xMDUzMzY3LTEtc2VhbmpjQGdvb2dsZS5jb20KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
