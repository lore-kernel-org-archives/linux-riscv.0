Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE96EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 18:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=xzvPf4b6mt5xrXqq45oj7HmHfOllxqc+vt6D4egH9KQ=; b=Aurk+6AksXRoPv3fv31xBFYFDp
	Xr0G9WLFrhqwz6MjJ4DIjtnxHgwnEAC3F1TqtDsGLcFgiDfmCQANVRzo/A9WxbGEFT+EAIoVRgvcI
	rmazRK7vBkhi95gl+fwo3EFaQuIPKpIQVkywytJEriNVSSENpamAT6CsqUdAugaq4XCsqH9pbnlj/
	hDli1TPs0EDI43wIGfWuZsGKBorGjPns03pnYR63uSBmlT6ddRiSID/BUA2WWqBiJG0Z/9upeI9ho
	aPmnO/TzQVRL1fQRMgOQVcbwifNm3xsOoCnQI+s1XAjfOybgZQPo9flioBtDFsb9KKZcCwBnKQDt6
	Arqc53gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC2Qb-00FMtX-3C;
	Wed, 21 Jun 2023 18:19:37 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC2QY-00FMso-2i
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 18:19:36 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b5018cb4dcso30851475ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 11:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687371572; x=1689963572;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2N+RflCXP1PzqPiaKt451iYwf1h+9b0LuKAtNyBxB34=;
        b=vZJh1OHfFxruZ2w3nH0qXkjMYYeCkv5Ua0zyfpVuCpMtXRcvouQouNPsAdKWRXXMry
         zrn8M/JnD32mu7zYsKdevgjmGMGXzb2lX5l0oAnBUm/LsUWwpDicYlkVholIJaspBMsU
         c+q1kszWrccgcS/g9a56qdy9GEW0T9LRlDyzZYFWjLqVv2IS+qcUW9ETjUhhNPaYI9QF
         YxBNbBdJlEeGSIcfkdKq4oDUITp8UBaZdOui11Ubpm9V7h+E+4TFC1Ge8XKoYubJjSab
         X67Dz8Wo9qk5i0/fhx9xWwI4WmhH8MsGD1R1hjNTmVHT8NQKlYI5wJZDrrrY6glsnvbm
         HClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687371572; x=1689963572;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2N+RflCXP1PzqPiaKt451iYwf1h+9b0LuKAtNyBxB34=;
        b=P5wsgc9e9oVV+/2Qh2U76S0+MV3gp2NgL2RdOCxo76ooOOuT9jrEeay2c+Qeu0Q1Pq
         mXGap4/jjP4WUV9Ob0+VJ7FpqtzhtUuwQ/uMieG2kwL/EdmB2pQScKapJjMsytoUBPt2
         5YXib205+lx+ilKKVrLEHF9xPbKZRgkITdDmynnzTqQyO8Z05ou2YTWXr2zQ5fSwv4l5
         SAvAkPdHo6gfC7hleE81lzMCPpoLtm6m0XvC/4kykVmoXFv/aCtMJUMEBo0F9srmm1Rp
         /EfyZ1ek3VN+CEvtVhGPwZ/K6P5/rPOwTuJwRFL4Nbaa4hkFACVijjszyAxT5XmgeXiB
         fxqg==
X-Gm-Message-State: AC+VfDxckX/Ul2gE3itOpfzBUp0/8PprdCHQ5WdpUbv7hpgWvxYhg2FZ
	/NGqL5ZIrhVzK8Szm8hN4HVUhA==
X-Google-Smtp-Source: ACHHUZ5Gpf4XE8MJKO2B5K1fQ3ujoREdSQF8gdFfQ4ZRJyq7uL0zOLzLgMg+CO/3CitU/RJb7tjGJQ==
X-Received: by 2002:a17:902:d48f:b0:1af:ea40:34e6 with SMTP id c15-20020a170902d48f00b001afea4034e6mr7449439plg.60.1687371572484;
        Wed, 21 Jun 2023 11:19:32 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id jw9-20020a170903278900b001b50f35aff1sm3805118plb.140.2023.06.21.11.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 11:19:31 -0700 (PDT)
Date: Wed, 21 Jun 2023 11:19:31 -0700 (PDT)
X-Google-Original-Date: Wed, 21 Jun 2023 11:18:52 PDT (-0700)
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
In-Reply-To: <87wmzwn1po.fsf@all.your.base.are.belong.to.us>
CC: Conor Dooley <conor@kernel.org>, jszhang@kernel.org, llvm@lists.linux.dev,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bjorn@kernel.org, ndesaulniers@google.com, nathan@kernel.org
Message-ID: <mhng-1d790a82-44ad-4b9c-bfe4-6303f09b0705@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_111935_099148_8E91D546 
X-CRM114-Status: GOOD (  17.16  )
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

T24gV2VkLCAyMSBKdW4gMjAyMyAxMDo1MToxNSBQRFQgKC0wNzAwKSwgYmpvcm5Aa2VybmVsLm9y
ZyB3cm90ZToKPiBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyaXRlczoKPgo+IFsu
Li5dCj4KPj4+IFNvIEknbSBubyBsb25nZXIgYWN0dWFsbHkgc3VyZSB0aGVyZSdzIGEgaGFuZywg
anVzdCBzb21ldGhpbmcgc2xvdy4gIAo+Pj4gVGhhdCdzIGV2ZW4gbW9yZSBvZiBhIGdyZXkgYXJl
YSwgYnV0IEkgdGhpbmsgaXQncyBzYW5lIHRvIGNhbGwgYSAxLWhvdXIgCj4+PiBsaW5rIHRpbWUg
YSByZWdyZXNzaW9uIC0tIHVubGVzcyBpdCdzIGV4cGVjdGVkIHRoYXQgdGhpcyBpcyBqdXN0IHZl
cnkgCj4+PiBzbG93IHRvIGxpbms/Cj4+Cj4+IEkgZHVubm8sIGlmIGl0IHdhcyBvbmx5IGEgdGhp
bmcgZm9yIGFsbHllc2NvbmZpZywgdGhlbiB3aGF0ZXZlciAtIGJ1dAo+PiBpdCdzIGdvbm5hIHNp
Z25pZmljYW50bHkgaW5jcmVhc2UgYnVpbGQgdGltZXMgZm9yIGFueSBsYXJnZSBrZXJuZWxzIGlm
IExMRAo+PiBpcyB0aGlzIG11Y2ggc2xvd2VyIHRoYW4gTEQuIFJlZ3Jlc3Npb24gaW4gbXkgYm9v
ay4KPj4KPj4gSSdtIGdvbm5hIGdvIGFuZCBleHBlcmltZW50IHdpdGggbWl4ZWQgdG9vbGNoYWlu
IGJ1aWxkcywgSSdsbCByZXBvcnQKPj4gYmFjay4uCj4KPiBJIHRvb2sgcGFsbWVyL2Zvci1uZXh0
ICgxYmQyOTYzYjIxNzUgKCJNZXJnZSBwYXRjaCBzZXJpZXMgInJpc2N2OiBlbmFibGUKPiBIQVZF
X0xEX0RFQURfQ09ERV9EQVRBX0VMSU1JTkFUSU9OIiIpKSBmb3IgYSB0dXhtYWtlIGJ1aWxkIHdp
dGggbGx2bS0xNjoKPgo+ICAgfCB+L3NyYy90dXhtYWtlL3J1biAtdiAtLXdyYXBwZXIgY2NhY2hl
IC0tdGFyZ2V0LWFyY2ggcmlzY3YgXAo+ICAgfCAgICAgLS10b29sY2hhaW49bGx2bS0xNiAtLXJ1
bnRpbWUgZG9ja2VyIC0tZGlyZWN0b3J5IC4gLWsgXAo+ICAgfCAgICAgYWxseWVzY29uZmlnCj4K
PiBUb29rIGZvcmV2ZXIsIGJ1dCBwYXNzZWQgYWZ0ZXIgMi41aC4KClRoYW5rcy4gIEkganVzdCBy
ZS1yYW4gbWluZSAxNy90cnVuayBMTEQgdW5kZXIgdGltZSAocmF0aGVyIHRoYXQganVzdCAKY2hl
Y2tpbmcgdG9wIHNvbWV0aW1lcyksIGl0J3MgYXQgMS41aCBidXQgZXZlbiB0aGF0IHNlZW1zIHF1
aXRlIGxvbmcuCgpJIGd1ZXNzIHRoaXMgaXMgc29ydCBvZiB1cCB0byB0aGUgTExWTSBmb2xrczog
aWYgaXQncyBleHBlY3RlZCB0aGF0IERDRSAKdGFrZXMgYSB2ZXJ5IGxvbmcgdGltZSB0byBsaW5r
IHRoZW4gSSdtIG5vdCBvcHBvc2VkIHRvIGFsbG93aW5nIGl0LCBidXQgCmlmIHRoaXMgaXMgcHJv
YmFibHkgYSBidWcgaW4gTExEIHRoZW4gaXQgc2VlbXMgYmVzdCB0byB0dXJuIGl0IG9mZiB1bnRp
bCAKd2Ugc29ydCB0aGluZ3Mgb3V0IG92ZXIgdGhlcmUuCgpJIHRoaW5rIG1heWJlIE5pY2sgb3Ig
TmF0aGFuIGlzIHRoZSBiZXN0IGJldCB0byBrbm93PwoKPiBDT05GSUdfQ0NfVkVSU0lPTl9URVhU
PSJEZWJpYW4gY2xhbmcgdmVyc2lvbiAxNi4wLjYgKCsrMjAyMzA2MTAxMTMzMDcrN2NiZjFhMjU5
MTUyLTF+ZXhwMX4yMDIzMDYxMDIzMzQwMi4xMDYpIgo+Cj4KPiBCasO2cm4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
