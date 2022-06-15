Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809C7C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 17:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A3PCO3vgmtt6RYyWaHnDXcJ2YopLbR39A3/I0ac/K2o=; b=IeAEIYPEBCSjUg
	JtCGjXjz1/YBDq/YjmiRnl+CErqLnM5SBDGR5CvrF8ca3WlH50g3p+myCmyGiMRnQ8Tr2lLfiRjl/
	PM9kHNbRqABW+9asbEX9/7IORPvmqdDKkNTcPTpZ4iG9Jek2iAWJpD2u0VOnqHAPAWwaLRiFJ9Kzt
	Ccgt1HHkgY8wrK1Kvfyyoh9B03ViUk7KvsyUVrmP3ndqkNRY41G8SD4IFd+qz1NG7eE/hQE3iINWN
	wJL80ELD5z3IrALTIm73RdnzqMOzQx7MVxh8gXPizH2uunQ1Zn/P/a6tkWG6IrG9/bRP3RTAZ1VuH
	XVJaterhsorrFw61Zp5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1WTC-00FZvq-Uf; Wed, 15 Jun 2022 17:06:18 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1WT9-00FZtf-BF
	for linux-riscv@lists.infradead.org; Wed, 15 Jun 2022 17:06:17 +0000
Received: by mail-pj1-x102d.google.com with SMTP id v11-20020a17090a4ecb00b001e2c5b837ccso2705900pjl.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jun 2022 10:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=X6U4Sh6IoO9AMkHFDosIKSFxwSjXcTB6jtV5NXDLAb0=;
        b=3ki+GZBjs6+mXREQJvHa1f5PQqgiDv7ehljSqU/MhC+F21bLvEiBlI8K8JqjbiZfkD
         wvVjwu8He46uOGtE6q5pnIhgrkvNfkgbtpGu4C5AZ1XQrWq5SVzqdqhLkz/3YuJ2mAlp
         4pJFs0LZI09mrDpi+Imh4OoF8RI/LtviN142qRiroWIkLJ0d8HbrDFKmnntsovtS8PCa
         ZgCjrmBlea3rit3a9Wt7VB19gZhLET0qljCsTtdA9ZNukdJw8I1ICCvLz5CMHxMfb/K/
         BGV+6UdT/5G7OjFD8BjOCTPUsNaP1jLKARED7SzUR8R070IR+447V+HSACaNdlVfZSDV
         z2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=X6U4Sh6IoO9AMkHFDosIKSFxwSjXcTB6jtV5NXDLAb0=;
        b=y20Rv43ZkwPSCei5x6wg1VKwCwn4p6WhfTTvo7udOTnt8DKEpYajpzuXB20XMXs7Ic
         gkFeU3piaXs82U32aLFqnY8m9E3cl99QtYbRNYaAXZkJqQFYBzYsXX8lnBKNXvR9+Xyj
         Q6FdxTSEmlQtvoLV85igmhPx9+c1PDRA7xVMxSMipVjrYcHaSY7B3WGbWWePpawaepLU
         vWb/7woFDQrjZspr8GMwShbT61kAD1PVerZWhMjRZ15Zzcw+i8m8fAF0GOooaS/IcoHT
         cTZVKxCYII0k5IXldMbT8gf9+Z2+o1uVswPkTG0QMj96qzA1NrosBUyRTAgwmgnTwPlz
         VqAA==
X-Gm-Message-State: AJIora/qfkKjZzUnq/gpg5dfAS/8njY+Z4SS8Co1JjOWPKnQhhzMTCsw
	/hD5LasW16C2WccIxMNh/Fweq35fRhgI3RYDtzX1Gw==
X-Google-Smtp-Source: AGRyM1v7wjpHYcPjOYJUGLotI15cStcftvoCDRlXC5dPpAgbZRa+6TH4dnkj6tfWcZw7cAU0HxfRwb/M5Ylp/wHYjY0=
X-Received: by 2002:a17:902:b407:b0:168:e554:33be with SMTP id
 x7-20020a170902b40700b00168e55433bemr361060plr.130.1655312771712; Wed, 15 Jun
 2022 10:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220524211954.1936117-1-daolu@rivosinc.com> <3113192.5fSG56mABF@diego>
In-Reply-To: <3113192.5fSG56mABF@diego>
From: Dao Lu <daolu@rivosinc.com>
Date: Wed, 15 Jun 2022 10:06:01 -0700
Message-ID: <CAKh7v-TZ3+t+_MRYQSxjbm3qJ6huHO4NBiv2OEMbXB0=4LeRNA@mail.gmail.com>
Subject: Re: [PATCH v2] arch/riscv: add Zihintpause support
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh@kernel.org>, 
	Alexandre Ghiti <alexandre.ghiti@canonical.com>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, 
	Tsukasa OI <research_trasio@irq.a4lg.com>, Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_100615_596472_0709BA91 
X-CRM114-Status: GOOD (  23.30  )
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

VGhhbmtzIEhlaWtvIGFuZCBQYWxtZXIsIHdpbGwgYWRkcmVzcyB0aGUgY29tbWVudHMsIHJlYmFz
ZSBhbmQgc2VuZCBhIHYzLgoKT24gVHVlLCBKdW4gMTQsIDIwMjIgYXQgOTo0NCBBTSBIZWlrbyBT
dMO8Ym5lciA8aGVpa29Ac250ZWNoLmRlPiB3cm90ZToKPgo+IEFtIERpZW5zdGFnLCAyNC4gTWFp
IDIwMjIsIDIzOjE5OjUwIENFU1Qgc2NocmllYiBEYW8gTHU6Cj4gPiBJbXBsZW1lbnQgc3VwcG9y
dCBmb3IgdGhlIFppSGludFBhdXNlIGV4dGVuc2lvbi4KPiA+Cj4gPiBUaGUgUEFVU0UgaW5zdHJ1
Y3Rpb24gaXMgYSBISU5UIHRoYXQgaW5kaWNhdGVzIHRoZSBjdXJyZW50IGhhcnTigJlzIHJhdGUg
b2YKPiA+IGluc3RydWN0aW9uIHJldGlyZW1lbnQgc2hvdWxkIGJlIHRlbXBvcmFyaWx5IHJlZHVj
ZWQgb3IgcGF1c2VkLgo+ID4KPiA+IFJldmlld2VkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29A
c250ZWNoLmRlPgo+ID4gVGVzdGVkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRl
Pgo+ID4gU2lnbmVkLW9mZi1ieTogRGFvIEx1IDxkYW9sdUByaXZvc2luYy5jb20+Cj4gPiAtLS0K
PiA+Cj4gPiB2MSAtPiB2MjoKPiA+ICBSZW1vdmUgdGhlIHVzYWdlIG9mIHN0YXRpYyBicmFuY2gs
IHVzZSBQQVVTRSBpZiB0b29sY2hhaW4gc3VwcG9ydHMgaXQKPiA+Cj4gPiAgYXJjaC9yaXNjdi9N
YWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwgNCArKysrCj4gPiAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9od2NhcC5oICAgICAgICAgIHwgMSArCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS92ZHNvL3Byb2Nlc3Nvci5oIHwgOCArKysrKysrLQo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2Nw
dS5jICAgICAgICAgICAgICAgICB8IDEgKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1
cmUuYyAgICAgICAgICB8IDIgKysKPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9NYWtlZmls
ZSBiL2FyY2gvcmlzY3YvTWFrZWZpbGUKPiA+IGluZGV4IDdkODExMDJjZmZkNC4uOTAwYThmZGEx
YTJkIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9NYWtlZmlsZQo+ID4gKysrIGIvYXJjaC9y
aXNjdi9NYWtlZmlsZQo+ID4gQEAgLTU2LDYgKzU2LDEwIEBAIHJpc2N2LW1hcmNoLSQoQ09ORklH
X1JJU0NWX0lTQV9DKSAgOj0gJChyaXNjdi1tYXJjaC15KWMKPiA+ICB0b29sY2hhaW4tbmVlZC16
aWNzci16aWZlbmNlaSA6PSAkKGNhbGwgY2Mtb3B0aW9uLXluLCAtbWFyY2g9JChyaXNjdi1tYXJj
aC15KV96aWNzcl96aWZlbmNlaSkKPiA+ICByaXNjdi1tYXJjaC0kKHRvb2xjaGFpbi1uZWVkLXpp
Y3NyLXppZmVuY2VpKSA6PSAkKHJpc2N2LW1hcmNoLXkpX3ppY3NyX3ppZmVuY2VpCj4gPgo+ID4g
KyMgQ2hlY2sgaWYgdGhlIHRvb2xjaGFpbiBzdXBwb3J0cyBaaWhpbnRwYXVzZSBleHRlbnNpb24K
PiA+ICt0b29sY2hhaW4tc3VwcG9ydHMtemloaW50cGF1c2UgOj0gJChjYWxsIGNjLW9wdGlvbi15
biwgLW1hcmNoPSQocmlzY3YtbWFyY2gteSlfemloaW50cGF1c2UpCj4gPiArcmlzY3YtbWFyY2gt
JCh0b29sY2hhaW4tc3VwcG9ydHMtemloaW50cGF1c2UpIDo9ICQocmlzY3YtbWFyY2gteSlfemlo
aW50cGF1c2UKPiA+ICsKPiA+ICBLQlVJTERfQ0ZMQUdTICs9IC1tYXJjaD0kKHN1YnN0IGZkLCwk
KHJpc2N2LW1hcmNoLXkpKQo+ID4gIEtCVUlMRF9BRkxBR1MgKz0gLW1hcmNoPSQocmlzY3YtbWFy
Y2gteSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5o
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gPiBpbmRleCAwNzM0ZTQyZjc0ZjIu
LmNhYTllZTU0NTliNCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdj
YXAuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gPiBAQCAtNTIs
NiArNTIsNyBAQCBleHRlcm4gdW5zaWduZWQgbG9uZyBlbGZfaHdjYXA7Cj4gPiAgICovCj4gPiAg
ZW51bSByaXNjdl9pc2FfZXh0X2lkIHsKPiA+ICAgICAgIFJJU0NWX0lTQV9FWFRfU1NDT0ZQTUYg
PSBSSVNDVl9JU0FfRVhUX0JBU0UsCj4KPiBzdnBibXQgZ290IG1lcmdlZCBtZWFud2hpbGUsIHNv
IHRoaXMgcGF0Y2ggbmVlZHMgYSByZWJhc2UKPiBvbnRvIDUuMTktcmMuCj4KPiBPbmUgbW9yZSBu
aXQgYmVsb3cKPgo+ID4gKyAgICAgUklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRSwKPiA+ICAgICAg
IFJJU0NWX0lTQV9FWFRfSURfTUFYID0gUklTQ1ZfSVNBX0VYVF9NQVgsCj4gPiAgfTsKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL3Byb2Nlc3Nvci5oIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL3Byb2Nlc3Nvci5oCj4gPiBpbmRleCAxMzQzODhj
YmFhYTEuLjRkZTkxMWEyNTA1MSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vdmRzby9wcm9jZXNzb3IuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNv
L3Byb2Nlc3Nvci5oCj4gPiBAQCAtOCw3ICs4LDEzIEBACj4gPgo+ID4gIHN0YXRpYyBpbmxpbmUg
dm9pZCBjcHVfcmVsYXgodm9pZCkKPiA+ICB7Cj4gPiAtI2lmZGVmIF9fcmlzY3ZfbXVsZGl2Cj4g
PiArI2lmZGVmIF9fcmlzY3ZfemloaW50cGF1c2UKPiA+ICsgICAgIC8qCj4gPiArICAgICAgKiBS
ZWR1Y2UgaW5zdHJ1Y3Rpb24gcmV0aXJlbWVudC4KPiA+ICsgICAgICAqIFRoaXMgYXNzdW1lcyB0
aGUgUEMgY2hhbmdlcy4KPiA+ICsgICAgICAqLwo+ID4gKyAgICAgX19hc21fXyBfX3ZvbGF0aWxl
X18gKCJwYXVzZSIpOwo+ID4gKyNlbGlmIF9fcmlzY3ZfbXVsZGl2Cj4gPiAgICAgICBpbnQgZHVt
bXk7Cj4gPiAgICAgICAvKiBJbiBsaWV1IG9mIGEgaGFsdCBpbnN0cnVjdGlvbiwgaW5kdWNlIGEg
bG9uZy1sYXRlbmN5IHN0YWxsLiAqLwo+ID4gICAgICAgX19hc21fXyBfX3ZvbGF0aWxlX18gKCJk
aXYgJTAsICUwLCB6ZXJvIiA6ICI9ciIgKGR1bW15KSk7Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvY3B1LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYwo+ID4gaW5kZXggY2Ni
NjE3NzkxZTU2Li44OWU1NjNlOWM0Y2MgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9jcHUuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMKPiA+IEBAIC04OCw2ICs4
OCw3IEBAIGludCByaXNjdl9vZl9wYXJlbnRfaGFydGlkKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9k
ZSkKPiA+ICAgKi8KPiA+ICBzdGF0aWMgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSBpc2FfZXh0
X2FycltdID0gewo+ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoc3Njb2ZwbWYsIFJJU0NW
X0lTQV9FWFRfU1NDT0ZQTUYpLAo+ID4gKyAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoemloaW50
cGF1c2UsIFJJU0NWX0lTQV9FWFRfWklISU5UUEFVU0UpLAo+ID4gICAgICAgX19SSVNDVl9JU0Ff
RVhUX0RBVEEoIiIsIFJJU0NWX0lTQV9FWFRfTUFYKSwKPiA+ICB9Owo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9j
cHVmZWF0dXJlLmMKPiA+IGluZGV4IDFiMmQ0MmQ3ZjU4OS4uMzdmZjA2NjgyYWU2IDEwMDY0NAo+
ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+IEBAIC0yNSw2ICsyNSw3IEBAIHN0YXRpYyBERUNM
QVJFX0JJVE1BUChyaXNjdl9pc2EsIFJJU0NWX0lTQV9FWFRfTUFYKSBfX3JlYWRfbW9zdGx5Owo+
ID4gIF9fcm9fYWZ0ZXJfaW5pdCBERUZJTkVfU1RBVElDX0tFWV9GQUxTRShjcHVfaHdjYXBfZnB1
KTsKPiA+ICAjZW5kaWYKPiA+Cj4gPiArCj4KPiB0aGlzIGlzIGFuIHVucmVsYXRlZCBjaGFuZ2Ug
YW5kIGFsc28gaXMgYWRkaW5nIGFuIHVubmVlZGVkIGV4dHJhIGVtcHR5IGxpbmUuCj4KPgo+IEhl
aWtvCj4KPiA+ICAvKioKPiA+ICAgKiByaXNjdl9pc2FfZXh0ZW5zaW9uX2Jhc2UoKSAtIEdldCBi
YXNlIGV4dGVuc2lvbiB3b3JkCj4gPiAgICoKPiA+IEBAIC0xOTIsNiArMTkzLDcgQEAgdm9pZCBf
X2luaXQgcmlzY3ZfZmlsbF9od2NhcCh2b2lkKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc2V0X2JpdCgqZXh0IC0gJ2EnLCB0aGlzX2lzYSk7Cj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgfSBlbHNlIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNFVF9JU0Ff
RVhUX01BUCgic3Njb2ZwbWYiLCBSSVNDVl9JU0FfRVhUX1NTQ09GUE1GKTsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFNFVF9JU0FfRVhUX01BUCgiemloaW50cGF1c2UiLCBSSVND
Vl9JU0FfRVhUX1pJSElOVFBBVVNFKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICB9Cj4gPiAg
I3VuZGVmIFNFVF9JU0FfRVhUX01BUAo+ID4gICAgICAgICAgICAgICB9Cj4gPgo+Cj4KPgo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
