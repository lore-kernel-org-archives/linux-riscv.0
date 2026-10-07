Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A85CA6002
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 08:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W3r1Ba8iSmhCLgD4DypVtDS9+8ReWOncMtE6CZ6i+7s=; b=0fpZ/8Avf+X8NK
	WyjH5pqI373PoYc+wc46r/7maihiBJdrPI4DpMthCQn4NePlDdvsgXO76jGDn02PoG4R8WZuP8pbC
	reEp/veNhScnJae1bCj51eOEI/yfNfuZWpXqcWed3kBXLTMq4ttDQVtAxogwW+/PoFxrDwaMjxHQE
	bYYjSYW5+vK1lUrjL4gpczfTv6Lyib4IJYgotau0SjyrupwmQlSAFjyKIZyKo91m8o5d3Sh7Bx/QQ
	7yxOH4fMntxVbRJrCnX8fydT7DwuKcfAokmlyXWzEhAaBRAMZvH1gNWx5HIa/dkLhCvh3WvU5ZvMg
	3wHMAWeUzJpL2hnDxvzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMgQ-00000001v5p-3Qc0;
	Wed, 07 Oct 2026 08:07:26 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMgO-00000001v5P-24nZ
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 08:07:25 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so35808235e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 01:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791360442; x=1791965242; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AzXD0+Ygu79Gr9EwwktD8S/rNRVdL4aJQW2+sWeGtc8=;
        b=JUBytujMxyfAkiOoHAxqofQ1MjX8RYMdVzticiEkdJbxGoNwQNtH6SYPuniCQ7mhm+
         pgcwFXEV/WhGbEWK5Ijsmt2zJI9JrO3JqAc9a76X7FFYEpvG9pA65ChGnJne2F7qZr0e
         uBdsxv0yfQCvkIYvwzWL/+Xrza3j8cv8cLtSHEpG+VQOijVnSL52RckeZNNprQq08bpE
         /469HZdFzfSx4XBUGKbxMDAgJq06vrtdDeHyO/hks1GB2ogySOS3t+Ip08sgZWhzD/uV
         rNAn0K57ej91cQ0vMvRqRSUOozjcdjUpxDPLQwbwLvbOv/TBmwVLMDFomu4VIPZR2gE9
         hkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791360442; x=1791965242;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AzXD0+Ygu79Gr9EwwktD8S/rNRVdL4aJQW2+sWeGtc8=;
        b=nZp1lLzIgr16HBZRPZHutDD2+IAevyY/5sr8oxHKaYa/5MZInbBlIS4bK2AiAd99Bf
         jEpQPo3BSFg4J4f7CjeVJbRhDcYJsoROMxgsHBq8hx89VerN5QonbQ+E4B15E+AO5LJO
         imxsHjoej8mevtNNERPcsvOQ8CfE/O5W4fRsH9hYC5439uAJiIG2sDxe0YUIN+zNhSVA
         JUFhJQ05sJu+gXKGWDxggLNIfKRxj5hqntxQG/imB4UpW+z+I7WvGUiBYTP6h4L2UNS7
         bgMYwWPvXSHtXpIE3aJz7fglQYENRTkNQEIhxisira6/WR9uAmxNXBa/NJ3YyM5bhBoG
         sncg==
X-Gm-Message-State: AFuF++nK2C0zeI++L9aXnMjvXVx28/ERqSfAEjCIkySJ4YKE5mkKFU0M
	htZhWXUpbZU9GTMxaiWOpz2KDKKxHwRVqjjj4SojM4kzHeSQnpZ1zI5N
X-Gm-Gg: AYBFou2hNDAG4uL54RWCY9mz7FysVJy662A+3lXaCl8MxIIAPuvhTIR/YPjsCVDnkmb
	AFFcbIII7Hp/p4BH1p8YO76tYNAAnLT1Xq3R+lGFOPTQ+q9mqma9WaT244AB+h9ippN4PWKKyHh
	1A0sW6n9WWIRh3RFKeEJDp/zJUtcIjmCgLaVYGqo98U3tvwxQ07B+us+Uhbra5CGCwx5teBVv3z
	HROzoWY3Ggizwxod72+0TwAIOmqY9yB73dajZqyeeUmPXntBMU/EouTAa9y5K4Yf41LlpTerbSZ
	dXz8syZOMFTBBU0VJLrdRYkBnn6VtDkU78lS7fGZnHJM9FqTlnarQCu/i6iFzthPRXE/vah7jMc
	Lr7WCpbjNhIU74IvFyVFfzbG8jMommmY/Zg6yrWWa9TAk9xAQW2Q4yqMREBMWRHOWLsz7P0tQGa
	DdTpavZwabMLpc/JZKR3tC6E6LzqdB6C+6gpN8r3D1I+NZdGDaIxj4U75c+QP/xVfGVc0VeBV8U
	mG593R/VGmLvoOdFWPd5hj8UaO8iv2nD3wwYP+PCnV1K5vBs1cE
X-Received: by 2002:a05:600c:4e13:b0:49d:34:420d with SMTP id 5b1f17b1804b1-4a180648e9dmr17951005e9.20.1791360442336;
        Wed, 07 Oct 2026 01:07:22 -0700 (PDT)
Received: from blinky (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f4482c4sm87004535e9.0.2026.10.07.01.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:07:21 -0700 (PDT)
Date: Wed, 7 Oct 2026 01:07:20 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
	Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH 5/6] riscv: hwprobe: Report XTheadVector only when
 available
Message-ID: <asX9uMyiJMAzjIFF@blinky>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-6-radim.krcmar@oss.qualcomm.com>
 <179133089395.137225.16486951642128892687.b4-review@b4>
 <DLYG41IFMP2J.12CCFGMZGC4ZQ@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DLYG41IFMP2J.12CCFGMZGC4ZQ@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_010724_554992_CD750549 
X-CRM114-Status: GOOD (  22.29  )
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

T24gV2VkLCBPY3QgMDcsIDIwMjYgYXQgMDk6NTk6MzBBTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+IDIwMjYtMTAtMDZUMTY6NTQ6NTMtMDc6MDAsIENoYXJsaWUgSmVua2lucyA8dGhl
Y2hhcmxlc2plbmtpbnNAZ21haWwuY29tPjoKPiA+PiBVc2VyLW1vZGUgdXNlIG9mIFhUaGVhZFZl
Y3RvciByZXF1aXJlcyBub24tT2ZmIHNzdGF0dXMuVlMsIHdoaWNoIHdlIHNldAo+ID4+IG9ubHkg
d2hlbiBoYXNfeHRoZWFkdmVjdG9yKCkgKENPTkZJR19SSVNDVl9JU0FfWFRIRUFEVkVDVE9SIGFu
ZAo+ID4+IFhUaGVhZFZlY3RvciBvbiBhbGwgaGFydHMpLiAgWFRoZWFkVmVjdG9yIGFsc28gYnVu
ZGxlcyBvcGVyYXRpb25zIHdpdGgKPiA+PiBmbG9hdGluZyBzdGF0ZSwgd2hpY2ggYWRkaXRpb25h
bGx5IHJlcXVpcmVzIG5vbi1PZmYgc3N0YXR1cy5GUyBhbmQgaGVuY2UKPiA+PiBoYXNfZnB1KCku
ICBod3Byb2JlIHJlcG9ydHMgWFRoZWFkVmVjdG9yIGZyb20gdGhlIHBlci1oYXJ0IHZlbmRvciBJ
U0EKPiA+PiBiaXRtYXBzIGFsb25lLCBzbyBpdCBjYW4gYWR2ZXJ0aXNlIGFuIGV4dGVuc2lvbiB0
aGF0IGlzIGFsd2F5cyBkaXNhYmxlZAo+ID4+IGluIHVzZXItbW9kZS4KPiA+PiAKPiA+PiBSZXBv
cnQgY29ycmVjdCBlbnZpcm9ubWVudCB0byB1c2VyLW1vZGUuCj4gPj4gCj4gPj4gRml4ZXM6IGE1
ZWE1M2RhNjVjNSAoInJpc2N2OiBod3Byb2JlOiBBZGQgdGhlYWQgdmVuZG9yIGV4dGVuc2lvbiBw
cm9iaW5nIikKPiA+PiBTaWduZWQtb2ZmLWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJhZGltLmtyY21h
ckBvc3MucXVhbGNvbW0uY29tPgo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2Vy
bmVsL3ZlbmRvcl9leHRlbnNpb25zL3RoZWFkX2h3cHJvYmUuYyBiL2FyY2gvcmlzY3Yva2VybmVs
L3ZlbmRvcl9leHRlbnNpb25zL3RoZWFkX2h3cHJvYmUuYwo+ID4+IGluZGV4IDJlYmEzNDAxMTc4
Ni4uZjA3YWExYzhhY2FjIDEwMDY0NAo+ID4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3ZlbmRv
cl9leHRlbnNpb25zL3RoZWFkX2h3cHJvYmUuYwo+ID4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L3ZlbmRvcl9leHRlbnNpb25zL3RoZWFkX2h3cHJvYmUuYwo+ID4+IEBAIC0xLDUgKzEsNyBAQAo+
ID4+ICAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cj4gPj4gIAo+ID4+
ICsjaW5jbHVkZSA8YXNtL3N3aXRjaF90by5oPgo+ID4+ICsjaW5jbHVkZSA8YXNtL3ZlY3Rvci5o
Pgo+ID4+ICAjaW5jbHVkZSA8YXNtL3ZlbmRvcl9leHRlbnNpb25zL3RoZWFkLmg+Cj4gPj4gICNp
bmNsdWRlIDxhc20vdmVuZG9yX2V4dGVuc2lvbnMvdGhlYWRfaHdwcm9iZS5oPgo+ID4+ICAjaW5j
bHVkZSA8YXNtL3ZlbmRvcl9leHRlbnNpb25zL3ZlbmRvcl9od3Byb2JlLmg+Cj4gPj4gQEAgLTE0
LDYgKzE2LDcgQEAgdm9pZCBod3Byb2JlX2lzYV92ZW5kb3JfZXh0X3RoZWFkXzAoc3RydWN0IHJp
c2N2X2h3cHJvYmUgKnBhaXIsIGNvbnN0IHN0cnVjdCBjcHUKPiA+PiAgewo+ID4+ICAJVkVORE9S
X0VYVEVOU0lPTl9TVVBQT1JURUQocGFpciwgY3B1cywKPiA+PiAgCQkJCSAgIHJpc2N2X2lzYV92
ZW5kb3JfZXh0X2xpc3RfdGhlYWQucGVyX2hhcnRfaXNhX2JpdG1hcCwgewo+ID4+IC0JCVZFTkRP
Ul9FWFRfS0VZKFhUSEVBRFZFQ1RPUik7Cj4gPj4gKwkJaWYgKGhhc194dGhlYWR2ZWN0b3IoKSAm
JiBoYXNfZnB1KCkpCj4gPgo+ID4geHRoZWFkdmVjdG9yIGlzIGFsc28gZ2F0ZWQgb24gRlBVPXkg
c28gdGhpcyBpcyBhIHJlZHVudGFudCBhZGRpdGlvbi4gSXMKPiA+IGl0IHdvcnRod2hpbGUgdG8g
bWFrZSB0aGlzIGNoYW5nZT8KPiAKPiBXaXRoIENPTkZJR19GUFU9eSwgaGFzX2ZwdSgpIGlzIHNl
dCB0byBmYWxzZSB3aGVuIGEgc2luZ2xlIGhhcnQgZG9lc24ndAo+IGhhdmUgdGhlIEQsIGFuZCBo
YXNfeHRoZWFkdmVjdG9yKCkgY291bGQgc3RpbGwgYmUgdHJ1ZS4KCkFoaCB0aGF0J3MgYSBnb29k
IHBvaW50LgoKPiAKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIElzCj4gPiBpdCB3b3J0aHdoaWxlIHRvIG1ha2Ug
dGhpcyBjaGFuZ2U/Cj4gCj4gSSB0aGluayB0aGF0IGl0J3Mgc2Vuc2libGUgdG8gbWltaWMgdGhl
IHZhbGlkYXRpb24gd2UgZG8gZm9yIHRoZQo+IG5vbi12ZW5kb3IgZXh0ZW5zaW9uLCBidXQgdXNl
cnMgb2YgdmVuZG9yIGV4dGVuc2lvbnMgbGlrZWx5IGFscmVhZHkgaGF2ZQo+IHRvIGdvIG91dCBv
ZiB0aGVpciB3YXkgdG8gdXRpbGl6ZSB0aGVtLCBzbyB0aGV5IGNhbiBkbyB0aGUgc2FuaXR5IGNo
ZWNrcwo+IHRvby4uLiBJIGNhbiBkcm9wIHRoZSBsYXN0IHR3byBwYXRjaGVzIGluIHYyLgoKSSBk
b24ndCBrbm93LCBpdCBzZWVtcyBiZXR0ZXIgdG8ga2VlcCBzdGFuZGFyZGl6YXRpb24gaWYgcG9z
c2libGUgYW5kCmxlYXZlIHRoZSBjaGVjayBpbiBoZXJlIHRvIG1pbWljIHRoZSBzdGFuZGFyZCBl
eHRlbnNpb25zPwoKLSBDaGFybGllCgo+IAo+IFRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
