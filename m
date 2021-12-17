Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53509C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 10:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXEakCG9ddheTgznQ+9W12oqd3J90PZOegEjkSpr+PI=; b=kPRwgRH0oGnGXj
	sc/6XlaCB0vMNnK34+zOnDvt+++iFBgSXHQIkmavSSJ6AK44KdRlZHXUKt5JbNPyfc97yy5w4/Gs5
	+yvlLYiWl4Couv9nwUcytFDnFaBFHtGB1emQE2aC/QAqH+312Gx3e4zKNUrEHOxORACLSrKjk/gpJ
	ceZkcjtmP8GTkYeqfj9m8hYVfuexySYWyNRGiboAzbrWeJLDeHPkOJVmliWVXnRRjLjp89ce2KwgN
	Z4UVF0PZ0jNjtBe/4rYea38QAUwwswUF4PpHR3u5Q/fiJFnWfLbQTDX2HVDTLC1UFtd6tTFJh52wT
	s4EGTequg/CZwBWyekcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myAou-009bNz-0a; Fri, 17 Dec 2021 10:50:36 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myAh8-009ZLY-Ir
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 10:42:36 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3864E3FFD5
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 10:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1639737749;
 bh=Cch2YRuTHpQOb264zUOrMD/m+Xgx+o5ASl1QOhMgcdU=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=B/V7Ir2xde3eurTeOXfaIb7GPmZb2fMsQMjIfwiZfa5B0d3dO2zJ9XDDLKodXn4nC
 YeWGTGcNt/C7i3msoKKVN4tfJe7p+EKpOD8qXe16Vr/lCM76QzNFymdVGYLysVIIFn
 9URYh6h5+TQWydj9h1OITIZ8cbsqhxqUQZFYplTEEyDv+H+o6XqxGHH6p1ORw8WSQt
 AV1xT0sYZp1uEsTjq9uXC8zRKOWKOCwiEsqjj30b5wEzuroaLZBmGj7yTYnvjJ1azG
 0UKo59ra2LQGUTS/u3qJnlSt3//GEUra5vz4GHYO1SqZ3QLC5IafytnoUY94fkRVuz
 saze5kyXY1sOg==
Received: by mail-wm1-f72.google.com with SMTP id
 i15-20020a05600c354f00b0034566ac865bso841047wmq.6
 for <linux-riscv@lists.infradead.org>; Fri, 17 Dec 2021 02:42:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Cch2YRuTHpQOb264zUOrMD/m+Xgx+o5ASl1QOhMgcdU=;
 b=ULZD4SrwjVYNabuyeeqHclRxiILytFkT592wn+ycTFmwItJpLCVHOX8XYVojtiPRqt
 nXv7svUTHOD1HB2EFkHOuczEUx/LfaMXiidAriqmK+YZNpy0TQv+mRKNxYjLss2Ue0Ym
 MdRTF+fiQ8veyJ2iUNZn/AbUQ8qRebp6EuA9OYX+GN5o/O7WgvItDDV3v20gJBjC5PSo
 oIYx5cF0YAoEesR7WELAfINCO6OMTj91nujJj5Qt9dklu/3cRS6Z8bXYpLFwzEbgf3kH
 8qC/ae+auuV3vt1x8wPcLjQTpj1nBSElp0/3dGgKc0txyNywAT6tZodzy7RsjjDWiKfS
 /5iA==
X-Gm-Message-State: AOAM532z5jjoPyl6kRu0N4bgA3DF8tG55TMbxER9bu28GNuV5knPp1qn
 H/Ln/hdStnY5RgjszfklzoTumQ9SOWJMoeLtz4T7jt8iB/ZebTh3iatLAbtQbm5XIZecnt7NfqY
 hk+7/nMwztuMsrtjRsPGibeFvWE0oimQ72qKiy2zv3LnFZA==
X-Received: by 2002:a5d:64c8:: with SMTP id f8mr2199898wri.158.1639737748953; 
 Fri, 17 Dec 2021 02:42:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5yYBNvNIR6wOPIyl83PueKllFASZM93qe3PncXh68LjxD9RvBVSXqlHNHsv81WWLN5bSd4g==
X-Received: by 2002:a5d:64c8:: with SMTP id f8mr2199882wri.158.1639737748768; 
 Fri, 17 Dec 2021 02:42:28 -0800 (PST)
Received: from [192.168.123.35] (ip-88-152-144-157.hsi03.unitymediagroup.de.
 [88.152.144.157])
 by smtp.gmail.com with ESMTPSA id b19sm11536525wmb.38.2021.12.17.02.42.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 02:42:28 -0800 (PST)
Message-ID: <611d4055-c50c-55c1-0e02-43ffda66dbce@canonical.com>
Date: Fri, 17 Dec 2021 11:42:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 1/1] riscv: default to CONFIG_RISCV_SBI_V01=n
Content-Language: en-US
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211216123538.175087-1-heinrich.schuchardt@canonical.com>
 <BC1B38E7-1170-4C05-948A-D18E80AC49E7@jrtc27.com>
 <fd40010f-f2ec-b32a-6850-1e054af43725@canonical.com>
 <150C4E84-2C69-45DB-AF27-1E0C223D8D7A@jrtc27.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <150C4E84-2C69-45DB-AF27-1E0C223D8D7A@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_024234_955935_756CA6C5 
X-CRM114-Status: GOOD (  14.79  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAxMi8xNi8yMSAxNzo1MSwgSmVzc2ljYSBDbGFya2Ugd3JvdGU6Cj4gT24gMTYgRGVjIDIw
MjEsIGF0IDE0OjE3LCBIZWlucmljaCBTY2h1Y2hhcmR0IDxoZWlucmljaC5zY2h1Y2hhcmR0QGNh
bm9uaWNhbC5jb20+IHdyb3RlOgo+Pgo+PiBPbiAxMi8xNi8yMSAxNDo0OSwgSmVzc2ljYSBDbGFy
a2Ugd3JvdGU6Cj4+PiBPbiAxNiBEZWMgMjAyMSwgYXQgMTI6MzUsIEhlaW5yaWNoIFNjaHVjaGFy
ZHQgPGhlaW5yaWNoLnNjaHVjaGFyZHRAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4+Pj4KPj4+PiBU
aGUgU0JJIDAuMSBzcGVjaWZpY2F0aW9uIGlzIG9ic29sZXRlLiBUaGUgY3VycmVudCB2ZXJzaW9u
IGlzIDAuMy4KPj4+PiBIZW5jZSB3ZSBzaG91bGQgbm90IHJlbHkgYnkgZGVmYXVsdCBvbiBTQkkg
MC4xIGJlaW5nIGltcGxlbWVudGVkLgo+Pj4gSXTigJlzIHdoYXQgQkJMIGltcGxlbWVudHMsIGFu
ZCBzb21lIHBlb3BsZSBhcmUgc3RpbGwgdXNpbmcgaXQsCj4+PiBlc3BlY2lhbGx5IGdpdmVuIGVh
cmx5IGhhcmR3YXJlIHNoaXBwZWQgYmVmb3JlIE9wZW5TQkkgZ3JldyBpbgo+Pj4gcG9wdWxhcml0
eS4KPj4+IEplc3MKPj4KPj4gRG8geW91IG1lYW4gQkJMIGlzIG5vdCBkZXZlbG9wZWQgYW55bW9y
ZT8KPj4KPj4gU29tZSBwZW9wbGUgbWF5IHN0aWxsIGJlIHVzaW5nIGEgMC4xIFNCSS4gQnV0IHRo
YXQgbWlub3JpdHkgc3R1Y2sgb24gYW4gb3V0ZGF0ZWQgc29mdHdhcmUgc3RhY2sgZG9lcyBub3Qg
anVzdGlmeSBkZWZhdWx0aW5nIHRvIGRlcHJlY2F0ZWQgc2V0dGluZ3MgaW4gZnV0dXJlIExpbnV4
IHJlbGVhc2VzLgo+IAo+IEJCTCBpcyBzdGlsbCBhY3RpdmVseSBtYWludGFpbmVkOyBpdHMgbW9z
dCByZWNlbnQgY29tbWl0IHdhcyAyNCBkYXlzCj4gYWdvLiBBbHNvLCB0aGUgYW1vdW50IG9mIGNv
ZGUgQ09ORklHX1JJU0NWX1NCSV9WMDEgYWZmZWN0cyBpcyB0aW55LCBzbwo+IEkgc2VlIG5vIHRh
bmdpYmxlIGJlbmVmaXQgZnJvbSBtYWtpbmcgdGhpcyBjaGFuZ2UsIGp1c3QgdW5uZWNlc3NhcnkK
PiBicmVha2FnZSBvZiBwZXJmZWN0bHkgZnVuY3Rpb25hbCBzeXN0ZW1zLgoKT25seSB0aGUgZGVm
YXVsdCBpcyBjaGFuZ2VkLiBIb3cgY291bGQgdGhpcyBicmVhayBhbnkgZXhpc3Rpbmcgc3lzdGVt
PwpZb3UgY2FuIHN0aWxsIGNvbXBpbGUgd2l0aCB0aGUgZGVwcmVjYXRlZCBzZXR0aW5nLgoKSSBj
YW4gbm90IHNlZSB3aHkgd2Ugc2hvdWxkIGtlZXAgYSBkZWZhdWx0IHRoYXQgd2lsbCBjYXVzZSBp
c3N1ZXMgb24gCnN5c3RlbXMgY29tcGx5aW5nIHRvIHRoZSBjdXJyZW50IFNCSSBzcGVjaWZpY2F0
aW9uLgoKQmVzdCByZWdhcmRzCgpIZWlucmljaAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
