Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83299C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Oct 2022 22:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:Subject:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GcJi0gIr7gkpqgE8VShMRi0KuvkwGwc73ZojWwB6fYs=; b=BseoND8V2TXgL9
	2peNhtV18UtKh0fGKxTY7YengxzRf/5rxWalm/JZ0nBvNesfGkPJgOedTjNgsE1vCP+d5ocWfoTBW
	0S1n9kA+uSCfAGmQY98/qo90/O0uTaA7nH2lXq1C0JCWtdZdSN8GSRU3aOVnRW7p2/NLW5gHGZBsP
	U85/aSJyyQzefXXFXik/0/m7VTNalJxneQjDuCG3jXQWMWFU1ZD5rxk1aA7ZUHb5X+g8BT/iIg3yz
	2KtfeDVvmq9CPoLug7UD3Aq4KHRPi/a71+JaTNk4Ct7dPfnleO05/m3+YD3v3ScDOXbmq1KepbP2M
	kUgC6UBjzJmI87hs3NwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojTBG-00G6Td-3S; Fri, 14 Oct 2022 22:29:26 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojTBC-00G6T6-P7
	for linux-riscv@lists.infradead.org; Fri, 14 Oct 2022 22:29:24 +0000
Received: by mail-pj1-x1033.google.com with SMTP id d7-20020a17090a2a4700b0020d268b1f02so9170716pjg.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Oct 2022 15:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:subject
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C5GeD1hvUSxk+44cpf6S6kL9uJsMkrXWIRWIWPQeie8=;
        b=seTsUPDWxm6rRJ6f2d0P80eOJYCsWUbGfOkF2plYF64nyprOu+E/dx4metaYqGmPzb
         gNeGcEX32FxwHNW30w6kKd873g8Qrc8Cjjx32OW6hXKnv2k9QlmJuR7268y+MZk9y8m8
         cIPTK6yQ+40AmNCUlqBp29eZe14v9PPaKygsf4cUUCPPJCX9QtI+K0qbVU1hMvrEgnc9
         8z3/7j0VF9ISB1b3GziceuH2OQL8kXGc2N9AYf6eWhwWnn3MC8V4If2lrDllDYkIfCWm
         R8ggT0SKfB+wnNuVExMN4IIxdSExhOzVzcenmQNzTPZaCq6aVB82ZwsqBXsiwfaJf0QJ
         1Dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:subject
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C5GeD1hvUSxk+44cpf6S6kL9uJsMkrXWIRWIWPQeie8=;
        b=udkPlARoS/xg2XlcIMgf/rpP7qSZhAWHnNcybagjhsx7rtuMlfLkQIUMzILXWB++x5
         CVJsMz2U6bUt+Bi4d4RWsgoIuQP6cZTDbnktFgkHEt8QS7zPo7maFoFr7nHnLAoL7C5C
         O+X6Ltm677fGGDcIM5RHmH8FLVQQiOJBl9+tcFiTfiYxVUXrLELy60kzsQplmaWWY8rK
         7X8sXacCuNZVOBj1XuDI5EUv4JJoHxG3rRmRReJsGf/TPCl9Dnw50Jlh3F6nmlO4Ws96
         7cRqNca9KsxaZvOah6lkbwkbTy98/PsbBgAYCImo20WH/NqCw5xMdTzvkulZtPhQ573x
         JA+A==
X-Gm-Message-State: ACrzQf0eV7QkgvRMlmCln1rDDfX7eTCdeFAB9d+coENH8NePrfLt2wq7
	w2nbIDffLZExnx6BmnDOnK90Fyhgy+XUEA==
X-Google-Smtp-Source: AMsMyM51bxsHDxcanabX4q7QMu0QN8MVea1yf520ITCi8Nr3+iXu2kpdeXZnw2LzDUhtfBJpimcMYw==
X-Received: by 2002:a17:90b:4a84:b0:20d:8953:5ab0 with SMTP id lp4-20020a17090b4a8400b0020d89535ab0mr18761093pjb.48.1665786559225;
        Fri, 14 Oct 2022 15:29:19 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id r1-20020a17090a940100b0020a0571b354sm1919266pjo.57.2022.10.14.15.29.18
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 15:29:18 -0700 (PDT)
Date: Fri, 14 Oct 2022 15:29:18 -0700 (PDT)
X-Google-Original-Date: Fri, 14 Oct 2022 15:29:27 PDT (-0700)
Subject: linux-riscv Patchwork Sync-Up Meeting
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-775d4068-6c1e-48a4-a1dc-b4a76ff26bb3@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_152922_839325_F4B00E90 
X-CRM114-Status: GOOD (  20.34  )
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

Q2FybG9zIChmcm9tIGdsaWJjKSBhbmQgSSB3ZXJlIHRhbGtpbmcgYXQgUGx1bWJlcnMgYWJvdXQg
dGhlIHBhdGNod29yayAKc3luYyB1cCBtZWV0aW5nIHRoZXkgaGF2ZSBbMV0uICBUaGlzIHNlZW1l
ZCBsaWtlIGEgZ2VuZXJhbGx5IGdvb2QgaWRlYSAKdG8gbWUgYXQgdGhlIHRpbWUsIEkndmUgYmVl
biBtZWFuaW5nIHRvIGdvIHRvIGZpZ3VyZSBvdXQgZXhhY3RseSBob3cgaXQgCndvcmtzIGJ1dCBp
dCdzIGF0IDZhbSBNb25kYXkgbW9ybmluZ3MgZm9yIG1lIHNvIEkndmUgeWV0IHRvIG1ha2Ugb25l
LiAgCk15IG9yaWdpbmFsIHBsYW4gd2FzIHRvIHdhaXQgdW50aWwgSSdkIGxlYXJuZWQgaG93IHRo
YXQgd29ya3MgYmVmb3JlIApkb2luZyBhIGxpbnV4LXJpc2N2IHN5bmMgbWVldGluZywgYnV0IHdl
IHdlcmUganVzdCB0YWxraW5nIG9uIElSQyAKZWFybGllciB0b2RheSBhbmQgSSBmaWd1cmVkIGxl
dCdzIGp1c3QgZ28gYWhlYWQgYW5kIHNjaGVkdWxlIG9uZSBhcyBhIApmb3JjaW5nIGZ1bmN0aW9u
IHRvIG1ha2Ugc29tZXRoaW5nIGhhcHBlbi4KClRoZSBnZW5lcmFsIGlkZWEgaXMgdG8gZ2V0IHNv
bWUgdGltZSBibG9ja2VkIG9mZiB0byBtYWtlIHN1cmUgdGhhdCB0aGUgCnBhdGNod29yayBpbnN0
YW5jZSBzdGF5cyBzdWZmaWNpZW50bHkgY2xlYW4gdG8gcmVtYWluIHVzZWZ1bC4gIFRoYXQgCm1l
YW5zIHdlJ3JlIG5vdCBnb2luZyB0byB0cnkgYW5kIGFjdHVhbGx5IGdldCB0aGUgcGF0Y2hlcyBy
ZXZpZXdlZCAKZHVyaW5nIHRoZSBtZWV0aW5nICh0aGF0IHdpbGwgc3RheSBvbiB0aGUgbGlzdHMp
LCBidXQgd2UnbGwganVzdCB0cnkgdG8gCm1ha2Ugc3VyZSB0aGF0IHRoZXJlJ3MgZW5vdWdoIHRp
bWUgYmxvY2tlZCBvZmYgdG8gZ2V0IHRoZSBwYXRjaGVzIAp0cmlhZ2VkIGVhY2ggd2VlayBhbmQg
bWFrZSBzdXJlIG5vdGhpbmcgaXMgc2xpcHBpbmcgdGhyb3VnaCB0aGUgY3JhY2tzLiAgCkknbSBz
dXJlIHRoZXJlJ2xsIGluZXZpdGFibHkgYmUgZGlzY3Vzc2lvbiBvbiB0aGUgY29udGVudHMgb2Yg
c29tZSAKcGF0Y2hlcywgYnV0IGFzIGV2ZXJ5b25lIGNhbid0IHBhcnRpY2lwYXRlIHdlJ2xsIGp1
c3QgbmVlZCB0byBiZSBzdXJlIHRvIApyZWZsZWN0IGV2ZXJ5dGhpbmcgdG8gdGhlIG1haWxpbmcg
bGlzdHMgbGlrZSB3ZSB0cnkgdG8gZG8gZm9yIGV2ZXJ5IApvZmYtbGlzdCBkaXNjdXNzaW9uLgoK
VGhlIG1lZXRpbmcgaXMgb3BlbiB0byBhbnlvbmUsIEkndmUgbWFkZSBhIEdvb2dsZSBDYWxlbmRh
ciBmb3IgaXQgdGhhdCAKc2hvdWxkIGJlIHB1YmxpYyBbMl0gYnV0IEknbSBwYXN0aW5nIHRoZSBk
ZXRhaWxzIGhlcmUgYXMgd2VsbDoKCiAgICBsaW51eC1yaXNjdiBQYXRjaHdvcmsgU3luYwogICAg
V2VkbmVzZGF5LCBPY3RvYmVyIDI2IMK3IDc6MDAg4oCTIDg6MDBhbQogICAgR29vZ2xlIE1lZXQg
am9pbmluZyBpbmZvCiAgICBWaWRlbyBjYWxsIGxpbms6IGh0dHBzOi8vbWVldC5nb29nbGUuY29t
L3Rody1xb2p0LXBidgogICAgT3IgZGlhbDogKFVTKSArMSAyMjQtNTcyLTg1MzUgUElOOiAyMDcg
NTU2IDg3OSAjCgpIYXBweSB0byBtb3ZlIHRvIHNvbWV0aGluZyBhc2lkZSBmcm9tIEdvb2dsZSBN
ZWV0LCBidXQgaXQncyB0aGUgbW9zdCAKcmVsaWFibGUgc2V0dXAgZm9yIG1lIHRoZXNlIGRheXMg
YXMgaXQncyB3aGF0IHdlIHVzZSBhdCB3b3JrLiAgSWYgZm9sa3MgCnByZWZlciBzb21ldGhpbmcg
ZWxzZSB0aGF0J3MgZmluZSB3aXRoIG1lLCBqdXN0IHNheSBzbyBhbmQgSSdsbCB0cnkgdG8gCmZp
Z3VyZSBvdXQgaG93IHRvIHNvcnQgaXQgb3V0IChhcyBsb25nIGFzIGl0IHJ1bnMgb24gYSBDaHJv
bWVib29rLCB3aGljaCAKaXMgd2hhdCBJIHVzZSBmb3IgdmlkZW8gY2FsbHMpLiAgSUlVQyB0aGUg
Z2xpYmMgZm9sa3MgYWxzbyBoYXZlIElSQyBvcGVuIApkdXJpbmcgdGhlIHN5bmNzIGZvciB0ZXh0
LCB0aGF0IHNlZW1zIHJlYXNvbmFibGUgdG8gbWUgKCNyaXNjdiBvbiBsaWJlcmEgCmxvb2tzIGxp
a2UgdGhlIGJlc3QgYmV0IHRvIG1lKS4KCkl0IGRvZXNuJ3Qgc3RhcnQgbmV4dCB3ZWVrIGFzIG15
IGludGVybmV0IGlzIGRvd24gYXQgaG9tZSBhbmQgSSdtIApnZXR0aW5nIHRoZSBzZXJ2aWNlIHN3
YXBwZWQgb3ZlciBuZXh0IFdlZG5lc2RheSBtb3JuaW5nLCBzbyBpdCdsbCBzdGFydCAKdGhlIHdl
ZWsgYWZ0ZXIuICBUaGUgcGxhbiBpcyB0byBoYXZlIGl0IGV2ZXJ5IHdlZWsgb24gV2VkbmVzZGF5
IAptb3JuaW5ncywgYXMgdGhhdCdsbCBnaXZlIHVzIGVub3VnaCB0aW1lIHRvIG1ha2Ugc3VyZSBh
bnkgY3JpdGljYWwgUkMgCnBhdGNoZXMgdGhhdCBnZXQgY2FsbGVkIG91dCBjYW4gc3RpbGwgZ2V0
IHJldmlld2VkIGluIHRpbWUgZm9yIHRoYXQgCndlZWsncyBQUi4KCjE6IGh0dHBzOi8vc291cmNl
d2FyZS5vcmcvZ2xpYmMvd2lraS9QYXRjaHdvcmtSZXZpZXdNZWV0aW5ncwoyOiBodHRwczovL2Nh
bGVuZGFyLmdvb2dsZS5jb20vY2FsZW5kYXIvdS8wP2NpZD1ZMTh5WmpabE1EWXlPRGN6WlRrMllt
STBZemRpWkROaVpXTXpaVEE0WW1ObE9EazBZelJsWkdJMk5ESmpOREl5TldOaE1qSTNPREJtWmpn
ek56ZzRabVpsUUdkeWIzVndMbU5oYkdWdVpHRnlMbWR2YjJkc1pTNWpiMjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
