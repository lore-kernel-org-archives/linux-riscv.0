Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31973C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 00:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=KP8fOhI5FkvNcVdHiLgopdDl4dZcVp8Uy/cLB10yaw0=; b=fGIcbwN8FvLA0x28HKptUo/OlK
	ffVmTZ638ym7RUAnQ8RmnfGQHqAcZv3yhoHwfGeCRQ7vllgpZocmraFp0v9RE/6YpdLWSRvkyGE7e
	J0BtjjAvqed7lTq+a3+bXoplQsxC/iC92nsysI++EQnINLanWbs8BbcCIw6t4MF6ePkbjROXfjBT9
	YA1rQqGH/9RFcbvaYd2xYlSgkv8ikLOA20ACjjn8HcRuX6afDCG4lWT960sEwH4vnG75Pt13iGz4M
	G/e3tVOoCoBnm8ljoYcxpjZBF3BlrRk2rhFGtRbYupZnpAXGnu8vmnFYv7DnIU5F+AL5UV430cE2Q
	GIIS4c4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu1XY-00D4tj-01; Thu, 26 May 2022 00:39:48 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu1XT-00D4sb-HQ
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 00:39:46 +0000
Received: by mail-pf1-x430.google.com with SMTP id x143so376830pfc.11
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 17:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=lmgayds5UtNEFyHbtMEOI/udLkmrlP9KZ5Zh1sLLZwU=;
        b=Ki9BjClaDu10N/8XW3YdIW+aM9JwTsK5eJ7ZRizWaJukpFsCAC9ZVrj4tbtrzZxBxG
         q+3cCEvBD0cDVSaL4Tr+XC1OghoMfUyMa4uN2DTbk69pTjL7mdMbSom+dpWfKDxBW6y/
         xqc91eVk9bYknMBKuiJAKdA7vLgLi7sNExBcT9eaRTbBCMEyBduY+COgJy7RZ8KrViWs
         vuH+NavQ0uvbD3M8F+vNl1yrN18rEJDYdhcHqWFCy6D3jpCs2l37ztahBQNKMYvjgqop
         eRzAbYDCBI+hhnfZoV2RHkO+21j4mh7Np3kZeFUYbeSB6fkV+XCclNIDWT5FbtUNjM0k
         avnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=lmgayds5UtNEFyHbtMEOI/udLkmrlP9KZ5Zh1sLLZwU=;
        b=qg+tzC+Z8VDtvCq0evfK70Nra4w5qVpVt/jZcyjvrruHa9+9NFFGCqgfEHMaY902r4
         znCDswVqpy+RnN9BbyVRUs0yOkeRgeKqAzHOMAHeH1ERNcgqeAKDtnwDIc42/HW0Vu3x
         v8gHwZpcrqW+JtO2HPRQvuy51tJOM8poxTalfTbXrVA/L8cVr1/HUtyEnDjjmWRQelbq
         Pzprfmwll0ZA8skixaln+L5iAsnbyAx5cTYYsP62pxSb+xOJAHohI/Q5vWSNR7Y8Xyno
         rh/pp4yrYSDIBvBSL0xdETFTuw0RiqIXXvBX8HdD/u6U6/RQ8JHDOsW7vXFqJKssGgM7
         cp7w==
X-Gm-Message-State: AOAM530ghzC+RYy5TU/aYLFIHjWue5t+gHPYtZxt9TZf3DH5HzFTO1VA
	dpTxAnkZSHC9oMkf6TmUsCLQ+A==
X-Google-Smtp-Source: ABdhPJzkH9LzH2tzaLtZljf2U0KKdd7VDbdj19BDT+3tyKSkGkp0zFoN2Hm3IE7OoLNAWn5cRUCeyA==
X-Received: by 2002:a65:6e9b:0:b0:3c5:f761:2d94 with SMTP id bm27-20020a656e9b000000b003c5f7612d94mr30378283pgb.79.1653525581600;
        Wed, 25 May 2022 17:39:41 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id z8-20020a17090a170800b001d93118827asm85801pjd.57.2022.05.25.17.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 17:39:39 -0700 (PDT)
Date: Wed, 25 May 2022 17:39:39 -0700 (PDT)
X-Google-Original-Date: Wed, 25 May 2022 17:39:37 PDT (-0700)
Subject: Re: [PATCH] riscv: compat: Using seperated vdso_maps for compat_vdso_info
In-Reply-To: <48ef770c-75bf-6c37-66fe-9719164bc6e0@roeck-us.net>
CC: guoren@kernel.org, Arnd Bergmann <arnd@arndb.de>, heiko@sntech.de,
  linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
  guoren@linux.alibaba.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux@roeck-us.net
Message-ID: <mhng-7a88227d-dc64-4d87-9e1a-0ea802ddf0a1@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_173943_809718_86F32B90 
X-CRM114-Status: GOOD (  18.53  )
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

T24gV2VkLCAyNSBNYXkgMjAyMiAxNTo1NjowNyBQRFQgKC0wNzAwKSwgbGludXhAcm9lY2stdXMu
bmV0IHdyb3RlOgo+IE9uIDUvMjUvMjIgMTQ6MzQsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+PiBP
biBXZWQsIDI1IE1heSAyMDIyIDE0OjE1OjAzIFBEVCAoLTA3MDApLCBsaW51eEByb2Vjay11cy5u
ZXQgd3JvdGU6Cj4+PiBPbiA1LzI1LzIyIDA5OjA0LCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToK
Pj4+PiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4+Pj4KPj4+PiBU
aGlzIGlzIGEgZml4dXAgZm9yIHZkc28gaW1wbGVtZW50YXRpb24gd2hpY2ggY2F1c2VkIG11c2wg
dG8KPj4+PiBmYWlsLgo+Pj4+Cj4+Pj4gW8KgwqAgMTEuNjAwMDgyXSBSdW4gL3NiaW4vaW5pdCBh
cyBpbml0IHByb2Nlc3MKPj4+PiBbwqDCoCAxMS42Mjg1NjFdIGluaXRbMV06IHVuaGFuZGxlZCBz
aWduYWwgMTEgY29kZSAweDEgYXQKPj4+PiAweDAwMDAwMDAwMDAwMDAwMDAgaW4gbGliYy5zb1tm
ZmZmZmY4YWQzOTAwMCthNDAwMF0KPj4+PiBbwqDCoCAxMS42MjkzOThdIENQVTogMCBQSUQ6IDEg
Q29tbTogaW5pdCBOb3QgdGFpbnRlZAo+Pj4+IDUuMTguMC1yYzctbmV4dC0yMDIyMDUyMCAjMQo+
Pj4+IFvCoMKgIDExLjYyOTQ2Ml0gSGFyZHdhcmUgbmFtZTogcmlzY3YtdmlydGlvLHFlbXUgKERU
KQo+Pj4+IFvCoMKgIDExLjYyOTU0Nl0gZXBjIDogMDBmZmZmZmY4YWRhMTEwMCByYSA6IDAwZmZm
ZmZmOGFkYTEzYzggc3AgOgo+Pj4+IDAwZmZmZmZmYzU4MTk5ZjAKPj4+PiBbwqDCoCAxMS42Mjk1
ODZdwqAgZ3AgOiAwMGZmZmZmZjhhZDM5MDAwIHRwIDogMDBmZmZmZmY4YWRlMDk5OCB0MCA6Cj4+
Pj4gZmZmZmZmZmZmZmZmZmZmZgo+Pj4+IFvCoMKgIDExLjYyOTU5OF3CoCB0MSA6IDAwZmZmZmZm
YzU4MTlmZDAgdDIgOiAwMDAwMDAwMDAwMDAwMDAwIHMwIDoKPj4+PiAwMGZmZmZmZjhhZGUwY2Mw
Cj4+Pj4gW8KgwqAgMTEuNjI5NjEwXcKgIHMxIDogMDBmZmZmZmY4YWRlMGNjMCBhMCA6IDAwMDAw
MDAwMDAwMDAwMDAgYTEgOgo+Pj4+IDAwZmZmZmZmYzU4MTlhMDAKPj4+PiBbwqDCoCAxMS42Mjk2
MjJdwqAgYTIgOiAwMDAwMDAwMDAwMDAwMDAxIGEzIDogMDAwMDAwMDAwMDAwMDAxZSBhNCA6Cj4+
Pj4gMDBmZmZmZmZjNTgxOWIwMAo+Pj4+IFvCoMKgIDExLjYyOTYzNF3CoCBhNSA6IDAwZmZmZmZm
YzU4MTliMDAgYTYgOiAwMDAwMDAwMDAwMDAwMDAwIGE3IDoKPj4+PiAwMDAwMDAwMDAwMDAwMDAw
Cj4+Pj4gW8KgwqAgMTEuNjI5NjQ1XcKgIHMyIDogMDBmZmZmZmY4YWRlMGFjOCBzMyA6IDAwZmZm
ZmZmOGFkZTBlYzggczQgOgo+Pj4+IDAwZmZmZmZmOGFkZTA3MjgKPj4+PiBbwqDCoCAxMS42Mjk2
NTZdwqAgczUgOiAwMGZmZmZmZjhhZGUwYTkwIHM2IDogMDAwMDAwMDAwMDAwMDAwMCBzNyA6Cj4+
Pj4gMDBmZmZmZmZjNTgxOWU0MAo+Pj4+IFvCoMKgIDExLjYyOTY2N13CoCBzOCA6IDAwZmZmZmZm
OGFkZTBjYTAgczkgOiAwMGZmZmZmZjhhZGRiYTUwIHMxMDoKPj4+PiAwMDAwMDAwMDAwMDAwMDAw
Cj4+Pj4gW8KgwqAgMTEuNjI5Njc4XcKgIHMxMTogMDAwMDAwMDAwMDAwMDAwMCB0MyA6IDAwMDAw
MDAwMDAwMDAwMDIgdDQgOgo+Pj4+IDAwMDAwMDAwMDAwMDAwMDEKPj4+PiBbwqDCoCAxMS42Mjk2
ODhdwqAgdDUgOiAwMDAwMDAwMDAwMDIwMDAwIHQ2IDogZmZmZmZmZmZmZmZmZmZmZgo+Pj4+IFvC
oMKgIDExLjYyOTY5OV0gc3RhdHVzOiAwMDAwMDAwMDAwMDA0MDIwIGJhZGFkZHI6IDAwMDAwMDAw
MDAwMDAwMDAKPj4+PiBjYXVzZTogMDAwMDAwMDAwMDAwMDAwZAo+Pj4+Cj4+Pj4gVGhlIGxhc3Qg
X192ZHNvX2luaXQoJmNvbXBhdF92ZHNvX2luZm8pIHJlcGxhY2VzIHRoZSBkYXRhIGluIG5vcm1h
bAo+Pj4+IHZkc29faW5mby4gVGhpcyBpcyBhbiBvYnZpb3VzIGJ1Zy4KPj4+Pgo+Pj4+IFJlcG9y
dGVkLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+Cj4+Pj4gU2lnbmVkLW9m
Zi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+Pj4+IENjOiBQYWxtZXIgRGFiYmVsdCA8
cGFsbWVyQGRhYmJlbHQuY29tPgo+Pj4+IENjOiBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250ZWNo
LmRlPgo+Pj4KPj4+IFRlc3RlZC1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0
Pgo+Pgo+PiBTb3JyeSBJJ20gYSBiaXQgYnVyaWVkIHJpZ2h0IG5vdywgdGhpcyBpcyBmaXhpbmcg
dGhlIGlzc3VlIHlvdSBwb2ludGVkIG91dCBlYXJsaWVyPwo+Pgo+IFllcy4KCkF3b3NvbWUsIEkg
dGhpbmsgdGhhdCB3YXMgdGhlIG9ubHkgYmlnIGJsb2NrZXIgc28gZmFyLgoKSSBhZGRlZCBhIG11
c2wtYmFzZWQgdXNlcnNwYWNlIHRvIG15IHRlc3Qgc2V0dXAsIHdoaWNoIGlzIHJ2NjQtb25seSAK
KGJ1aWxkcm9vdCBkb2Vzbid0IGhhdmUgcnYzMiBtdXNsLCBJIHRob3VnaHQgdXBzdHJlYW0gaGFk
IGl0IGJ1dCBtYXliZSAKaSdtIG1pc3JlbWVtYmVyaW5nKS4gIFRoaXMgcGF0Y2ggZml4ZXMgdGhl
IGJ1Zywgc28gSSd2ZSBhZGRlZCBpdCB0byAKZm9yLW5leHQgd2l0aAoKRml4ZXM6IDMwOTJlYjQ1
NjM3NSAoInJpc2N2OiBjb21wYXQ6IHZkc286IEFkZCBzZXR1cCBhZGRpdGlvbmFsIHBhZ2VzIGlt
cGxlbWVudGF0aW9uIikKCndoaWNoIEkgdGhpbmsgaXMgY29ycmVjdCwgYnV0IExNSyBpZiB0aGVy
ZSdzIGFuIGlzc3VlLiAgCgpUaGFua3MhCgooYW5kIGFsc28gc29ycnkgSSBwb2tlZCBHZWVydCBp
bnN0ZWFkIG9mIHlvdSBhYm91dCB0aGlzIG9uZSwgb29wcyA7KSkKCj4KPiBUaGFua3MsCj4gR3Vl
bnRlcgo+Cj4+Pgo+Pj4+IC0tLQo+Pj4+IMKgIGFyY2gvcmlzY3Yva2VybmVsL3Zkc28uYyB8IDE1
ICsrKysrKysrKysrKystLQo+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L3Zkc28uYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28uYwo+Pj4+IGluZGV4IDUwZmU0Yzg3NzYw
My4uNjliMDViNmMxODFiIDEwMDY0NAo+Pj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28u
Ywo+Pj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28uYwo+Pj4+IEBAIC0yMDYsMTIgKzIw
NiwyMyBAQCBzdGF0aWMgc3RydWN0IF9fdmRzb19pbmZvIHZkc29faW5mbyBfX3JvX2FmdGVyX2lu
aXQgPSB7Cj4+Pj4gwqAgfTsKPj4+Pgo+Pj4+IMKgICNpZmRlZiBDT05GSUdfQ09NUEFUCj4+Pj4g
K3N0YXRpYyBzdHJ1Y3Qgdm1fc3BlY2lhbF9tYXBwaW5nIHJ2X2NvbXBhdF92ZHNvX21hcHNbXSBf
X3JvX2FmdGVyX2luaXQgPSB7Cj4+Pj4gK8KgwqDCoCBbUlZfVkRTT19NQVBfVlZBUl0gPSB7Cj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIC5uYW1lwqDCoCA9ICJbdnZhcl0iLAo+Pj4+ICvCoMKgwqDCoMKg
wqDCoCAuZmF1bHQgPSB2dmFyX2ZhdWx0LAo+Pj4+ICvCoMKgwqAgfSwKPj4+PiArwqDCoMKgIFtS
Vl9WRFNPX01BUF9WRFNPXSA9IHsKPj4+PiArwqDCoMKgwqDCoMKgwqAgLm5hbWXCoMKgID0gIlt2
ZHNvXSIsCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC5tcmVtYXAgPSB2ZHNvX21yZW1hcCwKPj4+PiAr
wqDCoMKgIH0sCj4+Pj4gK307Cj4+Pj4gKwo+Pj4+IMKgIHN0YXRpYyBzdHJ1Y3QgX192ZHNvX2lu
Zm8gY29tcGF0X3Zkc29faW5mbyBfX3JvX2FmdGVyX2luaXQgPSB7Cj4+Pj4gwqDCoMKgwqDCoCAu
bmFtZSA9ICJjb21wYXRfdmRzbyIsCj4+Pj4gwqDCoMKgwqDCoCAudmRzb19jb2RlX3N0YXJ0ID0g
Y29tcGF0X3Zkc29fc3RhcnQsCj4+Pj4gwqDCoMKgwqDCoCAudmRzb19jb2RlX2VuZCA9IGNvbXBh
dF92ZHNvX2VuZCwKPj4+PiAtwqDCoMKgIC5kbSA9ICZydl92ZHNvX21hcHNbUlZfVkRTT19NQVBf
VlZBUl0sCj4+Pj4gLcKgwqDCoCAuY20gPSAmcnZfdmRzb19tYXBzW1JWX1ZEU09fTUFQX1ZEU09d
LAo+Pj4+ICvCoMKgwqAgLmRtID0gJnJ2X2NvbXBhdF92ZHNvX21hcHNbUlZfVkRTT19NQVBfVlZB
Ul0sCj4+Pj4gK8KgwqDCoCAuY20gPSAmcnZfY29tcGF0X3Zkc29fbWFwc1tSVl9WRFNPX01BUF9W
RFNPXSwKPj4+PiDCoCB9Owo+Pj4+IMKgICNlbmRpZgo+Pj4+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
