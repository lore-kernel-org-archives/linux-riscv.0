Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8755CD6E64
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 08:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ycNyHco/G3v0ygUyrXfm6ixnHBPEDchmleuqzDm+hP8=; b=nW8AfJavvKPBei
	+zFpxZ4jaoNvkRfC2HUwC2SB64dp1Uyyr84pmO5C/gNyQi7EUIIEiTtAzlAt14ERrSpzOf7UdgJ+0
	0bzdTQFIlrkEv4CwTxjWvDE5cHNdzURN0LRYFdwiURQ/+DGOYk4xcQkxAoL6aB3Jk7ykZpRYPnRO8
	kf70sjdTiJsK7IeX9gk9YkaKTa0iefqUL0olcvECu+39ZiuA8AW2w4Z2AkB8XVW0KfvMS/hgr3VFv
	4G65lf5hskyEe3jybM04M8CI8LNqiHE+vOC5nFS2+UUW4bSRIfEywykugX6qnkN8Tda2RAAzkCmNS
	F++4gQzMbhoCy9M4djcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgoV-0000000EYoz-20yg;
	Wed, 03 Jun 2026 08:18:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgoT-0000000EYoX-1wGW
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Jun 2026 08:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kFeTv/Mtw5rUnQHNWc9zOtQG7POGqdE/BRFIOTGTTdw=; b=HBZebZk7aWCMXxl+hcpbpmnWa2
	7qs1tULLHQocyLNzET1wBscULihAxtFPheW4T4ptLuzyUceQ3bypBoLBc4E8wubfH+a/Oh4zj6jZ1
	0+2HsOaqTNHx6QtcIqKXx24xqnaQK/AueGJgT2w6a8MuUTCktM17jZcjfI0528fF5HEVN97fTpXCA
	fjn/yW8fZzz0vTErBSzdb/lvb3uGwn06VWBTdby1TKQeH5oUZgyz5i3DYrsa4NLJorzMlqe20czKY
	cWMYC2nLjcHso+GcTAMbYLVQRHk7oqKocBBa5FeO2dwLnI+E7ATHYKLQYRMHOqqAFFab0pwW53VPy
	UpJhZ9Vw==;
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUgoQ-0000000BYVA-2QN1
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 08:18:56 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-69e489edbf8so340739eaf.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 01:18:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780474733; cv=none;
        d=google.com; s=arc-20240605;
        b=PDyC1FD28T724H/ezBLeCoasWh6LI0M1lzmgeOaONHRdboYs+U3oDwc+GD77+arOQX
         ebfVmX/zd7IrsOnkCCXHejG5LYp2/kEvXX9kK0Z01yaxOkuxJ6XTLlR+bhEYR9wGR3dZ
         1IX1vP5NjKcu1XxDFASjb9Ym1M1mi/cAQMEo420gvs41ctGyJ7kgfirlfwXcW1WQH0pD
         9No0fCPaVUhWc4Du0qzTGtT+H5SXliTacxV7rrlE31xapAVI6LTqEzUjarB9XNz0ar1E
         y4BY9ITNaiUq1XBLssZbbERhO0Bc6S0EBo4H8qgcbWZOvFOCZGVrq6zoGAA8B9tf2txE
         2aEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kFeTv/Mtw5rUnQHNWc9zOtQG7POGqdE/BRFIOTGTTdw=;
        fh=v8fGHRmZySWdCODr9vWFCRfIfNNSiHY4Tg3doB8L31A=;
        b=U5CV7YraxBmErSJToUnGC7obushu+Fpnj6dVjB3fUFtyx5uumF+Ilvb8f8DyYzM9Fl
         KlksZMjp4ckPQ2oKHMaI6GhuKXlgQb3TV+3ARHErMYjl1pfDA1m7Zht5relnmUb3UTdr
         whsp2/D4IxRk7t7eHLSfZXALphQHa4i2SKVxq3fBSvkNgaICnNNpmAkGrFW5IGd/AFuV
         xkfGV5LA5cx9UjoRiGsNVL7m/1ptmbtR6XiYgXTlex/aLftHNhrxIs9LnjKqhBgNroy5
         R72k6Z+g4AyUkw24L8rUQ859HUZtAQ2dOgJ/JAtZpWAlVXge4xVFcHC0CeUQUsTf0c3V
         VKhw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780474733; x=1781079533; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFeTv/Mtw5rUnQHNWc9zOtQG7POGqdE/BRFIOTGTTdw=;
        b=sHr8NUSUf69wk59bpSCh1qRcYTNiaSr4llFocCSa3g/dGU9sZG7XCLBWr+l9Fdx574
         QqHFNpGYpKbf3OMJV7XMgxJ4TGZ4HGKC7o4YgfTLPwV8k1+WDo98fxPz9CeAueaw5X+I
         pp4AtU8OK+/l3jq/SOXqtjUqpqcGCAl2zwOdCj8k0oSX18RhmfQ/L+iCdvEn2OZYEhjL
         xh8OI8Xxj1fUjXTUF7NrmVwRaCvbwBLgGs/uo37MuS+aULLkMdSUskHFCDRtJx9Y79OT
         h4wfEBXeIkRvlfNgeGMCCYYRtJrC/xuc1Xn69FEEawTbOUwangjLDtjQAyfIVic2KZEo
         1NlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780474733; x=1781079533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kFeTv/Mtw5rUnQHNWc9zOtQG7POGqdE/BRFIOTGTTdw=;
        b=HdM3ZXmfTziPh7oog09pu4btaBRm1dV/YkLbZjQAzpv7DXrodoghyHbfafpzssftnq
         mss1lHjbgAkKSalS2gVw4Ztga4fpQCOlTyNJcrXrRSwyuQDjmy+8wXlYTKH6o2hn8FVZ
         s9b0aQ/jNAgsjSP5EsImhuoU3ncgXcMoE8EW7EAUSbUJSHgzA+8RQkE3ytjxE638NhVa
         YNP8S9dZeGp4Pqx/QhEgiTJ60X6QfdjPJ8o8sh0PHwVjZi7Dqvp0gQtJbj1sBpAsxn64
         242KLVk6226BK7C+EpDA7hB1QRVjcyrUpFtZNanHVVnqyRg+M/ELTfphOwu682GCDI/U
         zkLw==
X-Forwarded-Encrypted: i=1; AFNElJ9K1QDP88q9PWxHV4pT9MSlJAU7x6AdmiaienqxRT4RWQ6wVXUkEzfAlab3SRZZGRGTmd8FSnGLaZubeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAkDDrGXEJkHXc6/J3SASKYPtdqb2/CGMIpZhho3x7i3mMYM4G
	E7KCOKX7WF0GBXGhPpCOBSFOA2Dns+wipNR5gPaPm6wqu5GY7PyZu2QQJNfc66Y/G8aBiGW73R2
	xwy8bLYq8PhyxC96jxqUyGcXSDVJzpuCM5F0QbEN1oA==
X-Gm-Gg: Acq92OG8FxTHwYLyEkbyxF9O1Mf8hoJfwaFLb6XDMeoE+HTGFkZg39SaymArZL1MofV
	gXZvmpipfP4MUqG+Ohtkk0liDXdHlbZ7onwkdaAME6LQGAFJuuiCls17uC36eebDr8k3r62rh7K
	391mjdM5EHG40k5Siv+uKU3e9wojLbmX6+/Df0FTmRHUvIqxDOuJkVkwfs44KrnQQjXQCtuzS5i
	nLXbo8b9HlZRzS30hS5FISMHGuscvORA4RBeNunlZZL0EUF1OFTDDsXGtN6K+KvgMYvLixmyXrM
	hrVl4KfrZ8GQbQivqPI36stQHqCeC4jPMrZPd2YV2Ydn9+QgMoM/uBfU9Jd/VbmhSQVZKM6Zs/L
	Qv93Ob+G/HlR8HhMhUcrdmSfzeSLn7wFzVEXG2w==
X-Received: by 2002:a4a:e053:0:b0:696:84a7:1c9e with SMTP id
 006d021491bc7-69e480ca3afmr1083284eaf.54.1780474732678; Wed, 03 Jun 2026
 01:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260513153656847l3c4fI5hBsAyoIZi8aGIs@zte.com.cn> <20260513154125023xfKNqfea7TklqO9_RRrkt@zte.com.cn>
In-Reply-To: <20260513154125023xfKNqfea7TklqO9_RRrkt@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Jun 2026 13:48:41 +0530
X-Gm-Features: AVHnY4KFDoPAklYlm9v6C3lajzcXBdS812tUFjYiyrvVraXpwSqHdXHXDDLKwNc
Message-ID: <CAAhSdy28AR=Gs90nofSWPkh9z_gmwmmTjsae_PCyyL_5qXcGhQ@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_2=2F4=5D_RISC=2DV=3A_KVM=3A_Split_huge_pages_when_d?=
	=?UTF-8?Q?irty_logging_is=C2=A0enabled?=
To: wang.yechao255@zte.com.cn
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_091854_832039_5814A2B9 
X-CRM114-Status: GOOD (  19.11  )
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

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMToxMeKAr1BNIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPiB3cm90ZToKPgo+IEZyb206IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPgo+Cj4gU3BsaXQgaHVnZSBwYWdlcyBlYWdlcmx5IHdoZW4gZW5hYmxpbmcgZGlydHkgbG9n
Z2luZy4gVGhlIGdvYWwgaXMgdG8KPiBhdm9pZCBkb2luZyBpdCB3aGlsZSBmYXVsdGluZyBvbiB3
cml0ZS1wcm90ZWN0ZWQgcGFnZXMsIHdoaWNoCj4gbmVnYXRpdmVseSBpbXBhY3RzIGd1ZXN0IHBl
cmZvcm1hbmNlLgo+Cj4gVGhlIGJlbmVmaXRzIG9mIGVhZ2VyIHBhZ2Ugc3BsaXR0aW5nIGFyZSB0
aGUgc2FtZSBhcyBpbiB4ODYgYW5kIGFybTY0LAo+IGFkZGVkIHdpdGggY29tbWl0IGEzZmU1ZGJk
YTBhNCAoIktWTTogeDg2L21tdTogU3BsaXQgaHVnZSBwYWdlcyBtYXBwZWQKPiBieSB0aGUgVERQ
IE1NVSB3aGVuIGRpcnR5IGxvZ2dpbmcgaXMgZW5hYmxlZCIpIGFuZCBjb21taXQgZTdiZjdhNDkw
YzY4Cj4gKCJLVk06IGFybTY0OiBTcGxpdCBodWdlIHBhZ2VzIHdoZW4gZGlydHkgbG9nZ2luZyBp
cyBlbmFibGVkIikKPgo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1
NUB6dGUuY29tLmNuPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9tbXUuYyB8IDYyICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2
MiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vbW11LmMgYi9h
cmNoL3Jpc2N2L2t2bS9tbXUuYwo+IGluZGV4IDg1YTNmYjI2MjJhNC4uMTRjNTU4ZWU1ZjE1IDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0v
bW11LmMKPiBAQCAtOTAsNiArOTAsNTAgQEAgdm9pZCBrdm1fcmlzY3ZfbW11X2lvdW5tYXAoc3Ry
dWN0IGt2bSAqa3ZtLCBncGFfdCBncGEsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKPiAgICAgICAgIHNw
aW5fdW5sb2NrKCZrdm0tPm1tdV9sb2NrKTsKPiAgfQo+Cj4gK3N0YXRpYyBib29sIG5lZWRfdG9w
dXBfc3BsaXRfY2FjaGVzX29yX3Jlc2NoZWQoc3RydWN0IGt2bV9tbXVfbWVtb3J5X2NhY2hlICpj
YWNoZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlu
dCBjb3VudCkKPiArewo+ICsgICAgICAgaWYgKG5lZWRfcmVzY2hlZCgpKQo+ICsgICAgICAgICAg
ICAgICByZXR1cm4gdHJ1ZTsKPiArCj4gKyAgICAgICByZXR1cm4ga3ZtX21tdV9tZW1vcnlfY2Fj
aGVfbnJfZnJlZV9vYmplY3RzKGNhY2hlKSA8IGNvdW50Owo+ICt9Cj4gKwo+ICsvKiB0aGUgY2Fs
bGVyIG11c3QgaGVsZCBtbXUgbG9jayAqLwo+ICtzdGF0aWMgdm9pZCBrdm1fcmlzY3Zfc3BsaXRf
aHVnZV9wYWdlcyhzdHJ1Y3Qga3ZtX2dzdGFnZSAqZ3N0YWdlLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBoeXNfYWRkcl90IHN0YXJ0LCBwaHlzX2FkZHJfdCBlbmQs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBmbHVzaCkKCnMv
a3ZtX3Jpc2N2X3NwbGl0X2h1Z2VfcGFnZXMvbW11X3NwbGl0X2h1Z2VfcGFnZXMvCgo+ICt7Cj4g
KyAgICAgICBzdHJ1Y3Qga3ZtICprdm0gPSBnc3RhZ2UtPmt2bTsKPiArICAgICAgIHN0cnVjdCBr
dm1fbW11X21lbW9yeV9jYWNoZSAqcGNhY2hlID0gJmt2bS0+YXJjaC5zcGxpdF9wYWdlX2NhY2hl
Owo+ICsgICAgICAgaW50IGNvdW50ID0gZ3N0YWdlLT5wZ2RfbGV2ZWxzOwo+ICsgICAgICAgcGh5
c19hZGRyX3QgYWRkciA9IHN0YXJ0Owo+ICsgICAgICAgaW50IHJldDsKPiArCgpsb2NrZGVwX2Fz
c2VydF9oZWxkID8/Cgo+ICsgICAgICAgd2hpbGUgKGFkZHIgPCBlbmQpIHsKPiArICAgICAgICAg
ICAgICAgaWYgKG5lZWRfdG9wdXBfc3BsaXRfY2FjaGVzX29yX3Jlc2NoZWQocGNhY2hlLCBjb3Vu
dCkpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBzcGluX3VubG9jaygma3ZtLT5tbXVfbG9j
ayk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29uZF9yZXNjaGVkKCk7Cj4gKwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHJldCA9IGt2bV9tbXVfdG9wdXBfbWVtb3J5X2NhY2hlKHBjYWNo
ZSwgY291bnQpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQpIHsKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGt2bV9lcnIoIkZhaWxlZCB0byB0b3VwIHNwbGl0IHBh
Z2UgY2FjaGVcbiIpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Bpbl9sb2Nr
KCZrdm0tPm1tdV9sb2NrKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
bjsKPiArICAgICAgICAgICAgICAgICAgICAgICB9Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
c3Bpbl9sb2NrKCZrdm0tPm1tdV9sb2NrKTsKPiArICAgICAgICAgICAgICAgfQo+ICsKPiArICAg
ICAgICAgICAgICAgcmV0ID0ga3ZtX3Jpc2N2X2dzdGFnZV9zcGxpdF9odWdlKGdzdGFnZSwgcGNh
Y2hlLCBhZGRyLCAwLCBmbHVzaCk7Cj4gKyAgICAgICAgICAgICAgIGlmIChyZXQgIT0gMCkgewo+
ICsgICAgICAgICAgICAgICAgICAgICAgIGt2bV9lcnIoInNwbGl0IGh1Z2UgcGFnZSBmb3IgYWRk
cigweCVsbHgpIGZhaWxlZCAlZFxuIiwgYWRkciwgcmV0KTsKPiArICAgICAgICAgICAgICAgICAg
ICAgICBicmVhazsKPiArICAgICAgICAgICAgICAgfQo+ICsKPiArICAgICAgICAgICAgICAgYWRk
ciArPSBQTURfU0laRTsKPiArICAgICAgIH0KPiArfQo+ICsKPiAgdm9pZCBrdm1fYXJjaF9tbXVf
ZW5hYmxlX2xvZ19kaXJ0eV9wdF9tYXNrZWQoc3RydWN0IGt2bSAqa3ZtLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3Qg
KnNsb3QsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2Zu
X3QgZ2ZuX29mZnNldCwKPiBAQCAtMTM2LDYgKzE4MCwyMyBAQCB2b2lkIGt2bV9hcmNoX2ZsdXNo
X3NoYWRvd19tZW1zbG90KHN0cnVjdCBrdm0gKmt2bSwKPiAgICAgICAgIHNwaW5fdW5sb2NrKCZr
dm0tPm1tdV9sb2NrKTsKPiAgfQo+Cj4gK3N0YXRpYyB2b2lkIGt2bV9yaXNjdl9zcGxpdF9tZW1v
cnlfcmVnaW9uKHN0cnVjdCBrdm0gKmt2bSwgaW50IHNsb3QpCgpzL2t2bV9yaXNjdl9zcGxpdF9t
ZW1vcnlfcmVnaW9uL21tdV9zcGxpdF9tZW1vcnlfcmVnaW9uLwoKPiArewo+ICsgICAgICAgc3Ry
dWN0IGt2bV9tZW1zbG90cyAqc2xvdHMgPSBrdm1fbWVtc2xvdHMoa3ZtKTsKPiArICAgICAgIHN0
cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKm1lbXNsb3QgPSBpZF90b19tZW1zbG90KHNsb3RzLCBzbG90
KTsKPiArICAgICAgIHBoeXNfYWRkcl90IHN0YXJ0ID0gbWVtc2xvdC0+YmFzZV9nZm4gPDwgUEFH
RV9TSElGVDsKPiArICAgICAgIHBoeXNfYWRkcl90IGVuZCA9IChtZW1zbG90LT5iYXNlX2dmbiAr
IG1lbXNsb3QtPm5wYWdlcykgPDwgUEFHRV9TSElGVDsKPiArICAgICAgIHN0cnVjdCBrdm1fZ3N0
YWdlIGdzdGFnZTsKPiArCj4gKyAgICAgICBrdm1fcmlzY3ZfZ3N0YWdlX2luaXQoJmdzdGFnZSwg
a3ZtKTsKPiArCj4gKyAgICAgICBzcGluX2xvY2soJmt2bS0+bW11X2xvY2spOwo+ICsgICAgICAg
a3ZtX3Jpc2N2X3NwbGl0X2h1Z2VfcGFnZXMoJmdzdGFnZSwgc3RhcnQsIGVuZCwgZmFsc2UpOwo+
ICsgICAgICAgc3Bpbl91bmxvY2soJmt2bS0+bW11X2xvY2spOwo+ICsKPiArICAgICAgIGt2bV9m
bHVzaF9yZW1vdGVfdGxic19tZW1zbG90KGt2bSwgbWVtc2xvdCk7Cj4gK30KPiArCj4gIHZvaWQg
a3ZtX2FyY2hfY29tbWl0X21lbW9yeV9yZWdpb24oc3RydWN0IGt2bSAqa3ZtLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqb2xkLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGt2bV9tZW1vcnlfc2xv
dCAqbmV3LAo+IEBAIC0xNTAsNiArMjExLDcgQEAgdm9pZCBrdm1fYXJjaF9jb21taXRfbWVtb3J5
X3JlZ2lvbihzdHJ1Y3Qga3ZtICprdm0sCj4gICAgICAgICAgICAgICAgIGlmIChrdm1fZGlydHlf
bG9nX21hbnVhbF9wcm90ZWN0X2FuZF9pbml0X3NldChrdm0pKQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybjsKPiAgICAgICAgICAgICAgICAgbW11X3dwX21lbW9yeV9yZWdpb24oa3Zt
LCBuZXctPmlkKTsKPiArICAgICAgICAgICAgICAga3ZtX3Jpc2N2X3NwbGl0X21lbW9yeV9yZWdp
b24oa3ZtLCBuZXctPmlkKTsKPiAgICAgICAgIH0KPiAgfQo+Cj4gLS0KPiAyLjI3LjAKClJlZ2Fy
ZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
