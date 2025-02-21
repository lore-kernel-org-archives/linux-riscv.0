Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D84C021B3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 12:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ATFKR0UHusKHHtRoC+zkPWuqJij3XtpKr688nfivyZU=; b=LDXuGWMukgU+Um
	HEmAz4SGQSzKYZ3I6ii8wj/TSven75YE4eM0B0wO47pF8myF8oZH9/CEf6eWK21xUV+lPuEcCXx/S
	uSIjiPiFeR4OIDyInI1X1ulBklkEt34Sv70678okbx/3zAj8MZu73jZ6nE4ugr//VZ+VOkba1ZX0p
	5OJdhyC0bEzIOg4eIatOY/tsRm/kZh3CQXP1tTlouLGpmo0MVCfeS3CpbqNtq42hHwHFVrk1angMe
	MXW3p79rO+Ac275zRcv/y24x3SEdIysM3Gxz/zMPzB4D+W33Gla+XgjNR0VC7W8Qtr1t3cUtEag44
	AU/RWYZZvm4a8Mkr9WUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlS6u-00000005TEh-1TC8;
	Fri, 21 Feb 2025 12:26:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlR56-00000005JbG-2sDa
	for linux-riscv@bombadil.infradead.org;
	Fri, 21 Feb 2025 11:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:Subject:From:To
	:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HVNBNWqXlEkHBpelyjOliwzjP+Z7atB2V59Z13O6URI=; b=ndq7rrSp58Fr34f4TtJ82YRtJE
	zj1X9KhkdyID5tt0Pmq4QA+FYl3gNYzOpePiCEC5MZT+7mcXIeY4XxmBQEmoWVefOh+RXKRH58m7R
	kTFm0zF5M8AtgahhAoxqqSVieMCMSPUfCE9vLiMoowMS0mLMUd5wM3hFmT2v2vRXZDcvHPtBVYjIo
	9tHNX4S0IsJ5OEJz7LGE64BQd9Izn2Vw31/CSuKCq3OQbIM8DNMLiMfm/q5FIEIeHDvH77oKhEzJM
	wjCOGgqosiafQBkxB08bCR5VR49Db5y+mRpmWUV9BadlSjeJLni5jMuGW+715E75u3ExMqw6V2W9m
	ga+F3jwg==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlR52-00000002dA9-33Vn
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 11:20:31 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38f3311ebd7so85033f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Feb 2025 03:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740136826; x=1740741626; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVNBNWqXlEkHBpelyjOliwzjP+Z7atB2V59Z13O6URI=;
        b=DIwK6E4haqCplijF6uFw9V0N1gK9p4x3aw3O29DU4eUr0HgtxPvQTcHwVc5L3qmaPY
         oOSJTDLk70H0yt3wKDDCJVztL/Mo++awGPe2OXppcUviRopm6Xg+E/52j10CH3C2ODRA
         JLNuQZdizyB/t0it9DDX9Xpsy1e09+DJFLgol+sGbg93OeOxnzOVihkOstLlMklr5aM1
         jDad9koEJKbXbiNSJLSEsGELB7aTD4Q7048kG3Fj2VRQ5m2IWMo7HK9aCz8vzU/jr52V
         nUyJbjlvWoC1zQHuLUWxB9wklFPI5mylJ6Lm+fk0D88hzjphTUz+zP/MCBsq/1ATNCMf
         yp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740136826; x=1740741626;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HVNBNWqXlEkHBpelyjOliwzjP+Z7atB2V59Z13O6URI=;
        b=X7TzeuG2of8l3i6j/c6URmgrbqEpOPsKwRX6ZLLZlq4mFXGTCaJT/YD6QvTvUosVeD
         JGul/Y1f/bPjVmvrzX+HuOkgfQUpLZFdA5VSX6nPoFxtWblruUZJwX5LTtQE7dC/OcmV
         ZaYB0Zs8lY/C3PSxibXKj/QvyoSj+BP0Nm6CqDJcf7ygQm0YoYEfkwpetxRgFWPrgtxE
         HjrtVNtNJmL46iXFLG1Q4Q0/FcUrtxtf6RICx1xXyeChFydCzJa5KAXHLIqimfZ2etjR
         IzzaPmN9C3nmb9c1vtMk93OUhHl8RvDjhQSHSWxn3MrSoNdqc8CZtCTEoF+qfTxbsif3
         DiBg==
X-Forwarded-Encrypted: i=1; AJvYcCWsJwzbkrusveHo6lNZoMJlJoVpO4k7kcYfwNFdR3DEK1psmFJqgdrZ16G4eAZfFn1BDBiplD90V3o38Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTwmfErmkckP7wZk4eTb7lhjSGxuiqjp/HWNDWMTJaGbXqC4si
	exrhR6qqWR8Nv8E5xwlXPW9V5R3n/2k8ExWqqly2yM2D4380qcgKqIi210AqKZs=
X-Gm-Gg: ASbGnctfBq95TgPGdHhYHNDpQv5CO0cXHh5PXCV4J3cFntNA8jiwXyp8Q0dwIRV7v+/
	7gb72CN8I9lsI387OBd+Fivs2QioZqrdOLItKZb0+anoHymaYO6E2gXtg1uHkd9MuixN+RFQ3ip
	LKVdY7iKkiPLyBGeoQAtSF+lozKVLUtGyWKz9r66mHc/LmcqrsQFaVbGV8/f8PjyJYQYuc7XHA/
	X1Qg77kVwX/hT1JmICcwTIR94FfbzP0zsb1ryQiMB7V3/T2/JGAwMwOkS0WwFhySPljgmGqO4kL
	IebD4hKuEdnNPh6X1evaPN9RtEmiL0+m7n3+UMQiCimpQzGXs4VivSkjxxt1NjyOjds4i7R1ESE
	YcpNMo9SXt699IH4=
X-Google-Smtp-Source: AGHT+IH7K+hzKcKXQTAM1MJlY9T9odHfHdYNa2eoNCcz78onWDZURLkgur4LeY451LSe8tRmqDN2LQ==
X-Received: by 2002:a05:6000:2a0c:b0:38d:cab2:91dd with SMTP id ffacd0b85a97d-38f6e95f74bmr899043f8f.6.1740136825868;
        Fri, 21 Feb 2025 03:20:25 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-c955-d4da-b5fa-7bb3.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:c955:d4da:b5fa:7bb3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d94acsm23492868f8f.75.2025.02.21.03.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 03:20:25 -0800 (PST)
Mime-Version: 1.0
Date: Fri, 21 Feb 2025 12:20:25 +0100
Message-Id: <D7Y30THD6TSI.113LHMD3DBBCP@ventanamicro.com>
Cc: <ajones@ventanamicro.com>, <kvm-riscv@lists.infradead.org>,
 <kvm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <atishp@atishpatra.org>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
To: "BillXiang" <xiangwencheng@lanxincomputing.com>, <anup@brainfault.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v2] riscv: KVM: Remove unnecessary vcpu kick
References: <20250221104538.2147-1-xiangwencheng@lanxincomputing.com>
In-Reply-To: <20250221104538.2147-1-xiangwencheng@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_112028_936799_9FCC0047 
X-CRM114-Status: UNSURE (   8.66  )
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

MjAyNS0wMi0yMVQxODo0NTozOCswODowMCwgQmlsbFhpYW5nIDx4aWFuZ3dlbmNoZW5nQGxhbnhp
bmNvbXB1dGluZy5jb20+Ogo+IFJlbW92ZSB0aGUgdW5uZWNlc3Nhcnkga2ljayB0byB0aGUgdkNQ
VSBhZnRlciB3cml0aW5nIHRvIHRoZSB2c19maWxlCj4gb2YgSU1TSUMgaW4ga3ZtX3Jpc2N2X3Zj
cHVfYWlhX2ltc2ljX2luamVjdC4KPgo+IEZvciB2Q1BVcyB0aGF0IGFyZSBydW5uaW5nLCB3cml0
aW5nIHRvIHRoZSB2c19maWxlIGRpcmVjdGx5IGZvcndhcmRzCj4gdGhlIGludGVycnVwdCBhcyBh
biBNU0kgdG8gdGhlbSBhbmQgZG9lcyBub3QgbmVlZCBhbiBleHRyYSBraWNrLgo+Cj4gRm9yIHZD
UFVzIHRoYXQgYXJlIGRlc2NoZWR1bGVkIGFmdGVyIGVtdWxhdGluZyBXRkksIEtWTSB3aWxsIGVu
YWJsZQo+IHRoZSBndWVzdCBleHRlcm5hbCBpbnRlcnJ1cHQgZm9yIHRoYXQgdkNQVSBpbgo+IGt2
bV9yaXNjdl9haWFfd2FrZW9uX2hnZWkuIFRoaXMgbWVhbnMgdGhhdCB3cml0aW5nIHRvIHRoZSB2
c19maWxlCj4gd2lsbCBjYXVzZSBhIGd1ZXN0IGV4dGVybmFsIGludGVycnVwdCwgd2hpY2ggd2ls
bCBjYXVzZSBLVk0gdG8gd2FrZQo+IHVwIHRoZSB2Q1BVIGluIGhnZWlfaW50ZXJydXB0IHRvIGhh
bmRsZSB0aGUgaW50ZXJydXB0IHByb3Blcmx5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQmlsbFhpYW5n
IDx4aWFuZ3dlbmNoZW5nQGxhbnhpbmNvbXB1dGluZy5jb20+Cj4gLS0tCj4gdjI6IFJldmlzZSB0
aGUgY29tbWl0IG1lc3NhZ2UgdG8gZW5zdXJlIGl0IG1lZXRzIHRoZSByZXF1aXJlZCAKPiAgICAg
c3RhbmRhcmRzIGZvciBhY2NlcHRhbmNlCgpOaWNlLCB0aGFua3MuCgpSZXZpZXdlZC1ieTogUmFk
aW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
