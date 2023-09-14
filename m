Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60A6EEAA40
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 14:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yCg25m2GDO4StvaSeCLS/CNZVcvSdhdS4KWnXVxYTnI=; b=myb9oqF/6OzJFy
	Y6WzmQ91PVhdbecqbDSdjNXyLVm6YH7V8uEFE+5PUPDPNCfqCDeAhhzrtfFjSjD1FVARLKOGYoPpa
	MwqdprYt6GI9L2UzUoquRLZySX8drdsZ1poLFoDqSqY5F5o2qGw6bU2rRLcBG26/e10lAoJ+Mcoqw
	5YKfzbM5Pygq8pMm0dWbq4msx4QuNhuLdItbxZksvlf8hnSHcRY1kjTEz5zDZeEVfA4AsXXBjVLE1
	Q8MQHK4VikF0ftpsnNa91l5eX45ONHNmvRQqvJxOAWodDl4rWtygRoIjnAx9a8FQ9x4LF8+8s4Ufp
	GAFbOw3k4OW3qhJJQp9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgn2X-008bBs-0U;
	Thu, 14 Sep 2023 14:09:53 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgn2V-008bBQ-0l
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 14:09:52 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d8032efa2bfso1445229276.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 07:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694700590; x=1695305390; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9IGYP5VQdwee25nV5jOO+j3P/uh5L2lbtVFrt/kEhY=;
        b=I0u2SNhq8KBGXY4+uCCMEepVnZU4wwGNuqLKquEEKHwAQwRzqPUBGdHJyDKvmQKjZ5
         LZNWnVfd37ar8qLYlHw3z1HkW8DB3XcXuE5chVhtVLDAxskjJhIlyiKkvGKNgkNcUJDQ
         zpa7oyuTYsKUWEYsjIABJ8HVA6SZcnvHEt0kfwisBWQ4PeUBpjKmisuLVIU//Z9DwU7O
         HGR6WWYtK6u9VotvZS4FauRuSaxtXiyC0AjcMUu+KvyIsk24nB/ItY3pQw9DPFaQ9jBr
         rfwBDQqeRzEwIn8gNu14pkRxy/DHSRHHuydOTHRXuzw6GHGf9NXze29n9dMY/k7MjnCI
         NxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694700590; x=1695305390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9IGYP5VQdwee25nV5jOO+j3P/uh5L2lbtVFrt/kEhY=;
        b=fdyS1mseaHycp04cgUDAC3iNd8/qReATOD/FXut+MVuB4m1HZ+LIbTi1wj3z6Ndc+g
         rVkMYif0gwq4O1+Fitb37STRaW8GNIBnFMVVFYdTu1Cpv+mOLVrf46+YnGj9Ns1G0aRT
         MF9ODeYIyCRL2H9yIxL9+jOFgfeDwBpn4XlXeMAYimi8iNf318tKloPt9vJbHZAlq3Jt
         qIc2QZ+xppmF7Z8rxlVtGQXR0GN54eWla10AnLJQQtQp9NlTYMfRLBkN/v94TYnZWfN6
         5M+sA6VdNqPtO+E0BMbq4EETXixer6jTpbN1O9X1sVDbO8YpNjeFzTD6Kcg8zgrgTUOi
         q0Kg==
X-Gm-Message-State: AOJu0Yw1Cqo6lcVpA08D5cn0/DK3m0JkxbMahN0lff9lqmMaR4l6gEYd
	NpbWIc4qb1o12p+gJ7+M0unw2ztEZO9ST+t4pQg+zg==
X-Google-Smtp-Source: AGHT+IEyLK5w2EfQvefblMOe1KUYzBa/9AVnRDeL+Ut6bf+JBgWjwLbElfH0D8BGNdeScufwUK1hsKQJF+zOJRBa99Y=
X-Received: by 2002:a25:7714:0:b0:d07:b677:3349 with SMTP id
 s20-20020a257714000000b00d07b6773349mr1369288ybc.25.1694700590048; Thu, 14
 Sep 2023 07:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230913-bloomers-scorebook-fb45e0a2aa19@spud>
 <CAPDyKFoENVp7+VjKkPpJWDecowxYD=QM6TSa6HjyzOZ=z7r81w@mail.gmail.com> <CAL_JsqLxxmdPTLhZ6MTfuAcM0V7pmfRLiK8L3AZhhQKcvy_PCw@mail.gmail.com>
In-Reply-To: <CAL_JsqLxxmdPTLhZ6MTfuAcM0V7pmfRLiK8L3AZhhQKcvy_PCw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 14 Sep 2023 16:09:14 +0200
Message-ID: <CAPDyKFo-KXK37iRwXZ631MH6L5_RbaezGUz5GAn8cVt4OzOApQ@mail.gmail.com>
Subject: Re: [GIT PULL 0/5] Missed starfive pmdomain changes for v6.6, now for v6.7
To: Rob Herring <robh@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, arnd@arndb.de, 
	changhuang.liang@starfivetech.com, jiajie.ho@starfivetech.com, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	walker.chen@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_070951_276359_1466DE27 
X-CRM114-Status: GOOD (  15.27  )
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

T24gVGh1LCAxNCBTZXB0IDIwMjMgYXQgMTU6NTcsIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgNTozMeKAr1BNIFVsZiBIYW5z
c29uIDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQsIDEzIFNl
cHQgMjAyMyBhdCAxNTo1NiwgQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToK
PiA+ID4KPiA+ID4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNv
bT4KPiA+ID4KPiA+ID4gSGV5IFVmZmUsCj4gPiA+Cj4gPiA+IEhlcmUncyB0aG9zZSBtaXNzZWQg
Y2hhbmdlcyBpbiBwYXRjaCBmb3JtLiBJIGZpZ3VyZWQgaXQgbWlnaHQgYmUgYSBiaXQKPiA+ID4g
ZWFzaWVyIHRoaXMgd2F5IGdpdmVuIHRoZSBuYW1lIG9mIHRoZSBzdWJzeXN0ZW0gaXMgaW4gZmx1
eCwgZG91Ymx5IHNvIGlmCj4gPiA+IHlvdSdkIGxpa2UgdG8gcHV0IHRoZSBoZWFkZXIgY2hhbmdl
IG9mIFJvYidzIG9uIGZpeGVzLgo+ID4KPiA+IE5vdCBzdXJlIHdlIHJlYWxseSBuZWVkIHRvIHF1
ZXVlIHVwIHBhdGNoIDEgZm9yIGZpeGVzIC0gb3IgaXMgaXQKPiA+IGZpeGluZyBhIHJlYWwgcHJv
YmxlbSBmb3IgdXM/Cj4KPiBJdCdzIGEgZGVwZW5kZW5jeSB0byByZW1vdmUgc29tZSBpbXBsaWNp
dCBpbmNsdWRlcywgYnV0IEkgc3RpbGwgaGF2ZQo+IG1vcmUgZml4ZXMgZm9yIDYuNiBzbyBlaXRo
ZXIgaXMgZmluZS4KCk9rYXksIEkga2VlcCBpdCBmb3IgdjYuNyB0aGVuLiBKdXN0IGxldCBtZSBr
bm93IGlmIHRoaW5ncyBjaGFuZ2UgdGhlbgpJIGNhbiBtb3ZlIGl0IHRvIHY2LjYtcmNzCgpLaW5k
IHJlZ2FyZHMKVWZmZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
