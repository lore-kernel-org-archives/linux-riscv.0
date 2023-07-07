Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDEAEB64D9
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 00:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kAyK4IL2wjE379oE+9NceZvO/0i+e2DjluDxV0rd1wI=; b=fpZ+Bp1f23njNs
	ZpL3i0ZuwvSnc0HFEUY7UkTCWcoF7aLhKNfzYm5x18abTbBGGnolBWq/nX5xOx1Hs0JyzwDp+Jy96
	meaz4TkNAsEATB5/50ldLeZsxogQWsBiuRvG1af7c8yHO/i41maRROssyOvXeepynSeTcRI8APh6Y
	4NmoCmE8ruomADQWlZpPLQ360ycPHkAguxxU91pRSO5LLEWYk/0uz1N0qVdHdaoK63lP8vzKSb1ZY
	lhnvkRbx0iStqcQjjYFPPjepgZ+r8utJo3eQqvQdnNyhBXmV9LUFFneHHtNORHM6n74iFW2i3P2+x
	3bPz56ybfG//D+zRF7Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHZib-0036Wf-0G;
	Fri, 07 Jul 2023 00:53:05 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHZiY-0036VX-1p
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 00:53:03 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-313f1085ac2so1277118f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jul 2023 17:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1688691179; x=1691283179;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r67n9FyRXMn2NIxHWlUhbk55uKQk9X6Dzb3qD8qYPqE=;
        b=esjLyRw9yG+IBiqgDC3zXqfCcnN/DbqAvEF78hFJzU3GMueXP0gDEe8GTEqkIWVxa3
         v5zA190KEwcagvtZcljHSX5zruOtY+4A2hJCW3xQ3kYhJ90qFeRfxiol/gEciWHjfH+V
         mSyV5wfea0jWsz4PHhQxxB5Beo4CjL8wQp1MdL2w0G7UKtRX2oxrtnD39TtmFgkTupMk
         WrOKCQbvpbAoBBwRglsxfn/NNxtlufKtOCK89XiZrAuUWobpoJwWEkM6LzWixFkAJGVS
         MnU63/tx7DAHW6EBB/ZRB4iDp07GMPxP25YJdWEYTFFIVGB2D/It7bRcDQ1rxLN1efdG
         V0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688691179; x=1691283179;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r67n9FyRXMn2NIxHWlUhbk55uKQk9X6Dzb3qD8qYPqE=;
        b=cZ/Hv1r4ezP25rE2l8VGaA/coBlIEr1Btu0Dl2Wqu1owvKRBiLFdJeCzd2+f/yTUsu
         VkBMTOeyBfRu/DvNVfj9CUE6yYy6Q+RUzDsedfL9XTrR36srl5KWRrdPlAdv4Az2n9wQ
         c0VSzr2lSYfcDBfYOqnLni6DehNjnxcY33qbuXPaYhMviPuWMHIkZdVRpBhiqpjNN7Or
         HQq3bTAQ3p3WKpOY1FVI0Ilw52bGOcXCvmFt5E2Rc6AflyUrcsT+99wHkbz0+94IlsZX
         QTZTOXnLPuv7uIAyDoxiC2ou/0yn/VeZCtL7X0Q8gL3GKa9cbviiBWVRzfVJfDmOCj4S
         lQmA==
X-Gm-Message-State: ABy/qLZuN0pof7jWLx5Dwr310JxgWwhiZ9AkUa3OUfqO4EHRjoPp1kCD
	g2+NI8chnsJdBSHc/n+3LuFzflH0nZsEj3hax54PdLVr
X-Google-Smtp-Source: APBJJlG7B59PVAJXs+YJAtg1NQZvtbN9/7wzF9BiD0+Kq6eoLvFO+eLgMC5CjxyPq9DIG3O6/bYyWQ==
X-Received: by 2002:a5d:54d2:0:b0:313:f5f8:a331 with SMTP id x18-20020a5d54d2000000b00313f5f8a331mr2449781wrv.34.1688691178654;
        Thu, 06 Jul 2023 17:52:58 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.246])
        by smtp.gmail.com with ESMTPSA id u15-20020a5d6acf000000b003143b7449ffsm3086566wrw.25.2023.07.06.17.52.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jul 2023 17:52:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [RESEND PATCH v3 1/2] RISC-V: mm: Restrict address space for
 sv39,sv48,sv57
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <ZKdUpzvyfy9f48MI@ghost>
Date: Fri, 7 Jul 2023 01:52:47 +0100
Cc: Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>,
 konstantin@linuxfoundation.org,
 linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org,
 Linux-MM <linux-mm@kvack.org>,
 mick@ics.forth.gr
Message-Id: <34483C0C-FA31-41E6-9263-1F9A08CEBE2C@jrtc27.com>
References: <20230705190002.384799-1-charlie@rivosinc.com>
 <20230705190002.384799-2-charlie@rivosinc.com>
 <2084462d-b11d-7a48-3049-6bafbe81e7b4@ghiti.fr> <ZKdUpzvyfy9f48MI@ghost>
To: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: Apple Mail (2.3731.600.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_175302_655336_B3FFE071 
X-CRM114-Status: GOOD (  15.92  )
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

T24gNyBKdWwgMjAyMywgYXQgMDA6NTYsIENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2lu
Yy5jb20+IHdyb3RlOgo+IAo+IE9uIFRodSwgSnVsIDA2LCAyMDIzIGF0IDExOjExOjM3QU0gKzAy
MDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4gSGkgQ2hhcmxpZSwKPj4gCj4+IAo+PiBPbiAw
NS8wNy8yMDIzIDIwOjU5LCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4+PiBNYWtlIHN2NDggdGhl
IGRlZmF1bHQgYWRkcmVzcyBzcGFjZSBmb3IgbW1hcCBhcyBzb21lIGFwcGxpY2F0aW9ucwo+Pj4g
Y3VycmVudGx5IGRlcGVuZCBvbiB0aGlzIGFzc3VtcHRpb24uIFRoZSBSSVNDLVYgc3BlY2lmaWNh
dGlvbiBlbmZvcmNlcwo+Pj4gdGhhdCBiaXRzIG91dHNpZGUgb2YgdGhlIHZpcnR1YWwgYWRkcmVz
cyByYW5nZSBhcmUgbm90IHVzZWQsIHNvCj4+PiByZXN0cmljdGluZyB0aGUgc2l6ZSBvZiB0aGUg
ZGVmYXVsdCBhZGRyZXNzIHNwYWNlIGFzIHN1Y2ggc2hvdWxkIGJlCj4+PiB0ZW1wb3JhcnkuCj4+
IAo+PiAKPj4gV2hhdCBkbyB5b3UgbWVhbiBpbiB0aGUgbGFzdCBzZW50ZW5jZSBhYm92ZT8KPj4g
Cj4gQXBwbGljYXRpb25zIGxpa2UgSmF2YSBhbmQgR28gYnJva2Ugd2hlbiBzdjU3IHdhcyBpbXBs
ZW1lbnRlZCBiZWNhdXNlCj4gdGhleSBzaG92ZSBiaXRzIGludG8gdGhlIHVwcGVyIHNwYWNlIG9m
IHBvaW50ZXJzLiBIb3dldmVyIHJpc2N2IGVuZm9yY2VzCj4gdGhhdCBhbGwgb2YgdGhlIHVwcGVy
IGJpdHMgaW4gdGhlIHZpcnR1YWwgYWRkcmVzcyBhcmUgZXF1YWwgdG8gdGhlIG1vc3QgCj4gc2ln
bmlmaWNhbnQgYml0LiAiVGVtcG9yYXJ5IiBtYXkgbm90IGhhdmUgYmVlbiB0aGUgYmVzdCB3b3Jk
LCBidXQgdGhpcyBjaGFuZ2UgCj4gd291bGQgYmUgaXJyZWxldmFudCBpZiBhcHBsaWNhdGlvbiBk
ZXZlbG9wZXJzIHdlcmUgZm9sbG93aW5nIHRoaXMgcnVsZSwgaWYgSQo+IGFtIHVuZGVyc3RhbmRp
bmcgdGhpcyByZXF1aXJlbWVudCBjb3JyZWN0bHkuIFdoYXQgdGhpcyBtZWFucyB0byBtZSBpcwo+
IHRoYXQgcmlzY3YgaGFyZHdhcmUgaXMgbm90IGd1YXJhbnRlZWQgdG8gbm90IGRpc2NhcmQgdGhl
IGJpdHMgaW4gdGhlIHZpcnR1YWwgCj4gYWRkcmVzcyB0aGF0IGFyZSBub3QgdXNlZCBpbiBwYWdp
bmcuCgpSSVNDLVYgZ3VhcmFudGVlcyB0aGF0IGl0IHdpbGwgbm90IGRpc2NhcmQgdGhlIGJpdHMq
LiBKYXZhIGFuZCBHbyBhcmVu4oCZdAphY3R1YWxseSBkZXJlZmVyZW5jaW5nIHRoZSBwb2ludGVy
cyB3aXRoIHRoZWlyIG93biBtZXRhZGF0YSBpbiB0aGUgdG9wCmJpdHMgKGRvaW5nIHNvIHdvdWxk
IHJlcXVpcmUgYSBwb2ludGVyIG1hc2tpbmcgZXh0ZW5zaW9uLCBsaWtlIGhvdyBBcm0KaGFzIFRC
SSksIHRoZXnigJlyZSBqdXN0IHRlbXBvcmFyaWx5IHN0b3JpbmcgaXQgdGhlcmUsIGFzc3VtaW5n
IHRoZXnigJlyZQpub3Qgc2lnbmlmaWNhbnQgYml0cywgdGhlbiBtYXNraW5nIG91dCBhbmQgcmUt
Y2Fub25pY2FsaXNpbmcgdGhlCmFkZHJlc3MgcHJpb3IgdG8gZGVyZWZlcmVuY2luZy4gV2hpY2gg
YnJlYWtzLCBub3QgYmVjYXVzZSB0aGUgaGFyZHdhcmUKaXMgbG9va2luZyBhdCB0aGUgaGlnaGVy
IGJpdHMgKG90aGVyd2lzZSB5b3UgY291bGQgbmV2ZXIgdXNlIFN2NTcgZm9yCnN1Y2ggYXBwbGlj
YXRpb25zIGV2ZW4gaWYgeW91IGtlcHQgeW91ciBhZGRyZXNzZXMgPCAyXjQ3KSwgYnV0IGJlY2F1
c2UKdGhlIGNob3NlbiBhZGRyZXNzZXMgaGF2ZSB0aG9zZSBoaWdoIGJpdHMgYXMgc2lnbmlmaWNh
bnQuCgoqIEEgcGFnZSBmYXVsdCBpcyBndWFyYW50ZWVkIGlmIHRoZSBhZGRyZXNzIGlzbuKAmXQg
c2lnbi1leHRlbmRlZAoKSmVzcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
