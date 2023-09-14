Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B40EE0213
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 02:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TFuWqmtZNPvcQOIYcpaRNRRZL6lBEiclVPsINGW912Y=; b=D3o6wlyfMAhxN1
	9echtWmi2t213rVsmWUHkd1LaQjU30QvW2LoYJ9HiuR/J3ri60dVzICWiSyTiBaxO4Yju9wi5915J
	KeknrRG9+i6EF30V7/8dMIDIzOzxfusNAD3svUhlqXn1lSzI8ZQn1fGVlDtem9BCU05OYj/7rNJcC
	TBXsl+BOSiVO1vTH9gVWLZGaNoaUu7J0D61rlrFLh3LsRIjINeysCe6b6hF/jvftOX+AgaWUIs2In
	EPoXSlNwp2oQYAP79JVY58zGgHdQ3aAmegpGXAeEU8qjb6rTpnVQr+SccRI804O7YcOHMtbqyTBiO
	+gEmTp602bJYmcN5qrng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbmK-0079k4-2m;
	Thu, 14 Sep 2023 02:08:24 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbmH-0079jA-20
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 02:08:22 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-26fc9e49859so408072a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 19:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694657298; x=1695262098; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OfD2OkoRfQyy1jdkiRqmez3LLiLCnLchd58BEe/6mI=;
        b=k3ImiBUmwPVEL9ayF9RuLAmnGlADKXlCny4xOhZ8BDrJTNBUGoVztFObjWZ9yL/UZW
         /RI6jxWBZPdbrM9sEkxT/S8/jiBWn5WT8bK2V/K4eR4zqieQtbdPiuWcX1cdxas5CGIv
         PjCDfsaL78Zx1Aj31x1rIdH1afdWoQ14BwCqRB/RQOdnKIW6mZ8+s+doGjVqlQxFPrp/
         U6b7oWqZ9+XEUAiQ9Ws4DFkYPduTdDwTtrXglB70+qvRVZAQi4QlvLVYrqXSWfYWAvmL
         NE/PEcSSPA8vUl3VFNz/wDwGjJ573lJNI2U1FRKsLM8eFtR5cPtQdORk1eRMPlPosjt0
         xTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694657298; x=1695262098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1OfD2OkoRfQyy1jdkiRqmez3LLiLCnLchd58BEe/6mI=;
        b=RYEE3U9SxJfzkEBT4zyBLa76FHCJ+tTVMF1uu+6BGHz5iKrAZd5yE5K+On8l0shSje
         CwL5WEwhaWoC6wCukDldVMo0hbSojOdQfW54FBvJgmzGimUdx1bVE9tu2NcP59CadScb
         dKpjrofJuDhCyAGE/4uKIhyCxRV9S73BKNT3tRMLLafPQ2Q+AF2FLzUiyFgGh1V4JAZM
         naWI+Lg0w7TGQWLgLgcb0I1QM1CXhgWHQgZ3j/y3ToIUT3fCDUNDw4NRQ06F10M5DouO
         TQ1buF2eW1SX/jhgOlB/7BNj/uBdci94f6wTEl2wR9iyv4w2MO3atLUOBkZJRA+DZtDT
         bIlQ==
X-Gm-Message-State: AOJu0YwZh7dL1NLOfhPy5JfAgi/FRwB5SoPHdMmrpMrJY3KDf/Di4Iq8
	1dGUiBYhPjb1nJ0RJ4oePP6XdUnnhllKnVzD+PKuixRu
X-Google-Smtp-Source: AGHT+IEtLBFjSS4WH0pGMkLzb2v6wt1r1fjFCaU0YQ9oFAFfui0YN6Qx37fjDJyH6KydZatW4kFwuHfbAAQIZ14J+OY=
X-Received: by 2002:a17:90b:1d0c:b0:268:7ec:51ae with SMTP id
 on12-20020a17090b1d0c00b0026807ec51aemr3760831pjb.41.1694657298319; Wed, 13
 Sep 2023 19:08:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230809031023.3575407-1-songshuaishuai@tinylab.org>
In-Reply-To: <20230809031023.3575407-1-songshuaishuai@tinylab.org>
From: Song Shuai <suagrfillet@gmail.com>
Date: Thu, 14 Sep 2023 02:08:06 +0000
Message-ID: <CAAYs2=gV7qT=EjPuxBTyHPWW44qA1wEPuYnT-hz+4Cxz844KfQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: mm: Update the comment of CONFIG_PAGE_OFFSET
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	ajones@ventanamicro.com, alexghiti@rivosinc.com, anup@brainfault.org, 
	guoren@kernel.org, samuel@sholland.org, rppt@kernel.org, 
	panqinglin2020@iscas.ac.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_190821_674659_FCDF05E3 
X-CRM114-Status: GOOD (  14.02  )
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

U29uZyBTaHVhaSA8c29uZ3NodWFpc2h1YWlAdGlueWxhYi5vcmc+IOS6jjIwMjPlubQ45pyIOeaX
peWRqOS4iSAwMzoxMuWGmemBk++8mgo+Cj4gRnJvbTogU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRA
Z21haWwuY29tPgo+Cj4gU2luY2UgdGhlIGNvbW1pdCAwMTFmMDlkMTIwNTIgc2V0IHN2NTcgYXMg
ZGVmYXVsdCBmb3IgQ09ORklHXzY0QklULAo+IHRoZSBjb21tZW50IG9mIENPTkZJR19QQUdFX09G
RlNFVCBzaG91bGQgYmUgdXBkYXRlZCB0b28uCj4KPiBGaXhlczogMDExZjA5ZDEyMDUyICgicmlz
Y3Y6IG1tOiBTZXQgc3Y1NyBvbiBkZWZhdWx0bHkiKQo+IFNpZ25lZC1vZmYtYnk6IFNvbmcgU2h1
YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wYWdlLmggfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2Uu
aCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5oCj4gaW5kZXggYjU1YmEyMDkwM2VjLi41
M2MwMDE2NGMwNDIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmgK
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2UuaAo+IEBAIC0zMyw4ICszMyw4IEBA
Cj4gICNkZWZpbmUgUEFHRV9PRkZTRVQgICAgICAgICAgICBfQUMoQ09ORklHX1BBR0VfT0ZGU0VU
LCBVTCkKPiAgI2VuZGlmCj4gIC8qCj4gLSAqIEJ5IGRlZmF1bHQsIENPTkZJR19QQUdFX09GRlNF
VCB2YWx1ZSBjb3JyZXNwb25kcyB0byBTVjQ4IGFkZHJlc3Mgc3BhY2Ugc28KPiAtICogZGVmaW5l
IHRoZSBQQUdFX09GRlNFVCB2YWx1ZSBmb3IgU1YzOS4KPiArICogQnkgZGVmYXVsdCwgQ09ORklH
X1BBR0VfT0ZGU0VUIHZhbHVlIGNvcnJlc3BvbmRzIHRvIFNWNTcgYWRkcmVzcyBzcGFjZSBzbwo+
ICsgKiBkZWZpbmUgdGhlIFBBR0VfT0ZGU0VUIHZhbHVlIGZvciBTVjQ4IGFuZCBTVjM5Lgo+ICAg
Ki8KPiAgI2RlZmluZSBQQUdFX09GRlNFVF9MNCAgICAgICAgIF9BQygweGZmZmZhZjgwMDAwMDAw
MDAsIFVMKQo+ICAjZGVmaW5lIFBBR0VfT0ZGU0VUX0wzICAgICAgICAgX0FDKDB4ZmZmZmZmZDgw
MDAwMDAwMCwgVUwpCj4gLS0KPiAyLjIwLjEKPgpQaW5nLi4uCgotLSAKVGhhbmtzLApTb25nCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
