Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1978EB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 20:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=73wllfVK/9cTvgURp3oMpbbbKchUxC4RRoQrK1IySoU=; b=F+OtoL5b18OoJI
	3aBhFbFprl7xwkrhsEz9JWzF6Dg/spbYOinvSwf35HU5ZsrfoIMKI2S8/eVsZjvxlquiXf9/JpPhT
	M1WmqInQZVvuAlDH7DBl6gEjWSpokmzqXh8DpIikp0AC8O9AaZkenxAXOd28hwERwABMid2LYHs+7
	2Imudd76p1e2fvrmo/j6QnEdLvCRTqPBI54ovBgjuqVTDaoUb9z4ZKei76iCp0npGP/YTPIyFrpXH
	ufBbq+sYV6FghUe6vUwSOAy5SuZSyDOf/lJei56m/MmSmcBrq1afypS6MR2Z9b1/PMOgUXXLwqBXo
	j+F4f+yjGYGZ3H2TWxYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBhwU-00CHyC-1b;
	Tue, 20 Jun 2023 20:27:10 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBhwR-00CHxX-2O
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 20:27:09 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-3ff27d3d2f8so16067111cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 13:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687292825; x=1689884825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=joo/oUAWScXUdXgTaCSTcx5W8m20bjJhgiK7mdH4uqM=;
        b=W+9Rv1sZOq6oZr2lDOufXCdjfH1TXAdwRfgbp7OcKuv28uOSUMf274oz1Vj/7FmKdM
         wY/SBudpQcbMbx6VFhL26bqoh7uvomkSTIQnYT9+EzR6ntrnL/tyPhO1wTEWTrjq2Osn
         gTjSunV/8BEM3RWMoWYkzZRdemJaHir+rKWsLH015fOl/7pMufBzismYaTTgCJ0twfc1
         F3vB6FXTyxSWBYN9BA8Ufvd9pEO5ASz2GVxp6sHXRzUhj5JQEssMj0gnyzXhf+AyUeIJ
         IgziBY4mf8nslmvDaPC03iM62I0RuBNahWLSjQjeywCZTGC2vlcPYrIBDk7vgxTtx7/W
         pOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687292825; x=1689884825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=joo/oUAWScXUdXgTaCSTcx5W8m20bjJhgiK7mdH4uqM=;
        b=VoA9rlwz4mgTCNRpu4InvR2MWJWcCNfZiK1kzdJq9okHNgkjM3cLGHx81hBAh6Bc5J
         d/dK3WjJXY6qjY4SAH9pyitwTtInsFfg4gnwxWeJ8kXt88Rx7r/QzI3RyQeAtAH4X2Cn
         OGsWNPqzdUEVDElZ8iWWeGQGkHOlgNTU5Qcz22yfIaeSUfFYmaICJFQ+vlmONJZNFB18
         LsqtLOkXywqxsZiQW0H5b0Uf1d+u+PGibXhP1ZoGQ9BK3pCka2huVMr5S+y5ph3EEMK9
         24dqvYlHho9WkVwMEalM+DgRgXLIUjOm6bN+PD9Rc/1+YLlNdRI1CP43JfQg0U2xZ+rQ
         uLeA==
X-Gm-Message-State: AC+VfDzGIDBZM47sudTZkOiyDEla7iyWFOH/Y1um6BlgKv1l7Qwla2sw
	J54UxCmZgrokBzZNBZpra7UTgELau1FPgFl7ag1J6Q==
X-Google-Smtp-Source: ACHHUZ6WUkKcA+wkBZ5oNpUXeh8vRWU3VXOcG+U7JcCReMr8oADvkSp7vl51NZvqEd2fl7N4KzLjLdzciC5xrB2u9i4=
X-Received: by 2002:a05:6214:1d24:b0:632:80f:4734 with SMTP id
 f4-20020a0562141d2400b00632080f4734mr1684835qvd.40.1687292825121; Tue, 20 Jun
 2023 13:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <ZJIIUn8Da15neIwI@google.com> <mhng-ae249af7-37cc-400c-be0d-c1fa6f75c8ef@palmer-ri-x1c9a>
In-Reply-To: <mhng-ae249af7-37cc-400c-be0d-c1fa6f75c8ef@palmer-ri-x1c9a>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 20 Jun 2023 16:26:53 -0400
Message-ID: <CAKwvOdnZ8+CrBGCDhzi8o8UrOjg-CyuRO=OLKpx9X4iGheV77Q@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: Enable dead code elimination
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: falcon@tinylab.org, Conor Dooley <conor@kernel.org>, guoren@kernel.org, 
	linux-riscv@lists.infradead.org, npiggin@gmail.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, paulburton@kernel.org, vincent.chen@sifive.com, 
	tim.bird@sony.com, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_132707_804343_50A0E7C5 
X-CRM114-Status: GOOD (  18.45  )
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

T24gVHVlLCBKdW4gMjAsIDIwMjMgYXQgNDoxN+KAr1BNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
cml2b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgMjAgSnVuIDIwMjMgMTM6MTM6MDYgUERU
ICgtMDcwMCksIG5kZXNhdWxuaWVyc0Bnb29nbGUuY29tIHdyb3RlOgo+ID4gT24gV2VkLCBNYXkg
MTcsIDIwMjMgYXQgMDQ6Mjk6MzZQTSArMDgwMCwgWmhhbmdqaW4gV3Ugd3JvdGU6Cj4gPj4gU2Vs
ZWN0IENPTkZJR19IQVZFX0xEX0RFQURfQ09ERV9EQVRBX0VMSU1JTkFUSU9OIGZvciBSSVNDLVYs
IGFsbG93aW5nCj4gPj4gdGhlIHVzZXIgdG8gZW5hYmxlIGRlYWQgY29kZSBlbGltaW5hdGlvbi4g
SW4gb3JkZXIgZm9yIHRoaXMgdG8gd29yaywKPiA+PiBlbnN1cmUgdGhhdCB3ZSBrZWVwIHRoZSBh
bHRlcm5hdGl2ZSB0YWJsZSBieSBhbm5vdGF0aW5nIHRoZW0gd2l0aCBLRUVQLgo+ID4+Cj4gPgo+
ID4gSnVzdCBjcm9zcyByZWZlcmVuY2luZyB0aGUgcmVwb3J0IGZyb20gUGFsbWVyIGFnYWluc3Qg
djI7IEkgc2VlIG9ycGhhbgo+ID4gc2VjdGlvbiB3YXJuaW5ncyBmcm9tIHRoZSBsaW5rZXIgcmVs
YXRlZCB0byB0aGUgRUZJIHN0dWIgd2hlbiBidWlsZGluZwo+ID4gYWxsbW9kY29uZmlnIHdpdGgg
dGhpcyBwYXRjaCBhcHBsaWVkLgo+ID4KPiA+IHYyOiB0aHJlYWQgZm9yIHJlZmVyZW5jZS4KPiA+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L0NBS3d2T2Rtc2dNTjVvUXBETGgx
MkQwWC1DZlFEdEhDLUV0eEhjQm5BRGtobnlpdE1LUUBtYWlsLmdtYWlsLmNvbS8KPgo+IFNvcnJ5
IGZvciByZXBseWluZyB0byB0aGUgdjIsIEknbSBtYXJraW5nIHRoYXQgYXMgc3VwZXJzZWVkZWQg
aW4KPiBwYXRjaHdvcmsuICBJSVVDIGl0IGlzIGEgcmVhbCBpc3N1ZSBvbiB5b3VyIGVuZCB0b28/
ICBJJ20gYWxzbyBub3QgMTAwJQo+IHN1cmUgYWJvdXQgdGhlIGhhbmcsIEkganVzdCBsZXQgTExE
IGNvb2sgZm9yIGFib3V0IDEwIG1pbnV0ZXMgYmVmb3JlIEkKPiBub3RpY2VkIGl0IHdhcyBzdGls
bCBydW5uaW5nIGFuZCBwb3N0ZWQuCgpZZXM7IGlmIHRoaXMgaXMgbWVyZ2VkLCBvdXIgQ0kgYnVp
bGRzIG9mIEFSQ0g9cmlzY3YgYWxsbW9kY29uZmlnIHdpbGwgZ28gcmVkLgoKSSBhc3N1bWUgYSBs
aW5rZXIgc2NyaXB0IHNvbWV3aGVyZSBuZWVkcyB0byBiZSB1cGRhdGVkLCBidXQgSSBoYXZlbid0
CmZvdW5kIGlmL3doZXJlIHRoZSBlZmkgc3R1YidzIGlzLgoKZHJpdmVycy9maXJtd2FyZS9lZmkv
bGlic3R1Yi96Ym9vdC5sZHMgcGVyaGFwcz8KCk9uIFR1ZSwgSnVuIDIwLCAyMDIzIGF0IDQ6MjLi
gK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gUmVwZWF0aW5n
IG15c2VsZiBmb3IgdGhlIHNha2Ugb2YgdGhlIGFyY2hpdmVzIG9yIHcvZSwgdHdvIGRpZmZlcmVu
dAo+IHN1Ym1pdHRlcnMgd2l0aCBkaWZmZXJpbmcgdmVyc2lvbiBudW1iZXJzLiBUaGUgdjIgZnJv
bSBKaXNoZW5nIGlzIG1vcmUKPiByZWNlbnQgdGhhbiB0aGUgdjMgaGVyZSBmcm9tIFpoYW5namlu
LCB0aGV5IGFncmVlZCBpbiB0aGlzIG1haWwgdGhyZWFkCj4gdG8gbWVyZ2UgdGhlaXIgd29yay4K
Ci0tIApUaGFua3MsCn5OaWNrIERlc2F1bG5pZXJzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
