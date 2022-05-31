Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFF2C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 31 May 2022 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=D722F6eOsSOanvrfDBAF+tkKzVpS2HWSq7XjHEpNMHQ=; b=cOtwzBZINJm4m96HRWguXZtBht
	tGy7F+BKu1Sz76/gT0tJU3D76NgxZgRFPIprIjPIr5hFEv9AtAD3hrEIu54rjfL0PyeyLd+WWBYSu
	iMxg8HUrDBIp7h9YX+C2SDKkAOHucPxfsdp3s/s5JrQQhiz0Lt94tH4gpoiE5qypn81q0iece+yLw
	NAQ9OrSR5nOpI9K4DHj77JbQYJimSV1Ze0GkUfldlV2Cd1oDJZbhwz9W0Qc+9/seRAB8tiJPxRAWE
	yWgfBzLCCX4a7IaWd6dpF8Z235oO2NxotLdBSZZ/RAFmoueqtRdbeqhY2Ec12X3ez08LbaAQnlr3n
	Yds0W7hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw43r-00Bcid-LQ; Tue, 31 May 2022 15:45:35 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw43k-00BcgQ-3p
	for linux-riscv@lists.infradead.org; Tue, 31 May 2022 15:45:30 +0000
Received: by mail-pl1-x632.google.com with SMTP id s12so793526plp.0
        for <linux-riscv@lists.infradead.org>; Tue, 31 May 2022 08:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=+jxnpPySjns9WZXtYAeSufhkP2YRQS3HOSHZmGEDZ04=;
        b=5wcFHM/I1reVsJZKJ07bukcm1kBKagjnExNBI/xeoY/NTq2btN/4etr2hsEdw+VjFY
         njuEiKUEWBstz3Z6YWlCe0XhV8VUAn9rD3Z1Hc+vOQAGnsh6wv2MBchoWxLBXBJaE/qi
         aoo3RjfTDGBFAV2vbqK7AD515kHowYwxWU4UyOebqqWZLaY6QrpHLZDdfv3yDGcQM6Bx
         PP+VFt+dNd18lElH2Jv5oPozlWChl9bhqYU8fzaWwTGKDZY4eH3g+ZTGER3U9hER6/LM
         GEIV0308TxjluKDt9+lZ2/En5R+cg8sZ1Gt4rrv5PeoY2axRbQSl1I1+CuVO4Ik3RvRF
         AFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=+jxnpPySjns9WZXtYAeSufhkP2YRQS3HOSHZmGEDZ04=;
        b=32UYRyZ0TEcHJis1UBkYcBFujkVJ5DHGwUn8NnLKNXERhZKhP+IBAGFs6za8b3etto
         w2SyeDRJmuEjbWNEko2UnKgtanWt2PmXxEEepqCCiNdG1VsZUC1vmM3zr/PEt587aRdp
         e64MI8EUGU7gcmHCKIRymgVdbXGmgQA2HoCn82XZD5+WgE6ySuJEThQg4+3kCPsw9aXa
         LjPcU52w4DWFYjs0uSA7T6GVrAVK3d3R+gl4R1iSaIFWLoydbr9o/6OJlNDpR8r3bwf7
         zDp2fQcsU5DpMltG6yd3UGU003+2GjVBuR0uyuVvUcdJ02Ms05ekSLN0l6qhEWMYv0iE
         sxDw==
X-Gm-Message-State: AOAM5327r6ThasucRfOp+2yntA2577qIfmf3LZGmAbA7fVKq/2Ki52YF
	Pi4aWSBUaUu4j1K5aSyxPo42FQ==
X-Google-Smtp-Source: ABdhPJxpSEaugMAP2DG8fBB1Cjqi+Yfmbfthf/yUFY5TNAY8Ag43tjDRozyvkZZkXSXKmeZdbvfFyw==
X-Received: by 2002:a17:90b:4d90:b0:1e3:3025:66fe with SMTP id oj16-20020a17090b4d9000b001e3302566femr5672640pjb.145.1654011925129;
        Tue, 31 May 2022 08:45:25 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id q16-20020a170902eb9000b0015ea95948ebsm5318319plg.134.2022.05.31.08.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 08:45:24 -0700 (PDT)
Date: Tue, 31 May 2022 08:45:24 -0700 (PDT)
X-Google-Original-Date: Tue, 31 May 2022 08:45:23 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Prepare dropping week attribute from arch_kexec_apply_relocations[_add]
In-Reply-To: <20220531055803.prq5fj6lajzqiiiu@pengutronix.de>
CC: wangkefeng.wang@huawei.com, guoren@linux.alibaba.com, sunnanyong@huawei.com,
  jszhang@kernel.org, mick@ics.forth.gr, linux-riscv@lists.infradead.org,
  Stephen Rothwell <sfr@canb.auug.org.au>, alex@ghiti.fr, christophe.leroy@csgroup.eu, naveen.n.rao@linux.vnet.ibm.com,
  lizhengyu3@huawei.com, aou@eecs.berkeley.edu, liaochang1@huawei.com,
  Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Topel <bjorn.topel@gmail.com>, kexec@lists.infradead.org,
  linux-kernel@vger.kernel.org, penberg@kernel.org, ebiederm@xmission.com, kernel@pengutronix.de,
  akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: u.kleine-koenig@pengutronix.de
Message-ID: <mhng-29ba2a72-3ea8-4b27-8436-acde7976914f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_084528_406451_4EF98137 
X-CRM114-Status: GOOD (  44.41  )
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

T24gTW9uLCAzMCBNYXkgMjAyMiAyMjo1ODowMyBQRFQgKC0wNzAwKSwgdS5rbGVpbmUta29lbmln
QHBlbmd1dHJvbml4LmRlIHdyb3RlOgo+IE9uIE1vbiwgTWF5IDMwLCAyMDIyIGF0IDA0OjExOjI3
UE0gLTA3MDAsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+PiBPbiBNb24sIDMwIE1heSAyMDIyIDEy
OjQxOjMzIFBEVCAoLTA3MDApLCB1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGUgd3JvdGU6
Cj4+ID4gSGVsbG8sCj4+ID4gCj4+ID4gT24gTW9uLCBNYXkgMzAsIDIwMjIgYXQgMTE6NTg6MTZB
TSAtMDcwMCwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4+ID4gPiBPbiBNb24sIDMwIE1heSAyMDIy
IDAwOjQyOjAyIFBEVCAoLTA3MDApLCB1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGUgd3Jv
dGU6Cj4+ID4gPiA+IFdpdGhvdXQgdGhpcyBjaGFuZ2UgYXJjaC9yaXNjdi9rZXJuZWwvZWxmX2tl
eGVjLmMgZmFpbHMgdG8gY29tcGlsZSBvbmNlCj4+ID4gPiA+IGNvbW1pdCAyMzNjMWU2YzMxOWMg
KCJrZXhlY19maWxlOiBkcm9wIHdlYWsgYXR0cmlidXRlIGZyb20KPj4gPiA+ID4gYXJjaF9rZXhl
Y19hcHBseV9yZWxvY2F0aW9uc1tfYWRkXSIpIGlzIGFsc28gY29udGFpbmVkIGluIHRoZSB0cmVl
Lgo+PiA+ID4gPiBUaGlzIGN1cnJlbnRseSBoYXBwZW5zIGluIG5leHQtMjAyMjA1MjcuCj4+ID4g
PiA+ID4gUHJlcGFyZSB0aGUgUklTQy1WIHNpbWlsYXIgdG8gdGhlIHMzOTAgYWRhcHRpb24gZG9u
ZSBpbgo+PiA+ID4gMjMzYzFlNmMzMTljLgo+PiA+ID4gPiBUaGlzIGlzIHNhZmUgdG8gZG8gb24g
dG9wIG9mIHRoZSByaXNjdiBjaGFuZ2UgZXZlbiB3aXRob3V0IHRoZSBjaGFuZ2UgdG8KPj4gPiA+
ID4gYXJjaF9rZXhlY19hcHBseV9yZWxvY2F0aW9ucy4KPj4gPiA+ID4gPiBGaXhlczogODM4YjNl
Mjg0ODhmICgiUklTQy1WOiBMb2FkIHB1cmdhdG9yeSBpbiBrZXhlY19maWxlIikKPj4gPiA+ID4g
TG9va3MtZ29vZC10bzogbGlhb2NoYW5nIChBKSA8bGlhb2NoYW5nMUBodWF3ZWkuY29tPgo+PiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBl
bmd1dHJvbml4LmRlPgo+PiA+ID4gPiAtLS0KPj4gPiA+ID4gPiBPbiBNb24sIE1heSAzMCwgMjAy
MiBhdCAwOTo0MzoyNkFNICswODAwLCBsaWFvY2hhbmcgKEEpIHdyb3RlOgo+PiA+ID4gPiA+ID4g
SSBjYW4gY29uZmlybSB0aGF0IGRvaW5nCj4+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2tleGVjLmgKPj4gPiA+ID4gPiBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20va2V4ZWMuaAo+PiA+ID4gPiA+ID4gaW5kZXggMjA2MjE3YjIzMzAxLi5lZWUyNjBlOGFi
MzAgMTAwNjQ0Cj4+ID4gPiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2tleGVj
LmgKPj4gPiA+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va2V4ZWMuaAo+PiA+
ID4gPiA+ID4gQEAgLTU1LDYgKzU1LDEzIEBAIGV4dGVybiByaXNjdl9rZXhlY19tZXRob2Qgcmlz
Y3Zfa2V4ZWNfbm9yZWxvY2F0ZTsKPj4gPiA+ID4gPiA+ICA+ICAjaWZkZWYgQ09ORklHX0tFWEVD
X0ZJTEUKPj4gPiA+ID4gPiA+ICBleHRlcm4gY29uc3Qgc3RydWN0IGtleGVjX2ZpbGVfb3BzIGVs
Zl9rZXhlY19vcHM7Cj4+ID4gPiA+ID4gPiArCj4+ID4gPiA+ID4gPiArc3RydWN0IHB1cmdhdG9y
eV9pbmZvOwo+PiA+ID4gPiA+ID4gK2ludCBhcmNoX2tleGVjX2FwcGx5X3JlbG9jYXRpb25zX2Fk
ZChzdHJ1Y3QgcHVyZ2F0b3J5X2luZm8gKnBpLAo+PiA+ID4gPiA+ID4gKwkJCQkgICAgIEVsZl9T
aGRyICpzZWN0aW9uLAo+PiA+ID4gPiA+ID4gKwkJCQkgICAgIGNvbnN0IEVsZl9TaGRyICpyZWxz
ZWMsCj4+ID4gPiA+ID4gPiArCQkJCSAgICAgY29uc3QgRWxmX1NoZHIgKnN5bXRhYik7Cj4+ID4g
PiA+ID4gPiArI2RlZmluZSBhcmNoX2tleGVjX2FwcGx5X3JlbG9jYXRpb25zX2FkZCBhcmNoX2tl
eGVjX2FwcGx5X3JlbG9jYXRpb25zX2FkZAo+PiA+ID4gPiA+ID4gICNlbmRpZgo+PiA+ID4gPiA+
ID4gID4gICNlbmRpZgo+PiA+ID4gPiA+ID4gPiBMR1RNLCB5b3UgY291bGQgc2VuZCBhIGZpeHVw
IHBhdGNoIHRvIHJpc2N2LCB0aGFua3MuCj4+ID4gPiA+ID4gPiA+ID4gPiBvbiB0b3Agb2YgODM4
YjNlMjg0ODhmIHJlc3VsdHMgaW4gYSBjb21waWxhYmxlIHRyZWUuIEFuZAo+PiA+ID4gd2hlbgo+
PiA+ID4gPiA+IG1lcmdpbmcKPj4gPiA+ID4gPiA+IDIzM2MxZTZjMzE5YyBpbnRvIHRoaXMsIGl0
IGlzIHN0aWxsIGJ1aWxkaW5nLgo+PiA+ID4gPiA+ID4gPiBJJ20gbm90IGVub3VnaCBpbnRvIGtl
eGVjIChhbmQgcmlzY3YpIHRvIGp1ZGdlIGlmIHRoaXMgaXMKPj4gPiA+ID4gPiBzZW5zaWJsZSwg
b3IKPj4gPiA+ID4gPiA+IGNyZWF0ZSBhIHVzZWZ1bCBjb21taXQgbG9nIGJ1dCB0aGUgb2J2aW91
cyB3YXkgZm9yd2FyZCBpcyB0byBhcHBseSB0aGUKPj4gPiA+ID4gPiA+IGFib3ZlIHBhdGNoIHRv
IHRoZSByaXNjdiB0cmVlIGJlZm9yZSBpdCBoaXRzIExpbnVzJyB0cmVlLgo+PiA+ID4gPiA+IE9r
LCBoZXJlIGNvbWVzIGEgcGF0Y2ggd2l0aCBhIGdlbmVyaWMgY29tbWl0IGxvZy4KPj4gPiA+ID4g
PiBAcmlzY3YgcGVvcGxlOiBJZiB5b3UgcHJlZmVyLCBzcXVhc2ggaXQgaW50byA4MzhiM2UyODQ4
OGYuCj4+ID4gPiAKPj4gPiA+IFNvcnJ5LCBqdXN0IHNhdyB0aGlzIGFmdGVyIEkgc2VudCBteSB2
ZXJzaW9uIG9mIHRoZSBmaXguICBUaGV5J3JlIHRoZSBzYW1lLAo+PiA+ID4gYnV0IGRvIHlvdSBt
aW5kIHNlbmRpbmcgYSBmdWxsLW9uIHBhdGNoIHNvIEkgY2FuIG1lcmdlIGl0Pwo+PiA+IAo+PiA+
IFNvcnJ5LCBJIGRvbid0IHVuZGVyc3RhbmQgeW91ciByZXF1ZXN0LiBJIGZvdW5kCj4+ID4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMjA1MzAxODA0MDguMTYyMzktMS1w
YWxtZXJAcml2b3NpbmMuY29tLwo+PiA+IAo+PiA+IGJ1dCBJIGRvbid0IGtub3cgd2hhdCBhIGZ1
bGwtb24gcGF0Y2ggaXMgYW5kIHdoYXQgc3RvcHMgeW91IG1lcmdpbmcgbXkKPj4gPiBwYXRjaC4K
Pj4gPiAKPj4gPiBJcyBpdCB0aGF0IGl0J3MgaW4gcmVwbHkgdG8gYSBwYXRjaCBzZXJpZXMgYW5k
IGI0IGZhaWxzIHRvIGZldGNoIHRoZQo+PiA+IHJpZ2h0IHBhdGNoIGFuZCB5b3UgYXNrIHRvIHNl
bmQgaXQgaW4gYSBuZXcgdGhyZWFkPwo+PiAKPj4gWWEsIHdpdGggdGhlIHJlcGx5IGJpdHMgaW4g
dGhlcmUgbXkgbWFpbCBtZXJnZSAod2hpY2ggdW5mb3J0dW5hdGVseSBpc24ndAo+PiBiNCwgSSBo
YXZlbid0IGdvdHRlbiBhcm91bmQgdG8gY29udmVydGluZyB5ZXQpIGdvdCB0cmlwcGVkIHVwLiAg
SXQncyBraW5kIG9mCj4+IGVhc3kgdG8gZm9yIG1lIHRvIHNjcmV3IHNvbWV0aGluZyB1cCB0cnlp
bmcgdG8gcHVsbCBiaXRzIG91dCBvZiByZXBsaWVzIGFuZAo+PiBzdWNoLCBidXQgSSB0aGluayB0
aGlzIG9uZSB3YXMgcHJldHR5IHNpbXBsZSAobG9va3MgbGlrZSBtYXliZSBzb21lIFBHUCBvcgo+
PiBNSU1FIHRoaW5nIHdhcyB0aGUgaXNzdWUpLgo+PiAKPj4gSSBqdXN0IHB1dCA8aHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcGFsbWVyL2xpbnV4LmdpdC9j
b21taXQvP2g9Zm9yLW5leHQmaWQ9NzY5OWY3YWFjZjNlYmZlZTUxYzY3MGI2Zjc5NmIyNzk3ZjBm
NzQ4Nz4KPj4gb24gbXkgc3RhZ2luZyBicmFuY2gsIGl0IGxvb2tzIE9LIHRvIG1lIGJ1dCBMTUsg
aWYgdGhlcmUncyBhIHByb2JsZW0uCj4KPiB0aGVyZSBpcyBpbmRlZWQgYSBwcm9ibGVtLCBidXQg
Y2F1c2VkIGJ5IG1lOiBJZiB5b3UgYXJlIHJlYWR5IHRvIHJld3JpdGUKPiBpdCwgcGxlYXNlIGRv
IHMvd2Vlay93ZWFrLyBpbiB0aGUgc3ViamVjdCBsaW5lLiBPdGhlcndpc2UgbG9va3MgZ29vZCB0
bwo+IG1lLgoKQWgsIHNvcnJ5LCBJIG1pc3NlZCB0aGF0IHRvby4gIEkgd2FzIGhvcGluZyB0byBz
ZW5kIGEgUFIgdGhpcyBtb3JuaW5nLCAKSSdkIHVzdWFsbHkganVzdCByZXdyaXRlIGFuZCBkZWxh
eSB0aGlzIG9uZSBidXQgZ2l2ZW4gaXQncyBuZWNlc3NhcnkgdG8gCm1ha2UgdGhlIHBvc3QtbWVy
Z2UgYnVpbGQgd29yayBJJ20gZ29pbmcgdG8ganVzdCBzZW5kIGl0IHVwIHdpdGggdGhlIApzcGVs
bGluZyBlcnJvci4KCj4KPiBCZXN0IHJlZ2FyZHMgYW5kIHRoYW5rcywKPiBVd2UKPgo+IC0tIAo+
IFBlbmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8IFV3ZSBLbGVpbmUt
S8O2bmlnICAgICAgICAgICAgfAo+IEluZHVzdHJpYWwgTGludXggU29sdXRpb25zICAgICAgICAg
ICAgICAgICB8IGh0dHBzOi8vd3d3LnBlbmd1dHJvbml4LmRlLyB8CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
