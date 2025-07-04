Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD585C8303D
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 15:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jnx/C8FFgC1P2P1ou7QXPa2KW3iUBPQQ8LIXkrebkQ8=; b=tIpX87H5ZgFljP
	HfIJEquDNZJEJarYbwG0Ibnvunnh5AZjGJNs87w6I6dDoHYouePiV87tLSHlSm6bsE4lmbOtcFo+/
	7e/xi0il1iLN+EqFV+fRk6dZC6JitICyo+KyXp371p/ZjnCwrXH8agIxqtJyE6Ab4nO4E9qXUWMbq
	lbda+cQrnZtVx0sBNIFEupR7QrsjmttyBxx65WShd/np0ShBhD/4Z0G+NZ003kDNEz+ErfpwpC6Ef
	ZmqHzrSIO+Xbz9mYGBDb9KB/pXM8C5vpQeQmU5rVj6NM+0mgODUVSmL99DuKQHjg7ZK6pzZRJ5k7q
	g5Xerxs6dYC22i1r6mKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXie0-0000000EsAo-2wIA;
	Fri, 04 Jul 2025 15:48:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiZ2-0000000Era2-1GiJ
	for linux-riscv@bombadil.infradead.org;
	Fri, 04 Jul 2025 15:43:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=j8CmEkvx6j+SIdP/Nex5ihxr+2kLOB0LBXIuUiiK2ew=; b=qmV0bXM8G1q5dI6Bc5zIvNrydt
	T5NGriK+foysaaad2PY2oQdLTVQGc3td/HVhfiAXF8nzwzf3OdgdeqlJX0rcQ78YGFdrYxkIsF2jO
	MkP9xSe8q5XYjWQxhTPJfwEWGT2bExl3s4+aZPXRnn/vNd96xXD3ijfH9bkPTPniL4ZKjPXko/OBq
	snLXUy39p4BfvSpTpP9/eue/hR7dlPOJtp2np92r4m5InH33+BHk7FvlcDSGImYZk/eJ2AplPot20
	pSe2cGEcTKJrhXy9PEmD/0yq+9feOpQCAWMxHmmHeCGP8bza6Mc8zZdnHcRcPrxZo/FiDlYH9KENG
	UySlASwg==;
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiYu-000000081Xy-0Ie6
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 15:42:57 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-60c4521ae2cso1863621a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 08:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751643763; x=1752248563; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8CmEkvx6j+SIdP/Nex5ihxr+2kLOB0LBXIuUiiK2ew=;
        b=TPID6Z015GRNcCviaDN4L0rowdHkXEGVhtBVKfEl6BPiD10A2GM5jDLJdPhvjPPzs6
         N+skR78L+nC6C1MzbzIVURhIZ0ZpRS7r6hUbQCG0k3Bb/+V7BIvZyrarb5yGxXBqU0DC
         Zt/KQXdsEoMbnyNhFIShTmq2BbN61NUp9jy3wtscQ2+eb+QMQSBtJxW38dx+2HGy23EO
         R/Nd+rzJP1EKf4MwLCvpwFatWIAZYk+K5JMqJSU5uD8s01ZYd4jdrZPmTWUu3bayiCM3
         nvkTO/tLx3xAUL+YwJNM8OXme04ok+wubFy6BVfXn6sDnpMMSUkOVDd6AWjmSq5WwJV1
         ZeRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643763; x=1752248563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8CmEkvx6j+SIdP/Nex5ihxr+2kLOB0LBXIuUiiK2ew=;
        b=XPPsonLD6XbzHgawZI/YrdKR0qRMinJDTLduVarbTHfjbk9gZTs48kU5Ts6AENhfHc
         Tviv3/yw9qL+ZOffocdMYj+O2m/KlFqLVycW1vK4yYUAegVUQwvyIVQEMogjb0HjUEoi
         2GxqeWydqPpGyGW+bAnClR8JZpal2+/pXdwNrH6msdcWkRI6AraQAKUcbJSmNAHVWnKY
         1Ahw7NS9uJfQYKFK1ri871/nejig8G412jGqhsEAZKAw8tuikxlZarYgNW/qOAONWzvr
         KYQ/Dr8ntW7M/TfugMTvNiNmqtNnL4h22qW7r3sJcjiZLQEpkmCnH/kEanGk2Vord9gA
         J+wg==
X-Forwarded-Encrypted: i=1; AJvYcCWyrg/k4ZTr7EqobGQcaO9sK8tEOpuf+iuQKNcNkaOp2q8VgdfBMnA+wrQpM+dgoyx+i9VbE2EAKG9G8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYhME+PWPKeXZRHpkF+dqjTP3XH8Lujp8I3l2/GjF8DhnHZ6BE
	1Tv0+ipgJi6clFNAaNnuOItG4UvH9QENyMYb65tjRspYsG/BhWsCIWA+ndnGfg5yeI6bSZU+En9
	e13PHw48rj6k4w2v6Imkgo9S5yJhBoGk=
X-Gm-Gg: ASbGncvEJcfEPvwZHg0NVZfFAV8JD08VnZJKJ6t8TbiSMPJ5IrbCe2a5dWq5W+GBP2k
	mchOlEsl47oJbC/0gI+cI9b5ltz9ER6yNajSqzKpZa/Me6uLl4sZ8A4JXsN2bFggclRfE0epOGP
	i3/CHTcGLvBEMYLsb5qDQFaDI+3pDRSWZUdE8C67JFskU=
X-Google-Smtp-Source: AGHT+IHK0+UoFkqi8/r+0hmUFbXD7t2ypN1m2X7cWdjIuLAhgsN1aaeHSLen1ejO4/BdMdlQDMNGaKku4Q88hgrL5Es=
X-Received: by 2002:a17:907:7f8d:b0:ae0:68a8:bd6a with SMTP id
 a640c23a62f3a-ae3fbc4af04mr269371266b.15.1751643763390; Fri, 04 Jul 2025
 08:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250703084502.394406-1-chenmiao.ku@gmail.com>
 <f7e12c6d-892e-4ca3-9ef0-fbb524d04a48@ghiti.fr> <20250703114018.6fab0b8a@batman.local.home>
 <5ac2c90c-5907-40ce-a31e-05cb6d88fa52@ghiti.fr> <CAKxVwgeDcqo83ZV+xBcHwNuMk6yeU+yp7RYo22OARAVOBgrsJQ@mail.gmail.com>
 <8160f56d-967d-4fa0-b996-0e0a2aa8be20@ghiti.fr>
In-Reply-To: <8160f56d-967d-4fa0-b996-0e0a2aa8be20@ghiti.fr>
From: Miao Chen <chenmiao.ku@gmail.com>
Date: Fri, 4 Jul 2025 23:42:06 +0800
X-Gm-Features: Ac12FXzosVTkYaajpL9wrNvggbtf0aYJ_dE6_pPU6nEw_f7Eo0F87T3G1ado5f0
Message-ID: <CAKxVwgeZhsf3uXhiTLfDU1aszV4i8pfvFTJQd_D_hWLSaQvrdQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: ftrace: Fix the logic issue in DYNAMIC_FTRACE selection
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Steven Rostedt <rostedt@goodmis.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_164252_210178_592D72B6 
X-CRM114-Status: GOOD (  28.87  )
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

SGkgQWxleCwKCk9rLCBJJ2xsIHN0YXJ0IG15IHdvcmsgcmlnaHQgbm93LgoKVGhhbmtzLAoKQ2hl
biBNaWFvCgoKQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPiDkuo4yMDI15bm0N+aciDTm
l6XlkajkupQgMjA6MjjlhpnpgZPvvJoKPgo+IEhpIENoZW4gTWlhbywKPgo+IE9uIDcvNC8yNSAw
NDowNiwgTWlhbyBDaGVuIHdyb3RlOgo+ID4gSGVsbG8gQWxleCwKPiA+Cj4gPiBTaG91bGQgSSB3
YWl0IGZvciBTdGV2ZW4gdG8gZmluaXNoIGhpcyB3b3JrIGJlZm9yZSBzdGFydGluZyBtaW5lPyBI
ZQo+ID4gc2VlbXMgdG8gYmUgcmVmYWN0b3JpbmcgYSBsb3Qgb2YgQ09ORklHIGxvZ2ljLCB3aGlj
aCBtaWdodCBjYXVzZQo+ID4gY29uZmxpY3RzLgo+Cj4KPiBJIHdvdWxkIHNheSBubywgZG9uJ3Qg
d2FpdCBmb3IgU3RldmVuIHNpbmNlIGhpcyB3b3JrIHdvbid0IGxhbmQgaW4gNi4xNiwKPiB3ZSBu
ZWVkIGEgZml4IHRvIHByZXZlbnQgYnVpbGQgZmFpbHVyZXMgZm9yIHRoaXMgcmVsZWFzZS4KPgo+
IFRoYW5rcywKPgo+IEFsZXgKPgo+Cj4gPgo+ID4gVGhhbmtzLAo+ID4KPiA+IENoZW4gTWlhbwo+
ID4KPiA+IEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4g5LqOMjAyNeW5tDfmnIg05pel
5ZGo5LqUIDAwOjA25YaZ6YGT77yaCj4gPgo+ID4gICAgIEhpIFN0ZXZlLAo+ID4KPiA+ICAgICBP
biA3LzMvMjUgMTc6NDAsIFN0ZXZlbiBSb3N0ZWR0IHdyb3RlOgo+ID4gICAgID4gT24gVGh1LCAz
IEp1bCAyMDI1IDE1OjAwOjAyICswMjAwCj4gPiAgICAgPiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhA
Z2hpdGkuZnI+IHdyb3RlOgo+ID4gICAgID4KPiA+ICAgICA+Cj4gPiAgICAgPj4gV2UgY291bGQg
c3VwcG9ydCBzdGF0aWMgZnRyYWNlLCBidXQgSSBkb24ndCB0aGluayB3ZSBzaG91bGQsIHNvCj4g
PiAgICAgSSBhZ3JlZQo+ID4gICAgID4+IHdpdGggdGhpcyBwYXRjaC4gSW4gZmFjdCBJIGhhZCBq
dXN0IHByZXBhcmVkIGEgcGF0Y2ggZm9yIHRoaXMgaGVyZQo+ID4gICAgID4+Cj4gPiAgICAgaHR0
cHM6Ly9naXRodWIuY29tL2xpbnV4LXJpc2N2L2xpbnV4L3B1bGwvNTU2L2NvbW1pdHMvMDQ4MTA5
MmE1YmVjMzgxODY1ODk4MWMxMWY2MjllMDZlNjYzODJiMwo+ID4gICAgID4+IHdoaWNoIGlzIGEg
Yml0IG1vcmUgY29tcGxldGUgc2luY2UgSSBoYXZlIHJlbW92ZWQgc29tZSBkZWFkIGNvZGUuCj4g
PiAgICAgPj4KPiA+ICAgICA+PiBMZXQncyBzZWUgd2hhdCBvdGhlciBwZW9wbGUgdGhpbmsgYWJv
dXQgc3VwcG9ydGluZyBzdGF0aWMKPiA+ICAgICBmdHJhY2UsIEkgaGF2ZQo+ID4gICAgID4+IGFk
ZGVkIFN0ZXZlbiBpbiBjYyBpZiBoZSBoYXMgYW4gb3Bpbmlvbi4KPiA+ICAgICA+IFllcywgcGxl
YXNlIG9ubHkgc3VwcG9ydCB0aGUgZHluYW1pYyBmdHJhY2UuIFRoZSBzdGF0aWMgaXMgdGhlcmUK
PiA+ICAgICBvbmx5Cj4gPiAgICAgPiB0byBoZWxwIGFyY2hzIHRvIGdldCBmdHJhY2UgdXAgYW5k
IHJ1bm5pbmcuIE9uY2UgZHluYW1pYyBpcwo+ID4gICAgIHN1cHBvcnRlZCwKPiA+ICAgICA+IHN0
YXRpYyBzaG91bGQgbm90IGJlIHVzZWQuCj4gPiAgICAgPgo+ID4gICAgID4gSG1tLCBtYXliZSBJ
IHNob3VsZCBqdXN0IHJlbW92ZSB0aGUgcHJvbXB0IGZvciBEWU5BTUlDX0ZUUkFDRS4KPiA+ICAg
ICA+Cj4gPiAgICAgPiBUaGF0IGlzLCBvbmNlIGl0IGlzIHN1cHBvcnRlZCBieSBhbiBhcmNoaXRl
Y3R1cmUsIGl0IHNob3VsZCBiZQo+ID4gICAgIHRoZSBvbmx5Cj4gPiAgICAgPiB0aGluZyB1c2Vk
Lgo+ID4gICAgID4KPiA+ICAgICA+IC0tIFN0ZXZlCj4gPgo+ID4KPiA+ICAgICBUaGFua3MgZm9y
IHlvdXIgaW5wdXQuCj4gPgo+ID4gICAgIEBDaGVuTWlhbzogY2FuIHlvdSBjb21lIHVwIHdpdGgg
YSB2MiB0aGF0LCBpbiBhZGRpdGlvbiwgZGVsZXRlcwo+ID4gICAgIHRoZSBkZWFkCj4gPiAgICAg
Y29kZSBhbmQgd2l0aCBhIGNvbW1pdCBsb2cgdGhhdCBleHBsYWlucyB3aGF0IFN0ZXZlbiBzYWlk
PyBJZiBub3QKPiA+ICAgICBwb3NzaWJsZSBmb3IgeW91LCBsZXQgbWUga25vdyBhbmQgSSdsbCBk
byBpdC4KPiA+Cj4gPiAgICAgVGhhbmtzLAo+ID4KPiA+ICAgICBBbGV4Cj4gPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
