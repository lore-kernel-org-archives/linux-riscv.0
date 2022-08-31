Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF934ECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Aug 2022 05:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ax3ObVfcZh2eDb9LM0JpTd/81RZZQl7Hl2xRzh8kTXk=; b=cCtMGAJ/YO63Ig
	lRS0g+cxmmbe9pbocDgq4shjkFCPbPbC8H85KKfkhGqy0TkZTEemWG7fKdr6zbWPKegasNw5SJwAz
	sgjtHVImyDpk/JzN/7cuWqvTyh6sM5b+lm4EVl7Z6cf42w0eYhHe7BiNLOREXyn2V69IuCkZozflj
	Ah0u5oCFNHYCgClgpZIz4ld9+xpkOe6WLwgw7cUc19/SL2NYIHqLGzDkIHd1GKECeHdLrbHcKasQ3
	H3gRhXkqQEQjhaXt/+ZmBfR3je94aInMVlcL92cUsP2IjTZfPT36wF/Y8i2K75aBCDkjUt0Ye79H3
	1GTpoSmU+WEzo7TyvEGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTGKS-0041JU-Sb; Wed, 31 Aug 2022 05:31:56 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTGKP-0041HZ-D0
	for linux-riscv@lists.infradead.org; Wed, 31 Aug 2022 05:31:55 +0000
Received: by mail-il1-x129.google.com with SMTP id l16so7072983ilj.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Aug 2022 22:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=fh0vOuRtsk5EMk5hSJ7o3ypJ/QfcxJywMLcP1lA6j2E=;
        b=eMN4Bk/NFV6UIkU8Vp7ulrQFxDm0NyzDKKEStiPXLPlYvMOe1MZkTBlfS4JHtIgesh
         b58cDxfEflTTGVOvUSm6eKSAdWlGTGYHMiXiaGbXbWqIPF456qqi/iiqO944sk+jlrHW
         La5/anZQdtDe20tCZ4G4pfSHYlk4D32qq8X+bRc3X888YFvFX8ipTH48Paot6+BzfDJX
         bYVX6NlT5X1CoB7CO9rg5u7vO/uEQWQ0f6MuEl+rlGguau083VmKl3ziIAqVfqyd/7sg
         GscrQcqhTCrJOZqFy3fBpThwLrq3BCTOPtQaTiLjuOWFiFv8JwR3xYhN/OnderBk9pRk
         Rlyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=fh0vOuRtsk5EMk5hSJ7o3ypJ/QfcxJywMLcP1lA6j2E=;
        b=NtxmBtEUvC7CIIvhusDIb8K59xaS3gzG5duBVE9wMrtyGMEZfmqNCu5PmFV9PsOqWb
         lMtVxnmq5Q8Og7CZ8ntFqk/J+1LHtPoipYcx8/C6yKiMBYJMkfRIElTzxXDdSUfZcZqh
         wQ0qTPIh2yc1frywf/EQe10jy2ke9K3b1i4CQxuVRC6sh5OTT+k3DqkErHuveiBIYw2j
         lcTMeCKkjQ/aLVU1Pp7b9HbQGKcLdAzQNp8QKYAIfyTYT6IKskf3EyoZ8N2fqHP6Io52
         X+siHtEDvXi7J1lWtYOc21zXZuE14sJgnbwwbIuXmo2cz1+Sb81YmrAMrKAOwrVWGyrB
         mFxg==
X-Gm-Message-State: ACgBeo0LZ63KbV//sVB/wcr8tzgtzbqcdZ941qFRGp4um1cRMCgsBlls
	JW9Jc/gXx2X19bemBoWvSGhLuNw+HQd9d3ehr2s=
X-Google-Smtp-Source: AA6agR6R1oxHvjEIIPpIv3iBzP+g44uQhnpPL5EhVCjLcdaAjBGQFKT3UqMsZSA5Bw9WI56ED7K4Pnz/cjpTtWKulbk=
X-Received: by 2002:a05:6e02:1886:b0:2eb:438a:c64c with SMTP id
 o6-20020a056e02188600b002eb438ac64cmr4214347ilu.282.1661923911611; Tue, 30
 Aug 2022 22:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220829062202.3287-1-zong.li@sifive.com> <20220829062202.3287-3-zong.li@sifive.com>
 <1a0da77e-8b26-a6aa-4af2-bf852470230a@microchip.com> <CANXhq0rHnsRP=Djin53Nc5n3aYY-=ALu7=F-1Y+-U3_L_ehG6g@mail.gmail.com>
 <e155125d-6a8a-aa28-b331-9c36d21305a5@microchip.com>
In-Reply-To: <e155125d-6a8a-aa28-b331-9c36d21305a5@microchip.com>
From: Zong Li <zongbox@gmail.com>
Date: Wed, 31 Aug 2022 13:31:39 +0800
Message-ID: <CA+ZOyahru+kws29VAxt8NFaRRYJzFPegaEdDEFhYxLtwSEds3g@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: sifive: l2 cache: Rename SiFive L2 cache to
 composible cache.
To: Conor.Dooley@microchip.com
Cc: zong.li@sifive.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	greentime.hu@sifive.com, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_223153_475412_79C9E6C1 
X-CRM114-Status: GOOD (  27.90  )
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

PENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tPiDmlrwgMjAyMuW5tDjmnIgzMOaXpSDpgLHkuowg
5LiL5Y2INDo0MuWvq+mBk++8mgo+Cj4gT24gMjkvMDgvMjAyMiAwOTo0MCwgWm9uZyBMaSB3cm90
ZToKPiA+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQo+ID4KPiA+IE9uIE1vbiwg
QXVnIDI5LCAyMDIyIGF0IDM6MDUgUE0gPENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90
ZToKPiA+Pgo+ID4+IEhleSBab25nLAo+ID4+Cj4gPj4gT24gMjkvMDgvMjAyMiAwNzoyMiwgWm9u
ZyBMaSB3cm90ZToKPiA+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlCj4gPj4+
Cj4gPj4+IEZyb206IEdyZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+Cj4gPj4+
Cj4gPj4+IFNpbmNlIGNvbXBvc2libGUgY2FjaGUgbWF5IGJlIEwzIGNhY2hlIGlmIHBMMiBjYWNo
ZSBleGlzdHMsIHdlIHNob3VsZCB1c2UKPiA+Pj4gaXRzIG9yaWdpbmFsIG5hbWUgY29tcG9zaWJs
ZSBjYWNoZSB0byBwcmV2ZW50IGNvbmZ1c2lvbi4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTog
R3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KPiA+Pj4gU2lnbmVkLW9mZi1i
eTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+Cj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3NvYy9zaWZpdmUvS2NvbmZpZyBiL2RyaXZlcnMvc29jL3NpZml2ZS9LY29uZmln
Cj4gPj4+IGluZGV4IDU4Y2Y4YzQwZDA4ZC4uM2Q2NWQyNzcxZjlhIDEwMDY0NAo+ID4+PiAtLS0g
YS9kcml2ZXJzL3NvYy9zaWZpdmUvS2NvbmZpZwo+ID4+PiArKysgYi9kcml2ZXJzL3NvYy9zaWZp
dmUvS2NvbmZpZwo+ID4+PiBAQCAtMiw5ICsyLDEwIEBACj4gPj4+Cj4gPj4+ICAgIGlmIFNPQ19T
SUZJVkUKPiA+Pj4KPiA+Pj4gLWNvbmZpZyBTSUZJVkVfTDIKPiA+Pj4gLSAgICAgICBib29sICJT
aWZpdmUgTDIgQ2FjaGUgY29udHJvbGxlciIKPiA+Pj4gK2NvbmZpZyBTSUZJVkVfQ0NBQ0hFCj4g
Pj4+ICsgICAgICAgYm9vbCAiU2lmaXZlIGNvbXBvc2FibGUgQ2FjaGUgY29udHJvbGxlciIKPiA+
Pj4gKyAgICAgICBkZWZhdWx0IHkKPiA+Pgo+ID4+IENoYW5naW5nIHRoaXMgdG8gZGVmYXVsdCBv
biBpcyBub3QgYSByZW5hbWUgb2YgdGhlIGZpbGUuLgo+ID4+IFRoaXMgc2hvdWxkIGJlIGluIGEg
ZGlmZmVyZW50IHBhdGNoLgo+ID4KPiA+IE9rYXksIGxldCBtZSBzZXBhcmF0ZSBpdCB0byBhbm90
aGVyIHBhdGNoLCBidXQgSSBndWVzcyB3ZSBjb3VsZCByZW1vdmUKPiA+IGl0LCBhbmQgZW5hYmxl
IGl0IGJ5IHVzZXIuIFdoYXQgaXMgeW91ciBwZXJzcGVjdGl2ZSBvbiBpdD8KPgo+IFBlcnNvbmFs
bHkgSSB3b3VsZCBsaWtlIHRvIGxlYXZlIHRoZSBkZWZhdWx0IHkgb3V0ICYgbGVhdmUgaXQgdXAK
PiB0byB0aGUgdXNlciAtIHRoZSBkcml2ZXIgaXMgbW9yZSBpbmZvcm1hdGlvbmFsIHRoYW4gYW55
dGhpbmcgZWxzZQo+IHNvIEkgZG9uJ3QgdGhpbmsgbWFraW5nIGl0IGRlZmF1bHQgdG8gb24gbWFr
ZXMgc2Vuc2UuCj4KCkFncmVlLCBsZXQgbWUgcmVtb3ZlIGl0IGluIHRoZSBuZXh0IHZlcnNpb24u
IFRoYW5rcwoKPgo+Cj4gPj4+ICsKPiA+Pj4gKyNkZWZpbmUgU0lGSVZFX0NDQUNIRV9ESVJFQ0NG
SVhfTE9XIDB4MTAwCj4gPj4+ICsjZGVmaW5lIFNJRklWRV9DQ0FDSEVfRElSRUNDRklYX0hJR0gg
MHgxMDQKPiA+Pj4gKyNkZWZpbmUgU0lGSVZFX0NDQUNIRV9ESVJFQ0NGSVhfQ09VTlQgMHgxMDgK
PiA+Pj4gKwo+ID4+PiArI2RlZmluZSBTSUZJVkVfQ0NBQ0hFX0RBVEVDQ0ZJWF9MT1cgMHgxNDAK
PiA+Pj4gKyNkZWZpbmUgU0lGSVZFX0NDQUNIRV9EQVRFQ0NGSVhfSElHSCAweDE0NAo+ID4+PiAr
I2RlZmluZSBTSUZJVkVfQ0NBQ0hFX0RBVEVDQ0ZJWF9DT1VOVCAweDE0OAo+ID4+PiArCj4gPj4+
ICsjZGVmaW5lIFNJRklWRV9DQ0FDSEVfREFURUNDRkFJTF9MT1cgMHgxNjAKPiA+Pj4gKyNkZWZp
bmUgU0lGSVZFX0NDQUNIRV9EQVRFQ0NGQUlMX0hJR0ggMHgxNjQKPiA+Pj4gKyNkZWZpbmUgU0lG
SVZFX0NDQUNIRV9EQVRFQ0NGQUlMX0NPVU5UIDB4MTY4Cj4gPj4+ICsKPiA+Pj4gKyNkZWZpbmUg
U0lGSVZFX0NDQUNIRV9DT05GSUcgMHgwMAo+ID4+PiArI2RlZmluZSBTSUZJVkVfQ0NBQ0hFX1dB
WUVOQUJMRSAweDA4Cj4gPj4+ICsjZGVmaW5lIFNJRklWRV9DQ0FDSEVfRUNDSU5KRUNURVJSIDB4
NDAKPiA+Pgo+ID4+ICAgRnJvbSB3aGF0IEkgY2FuIHNlZSwgeW91J3ZlIGFsc28gY2hhbmdlZCB0
aGVzZSBhcm91bmQgdG9vPwo+ID4+IFBsZWFzZSBnZW5lcmF0ZSB0aGUgcGF0Y2gncyBkaWZmIHNv
IHRoYXQgdGhlIHJlbmFtZSBpcyBkZXRlY3RlZCAmIHRoZQo+ID4+IGRpZmYgc2hvd3Mgb25seSB3
aGF0IGNoYW5nZWQgaW4gdGhlIGZpbGUuIFRoZSAtTSBvcHRpb24gaXMgd2hhdCB5b3UKPiA+PiBh
cmUgbG9va2luZyBmb3IuCj4gPj4KPiA+PiBJIGhhdmUgYSBjb3VwbGUgb3RoZXIgY29tbWVudHMg
dG8gbWFrZSBhYm91dCB3aGF0J3MgY2hhbmdlZCBoZXJlIG90aGVyLAo+ID4+IHRoYXRuIHRoZSBy
ZW5hbWUgYnV0IEkgd2lsbCBkbyBzbyBhZ2FpbnN0IGEgdjIgd2hlcmUgdGhlIGRpZmYgaXMgdXNh
YmxlLgo+ID4+Cj4gPgo+ID4gTGV0IG1lIHNlbnQgdGhlIHYyIHBhdGNoLCBhbmQgc2VwYXJhdGUg
dGhlIHJlbmFtZSBhbmQgZGlmZiBwYXJ0Cj4KPiBHcmVhdCwgdGhhbmtzLiBJJ2xsIHRha2UgYW5v
dGhlciBsb29rIGF0IGl0IHRoZW4uCj4KPiBDb25vci4KPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4g
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
