Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD964C44501
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 06:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vinNXJyAdBspwVoz6LqMXdZxd3TesDVA0jZtxeJttAk=; b=NP8Jrw5TP3KUKD
	/ZkfbhXHd73Q/0hUv99yNEpTJAQfk4lca24GVvqWteDknMnblHe+jMG/QOyQMoKz5y/ebS1JbWcMU
	tjDCY/vEohyGd7gQx3Y+j/pSQVA35ib9tiY1SRhdp6ob28Z6ogQp6N8dwb6PyV1RG3Ba5ZTjcsIRf
	DEpwCY3vfKUigprr1t4Yem7G7Lv4fkHjNxG0CfP9wnc+WwBvgQPVt7OiFDvLgO2neU98WbvpSUy+C
	AHayVjW62+Zhc4h5D5DILxrwAkl910F33xT7KQ/OarhN0Y4Li9QDgLKCOblEyqV9d/C0kdH7QXRsK
	d24vVVmJPlzulfWlV/zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkG4H-0000000GbKr-0cs7;
	Thu, 16 Jul 2026 06:59:37 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkG4E-0000000GbKM-3hbh
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 06:59:36 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-69a50b818c8so10479351a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 23:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784185173; cv=none;
        d=google.com; s=arc-20260327;
        b=SfzplqIlgUv76/ad8cTUNbjAq68B8mDBlHeHA4G/w7uYdvrtUb3OgTGt1a+T4hDM3W
         yage0wcWbIX2KrGBwfFmRuOZXZ9kV6AZxaueTrB5Dw+z/ne0v8GJTHvgdFxxr7i5Ybef
         aXLu5AbIlik1latMC0Yk0crRWFSNXdkoH/Yt/fvQ2JRdd0P2jMhlfRCCVZA/ublhfL1H
         RKIwNUGcxpmv+1fGMLBlCOuvBGn/H2H0YHbA4kGyn8rcy1VPNEKnNFCeaqyfbHJmPGsH
         cn/S0SVcH7tv006hkkSV79iUh6IsYHFNJzRFmb1J40t6a8O0BZ6PlbRqi0uNXfjwBbs8
         ITxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k/t3c9uOY85dN4pWWCwyVJjxaFCEzSl5NE8E0QuBvs0=;
        fh=0ErhMLy0xK4210if/aYskHj8m5V/lUWJ+kMfMfwaB28=;
        b=J1zp1mcqCNOqXkMpItoAFlNSb2TPEyF24zbLJr5abxnlIE85wUbYJcFXF6k/nIEMdm
         tmLAkjt9ha8gAneLi6ubBsdPKFeLXPg1sCajNJjev1WzBd9C5uClSx2U1WowNWRXzUHH
         YLpY1xqnDbVJhSARi3/oORB9a5tvkwRxR0KfkS7G5EuGirsQXT3zewrNcD67Zt7p1dSp
         7awDUn83F5OwefhFNmF2NJnGymHhYJqnUTwCZ3ukregmjixwAx0Fh8pY+VR41HI66kzD
         CofTfEPWPMNHqR/aRgD3EScWIQUNBol71RrZ70+WWKvW3zdUqN5hfnqX7UYWyIckQXTC
         peAA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1784185173; x=1784789973; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k/t3c9uOY85dN4pWWCwyVJjxaFCEzSl5NE8E0QuBvs0=;
        b=CSXTai+r5DMjxWW9E0MzeskMeExJbJ8nqufgcTJPm6l+zpSMwaRH1VOLcmGzexAN6M
         nzHtBLtgHzYe1vUHOIfpmHqXbQNyqMs+ta3LSGyJfKjDFS4Gq2rPXdDUmtmAkegg0R/X
         lyYcHiYcYHoPH8hYzSSFtAwkoCPcVtShq0HnfBkILKvXnkfmAS+kTwiFupAZE3F4S24k
         D2Uk2nFggQGxPkJP3x3MgHYasFl19BDpSKQc4VoDwg2hJsIc4QQ8/A6UoV12WGonO7Hq
         QA92GnY82E0PQXIS8/Xz0r4iLaLwGpqI2zNIY84o421Q5m6dDex39c9yKR4PQXbIC0Jb
         k3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784185173; x=1784789973;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k/t3c9uOY85dN4pWWCwyVJjxaFCEzSl5NE8E0QuBvs0=;
        b=GD7KTG9A8Z/RxlBn7cDox0zlBK5F9uSCpL5giIOYEqj1Z2bH7o8xNHUVBQNuV9LAiI
         Celzp0dwhWskwP2zOuHzw8RhOUFCmyPSCmEDrgWiI5PdlHKv/os2gaW5hBxoWulPyK2K
         AngW/gXjTdZPDzPDoOn7Ljz3xWTjlq70otKoVtYKYJ3HPdutZX+KL2j9gHaffEK7/22H
         Ie2CiPDK+3GuR67Rz6RSeBk2p5mbCG6+Js5I8WBupCu4jI1aapZFFiv2uS2SqXkN+b3j
         Bk+r/xMvHJcKzDWy9TbvaXwAp8v8PZmuWv7ba4HQgnXv1GE2mUzqlJCl/nmOgOk2fMpT
         N9zA==
X-Forwarded-Encrypted: i=1; AHgh+RqIMp/8Utp9T757vd7o7rfeNBMgajwl6uA0sGK79fcBKxM2eqCOUIGS78kc2N2Daj/E2rNrHOSVcBPFxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIUa6w5rgZPUKr1hKx4So9IN1dSqDIFJWGJGPGcwf6IDCBFgXv
	lDFA/vUtrDeFQg07ty0jW5ILU5JQvll05XFJejXsRMl1JZSXN95e1+TNZPXWmLfIwg8lhfD36gQ
	MoqacXYjgLeKEb4kML5032SkHKYPEAYqUpc2ViEX7NA==
X-Gm-Gg: AfdE7ckG3T55uErC+76Mu5cszp2LslqgKm6dLl6oFc+sjmnzN9mcARJd7KIZijbxBF8
	JXaGJjaLES9rP90gYJKtbPn1qrS21dadpsBtXDoWqtysdjN15LC745O2k++kSXUwTVbSvkm1ecO
	QHInmbyC9M74vD2836kU5lxBuqqHrLMjBlTqgNcDd9qpaUoMJL5DeKPmPHf0+2Aj6my2iWSw2KS
	H8gMTROlWpTcUez9yrHNkpy/AKpd64j66maoZp4ISkuTNAoM6F2ssE5+x6zZZG2
X-Received: by 2002:a05:6402:321e:b0:69a:a4bb:bfc0 with SMTP id
 4fb4d7f45d1cf-69e1987ff9bmr3583774a12.11.1784185172611; Wed, 15 Jul 2026
 23:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
 <20260713122903.9458-1-zhangzhanpeng.jasper@bytedance.com>
 <3591a185-d0b5-4cb0-a0d5-ae9608a4e244@arm.com> <CAJF2gTT7TPA+K+JgkvvUtb0x5BSzfox+s5rG8OtrP0QzPetHFw@mail.gmail.com>
 <20260715094305.2783-1-cp0613@linux.alibaba.com> <CANXhq0pvrXDJyE_dA-3z2tHnVndvxOm7kLRvnF9T+_r8cUHXug@mail.gmail.com>
 <CAJF2gTSr5dCma3xgPdFpe9RNUg+V2U1io8_0tJWuCuCPFhWyfA@mail.gmail.com>
In-Reply-To: <CAJF2gTSr5dCma3xgPdFpe9RNUg+V2U1io8_0tJWuCuCPFhWyfA@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 16 Jul 2026 14:59:19 +0800
X-Gm-Features: AUfX_mzOjVgZ4_5LQ1KYd2JxiHtKW7wtejphZ8aGSbkl3NN2noLsgUgBxrHcdCQ
Message-ID: <CANXhq0oVHw4JfGOrpUX=Hq6krm0myfCx7WhAG9rqZhuH0+D6kQ@mail.gmail.com>
Subject: Re: [PATCH v3] iommu/riscv: Use 32-bit MMIO accesses for 64-bit registers
To: Guo Ren <guoren@kernel.org>
Cc: Chen Pei <cp0613@linux.alibaba.com>, Robin Murphy <robin.murphy@arm.com>, 
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
	Tomasz Jeznach <tomasz.jeznach@linux.dev>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	David Laight <david.laight.linux@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	cuiyunhui@bytedance.com, yuanzhu@bytedance.com, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_235935_005987_9A294452 
X-CRM114-Status: GOOD (  43.96  )
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

T24gVGh1LCBKdWwgMTYsIDIwMjYgYXQgMTI6MDTigK9QTSBHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1bCAxNiwgMjAyNiBhdCAxMToxM+KAr0FNIFpvbmcg
TGkgPHpvbmcubGlAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBKdWwgMTUsIDIw
MjYgYXQgNTo0M+KAr1BNIENoZW4gUGVpIDxjcDA2MTNAbGludXguYWxpYmFiYS5jb20+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiBPbiBUdWUsIEp1bCAxNCwgMjAyNiBhdCAwOTo1NToxOVBNICswODAwLCBH
dW8gUmVuIHdyb3RlOgo+ID4gPiA+IFRoZSBzcGVjaWZpY2F0aW9uIGlzIGRlbGliZXJhdGVseSBw
cmVjaXNlLiBJdCB1c2VzICJtYXkiLCBub3QgInNoYWxsIgo+ID4gPiA+IG9yICJtdXN0Ii4gV2Ug
c2hvdWxkIG5vdCBpbnRyb2R1Y2Ugc3BlY3VsYXRpdmUgaW1wbGljYXRpb25zIHRoYXQgYnJlYWsK
PiA+ID4gPiB0aGUgc3BlYydzIGNvbnNpc3RlbmN5IG9uIFJWMzIuIFRoZSBzYWZlIGFuZCBwb3J0
YWJsZSBpbnRlcnByZXRhdGlvbgo+ID4gPiA+IGlzIHRoYXQgc29mdHdhcmUgaXMgZXhwbGljaXRs
eSBhbGxvd2VkIHRvIHVzZSAzMi1iaXQgYWNjZXNzZXMgZm9yCj4gPiA+ID4gdGhlc2UgcmVnaXN0
ZXJzIG9uIGFueSBzeXN0ZW0sIHdoaWNoIGlzIGV4YWN0bHkgd2hhdCB0aGlzIHBhdGNoIGRvZXMu
Cj4gPiA+Cj4gPiA+IFRoZSBSVjMyIGFyZ3VtZW50IGlzIHF1aXRlIGNvbXBlbGxpbmcuIFRoZSBS
SVNDLVYgSU9NTVUgaXMgYQo+ID4gPiBwbGF0Zm9ybS1sZXZlbCBJUCB0aGF0IG11c3Qgc2VydmUg
Ym90aCBSVjMyIGFuZCBSVjY0IHNvZnR3YXJlIHN0YWNrcy4KPiA+ID4gTWFuZGF0aW5nIDY0LWJp
dCBNTUlPIGFjY2Vzc2VzIHdvdWxkIGRpcmVjdGx5IGNvbmZsaWN0IHdpdGggUlYzMiwgd2hlcmUK
PiA+ID4gc3VjaCBhY2Nlc3NlcyBhcmUgaW1wb3NzaWJsZSDigJQgc28gYW55IGludGVycHJldGF0
aW9uIHRoYXQgdHVybnMgIm1heSBiZQo+ID4gPiBhY2Nlc3NlZCB1c2luZyBlaXRoZXIgYSAzMi1i
aXQgb3IgYSA2NC1iaXQgYWNjZXNzIiBpbnRvIGFuIGltcGxpY2l0Cj4gPiA+IGhhcmR3YXJlIHJl
cXVpcmVtZW50IGZvciA2NC1iaXQgYWNjZXNzZXMgYnJlYWtzIHRoZSBzcGVjJ3Mgb3duCj4gPiA+
IGNvbnNpc3RlbmN5IG9uIFJWMzIuCj4gPiA+Cj4gPiA+IFRoZSBSRkMgMjExOSBhcmd1bWVudCBp
cyBlcXVhbGx5IHN0cm9uZy4gSW4gUkZDIDIxMTkgdGVybXMsICJNQVkiIG1lYW5zCj4gPiA+IGFu
IGl0ZW0gaXMgdHJ1bHkgb3B0aW9uYWwg4oCUIGEgc3BlY2lmaWNhdGlvbiBzaG91bGQgZXhwcmVz
cyBvYmxpZ2F0aW9ucwo+ID4gPiB0aHJvdWdoIHRoZXNlIHdlbGwtZGVmaW5lZCBub3JtYXRpdmUg
a2V5d29yZHMsIG5vdCBsZWF2ZSB0aGVtIHRvIGJlCj4gPiA+IGluZmVycmVkIGZyb20gZXZlcnlk
YXktbGFuZ3VhZ2UgaW50dWl0aW9uLiBJZiB0aGUgc3BlYyBhdXRob3JzIGhhZAo+ID4gPiBpbnRl
bmRlZCB0byByZXF1aXJlIGhhcmR3YXJlIHRvIHN1cHBvcnQgNjQtYml0IGFjY2Vzc2VzLCB0aGV5
IHdvdWxkIGhhdmUKPiA+ID4gc2FpZCAibXVzdCIgb3IgInNoYWxsIi4KPiA+ID4KPiA+ID4gR2l2
ZW4gYm90aCBwb2ludHMsIHRyZWF0aW5nIDMyLWJpdCBNTUlPIGFjY2Vzc2VzIGFzIHRoZSBkZWZh
dWx0IGZvciB0aGUKPiA+ID4gUklTQy1WIElPTU1VIGRyaXZlciBpcyB0aGUgc2FmZSwgcG9ydGFi
bGUsIGFuZCBtb3JlIGluY2x1c2l2ZSBjaG9pY2U6IGl0Cj4gPiA+IGlzIGV4cGxpY2l0bHkgcGVy
bWl0dGVkIG9uIGV2ZXJ5IGNvbmZvcm1hbnQgaW1wbGVtZW50YXRpb24sIHdoZXJlYXMKPiA+ID4g
NjQtYml0IGFjY2VzcyBhdG9taWNpdHkgaXMgbGVmdCB1bnNwZWNpZmllZC4KPiA+ID4KPiA+ID4g
QWNrZWQtYnk6IENoZW4gUGVpIDxjcDA2MTNAbGludXguYWxpYmFiYS5jb20+Cj4gPiA+Cj4gPgo+
ID4gSXQgc2VlbXMgdGhhdCB3ZSBtaWdodCBub3QgbmVlZCB0byB3b3JyeSBhYm91dCBSVjMyLiBU
aGUKPiA+IGlvLTY0LW5vbmF0b21pYy1oaS1sby5oIGhlYWRlciB3aWxsIGF1dG9tYXRpY2FsbHkg
cmVwbGFjZSB3cml0ZXEvcmVhZHEKPiA+IHdpdGggaGlfbG9fd3JpdGVxL3JlYWRxIGluIFJWMzIg
YnVpbGQuIFRoZXJlZm9yZSwgcGVyaGFwcyB3ZSBjYW4ganVzdAo+ID4gZm9jdXMgb3VyIGRpc2N1
c3Npb24gb24gUlY2NDogd2hldGhlciB0aGUgZHJpdmVyIHNob3VsZCB1c2UKPiA+IHJlYWRxL3dy
aXRlcSB0byBhY2Nlc3MgNjQtYml0IHJlZ2lzdGVycyBvbiBSVjY0IHN5c3RlbXMuCj4KPiBUaGUg
UlYzMiBhcmd1bWVudCBoZXJlIGNvbmNlcm5zIHRoZSBpbnRlcnByZXRhdGlvbiBvZiB0aGUKPiBz
cGVjaWZpY2F0aW9uLCBub3QgdGhlIExpbnV4IGltcGxlbWVudGF0aW9uLiBTb21lIHBlb3BsZSBp
bnRlcnByZXQgdGhlCgpZZXMuIEhvd2V2ZXIsIHNpbmNlIHRoZXNlIHBhdGNoZXMgYXJlIGluZGVl
ZCB0cnlpbmcgdG8gbW9kaWZ5IHRoZQpMaW51eCBpbXBsZW1lbnRhdGlvbiwgd2UgbWlnaHQgbm90
IG5lZWQgdG8gd29ycnkgYWJvdXQgdGhpcyBoZXJlLiBPbgpSVjMyLCByZWdhcmRsZXNzIG9mIHdo
ZXRoZXIgdGhlIElPTU1VIGhhcmR3YXJlIHN1cHBvcnRzIG5hdGl2ZSA2NC1iaXQKTU1JTyBhY2Nl
c3NlcywgTGludXggYXV0b21hdGljYWxseSB1c2VzIHR3byA0LWJ5dGUgYWNjZXNzZXMgZm9yIDY0
LWJpdApyZWdpc3RlcnMuCgo+IHN0YXRlbWVudCwg4oCcUmVnaXN0ZXJzIHRoYXQgYXJlIDY0LWJp
dCB3aWRlIG1heSBiZSBhY2Nlc3NlZCB1c2luZwo+IGVpdGhlciBhIDMyLWJpdCBvciBhIDY0LWJp
dCBhY2Nlc3Ms4oCdIGFzIGltcG9zaW5nIGFuIG9ibGlnYXRpb24gb24KPiBldmVyeSBoYXJkd2Fy
ZSBpbXBsZW1lbnRhdGlvbiB0byBzdXBwb3J0IG5hdGl2ZSA2NC1iaXQgTU1JTyBhY2Nlc3Nlcy4K
PiBIb3dldmVyLCBSVjMyIHByb3ZpZGVzIGEgZGlyZWN0IGNvdW50ZXJleGFtcGxlIHRoYXQgdW5k
ZXJtaW5lcyB0aGUKPiB2YWxpZGl0eSBvZiB0aGlzIGludGVycHJldGF0aW9uLiBUaGUgSU9NTVUg
aXMgYSBwbGF0Zm9ybS1sZXZlbAo+IGNvbXBvbmVudCB0aGF0IG1heSBiZSBjb250cm9sbGVkIGVp
dGhlciBieSBhbiBSVjMyIE1DVSBydW5uaW5nIGFuIFJUT1MKPiBvciBieSBhbiBSVjY0IHByb2Nl
c3NvciBydW5uaW5nIExpbnV4LiBPbiBhbiBSVjMyIHBsYXRmb3JtLCBzb2Z0d2FyZQo+IGNhbiBh
Y2Nlc3MgYSA2NC1iaXQgcmVnaXN0ZXIgb25seSB0aHJvdWdoIG11bHRpcGxlIDMyLWJpdAo+IHRy
YW5zYWN0aW9ucy4gSG93LCB0aGVuLCBjYW4gdGhpcyBzZW50ZW5jZSBiZSBpbnRlcnByZXRlZCBh
cwo+IHVuY29uZGl0aW9uYWxseSByZXF1aXJpbmcgdGhlIGhhcmR3YXJlIHRvIHN1cHBvcnQgbmF0
aXZlIDY0LWJpdCBNTUlPCj4gYWNjZXNzZXM/Cj4KPiBNb3Jlb3ZlciwgZXZlbiBpZiDigJxtYXni
gJ0gaXMgaW50ZXJwcmV0ZWQgaW4gdGhlIFJGQyAyMTE5IHNlbnNlLCBNQVkgZG9lcwo+IG5vdCBp
bXBvc2UgYSBtYW5kYXRvcnkgcmVxdWlyZW1lbnQuIFdlIHNob3VsZCB0aGVyZWZvcmUgYXZvaWQK
PiBpbmZlcnJpbmcgaGFyZHdhcmUgb2JsaWdhdGlvbnMgZnJvbSBhc3N1bXB0aW9ucyBvciBpbXBs
aWNhdGlvbnMgdGhhdAo+IGFyZSBub3QgZXhwbGljaXRseSBzdGF0ZWQgaW4gdGhlIHNwZWNpZmlj
YXRpb24uCj4KPiA+Cj4gPiBBY3R1YWxseSwgaW4gbXkgcHJldmlvdXMgSU9NTVUgUE1VIHNlcmll
cywgSSBzaGFyZWQgYSBzaW1pbGFyIHZpZXcgdG8gUm9iaW4nczoKPiA+ICJSZXZpc2l0aW5nIHRo
ZSBzcGVjIHJlZ2FyZGluZyB0aGUgVU5TUEVDSUZJRUQgOC1ieXRlIGF0b21pYyBhY2Nlc3MsCj4g
PiB0aGlzIG1pZ2h0IGltcGx5IHRoYXQgdGhlIGhhcmR3YXJlIGl0c2VsZiB3aWxsIGhhbmRsZSB0
aGUgc3BsaXQgaW50bwo+ID4gdHdvIDQtYnl0ZSBhY2Nlc3NlcyBhbmQgaW50ZXJuYWxseSBtYW5h
Z2UgaXRzIG93biB0cmlnZ2VyIGxvZ2ljLgo+ID4gQmVjYXVzZSBvZiB0aGlzLCBmb3IgUlY2NCBz
eXN0ZW1zLCBzb2Z0d2FyZSBtaWdodCBzaW1wbHkgdXNlIHN0YW5kYXJkCj4gPiA4LWJ5dGUgd3Jp
dGVzIChlLmcuLCB3cml0ZXEpLiBEZWxlZ2F0aW5nIHRoZSBhY2Nlc3MgaGFuZGxpbmcgdG8gdGhl
Cj4gPiBoYXJkd2FyZSBpcyBsaWtlbHkgdGhlIGJlc3Qgd2F5IHRvIG1heGltaXplIGNvbXBhdGli
aWxpdHkgYWNyb3NzIGFsbAo+ID4gdmVuZG9yIGltcGxlbWVudGF0aW9ucy4iCj4gPiBNb3JlIGRl
dGFpbHM6IGh0dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwvbGludXgtcmlzY3Yv
MjAyNi1KdWx5LzA5NDA5OS5odG1sCj4gPgo+ID4gSSBhbHNvIGNoZWNrZWQgdGhlIEdpdEh1YiBk
aXNjdXNzaW9ucy4gVGhlIElPTU1VIHNwZWMgYXV0aG9yIHNlZW1zIHRvCj4gPiBoYXZlIGNsYXJp
ZmllZCB0aGF0IHRoZSBoYXJkd2FyZSBzaG91bGQgYmUgYWJsZSB0byBoYW5kbGUgbmF0dXJhbGx5
Cj4gPiBhbGlnbmVkIDY0LWJpdCBhY2Nlc3NlcyBmcm9tIHRoZSBzb2Z0d2FyZS4KPiA+IE1vcmUg
ZGV0YWlsczogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3YtaW9tbXUvaXNz
dWVzLzc2NQo+ID4KPiA+IEZyb20gbXkgcGVyc3BlY3RpdmUsIHNpbmNlIHRoZSBhdXRob3IgaGFz
IGFscmVhZHkgY2xhcmlmaWVkIHRoZQo+ID4gaW50ZW50LCBpdCBtaWdodCBiZSBiZXR0ZXIgZm9y
IHVzIHRvIGZvY3VzIG9uIGltcHJvdmluZyBhbmQgdXBkYXRpbmcKPiA+IHRoZSBzcGVjIHRvIG1h
a2UgaXQgY2xlYXJlci4gVGhpcyBjb3VsZCBiZSBhIGJldHRlciBhcHByb2FjaCB0aGFuCj4gPiBj
aGFuZ2luZyB0aGUgZHJpdmVyIHRvIGZpdCBhbiB1bmNsZWFyIHNwZWMuCj4gPiBXaGF0IGRvZXMg
ZXZlcnlvbmUgdGhpbmsgYWJvdXQgdGhpcz8gSWYgd2UgYWxsIGFncmVlLCBJIHdvdWxkIGJlIGhh
cHB5Cj4gPiB0byBzZW5kIGEgbmV3IHZlcnNpb24gb2YgdGhlIElPTU1VIFBNVSBzZXJpZXMgdXNp
bmcgNjQtYml0IGFjY2Vzc2VzCj4gPiBhZ2FpbiBmb3IgUlY2NC4KPgo+IFRoaXMgaXNzdWUgaGFz
IGFscmVhZHkgYmVjb21lIGhpZ2hseSBjb250ZW50aW91cyBhbmQgZGlyZWN0bHkgYWZmZWN0cwo+
IHJlYWwgaGFyZHdhcmUgaW1wbGVtZW50YXRpb25zLiBBbnkgYXR0ZW1wdCB0byByZXZpc2UgdGhl
IHNwZWNpZmljYXRpb24KPiBtdXN0IGZpcnN0IGNsYXJpZnkgd2hldGhlciB0aGUgY3VycmVudCB3
b3JkaW5nIGFjdHVhbGx5IG1hbmRhdGVzCj4gc3VwcG9ydCBmb3IgNjQtYml0IE1NSU8gYWNjZXNz
ZXMuIElmIHRoZSBzcGVjaWZpY2F0aW9uIGlzIHVuY2xlYXIgb24KPiB0aGlzIHBvaW50LCB0aGVu
IG5vIHN1Y2ggbWFuZGF0b3J5IHJlcXVpcmVtZW50IGNhbiByZWFzb25hYmx5IGJlCj4gaW1wb3Nl
ZCBvbiBleGlzdGluZyBoYXJkd2FyZSBpbXBsZW1lbnRhdGlvbnMuCj4KClllcywgSSBhZ3JlZS4g
VGhhdCBpcyB3aHkgSSB0aGluayB3ZSBtaWdodCBmb2N1cyBvbiBtYWtpbmcgdGhlIHNwZWMKY2xl
YXJlciBiZWZvcmUgY2hhbmdpbmcgdGhlIGRyaXZlci4gV291bGQgaXQgbWFrZSBzZW5zZSB0byBj
b250aW51ZQp0aGUgZGlzY3Vzc2lvbiBvbiBJT01NVSBzcGVjIEdpdEh1Yj8gUGVyaGFwcyByZW9w
ZW4gdGhlIHNhbWUgaXNzdWUgb3IKY3JlYXRlIGEgbmV3IG9uZS4KCj4gLS0KPiBCZXN0IFJlZ2Fy
ZHMKPiAgR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
