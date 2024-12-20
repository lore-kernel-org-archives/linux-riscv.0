Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E130EE77188
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 14:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FSXGSD2945WpEii6r1gnm4kuVRS5MfCufTDt7Caootg=; b=AZqFv/+nZXe858
	i58QHFpGmFrEj1/005oIlWsltQCVFXIUxTNXbzRKOukhhQEbIxD5D+sw5N7kBnJYFpfhIqSEguE0m
	T/ab1mwn/sg87CEQsJAVd3mF5MCMsgDOOC8jxfGnN1BOsoGfQp6HzUYb/ulwOoWB1vxVxBdL5ugLk
	JVXuF8ADiM+4rdRYiiRerbE6zUXBWpjcDtAovFPaFKgeL2qGyH5SVEk5mt/1iZCmEB1U1fNeKzXuo
	cLbNQS/0jYqxvv0nC7j/9RLEX2Rcbna9tTBeNMnKAMMsAoxSy3whllQVmbq0g30VYwJ7FIbTkzt4o
	kef+0Xeg4ur3cwFi7s1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeNA-00000005E18-079w;
	Fri, 20 Dec 2024 14:53:00 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeJS-00000005Cc9-0Rg7
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 14:49:11 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7ea8de14848so1276702a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Dec 2024 06:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734706149; x=1735310949; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOzsdU5wH6QqWPZT0BfjVQhxi5IMDVSf9h9b+uBoq/w=;
        b=c0vHQv3WSMbiGNZ8tmg2z04h4J9aD3ajn3kwXxSo+KeffsH8PNDLxXqS0XChXxRp7H
         Aw9RStJVsy86nHpGsf5Vz8nBj8pAa9pbl0YaOtBWsob96UmFchMhaWqmkqvZcjbwRzVt
         jYZx6fjbT4cN+L2Xlr7eyj79JnimWBLjT0DqT0Lr50vu6q3THIE2t0ZNqBlglDRwBLi2
         968cKX+Yvw0p2mQD2JRRdPicq9plC48vSIVdy2KvKbvnTTQqKm8GnaUMXZxb8iiP97iN
         e9Do8R9P/OXpweAFTUGES/MOAcAeZYdeZ5r7EzzXzUaNmea9orA3j8nKQQq+Z7EHCGWd
         nAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734706149; x=1735310949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOzsdU5wH6QqWPZT0BfjVQhxi5IMDVSf9h9b+uBoq/w=;
        b=kXPYI1ogejtgWsb7YDsIiHcQmtunn7FHOnbYJBlTRhgywJaPgde4GK39xpXqpMqxAx
         jra7leW5RdrurA4GC+G7oWz3enoMT05GqHgceLYkrSaPasjK8HlgRxx4LKW7kUxZZAZ0
         C3RpxhwCCxaMPthED3DfhC4Sz2kqCUXTB3vBmpoCjUMkdrGYfSoDob4/PrCtnjVqiX2g
         mnbrCHf6fH9pwSVxXbZI79OQ8/mHZPRdDVikmeKqyvDjYdcrWug9Luk6Hw4xSRHjI6sw
         oTRIcPorm+DcivaxvuCEPKsVJ6ZY4u9ZiSjKoS6xPYVENSFyz99ZY2aFPn98PG/6WWxj
         qBsg==
X-Forwarded-Encrypted: i=1; AJvYcCX4UWSuKJZDMn03kCLGSFUXbydYPJibU/XUy3/HcK7RSyLF5vNyPx6E592VXLpqygyP6kIGJLkBltejYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEC0T0jjehj4ueYKxam6yCvTswXiFKpWkstgS6mvXkcT+bA10k
	tAZLQiqVDMtCcBy+axzX7pVVCjX6bxGcsxwlo8W9lZx6vS8FrU59bvOk4Z9ahMWSlPX0ubMSe8Y
	yGddpiKrExF0HUTW/AQAur4VWb2o=
X-Gm-Gg: ASbGncsx42JmRpkOgqfuELiGzrUhDsSOZGgYqPB22ANIbguufjci2mAXYcU+JHfLC3E
	3XreChkLwJqprBssi7f87AOP828O25dCrYqyqzc8O
X-Google-Smtp-Source: AGHT+IEGOpRgGL4fxbzmlh60AJ8rZTCdiEbNlK+MbfNd+Pzh/6W3l6stO3h4TXd5mlsN7u8Z6AoXlf8vbsEP+XXl4zQ=
X-Received: by 2002:a17:90b:5246:b0:2ee:4b8f:a59c with SMTP id
 98e67ed59e1d1-2f452e490d6mr4128814a91.22.1734706148500; Fri, 20 Dec 2024
 06:49:08 -0800 (PST)
MIME-Version: 1.0
References: <20241220083926.19453-1-yongxuan.wang@sifive.com> <20241220083926.19453-3-yongxuan.wang@sifive.com>
In-Reply-To: <20241220083926.19453-3-yongxuan.wang@sifive.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Fri, 20 Dec 2024 22:48:57 +0800
Message-ID: <CAFTtA3M0uS+j9W0p78_iwSUVjh0BiV2bdp8ByT4f7pHah3QNeg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: signal: fix signal_minsigstksz
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Usama Arif <usamaarif642@gmail.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_064910_146273_916CC02F 
X-CRM114-Status: GOOD (  15.61  )
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

SGkgWW9uZy1YdWFuLAoKWW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFuLndhbmdAc2lmaXZlLmNvbT4g
5pa8IDIwMjTlubQxMuaciDIw5pelIOmAseS6lCDkuIvljYg0OjM55a+r6YGT77yaCj4KPiBUaGUg
aW5pdF9ydF9zaWduYWxfZW52KCkgZnVuY2l0b24gaXMgY2FsbGVkIGJlZm9yZSB0aGUgYWx0ZXJu
YXRpdmUgcGF0Y2gKPiBpcyBhcHBsaWVkLCBzbyB1c2luZyB0aGUgYWx0ZXJuYXRpdmUtcmVsYXRl
ZCBBUEkgdG8gY2hlY2sgdGhlIGF2YWlsYWJpbGl0eQo+IG9mIGFuIGV4dGVuc2lvbiB3aXRoaW4g
dGhpcyBmdW5jdGlvbiBkb2Vzbid0IGhhdmUgdGhlIGludGVuZGVkIGVmZmVjdC4KPiBUaGlzIHBh
dGNoIHJlb3JkZXJzIHRoZSBpbml0X3J0X3NpZ25hbF9lbnYoKSBhbmQgYXBwbHlfYm9vdF9hbHRl
cm5hdGl2ZXMoKQo+IHRvIGdldCB0aGUgY29ycmVjdCBzaWduYWxfbWluc2lnc3Rrc3ouCj4KPiBG
aXhlczogZTkyZjQ2OWIwNzcxICgicmlzY3Y6IHNpZ25hbDogUmVwb3J0IHNpZ25hbCBmcmFtZSBz
aXplIHRvIHVzZXJzcGFjZSB2aWEgYXV4diIpCj4gU2lnbmVkLW9mZi1ieTogWW9uZy1YdWFuIFdh
bmcgPHlvbmd4dWFuLndhbmdAc2lmaXZlLmNvbT4KPiBSZXZpZXdlZC1ieTogWm9uZyBMaSA8em9u
Zy5saUBzaWZpdmUuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHkgQ2hpdSA8YW5keWJuYWNAZ21haWwu
Y29tPgoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyB8IDIgKy0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPiBp
bmRleCAwMTZiNDhmY2Q2ZjIuLmI3YzkxZjU0NjQ1MyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC9zZXR1cC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwo+IEBAIC0z
MjQsOCArMzI0LDggQEAgdm9pZCBfX2luaXQgc2V0dXBfYXJjaChjaGFyICoqY21kbGluZV9wKQo+
Cj4gICAgICAgICByaXNjdl9pbml0X2Nib19ibG9ja3NpemVzKCk7Cj4gICAgICAgICByaXNjdl9m
aWxsX2h3Y2FwKCk7Cj4gLSAgICAgICBpbml0X3J0X3NpZ25hbF9lbnYoKTsKPiAgICAgICAgIGFw
cGx5X2Jvb3RfYWx0ZXJuYXRpdmVzKCk7Cj4gKyAgICAgICBpbml0X3J0X3NpZ25hbF9lbnYoKTsK
Pgo+ICAgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX1JJU0NWX0lTQV9aSUNCT00pICYmCj4g
ICAgICAgICAgICAgcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoTlVMTCwgWklDQk9NKSkK
PiAtLQo+IDIuMTcuMQo+CgpUaGFua3MsCkFuZHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
