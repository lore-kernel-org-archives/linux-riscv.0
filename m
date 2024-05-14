Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB17C25B75
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 09:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QX3SrpfxAyUZAZ4t1NLc6Mr7EZfeESeCg3NYYuyIrGg=; b=vMknd7lxDRjQtm
	Dz4O9axvIDMEl+xi+kZuPDD7K3KhfHbXouhuoOGyBuMfTcUPgcovQBMdiEqo0Scuftq+XEqEV9D0z
	DRmOJErl1J3d/wSus8hCvT+Xfz6bCiHS/+jvHrQtoy/zeY5UlrxdFDZkfNw/iIlVEcJi94q5SAWwo
	3Rl0N3IXwmMEUQR6zb59zJsxwWkJ0IaWqRa6ewedSXjJJsqTfhL69rotxyW7AuUZh0aPTpNrPjLes
	j0SHj6IO9LuQgLcUD8b+WqzL3+uKOAuy5DnJ/nRcbM9l7aBhmlA2UAm5iL0XNVBgCEQGXTLNRpOei
	q1y6Sy5M4KGEt+9U8eaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ooC-0000000FVQI-2qGR;
	Tue, 14 May 2024 09:50:56 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6oo8-0000000FVOk-2v0d
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 09:50:55 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6f0f08916c0so1446375a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 02:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715680246; x=1716285046; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wKHm6XT5EYm6vl/df7llbv2ZznYvQVbeTCwxvcThXU=;
        b=Cfg7awRKVCcdRnuQct5hWfXLVpp+TCkbYdow5fHVr4OwY4U85PKkrE3peh602yIDpA
         dHl0IyZ1fmVUsPSCwrcIwTLatOkIdF7rLiPl9AjD6MMg4ofXc8pP2mop1HIQWeTC5NZA
         IE1n8zqYYXSP1PAgnF0bTRP2tlYO/LwXLnqIYrdOjeoQyrKnTN73xWXkXOPwTvXyp36N
         BH8iPfHrmsXmZLOp4edM9R51AAPWDGI+GhhyQNUYOSsohzwmNx13gHxY304MQ4Yr8CSd
         hAQL52LqXhIzXfZ22sSHB/QTEju5FrpSYyWgtdfvJfaX6Fzg4zmx+YG/0rGwmXItR2q8
         dMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715680246; x=1716285046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wKHm6XT5EYm6vl/df7llbv2ZznYvQVbeTCwxvcThXU=;
        b=Prc9n3NpnbneCtIawDCdLTouv8RA+yoem5NGcLIdyNIHrSCIgXxxOPHnrXwlXUUOT7
         eiMsky1YITE/1d4YfKuwiaE31QohBn8EXmsUfaamq9KZNEPkW4EPvaE7+J7Vu7eSVa6s
         bPH2NKD5Jw1tl8ilthSDCekvTma1R5OvurS+0EkDrCCn7s2OQb6EbQW5TnEFWjB59OBt
         vjB26r1sNgrqjo6V1aCJwUk9edUuEfjzzaDRFYSkN+CWnpzioyaMK6M7p6fO7wKCtSYi
         ixquRGh7UkhuOKIGS7/7T8EuIp9uhcHLpJiJ86u8aCsSbVnsR7MUOD/TU9W9eDy5KLhj
         UPng==
X-Forwarded-Encrypted: i=1; AJvYcCX8pDckDEQJClw/lhCaGZ0aUlOcYVfJxbhdbZEk9keipUza7lbv7xMx7zwt+nfp7hDWrxrGeJnZlzmOCzHfMTL1P0woH3BNap1RmBm+EMTD
X-Gm-Message-State: AOJu0YxqjKBdRSqykbtewKvttomn0bnFwdkVC66bDhhKMMRw07+Stu13
	qs5wEAsFxgolMG7uOhXrbk3QcquPLiGhANwyJddgU5uvtUDNkNmLZswBuWJBXrDen1cfAuRsP1/
	QT9q6d8lNNukNJ8w2FBzZqVm02uco3akvzNXgow==
X-Google-Smtp-Source: AGHT+IFZlGka49AMpZnqeQG/0/xoWz38eoC8WUNBIFRNqyMEzju7A9//UVdvie1NQ5rKtQlwZbm11YMHm3N4CSBDIj8=
X-Received: by 2002:a05:6808:3099:b0:3c7:21b4:6e1 with SMTP id
 5614622812f47-3c996c688b8mr6596851b6e.2.1715680244711; Tue, 14 May 2024
 02:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240226065113.1690534-1-nick.hu@sifive.com> <CAPDyKFph3WsZMmALnzBQKE4S_80Ji5h386Wi0vHda37QUsjMtg@mail.gmail.com>
 <CAKddAkDcdaXKzpcKN=LCCx9S4Trv+joLX2s=nyhzaRtM5HorqA@mail.gmail.com>
 <CAKddAkC6N=Cfo0z+F8herKTuJzCyt_MA0vWNbLCr6CbQnj0y8g@mail.gmail.com> <CAPDyKFr_M0NDH0gaunBpybnALOFfz4LpX4_JW2GCUxjwGzdZsg@mail.gmail.com>
In-Reply-To: <CAPDyKFr_M0NDH0gaunBpybnALOFfz4LpX4_JW2GCUxjwGzdZsg@mail.gmail.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Tue, 14 May 2024 17:50:34 +0800
Message-ID: <CAKddAkC5CRX+ZTh=MgzPYU72SY13+AQYhknhV_CC+=XX9=DKyg@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: riscv-sbi: Add cluster_pm_enter()/exit()
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: palmer@dabbelt.com, anup@brainfault.org, rafael@kernel.org, 
	daniel.lezcano@linaro.org, paul.walmsley@sifive.com, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zong.li@sifive.com, Cyan Yang <cyan.yang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_025052_811665_03070855 
X-CRM114-Status: GOOD (  37.00  )
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

SGkgVWxmLAoKVGhhbmsgeW91IGZvciB5b3VyIHZhbHVhYmxlIHN1Z2dlc3Rpb24uCkkgc2luY2Vy
ZWx5IGFwb2xvZ2l6ZSBmb3IgdGhlIGRlbGF5IGluIHJlc3BvbmRpbmcgdG8geW91ciBtZXNzYWdl
LiBXZQpoYXZlIGRpbGlnZW50bHkgd29ya2VkIG9uIGV4cGVyaW1lbnRpbmcgd2l0aCB0aGUgc3Vn
Z2VzdGlvbiB5b3UKcHJvdmlkZWQuCgpBcyBwZXIgeW91ciByZWNvbW1lbmRhdGlvbiwgd2UgaGF2
ZSBpbmNvcnBvcmF0ZWQgdGhlICJwb3dlci1kb21haW5zPTw+CnByb3BlcnR5IiBpbnRvIHRoZSBj
b25zdW1lcidzIG5vZGUsIHJlc3VsdGluZyBpbiBtb2RpZmljYXRpb25zIHRvIHRoZQpEVFMgYXMg
aWxsdXN0cmF0ZWQgYmVsb3c6CgpjcHVzIHsKICAgIC4uLgogICAgIGRvbWFpbi1pZGxlLXN0YXRl
cyB7CiAgICAgICAgICAgQ0xVU1RFUl9TTEVFUDpjbHVzdGVyLXNsZWVwIHsKICAgICAgICAgICAg
ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJkb21haW4taWRsZS1zdGF0ZSI7CiAgICAgICAgICAg
ICAgICAgICAgICAgIC4uLgogICAgICAgICAgICB9CiAgICAgfQogICAgIHBvd2VyLWRvbWFpbnMg
ewogICAgICAgICAgICAuLi4KICAgICAgICAgICAgLi4uCiAgICAgICAgICAgIENMVVNURVJfUEQ6
IGNsdXN0ZXJwZCB7CiAgICAgICAgICAgICAgICAgICAgZG9tYWluLWlkbGUtc3RhdGVzID0gPCZD
TFVTVEVSX1NMRUVQPjsKICAgICAgICAgICAgfTsKICAgICB9Cn0Kc29jIHsKICAgICAgZGV2aWNl
QUB4eHh7CiAgICAgICAgICAgICAuLi4KICAgICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JkNM
VVNURVJfUEQ+OwogICAgICAgICAgICAgLi4uCiAgICAgIH0KfQoKSG93ZXZlciwgdGhpcyBhZGp1
c3RtZW50IGhhcyBsZWQgdG8gYW4gaXNzdWUgd2hlcmUgdGhlIHByb2JlIGZvcgonZGV2aWNlQScg
aXMgZGVmZXJyZWQgYnkgJ2RldmljZV9saW5rc19jaGVja19zdXBwbGllcnMoKScgd2l0aGluCidy
ZWFsbHlfcHJvYmUoKScuIEluIGFuIGF0dGVtcHQgdG8gbWl0aWdhdGUgdGhpcyBpc3N1ZSwgd2UK
ZXhwZXJpbWVudGVkIHdpdGggYSB3b3JrYXJvdW5kIGJ5IGFkZGluZyB0aGUgYXR0cmlidXRlCiJz
dGF0dXM9ImRpc2FibGVkIiIgdG8gdGhlICdDTFVTVEVSX1BEJyBub2RlLiBUaGlzIGFjdGlvbiBh
aW1lZCB0bwpwcmV2ZW50IHRoZSBjcmVhdGlvbiBvZiBhIGRldmljZSBsaW5rIGJldHdlZW4gJ2Rl
dmljZUEnIGFuZAonQ0xVU1RFUl9QRCcuIE5ldmVydGhlbGVzcywgd2UgcmVtYWluIHVuY2VydGFp
biBhYm91dCB0aGUKYXBwcm9wcmlhdGVuZXNzIG9mIHRoaXMgc29sdXRpb24uCgpEbyB5b3UgaGF2
ZSBzdWdnZXN0aW9ucyBvbiBob3cgdG8gZWZmZWN0aXZlbHkgYWRkcmVzcyB0aGlzIGlzc3VlPwoK
UmVnYXJkcywKTmljawoKT24gVHVlLCBBcHIgMzAsIDIwMjQgYXQgNDoxM+KAr1BNIFVsZiBIYW5z
c29uIDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgMjkgQXByIDIw
MjQgYXQgMTg6MjYsIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4g
T24gVHVlLCBBcHIgMzAsIDIwMjQgYXQgMTI6MjLigK9BTSBOaWNrIEh1IDxuaWNrLmh1QHNpZml2
ZS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBIaSBVbGYKPiA+ID4KPiA+ID4gT24gTW9uLCBBcHIg
MjksIDIwMjQgYXQgMTA6MzLigK9QTSBVbGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJvLm9y
Zz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBNb24sIDI2IEZlYiAyMDI0IGF0IDA3OjUxLCBO
aWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IFdo
ZW4gdGhlIGNwdXMgaW4gdGhlIHNhbWUgY2x1c3RlciBhcmUgYWxsIGluIHRoZSBpZGxlIHN0YXRl
LCB0aGUga2VybmVsCj4gPiA+ID4gPiBtaWdodCBwdXQgdGhlIGNsdXN0ZXIgaW50byBhIGRlZXBl
ciBsb3cgcG93ZXIgc3RhdGUuIENhbGwgdGhlCj4gPiA+ID4gPiBjbHVzdGVyX3BtX2VudGVyKCkg
YmVmb3JlIGVudGVyaW5nIHRoZSBsb3cgcG93ZXIgc3RhdGUgYW5kIGNhbGwgdGhlCj4gPiA+ID4g
PiBjbHVzdGVyX3BtX2V4aXQoKSBhZnRlciB0aGUgY2x1c3RlciB3b2tlbiB1cC4KPiA+ID4gPiA+
Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+Cj4g
PiA+ID4KPiA+ID4gPiBJIHdhcyBub3QgY2NlZCB0aGlzIHBhdGNoLCBidXQgbm90aWNlZCB0aGF0
IHRoaXMgcGF0Y2ggZ290IHF1ZXVlZCB1cAo+ID4gPiA+IHJlY2VudGx5LiBTb3JyeSBmb3Igbm90
IG5vdGljaW5nIGVhcmxpZXIuCj4gPiA+ID4KPiA+ID4gPiBJZiBub3QgdG9vIGxhdGUsIGNhbiB5
b3UgcGxlYXNlIGRyb3AvcmV2ZXJ0IGl0PyBXZSBzaG91bGQgcmVhbGx5IG1vdmUKPiA+ID4gPiBh
d2F5IGZyb20gdGhlIENQVSBjbHVzdGVyIG5vdGlmaWVycy4gU2VlIG1vcmUgaW5mb3JtYXRpb24g
YmVsb3cuCj4gPiA+ID4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gIGRyaXZlcnMvY3B1aWRsZS9j
cHVpZGxlLXJpc2N2LXNiaS5jIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKy0tCj4gPiA+ID4g
PiAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+
ID4gPgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2
LXNiaS5jIGIvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMKPiA+ID4gPiA+IGlu
ZGV4IGU4MDk0ZmM5MjQ5MS4uMjk4ZGM3NmEwMGNmIDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvZHJp
dmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMKPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMv
Y3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5jCj4gPiA+ID4gPiBAQCAtMzk0LDYgKzM5NCw3IEBA
IHN0YXRpYyBpbnQgc2JpX2NwdWlkbGVfcGRfcG93ZXJfb2ZmKHN0cnVjdCBnZW5lcmljX3BtX2Rv
bWFpbiAqcGQpCj4gPiA+ID4gPiAgewo+ID4gPiA+ID4gICAgICAgICBzdHJ1Y3QgZ2VucGRfcG93
ZXJfc3RhdGUgKnN0YXRlID0gJnBkLT5zdGF0ZXNbcGQtPnN0YXRlX2lkeF07Cj4gPiA+ID4gPiAg
ICAgICAgIHUzMiAqcGRfc3RhdGU7Cj4gPiA+ID4gPiArICAgICAgIGludCByZXQ7Cj4gPiA+ID4g
Pgo+ID4gPiA+ID4gICAgICAgICBpZiAoIXN0YXRlLT5kYXRhKQo+ID4gPiA+ID4gICAgICAgICAg
ICAgICAgIHJldHVybiAwOwo+ID4gPiA+ID4gQEAgLTQwMSw2ICs0MDIsMTAgQEAgc3RhdGljIGlu
dCBzYmlfY3B1aWRsZV9wZF9wb3dlcl9vZmYoc3RydWN0IGdlbmVyaWNfcG1fZG9tYWluICpwZCkK
PiA+ID4gPiA+ICAgICAgICAgaWYgKCFzYmlfY3B1aWRsZV9wZF9hbGxvd19kb21haW5fc3RhdGUp
Cj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FQlVTWTsKPiA+ID4gPiA+Cj4gPiA+
ID4gPiArICAgICAgIHJldCA9IGNwdV9jbHVzdGVyX3BtX2VudGVyKCk7Cj4gPiA+ID4gPiArICAg
ICAgIGlmIChyZXQpCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ID4g
Pgo+ID4gPiA+IFJhdGhlciB0aGFuIHVzaW5nIHRoZSBDUFUgY2x1c3RlciBub3RpZmllcnMsIGNv
bnN1bWVycyBvZiB0aGUgZ2VucGQKPiA+ID4gPiBjYW4gcmVnaXN0ZXIgdGhlbXNlbHZlcyB0byBy
ZWNlaXZlIGdlbnBkIG9uL29mZiBub3RpZmllcnMuCj4gPiA+ID4KPiA+ID4gPiBJbiBvdGhlciB3
b3Jkcywgbm9uZSBvZiB0aGlzIHNob3VsZCBiZSBuZWVkZWQsIHJpZ2h0Pwo+ID4gPiA+Cj4gPiA+
IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrIQo+ID4gPiBNYXliZSBJIG1pc3Mgc29tZXRoaW5nLCBJ
J20gd29uZGVyaW5nIGFib3V0IGEgY2FzZSBsaWtlIGJlbG93Ogo+ID4gPiBJZiB3ZSBoYXZlIGEg
c2hhcmVkIEwyIGNhY2hlIGNvbnRyb2xsZXIgaW5zaWRlIHRoZSBjcHUgY2x1c3RlciBwb3dlcgo+
ID4gPiBkb21haW4gYW5kIHdlIGFkZCB0aGlzIGNvbnRyb2xsZXIgdG8gYmUgYSBjb25zdW1lciBv
ZiB0aGUgcG93ZXIKPiA+ID4gZG9tYWluLCBTaG91bGRuJ3QgdGhlIGdlbnBkIGludm9rZSB0aGUg
ZG9tYWluIGlkbGUgb25seSBhZnRlciB0aGUKPiA+ID4gc2hhcmVkIEwyIGNhY2hlIGNvbnRyb2xs
ZXIgaXMgc3VzcGVuZGVkPwo+ID4gPiBJcyB0aGVyZSBhIHdheSB0aGF0IHdlIGNhbiBwdXQgdGhl
IEwyIGNhY2hlIGRvd24gd2hpbGUgYWxsIGNwdXMgaW4gdGhlCj4gPiA+IHNhbWUgY2x1c3RlciBh
cmUgaWRsZT8KPiA+ID4gPiBbLi4uXQo+ID4gU29ycnksIEkgbWFkZSBzb21lIG1pc3Rha2UgaW4g
bXkgc2Vjb25kIHF1ZXN0aW9uLgo+ID4gVXBkYXRlIHRoZSBxdWVzdGlvbiBoZXJlOgo+ID4gSXMg
dGhlcmUgYSB3YXkgdGhhdCB3ZSBjYW4gc2F2ZSB0aGUgTDIgY2FjaGUgc3RhdGVzIHdoaWxlIGFs
bCBjcHVzIGluIHRoZQo+ID4gc2FtZSBjbHVzdGVyIGFyZSBpZGxlIGFuZCB0aGUgY2x1c3RlciBj
b3VsZCBiZSBwb3dlcmVkIGRvd24/Cj4KPiBJZiB0aGUgTDIgY2FjaGUgaXMgYSBjb25zdW1lciBv
ZiB0aGUgY2x1c3RlciwgdGhlIGNvbnN1bWVyIGRyaXZlciBmb3IKPiB0aGUgTDIgY2FjaGUgc2hv
dWxkIHJlZ2lzdGVyIGZvciBnZW5wZCBvbi9vZmYgbm90aWZpZXJzLgo+Cj4gVGhlIGRldmljZSBy
ZXByZXNlbnRpbmcgdGhlIEwyIGNhY2hlIG5lZWRzIHRvIGJlIGVuYWJsZWQgZm9yIHJ1bnRpbWUK
PiBQTSwgdG8gYmUgdGFrZW4gaW50byBhY2NvdW50IGNvcnJlY3RseSBieSB0aGUgY2x1c3RlciBn
ZW5wZC4gSW4gdGhpcwo+IGNhc2UsIHRoZSBkZXZpY2Ugc2hvdWxkIG1vc3QgbGlrZWx5IHJlbWFp
biBydW50aW1lIHN1c3BlbmRlZCwgYnV0Cj4gaW5zdGVhZCByZWx5IG9uIHRoZSBnZW5wZCBvbi9v
ZmYgbm90aWZpZXJzIHRvIHVuZGVyc3RhbmQgd2hlbgo+IHNhdmUvcmVzdG9yZSBvZiB0aGUgY2Fj
aGUgc3RhdGVzIHNob3VsZCBiZSBkb25lLgo+Cj4gS2luZCByZWdhcmRzCj4gVWZmZQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
