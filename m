Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAD0CD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fyhw0rNXilZqXrPFZBpbKrseN2PBbr/TVNp/XmeAxY4=; b=zWMMZLAM0U/5Ji
	tfTRGSFSO8TaMJ/OYF+rXQ7yV9NITDytom8f3aIpPFwpgS7acYUVvKLbxUZC44/EeQowycWElQ2up
	wTik1JxPWIhtvLIIaaCFlF2upEzzRyG2AH4rjQVBVGdhkVux+3Jo81yTXCnJ7da/NS++cCZ5xcAdh
	tnCF8hVkcOGQma1iw19qcurOwigRhGWfULBdJ8/1tqu5h4MDrEWfm88Agu92LMNm71De9zhM0bmh/
	Xu5iFb9j5Y8tLohGUq4FCt1pwudrDugrzZEHM709/7BrQp32sqlYaYaoBSCd5NuU1EUmUxvFTv2ys
	eWdSedoTwXeVQHfkts+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs9sF-00000000VK7-0qgV;
	Wed, 03 Apr 2024 23:18:31 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs9sB-00000000VIW-2y55
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:18:29 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-432d5b5f00bso3140031cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712186306; x=1712791106; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKTcZ9dm5Vbl1wlfrrPsPH+rEE5K6AdxwiFfzfHWvJw=;
        b=063geizyexhdPrCvjboyhlJ0yI4RaBRjAZQX2DC7xBKxzESDnqfRmRQ1fkNioXqnkA
         qmFPuSFjWpSBKiW2oLq8xAG3zId2rOIhNWB8oZMjnGzGIbqzKPm2e9nOFRs9TcT8mKPv
         I2DNRuOlE1KtxWjfmr/6qSOqbzrzsvKHo3FIuuo8T1+mqWHJaNXQK1HmNK/qoMT8Hyl9
         MiVI1mFu2NELx71UBd639wVaTiALPWO3mJbfVZaaxWKGhtJl4IWbS8jvujtmCjbVHrOK
         KVdAR3Q1pGoDA5D5xPlm6AVi4zSYTSVEnyGUk8OEESmc9nK9Q3/R5NlgHTUbc3v7qC/m
         pf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712186306; x=1712791106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKTcZ9dm5Vbl1wlfrrPsPH+rEE5K6AdxwiFfzfHWvJw=;
        b=AcC23NM6/39JSmohOaWAKrLi7run/qKQoOi69x7U0TBUJL58j86KZR6eKkCwQwXeHp
         dDT+U0Ch52UlAUsRt+jg8PU9S3bYlA/F9nefDWMGBvL1/JXpXHO4CZpe33a+2IuDxpS0
         8RefumAVSpUjLGDfJVWWlGLzKB5hy3PCimPKoimJxZ+8lIw9+CjI4Qw86z9lf6SoPUre
         IuGDJ2sP7IF8t7VHBYV/EFy3Grs3f/veGbRz2VOWH5ugO7pQ7JQ2TSTtUneBevLsGXwN
         YUzz9dEwOUktKDSvXpFO/XjYb1O5vI3BHqXBcRbHPkcnkvI8zdBQ0H1MNKXAOekbRUU4
         N+wA==
X-Forwarded-Encrypted: i=1; AJvYcCX+bckGMKNM5vRpNifcCTPyhG8YAy+irUn+zLFUySYu+g9tb3s2vy+FjjNO6fJNCILPb3h2MK/TuP47sYraT5wbvyXbpFt1K1HmLUfbuZJl
X-Gm-Message-State: AOJu0Yyqy5GBPeAUkkZj+0vOesZ0QmCt5qQ3zseFjtf/I/DL3INu1Wqr
	j3zBif1LLRlVT++QwxdqS6QPiEVRULGJhrVqOhnF2K8LfNRHGXmm5SDl+e/FYJn9lKw5CaWk6U1
	RF0UyJH9PzxxQJ/cBNsbFjCZSIvw0Y8TE3d65dQ==
X-Google-Smtp-Source: AGHT+IG3b6bmTq7JNK9eyjUfDwtFrXblUrguSJgPn1Dj/YB+5OfHknpAtgLCxMMQ0DWYVE9uTRHrd/QnpFOZ9fviQwI=
X-Received: by 2002:a05:622a:491:b0:434:3e4e:ddf2 with SMTP id
 p17-20020a05622a049100b004343e4eddf2mr1809297qtx.26.1712186305839; Wed, 03
 Apr 2024 16:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240402051154.476244-1-rmclure@linux.ibm.com> <20240402051154.476244-2-rmclure@linux.ibm.com>
In-Reply-To: <20240402051154.476244-2-rmclure@linux.ibm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 3 Apr 2024 19:17:48 -0400
Message-ID: <CA+CK2bA397y9aMc-CQwmQk7uhStWWVrx10c94+kfDUbSp5C9Eg@mail.gmail.com>
Subject: Re: [PATCH v12 01/11] mm/page_table_check: Reinstate address
 parameter in [__]page_table_check_pud_set()
To: Rohan McLure <rmclure@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, 
	christophe.leroy@csgroup.eu, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_161827_772802_FEC04754 
X-CRM114-Status: GOOD (  11.77  )
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

T24gVHVlLCBBcHIgMiwgMjAyNCBhdCAxOjEx4oCvQU0gUm9oYW4gTWNMdXJlIDxybWNsdXJlQGxp
bnV4LmlibS5jb20+IHdyb3RlOgo+Cj4gVGhpcyByZXZlcnRzIGNvbW1pdCA2ZDE0NDQzNmQ5NTQg
KCJtbS9wYWdlX3RhYmxlX2NoZWNrOiByZW1vdmUgdW51c2VkCj4gcGFyYW1ldGVyIGluIFtfX11w
YWdlX3RhYmxlX2NoZWNrX3B1ZF9zZXQiKS4KPgo+IFJlaW5zdGF0ZSBwcmV2aW91c2x5IHVudXNl
ZCBwYXJhbWV0ZXJzIGZvciB0aGUgcHVycG9zZSBvZiBzdXBwb3J0aW5nCj4gcG93ZXJwYyBwbGF0
Zm9ybXMsIGFzIG1hbnkgZG8gbm90IGVuY29kZSB1c2VyL2tlcm5lbCBvd25lcnNoaXAgb2YgdGhl
Cj4gcGFnZSBpbiB0aGUgcHRlLCBidXQgaW5zdGVhZCBpbiB0aGUgYWRkcmVzcyBvZiB0aGUgYWNj
ZXNzLgo+Cj4gcmlzY3Y6IFJlc3BlY3QgY2hhbmdlIHRvIGRlbGV0ZSBtbSwgYWRkciBwYXJhbWV0
ZXJzIGZyb20gX19zZXRfcHRlX2F0KCkKPgo+IFRoaXMgY29tbWl0IGFsc28gY2hhbmdlZCBjYWxs
cyB0byBfX3NldF9wdGVfYXQoKSB0byB1c2UgZmV3ZXIgcGFyYW1ldGVycwo+IG9uIHJpc2N2LiBL
ZWVwIHRoYXQgY2hhbmdlIHJhdGhlciB0aGFuIHJldmVydGluZyBpdCwgYXMgdGhlIHNpZ25hdHVy
ZSBvZgo+IF9fc2V0X3B0ZV9hdCgpIGlzIGNoYW5nZWQgaW4gYSBkaWZmZXJlbnQgY29tbWl0Lgo+
Cj4gU2lnbmVkLW9mZi1ieTogUm9oYW4gTWNMdXJlIDxybWNsdXJlQGxpbnV4LmlibS5jb20+CgpS
ZXZpZXdlZC1ieTogUGFzaGEgVGF0YXNoaW4gPHBhc2hhLnRhdGFzaGluQHNvbGVlbi5jb20+CgpG
b3Igc29tZSByZWFzb24gdGhpcyBvbmUgd2FzIG5vdCBkZWxpdmVyZWQgdG8gdGhlIGxpbnV4LW1t
IG1haWxpbmcgbGlzdC4KClBhc2hhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
