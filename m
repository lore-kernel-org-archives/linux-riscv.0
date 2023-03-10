Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B661C64EC4
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Mar 2023 15:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QdzraNmFJn3H63Zgewk68K0GBZkXFMFJmTpU0JUUXcA=; b=TErjCQuIZdI26h
	0FB+tP4OINproI8ie5DVpyQDWUvFDcGJJO8nOttABWEeNLTnzhLL4NNf3OP1eTqrIGb4gRdC9/Fu/
	RTpxZP3DZFnfF4HDenuxJjJI3SofsMA39Ma3R7W1yKGkTVVygFSQzox+6kybIYombpUT0k0QmoJSG
	q0VyivdnMhpfb6/bDMIs/+NZ7huTRAj0u6Joa9fE5DXWqymNarkicK6AiQ9JB7JNVFQWMw7xCpyar
	vhZoAx857+BHjG0ntiGmtH2mgTKIN3EDrGEsUjhK5TH594zLeGHmSO4LdRH2yLnSHLol7HfQr7vY7
	pO1bt0pxBTPHu8UYZe6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paemz-00F29T-Kd; Fri, 10 Mar 2023 15:36:13 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paemw-00F28K-Cz
	for linux-riscv@lists.infradead.org; Fri, 10 Mar 2023 15:36:12 +0000
Received: by mail-ed1-x534.google.com with SMTP id ay14so21959500edb.11
        for <linux-riscv@lists.infradead.org>; Fri, 10 Mar 2023 07:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678462568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weKFr6b+Imx1UMFHSantlURMbu8JW3pFLr8NL5fcask=;
        b=JpSp2vXkZoNkXcoWbtVYoNF2LP1Cq/mZ6I62m4FjxEVqw3VJypVVeMlx6sIUH+w6CC
         ESVlq8df2dzwgvb3VaLbBy5kNEele2I5uPjAPX+Ftg4frYbcPZl38Otmsv5xswWr5qEn
         WFtN9Ujzvx7SBTnCisWWozXnwEnKxXEbMBUPDbNOlKwbf0a8bXOKQM6dQShMFxBE7iKG
         oSB7PBS08nsutLnMqrgbJ5iEps8/zAktdZe5F6IrDLPh10fae/p4Ak7jOQhBgaoNPcCe
         Vp8HrcccGV5ldx2sLNIUbZ1b/Ru45bT2OrmwxpiCTrLg2eLRhIuovUfhJR8/emq03W6y
         dZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678462568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weKFr6b+Imx1UMFHSantlURMbu8JW3pFLr8NL5fcask=;
        b=CfdWbBQ85tFURZkG/yJonx1JbCMviDFkhMoUNxU4ON8eJKo30ZiJ5vCXaSR7Sexg0p
         K86tfnKls2C3N/pSwf5KR4hfUleJ2MbD4U9gwMZqsLM2hluDX4k3CVNha3ANw9LzqYP7
         DIvNXPImKq+zpuY1T01c7ew+LLsfVGkr4Y9dZjMs6DrfEGQMDmAK0KMQt+jr5n0dPEeg
         03wjYi0cZ26L0bgUqaWBE1Nn/wvkESNk4dah0X6WzsM7/A5V56YjHhq8Ggz69YF0D2Ei
         efw4HYTa4boPYWOAAPB+IMqI7w+Z62bBBqBCMY6w1Ksye2CHjaZ1fpI9fKTIytj071gN
         T2Fw==
X-Gm-Message-State: AO0yUKVBl5FkjAcNE9eNFgOLt4TquHeq8hos9WtsYZPYHi69WSZl+44B
	4K7E4w5cPfe6BeVAwfNj0ZsgUCoBXKfWoK8Eg8Q=
X-Google-Smtp-Source: AK7set+3VgRTlg3enwJhmwOBXrMHaBkYBeyPLpDf/CCl5+yYhCf6IK0vmJW0eULNzyhX8cIAJuKiEaAw/ElDyYe8s7A=
X-Received: by 2002:a17:907:1045:b0:8b1:30eb:9dba with SMTP id
 oy5-20020a170907104500b008b130eb9dbamr12292626ejb.6.1678462568073; Fri, 10
 Mar 2023 07:36:08 -0800 (PST)
MIME-Version: 1.0
References: <20230308220842.1231003-1-conor@kernel.org> <20230310150754.535425-1-bmeng.cn@gmail.com>
In-Reply-To: <20230310150754.535425-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 10 Mar 2023 23:35:57 +0800
Message-ID: <CAEUhbmWcfcSmuU6VnbTdLoErT113RZPgHSK3c+3M5kU0Wsv1pg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: remove I-extension ISA spec version dance
To: conor@kernel.org
Cc: aurelien@aurel32.net, conor.dooley@microchip.com, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	naresh.kamboju@linaro.org, nathan@kernel.org, ndesaulniers@google.com, 
	palmer@dabbelt.com, palmer@rivosinc.com, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_073610_460154_F3F7F576 
X-CRM114-Status: GOOD (  30.75  )
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

T24gRnJpLCBNYXIgMTAsIDIwMjMgYXQgMTE6MDfigK9QTSBCaW4gTWVuZyA8Ym1lbmcuY25AZ21h
aWwuY29tPiB3cm90ZToKPgo+ID4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWlj
cm9jaGlwLmNvbT4KPiA+Cj4gPiBUaGUgc3BlYyBmb2xrLCBpbiB0aGVpciBpbmZpbml0ZSB3aXNk
b20sIG1vdmVkIGJvdGggY29udHJvbCBhbmQgc3RhdHVzCj4gPiByZWdpc3RlcnMgJiB0aGUgRkVO
Q0UuSSBpbnN0cnVjdGlvbnMgb3V0IG9mIHRoZSBJIGV4dGVuc2lvbiBpbnRvIHRoZWlyCj4gPiBv
d24gZXh0ZW5zaW9ucyAoWmljc3IsIFppZmVuY2VpKSBpbiB0aGUgMjAxOTA2MDggdmVyc2lvbiBv
ZiB0aGUgSVNBCj4gPiBzcGVjIFswXS4KPiA+IFRoZSBHQ0MvYmludXRpbHMgY3JldyBkZWNpZGVk
IFsxXSB0byBtb3ZlIHRoZWlyIGRlZmF1bHQgdmVyc2lvbiBvZiB0aGUKPiA+IElTQSBzcGVjIHRv
IHRoZSAyMDE5MTIxMyB2ZXJzaW9uIG9mIHRoZSBJU0Egc3BlYywgd2hpY2ggY2FtZSBpbnRvIGJl
aW5nCj4gPiBmb3IgdmVyc2lvbiAyLjM4IG9mIGJpbnV0aWxzIGFuZCBHQ0MgMTIuIEJ1aWxkaW5n
IHdpdGggdGhpcyB0b29sY2hhaW4KPiA+IGNvbmZpZ3VyYXRpb24gd291bGQgcmVzdWx0IGluIGFz
c2VtYmxlciBpc3N1ZXM6Cj4gPiAgIENDICAgICAgYXJjaC9yaXNjdi9rZXJuZWwvdmRzby92Z2V0
dGltZW9mZGF5Lm8KPiA+ICAgPDxCVUlMRERJUj4+L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRz
by9nZXR0aW1lb2ZkYXkuaDogQXNzZW1ibGVyIG1lc3NhZ2VzOgo+ID4gICA8PEJVSUxERElSPj4v
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL2dldHRpbWVvZmRheS5oOjcxOiBFcnJvcjogdW5y
ZWNvZ25pemVkIG9wY29kZSBgY3NyciBhNSwweGMwMScKPiA+ICAgPDxCVUlMRERJUj4+L2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vdmRzby9nZXR0aW1lb2ZkYXkuaDo3MTogRXJyb3I6IHVucmVjb2du
aXplZCBvcGNvZGUgYGNzcnIgYTUsMHhjMDEnCj4gPiAgIDw8QlVJTERESVI+Pi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3Zkc28vZ2V0dGltZW9mZGF5Lmg6NzE6IEVycm9yOiB1bnJlY29nbml6ZWQg
b3Bjb2RlIGBjc3JyIGE1LDB4YzAxJwo+ID4gICA8PEJVSUxERElSPj4vYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS92ZHNvL2dldHRpbWVvZmRheS5oOjcxOiBFcnJvcjogdW5yZWNvZ25pemVkIG9wY29k
ZSBgY3NyciBhNSwweGMwMScKPiA+IFRoaXMgd2FzIGZpeGVkIGluIGNvbW1pdCA2ZGYyYTAxNmMw
YzggKCJyaXNjdjogZml4IGJ1aWxkIHdpdGggYmludXRpbHMKPiA+IDIuMzgiKSBieSBBdXJlbGll
biBKYXJubywgYnV0IGhhcyBwcm92ZW4gZnJhZ2lsZS4KPiA+Cj4gPiBCZWZvcmUgTExWTSAxNywg
TExWTSBkaWQgbm90IHN1cHBvcnQgdGhlc2UgZXh0ZW5zaW9ucyBhbmQsIGFzIHN1Y2gsIHRoZQo+
ID4gY2Mtb3B0aW9uIGNoZWNrIGFkZGVkIGJ5IEF1cmVsaWVuIHdvcmtlZC4gU2luY2UgY29tbWl0
IDIyZTE5OWU2YWZiMQo+ID4gKCJbUklTQ1ZdIEFjY2VwdCB6aWNzciBhbmQgemlmZW5jZWkgY29t
bWFuZCBsaW5lIG9wdGlvbnMiKSBob3dldmVyLCBMTFZNCj4gPiAqZG9lcyogc3VwcG9ydCB0aGVt
IGFuZCB0aGUgY2Mtb3B0aW9uIGNoZWNrIHBhc3Nlcy4KPiA+Cj4gPiBUaGlzIHN1cmZhY2VkIGFz
IGEgcHJvYmxlbSB3aGlsZSBidWlsZGluZyB0aGUgNS4xMCBzdGFibGUga2VybmVsIHVzaW5nCj4g
PiB0aGUgZGVmYXVsdCBUdXhtYWtlIERlYmlhbiBpbWFnZSBbMl0sIGFzIDUuMTAgZGlkIG5vdCB5
ZXQgc3VwcG9ydCBsZC5sbGQsCj4gPiBhbmQgdXNlcyB0aGUgRGViaWFuIHByb3ZpZGVkIGJpbnV0
aWxzIDIuMzUuCj4gPiBWZXJzaW9ucyBvZiBsZCBwcmlvciB0byAyLjM4IHdpbGwgcmVmdXNlIHRv
IGxpbmsgaWYgdGhleSBlbmNvdW50ZXIKPiA+IHVua25vd24gSVNBIGV4dGVuc2lvbnMsIGFuZCB1
bmZvcnR1bmF0ZWx5IFppZmVuY2VpIGlzIG5vdCBzdXBwb3J0ZWQgYnkKPiA+IGJpbnR1aWxzIDIu
MzUuCj4gPgo+ID4gSW5zdGVhZCBvZiBkYW5jaW5nIGFyb3VuZCB3aXRoIGFkZGluZyB0aGVzZSBl
eHRlbnNpb25zIHRvIG1hcmNoLCBhcyB3ZQo+ID4gY3VycmVudGx5IGRvLCBQYWxtZXIgc3VnZ2Vz
dGVkIGxvY2tpbmcgR0NDIGJ1aWxkcyB0byB0aGUgc2FtZSB2ZXJzaW9uIG9mCj4gPiB0aGUgSVNB
IHNwZWMgdGhhdCBpcyB1c2VkIGJ5IExMVk0uIEFzIGZhciBhcyBJIGNhbiB0ZWxsLCB0aGF0IGlz
IDIuMiwKPiA+IHdpdGgsIGFwcGFyZW50bHkgWzNdLCBhIGxhY2sgb2YgaW50ZXJlc3QgaW4gaW1w
bGVtZW50aW5nIGEgZmxhZyBsaWtlCj4gPiBHQ0MncyAtbWlzYS1zcGVjIGF0IHByZXNlbnQuCj4g
Pgo+ID4gQWRkIHtjYyxhc30tb3B0aW9uIGNoZWNrcyB0byBhZGQgLW1pc2Etc3BlYyB0byBLQlVJ
TERfe0EsQ31GTEFHUyB3aGVuCj4gPiBHQ0MgaXMgdXNlZCAmIHJlbW92ZSB0aGUgbWFyY2ggZGFu
Y2UuCj4gPgo+ID4gQXMgY2xhbmcgZG9lcyBub3QgYWNjZXB0IHRoaXMgYXJndW1lbnQsIEkgaGFk
IGV4cGVjdGVkIHRvIGVuY291bnRlcgo+ID4gaXNzdWVzIHdpdGggdGhlIGFzc2VtYmxlciwgYXMg
bmVpdGhlciB6aWNzciBub3IgemlmZW5jZWkgYXJlIHByZXNlbnQgaW4KPiA+IHRoZSBJU0Egc3Ry
aW5nIGFuZCB0aGUgc3BlYyB2ZXJzaW9uICpzaG91bGQqIGJlIGRlZmF1bHRpbmcgdG8gYSB2ZXJz
aW9uCj4gPiB0aGF0IHJlcXVpcmVzIHRoZW0gdG8gYmUgcHJlc2VudC4gVGhlIGJ1aWxkIHBhc3Nl
ZCBob3dldmVyIGFuZCB0aGUKPiA+IHJlc3VsdGluZyBrZXJuZWwgd29ya2VkIHBlcmZlY3RseSBm
aW5lIGZvciBtZSBvbiBhIFBvbGFyRmlyZSBTb0MuLi4KPiA+Cj4gPiBMaW5rOiBodHRwczovL3Jp
c2N2Lm9yZy93cC1jb250ZW50L3VwbG9hZHMvMjAxOS8wNi9yaXNjdi1zcGVjLnBkZiBbMF0KPiA+
IExpbms6IGh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vYS9ncm91cHMucmlzY3Yub3JnL2cvc3ct
ZGV2L2MvYUUxWmVISENZZjQgWzFdCj4gPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvQ0ErRzlmWXQ5VD1FTENMYUI5Ynl4YUxXMlFmNHBaY0RPPWh1Q0EwRDh1ZzJWMitpckpRQG1h
aWwuZ21haWwuY29tLyBbMl0KPiA+IExpbms6IGh0dHBzOi8vZGlzY291cnNlLmxsdm0ub3JnL3Qv
c3BlY2lmeWluZy11bnByaXZpbGVkZ2Utc3BlYy12ZXJzaW9uLW1pc2Etc3BlYy1nY2MtZmxhZy1l
cXVpdmFsZW50LzY2OTM1IFszXQo+ID4gQ0M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+IFN1
Z2dlc3RlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gPiBSZXBv
cnRlZC1ieTogTmFyZXNoIEthbWJvanUgPG5hcmVzaC5rYW1ib2p1QGxpbmFyby5vcmc+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+
ID4gLS0tCj4gPiBJIHRoaW5rIEF1cmVsaWVuJ3Mgb3JpZ2luYWwgY29tbWl0IG1lc3NhZ2UgbWln
aHQgYWN0dWFsbHkgbm90IGJlIHF1aXRlCj4gPiBjb3JyZWN0PyBJIGZvdW5kLCBpbiBteSBsaW1p
dGVkIHRlc3RpbmcsIHRoYXQgaXQgaXMgbm90IHRoZSBkZWZhdWx0Cj4gPiBiZWhhdmlvdXIgb2Yg
Z2FzIHRoYXQgbWF0dGVycywgYnV0IHJhdGhlciB0aGUgdG9vbGNoYWluIGl0c2VsZj8KPiA+IE15
IGJpbnV0aWxzIHZlcnNpb25zIChib3RoIHRob3NlIGJ1aWx0IHVzaW5nIHRoZSBjbGFuZy1idWls
dC1saW51eAo+ID4gdGMtYnVpbGQgc2NyaXB0cyB3aGljaCBkbyBub3Qgc2V0IGFuIElTQSBzcGVj
IHZlcnNpb24sIGFuZCBvbmUgYnVpbHQKPiA+IHVzaW5nIHRoZSByaXNjdi1nbnUtdG9vbGNoYWlu
IGluZnJhIHcvIGFuIGV4cGxpY2l0IDIwMTkxMjEzIHNwZWMgdmVyc2lvbgo+ID4gc2V0KSBkbyBu
b3QgZW5jb3VudGVyIHRoZXNlIGlzc3Vlcy4KPgo+IEkgYW0gdW5hYmxlIHRvIHJlcHJvZHVjZSB0
aGUgYnVpbGQgZmFpbHVyZSBhcyByZXBvcnRlZCBieSBjb21taXQgNmRmMmEwMTZjMGM4Cj4gKCJy
aXNjdjogZml4IGJ1aWxkIHdpdGggYmludXRpbHMgMi4zOCIpIGJ5IEF1cmVsaWVuIEphcm5vIHVz
aW5nIGtlcm5lbC5vcmcKPiBwcmUtYnVpbHQgR0NDIDExLjMuMCBbMV0gd2hpY2ggaW5jbHVkZXMg
YmludXRpbHMgMi4zOC4KPgo+IFsxXSBodHRwczovL21pcnJvcnMuZWRnZS5rZXJuZWwub3JnL3B1
Yi90b29scy9jcm9zc3Rvb2wvZmlsZXMvYmluL3g4Nl82NC8xMS4zLjAveDg2XzY0LWdjYy0xMS4z
LjAtbm9saWJjLXg4Nl82NC1saW51eC50YXIueHoKPgo+IFRoZSBkZWZjb25maWcgb2YgdjUuMTYg
a2VybmVsIChjb21taXQgNmRmMmEwMTZjMGM4IGxhbmRzIGluIHY1LjE3KSBidWlsZHMgZmluZQo+
IGZvciBtZS4gQW55dGhpbmcgSSBhbSBtaXNzaW5nPwo+CgpTb21lIGZ1cnRoZXIgbm90ZToKCkFm
dGVyIEkgc3dpdGNoZWQgdG8ga2VybmVsLm9yZyBwcmUtYnVpbHQgR0NDIDEyLjIuMCBbMV0gd2hp
Y2ggaW5jbHVkZXMKYmludXRpbHMgMi4zOSwgSSB3YXMgYWJsZSB0byByZXByb2R1Y2UgdGhlIGV4
YWN0IHNhbWUgYnVpbGQgZmFpbHVyZSBvZgp2NS4xNiBrZXJuZWwgYXMgZGVzY3JpYmVkIGluIHRo
ZSBjb21taXQgNmRmMmEwMTZjMGM4ICgicmlzY3Y6IGZpeApidWlsZCB3aXRoIGJpbnV0aWxzIDIu
MzgiKSBieSBBdXJlbGllbiBKYXJuby4KClRvIHZlcmlmeSB0aGUgY29tbWl0IG1lc3NhZ2Ugb2Yg
NmRmMmEwMTZjMGM4IGlzIGFjY3VyYXRlIG9yIG5vdCwgSQpidWlsdCBhIEdBUyBmcm9tIGJpbnV0
aWxzIDIuMzcgYW5kIHJlcGxhY2VkIHRoZSBHQVMgMi4zOSBpbiB0aGUKa2VybmVsLm9yZyBwYWNr
YWdlLCBzdXJwcmlzaW5nbHkga2VybmVsIHY1LjE2IGRpZCBub3QgYnVpbGQgd2l0aCB0aGUKc2Ft
ZSBidWlsZCBmYWlsdXJlLgoKU28gaXQgc2VlbXMgdGhhdCBpdCdzIEdDQyB0aGF0IGNhdXNlZCB0
aGUgYnVpbGQgZmFpbHVyZSBpbnN0ZWFkIG9mIEdBUwpmcm9tIGJpbnV0aWxzPz8KClsxXSBodHRw
czovL21pcnJvcnMuZWRnZS5rZXJuZWwub3JnL3B1Yi90b29scy9jcm9zc3Rvb2wvZmlsZXMvYmlu
L3g4Nl82NC8xMi4yLjAveDg2XzY0LWdjYy0xMi4yLjAtbm9saWJjLXJpc2N2NjQtbGludXgudGFy
Lnh6CgpSZWdhcmRzLApCaW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
